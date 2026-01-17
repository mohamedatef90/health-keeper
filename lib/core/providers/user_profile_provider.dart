import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database/database.dart';
import 'providers.dart';

/// Provider for the current user profile
///
/// Automatically loads the profile from the database on first access.
final userProfileProvider = FutureProvider<UserProfile?>((ref) async {
  final db = ref.watch(databaseProvider);
  return db.getUserProfile();
});

/// State for user profile editing
class UserProfileState {
  final UserProfile? profile;
  final bool isLoading;
  final bool isSaving;
  final String? error;

  const UserProfileState({
    this.profile,
    this.isLoading = false,
    this.isSaving = false,
    this.error,
  });

  UserProfileState copyWith({
    UserProfile? profile,
    bool? isLoading,
    bool? isSaving,
    String? error,
  }) {
    return UserProfileState(
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      error: error,
    );
  }
}

/// Notifier for user profile operations
class UserProfileNotifier extends StateNotifier<UserProfileState> {
  final AppDatabase _database;

  UserProfileNotifier(this._database) : super(const UserProfileState()) {
    loadProfile();
  }

  /// Load the user profile from database
  Future<void> loadProfile() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final profile = await _database.getUserProfile();
      state = state.copyWith(profile: profile, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to load profile: $e',
        isLoading: false,
      );
    }
  }

  /// Save or update user profile
  Future<bool> saveProfile({
    int? age,
    String? gender,
    double? height,
    // Goals as separate params for convenience
    double? targetWeight,
    double? targetWaist,
    int? targetSteps,
    int? targetCalories,
    int? targetProtein,
    double? targetSleepHours,
    // AI preferences
    String? coachingTone,
    String? language,
  }) async {
    state = state.copyWith(isSaving: true, error: null);

    try {
      final existingProfile = await _database.getUserProfile();
      final now = DateTime.now();

      // Build goals JSON
      final goalsMap = <String, dynamic>{};
      if (existingProfile != null) {
        try {
          goalsMap.addAll(jsonDecode(existingProfile.goalsJson) as Map<String, dynamic>);
        } catch (_) {}
      }
      if (targetWeight != null) goalsMap['targetWeight'] = targetWeight;
      if (targetWaist != null) goalsMap['targetWaist'] = targetWaist;
      if (targetSteps != null) goalsMap['targetSteps'] = targetSteps;
      if (targetCalories != null) goalsMap['targetCalories'] = targetCalories;
      if (targetProtein != null) goalsMap['targetProtein'] = targetProtein;
      if (targetSleepHours != null) goalsMap['targetSleepHours'] = targetSleepHours;

      // Build AI preferences JSON
      final aiPrefsMap = <String, dynamic>{};
      if (existingProfile != null) {
        try {
          aiPrefsMap.addAll(jsonDecode(existingProfile.aiPreferencesJson) as Map<String, dynamic>);
        } catch (_) {}
      }
      if (coachingTone != null) aiPrefsMap['coachingTone'] = coachingTone;
      if (language != null) aiPrefsMap['language'] = language;

      final companion = UserProfilesCompanion(
        id: existingProfile != null
            ? Value(existingProfile.id)
            : Value(DateTime.now().millisecondsSinceEpoch.toString()),
        age: age != null ? Value(age) : const Value.absent(),
        gender: gender != null ? Value(gender) : const Value.absent(),
        height: height != null ? Value(height) : const Value.absent(),
        timezone: existingProfile != null
            ? Value(existingProfile.timezone)
            : Value(DateTime.now().timeZoneName),
        goalsJson: Value(jsonEncode(goalsMap)),
        aiPreferencesJson: Value(jsonEncode(aiPrefsMap)),
        createdAt: existingProfile != null
            ? Value(existingProfile.createdAt)
            : Value(now),
        updatedAt: Value(now),
      );

      if (existingProfile != null) {
        await _database.updateUserProfile(companion);
      } else {
        await _database.insertUserProfile(companion);
      }

      // Reload profile
      final updatedProfile = await _database.getUserProfile();
      state = state.copyWith(profile: updatedProfile, isSaving: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to save profile: $e',
        isSaving: false,
      );
      return false;
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider for user profile notifier
final userProfileNotifierProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
  final database = ref.watch(databaseProvider);
  return UserProfileNotifier(database);
});

/// Helper to get a goal value from profile
T? _getGoal<T>(UserProfile? profile, String key) {
  if (profile == null) return null;
  try {
    final goals = jsonDecode(profile.goalsJson) as Map<String, dynamic>;
    return goals[key] as T?;
  } catch (_) {
    return null;
  }
}

/// Helper to get AI preference value from profile
T? _getAiPref<T>(UserProfile? profile, String key) {
  if (profile == null) return null;
  try {
    final prefs = jsonDecode(profile.aiPreferencesJson) as Map<String, dynamic>;
    return prefs[key] as T?;
  } catch (_) {
    return null;
  }
}

/// Provider for user's daily calorie target
final dailyCalorieTargetProvider = FutureProvider<int>((ref) async {
  final profile = await ref.watch(userProfileProvider.future);
  return (_getGoal<num>(profile, 'targetCalories')?.toInt()) ?? 2000;
});

/// Provider for user's daily protein target
final dailyProteinTargetProvider = FutureProvider<int>((ref) async {
  final profile = await ref.watch(userProfileProvider.future);
  return (_getGoal<num>(profile, 'targetProtein')?.toInt()) ?? 150;
});

/// Provider for user's daily step target
final dailyStepTargetProvider = FutureProvider<int>((ref) async {
  final profile = await ref.watch(userProfileProvider.future);
  return (_getGoal<num>(profile, 'targetSteps')?.toInt()) ?? 8000;
});

/// Provider for user's target sleep hours
final targetSleepHoursProvider = FutureProvider<double>((ref) async {
  final profile = await ref.watch(userProfileProvider.future);
  return (_getGoal<num>(profile, 'targetSleepHours')?.toDouble()) ?? 7.5;
});

/// Provider for user's preferred language
final userLanguageProvider = FutureProvider<String>((ref) async {
  final profile = await ref.watch(userProfileProvider.future);
  return _getAiPref<String>(profile, 'language') ?? 'ar';
});

/// Provider for user's coaching tone preference
final coachingToneProvider = FutureProvider<String>((ref) async {
  final profile = await ref.watch(userProfileProvider.future);
  return _getAiPref<String>(profile, 'coachingTone') ?? 'supportive';
});

/// Provider for user's target weight
final targetWeightProvider = FutureProvider<double?>((ref) async {
  final profile = await ref.watch(userProfileProvider.future);
  return _getGoal<num>(profile, 'targetWeight')?.toDouble();
});

/// Provider for user's target waist
final targetWaistProvider = FutureProvider<double?>((ref) async {
  final profile = await ref.watch(userProfileProvider.future);
  return _getGoal<num>(profile, 'targetWaist')?.toDouble();
});
