import 'package:flutter/material.dart';

import '../../../../core/domain/entities/health_prediction.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Card displaying overall health summary with score ring
class HealthSummaryCard extends StatelessWidget {
  final HealthPrediction prediction;
  final VoidCallback? onTap;

  const HealthSummaryCard({
    super.key,
    required this.prediction,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(prediction.overallStatus);

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Health score ring
                  _HealthScoreRing(
                    score: prediction.overallScore,
                    status: prediction.overallStatus,
                    size: 100,
                  ),
                  const SizedBox(width: AppSpacing.lg),

                  // Summary text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getStatusTitle(prediction.overallStatus),
                          style: AppTypography.titleLarge.copyWith(
                            color: statusColor,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          prediction.summary,
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        _buildConfidenceIndicator(prediction.confidence),
                      ],
                    ),
                  ),
                ],
              ),

              // Positive indicators
              if (prediction.positiveIndicators.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                const Divider(),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: prediction.positiveIndicators.map((indicator) =>
                      _PositiveIndicatorChip(indicator: indicator)).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfidenceIndicator(int confidence) {
    Color color;
    String label;
    if (confidence >= 80) {
      color = AppColors.success;
      label = 'High confidence';
    } else if (confidence >= 60) {
      color = AppColors.warning;
      label = 'Moderate confidence';
    } else {
      color = AppColors.textHint;
      label = 'Low confidence';
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
        const SizedBox(width: AppSpacing.xs),
        Text(
          '$label ($confidence%)',
          style: AppTypography.labelSmall.copyWith(color: color),
        ),
      ],
    );
  }

  Color _getStatusColor(HealthStatus status) {
    switch (status) {
      case HealthStatus.excellent:
        return AppColors.recoveryExcellent;
      case HealthStatus.good:
        return AppColors.recoveryGood;
      case HealthStatus.moderate:
        return AppColors.recoveryModerate;
      case HealthStatus.attentionNeeded:
        return AppColors.recoveryLow;
      case HealthStatus.unknown:
        return AppColors.textHint;
    }
  }

  String _getStatusTitle(HealthStatus status) {
    switch (status) {
      case HealthStatus.excellent:
        return 'Excellent Health';
      case HealthStatus.good:
        return 'Good Health';
      case HealthStatus.moderate:
        return 'Moderate Health';
      case HealthStatus.attentionNeeded:
        return 'Needs Attention';
      case HealthStatus.unknown:
        return 'Analyzing...';
    }
  }
}

/// Health score ring visualization
class _HealthScoreRing extends StatelessWidget {
  final int score;
  final HealthStatus status;
  final double size;

  const _HealthScoreRing({
    required this.score,
    required this.status,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor(status);
    final percentage = score / 100;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 8,
              backgroundColor: AppColors.divider,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.divider),
            ),
          ),
          // Progress circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: 8,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          // Center content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score.toString(),
                style: AppTypography.scoreDisplay.copyWith(
                  color: color,
                  fontSize: size * 0.35,
                ),
              ),
              Text(
                'Health',
                style: AppTypography.labelSmall.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(HealthStatus status) {
    switch (status) {
      case HealthStatus.excellent:
        return AppColors.recoveryExcellent;
      case HealthStatus.good:
        return AppColors.recoveryGood;
      case HealthStatus.moderate:
        return AppColors.recoveryModerate;
      case HealthStatus.attentionNeeded:
        return AppColors.recoveryLow;
      case HealthStatus.unknown:
        return AppColors.textHint;
    }
  }
}

/// Positive indicator chip
class _PositiveIndicatorChip extends StatelessWidget {
  final String indicator;

  const _PositiveIndicatorChip({required this.indicator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.success.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            size: 14,
            color: AppColors.success,
          ),
          const SizedBox(width: AppSpacing.xxs),
          Text(
            indicator,
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.success,
            ),
          ),
        ],
      ),
    );
  }
}
