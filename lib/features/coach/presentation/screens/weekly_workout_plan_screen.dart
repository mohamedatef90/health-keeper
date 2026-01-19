import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/providers.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../domain/entities/weekly_workout_plan.dart';
import '../../providers/weekly_workout_plan_provider.dart';

/// Screen displaying the AI-generated weekly workout plan with exercises
class WeeklyWorkoutPlanScreen extends ConsumerStatefulWidget {
  const WeeklyWorkoutPlanScreen({super.key});

  @override
  ConsumerState<WeeklyWorkoutPlanScreen> createState() =>
      _WeeklyWorkoutPlanScreenState();
}

class _WeeklyWorkoutPlanScreenState
    extends ConsumerState<WeeklyWorkoutPlanScreen> {
  int _selectedDayIndex = 0;
  bool _initialized = false;
  bool _isGenerating = false;

  @override
  void initState() {
    super.initState();
    // Default to today's day index (0 = Monday)
    final today = DateTime.now();
    _selectedDayIndex = (today.weekday - 1).clamp(0, 6);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref.read(weeklyWorkoutPlanNotifierProvider.notifier).loadCurrentPlan();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final planState = ref.watch(weeklyWorkoutPlanNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'خطة التمارين الأسبوعية',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'Cairo',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.textPrimary),
            onPressed: () => _showRegenerateDialog(context),
          ),
        ],
      ),
      body: planState.when(
        data: (plan) {
          if (plan == null) {
            return _buildEmptyState(context);
          }
          return _buildPlanContent(context, plan);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.strain),
        ),
        error: (error, _) => _buildErrorState(context, error.toString()),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.fitness_center,
              size: 80,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'لا توجد خطة تمارين',
              style: AppTypography.titleLarge.copyWith(
                color: AppColors.textPrimary,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'أنشئ خطة تمارين أسبوعية مخصصة مع تمارين محددة بناءً على أهدافك',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _isGenerating
                ? const CircularProgressIndicator(color: AppColors.strain)
                : ElevatedButton.icon(
                    onPressed: () => _generateNewPlan(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.strain,
                      foregroundColor: AppColors.backgroundDark,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.xl,
                        vertical: AppSpacing.md,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                      ),
                    ),
                    icon: const Icon(Icons.auto_awesome),
                    label: const Text(
                      'إنشاء خطة جديدة',
                      style: TextStyle(
                          fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 80,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'حدث خطأ',
              style: AppTypography.titleLarge.copyWith(
                color: AppColors.textPrimary,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              error,
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            ElevatedButton.icon(
              onPressed: () => ref
                  .read(weeklyWorkoutPlanNotifierProvider.notifier)
                  .refresh(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.strain,
                foregroundColor: AppColors.backgroundDark,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text(
                'إعادة المحاولة',
                style: TextStyle(fontFamily: 'Cairo'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanContent(BuildContext context, WeeklyWorkoutPlan plan) {
    final selectedDay = plan.getDayWorkout(_selectedDayIndex);

    return Column(
      children: [
        // Week overview stats
        _buildWeekStats(plan),

        // Day selector
        _buildDaySelector(plan),

        // Selected day content
        Expanded(
          child: selectedDay == null || selectedDay.isRestDay
              ? _buildRestDayContent(selectedDay)
              : _buildDayWorkoutContent(selectedDay),
        ),

        // Coaching note
        if (plan.coachingNoteAr != null &&
            plan.coachingNoteAr!.isNotEmpty)
          _buildCoachingNote(plan.coachingNoteAr!),
      ],
    );
  }

  Widget _buildWeekStats(WeeklyWorkoutPlan plan) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            '${plan.workoutDaysCount}',
            'أيام تمرين',
            Icons.fitness_center,
            AppColors.strain,
          ),
          _buildStatItem(
            '${plan.totalWorkoutMinutes}',
            'دقيقة',
            Icons.timer,
            AppColors.sleep,
          ),
          _buildStatItem(
            '${plan.totalEstimatedCaloriesBurn}',
            'سعرة',
            Icons.local_fire_department,
            AppColors.calories,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
      String value, String label, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: AppSpacing.xs),
        Text(
          value,
          style: AppTypography.titleMedium.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildDaySelector(WeeklyWorkoutPlan plan) {
    const shortDays = ['إث', 'ثل', 'أر', 'خم', 'جم', 'سب', 'أح'];

    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        itemCount: 7,
        itemBuilder: (context, index) {
          final workout = plan.getDayWorkout(index);
          final isSelected = index == _selectedDayIndex;
          final isRestDay = workout == null || workout.isRestDay;
          final isToday = index == (DateTime.now().weekday - 1);

          return GestureDetector(
            onTap: () => setState(() => _selectedDayIndex = index),
            child: Container(
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
              decoration: BoxDecoration(
                color: isSelected
                    ? (isRestDay ? AppColors.recovery : AppColors.strain)
                    : AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                border: isToday
                    ? Border.all(color: AppColors.accent, width: 2)
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    shortDays[index],
                    style: AppTypography.bodySmall.copyWith(
                      color: isSelected
                          ? AppColors.backgroundDark
                          : AppColors.textSecondary,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Icon(
                    isRestDay ? Icons.bed : Icons.fitness_center,
                    color: isSelected
                        ? AppColors.backgroundDark
                        : (isRestDay
                            ? AppColors.textTertiary
                            : AppColors.strain),
                    size: 20,
                  ),
                  if (!isRestDay && workout != null)
                    Text(
                      '${workout.estimatedMinutes}m',
                      style: AppTypography.bodySmall.copyWith(
                        color: isSelected
                            ? AppColors.backgroundDark
                            : AppColors.textTertiary,
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRestDayContent(AiDailyWorkout? day) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.self_improvement,
              size: 80,
              color: AppColors.recovery,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'يوم راحة',
              style: AppTypography.titleLarge.copyWith(
                color: AppColors.textPrimary,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              day?.descriptionAr ?? 'راحة نشطة أو راحة كاملة للتعافي',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayWorkoutContent(AiDailyWorkout workout) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Workout header
          _buildWorkoutHeader(workout),

          // Warmup section
          if (workout.warmup.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            _buildExerciseSection(
              'الإحماء',
              'Warmup',
              workout.warmup,
              AppColors.recovery,
            ),
          ],

          // Main exercises
          if (workout.exercises.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            _buildExerciseSection(
              'التمارين الرئيسية',
              'Main Exercises',
              workout.exercises,
              AppColors.strain,
            ),
          ],

          // Cooldown section
          if (workout.cooldown.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            _buildExerciseSection(
              'التبريد',
              'Cooldown',
              workout.cooldown,
              AppColors.sleep,
            ),
          ],

          // Notes
          if (workout.notes != null && workout.notes!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            _buildNotesCard(workout.notes!),
          ],

          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _buildWorkoutHeader(AiDailyWorkout workout) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.strain.withOpacity(0.8),
            AppColors.strain.withOpacity(0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _getCategoryIcon(workout.category),
                color: AppColors.backgroundDark,
                size: 32,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workout.workoutNameAr ?? workout.workoutName,
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.backgroundDark,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      workout.workoutName,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.backgroundDark.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeaderStat(
                Icons.timer,
                '${workout.estimatedMinutes} دقيقة',
              ),
              _buildHeaderStat(
                Icons.local_fire_department,
                '${workout.estimatedCaloriesBurn} سعرة',
              ),
              _buildHeaderStat(
                Icons.speed,
                'شدة ${workout.suggestedIntensity}/5',
              ),
            ],
          ),
          if (workout.targetMuscleGroups.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.xs,
              children: workout.targetMuscleGroups
                  .map((mg) => Chip(
                        label: Text(
                          mg,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.backgroundDark,
                            fontSize: 10,
                          ),
                        ),
                        backgroundColor:
                            AppColors.backgroundDark.withOpacity(0.2),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHeaderStat(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.backgroundDark, size: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.backgroundDark,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseSection(
    String titleAr,
    String titleEn,
    List<AiWorkoutExercise> exercises,
    Color accentColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              titleAr,
              style: AppTypography.titleSmall.copyWith(
                color: AppColors.textPrimary,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              '(${exercises.length})',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        ...exercises.asMap().entries.map((entry) {
          final index = entry.key;
          final exercise = entry.value;
          return _buildExerciseCard(exercise, index + 1, accentColor);
        }),
      ],
    );
  }

  Widget _buildExerciseCard(
      AiWorkoutExercise exercise, int number, Color accentColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(
          color: exercise.isSupersetWithNext
              ? AppColors.accent.withOpacity(0.5)
              : Colors.transparent,
          width: exercise.isSupersetWithNext ? 2 : 0,
        ),
      ),
      child: ListTile(
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: AppTypography.bodyMedium.copyWith(
                color: accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(
          exercise.nameAr ?? exercise.name,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.name,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                _buildExerciseChip(exercise.setsRepsDisplay, AppColors.strain),
                const SizedBox(width: AppSpacing.xs),
                _buildExerciseChip(
                    '${exercise.restSeconds}s rest', AppColors.recovery),
                if (exercise.equipment != null) ...[
                  const SizedBox(width: AppSpacing.xs),
                  _buildExerciseChip(exercise.equipment!, AppColors.sleep),
                ],
              ],
            ),
            if (exercise.instructionAr != null) ...[
              const SizedBox(height: 4),
              Text(
                exercise.instructionAr!,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontFamily: 'Cairo',
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
        trailing: exercise.exerciseId != null
            ? IconButton(
                icon: const Icon(Icons.play_circle_outline,
                    color: AppColors.accent),
                onPressed: () {
                  // Navigate to exercise detail with video
                  context.push('/exercise/${exercise.exerciseId}');
                },
              )
            : null,
        isThreeLine: true,
      ),
    );
  }

  Widget _buildExerciseChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: AppTypography.bodySmall.copyWith(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildNotesCard(String notes) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.accent.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline, color: AppColors.accent, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              notes,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontFamily: 'Cairo',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoachingNote(String note) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.strain.withOpacity(0.1),
        border: Border(
          top: BorderSide(color: AppColors.strain.withOpacity(0.3)),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.auto_awesome, color: AppColors.strain, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              note,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontFamily: 'Cairo',
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'strength':
        return Icons.fitness_center;
      case 'cardio':
        return Icons.directions_run;
      case 'hiit':
        return Icons.flash_on;
      case 'flexibility':
      case 'recovery':
        return Icons.self_improvement;
      default:
        return Icons.sports;
    }
  }

  void _showRegenerateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        title: const Text(
          'إعادة إنشاء الخطة؟',
          style: TextStyle(color: AppColors.textPrimary, fontFamily: 'Cairo'),
        ),
        content: const Text(
          'سيتم إنشاء خطة تمارين جديدة. هل تريد المتابعة؟',
          style: TextStyle(color: AppColors.textSecondary, fontFamily: 'Cairo'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'إلغاء',
              style: TextStyle(color: AppColors.textTertiary, fontFamily: 'Cairo'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _generateNewPlan(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.strain,
            ),
            child: const Text(
              'إعادة الإنشاء',
              style: TextStyle(
                color: AppColors.backgroundDark,
                fontFamily: 'Cairo',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _generateNewPlan(BuildContext context) async {
    setState(() => _isGenerating = true);

    try {
      // Get current recovery and strain scores
      final recoveryScore =
          await ref.read(todayRecoveryScoreProvider.future);
      final strainScore = await ref.read(todayStrainScoreProvider.future);

      // Get current week start (Monday)
      final now = DateTime.now();
      final monday = now.subtract(Duration(days: now.weekday - 1));
      final weekStart = DateTime(monday.year, monday.month, monday.day);

      // Generate the plan
      final planContext = GenerateWorkoutPlanContext(
        weekStartDate: weekStart,
        targetWorkoutDays: 4,
        fitnessGoals: ['strength', 'hypertrophy'],
        availableEquipment: ['full_gym'],
        recoveryScore: recoveryScore?.score,
        strainScore: strainScore?.score,
        language: 'ar',
      );

      await ref.read(generateWeeklyWorkoutPlanProvider(planContext).future);

      // Refresh the current plan
      await ref.read(weeklyWorkoutPlanNotifierProvider.notifier).refresh();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'تم إنشاء خطة التمارين بنجاح',
              style: TextStyle(fontFamily: 'Cairo'),
            ),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'فشل إنشاء الخطة: $e',
              style: const TextStyle(fontFamily: 'Cairo'),
            ),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isGenerating = false);
      }
    }
  }
}
