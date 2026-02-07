import 'package:flutter/material.dart';

import '../../../../core/ui/components/metric_dial.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';

/// Three horizontal metric dials: Recovery, Strain, Sleep
class TripleMetricDials extends StatelessWidget {
  final int recoveryScore;
  final double strainScore;
  final double sleepHours;
  final VoidCallback? onRecoveryTap;
  final VoidCallback? onStrainTap;
  final VoidCallback? onSleepTap;

  const TripleMetricDials({
    super.key,
    required this.recoveryScore,
    required this.strainScore,
    required this.sleepHours,
    this.onRecoveryTap,
    this.onStrainTap,
    this.onSleepTap,
  });

  @override
  Widget build(BuildContext context) {
    final recoveryColor = AppColors.getRecoveryColor(recoveryScore);
    final strainColor = AppColors.getStrainColor(strainScore);
    final sleepColor = _getSleepColor(sleepHours);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MetricDial(
            label: 'RECOVERY',
            value: '$recoveryScore',
            sublabel: '%',
            progress: recoveryScore / 100,
            gradientColors: _getRecoveryGradient(recoveryScore),
            valueColor: recoveryColor,
            onTap: onRecoveryTap,
          ),
          Container(width: 1, height: 60, color: AppColors.borderDark),
          MetricDial(
            label: 'STRAIN',
            value: strainScore.toStringAsFixed(1),
            progress: strainScore / 21,
            gradientColors: _getStrainGradient(strainScore),
            valueColor: strainColor,
            onTap: onStrainTap,
          ),
          Container(width: 1, height: 60, color: AppColors.borderDark),
          MetricDial(
            label: 'SLEEP',
            value: sleepHours.toStringAsFixed(1),
            sublabel: 'hrs',
            progress: (sleepHours / 9).clamp(0.0, 1.0),
            gradientColors: AppColors.sleepGradientColors,
            valueColor: sleepColor,
            onTap: onSleepTap,
          ),
        ],
      ),
    );
  }

  List<Color> _getRecoveryGradient(int score) {
    if (score >= 67) return AppColors.recoveryGradientColors;
    if (score >= 34) return AppColors.strainGradientColors;
    return AppColors.alertGradientColors;
  }

  List<Color> _getStrainGradient(double score) {
    if (score >= 18) return AppColors.alertGradientColors;
    if (score >= 10) return AppColors.strainGradientColors;
    return AppColors.recoveryGradientColors;
  }

  Color _getSleepColor(double hours) {
    if (hours >= 7) return AppColors.sleep;
    if (hours >= 5) return AppColors.strain;
    return AppColors.alert;
  }
}
