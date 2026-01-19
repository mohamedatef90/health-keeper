import 'package:uuid/uuid.dart';

import '../data/database/database.dart';
import '../domain/entities/streak.dart' as entity;

/// Service for tracking and managing user streaks
/// Tracks consecutive achievements across various health metrics
abstract class StreakService {
  /// Get all streaks for the user
  Future<entity.StreakCollection> getAllStreaks();

  /// Get active streaks only
  Future<List<entity.Streak>> getActiveStreaks();

  /// Get a specific streak by type
  Future<entity.Streak?> getStreakByType(entity.StreakType type);

  /// Check and update all streaks for today
  Future<List<StreakUpdateResult>> checkAndUpdateStreaks({
    required int? recoveryScore,
    required double? strainScore,
    required double? strainTarget,
    required double? sleepHours,
    required double? sleepNeed,
    required bool mealLogged,
    required bool workoutCompleted,
    required bool journalEntryMade,
    required bool weightLogged,
    required int? steps,
    required int? stepGoal,
  });

  /// Increment a specific streak
  Future<entity.Streak> incrementStreak(entity.StreakType type);

  /// Break a specific streak
  Future<entity.Streak> breakStreak(entity.StreakType type);

  /// Reset a specific streak (start fresh)
  Future<entity.Streak> resetStreak(entity.StreakType type);

  /// Get milestone celebrations for recent achievements
  Future<List<entity.StreakMilestone>> getRecentMilestones({int days = 7});

  /// Initialize all streak types for a new user
  Future<void> initializeStreaks();

  /// Get streak statistics summary
  Future<StreakStats> getStreakStats();
}

/// Streak update result
class StreakUpdateResult {
  final entity.StreakType type;
  final bool wasIncremented;
  final bool wasBroken;
  final int newCount;
  final entity.StreakMilestone? milestoneReached;

  const StreakUpdateResult({
    required this.type,
    required this.wasIncremented,
    required this.wasBroken,
    required this.newCount,
    this.milestoneReached,
  });
}

/// Streak statistics
class StreakStats {
  final int totalActiveStreaks;
  final int longestCurrentStreak;
  final entity.StreakType? longestCurrentStreakType;
  final int longestEverStreak;
  final entity.StreakType? longestEverStreakType;
  final int totalMilestonesReached;

  const StreakStats({
    required this.totalActiveStreaks,
    required this.longestCurrentStreak,
    this.longestCurrentStreakType,
    required this.longestEverStreak,
    this.longestEverStreakType,
    required this.totalMilestonesReached,
  });
}

/// Default implementation of StreakService
class StreakServiceImpl implements StreakService {
  final AppDatabase _db;
  final _uuid = const Uuid();

  // Milestone thresholds
  static const _milestoneThresholds = [7, 14, 21, 30, 60, 90, 100, 180, 365];

  StreakServiceImpl(this._db);

  @override
  Future<entity.StreakCollection> getAllStreaks() async {
    final dbStreaks = await _db.getAllStreaks();
    final streaks = dbStreaks.map(_mapDbStreakToEntity).toList();

    return entity.StreakCollection(
      userId: '', // Would come from user profile
      streaks: streaks,
      lastUpdated: DateTime.now(),
    );
  }

  @override
  Future<List<entity.Streak>> getActiveStreaks() async {
    final dbStreaks = await _db.getActiveStreaks();
    return dbStreaks.map(_mapDbStreakToEntity).toList();
  }

  @override
  Future<entity.Streak?> getStreakByType(entity.StreakType type) async {
    final dbStreak = await _db.getStreakByType(type.name);
    return dbStreak != null ? _mapDbStreakToEntity(dbStreak) : null;
  }

