import 'package:flutter/material.dart';

import '../../../../core/domain/entities/health_prediction.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Card displaying a proactive AI insight
class ProactiveInsightCard extends StatelessWidget {
  final ProactiveInsight insight;
  final VoidCallback? onTap;
  final VoidCallback? onDismiss;

  const ProactiveInsightCard({
    super.key,
    required this.insight,
    this.onTap,
    this.onDismiss,
  });

  Color get _typeColor {
    switch (insight.type) {
      case InsightType.trendAlert:
        return AppColors.warning;
      case InsightType.patternDetected:
        return AppColors.info;
      case InsightType.milestone:
        return AppColors.success;
      case InsightType.recommendation:
        return AppColors.primary;
      case InsightType.warning:
        return AppColors.error;
      case InsightType.celebration:
        return Colors.purple;
    }
  }

  IconData get _typeIcon {
    switch (insight.type) {
      case InsightType.trendAlert:
        return Icons.trending_down;
      case InsightType.patternDetected:
        return Icons.insights;
      case InsightType.milestone:
        return Icons.emoji_events;
      case InsightType.recommendation:
        return Icons.lightbulb_outline;
      case InsightType.warning:
        return Icons.warning_amber;
      case InsightType.celebration:
        return Icons.celebration;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: _typeColor,
                width: 4,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: _typeColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _typeIcon,
                        color: _typeColor,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  insight.title,
                                  style: AppTypography.titleSmall,
                                ),
                              ),
                              if (insight.isUrgent)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.xs,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.error.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
                                  ),
                                  child: Text(
                                    'Urgent',
                                    style: AppTypography.labelSmall.copyWith(
                                      fontSize: 9,
                                      color: AppColors.error,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            insight.message,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          if (insight.relatedMetric != null && insight.metricChange != 0) ...[
                            const SizedBox(height: AppSpacing.sm),
                            _buildMetricChange(),
                          ],
                          if (insight.actionableAdvice != null) ...[
                            const SizedBox(height: AppSpacing.sm),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  size: 12,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: AppSpacing.xs),
                                Expanded(
                                  child: Text(
                                    insight.actionableAdvice!,
                                    style: AppTypography.bodySmall.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (onDismiss != null)
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 16,
                          color: AppColors.textHint,
                        ),
                        onPressed: onDismiss,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                // Footer with confidence and time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          size: 12,
                          color: AppColors.textHint,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'AI Insight',
                          style: AppTypography.aiGenerated,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        _buildConfidenceIndicator(),
                      ],
                    ),
                    Text(
                      _formatTime(insight.generatedAt),
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.textHint,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetricChange() {
    final isPositive = insight.metricChange! > 0;
    final color = isPositive ? AppColors.success : AppColors.error;
    final icon = isPositive ? Icons.arrow_upward : Icons.arrow_downward;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            '${insight.relatedMetric}: ${isPositive ? '+' : ''}${insight.metricChange!.toStringAsFixed(0)}%',
            style: AppTypography.labelSmall.copyWith(
              color: color,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfidenceIndicator() {
    Color color;
    if (insight.confidence >= 80) {
      color = AppColors.success;
    } else if (insight.confidence >= 60) {
      color = AppColors.warning;
    } else {
      color = AppColors.textHint;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '${insight.confidence}%',
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.textHint,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) {
      return 'Just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${diff.inDays}d ago';
    }
  }
}
