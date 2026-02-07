import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../../coach_chat/presentation/widgets/coach_chat_button.dart';
import '../../data/exercise_library.dart';
import '../../data/workout_templates.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_template.dart';
import '../widgets/ai_recommendation_card.dart';
import '../widgets/workout_card.dart';
import '../widgets/quick_start_section.dart';
import 'exercise_detail_screen.dart';

class CoachScreen extends ConsumerStatefulWidget {
  const CoachScreen({super.key});

  @override
  ConsumerState<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends ConsumerState<CoachScreen> {
  WorkoutCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final templates = _selectedCategory == null
        ? workoutTemplates
        : workoutTemplates
            .where((t) => t.category == _selectedCategory)
            .toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: Text(
          'Coach',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            color: AppColors.textSecondary,
            onPressed: () {
              // TODO: Navigate to workout history
            },
            tooltip: 'Workout History',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenPaddingHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.md),

            // AI Recommendation Section
            AiRecommendationCard(
              onStartWorkout: () {
                // TODO: Start the AI-recommended workout
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Starting AI recommended workout...'),
                    backgroundColor: AppColors.strain,
                  ),
                );
              },
            ),
            const SizedBox(height: AppSpacing.xl),

            // Quick Start Section
            const QuickStartSection(),
            const SizedBox(height: AppSpacing.xl),

            // AI Weekly Workout Plan Card
            _buildWeeklyPlanCard(),
            const SizedBox(height: AppSpacing.xl),

            // Browse Workouts Section
            _buildSectionHeader('BROWSE WORKOUTS'),
            const SizedBox(height: AppSpacing.sm),

            // Category Filter Chips
            _buildCategoryFilter(),
            const SizedBox(height: AppSpacing.md),

            // Workout Templates List
            ...templates.map((template) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: WorkoutCard(
                    template: template,
                    onTap: () => _startWorkout(template),
                  ),
                )),
            const SizedBox(height: AppSpacing.xl),

            // Exercise Library Link
            _buildExerciseLibraryButton(),
            const SizedBox(height: AppSpacing.xxl + AppSpacing.bottomNavHeight),
          ],
        ),
      ),
      floatingActionButton: const CoachChatButton(
        contextTag: 'workouts',
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTypography.sectionHeader,
    );
  }

  Widget _buildCategoryFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterChip(null, 'All'),
          const SizedBox(width: AppSpacing.xs),
          ...WorkoutCategory.values.map((category) => Padding(
                padding: const EdgeInsets.only(right: AppSpacing.xs),
                child: _buildFilterChip(category, category.displayName),
              )),
        ],
      ),
    );
  }

  Widget _buildFilterChip(WorkoutCategory? category, String label) {
    final isSelected = _selectedCategory == category;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedCategory = selected ? category : null;
        });
      },
      backgroundColor: AppColors.cardDark,
      selectedColor: AppColors.strain.withOpacity(0.2),
      labelStyle: AppTypography.labelMedium.copyWith(
        color: isSelected ? AppColors.strain : AppColors.textSecondary,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.strain : AppColors.borderDark,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
    );
  }

  Widget _buildWeeklyPlanCard() {
    return InkWell(
      onTap: () => context.go('/agents/weekly-workout-plan'),
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.strain.withOpacity(0.3),
              AppColors.strain.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(color: AppColors.strain.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.strain.withOpacity(0.2),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: const Icon(
                Icons.calendar_month,
                color: AppColors.strain,
                size: 32,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'خطة التمارين الأسبوعية',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.textPrimary,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'AI Weekly Workout Plan',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'تمارين محددة مع مجموعات وتكرارات',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.auto_awesome,
              color: AppColors.strain,
              size: 20,
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseLibraryButton() {
    return InkWell(
      onTap: () => _showExerciseLibrary(),
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(color: AppColors.borderDark),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.strain.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: const Icon(
                Icons.fitness_center,
                color: AppColors.strain,
                size: 24,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Exercise Library',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    '${exerciseLibrary.length}+ exercises by muscle group',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceDark,
        border: Border(
          top: BorderSide(color: AppColors.borderDark, width: 1),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: 2, // Coach tab
        backgroundColor: AppColors.surfaceDark,
        selectedItemColor: AppColors.recovery,
        unselectedItemColor: AppColors.textTertiary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/health/meal-log');
              break;
            case 2:
              break; // Already on coach
            case 3:
              context.go('/recovery');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_outlined),
            activeIcon: Icon(Icons.restaurant),
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_outlined),
            activeIcon: Icon(Icons.fitness_center),
            label: 'Coach',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Recovery',
          ),
        ],
      ),
    );
  }

  void _startWorkout(WorkoutTemplate template) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.bottomSheetRadius),
        ),
      ),
      builder: (context) => _WorkoutPreviewSheet(
        template: template,
        onStart: () {
          Navigator.pop(context);
          // TODO: Navigate to gym session screen
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Starting ${template.name}...'),
              backgroundColor: AppColors.strain,
            ),
          );
        },
      ),
    );
  }

  void _showExerciseLibrary() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.bottomSheetRadius),
        ),
      ),
      builder: (context) => const _ExerciseLibrarySheet(),
    );
  }
}

class _WorkoutPreviewSheet extends StatelessWidget {
  final WorkoutTemplate template;
  final VoidCallback onStart;

