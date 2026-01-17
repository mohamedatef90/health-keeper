import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// WHOOP-style metric card with large number and small label
/// Dark card with subtle border, large numbers, small labels below
class MetricCard extends StatelessWidget {
  final String value;
  final String label;
  final String? unit;
  final String? target;
  final IconData? icon;
  final Color? valueColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  final double? progress;
  final bool showBorder;

  const MetricCard({
    super.key,
    required this.value,
    required this.label,
    this.unit,
    this.target,
    this.icon,
    this.valueColor,
    this.iconColor,
    this.onTap,
    this.progress,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final displayColor = valueColor ?? AppColors.textPrimary;
    final displayIconColor = iconColor ?? displayColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: showBorder
              ? Border.all(color: AppColors.borderDark, width: 1)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon (optional)
            if (icon != null) ...[
              Icon(
                icon,
                color: displayIconColor,
                size: 20,
              ),
              const SizedBox(height: AppSpacing.sm),
            ],

            // Value with optional unit
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Flexible(
                  child: Text(
                    value,
                    style: AppTypography.metricLarge.copyWith(
                      color: displayColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (unit != null) ...[
                  const SizedBox(width: 4),
                  Text(
                    unit!,
                    style: AppTypography.metricUnit.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: AppSpacing.xxs),

            // Label
            Text(
              label.toUpperCase(),
              style: AppTypography.metricLabel,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // Target (optional)
            if (target != null) ...[
              const SizedBox(height: AppSpacing.xxs),
              Text(
                'Target: $target',
                style: AppTypography.labelXSmall,
              ),
            ],

            // Progress bar (optional)
            if (progress != null) ...[
              const SizedBox(height: AppSpacing.sm),
              _buildProgressBar(progress!, displayColor),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(double progress, Color color) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.borderDark,
        borderRadius: BorderRadius.circular(2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}

/// Compact metric card for grid layouts
class CompactMetricCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const CompactMetricCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(color: AppColors.borderDark, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: AppSpacing.sm),
            Text(
              value,
              style: AppTypography.metricMedium.copyWith(color: color),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              label.toUpperCase(),
              style: AppTypography.labelSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Large hero metric card for main dashboard metrics
class HeroMetricCard extends StatelessWidget {
  final String value;
  final String label;
  final String? subtitle;
  final IconData? icon;
  final Color accentColor;
  final List<Color>? gradientColors;
  final VoidCallback? onTap;

  const HeroMetricCard({
    super.key,
    required this.value,
    required this.label,
    this.subtitle,
    this.icon,
    required this.accentColor,
    this.gradientColors,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(color: AppColors.borderDark, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon
            Row(
              children: [
                if (icon != null) ...[
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Icon(
                      icon,
                      color: accentColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                ],
                Text(
                  label.toUpperCase(),
                  style: AppTypography.sectionHeader.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Large value
            Text(
              value,
              style: AppTypography.displayLarge.copyWith(
                color: accentColor,
              ),
            ),

            // Subtitle
            if (subtitle != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                subtitle!,
                style: AppTypography.bodySmall,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Inline metric display for rows
class InlineMetric extends StatelessWidget {
  final String value;
  final String label;
  final Color? color;

  const InlineMetric({
    super.key,
    required this.value,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: AppTypography.metricMedium.copyWith(
            color: color ?? AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          label.toUpperCase(),
          style: AppTypography.labelSmall,
        ),
      ],
    );
  }
}
