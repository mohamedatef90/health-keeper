import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../domain/entities/meal_suggestion.dart';
import '../../domain/entities/weekly_meal_plan.dart';
import '../../providers/weekly_meal_plan_provider.dart';

/// Screen displaying the AI-generated weekly meal plan
class WeeklyMealPlanScreen extends ConsumerStatefulWidget {
  const WeeklyMealPlanScreen({super.key});

  @override
  ConsumerState<WeeklyMealPlanScreen> createState() =>
      _WeeklyMealPlanScreenState();
}

class _WeeklyMealPlanScreenState extends ConsumerState<WeeklyMealPlanScreen> {
  int _selectedDayIndex = 0;
  bool _initialized = false;

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
          ref.read(weeklyMealPlanNotifierProvider.notifier).loadCurrentPlan();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final planState = ref.watch(weeklyMealPlanNotifierProvider);

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
          'خطة الوجبات الأسبوعية',
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
              Icons.restaurant_menu,
              size: 80,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'لا توجد خطة وجبات',
              style: AppTypography.titleLarge.copyWith(
                color: AppColors.textPrimary,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'أنشئ خطة وجبات أسبوعية مخصصة بناءً على أهدافك وبيانات صحتك',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            ElevatedButton.icon(
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
                style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
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
              size: 64,
              color: AppColors.alert,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'حدث خطأ',
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.textPrimary,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              error,
              textAlign: TextAlign.center,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            TextButton(
              onPressed: () =>
                  ref.read(weeklyMealPlanNotifierProvider.notifier).refresh(),
              child: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanContent(BuildContext context, WeeklyMealPlan plan) {
    final selectedDay = plan.getDayPlan(_selectedDayIndex);

    return Column(
      children: [
        // Weekly summary card
        _buildWeeklySummaryCard(plan),

        // Day selector tabs
        _buildDaySelector(plan),

        // Selected day content
        Expanded(
          child: selectedDay != null
              ? _buildDayContent(selectedDay, _selectedDayIndex, plan)
              : _buildNoPlanForDay(),
        ),

        // Approval buttons
        if (plan.approvalStatus == PlanApprovalStatus.pending)
          _buildApprovalButtons(plan),
      ],
    );
  }

  Widget _buildWeeklySummaryCard(WeeklyMealPlan plan) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSummaryItem(
                '${plan.totalCalories}',
                'سعرة',
                AppColors.calories,
              ),
              _buildSummaryItem(
                '${plan.totalProtein}g',
                'بروتين',
                AppColors.protein,
              ),
              _buildSummaryItem(
                '${plan.plannedDaysCount}',
                'أيام',
                AppColors.strain,
              ),
            ],
          ),
          if (plan.coachingNote != null && plan.coachingNote!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.strain.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.tips_and_updates,
                    color: AppColors.strain,
                    size: 20,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      plan.coachingNote!,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textPrimary,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.titleLarge.copyWith(
            color: color,
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

  Widget _buildDaySelector(WeeklyMealPlan plan) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final isSelected = index == _selectedDayIndex;
          final dayPlan = plan.getDayPlan(index);
          final isWorkoutDay = plan.isWorkoutDay(index);
          final date = plan.getDateForDay(index);

          return GestureDetector(
            onTap: () => setState(() => _selectedDayIndex = index),
            child: Container(
              width: 50,
              margin: const EdgeInsets.only(right: AppSpacing.xs),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.strain
                    : dayPlan != null
                        ? AppColors.cardDark
                        : AppColors.backgroundDark,
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                border: Border.all(
                  color: isSelected ? AppColors.strain : AppColors.borderDark,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    WeeklyMealPlan.getDayName(index, arabic: true).substring(0, 2),
                    style: AppTypography.labelSmall.copyWith(
                      color: isSelected
                          ? AppColors.backgroundDark
                          : AppColors.textSecondary,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  Text(
                    '${date.day}',
                    style: AppTypography.titleMedium.copyWith(
                      color: isSelected
                          ? AppColors.backgroundDark
                          : dayPlan != null
                              ? AppColors.textPrimary
                              : AppColors.textTertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isWorkoutDay)
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.calories,
                        shape: BoxShape.circle,
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

  Widget _buildDayContent(
      DailyMealPlan dayPlan, int dayIndex, WeeklyMealPlan weekPlan) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day header
          Row(
            children: [
              Text(
                WeeklyMealPlan.getDayName(dayIndex, arabic: true),
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (weekPlan.isWorkoutDay(dayIndex)) ...[
                const SizedBox(width: AppSpacing.sm),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.calories.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                  child: Text(
                    'يوم تمرين',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.calories,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ],
              const Spacer(),
              Text(
                '${dayPlan.totalCalories} سعرة',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.calories,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Meals
          if (dayPlan.breakfast != null)
            _buildMealCard(dayPlan.breakfast!, 'الفطور', Icons.wb_sunny),
          if (dayPlan.lunch != null)
            _buildMealCard(dayPlan.lunch!, 'الغداء', Icons.restaurant),
          if (dayPlan.dinner != null)
            _buildMealCard(dayPlan.dinner!, 'العشاء', Icons.nightlight),
          if (dayPlan.snacks.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              'وجبات خفيفة',
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textSecondary,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            ...dayPlan.snacks
                .map((snack) => _buildMealCard(snack, 'وجبة خفيفة', Icons.apple)),
          ],

          // Daily totals
          const SizedBox(height: AppSpacing.lg),
          _buildDailyTotals(dayPlan),
        ],
      ),
    );
  }

  Widget _buildMealCard(MealSuggestion meal, String mealType, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.xs),
                decoration: BoxDecoration(
                  color: AppColors.strain.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Icon(icon, size: 20, color: AppColors.strain),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                mealType,
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.textSecondary,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            meal.name,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
          if (meal.servingSize != null) ...[
            const SizedBox(height: AppSpacing.xxs),
            Text(
              meal.servingSize!,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textTertiary,
                fontFamily: 'Cairo',
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              _buildNutrientChip('${meal.calories}', 'سعرة', AppColors.calories),
              const SizedBox(width: AppSpacing.sm),
              _buildNutrientChip('${meal.protein}g', 'بروتين', AppColors.protein),
              const SizedBox(width: AppSpacing.sm),
              _buildNutrientChip('${meal.carbs}g', 'كارب', AppColors.carbs),
              const SizedBox(width: AppSpacing.sm),
              _buildNutrientChip('${meal.fat}g', 'دهون', AppColors.fat),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientChip(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Text(
        '$value $label',
        style: AppTypography.labelSmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDailyTotals(DailyMealPlan dayPlan) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTotalItem('السعرات', '${dayPlan.totalCalories}',
              '${dayPlan.targetCalories}', AppColors.calories),
          _buildTotalItem('البروتين', '${dayPlan.totalProtein}g',
              '${dayPlan.targetProtein}g', AppColors.protein),
        ],
      ),
    );
  }

  Widget _buildTotalItem(
      String label, String value, String target, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.textSecondary,
            fontFamily: 'Cairo',
          ),
        ),
        Text(
          value,
          style: AppTypography.titleMedium.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'الهدف: $target',
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.textTertiary,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildNoPlanForDay() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.no_meals,
            size: 64,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'لا توجد وجبات لهذا اليوم',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApprovalButtons(WeeklyMealPlan plan) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: const BoxDecoration(
          color: AppColors.cardDark,
          border: Border(
            top: BorderSide(color: AppColors.borderDark),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  ref
                      .read(weeklyMealPlanNotifierProvider.notifier)
                      .rejectPlan(plan.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم رفض الخطة'),
                      backgroundColor: AppColors.alert,
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.alert,
                  side: const BorderSide(color: AppColors.alert),
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                ),
                child: const Text(
                  'رفض',
                  style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(weeklyMealPlanNotifierProvider.notifier)
                      .approvePlan(plan.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم الموافقة على الخطة'),
                      backgroundColor: AppColors.success,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: AppColors.backgroundDark,
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                ),
                child: const Text(
                  'موافقة على الخطة',
                  style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRegenerateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardDark,
        title: const Text(
          'إعادة إنشاء الخطة؟',
          style: TextStyle(color: AppColors.textPrimary, fontFamily: 'Cairo'),
        ),
        content: const Text(
          'سيتم حذف الخطة الحالية وإنشاء خطة جديدة.',
          style: TextStyle(color: AppColors.textSecondary, fontFamily: 'Cairo'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _generateNewPlan(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.strain,
            ),
            child: const Text('إعادة إنشاء'),
          ),
        ],
      ),
    );
  }

  void _generateNewPlan(BuildContext context) {
    // Get current week start (Monday)
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final weekStart = DateTime(monday.year, monday.month, monday.day);

    // Create context with default values
    // In a real app, these would come from user settings
    final planContext = WeeklyMealPlanContext(
      weekStartDate: weekStart,
      dailyCalorieTarget: 2000,
      dailyProteinTarget: 120,
      workoutDays: [0, 2, 4], // Mon, Wed, Fri
      preferEgyptian: true,
      language: 'ar',
    );

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        backgroundColor: AppColors.cardDark,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: AppColors.strain),
            SizedBox(height: AppSpacing.md),
            Text(
              'جاري إنشاء خطة الوجبات...',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
      ),
    );

    // Generate plan
    ref.read(generateWeeklyMealPlanProvider(planContext).future).then((plan) {
      Navigator.pop(context); // Close loading dialog
      ref.read(weeklyMealPlanNotifierProvider.notifier).refresh();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إنشاء خطة الوجبات بنجاح'),
          backgroundColor: AppColors.success,
        ),
      );
    }).catchError((error) {
      Navigator.pop(context); // Close loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل إنشاء الخطة: $error'),
          backgroundColor: AppColors.alert,
        ),
      );
    });
  }
}