  @override
  Future<List<StreakUpdateResult>> checkAndUpdateStreaks({
    required int? recoveryScore,
    required double? strainScore,
    required double? strainTarget,
    required double? sleepHours,
    required double? sleepNeed,
    required bool mealLogged,
    required bool workoutCompleted,
    required bool journalEntryMade,
    required bool weightLogged,
    required int? steps,
    required int? stepGoal,
  }) async {
    final updates = <StreakUpdateResult>[];

    // Check each streak type
    for (final type in entity.StreakType.values) {
      final achieved = _checkStreakAchieved(
        type: type,
        recoveryScore: recoveryScore,
        strainScore: strainScore,
        strainTarget: strainTarget,
        sleepHours: sleepHours,
        sleepNeed: sleepNeed,
        mealLogged: mealLogged,
        workoutCompleted: workoutCompleted,
        journalEntryMade: journalEntryMade,
        weightLogged: weightLogged,
        steps: steps,
        stepGoal: stepGoal,
      );

      if (achieved == null) continue; // Not enough data to evaluate

      final streak = await getStreakByType(type);
      if (streak == null) {
        // Initialize this streak type
        await _createStreak(type);
        if (achieved) {
          final newStreak = await incrementStreak(type);
          updates.add(StreakUpdateResult(
            type: type,
            wasIncremented: true,
            wasBroken: false,
            newCount: newStreak.currentCount,
            milestoneReached: _checkMilestone(type, newStreak.currentCount),
          ));
        }
        continue;
      }

      // Check if already updated today
      if (streak.lastAchievedAt != null &&
          _isSameDay(streak.lastAchievedAt!, DateTime.now())) {
        continue; // Already updated today
      }

      if (achieved) {
        // Check if streak should continue or reset
        final shouldContinue = streak.lastAchievedAt == null ||
            _isYesterday(streak.lastAchievedAt!);

        if (shouldContinue && streak.isActive) {
          final newStreak = await incrementStreak(type);
          updates.add(StreakUpdateResult(
            type: type,
            wasIncremented: true,
            wasBroken: false,
            newCount: newStreak.currentCount,
            milestoneReached: _checkMilestone(type, newStreak.currentCount),
          ));
        } else {
          // Reset and start new streak
          final newStreak = await resetStreak(type);
          updates.add(StreakUpdateResult(
            type: type,
            wasIncremented: true,
            wasBroken: true,
            newCount: newStreak.currentCount,
          ));
        }
      } else if (streak.isActive) {
        // Break the streak
        final brokenStreak = await breakStreak(type);
        updates.add(StreakUpdateResult(
          type: type,
          wasIncremented: false,
          wasBroken: true,
          newCount: brokenStreak.currentCount,
        ));
      }
    }

    return updates;
  }

  bool? _checkStreakAchieved({
    required entity.StreakType type,
    required int? recoveryScore,
    required double? strainScore,
    required double? strainTarget,
    required double? sleepHours,
    required double? sleepNeed,
    required bool mealLogged,
    required bool workoutCompleted,
    required bool journalEntryMade,
    required bool weightLogged,
    required int? steps,
    required int? stepGoal,
  }) {
    switch (type) {
      case entity.StreakType.strainTarget:
        if (strainScore == null || strainTarget == null) return null;
        return strainScore >= strainTarget * 0.9; // Within 90% of target

      case entity.StreakType.optimalSleep:
        if (sleepHours == null || sleepNeed == null) return null;
        return sleepHours >= sleepNeed * 0.9; // Within 90% of need

      case entity.StreakType.highRecovery:
        if (recoveryScore == null) return null;
        return recoveryScore >= 70;

      case entity.StreakType.mealLogging:
        return mealLogged;

      case entity.StreakType.workoutComplete:
        return workoutCompleted;

      case entity.StreakType.journalEntry:
        return journalEntryMade;

      case entity.StreakType.weightLogging:
        return weightLogged;

      case entity.StreakType.stepGoal:
        if (steps == null || stepGoal == null) return null;
        return steps >= stepGoal;
    }
  }

  @override
  Future<entity.Streak> incrementStreak(entity.StreakType type) async {
    final dbStreak = await _db.getStreakByType(type.name);
    if (dbStreak == null) {
      await _createStreak(type);
      final newStreak = await getStreakByType(type);
      return newStreak!.recordSuccess(DateTime.now());
    }

    await _db.incrementStreak(dbStreak.id);
    return (await getStreakByType(type))!;
  }

  @override
  Future<entity.Streak> breakStreak(entity.StreakType type) async {
    final dbStreak = await _db.getStreakByType(type.name);
    if (dbStreak == null) {
      await _createStreak(type);
      return (await getStreakByType(type))!;
    }

    await _db.breakStreak(dbStreak.id);
    return (await getStreakByType(type))!;
  }

  @override
  Future<entity.Streak> resetStreak(entity.StreakType type) async {
    final dbStreak = await _db.getStreakByType(type.name);
    if (dbStreak == null) {
      await _createStreak(type);
      final streak = await incrementStreak(type);
      return streak;
    }

    await _db.resetStreak(dbStreak.id);
    return (await getStreakByType(type))!;
  }

