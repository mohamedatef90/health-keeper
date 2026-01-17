import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// WHOOP-style stat row for displaying key statistics
/// Displays multiple metrics in a horizontal row with icons
class StatRow extends StatelessWidget {
  final List<StatItem> stats;
  final MainAxisAlignment alignment;

  const StatRow({
    super.key,
    required this.stats,
    this.alignment = MainAxisAlignment.spaceEvenly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.borderDark, width: 1),
      ),
      child: Row(
        mainAxisAlignment: alignment,
        children: stats.asMap().entries.map((entry) {
          final index = entry.key;
          final stat = entry.value;
          return Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (index > 0) ...[
                  Container(
                    width: 1,
                    height: 32,
                    color: AppColors.borderDark,
                  ),
                  const SizedBox(width: AppSpacing.md),
                ],
                _StatItemWidget(stat: stat),
                if (index < stats.length - 1)
                  const SizedBox(width: AppSpacing.md),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Single stat item for the stat row
class StatItem {
  final IconData? icon;
  final String value;
  final String label;
  final Color? color;
  final VoidCallback? onTap;

  const StatItem({
    this.icon,
    required this.value,
    required this.label,
    this.color,
    this.onTap,
  });
}

class _StatItemWidget extends StatelessWidget {
  final StatItem stat;

  const _StatItemWidget({required this.stat});

  @override
  Widget build(BuildContext context) {
    final color = stat.color ?? AppColors.textPrimary;

    return GestureDetector(
      onTap: stat.onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (stat.icon != null) ...[
                Icon(
                  stat.icon,
                  color: color,
                  size: 16,
                ),
                const SizedBox(width: 4),
              ],
              Text(
                stat.value,
                style: AppTypography.metricMedium.copyWith(color: color),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            stat.label.toUpperCase(),
            style: AppTypography.labelSmall,
          ),
        ],
      ),
    );
  }
}

/// Simple stat row without container (for embedding in other widgets)
class InlineStatRow extends StatelessWidget {
  final List<StatItem> stats;

  const InlineStatRow({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: stats.map((stat) {
        final color = stat.color ?? AppColors.textPrimary;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (stat.icon != null) ...[
                  Icon(stat.icon, color: color, size: 14),
                  const SizedBox(width: 4),
                ],
                Text(
                  stat.value,
                  style: AppTypography.metricSmall.copyWith(color: color),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              stat.label.toUpperCase(),
              style: AppTypography.labelXSmall,
            ),
          ],
        );
      }).toList(),
    );
  }
}

/// Health stats overview row (for daily summaries)
class HealthStatsRow extends StatelessWidget {
  final int? sleepHours;
  final int? sleepMinutes;
  final int? hrv;
  final int? restingHr;
  final int? steps;

  const HealthStatsRow({
    super.key,
    this.sleepHours,
    this.sleepMinutes,
    this.hrv,
    this.restingHr,
    this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return StatRow(
      stats: [
        if (sleepHours != null || sleepMinutes != null)
          StatItem(
            icon: Icons.bedtime_outlined,
            value: sleepHours != null
                ? '${sleepHours}h ${sleepMinutes ?? 0}m'
                : '${sleepMinutes}m',
            label: 'Sleep',
            color: AppColors.sleep,
          ),
        if (hrv != null)
          StatItem(
            icon: Icons.show_chart,
            value: '$hrv',
            label: 'HRV',
            color: AppColors.recovery,
          ),
        if (restingHr != null)
          StatItem(
            icon: Icons.favorite_outline,
            value: '$restingHr',
            label: 'RHR',
            color: AppColors.alert,
          ),
        if (steps != null)
          StatItem(
            icon: Icons.directions_walk,
            value: _formatSteps(steps!),
            label: 'Steps',
            color: AppColors.strain,
          ),
      ],
    );
  }

  String _formatSteps(int steps) {
    if (steps >= 10000) {
      return '${(steps / 1000).toStringAsFixed(1)}k';
    } else if (steps >= 1000) {
      return '${(steps / 1000).toStringAsFixed(1)}k';
    }
    return '$steps';
  }
}

/// Macro stats row for nutrition
class MacroStatsRow extends StatelessWidget {
  final int calories;
  final int caloriesTarget;
  final int protein;
  final int proteinTarget;
  final int carbs;
  final int carbsTarget;
  final int fat;
  final int fatTarget;

  const MacroStatsRow({
    super.key,
    required this.calories,
    required this.caloriesTarget,
    required this.protein,
    required this.proteinTarget,
    required this.carbs,
    required this.carbsTarget,
    required this.fat,
    required this.fatTarget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.borderDark, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: _MacroStat(
              label: 'Calories',
              value: calories,
              target: caloriesTarget,
              color: AppColors.calories,
              unit: '',
            ),
          ),
          Expanded(
            child: _MacroStat(
              label: 'Protein',
              value: protein,
              target: proteinTarget,
              color: AppColors.protein,
              unit: 'g',
            ),
          ),
          Expanded(
            child: _MacroStat(
              label: 'Carbs',
              value: carbs,
              target: carbsTarget,
              color: AppColors.carbs,
              unit: 'g',
            ),
          ),
          Expanded(
            child: _MacroStat(
              label: 'Fat',
              value: fat,
              target: fatTarget,
              color: AppColors.fat,
              unit: 'g',
            ),
          ),
        ],
      ),
    );
  }
}

class _MacroStat extends StatelessWidget {
  final String label;
  final int value;
  final int target;
  final Color color;
  final String unit;

  const _MacroStat({
    required this.label,
    required this.value,
    required this.target,
    required this.color,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (value / target).clamp(0.0, 1.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$value$unit',
          style: AppTypography.metricSmall.copyWith(color: color),
        ),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: AppTypography.labelXSmall,
        ),
        const SizedBox(height: 8),
        // Progress bar
        Container(
          height: 4,
          width: 48,
          decoration: BoxDecoration(
            color: AppColors.borderDark,
            borderRadius: BorderRadius.circular(2),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '/ $target$unit',
          style: AppTypography.labelXSmall.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }
}
