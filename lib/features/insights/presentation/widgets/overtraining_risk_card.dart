import 'package:flutter/material.dart';

import '../../../../core/domain/entities/health_prediction.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Card displaying overtraining risk assessment
class OvertrainingRiskCard extends StatelessWidget {
  final OvertrainingRisk overtrainingRisk;
  final VoidCallback? onTap;

  const OvertrainingRiskCard({
    super.key,
    required this.overtrainingRisk,
    this.onTap,
  });

  Color get _riskColor {
    switch (overtrainingRisk.riskLevel) {
      case OvertrainingLevel.optimal:
        return AppColors.success;
      case OvertrainingLevel.adequate:
        return AppColors.recoveryGood;
      case OvertrainingLevel.elevated:
        return AppColors.warning;
      case OvertrainingLevel.high:
        return AppColors.accent;
      case OvertrainingLevel.critical:
        return AppColors.error;
      case OvertrainingLevel.unknown:
        return AppColors.textHint;
    }
  }

  IconData get _riskIcon {
    switch (overtrainingRisk.riskLevel) {
      case OvertrainingLevel.optimal:
        return Icons.fitness_center;
      case OvertrainingLevel.adequate:
        return Icons.check_circle_outline;
      case OvertrainingLevel.elevated:
        return Icons.trending_up;
      case OvertrainingLevel.high:
        return Icons.warning_amber_outlined;
      case OvertrainingLevel.critical:
        return Icons.error_outline;
      case OvertrainingLevel.unknown:
        return Icons.help_outline;
    }
  }

  String get _riskLabel {
    switch (overtrainingRisk.riskLevel) {
      case OvertrainingLevel.optimal:
        return 'Optimal';
      case OvertrainingLevel.adequate:
        return 'Adequate';
      case OvertrainingLevel.elevated:
        return 'Elevated';
      case OvertrainingLevel.high:
        return 'High';
      case OvertrainingLevel.critical:
        return 'Critical';
      case OvertrainingLevel.unknown:
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
                      color: _riskColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _riskIcon,
                      color: _riskColor,
                      size: 20,
                    ),
                  ),
                  const Spacer(),
                  if (overtrainingRisk.daysToRecovery > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.xs,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.info.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
                      ),
                      child: Text(
                        '${overtrainingRisk.daysToRecovery}d',
                        style: AppTypography.labelSmall.copyWith(
                          fontSize: 9,
                          color: AppColors.info,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Training Load',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${overtrainingRisk.riskScore}%',
                    style: AppTypography.headlineMedium.copyWith(
                      color: _riskColor,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      _riskLabel,
                      style: AppTypography.labelSmall.copyWith(
                        color: _riskColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              // Strain/Recovery balance indicator
              Row(
                children: [
                  Expanded(
                    child: _buildBalanceIndicator(),
                  ),
                ],
              ),
              if (onTap != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Details',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Icon(
                      Icons.chevron_right,
                      size: 14,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceIndicator() {
    final balance = overtrainingRisk.strainRecoveryBalance;
    final isBalanced = balance >= 0.8 && balance <= 1.2;
    final color = isBalanced ? AppColors.success : AppColors.warning;

    return Row(
      children: [
        Icon(
          isBalanced ? Icons.balance : Icons.trending_down,
          size: 12,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          'Balance: ${balance.toStringAsFixed(2)}',
          style: AppTypography.labelSmall.copyWith(
            fontSize: 10,
            color: color,
          ),
        ),
      ],
    );
  }
}
