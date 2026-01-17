import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Compact risk indicator card with gauge visualization
class RiskIndicator extends StatelessWidget {
  final String title;
  final int value;
  final int maxValue;
  final String level;
  final Color color;
  final IconData icon;
  final VoidCallback? onTap;

  const RiskIndicator({
    super.key,
    required this.title,
    required this.value,
    required this.maxValue,
    required this.level,
    required this.color,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (value / maxValue).clamp(0.0, 1.0);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPaddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 20),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    title,
                    style: AppTypography.labelMedium,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              // Gauge visualization
              Stack(
                children: [
                  // Background
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.divider,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  // Fill
                  FractionallySizedBox(
                    widthFactor: percentage,
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),

              // Value and level
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$value%',
                    style: AppTypography.titleMedium.copyWith(color: color),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xxs,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Text(
                      level,
                      style: AppTypography.labelSmall.copyWith(color: color),
                    ),
                  ),
                ],
              ),

              // Tap hint
              if (onTap != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Tap for details',
                  style: AppTypography.aiGenerated,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Circular risk indicator for larger displays
class CircularRiskIndicator extends StatelessWidget {
  final String title;
  final int value;
  final int maxValue;
  final String level;
  final Color color;
  final IconData icon;
  final double size;
  final VoidCallback? onTap;

  const CircularRiskIndicator({
    super.key,
    required this.title,
    required this.value,
    required this.maxValue,
    required this.level,
    required this.color,
    required this.icon,
    this.size = 100,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (value / maxValue).clamp(0.0, 1.0);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size / 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
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
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.divider,
                    ),
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
                    Icon(icon, color: color, size: 24),
                    const SizedBox(height: 2),
                    Text(
                      '$value%',
                      style: AppTypography.titleMedium.copyWith(color: color),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(title, style: AppTypography.labelMedium),
          Container(
            margin: const EdgeInsets.only(top: AppSpacing.xxs),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: Text(
              level,
              style: AppTypography.labelSmall.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
