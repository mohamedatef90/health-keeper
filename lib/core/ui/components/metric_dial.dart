import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Small circular metric dial for the triple-dial layout
class MetricDial extends StatelessWidget {
  final String label;
  final String value;
  final String? sublabel;
  final double progress;
  final List<Color> gradientColors;
  final Color valueColor;
  final double size;
  final VoidCallback? onTap;

  const MetricDial({
    super.key,
    required this.label,
    required this.value,
    this.sublabel,
    required this.progress,
    required this.gradientColors,
    required this.valueColor,
    this.size = AppSpacing.dialSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final widget = SizedBox(
      width: size,
      height: size + 28,
      child: Column(
        children: [
          SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background ring
                CustomPaint(
                  size: Size(size, size),
                  painter: _DialBackgroundPainter(
                    strokeWidth: AppSpacing.dialStrokeWidth,
                    color: AppColors.ringBackground,
                  ),
                ),
                // Progress ring
                CustomPaint(
                  size: Size(size, size),
                  painter: _DialProgressPainter(
                    progress: progress.clamp(0.0, 1.0),
                    strokeWidth: AppSpacing.dialStrokeWidth,
                    gradientColors: gradientColors,
                  ),
                ),
                // Center value
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      value,
                      style: AppTypography.metricLarge.copyWith(
                        color: valueColor,
                        fontSize: size * 0.26,
                      ),
                    ),
                    if (sublabel != null)
                      Text(
                        sublabel!,
                        style: AppTypography.labelSmall.copyWith(
                          color: valueColor,
                          fontSize: 9,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTypography.metricLabel.copyWith(
              letterSpacing: 1.2,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: widget);
    }
    return widget;
  }
}

class _DialBackgroundPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  _DialBackgroundPainter({required this.strokeWidth, required this.color});

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
  bool shouldRepaint(covariant _DialBackgroundPainter oldDelegate) =>
      oldDelegate.strokeWidth != strokeWidth || oldDelegate.color != color;
}

class _DialProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final List<Color> gradientColors;

  _DialProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;

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

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _DialProgressPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.gradientColors != gradientColors;
}
