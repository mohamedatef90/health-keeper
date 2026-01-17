import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/domain/entities/health_prediction.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Circular progress ring displaying overall health score
class HealthScoreRing extends StatelessWidget {
  final int score;
  final HealthStatus status;
  final double size;

  const HealthScoreRing({
    super.key,
    required this.score,
    required this.status,
    this.size = 120,
  });

  Color get _scoreColor {
    switch (status) {
      case HealthStatus.excellent:
        return AppColors.recoveryExcellent;
      case HealthStatus.good:
        return AppColors.recoveryGood;
      case HealthStatus.moderate:
        return AppColors.recoveryModerate;
      case HealthStatus.attentionNeeded:
        return AppColors.recoveryLow;
      case HealthStatus.unknown:
        return AppColors.textHint;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _HealthScoreRingPainter(
          score: score,
          color: _scoreColor,
          backgroundColor: AppColors.divider,
          strokeWidth: size * 0.12,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$score',
                style: AppTypography.scoreDisplay.copyWith(
                  fontSize: size * 0.35,
                  color: _scoreColor,
                ),
              ),
              Text(
                'Health',
                style: AppTypography.labelSmall.copyWith(
                  fontSize: size * 0.1,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HealthScoreRingPainter extends CustomPainter {
  final int score;
  final Color color;
  final Color backgroundColor;
  final double strokeWidth;

  _HealthScoreRingPainter({
    required this.score,
    required this.color,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Score arc
    final scorePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = (score / 100) * 2 * math.pi;
    const startAngle = -math.pi / 2; // Start from top

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      scorePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _HealthScoreRingPainter oldDelegate) {
    return oldDelegate.score != score || oldDelegate.color != color;
  }
}
