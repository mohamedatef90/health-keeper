import 'package:flutter/material.dart';

import '../../../../core/domain/entities/health_prediction.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Card displaying behavior correlation with recovery
class BehaviorCorrelationCard extends StatelessWidget {
  final BehaviorCorrelation correlation;
  final VoidCallback? onTap;

  const BehaviorCorrelationCard({
    super.key,
    required this.correlation,
    this.onTap,
  });

  Color get _impactColor {
    switch (correlation.impactOnRecovery) {
      case BehaviorImpact.stronglyPositive:
        return AppColors.success;
      case BehaviorImpact.positive:
        return AppColors.recoveryGood;
      case BehaviorImpact.neutral:
        return AppColors.textSecondary;
      case BehaviorImpact.negative:
        return AppColors.warning;
      case BehaviorImpact.stronglyNegative:
        return AppColors.error;
    }
  }

  IconData get _impactIcon {
    switch (correlation.impactOnRecovery) {
      case BehaviorImpact.stronglyPositive:
        return Icons.trending_up;
      case BehaviorImpact.positive:
        return Icons.arrow_upward;
      case BehaviorImpact.neutral:
        return Icons.remove;
      case BehaviorImpact.negative:
        return Icons.arrow_downward;
      case BehaviorImpact.stronglyNegative:
        return Icons.trending_down;
    }
  }

  String get _impactLabel {
    final diff = (correlation.averageRecoveryWith - correlation.averageRecoveryWithout).abs();
    final sign = correlation.correlationStrength > 0 ? '+' : '-';
    return '$sign${diff.toStringAsFixed(0)}%';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Row(
            children: [
              // Impact indicator
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: _impactColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _impactIcon,
                      color: _impactColor,
                      size: 18,
                    ),
                    Text(
                      _impactLabel,
                      style: AppTypography.labelSmall.copyWith(
                        fontSize: 9,
                        color: _impactColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              // Behavior info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            correlation.behavior,
                            style: AppTypography.titleSmall,
                          ),
                        ),
                        Text(
                          '${correlation.occurrences}x',
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      correlation.explanation,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    // Correlation strength bar
                    _buildCorrelationBar(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCorrelationBar() {
    final strength = correlation.correlationStrength.abs();
    final isPositive = correlation.correlationStrength > 0;

    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              // Background
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Value bar
              FractionallySizedBox(
                widthFactor: strength.clamp(0.0, 1.0),
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: _impactColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${(strength * 100).toStringAsFixed(0)}%',
              style: AppTypography.labelSmall.copyWith(
                fontSize: 10,
                color: AppColors.textHint,
              ),
            ),
            const SizedBox(width: 2),
            _buildConfidenceDot(),
          ],
        ),
      ],
    );
  }

  Widget _buildConfidenceDot() {
    Color color;
    if (correlation.confidence >= 70) {
      color = AppColors.success;
    } else if (correlation.confidence >= 50) {
      color = AppColors.warning;
    } else {
      color = AppColors.textHint;
    }

    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
