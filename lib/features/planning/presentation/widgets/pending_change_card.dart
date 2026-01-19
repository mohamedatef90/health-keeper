import 'package:flutter/material.dart';

import '../../../../core/domain/entities/master_plan.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Card displaying a pending plan change with approve/reject actions
class PendingChangeCard extends StatelessWidget {
  final PendingPlanChange change;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const PendingChangeCard({
    super.key,
    required this.change,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with type badge
          Row(
            children: [
              _buildTypeBadge(),
              const Spacer(),
              _buildPriorityIndicator(),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),

          // Description
          Text(
            change.descriptionAr,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: AppSpacing.xs),

          // Trigger info
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: AppColors.textTertiary,
                size: 16,
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  change.triggerAr ?? change.trigger,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ],
          ),

          // Affected day
          if (change.affectedDayName != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: AppColors.textTertiary,
                  size: 16,
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'يوم ${change.affectedDayName}',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ],

          // Proposed change details
          if (change.proposedChanges.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            _buildProposedChanges(),
          ],

          // Actions
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onReject,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.alert,
                    side: const BorderSide(color: AppColors.alert),
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                  ),
                  child: const Text(
                    'رفض',
                    style: TextStyle(fontFamily: 'Cairo'),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: onApprove,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    foregroundColor: AppColors.backgroundDark,
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                  ),
                  child: const Text(
                    'موافقة',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTypeBadge() {
    Color color;
    IconData icon;

    switch (change.type) {
      case PlanChangeType.calorieAdjustment:
        color = AppColors.calories;
        icon = Icons.local_fire_department;
        break;
      case PlanChangeType.proteinAdjustment:
        color = AppColors.protein;
        icon = Icons.egg_alt;
        break;
      case PlanChangeType.intensityAdjustment:
        color = AppColors.strain;
        icon = Icons.speed;
        break;
      case PlanChangeType.restDayAdded:
        color = AppColors.recovery;
        icon = Icons.hotel;
        break;
      case PlanChangeType.restDayRemoved:
        color = AppColors.strain;
        icon = Icons.fitness_center;
        break;
      case PlanChangeType.workoutMoved:
        color = AppColors.warning;
        icon = Icons.swap_horiz;
        break;
      case PlanChangeType.mealTimingAdjusted:
        color = AppColors.sleep;
        icon = Icons.schedule;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: AppSpacing.xxs),
          Text(
            change.type.arabicName,
            style: AppTypography.labelSmall.copyWith(
              color: color,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriorityIndicator() {
    Color color;
    String label;

    switch (change.priority) {
      case 3:
        color = AppColors.alert;
        label = 'مهم';
        break;
      case 2:
        color = AppColors.warning;
        label = 'متوسط';
        break;
      default:
        color = AppColors.textSecondary;
        label = 'عادي';
    }

    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSpacing.xxs),
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(
            color: color,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildProposedChanges() {
    final changes = <Widget>[];

    if (change.proposedChanges.containsKey('newCalories')) {
      final increase = change.proposedChanges['increase'] as int?;
      changes.add(_buildChangeRow(
        label: 'السعرات الجديدة',
        value: '${change.proposedChanges['newCalories']}',
        suffix: increase != null ? '+$increase' : null,
        color: AppColors.calories,
      ));
    }

    if (change.proposedChanges.containsKey('newProtein')) {
      final increase = change.proposedChanges['increase'] as int?;
      changes.add(_buildChangeRow(
        label: 'البروتين الجديد',
        value: '${change.proposedChanges['newProtein']}g',
        suffix: increase != null ? '+${increase}g' : null,
        color: AppColors.protein,
      ));
    }

    if (change.proposedChanges.containsKey('newIntensity')) {
      changes.add(_buildChangeRow(
        label: 'الشدة الجديدة',
        value: '${change.proposedChanges['newIntensity']}/5',
        color: AppColors.strain,
      ));
    }

    if (changes.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Column(
        children: changes,
      ),
    );
  }

  Widget _buildChangeRow({
    required String label,
    required String value,
    String? suffix,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontFamily: 'Cairo',
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (suffix != null) ...[
                const SizedBox(width: AppSpacing.xxs),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xxs,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Text(
                    suffix,
                    style: AppTypography.labelSmall.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
