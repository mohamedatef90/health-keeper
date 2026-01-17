import 'package:flutter/material.dart';

import '../../../../core/services/health_prediction_service.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Card displaying a health alert with severity indicator
class HealthAlertCard extends StatelessWidget {
  final HealthAlert alert;
  final VoidCallback? onDismiss;
  final VoidCallback? onTakeAction;

  const HealthAlertCard({
    super.key,
    required this.alert,
    this.onDismiss,
    this.onTakeAction,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getSeverityColor(alert.severity);

    return Card(
      elevation: alert.requiresAttention ? 2 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        side: BorderSide(
          color: color.withOpacity(0.3),
          width: alert.requiresAttention ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: onTakeAction,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPaddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Severity indicator
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Icon(
                      _getAlertIcon(alert.type),
                      color: color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                alert.title,
                                style: AppTypography.titleSmall.copyWith(
                                  color: color,
                                ),
                              ),
                            ),
                            _buildSeverityBadge(alert.severity),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          alert.message,
                          style: AppTypography.bodySmall,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Quick actions preview
              if (alert.actionableSteps.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: alert.actionableSteps.take(2).map((step) => Chip(
                        label: Text(
                          step,
                          style: AppTypography.labelSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        backgroundColor: color.withOpacity(0.1),
                        side: BorderSide.none,
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      )).toList(),
                ),
              ],

              // Footer
              if (onTakeAction != null || onDismiss != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${alert.confidence}% confidence',
                      style: AppTypography.aiGenerated,
                    ),
                    const Spacer(),
                    if (onDismiss != null)
                      TextButton(
                        onPressed: onDismiss,
                        child: const Text('Dismiss'),
                      ),
                    if (onTakeAction != null)
                      TextButton(
                        onPressed: onTakeAction,
                        child: const Text('View Details'),
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

  Color _getSeverityColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.low:
        return AppColors.info;
      case AlertSeverity.medium:
        return AppColors.warning;
      case AlertSeverity.high:
        return AppColors.accent;
      case AlertSeverity.critical:
        return AppColors.error;
    }
  }

  IconData _getAlertIcon(HealthAlertType type) {
    switch (type) {
      case HealthAlertType.illness:
        return Icons.sick;
      case HealthAlertType.overtraining:
        return Icons.fitness_center;
      case HealthAlertType.sleepDebt:
        return Icons.bedtime;
      case HealthAlertType.stress:
        return Icons.psychology;
      case HealthAlertType.hrvDrop:
        return Icons.favorite;
      case HealthAlertType.rhrElevated:
        return Icons.monitor_heart;
      case HealthAlertType.patternAnomaly:
        return Icons.analytics;
      case HealthAlertType.general:
        return Icons.info;
    }
  }

  Widget _buildSeverityBadge(AlertSeverity severity) {
    final color = _getSeverityColor(severity);
    String label;
    switch (severity) {
      case AlertSeverity.low:
        label = 'Low';
        break;
      case AlertSeverity.medium:
        label = 'Med';
        break;
      case AlertSeverity.high:
        label = 'High';
        break;
      case AlertSeverity.critical:
        label = 'Urgent';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
