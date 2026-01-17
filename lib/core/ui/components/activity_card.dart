import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// WHOOP-style activity card with icon, name, and value
/// Used for activity history, meal logs, workout logs, etc.
class ActivityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? trailingValue;
  final String? trailingLabel;
  final Color? iconColor;
  final VoidCallback? onTap;
  final Widget? trailing;

  const ActivityCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailingValue,
    this.trailingLabel,
    this.iconColor,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final displayIconColor = iconColor ?? AppColors.recovery;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(color: AppColors.borderDark, width: 1),
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: displayIconColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Icon(
                icon,
                color: displayIconColor,
                size: 22,
              ),
            ),
            const SizedBox(width: AppSpacing.md),

            // Title and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTypography.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Trailing content
            if (trailing != null)
              trailing!
            else if (trailingValue != null) ...[
              const SizedBox(width: AppSpacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    trailingValue!,
                    style: AppTypography.metricSmall.copyWith(
                      color: displayIconColor,
                    ),
                  ),
                  if (trailingLabel != null) ...[
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      trailingLabel!,
                      style: AppTypography.labelXSmall,
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Activity row for list views (borderless for use inside cards)
class ActivityRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? time;
  final Color? iconColor;
  final VoidCallback? onTap;

  const ActivityRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.time,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayIconColor = iconColor ?? AppColors.recovery;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: displayIconColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Icon(
                icon,
                color: displayIconColor,
                size: 20,
              ),
            ),
            const SizedBox(width: AppSpacing.md),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTypography.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Time
            if (time != null) ...[
              const SizedBox(width: AppSpacing.sm),
              Text(
                time!,
                style: AppTypography.timestamp,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Workout activity card with strain indicator
class WorkoutActivityCard extends StatelessWidget {
  final String workoutType;
  final String duration;
  final double strain;
  final int caloriesBurned;
  final DateTime? time;
  final VoidCallback? onTap;

  const WorkoutActivityCard({
    super.key,
    required this.workoutType,
    required this.duration,
    required this.strain,
    required this.caloriesBurned,
    this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final strainColor = AppColors.getStrainColor(strain);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: strainColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                  child: Icon(
                    Icons.fitness_center,
                    color: strainColor,
                    size: 22,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workoutType,
                        style: AppTypography.titleSmall,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        duration,
                        style: AppTypography.bodySmall,
                      ),
                    ],
                  ),
                ),
                // Strain badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: strainColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        strain.toStringAsFixed(1),
                        style: AppTypography.labelMedium.copyWith(
                          color: strainColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'STRAIN',
                        style: AppTypography.labelXSmall.copyWith(
                          color: strainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Stats row
            Row(
              children: [
                _StatItem(
                  icon: Icons.local_fire_department,
                  value: '$caloriesBurned',
                  label: 'cal',
                  color: AppColors.calories,
                ),
                const SizedBox(width: AppSpacing.lg),
                _StatItem(
                  icon: Icons.timer_outlined,
                  value: duration,
                  label: '',
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(
          value,
          style: AppTypography.labelMedium.copyWith(color: color),
        ),
        if (label.isNotEmpty) ...[
          const SizedBox(width: 2),
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(color: color),
          ),
        ],
      ],
    );
  }
}

/// Meal activity card with nutrition summary
class MealActivityCard extends StatelessWidget {
  final String mealName;
  final String time;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final String? photoUrl;
  final VoidCallback? onTap;

  const MealActivityCard({
    super.key,
    required this.mealName,
    required this.time,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.photoUrl,
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
        child: Row(
          children: [
            // Photo or icon
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.calories.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                image: photoUrl != null
                    ? DecorationImage(
                        image: NetworkImage(photoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: photoUrl == null
                  ? Icon(
                      Icons.restaurant,
                      color: AppColors.calories,
                      size: 24,
                    )
                  : null,
            ),
            const SizedBox(width: AppSpacing.md),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mealName,
                        style: AppTypography.titleSmall,
                      ),
                      Text(
                        time,
                        style: AppTypography.timestamp,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),

                  // Macros row
                  Row(
                    children: [
                      _MacroChip(
                        value: calories,
                        label: 'cal',
                        color: AppColors.calories,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _MacroChip(
                        value: protein,
                        label: 'P',
                        color: AppColors.protein,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _MacroChip(
                        value: carbs,
                        label: 'C',
                        color: AppColors.carbs,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _MacroChip(
                        value: fat,
                        label: 'F',
                        color: AppColors.fat,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MacroChip extends StatelessWidget {
  final int value;
  final String label;
  final Color color;

  const _MacroChip({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Text(
        '$value$label',
        style: AppTypography.labelSmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
