import 'package:flutter/material.dart';

import '../../../../core/services/health_prediction_service.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Card displaying pattern insights and correlations
class PatternInsightsCard extends StatelessWidget {
  final TrendAnalysis trends;
  final VoidCallback? onSeeAll;

  const PatternInsightsCard({
    super.key,
    required this.trends,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPaddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with confidence indicator
            Row(
              children: [
                Icon(Icons.insights, color: AppColors.primary, size: 20),
                const SizedBox(width: AppSpacing.sm),
                Text('Pattern Analysis', style: AppTypography.titleSmall),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: _getConfidenceColor(trends.analysisConfidence)
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Text(
                    '${trends.analysisConfidence}% confidence',
                    style: AppTypography.labelSmall.copyWith(
                      color: _getConfidenceColor(trends.analysisConfidence),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Key insights
            if (trends.keyInsights.isNotEmpty) ...[
              ...trends.keyInsights.take(3).map((insight) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          size: 16,
                          color: AppColors.warning,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            insight,
                            style: AppTypography.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],

            // Top correlation preview
            if (trends.correlations.isNotEmpty) ...[
              const Divider(),
              const SizedBox(height: AppSpacing.sm),
              _buildCorrelationPreview(trends.correlations.first),
            ],

            // Weekly pattern preview
            if (trends.weeklyPattern != null) ...[
              const SizedBox(height: AppSpacing.sm),
              const Divider(),
              const SizedBox(height: AppSpacing.sm),
              _buildWeeklyPatternPreview(trends.weeklyPattern!),
            ],

            // Celebrations
            if (trends.celebrations.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.sm),
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Row(
                  children: [
                    Icon(Icons.celebration, size: 16, color: AppColors.success),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        trends.celebrations.first,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.success,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Footer
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Data quality: ${trends.dataQuality}',
                  style: AppTypography.aiGenerated,
                ),
                if (onSeeAll != null)
                  TextButton(
                    onPressed: onSeeAll,
                    child: const Text('See All'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCorrelationPreview(MetricCorrelation correlation) {
    final isPositive = correlation.type == CorrelationType.positive;

    return Row(
      children: [
        Icon(
          Icons.compare_arrows,
          size: 16,
          color: AppColors.secondary,
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTypography.bodySmall,
              children: [
                TextSpan(
                  text: correlation.metric1,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: isPositive ? ' increases ' : ' decreases ',
                ),
                TextSpan(
                  text: correlation.metric2,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        Icon(
          isPositive ? Icons.trending_up : Icons.trending_down,
          size: 16,
          color: isPositive ? AppColors.success : AppColors.error,
        ),
      ],
    );
  }

  Widget _buildWeeklyPatternPreview(WeeklyPattern pattern) {
    return Row(
      children: [
        Icon(Icons.calendar_today, size: 16, color: AppColors.info),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            pattern.bestRecoveryDay != null
                ? 'Best recovery: ${pattern.bestRecoveryDay}'
                : 'Weekly pattern analysis available',
            style: AppTypography.bodySmall,
          ),
        ),
      ],
    );
  }

  Color _getConfidenceColor(int confidence) {
    if (confidence >= 80) return AppColors.success;
    if (confidence >= 60) return AppColors.warning;
    return AppColors.textHint;
  }
}

/// Individual pattern insight card for list display
class PatternInsightItemCard extends StatelessWidget {
  final DetectedTrend trend;
  final VoidCallback? onTap;

  const PatternInsightItemCard({
    super.key,
    required this.trend,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPaddingMedium),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: _getDirectionColor(trend.direction).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Icon(
                  _getDirectionIcon(trend.direction),
                  color: _getDirectionColor(trend.direction),
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trend.metric, style: AppTypography.titleSmall),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      trend.description,
                      style: AppTypography.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (trend.suggestedAction != null) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        trend.suggestedAction!,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.primary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${(trend.changeRate * 100).toStringAsFixed(0)}%',
                    style: AppTypography.titleSmall.copyWith(
                      color: _getDirectionColor(trend.direction),
                    ),
                  ),
                  Text(
                    '${trend.confidence}% conf.',
                    style: AppTypography.aiGenerated,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDirectionColor(TrendDirection direction) {
    switch (direction) {
      case TrendDirection.improving:
        return AppColors.success;
      case TrendDirection.stable:
        return AppColors.info;
      case TrendDirection.declining:
        return AppColors.warning;
      case TrendDirection.rapidlyDeclining:
        return AppColors.error;
    }
  }

  IconData _getDirectionIcon(TrendDirection direction) {
    switch (direction) {
      case TrendDirection.improving:
        return Icons.trending_up;
      case TrendDirection.stable:
        return Icons.trending_flat;
      case TrendDirection.declining:
        return Icons.trending_down;
      case TrendDirection.rapidlyDeclining:
        return Icons.south;
    }
  }
}
