import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class RecoveryScreen extends ConsumerWidget {
  const RecoveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recovery'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recovery Score Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recovery Score',
                              style: AppTypography.titleMedium,
                            ),
                            Text(
                              'Based on your Apple Watch data',
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textHint,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                            vertical: AppSpacing.sm,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.recoveryGood.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                          ),
                          child: Text(
                            '75%',
                            style: AppTypography.headlineMedium.copyWith(
                              color: AppColors.recoveryGood,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _MetricTile(
                          icon: Icons.bedtime,
                          label: 'Sleep',
                          value: '7.2h',
                          status: MetricStatus.good,
                        ),
                        _MetricTile(
                          icon: Icons.favorite,
                          label: 'HRV',
                          value: '45ms',
                          status: MetricStatus.moderate,
                        ),
                        _MetricTile(
                          icon: Icons.monitor_heart,
                          label: 'RHR',
                          value: '58',
                          status: MetricStatus.good,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Readiness Score
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.cardPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Readiness Score', style: AppTypography.titleMedium),
                        Text(
                          '70%',
                          style: AppTypography.titleLarge.copyWith(
                            color: AppColors.recoveryGood,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'You\'re ready for moderate intensity activity today.',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: AppColors.divider,
                        valueColor: const AlwaysStoppedAnimation(AppColors.recoveryGood),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Weekly Trend
            Text('Weekly Trend', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.cardPadding),
                child: SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _DayBar(day: 'M', value: 65),
                      _DayBar(day: 'T', value: 72),
                      _DayBar(day: 'W', value: 58),
                      _DayBar(day: 'T', value: 80),
                      _DayBar(day: 'F', value: 75, isToday: true),
                      _DayBar(day: 'S', value: 0),
                      _DayBar(day: 'S', value: 0),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Recovery Tips
            Text('Recovery Tips', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            _TipCard(
              icon: Icons.bedtime,
              title: 'Improve Sleep',
              description: 'Aim for 30 minutes earlier bedtime tonight.',
            ),
            const SizedBox(height: AppSpacing.sm),
            _TipCard(
              icon: Icons.water_drop,
              title: 'Stay Hydrated',
              description: 'Drink at least 2.5L of water today.',
            ),
            const SizedBox(height: AppSpacing.sm),
            _TipCard(
              icon: Icons.self_improvement,
              title: 'Stress Management',
              description: 'Try 10 minutes of deep breathing or meditation.',
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}

enum MetricStatus { good, moderate, low }

class _MetricTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final MetricStatus status;

  const _MetricTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.status,
  });

  Color get statusColor {
    switch (status) {
      case MetricStatus.good:
        return AppColors.recoveryGood;
      case MetricStatus.moderate:
        return AppColors.recoveryModerate;
      case MetricStatus.low:
        return AppColors.recoveryLow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: statusColor, size: 24),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(value, style: AppTypography.titleSmall),
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(color: AppColors.textHint),
        ),
      ],
    );
  }
}

class _DayBar extends StatelessWidget {
  final String day;
  final int value;
  final bool isToday;

  const _DayBar({
    required this.day,
    required this.value,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = value == 0
        ? AppColors.divider
        : AppColors.getRecoveryColor(value);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (value > 0)
          Text(
            '$value',
            style: AppTypography.labelSmall.copyWith(
              color: color,
            ),
          ),
        const SizedBox(height: AppSpacing.xs),
        Container(
          width: 24,
          height: value == 0 ? 8 : (value / 100 * 100).clamp(20, 100),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          day,
          style: AppTypography.labelSmall.copyWith(
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            color: isToday ? AppColors.primary : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _TipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _TipCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(title, style: AppTypography.titleSmall),
        subtitle: Text(description, style: AppTypography.bodySmall),
      ),
    );
  }
}
