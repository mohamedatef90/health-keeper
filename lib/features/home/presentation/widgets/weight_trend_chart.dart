import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/data/database/database.dart';

/// Weight Trend Chart - Last 30 days
class WeightTrendChart extends ConsumerWidget {
  const WeightTrendChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<AgentContext>>(
      future: _getWeightHistory(ref),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }

        final data = snapshot.data!;
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.lg),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary.withValues(alpha: 0.15),
                AppColors.surfaceDark.withValues(alpha: 0.9),
              ],
            ),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.lg),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        const Icon(
                          Icons.show_chart,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            'Weight Trend (30 days)',
                            style: AppTypography.titleSmall.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        _buildStats(data),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Chart
                    SizedBox(
                      height: 120,
                      child: LineChart(
                        _buildChartData(data),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStats(List<AgentContext> data) {
    final latest = data.last.weight ?? 0;
    final oldest = data.first.weight ?? latest;
    final diff = latest - oldest;
    final isDown = diff < 0;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: isDown
            ? AppColors.success.withValues(alpha: 0.15)
            : AppColors.warning.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isDown ? Icons.trending_down : Icons.trending_up,
            size: 14,
            color: isDown ? AppColors.success : AppColors.warning,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            '${diff.abs().toStringAsFixed(1)} kg',
            style: AppTypography.bodySmall.copyWith(
              color: isDown ? AppColors.success : AppColors.warning,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _buildChartData(List<AgentContext> data) {
    final spots = <FlSpot>[];
    for (int i = 0; i < data.length; i++) {
      if (data[i].weight != null) {
        spots.add(FlSpot(i.toDouble(), data[i].weight!));
      }
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColors.primary.withValues(alpha: 0.1),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: (data.length - 1).toDouble(),
      minY: spots.map((s) => s.y).reduce((a, b) => a < b ? a : b) - 1,
      maxY: spots.map((s) => s.y).reduce((a, b) => a > b ? a : b) + 1,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: AppColors.primary,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 4,
                color: AppColors.primary,
                strokeWidth: 2,
                strokeColor: AppColors.backgroundDark,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary.withValues(alpha: 0.3),
                AppColors.primary.withValues(alpha: 0.0),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<List<AgentContext>> _getWeightHistory(WidgetRef ref) async {
    final db = ref.read(databaseProvider);
    final contexts = <AgentContext>[];

    final today = DateTime.now();
    for (int i = 29; i >= 0; i--) {
      final date = today.subtract(Duration(days: i));
      final dateOnly = DateTime(date.year, date.month, date.day);
      final context = await db.getAgentContextForDate(dateOnly);
      if (context != null && context.weight != null) {
        contexts.add(context);
      }
    }

    return contexts;
  }
}
