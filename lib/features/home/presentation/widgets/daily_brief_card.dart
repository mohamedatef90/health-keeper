import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// WHOOP-style Daily Brief Card with dark theme
class DailyBriefCard extends StatelessWidget {
  final String coachingText;
  final List<String> topActions;
  final int suggestedIntensity;
  final VoidCallback? onTap;

  const DailyBriefCard({
    super.key,
    required this.coachingText,
    required this.topActions,
    required this.suggestedIntensity,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final intensityColor = AppColors.getIntensityColor(suggestedIntensity);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(color: AppColors.borderDark, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.recovery.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: AppColors.recovery,
                    size: 18,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'DAILY BRIEF',
                  style: AppTypography.sectionHeader.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const Spacer(),
                // AI generated badge
                _AiBadge(),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Coaching text
            Text(
              coachingText,
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.md),

            // Suggested intensity
            _IntensityIndicator(
              intensity: suggestedIntensity,
              color: intensityColor,
            ),
            const SizedBox(height: AppSpacing.md),

            // Divider
            Container(
              height: 1,
              color: AppColors.borderDark,
            ),
            const SizedBox(height: AppSpacing.md),

            // Top actions
            Text(
              'TODAY\'S FOCUS',
              style: AppTypography.sectionHeader.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            ...topActions.take(3).map((action) => _ActionItem(action: action)),
          ],
        ),
      ),
    );
  }
}

class _AiBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.sleep.withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.auto_awesome,
            size: 10,
            color: AppColors.sleep,
          ),
          const SizedBox(width: 4),
          Text(
            'AI',
            style: AppTypography.badgeText.copyWith(
              color: AppColors.sleep,
            ),
          ),
        ],
      ),
    );
  }
}

class _IntensityIndicator extends StatelessWidget {
  final int intensity;
  final Color color;

  const _IntensityIndicator({
    required this.intensity,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Suggested Intensity',
          style: AppTypography.labelSmall,
        ),
        const SizedBox(width: AppSpacing.md),
        // Intensity bars
        ...List.generate(5, (index) {
          final isActive = index < intensity;
          return Container(
            width: 24,
            height: 6,
            margin: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
              color: isActive ? color : AppColors.borderDark,
              borderRadius: BorderRadius.circular(3),
            ),
          );
        }),
        const SizedBox(width: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
          child: Text(
            _getIntensityLabel(intensity).toUpperCase(),
            style: AppTypography.labelSmall.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  String _getIntensityLabel(int intensity) {
    switch (intensity) {
      case 1:
        return 'Rest';
      case 2:
        return 'Light';
      case 3:
        return 'Moderate';
      case 4:
        return 'Hard';
      case 5:
        return 'Very Hard';
      default:
        return 'Moderate';
    }
  }
}

class _ActionItem extends StatelessWidget {
  final String action;

  const _ActionItem({required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.recovery.withOpacity(0.12),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.check,
              size: 14,
              color: AppColors.recovery,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              action,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Compact daily brief for smaller displays
class CompactDailyBriefCard extends StatelessWidget {
  final String mainInsight;
  final int suggestedIntensity;
  final VoidCallback? onTap;

  const CompactDailyBriefCard({
    super.key,
    required this.mainInsight,
    required this.suggestedIntensity,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final intensityColor = AppColors.getIntensityColor(suggestedIntensity);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.borderDark, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.recovery.withOpacity(0.12),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: AppColors.recovery,
                size: 20,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainInsight,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        final isActive = index < suggestedIntensity;
                        return Container(
                          width: 16,
                          height: 4,
                          margin: const EdgeInsets.only(right: 2),
                          decoration: BoxDecoration(
                            color: isActive ? intensityColor : AppColors.borderDark,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      }),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        _getIntensityLabel(suggestedIntensity),
                        style: AppTypography.labelXSmall.copyWith(
                          color: intensityColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  String _getIntensityLabel(int intensity) {
    switch (intensity) {
      case 1:
        return 'Rest';
      case 2:
        return 'Light';
      case 3:
        return 'Moderate';
      case 4:
        return 'Hard';
      case 5:
        return 'Very Hard';
      default:
        return 'Moderate';
    }
  }
}

/// Warning card for alerts
class WarningCard extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;
  final VoidCallback? onDismiss;

  const WarningCard({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.warning_amber_rounded,
    this.color,
    this.onTap,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final warningColor = color ?? AppColors.strain;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: warningColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: warningColor.withOpacity(0.25),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: warningColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Icon(
                icon,
                color: warningColor,
                size: 20,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.titleSmall.copyWith(
                      color: warningColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ),
            if (onDismiss != null)
              GestureDetector(
                onTap: onDismiss,
                child: Icon(
                  Icons.close,
                  color: AppColors.textTertiary,
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
