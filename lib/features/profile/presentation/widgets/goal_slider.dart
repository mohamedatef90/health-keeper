import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// A slider for setting numeric goals with labels
class GoalSlider extends StatelessWidget {
  final String label;
  final String? description;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final String unit;
  final ValueChanged<double>? onChanged;
  final String Function(double)? valueFormatter;
  final Color? activeColor;
  final bool showValueLabel;

  const GoalSlider({
    super.key,
    required this.label,
    this.description,
    required this.value,
    required this.min,
    required this.max,
    this.divisions,
    required this.unit,
    this.onChanged,
    this.valueFormatter,
    this.activeColor,
    this.showValueLabel = true,
  });

  String _formatValue(double value) {
    if (valueFormatter != null) {
      return valueFormatter!(value);
    }
    // Default formatting: show whole number if no decimals needed
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final color = activeColor ?? AppColors.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.textSecondaryDark,
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    description!,
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.textHintDark,
                    ),
                  ),
                ],
              ],
            ),
            if (showValueLabel)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatValue(value),
                      style: AppTypography.titleMedium.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      unit,
                      style: AppTypography.labelSmall.copyWith(
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: color,
            inactiveTrackColor: color.withOpacity(0.2),
            thumbColor: color,
            overlayColor: color.withOpacity(0.2),
            valueIndicatorColor: color,
            valueIndicatorTextStyle: AppTypography.labelMedium.copyWith(
              color: Colors.white,
            ),
            trackHeight: 6,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
          ),
          child: Slider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            divisions: divisions,
            label: '${_formatValue(value)} $unit',
            onChanged: onChanged,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_formatValue(min)} $unit',
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.textHintDark,
              ),
            ),
            Text(
              '${_formatValue(max)} $unit',
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.textHintDark,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// A compact goal slider for use in cards
class CompactGoalSlider extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final String unit;
  final ValueChanged<double>? onChanged;
  final IconData? icon;
  final Color? color;

  const CompactGoalSlider({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.unit,
    this.onChanged,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final sliderColor = color ?? AppColors.primary;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.dividerDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: sliderColor, size: 20),
                const SizedBox(width: AppSpacing.sm),
              ],
              Expanded(
                child: Text(
                  label,
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.textPrimaryDark,
                  ),
                ),
              ),
              Text(
                '${value.toStringAsFixed(value == value.roundToDouble() ? 0 : 1)} $unit',
                style: AppTypography.titleSmall.copyWith(
                  color: sliderColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: sliderColor,
              inactiveTrackColor: sliderColor.withOpacity(0.2),
              thumbColor: sliderColor,
              overlayColor: sliderColor.withOpacity(0.2),
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            ),
            child: Slider(
              value: value.clamp(min, max),
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
