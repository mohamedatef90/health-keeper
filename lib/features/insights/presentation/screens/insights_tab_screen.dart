import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/components/section_card.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Insights Tab - trends, weekly reports, health insights, progress photos, journal
class InsightsTabScreen extends ConsumerWidget {
  const InsightsTabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: Text(
          'Insights',
          style: AppTypography.titleLarge.copyWith(color: AppColors.textPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenPaddingHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.md),

            // Weight Trend
            Text('WEIGHT TREND', style: AppTypography.sectionHeader),
            const SizedBox(height: AppSpacing.sm),
            SectionCard(
              onTap: () {},
              child: SizedBox(
                height: 120,
                child: Center(
                  child: Text(
                    'Weight chart loads here',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Weekly Report
            Text('WEEKLY REPORT', style: AppTypography.sectionHeader),
            const SizedBox(height: AppSpacing.sm),
            SectionCard(
              onTap: () => context.go('/insights-tab/weekly-report'),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.recovery.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: const Icon(Icons.assessment, color: AppColors.recovery, size: 24),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This Week\'s Summary',
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Tap to view full report',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Health Insights
            Text('HEALTH INSIGHTS', style: AppTypography.sectionHeader),
            const SizedBox(height: AppSpacing.sm),
            SectionCard(
              onTap: () => context.go('/insights-tab/insights'),
              child: Column(
                children: [
                  _InsightRow(
                    icon: Icons.bedtime,
                    label: 'Sleep Debt',
                    value: '2.5 hrs',
                    color: AppColors.sleep,
                  ),
                  const Divider(color: AppColors.borderDark, height: 1),
                  _InsightRow(
                    icon: Icons.warning_amber,
                    label: 'Overtraining Risk',
                    value: 'Low',
                    color: AppColors.recovery,
                  ),
                  const Divider(color: AppColors.borderDark, height: 1),
                  _InsightRow(
                    icon: Icons.trending_up,
                    label: 'Recovery Trend',
                    value: 'Improving',
                    color: AppColors.recoveryGreen,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Progress Photos
            Text('PROGRESS PHOTOS', style: AppTypography.sectionHeader),
            const SizedBox(height: AppSpacing.sm),
            SectionCard(
              onTap: () => context.go('/insights-tab/progress-photos'),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: const Icon(Icons.photo_camera, color: AppColors.accent, size: 24),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Progress Photos',
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Compare your visual progress',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Journal
            Text('JOURNAL', style: AppTypography.sectionHeader),
            const SizedBox(height: AppSpacing.sm),
            SectionCard(
              onTap: () => context.go('/health/journal'),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.sleep.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: const Icon(Icons.book, color: AppColors.sleep, size: 24),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Journal Entries',
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Reflect on your day',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xxl + AppSpacing.bottomNavHeight),
          ],
        ),
      ),
    );
  }
}

class _InsightRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InsightRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: AppTypography.bodyMedium.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
