import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../../../core/ui/components/metric_card.dart';
import '../../../../core/providers/strain_provider.dart';
import '../../../../core/providers/recovery_provider.dart';
import '../../../../core/providers/health_monitor_provider.dart';
import '../../../../core/domain/services/recovery_calculator.dart';
import '../widgets/triple_metric_dials.dart';
import '../widgets/quick_action_button.dart';
import '../widgets/daily_brief_card.dart';
import '../widgets/connect_health_banner.dart';
import '../../../health_monitor/presentation/widgets/proactive_nudge_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strainAsync = ref.watch(todayStrainScoreProvider);
    final recoveryAsync = ref.watch(todayRecoveryScoreProvider);
    final nudgesAsync = ref.watch(proactiveNudgesProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(todayStrainScoreProvider);
          ref.invalidate(todayRecoveryScoreProvider);
          ref.invalidate(proactiveNudgesProvider);
        },
        color: AppColors.recovery,
        backgroundColor: AppColors.cardDark,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.screenPaddingHorizontal,
                    AppSpacing.md,
                    AppSpacing.screenPaddingHorizontal,
                    0,
                  ),
                  child: _buildHeader(context),
                ),
              ),
            ),

            // Content
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPaddingHorizontal,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: AppSpacing.lg),

                  // Three Metric Dials
                  _buildTripleDials(context, strainAsync, recoveryAsync),
                  const SizedBox(height: AppSpacing.md),

                  // Connect Health Banner
                  const ConnectHealthBanner(),

                  // Proactive Nudges (max 2)
                  _buildProactiveNudges(context, nudgesAsync),

                  // Daily Brief
                  _buildSectionHeader('DAILY BRIEF'),
                  const SizedBox(height: AppSpacing.sm),
                  _buildDailyBriefCard(recoveryAsync),
                  const SizedBox(height: AppSpacing.lg),

                  // Quick Actions
                  _buildSectionHeader('QUICK ADD'),
                  const SizedBox(height: AppSpacing.sm),
                  _buildQuickActions(context),
                  const SizedBox(height: AppSpacing.lg),

                  // Quick Stats
                  _buildSectionHeader('TODAY\'S STATS'),
                  const SizedBox(height: AppSpacing.sm),
                  _buildQuickStats(),
                  const SizedBox(height: AppSpacing.xxl + AppSpacing.bottomNavHeight),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final now = DateTime.now();
    final dateStr = DateFormat('EEEE, MMM d').format(now);
    final greeting = _getGreeting(now.hour);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: AppTypography.titleLarge.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                dateStr,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.monitor_heart_outlined),
          color: AppColors.textSecondary,
          onPressed: () => context.go('/health-monitor'),
        ),
      ],
    );
  }

  String _getGreeting(int hour) {
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  Widget _buildTripleDials(
    BuildContext context,
    AsyncValue strainAsync,
    AsyncValue recoveryAsync,
  ) {
    return strainAsync.when(
      loading: () => _buildDialsPlaceholder(),
      error: (_, __) => _buildDialsFallback(context),
      data: (strain) => recoveryAsync.when(
        loading: () => _buildDialsFallback(context),
        error: (_, __) => _buildDialsFallback(context),
        data: (recovery) => TripleMetricDials(
          recoveryScore: recovery?.score ?? 75,
          strainScore: (strain?.score ?? 0).toDouble(),
          sleepHours: 7.2, // TODO: from HealthKit sleep data
          onRecoveryTap: () => context.go('/recovery'),
          onStrainTap: () => context.go('/recovery'),
          onSleepTap: () => context.go('/recovery'),
        ),
      ),
    );
  }

  Widget _buildDialsPlaceholder() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
      ),
      child: const Center(
        child: CircularProgressIndicator(color: AppColors.recovery),
      ),
    );
  }

  Widget _buildDialsFallback(BuildContext context) {
    return TripleMetricDials(
      recoveryScore: 75,
      strainScore: 0,
      sleepHours: 7.0,
      onRecoveryTap: () => context.go('/recovery'),
      onStrainTap: () => context.go('/recovery'),
      onSleepTap: () => context.go('/recovery'),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(title, style: AppTypography.sectionHeader);
  }

  Widget _buildDailyBriefCard(AsyncValue recoveryAsync) {
    return recoveryAsync.when(
      loading: () => const DailyBriefCard(
        coachingText: 'Loading your personalized insights...',
        topActions: [],
        suggestedIntensity: 3,
      ),
      error: (_, __) => const DailyBriefCard(
        coachingText:
            'Good morning! Your recovery is solid today. Focus on hitting your protein target and staying hydrated.',
        topActions: [
          'Hit 120g protein target',
          'Get 8000+ steps',
          'Bed by 10:30 PM',
        ],
        suggestedIntensity: 3,
      ),
      data: (recovery) {
        final insights = recovery != null ? RecoveryInsights(recovery) : null;

        return DailyBriefCard(
          coachingText: insights?.mainInsight ??
              'Good morning! Your recovery is solid today. Focus on hitting your protein target and staying hydrated.',
          topActions: insights?.recommendations.take(3).toList() ?? [
            'Hit 120g protein target',
            'Get 8000+ steps',
            'Bed by 10:30 PM',
          ],
          suggestedIntensity: _getSuggestedIntensity(recovery?.score ?? 70),
        );
      },
    );
  }

  int _getSuggestedIntensity(int recoveryScore) {
    if (recoveryScore >= 80) return 5;
    if (recoveryScore >= 60) return 4;
    if (recoveryScore >= 40) return 3;
    if (recoveryScore >= 20) return 2;
    return 1;
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuickActionButton(
            icon: Icons.monitor_weight_outlined,
            label: 'Weight',
            onTap: () => _showWeightDialog(context),
            color: AppColors.recovery,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: QuickActionButton(
            icon: Icons.restaurant_outlined,
            label: 'Meal',
            onTap: () => context.go('/health/meal-log'),
            color: AppColors.calories,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: QuickActionButton(
            icon: Icons.fitness_center_outlined,
            label: 'Workout',
            onTap: () => context.go('/health/workout-log'),
            color: AppColors.strain,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: QuickActionButton(
            icon: Icons.edit_note_outlined,
            label: 'Journal',
            onTap: () => context.go('/health/journal'),
            color: AppColors.sleep,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickStats() {
    return Row(
      children: [
        Expanded(
          child: CompactMetricCard(
            value: '1,450',
            label: 'Calories',
            icon: Icons.local_fire_department,
            color: AppColors.calories,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: CompactMetricCard(
            value: '85g',
            label: 'Protein',
            icon: Icons.egg_alt,
            color: AppColors.protein,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: CompactMetricCard(
            value: '6.2k',
            label: 'Steps',
            icon: Icons.directions_walk,
            color: AppColors.strain,
          ),
        ),
      ],
    );
  }

  Widget _buildProactiveNudges(BuildContext context, AsyncValue nudgesAsync) {
    return nudgesAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (nudges) {
        if (nudges.isEmpty) return const SizedBox.shrink();
        return Column(
          children: [
            ...nudges.take(2).map((nudge) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: CompactNudgeCard(
                    nudge: nudge,
                    onTap: () => context.go('/health-monitor'),
                  ),
                )),
            const SizedBox(height: AppSpacing.sm),
          ],
        );
      },
    );
  }

  void _showWeightDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.bottomSheetRadius),
        ),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40, height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.borderDark,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text('Log Weight', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.lg),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: AppTypography.metricLarge.copyWith(color: AppColors.recovery),
                decoration: InputDecoration(
                  hintText: 'Enter weight',
                  hintStyle: AppTypography.metricLarge.copyWith(color: AppColors.textTertiary),
                  suffixText: 'kg',
                  suffixStyle: AppTypography.metricUnit,
                  filled: true,
                  fillColor: AppColors.cardDark,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    borderSide: const BorderSide(color: AppColors.borderDark),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    borderSide: const BorderSide(color: AppColors.borderDark),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    borderSide: const BorderSide(color: AppColors.recovery, width: 2),
                  ),
                ),
                autofocus: true,
              ),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.recovery,
                    foregroundColor: AppColors.backgroundDark,
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  ),
                  child: Text(
                    'Save',
                    style: AppTypography.button.copyWith(color: AppColors.backgroundDark),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}
