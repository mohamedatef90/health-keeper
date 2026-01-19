/// Represents a pre-built workout template
class WorkoutTemplate {
  final String id;
  final String name;
  final WorkoutCategory category;
  final WorkoutDifficulty difficulty;
  final int estimatedMinutes;
  final List<TemplateExercise> exercises;
  final bool isCustom;

  const WorkoutTemplate({
    required this.id,
    required this.name,
    required this.category,
    required this.difficulty,
    required this.estimatedMinutes,
    required this.exercises,
    this.isCustom = false,
  });

  WorkoutTemplate copyWith({
    String? id,
    String? name,
    WorkoutCategory? category,
    WorkoutDifficulty? difficulty,
    int? estimatedMinutes,
    List<TemplateExercise>? exercises,
    bool? isCustom,
  }) {
    return WorkoutTemplate(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      exercises: exercises ?? this.exercises,
      isCustom: isCustom ?? this.isCustom,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category.name,
      'difficulty': difficulty.name,
      'estimatedMinutes': estimatedMinutes,
      'exercises': exercises.map((e) => e.toJson()).toList(),
      'isCustom': isCustom,
    };
  }

  factory WorkoutTemplate.fromJson(Map<String, dynamic> json) {
    return WorkoutTemplate(
      id: json['id'] as String,
      name: json['name'] as String,
      category: WorkoutCategory.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => WorkoutCategory.strength,
      ),
      difficulty: WorkoutDifficulty.values.firstWhere(
        (e) => e.name == json['difficulty'],
        orElse: () => WorkoutDifficulty.intermediate,
      ),
      estimatedMinutes: json['estimatedMinutes'] as int,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => TemplateExercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCustom: json['isCustom'] as bool? ?? false,
    );
  }
}

/// Categories for workout templates
enum WorkoutCategory {
  strength('Strength', 'strength'),
  cardio('Cardio', 'cardio'),
  hiit('HIIT', 'hiit'),
  flexibility('Flexibility', 'flexibility'),
  sport('Sport', 'sport');

  final String displayName;
  final String value;

  const WorkoutCategory(this.displayName, this.value);
}

/// Difficulty levels for workouts
enum WorkoutDifficulty {
  beginner('Beginner', 'beginner'),
  intermediate('Intermediate', 'intermediate'),
  advanced('Advanced', 'advanced');

  final String displayName;
  final String value;

  const WorkoutDifficulty(this.displayName, this.value);
}

/// Represents an exercise within a workout template
class TemplateExercise {
  final String exerciseId;
  final String exerciseName;
  final int targetSets;
  final int? targetReps;
  final int? targetDurationSeconds;
  final int restSeconds;
  final String? notes;

  const TemplateExercise({
    required this.exerciseId,
    required this.exerciseName,
    required this.targetSets,
    this.targetReps,
    this.targetDurationSeconds,
    this.restSeconds = 60,
    this.notes,
  });

  TemplateExercise copyWith({
    String? exerciseId,
    String? exerciseName,
    int? targetSets,
    int? targetReps,
    int? targetDurationSeconds,
    int? restSeconds,
    String? notes,
  }) {
    return TemplateExercise(
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      targetSets: targetSets ?? this.targetSets,
      targetReps: targetReps ?? this.targetReps,
      targetDurationSeconds: targetDurationSeconds ?? this.targetDurationSeconds,
      restSeconds: restSeconds ?? this.restSeconds,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exerciseId': exerciseId,
      'exerciseName': exerciseName,
      'targetSets': targetSets,
      'targetReps': targetReps,
      'targetDurationSeconds': targetDurationSeconds,
      'restSeconds': restSeconds,
      'notes': notes,
    };
  }

  factory TemplateExercise.fromJson(Map<String, dynamic> json) {
    return TemplateExercise(
      exerciseId: json['exerciseId'] as String,
      exerciseName: json['exerciseName'] as String,
      targetSets: json['targetSets'] as int,
      targetReps: json['targetReps'] as int?,
      targetDurationSeconds: json['targetDurationSeconds'] as int?,
      restSeconds: json['restSeconds'] as int? ?? 60,
      notes: json['notes'] as String?,
    );
  }
}
