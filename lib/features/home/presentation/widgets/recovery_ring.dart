import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// WHOOP-style Recovery Ring with gradient arc and dark theme
class RecoveryRing extends StatelessWidget {
  final int recoveryScore;
  final int readinessScore;
  final double size;
  final double strokeWidth;
  final bool showLabel;
  final bool showReadiness;

  const RecoveryRing({
    super.key,
    required this.recoveryScore,
    required this.readinessScore,
    this.size = AppSpacing.recoveryRingSize,
    this.strokeWidth = AppSpacing.recoveryRingStroke,
    this.showLabel = true,
    this.showReadiness = true,
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
            painter: _GradientRingPainter(
              progress: recoveryScore / 100,
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
                '$recoveryScore',
                style: AppTypography.scoreDisplay.copyWith(
                  color: recoveryColor,
                  fontSize: size * 0.3,
                ),
              ),

              // Label
              if (showLabel) ...[
                Text(
                  'RECOVERY',
                  style: AppTypography.metricLabel.copyWith(
                    letterSpacing: 1.5,
                  ),
                ),
              ],

              // Recovery status badge
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

              // Readiness score
              if (showReadiness) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Readiness $readinessScore%',
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
    if (score >= 67) {
      return AppColors.recoveryGradientColors;
    } else if (score >= 34) {
      return AppColors.strainGradientColors;
    } else {
      return AppColors.alertGradientColors;
    }
  }

  String _getRecoveryLabel(int score) {
    if (score >= 80) return 'PEAK';
    if (score >= 67) return 'GREEN';
    if (score >= 50) return 'YELLOW';
    if (score >= 34) return 'YELLOW';
    return 'RED';
  }
}

/// Compact recovery ring for smaller displays
class CompactRecoveryRing extends StatelessWidget {
  final int recoveryScore;
  final double size;

  const CompactRecoveryRing({
    super.key,
    required this.recoveryScore,
    this.size = 80,
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
              strokeWidth: 8,
              color: AppColors.ringBackground,
            ),
          ),

          // Progress ring with gradient
          CustomPaint(
            size: Size(size, size),
            painter: _GradientRingPainter(
              progress: recoveryScore / 100,
              strokeWidth: 8,
              gradientColors: gradientColors,
            ),
          ),

          // Score
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$recoveryScore',
                style: AppTypography.metricLarge.copyWith(
                  color: recoveryColor,
                  fontSize: size * 0.28,
                ),
              ),
              Text(
                '%',
                style: AppTypography.labelSmall.copyWith(
                  color: recoveryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Color> _getGradientColors(int score) {
    if (score >= 67) {
      return AppColors.recoveryGradientColors;
    } else if (score >= 34) {
      return AppColors.strainGradientColors;
    } else {
      return AppColors.alertGradientColors;
    }
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

/// Gradient ring painter for progress arc
class _GradientRingPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final List<Color> gradientColors;

  _GradientRingPainter({
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
    final sweepAngle = 2 * math.pi * progress;

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
  bool shouldRepaint(covariant _GradientRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.gradientColors != gradientColors;
  }
}
