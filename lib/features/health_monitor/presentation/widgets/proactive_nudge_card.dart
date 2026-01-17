import 'package:flutter/material.dart';

import '../../../../core/services/health_prediction_service.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Card displaying a proactive health nudge
class ProactiveNudgeCard extends StatelessWidget {
  final ProactiveNudge nudge;
  final VoidCallback? onDismiss;
  final VoidCallback? onAction;

  const ProactiveNudgeCard({
    super.key,
    required this.nudge,
    this.onDismiss,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getNudgeColor(nudge.type);
    final isPriority = nudge.priority == NudgePriority.high ||
        nudge.priority == NudgePriority.urgent;

    return Card(
      elevation: isPriority ? 2 : 1,
      color: isPriority ? color.withOpacity(0.05) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        side: isPriority
            ? BorderSide(color: color.withOpacity(0.3))
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPaddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Icon(
                _getNudgeIcon(nudge.type),
                color: color,
                size: 20,
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
                      _buildTimingBadge(nudge.timing),
                      if (isPriority) ...[
                        const SizedBox(width: AppSpacing.xs),
                        Icon(
                          Icons.priority_high,
                          size: 14,
                          color: color,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    nudge.message,
                    style: AppTypography.bodyMedium,
                  ),
                  if (nudge.actionableAdvice != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      nudge.actionableAdvice!,
                      style: AppTypography.bodySmall.copyWith(
                        color: color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '${nudge.confidence}% confidence',
                    style: AppTypography.aiGenerated,
                  ),
                ],
              ),
            ),

            // Actions
            if (onDismiss != null)
              IconButton(
                icon: const Icon(Icons.close, size: 18),
                onPressed: onDismiss,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: AppColors.textHint,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimingBadge(NudgeTiming timing) {
    String label;
    IconData icon;
    switch (timing) {
      case NudgeTiming.now:
        label = 'Now';
        icon = Icons.access_time;
        break;
      case NudgeTiming.morning:
        label = 'Morning';
        icon = Icons.wb_sunny;
        break;
      case NudgeTiming.afternoon:
        label = 'Afternoon';
        icon = Icons.wb_cloudy;
        break;
      case NudgeTiming.evening:
        label = 'Evening';
        icon = Icons.nights_stay;
        break;
      case NudgeTiming.beforeSleep:
        label = 'Before Sleep';
        icon = Icons.bedtime;
        break;
      case NudgeTiming.afterWorkout:
        label = 'Post-Workout';
        icon = Icons.fitness_center;
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: AppColors.textHint),
        const SizedBox(width: AppSpacing.xxs),
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.textHint,
          ),
        ),
      ],
    );
  }

  Color _getNudgeColor(NudgeType type) {
    switch (type) {
      case NudgeType.strain:
        return Colors.orange;
      case NudgeType.recovery:
        return AppColors.primary;
      case NudgeType.sleep:
        return Colors.indigo;
      case NudgeType.nutrition:
        return Colors.green;
      case NudgeType.hydration:
        return Colors.blue;
      case NudgeType.stress:
        return Colors.purple;
      case NudgeType.celebration:
        return AppColors.success;
    }
  }

  IconData _getNudgeIcon(NudgeType type) {
    switch (type) {
      case NudgeType.strain:
        return Icons.fitness_center;
      case NudgeType.recovery:
        return Icons.favorite;
      case NudgeType.sleep:
        return Icons.bedtime;
      case NudgeType.nutrition:
        return Icons.restaurant;
      case NudgeType.hydration:
        return Icons.water_drop;
      case NudgeType.stress:
        return Icons.self_improvement;
      case NudgeType.celebration:
        return Icons.celebration;
    }
  }
}

/// Compact nudge card for home screen integration
class CompactNudgeCard extends StatelessWidget {
  final ProactiveNudge nudge;
  final VoidCallback? onTap;
  final VoidCallback? onDismiss;

  const CompactNudgeCard({
    super.key,
    required this.nudge,
    this.onTap,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getNudgeColor(nudge.type);

    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              Icon(_getNudgeIcon(nudge.type), color: color, size: 18),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  nudge.message,
                  style: AppTypography.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (onDismiss != null)
                IconButton(
                  icon: const Icon(Icons.close, size: 16),
                  onPressed: onDismiss,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  color: AppColors.textHint,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getNudgeColor(NudgeType type) {
    switch (type) {
      case NudgeType.strain:
        return Colors.orange;
      case NudgeType.recovery:
        return AppColors.primary;
      case NudgeType.sleep:
        return Colors.indigo;
      case NudgeType.nutrition:
        return Colors.green;
      case NudgeType.hydration:
        return Colors.blue;
      case NudgeType.stress:
        return Colors.purple;
      case NudgeType.celebration:
        return AppColors.success;
    }
  }

  IconData _getNudgeIcon(NudgeType type) {
    switch (type) {
      case NudgeType.strain:
        return Icons.fitness_center;
      case NudgeType.recovery:
        return Icons.favorite;
      case NudgeType.sleep:
        return Icons.bedtime;
      case NudgeType.nutrition:
        return Icons.restaurant;
      case NudgeType.hydration:
        return Icons.water_drop;
      case NudgeType.stress:
        return Icons.self_improvement;
      case NudgeType.celebration:
        return Icons.celebration;
    }
  }
}
