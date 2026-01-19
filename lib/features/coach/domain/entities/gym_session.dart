import 'exercise.dart';

/// Represents an active or completed gym session
class GymSession {
  final String id;
  final String? templateId;
  final String? templateName;
  final DateTime startedAt;
  final DateTime? completedAt;
  final List<SessionExercise> exercises;
  final int? totalVolume;
  final GymSessionStatus status;

  const GymSession({
    required this.id,
    this.templateId,
    this.templateName,
    required this.startedAt,
    this.completedAt,
    required this.exercises,
    this.totalVolume,
    this.status = GymSessionStatus.inProgress,
  });

  bool get isActive => status == GymSessionStatus.inProgress;
  bool get isCompleted => status == GymSessionStatus.completed;
  bool get isPaused => status == GymSessionStatus.paused;

  Duration get duration {
    final endTime = completedAt ?? DateTime.now();
    return endTime.difference(startedAt);
  }

  int get completedSets {
    int count = 0;
    for (final exercise in exercises) {
      count += exercise.sets.where((s) => s.isCompleted).length;
    }
    return count;
  }

  int get totalSets {
    int count = 0;
    for (final exercise in exercises) {
      count += exercise.sets.length;
    }
    return count;
  }

  double get progressPercentage {
    if (totalSets == 0) return 0;
    return completedSets / totalSets;
  }

  GymSession copyWith({
    String? id,
    String? templateId,
    String? templateName,
    DateTime? startedAt,
    DateTime? completedAt,
    List<SessionExercise>? exercises,
    int? totalVolume,
    GymSessionStatus? status,
  }) {
    return GymSession(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      templateName: templateName ?? this.templateName,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      exercises: exercises ?? this.exercises,
      totalVolume: totalVolume ?? this.totalVolume,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'templateId': templateId,
      'templateName': templateName,
      'startedAt': startedAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'exercises': exercises.map((e) => e.toJson()).toList(),
      'totalVolume': totalVolume,
      'status': status.name,
    };
  }

  factory GymSession.fromJson(Map<String, dynamic> json) {
    return GymSession(
      id: json['id'] as String,
      templateId: json['templateId'] as String?,
      templateName: json['templateName'] as String?,
      startedAt: DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => SessionExercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalVolume: json['totalVolume'] as int?,
      status: GymSessionStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => GymSessionStatus.inProgress,
      ),
    );
  }
}

/// Status of a gym session
enum GymSessionStatus {
  inProgress('In Progress'),
  paused('Paused'),
  completed('Completed'),
  cancelled('Cancelled');

  final String displayName;

  const GymSessionStatus(this.displayName);
}

/// Represents an exercise performed during a gym session
class SessionExercise {
  final String exerciseId;
  final String exerciseName;
  final List<ExerciseSet> sets;
  final String? notes;

  const SessionExercise({
    required this.exerciseId,
    required this.exerciseName,
    required this.sets,
    this.notes,
  });

  int get completedSetsCount => sets.where((s) => s.isCompleted).length;

  int get totalVolume {
    int volume = 0;
    for (final set in sets) {
      if (set.isCompleted && set.reps != null && set.weight != null) {
        volume += (set.reps! * set.weight!).toInt();
      }
    }
    return volume;
  }

  SessionExercise copyWith({
    String? exerciseId,
    String? exerciseName,
    List<ExerciseSet>? sets,
    String? notes,
  }) {
    return SessionExercise(
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      sets: sets ?? this.sets,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exerciseId': exerciseId,
      'exerciseName': exerciseName,
      'sets': sets.map((s) => s.toJson()).toList(),
      'notes': notes,
    };
  }

  factory SessionExercise.fromJson(Map<String, dynamic> json) {
    return SessionExercise(
      exerciseId: json['exerciseId'] as String,
      exerciseName: json['exerciseName'] as String,
      sets: (json['sets'] as List<dynamic>)
          .map((s) => ExerciseSet.fromJson(s as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
    );
  }
}