  const _WorkoutPreviewSheet({
    required this.template,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.borderDark,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Header
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          template.name,
                          style: AppTypography.titleLarge,
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Row(
                          children: [
                            _buildTag(template.category.displayName, AppColors.strain),
                            const SizedBox(width: AppSpacing.xs),
                            _buildTag(template.difficulty.displayName, AppColors.sleep),
                            const SizedBox(width: AppSpacing.xs),
                            _buildTag('${template.estimatedMinutes} min', AppColors.calories),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              // Exercise List Header
              Text(
                'EXERCISES (${template.exercises.length})',
                style: AppTypography.sectionHeader,
              ),
              const SizedBox(height: AppSpacing.sm),

              // Exercise List
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: template.exercises.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final exercise = template.exercises[index];
                    return Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.cardDark,
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusMd),
                        border: Border.all(color: AppColors.borderDark),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.strain.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(AppSpacing.radiusSm),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: AppTypography.labelMedium.copyWith(
                                  color: AppColors.strain,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exercise.exerciseName,
                                  style: AppTypography.bodyMedium.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  _formatExerciseDetails(exercise),
                                  style: AppTypography.bodySmall.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Start Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onStart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.strain,
                    foregroundColor: AppColors.backgroundDark,
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                  ),
                  child: Text(
                    'Start Workout',
                    style: AppTypography.button.copyWith(
                      color: AppColors.backgroundDark,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTag(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: color,
        ),
      ),
    );
  }

  String _formatExerciseDetails(TemplateExercise exercise) {
    if (exercise.targetReps != null) {
      return '${exercise.targetSets} sets × ${exercise.targetReps} reps';
    } else if (exercise.targetDurationSeconds != null) {
      return '${exercise.targetSets} sets × ${exercise.targetDurationSeconds}s';
    }
    return '${exercise.targetSets} sets';
  }
}

class _ExerciseLibrarySheet extends StatefulWidget {
  const _ExerciseLibrarySheet();

  @override
  State<_ExerciseLibrarySheet> createState() => _ExerciseLibrarySheetState();
}

class _ExerciseLibrarySheetState extends State<_ExerciseLibrarySheet> {
  MuscleGroup? _selectedMuscleGroup;

  @override
  Widget build(BuildContext context) {
    final exercises = _selectedMuscleGroup == null
        ? exerciseLibrary
        : exerciseLibrary
            .where((e) => e.muscleGroup == _selectedMuscleGroup)
            .toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.borderDark,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Header
              Text(
                'Exercise Library',
                style: AppTypography.titleLarge,
              ),
              const SizedBox(height: AppSpacing.sm),

              // Muscle Group Filter
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMuscleChip(null, 'All'),
                    const SizedBox(width: AppSpacing.xs),
                    ...MuscleGroup.values
                        .where((m) => m != MuscleGroup.other)
                        .map((group) => Padding(
                              padding:
                                  const EdgeInsets.only(right: AppSpacing.xs),
                              child: _buildMuscleChip(group, group.displayName),
                            )),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Exercise Count
              Text(
                '${exercises.length} exercises',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Exercise List
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: exercises.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context); // Close the sheet
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExerciseDetailScreen(exercise: exercise),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                      child: Container(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: AppColors.cardDark,
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMd),
                          border: Border.all(color: AppColors.borderDark),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(AppSpacing.sm),
                              decoration: BoxDecoration(
                                color: _getMuscleGroupColor(exercise.muscleGroup)
                                    .withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.circular(AppSpacing.radiusSm),
                              ),
                              child: Icon(
                                Icons.fitness_center,
                                color:
                                    _getMuscleGroupColor(exercise.muscleGroup),
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exercise.name,
                                    style: AppTypography.bodyMedium.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        exercise.muscleGroup.displayName,
                                        style: AppTypography.bodySmall.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      if (exercise.equipment != null) ...[
                                        Text(
                                          ' • ',
                                          style: AppTypography.bodySmall.copyWith(
                                            color: AppColors.textTertiary,
                                          ),
                                        ),
                                        Text(
                                          exercise.equipment!,
                                          style: AppTypography.bodySmall.copyWith(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Video indicator
                          if (exercise.hasVideo)
                            Container(
                              padding: const EdgeInsets.all(AppSpacing.xs),
                              decoration: BoxDecoration(
                                color: AppColors.strain.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                              ),
                              child: const Icon(
                                Icons.play_circle_outline,
                                color: AppColors.strain,
                                size: 18,
                              ),
                            ),
                          const SizedBox(width: AppSpacing.xs),
                          const Icon(
                            Icons.chevron_right,
                            color: AppColors.textTertiary,
                            size: 20,
                          ),
                        ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMuscleChip(MuscleGroup? group, String label) {
    final isSelected = _selectedMuscleGroup == group;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedMuscleGroup = selected ? group : null;
        });
      },
      backgroundColor: AppColors.cardDark,
      selectedColor: AppColors.strain.withOpacity(0.2),
      labelStyle: AppTypography.labelMedium.copyWith(
        color: isSelected ? AppColors.strain : AppColors.textSecondary,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.strain : AppColors.borderDark,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
    );
  }

  Color _getMuscleGroupColor(MuscleGroup group) {
    switch (group) {
      case MuscleGroup.chest:
        return AppColors.strain;
      case MuscleGroup.back:
        return AppColors.recovery;
      case MuscleGroup.shoulders:
        return AppColors.calories;
      case MuscleGroup.arms:
        return AppColors.protein;
      case MuscleGroup.legs:
        return AppColors.sleep;
      case MuscleGroup.core:
        return AppColors.warning;
      case MuscleGroup.fullBody:
        return AppColors.success;
      case MuscleGroup.cardio:
        return AppColors.alert;
      case MuscleGroup.other:
        return AppColors.textSecondary;
    }
  }
}
