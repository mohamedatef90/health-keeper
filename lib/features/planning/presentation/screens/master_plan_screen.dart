import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/domain/entities/master_plan.dart';
import '../../../../core/providers/master_plan_provider.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../nutrition/domain/entities/weekly_meal_plan.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../widgets/pending_change_card.dart';

/// Screen displaying the coordinated master plan
class MasterPlanScreen extends ConsumerStatefulWidget {
  const MasterPlanScreen({super.key});

  @override
  ConsumerState<MasterPlanScreen> createState() => _MasterPlanScreenState();
}

class _MasterPlanScreenState extends ConsumerState<MasterPlanScreen> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load the master plan when screen initializes (only once)
    if (!_initialized) {
      _initialized = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref.read(masterPlanNotifierProvider.notifier).loadCurrentWeekPlan();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final masterPlanState = ref.watch(masterPlanNotifierProvider);

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
          'الخطة الرئيسية',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: AppColors.textSecondary),
            onPressed: () => _showHelpDialog(context),
          ),
        ],
      ),
      body: masterPlanState.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.strain),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await ref
                    .read(masterPlanNotifierProvider.notifier)
                    .loadCurrentWeekPlan();
              },
              color: AppColors.strain,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Error message if any
                    if (masterPlanState.error != null)
                      _buildErrorBanner(masterPlanState.error!),

                    // Week header
                    _buildWeekHeader(masterPlanState),

                    // Plans overview
                    _buildPlansOverview(context, masterPlanState),

                    // Coordination status
                    _buildCoordinationStatus(masterPlanState),

                    // Pending changes section
                    _buildPendingChangesSection(context, masterPlanState),

                    // Quick actions
                    _buildQuickActions(context, masterPlanState),

                    const SizedBox(height: AppSpacing.xxl),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildErrorBanner(String error) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.alert.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.alert.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: AppColors.alert, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              error,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.alert,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekHeader(MasterPlanState state) {
    final now = DateTime.now();
    final monday = state.masterPlan?.weekStartDate ??
        now.subtract(Duration(days: now.weekday - 1));
    final sunday = monday.add(const Duration(days: 6));

    final status = state.masterPlan?.status ?? MasterPlanStatus.draft;
    final statusColor = status == MasterPlanStatus.active
        ? AppColors.success
        : status == MasterPlanStatus.pendingChanges
            ? AppColors.warning
            : AppColors.textSecondary;
    final statusLabel = status == MasterPlanStatus.active
        ? 'نشطة'
        : status == MasterPlanStatus.pendingChanges
            ? 'معلقة'
            : 'مسودة';

    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.strain.withValues(alpha: 0.2),
            AppColors.strain.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.strain.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.strain.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: const Icon(
              Icons.calendar_today,
              color: AppColors.strain,
              size: 24,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'هذا الأسبوع',
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${monday.day}/${monday.month} - ${sunday.day}/${sunday.month}',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            child: Text(
              statusLabel,
              style: AppTypography.labelSmall.copyWith(
                color: statusColor,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlansOverview(BuildContext context, MasterPlanState state) {
    final mealPlan = state.mealPlan;
    final workoutPlan = state.workoutPlan;

    final mealSubtitle = mealPlan != null
        ? '${_formatNumber(mealPlan.totalCalories)} سعرة | ${mealPlan.totalProtein}g بروتين'
        : 'لم يتم إنشاء خطة بعد';
    final mealApproved =
        mealPlan?.approvalStatus == PlanApprovalStatus.approved;

    final workoutSubtitle = workoutPlan != null
        ? '${workoutPlan.workoutDaysCount} أيام تمرين | ~${_formatNumber(workoutPlan.totalEstimatedCaloriesBurn)} سعرة حرق'
        : 'لم يتم إنشاء خطة بعد';
    final workoutApproved =
        workoutPlan?.approvalStatus == PlanApprovalStatus.approved;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الخطط المترابطة',
            style: AppTypography.sectionHeader.copyWith(fontFamily: 'Cairo'),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Meal plan card
          _buildPlanCard(
            title: 'خطة الوجبات',
            icon: Icons.restaurant_menu,
            color: AppColors.calories,
            subtitle: mealSubtitle,
            status: mealPlan != null
                ? (mealApproved ? 'موافق عليها' : 'في انتظار الموافقة')
                : 'غير موجودة',
            isApproved: mealApproved,
            hasData: mealPlan != null,
            onTap: () => context.push('/weekly-meal-plan'),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Workout plan card
          _buildPlanCard(
            title: 'خطة التمارين',
            icon: Icons.fitness_center,
            color: AppColors.strain,
            subtitle: workoutSubtitle,
            status: workoutPlan != null
                ? (workoutApproved ? 'موافق عليها' : 'في انتظار الموافقة')
                : 'غير موجودة',
            isApproved: workoutApproved,
            hasData: workoutPlan != null,
            onTap: () {
              // Navigate to workout plan when available
              context.push('/coach');
            },
          ),
        ],
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k'.replaceAll('.0', '');
    }
    return number.toString();
  }

  Widget _buildPlanCard({
    required String title,
    required IconData icon,
    required Color color,
    required String subtitle,
    required String status,
    required bool isApproved,
    required VoidCallback onTap,
    bool hasData = true,
  }) {
    final statusColor = hasData
        ? (isApproved ? AppColors.success : AppColors.warning)
        : AppColors.textTertiary;
    final statusIcon = hasData
        ? (isApproved ? Icons.check_circle : Icons.pending)
        : Icons.add_circle_outline;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.borderDark),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: color.withValues(alpha: hasData ? 0.1 : 0.05),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Icon(
                icon,
                color: hasData ? color : color.withValues(alpha: 0.5),
                size: 28,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall.copyWith(
                      color: hasData
                          ? AppColors.textSecondary
                          : AppColors.textTertiary,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(statusIcon, color: statusColor, size: 20),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  status,
                  style: AppTypography.labelSmall.copyWith(
                    color: statusColor,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
            const SizedBox(width: AppSpacing.sm),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoordinationStatus(MasterPlanState state) {
    final isCoordinated = state.isCoordinated;
    final totalCalories = state.totalPlannedCalories;
    final totalBurn = state.totalEstimatedBurn;
    final netBalance = state.netCalorieBalance;
    final hasPendingChanges = state.pendingChangesCount > 0;

    final statusIcon = isCoordinated
        ? (hasPendingChanges ? Icons.sync_problem : Icons.sync)
        : Icons.sync_disabled;
    final statusColor = isCoordinated
        ? (hasPendingChanges ? AppColors.warning : AppColors.success)
        : AppColors.textTertiary;
    final statusText = isCoordinated
        ? (hasPendingChanges ? 'تحتاج مراجعة' : 'الخطط متناسقة')
        : 'أنشئ الخطط للتنسيق';

    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(statusIcon, color: statusColor, size: 20),
              const SizedBox(width: AppSpacing.sm),
              Text(
                statusText,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          if (isCoordinated) ...[
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCoordinationStat(
                  'السعرات المخططة',
                  _formatNumber(totalCalories),
                  AppColors.calories,
                ),
                _buildCoordinationStat(
                  'الحرق المتوقع',
                  _formatNumber(totalBurn),
                  AppColors.strain,
                ),
                _buildCoordinationStat(
                  'الفائض',
                  '${netBalance >= 0 ? '+' : ''}${_formatNumber(netBalance)}',
                  netBalance >= 0 ? AppColors.success : AppColors.alert,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCoordinationStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.titleMedium.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.textSecondary,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildPendingChangesSection(
      BuildContext context, MasterPlanState state) {
    final pendingChanges = state.pendingChanges;

    if (pendingChanges.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تغييرات معلقة',
              style: AppTypography.sectionHeader.copyWith(fontFamily: 'Cairo'),
            ),
            const SizedBox(height: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: AppColors.success,
                    size: 24,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'لا توجد تغييرات معلقة. الخطط متوافقة!',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'تغييرات معلقة',
                style: AppTypography.sectionHeader.copyWith(fontFamily: 'Cairo'),
              ),
              const SizedBox(width: AppSpacing.sm),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xs,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Text(
                  '${pendingChanges.length}',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.warning,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),

          // Info box
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              border:
                  Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppColors.warning,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'هذه التغييرات مقترحة لتحسين التنسيق بين الخطط',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Pending change cards
          ...pendingChanges.map((change) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: PendingChangeCard(
                  change: change,
                  onApprove: () async {
                    await ref
                        .read(masterPlanNotifierProvider.notifier)
                        .approveChange(change.id);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('تمت الموافقة على: ${change.descriptionAr}'),
                          backgroundColor: AppColors.success,
                        ),
                      );
                    }
                  },
                  onReject: () async {
                    await ref
                        .read(masterPlanNotifierProvider.notifier)
                        .rejectChange(change.id);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('تم رفض: ${change.descriptionAr}'),
                          backgroundColor: AppColors.alert,
                        ),
                      );
                    }
                  },
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context, MasterPlanState state) {
    final hasPendingChanges = state.pendingChangesCount > 0;
    final isCoordinated = state.isCoordinated;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إجراءات سريعة',
            style: AppTypography.sectionHeader.copyWith(fontFamily: 'Cairo'),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  icon: Icons.check_circle_outline,
                  label: 'موافقة على الكل',
                  color: hasPendingChanges
                      ? AppColors.success
                      : AppColors.textTertiary,
                  onTap: hasPendingChanges
                      ? () async {
                          await ref
                              .read(masterPlanNotifierProvider.notifier)
                              .approveAllChanges();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('تمت الموافقة على جميع التغييرات'),
                                backgroundColor: AppColors.success,
                              ),
                            );
                          }
                        }
                      : null,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: _buildActionButton(
                  icon: Icons.refresh,
                  label: 'إعادة التحليل',
                  color:
                      isCoordinated ? AppColors.strain : AppColors.textTertiary,
                  onTap: isCoordinated
                      ? () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('جاري إعادة تحليل الخطط...'),
                              backgroundColor: AppColors.strain,
                            ),
                          );
                          await ref
                              .read(masterPlanNotifierProvider.notifier)
                              .refreshCoordination();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تم التحليل بنجاح'),
                                backgroundColor: AppColors.success,
                              ),
                            );
                          }
                        }
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    VoidCallback? onTap,
  }) {
    final isEnabled = onTap != null;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: isEnabled ? 0.1 : 0.05),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
              color: color.withValues(alpha: isEnabled ? 0.3 : 0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label,
              style: AppTypography.labelMedium.copyWith(
                color: color,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardDark,
        title: const Text(
          'كيف تعمل الخطة الرئيسية؟',
          style: TextStyle(color: AppColors.textPrimary, fontFamily: 'Cairo'),
        ),
        content: const Text(
          'الخطة الرئيسية تنسق بين خطة الوجبات وخطة التمارين.\n\n'
          'عند تغيير أي خطة، يقوم الذكاء الاصطناعي بتحليل التأثير على الخطة الأخرى ويقترح تعديلات للحفاظ على التوازن.\n\n'
          'مثال: إذا أضفت تمريناً شاقاً، سيقترح زيادة السعرات في ذلك اليوم.',
          style: TextStyle(color: AppColors.textSecondary, fontFamily: 'Cairo'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('فهمت'),
          ),
        ],
      ),
    );
  }
}