  @override
  Future<List<entity.StreakMilestone>> getRecentMilestones({int days = 7}) async {
    final milestones = <entity.StreakMilestone>[];
    final since = DateTime.now().subtract(Duration(days: days));

    final dbStreaks = await _db.getAllStreaks();
    for (final dbStreak in dbStreaks) {
      final streak = _mapDbStreakToEntity(dbStreak);

      // Check if any milestone was reached recently
      for (final threshold in _milestoneThresholds) {
        if (streak.currentCount >= threshold || streak.longestEver >= threshold) {
          // Check if milestone was reached within the time window
          if (streak.lastAchievedAt != null &&
              streak.lastAchievedAt!.isAfter(since)) {
            // Calculate when milestone was approximately reached
            final daysAgo = streak.currentCount - threshold;
            if (daysAgo >= 0 && daysAgo < days) {
              milestones.add(entity.StreakMilestone.forCount(
                type: streak.type,
                count: threshold,
                achievedAt: streak.lastAchievedAt!.subtract(Duration(days: daysAgo)),
              ));
            }
          }
        }
      }
    }

    return milestones;
  }

  @override
  Future<void> initializeStreaks() async {
    for (final type in entity.StreakType.values) {
      final existing = await _db.getStreakByType(type.name);
      if (existing == null) {
        await _createStreak(type);
      }
    }
  }

  @override
  Future<StreakStats> getStreakStats() async {
    final collection = await getAllStreaks();
    final activeStreaks = collection.activeStreaks;

    entity.Streak? longestCurrent;
    entity.Streak? longestEver;

    for (final streak in collection.streaks) {
      if (longestCurrent == null ||
          streak.currentCount > longestCurrent.currentCount) {
        longestCurrent = streak;
      }
      if (longestEver == null || streak.longestEver > longestEver.longestEver) {
        longestEver = streak;
      }
    }

    // Count total milestones reached
    int totalMilestones = 0;
    for (final streak in collection.streaks) {
      for (final threshold in _milestoneThresholds) {
        if (streak.longestEver >= threshold) {
          totalMilestones++;
        }
      }
    }

    return StreakStats(
      totalActiveStreaks: activeStreaks.length,
      longestCurrentStreak: longestCurrent?.currentCount ?? 0,
      longestCurrentStreakType: longestCurrent?.type,
      longestEverStreak: longestEver?.longestEver ?? 0,
      longestEverStreakType: longestEver?.type,
      totalMilestonesReached: totalMilestones,
    );
  }

  // Private helpers

  Future<void> _createStreak(entity.StreakType type) async {
    final now = DateTime.now();
    await _db.insertStreak(StreaksCompanion.insert(
      id: _uuid.v4(),
      type: type.name,
      createdAt: now,
      updatedAt: now,
    ));
  }

  entity.Streak _mapDbStreakToEntity(Streak dbStreak) {
    final type = entity.StreakType.values.firstWhere(
      (t) => t.name == dbStreak.type,
      orElse: () => entity.StreakType.mealLogging,
    );

    // Calculate milestones
    int? currentMilestone;
    int? nextMilestone;

    for (final m in _milestoneThresholds.reversed) {
      if (dbStreak.currentCount >= m) {
        currentMilestone = m;
        break;
      }
    }

    for (final m in _milestoneThresholds) {
      if (dbStreak.currentCount < m) {
        nextMilestone = m;
        break;
      }
    }

    return entity.Streak(
      id: dbStreak.id,
      type: type,
      currentCount: dbStreak.currentCount,
      longestEver: dbStreak.longestEver,
      startedAt: dbStreak.startedAt,
      lastAchievedAt: dbStreak.lastAchievedAt,
      brokenAt: dbStreak.brokenAt,
      isActive: dbStreak.isActive,
      currentMilestone: currentMilestone,
      nextMilestone: nextMilestone,
      daysToNextMilestone: nextMilestone != null
          ? nextMilestone - dbStreak.currentCount
          : null,
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return _isSameDay(date, yesterday);
  }

  entity.StreakMilestone? _checkMilestone(entity.StreakType type, int count) {
    // Return the highest milestone reached at this exact count
    for (final threshold in _milestoneThresholds.reversed) {
      if (count == threshold) {
        return entity.StreakMilestone.forCount(
          type: type,
          count: threshold,
          achievedAt: DateTime.now(),
        );
      }
    }
    return null;
  }
}
