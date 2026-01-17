import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class WeeklyReportScreen extends ConsumerWidget {
  const WeeklyReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Report'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              // TODO: Share report
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Week header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.cardPadding),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                      ),
                      child: const Icon(
                        Icons.calendar_today,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jan 6 - Jan 12, 2026', style: AppTypography.titleMedium),
                          Row(
                            children: [
                              const Icon(
                                Icons.auto_awesome,
                                size: 14,
                                color: AppColors.info,
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              Text(
                                'AI-generated report',
                                style: AppTypography.aiGenerated,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Summary
            Text('Summary', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.cardPadding),
                child: Text(
                  'Great week overall! You maintained consistent logging, hit your protein targets most days, and showed improved recovery scores compared to last week. Your sleep quality was the highlight of the week.',
                  style: AppTypography.bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Key metrics
            Text('Key Metrics', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    label: 'Avg Recovery',
                    value: '72%',
                    change: '+5%',
                    isPositive: true,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _MetricCard(
                    label: 'Avg Sleep',
                    value: '7.2h',
                    change: '+0.3h',
                    isPositive: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    label: 'Avg Calories',
                    value: '1,850',
                    change: '-50',
                    isPositive: true,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _MetricCard(
                    label: 'Avg Protein',
                    value: '118g',
                    change: '+8g',
                    isPositive: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // Highlights
            Text('Highlights', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            _HighlightItem(
              icon: Icons.check_circle,
              color: AppColors.success,
              text: 'Hit protein target 6 out of 7 days',
            ),
            _HighlightItem(
              icon: Icons.check_circle,
              color: AppColors.success,
              text: 'Best sleep quality this month (7.8h average)',
            ),
            _HighlightItem(
              icon: Icons.check_circle,
              color: AppColors.success,
              text: 'Completed 4 workouts as planned',
            ),
            const SizedBox(height: AppSpacing.lg),

            // Concerns
            Text('Areas to Improve', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            _HighlightItem(
              icon: Icons.warning_amber,
              color: AppColors.warning,
              text: 'Steps below target on 3 days',
            ),
            _HighlightItem(
              icon: Icons.warning_amber,
              color: AppColors.warning,
              text: 'Eating window extended past 8PM twice',
            ),
            const SizedBox(height: AppSpacing.lg),

            // Next week focus
            Text('Next Week Focus', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Card(
              color: AppColors.primary.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.cardPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.flag, color: AppColors.primary),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'Weekly Goal',
                          style: AppTypography.titleSmall.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'Focus on hitting 8000 steps daily. Set reminders for afternoon walks to bridge the gap. Maintain the excellent sleep routine.',
                      style: AppTypography.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String change;
  final bool isPositive;

  const _MetricCard({
    required this.label,
    required this.value,
    required this.change,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTypography.labelSmall),
            const SizedBox(height: AppSpacing.xs),
            Text(value, style: AppTypography.headlineSmall),
            const SizedBox(height: AppSpacing.xs),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 14,
                  color: isPositive ? AppColors.success : AppColors.error,
                ),
                Text(
                  change,
                  style: AppTypography.labelSmall.copyWith(
                    color: isPositive ? AppColors.success : AppColors.error,
                  ),
                ),
                Text(
                  ' vs last week',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.textHint,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HighlightItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _HighlightItem({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(text, style: AppTypography.bodyMedium),
          ),
        ],
      ),
    );
  }
}
