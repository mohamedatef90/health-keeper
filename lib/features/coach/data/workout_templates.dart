import '../domain/entities/workout_template.dart';

/// Pre-built workout templates (12 templates)
final List<WorkoutTemplate> workoutTemplates = [
  // ============================================================================
  // PUSH / PULL / LEGS SPLIT
  // ============================================================================
  const WorkoutTemplate(
    id: 'push_day',
    name: 'Push Day',
    category: WorkoutCategory.strength,
    difficulty: WorkoutDifficulty.intermediate,
    estimatedMinutes: 50,
    exercises: [
      TemplateExercise(
        exerciseId: 'bench_press',
        exerciseName: 'Barbell Bench Press',
        targetSets: 4,
        targetReps: 8,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'incline_dumbbell_press',
        exerciseName: 'Incline Dumbbell Press',
        targetSets: 3,
        targetReps: 10,
        restSeconds: 60,
      ),
      TemplateExercise(
        exerciseId: 'overhead_press',
        exerciseName: 'Barbell Overhead Press',
        targetSets: 4,
        targetReps: 8,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'lateral_raise',
        exerciseName: 'Lateral Raise',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 45,
      ),
      TemplateExercise(
        exerciseId: 'tricep_pushdown',
        exerciseName: 'Tricep Pushdown',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 45,
      ),
      TemplateExercise(
        exerciseId: 'chest_fly',
        exerciseName: 'Dumbbell Fly',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 45,
      ),
    ],
  ),

  const WorkoutTemplate(
    id: 'pull_day',
    name: 'Pull Day',
    category: WorkoutCategory.strength,
    difficulty: WorkoutDifficulty.intermediate,
    estimatedMinutes: 50,
    exercises: [
      TemplateExercise(
        exerciseId: 'deadlift',
        exerciseName: 'Deadlift',
        targetSets: 4,
        targetReps: 6,
        restSeconds: 120,
      ),
      TemplateExercise(
        exerciseId: 'barbell_row',
        exerciseName: 'Barbell Row',
        targetSets: 4,
        targetReps: 8,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'lat_pulldown',
        exerciseName: 'Lat Pulldown',
        targetSets: 3,
        targetReps: 10,
        restSeconds: 60,
      ),
      TemplateExercise(
        exerciseId: 'face_pulls',
        exerciseName: 'Face Pulls',
        targetSets: 3,
        targetReps: 15,
        restSeconds: 45,
      ),
      TemplateExercise(
        exerciseId: 'barbell_curl',
        exerciseName: 'Barbell Curl',
        targetSets: 3,
        targetReps: 10,
        restSeconds: 60,
      ),
      TemplateExercise(
        exerciseId: 'hammer_curl',
        exerciseName: 'Hammer Curl',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 45,
      ),
    ],
  ),

  const WorkoutTemplate(
    id: 'leg_day',
    name: 'Leg Day',
    category: WorkoutCategory.strength,
    difficulty: WorkoutDifficulty.intermediate,
    estimatedMinutes: 55,
    exercises: [
      TemplateExercise(
        exerciseId: 'barbell_squat',
        exerciseName: 'Barbell Back Squat',
        targetSets: 4,
        targetReps: 8,
        restSeconds: 120,
      ),
      TemplateExercise(
        exerciseId: 'romanian_deadlift',
        exerciseName: 'Romanian Deadlift',
        targetSets: 4,
        targetReps: 10,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'leg_press',
        exerciseName: 'Leg Press',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 60,
      ),
      TemplateExercise(
        exerciseId: 'leg_curl',
        exerciseName: 'Leg Curl',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 45,
      ),
      TemplateExercise(
        exerciseId: 'leg_extension',
        exerciseName: 'Leg Extension',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 45,
      ),
      TemplateExercise(
        exerciseId: 'calf_raise',
        exerciseName: 'Standing Calf Raise',
        targetSets: 4,
        targetReps: 15,
        restSeconds: 45,
      ),
    ],
  ),

  // ============================================================================
  // UPPER / LOWER SPLIT
  // ============================================================================
  const WorkoutTemplate(
    id: 'upper_body',
    name: 'Upper Body',
    category: WorkoutCategory.strength,
    difficulty: WorkoutDifficulty.intermediate,
    estimatedMinutes: 45,
    exercises: [
      TemplateExercise(
        exerciseId: 'bench_press',
        exerciseName: 'Barbell Bench Press',
        targetSets: 4,
        targetReps: 8,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'barbell_row',
        exerciseName: 'Barbell Row',
        targetSets: 4,
        targetReps: 8,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'dumbbell_shoulder_press',
        exerciseName: 'Dumbbell Shoulder Press',
        targetSets: 3,
        targetReps: 10,
        restSeconds: 60,
      ),
      TemplateExercise(
        exerciseId: 'lat_pulldown',
        exerciseName: 'Lat Pulldown',
        targetSets: 3,
        targetReps: 10,
        restSeconds: 60,
      ),
      TemplateExercise(
        exerciseId: 'dumbbell_curl',
        exerciseName: 'Dumbbell Curl',
        targetSets: 2,
        targetReps: 12,
        restSeconds: 45,
      ),
      TemplateExercise(
        exerciseId: 'tricep_pushdown',
        exerciseName: 'Tricep Pushdown',
        targetSets: 2,
        targetReps: 12,
        restSeconds: 45,
      ),
    ],
  ),

  const WorkoutTemplate(
    id: 'lower_body',
    name: 'Lower Body',
    category: WorkoutCategory.strength,
    difficulty: WorkoutDifficulty.intermediate,
    estimatedMinutes: 45,
    exercises: [
      TemplateExercise(
        exerciseId: 'barbell_squat',
        exerciseName: 'Barbell Back Squat',
        targetSets: 4,
        targetReps: 8,
        restSeconds: 120,
      ),
      TemplateExercise(
        exerciseId: 'romanian_deadlift',
        exerciseName: 'Romanian Deadlift',
        targetSets: 3,
        targetReps: 10,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'bulgarian_split_squat',
        exerciseName: 'Bulgarian Split Squat',
        targetSets: 3,
        targetReps: 10,
        restSeconds: 60,
      ),
      TemplateExercise(
        exerciseId: 'leg_curl',
        exerciseName: 'Leg Curl',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 45,
      ),
      TemplateExercise(
        exerciseId: 'calf_raise',
        exerciseName: 'Standing Calf Raise',
        targetSets: 4,
        targetReps: 15,
        restSeconds: 45,
      ),
    ],
  ),

  // ============================================================================
  // FULL BODY
  // ============================================================================
  const WorkoutTemplate(
    id: 'full_body',
    name: 'Full Body Strength',
    category: WorkoutCategory.strength,
    difficulty: WorkoutDifficulty.beginner,
    estimatedMinutes: 50,
    exercises: [
      TemplateExercise(
        exerciseId: 'barbell_squat',
        exerciseName: 'Barbell Back Squat',
        targetSets: 3,
        targetReps: 8,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'bench_press',
        exerciseName: 'Barbell Bench Press',
        targetSets: 3,
        targetReps: 8,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'barbell_row',
        exerciseName: 'Barbell Row',
        targetSets: 3,
        targetReps: 8,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'overhead_press',
        exerciseName: 'Barbell Overhead Press',
        targetSets: 3,
        targetReps: 8,
        restSeconds: 90,
      ),
      TemplateExercise(
        exerciseId: 'romanian_deadlift',
        exerciseName: 'Romanian Deadlift',
        targetSets: 3,
        targetReps: 10,
        restSeconds: 60,
      ),
      TemplateExercise(
        exerciseId: 'plank',
        exerciseName: 'Plank',
        targetSets: 3,
        targetDurationSeconds: 45,
        restSeconds: 30,
      ),
    ],
  ),

  // ============================================================================
  // 5x5 STRENGTH
  // ============================================================================
  const WorkoutTemplate(
    id: 'five_by_five',
    name: '5x5 Strength',
    category: WorkoutCategory.strength,
    difficulty: WorkoutDifficulty.advanced,
    estimatedMinutes: 60,
    exercises: [
      TemplateExercise(
        exerciseId: 'barbell_squat',
        exerciseName: 'Barbell Back Squat',
        targetSets: 5,
        targetReps: 5,
        restSeconds: 180,
        notes: 'Heavy compound movement',
      ),
      TemplateExercise(
        exerciseId: 'bench_press',
        exerciseName: 'Barbell Bench Press',
        targetSets: 5,
        targetReps: 5,
        restSeconds: 180,
        notes: 'Focus on progressive overload',
      ),
      TemplateExercise(
        exerciseId: 'barbell_row',
        exerciseName: 'Barbell Row',
        targetSets: 5,
        targetReps: 5,
        restSeconds: 180,
        notes: 'Strict form',
      ),
    ],
  ),

  // ============================================================================
  // HIIT
  // ============================================================================
  const WorkoutTemplate(
    id: 'hiit',
    name: 'HIIT Blast',
    category: WorkoutCategory.hiit,
    difficulty: WorkoutDifficulty.intermediate,
    estimatedMinutes: 25,
    exercises: [
      TemplateExercise(
        exerciseId: 'burpees',
        exerciseName: 'Burpees',
        targetSets: 4,
        targetDurationSeconds: 30,
        restSeconds: 30,
      ),
      TemplateExercise(
        exerciseId: 'mountain_climbers',
        exerciseName: 'Mountain Climbers',
        targetSets: 4,
        targetDurationSeconds: 30,
        restSeconds: 30,
      ),
      TemplateExercise(
        exerciseId: 'jumping_jacks',
        exerciseName: 'Jumping Jacks',
        targetSets: 4,
        targetDurationSeconds: 30,
        restSeconds: 30,
      ),
      TemplateExercise(
        exerciseId: 'box_jumps',
        exerciseName: 'Box Jumps',
        targetSets: 4,
        targetReps: 10,
        restSeconds: 30,
      ),
      TemplateExercise(
        exerciseId: 'jump_rope',
        exerciseName: 'Jump Rope',
        targetSets: 4,
        targetDurationSeconds: 45,
        restSeconds: 15,
      ),
    ],
  ),

  // ============================================================================
  // CARDIO
  // ============================================================================
  const WorkoutTemplate(
    id: 'cardio',
    name: 'Cardio Endurance',
    category: WorkoutCategory.cardio,
    difficulty: WorkoutDifficulty.beginner,
    estimatedMinutes: 30,
    exercises: [
      TemplateExercise(
        exerciseId: 'treadmill_run',
        exerciseName: 'Treadmill Running',
        targetSets: 1,
        targetDurationSeconds: 600,
        restSeconds: 60,
        notes: 'Moderate pace',
      ),
      TemplateExercise(
        exerciseId: 'stationary_bike',
        exerciseName: 'Stationary Bike',
        targetSets: 1,
        targetDurationSeconds: 600,
        restSeconds: 60,
        notes: 'Steady state',
      ),
      TemplateExercise(
        exerciseId: 'rowing_machine',
        exerciseName: 'Rowing Machine',
        targetSets: 1,
        targetDurationSeconds: 600,
        restSeconds: 0,
        notes: 'Full body cardio',
      ),
    ],
  ),

  // ============================================================================
  // CORE
  // ============================================================================
  const WorkoutTemplate(
    id: 'core',
    name: 'Core Crusher',
    category: WorkoutCategory.strength,
    difficulty: WorkoutDifficulty.intermediate,
    estimatedMinutes: 20,
    exercises: [
      TemplateExercise(
        exerciseId: 'plank',
        exerciseName: 'Plank',
        targetSets: 3,
        targetDurationSeconds: 60,
        restSeconds: 30,
      ),
      TemplateExercise(
        exerciseId: 'bicycle_crunch',
        exerciseName: 'Bicycle Crunch',
        targetSets: 3,
        targetReps: 20,
        restSeconds: 30,
      ),
      TemplateExercise(
        exerciseId: 'russian_twist',
        exerciseName: 'Russian Twist',
        targetSets: 3,
        targetReps: 20,
        restSeconds: 30,
      ),
      TemplateExercise(
        exerciseId: 'leg_raise',
        exerciseName: 'Hanging Leg Raise',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 45,
      ),
      TemplateExercise(
        exerciseId: 'dead_bug',
        exerciseName: 'Dead Bug',
        targetSets: 3,
        targetReps: 10,
        restSeconds: 30,
        notes: 'Per side',
      ),
    ],
  ),

  // ============================================================================
  // FLEXIBILITY
  // ============================================================================
  const WorkoutTemplate(
    id: 'flexibility',
    name: 'Mobility & Stretch',
    category: WorkoutCategory.flexibility,
    difficulty: WorkoutDifficulty.beginner,
    estimatedMinutes: 20,
    exercises: [
      TemplateExercise(
        exerciseId: 'dead_bug',
        exerciseName: 'Dead Bug',
        targetSets: 2,
        targetReps: 10,
        restSeconds: 30,
        notes: 'Core activation',
      ),
      TemplateExercise(
        exerciseId: 'lunges',
        exerciseName: 'Walking Lunges',
        targetSets: 2,
        targetReps: 10,
        restSeconds: 30,
        notes: 'Hip flexor stretch',
      ),
      TemplateExercise(
        exerciseId: 'face_pulls',
        exerciseName: 'Face Pulls',
        targetSets: 2,
        targetReps: 15,
        restSeconds: 30,
        notes: 'Shoulder mobility',
      ),
    ],
  ),

  // ============================================================================
  // QUICK WORKOUT
  // ============================================================================
  const WorkoutTemplate(
    id: 'quick_20',
    name: 'Quick 20-Minute',
    category: WorkoutCategory.strength,
    difficulty: WorkoutDifficulty.beginner,
    estimatedMinutes: 20,
    exercises: [
      TemplateExercise(
        exerciseId: 'goblet_squat',
        exerciseName: 'Goblet Squat',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 45,
      ),
      TemplateExercise(
        exerciseId: 'push_ups',
        exerciseName: 'Push-Ups',
        targetSets: 3,
        targetReps: 12,
        restSeconds: 45,
      ),
      TemplateExercise(
        exerciseId: 'dumbbell_row',
        exerciseName: 'Single-Arm Dumbbell Row',
        targetSets: 3,
        targetReps: 10,
        restSeconds: 45,
        notes: 'Per arm',
      ),
      TemplateExercise(
        exerciseId: 'plank',
        exerciseName: 'Plank',
        targetSets: 3,
        targetDurationSeconds: 30,
        restSeconds: 30,
      ),
    ],
  ),
];
