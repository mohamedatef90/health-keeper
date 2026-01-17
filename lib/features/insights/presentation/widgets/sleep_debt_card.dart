import 'package:flutter/material.dart';

import '../../../../core/domain/entities/health_prediction.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Card displaying sleep debt assessment
class SleepDebtCard extends StatelessWidget {
  final SleepDebtAssessment sleepDebt;
  final VoidCallback? onTap;

  const SleepDebtCard({
    super.key,
    required this.sleepDebt,
    this.onTap,
  });

  Color get _levelColor {
    switch (sleepDebt.level) {
      case SleepDebtLevel.none:
        return AppColors.success;
      case SleepDebtLevel.mild:
        return AppColors.recoveryGood;
      case SleepDebtLevel.moderate:
        return AppColors.warning;
      case SleepDebtLevel.severe:
        return AppColors.accent;
      case SleepDebtLevel.critical:
        return AppColors.error;
      case SleepDebtLevel.unknown:
        return AppColors.textHint;
    }
  }

  String get _levelLabel {
    switch (sleepDebt.level) {
      case SleepDebtLevel.none:
        return 'Well Rested';
      case SleepDebtLevel.mild:
        return 'Mild Debt';
      case SleepDebtLevel.moderate:
        return 'Moderate Debt';
      case SleepDebtLevel.severe:
        return 'Severe Debt';
      case SleepDebtLevel.critical:
        return 'Critical Debt';
      case SleepDebtLevel.unknown:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.bedtime,
                      color: Colors.indigo,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Text(
                    'Sleep Debt',
                    style: AppTypography.titleMedium,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xxs,
                    ),
                    decoration: BoxDecoration(
                      color: _levelColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Text(
                      _levelLabel,
                      style: AppTypography.labelSmall.copyWith(
                        color: _levelColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMetric(
                    'Accumulated',
                    '${sleepDebt.accumulatedDebtHours.toStringAsFixed(1)}h',
                    _levelColor,
                  ),
                  _buildMetric(
                    'Avg Sleep',
                    '${sleepDebt.averageSleepLast7Days.toStringAsFixed(1)}h',
                    sleepDebt.averageSleepLast7Days >= sleepDebt.targetSleepHours
                        ? AppColors.success
                        : AppColors.warning,
                  ),
                  _buildMetric(
                    'Target',
                    '${sleepDebt.targetSleepHours.toStringAsFixed(0)}h',
                    AppColors.textSecondary,
                  ),
                  _buildMetric(
                    'To Recover',
                    '${sleepDebt.daysToRecover}d',
                    AppColors.info,
                  ),
                ],
              ),
              if (sleepDebt.explanation.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  sleepDebt.explanation,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
              if (sleepDebt.recommendations.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                const Divider(),
                const SizedBox(height: AppSpacing.sm),
                ...sleepDebt.recommendations.take(2).map((rec) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.lightbulb_outline,
                            size: 14,
                            color: AppColors.warning,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Expanded(
                            child: Text(
                              rec,
                              style: AppTypography.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value, Color valueColor) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.titleMedium.copyWith(
            color: valueColor,
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.textHint,
          ),
        ),
      ],
    );
  }
}
