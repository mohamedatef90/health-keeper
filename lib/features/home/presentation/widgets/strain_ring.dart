import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../../../core/domain/entities/strain_score.dart';

/// WHOOP-style Strain Ring with gradient arc and dark theme
class StrainRing extends StatelessWidget {
  final double strainScore;
  final int? workoutCount;
  final int? totalActiveMinutes;
  final double size;
  final double strokeWidth;
  final bool showLabel;
  final bool showActivity;

  const StrainRing({
    super.key,
    required this.strainScore,
    this.workoutCount,
    this.totalActiveMinutes,
    this.size = 160,
    this.strokeWidth = 12,
    this.showLabel = true,
    this.showActivity = true,
  });

  @override
  Widget build(BuildContext context) {
    final strainColor = AppColors.getStrainColor(strainScore);
    final strainLevel = _getStrainLevel(strainScore);
    final gradientColors = _getGradientColors(strainScore);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background ring (dark track)
          CustomPaint(
            size: Size(size, size),
            painter: _RingBackgroundPainter(
              strokeWidth: strokeWidth,
              color: AppColors.ringBackground,
            ),
          ),

          // Progress ring with gradient
          CustomPaint(
            size: Size(size, size),
            painter: _GradientStrainRingPainter(
              progress: strainScore / 21, // Max strain is 21
              strokeWidth: strokeWidth,
              gradientColors: gradientColors,
            ),
          ),

          // Center content
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Score number
              Text(
                strainScore.toStringAsFixed(1),
                style: AppTypography.scoreDisplay.copyWith(
                  color: strainColor,
                  fontSize: size * 0.22,
                ),
              ),

              // Label
              if (showLabel) ...[
                Text(
                  'STRAIN',
                  style: AppTypography.metricLabel.copyWith(
                    letterSpacing: 1.5,
                  ),
                ),
              ],

              // Strain level badge
              const SizedBox(height: AppSpacing.xs),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: strainColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Text(
                  strainLevel.label.toUpperCase(),
                  style: AppTypography.labelSmall.copyWith(
                    color: strainColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              // Active minutes
              if (showActivity && totalActiveMinutes != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '$totalActiveMinutes min active',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  List<Color> _getGradientColors(double score) {
    if (score >= 18) return AppColors.alertGradientColors;
    if (score >= 14) return [AppColors.alertLight, AppColors.alert];
    if (score >= 10) return AppColors.strainGradientColors;
    if (score >= 5) return [AppColors.strainLight, AppColors.strain];
    return AppColors.recoveryGradientColors;
  }

  StrainLevel _getStrainLevel(double score) {
    if (score >= 18) return StrainLevel.allOut;
    if (score >= 14) return StrainLevel.strenuous;
    if (score >= 10) return StrainLevel.active;
    if (score >= 5) return StrainLevel.moderate;
    return StrainLevel.light;
  }
}

/// Compact strain ring for smaller displays
class CompactStrainRing extends StatelessWidget {
  final double strainScore;
  final double size;

  const CompactStrainRing({
    super.key,
    required this.strainScore,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    final strainColor = AppColors.getStrainColor(strainScore);
    final gradientColors = _getGradientColors(strainScore);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background ring
          CustomPaint(
            size: Size(size, size),
            painter: _RingBackgroundPainter(
              strokeWidth: 8,
              color: AppColors.ringBackground,
            ),
          ),

          // Progress ring with gradient
          CustomPaint(
            size: Size(size, size),
            painter: _GradientStrainRingPainter(
              progress: strainScore / 21,
              strokeWidth: 8,
              gradientColors: gradientColors,
            ),
          ),

          // Score
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                strainScore.toStringAsFixed(1),
                style: AppTypography.metricLarge.copyWith(
                  color: strainColor,
                  fontSize: size * 0.25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Color> _getGradientColors(double score) {
    if (score >= 18) return AppColors.alertGradientColors;
    if (score >= 14) return [AppColors.alertLight, AppColors.alert];
    if (score >= 10) return AppColors.strainGradientColors;
    if (score >= 5) return [AppColors.strainLight, AppColors.strain];
    return AppColors.recoveryGradientColors;
  }
}

/// Dual ring widget showing both strain and recovery - WHOOP style
class DualScoreRings extends StatelessWidget {
  final double strainScore;
  final int recoveryScore;
  final int? readinessScore;
  final VoidCallback? onStrainTap;
  final VoidCallback? onRecoveryTap;

  const DualScoreRings({
    super.key,
    required this.strainScore,
    required this.recoveryScore,
    this.readinessScore,
    this.onStrainTap,
    this.onRecoveryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        border: Border.all(color: AppColors.borderDark, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Strain Ring
          GestureDetector(
            onTap: onStrainTap,
            child: Column(
              children: [
                StrainRing(
                  strainScore: strainScore,
                  size: 130,
                  strokeWidth: 10,
                  showActivity: false,
                ),
                if (onStrainTap != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Tap for details',
                    style: AppTypography.labelXSmall,
                  ),
                ],
              ],
            ),
          ),

          // Divider
          Container(
            width: 1,
            height: 100,
            color: AppColors.borderDark,
          ),

          // Recovery Ring
          GestureDetector(
            onTap: onRecoveryTap,
            child: Column(
              children: [
                _CompactRecoveryRingInternal(
                  recoveryScore: recoveryScore,
                  readinessScore: readinessScore,
                  size: 130,
                ),
                if (onRecoveryTap != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Tap for details',
                    style: AppTypography.labelXSmall,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Internal compact recovery ring for dual display
class _CompactRecoveryRingInternal extends StatelessWidget {
  final int recoveryScore;
  final int? readinessScore;
  final double size;

  const _CompactRecoveryRingInternal({
    required this.recoveryScore,
    this.readinessScore,
    this.size = 130,
  });

  @override
  Widget build(BuildContext context) {
    final recoveryColor = AppColors.getRecoveryColor(recoveryScore);
    final gradientColors = _getGradientColors(recoveryScore);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background ring
          CustomPaint(
            size: Size(size, size),
            painter: _RingBackgroundPainter(
              strokeWidth: 10,
              color: AppColors.ringBackground,
            ),
          ),

          // Progress ring with gradient
          CustomPaint(
            size: Size(size, size),
            painter: _GradientStrainRingPainter(
              progress: recoveryScore / 100,
              strokeWidth: 10,
              gradientColors: gradientColors,
            ),
          ),

          // Center content
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$recoveryScore',
                style: AppTypography.scoreDisplay.copyWith(
                  color: recoveryColor,
                  fontSize: size * 0.22,
                ),
              ),
              Text(
                'RECOVERY',
                style: AppTypography.metricLabel.copyWith(
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: recoveryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Text(
                  _getRecoveryLabel(recoveryScore),
                  style: AppTypography.labelSmall.copyWith(
                    color: recoveryColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              if (readinessScore != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Ready $readinessScore%',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  List<Color> _getGradientColors(int score) {
    if (score >= 67) return AppColors.recoveryGradientColors;
    if (score >= 34) return AppColors.strainGradientColors;
    return AppColors.alertGradientColors;
  }

  String _getRecoveryLabel(int score) {
    if (score >= 80) return 'PEAK';
    if (score >= 67) return 'GREEN';
    if (score >= 50) return 'YELLOW';
    if (score >= 34) return 'YELLOW';
    return 'RED';
  }
}

/// Background ring painter (dark track)
class _RingBackgroundPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  _RingBackgroundPainter({
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _RingBackgroundPainter oldDelegate) {
    return oldDelegate.strokeWidth != strokeWidth || oldDelegate.color != color;
  }
}

/// Gradient ring painter for strain arc
class _GradientStrainRingPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final List<Color> gradientColors;

  _GradientStrainRingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    const startAngle = -math.pi / 2; // Start from top
    final sweepAngle = 2 * math.pi * progress.clamp(0.0, 1.0);

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Create gradient shader
    final gradient = ui.Gradient.sweep(
      center,
      gradientColors,
      [0.0, 1.0],
      TileMode.clamp,
      startAngle,
      startAngle + sweepAngle,
    );

    final paint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    // Draw glow effect at the end of the arc
    if (progress > 0.05) {
      final endAngle = startAngle + sweepAngle;
      final endPoint = Offset(
        center.dx + radius * math.cos(endAngle),
        center.dy + radius * math.sin(endAngle),
      );

      final glowPaint = Paint()
        ..color = gradientColors.last.withOpacity(0.4)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

      canvas.drawCircle(endPoint, strokeWidth / 2, glowPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _GradientStrainRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.gradientColors != gradientColors;
  }
}
