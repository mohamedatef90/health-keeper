import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../../../core/ui/components/metric_card.dart';
import '../../../../core/ui/components/activity_card.dart';
import '../../../../core/providers/strain_provider.dart';
import '../../../../core/providers/recovery_provider.dart';
import '../../../../core/providers/health_monitor_provider.dart';
import '../../../../core/domain/services/recovery_calculator.dart';
import '../widgets/strain_ring.dart';
import '../widgets/quick_action_button.dart';
import '../widgets/daily_brief_card.dart';
import '../widgets/connect_health_banner.dart';
import '../../../health_monitor/presentation/widgets/proactive_nudge_card.dart';
import '../../../coach_chat/presentation/widgets/coach_chat_button.dart';
import '../widgets/daily_summary_card.dart';
import '../widgets/voice_command_widget.dart';
import '../widgets/agent_suggestions_widget.dart';
import '../widgets/weight_trend_chart.dart';
import '../widgets/photo_progress_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch strain and recovery scores
    final strainAsync = ref.watch(todayStrainScoreProvider);
    final recoveryAsync = ref.watch(todayRecoveryScoreProvider);
    // Watch health alerts for badge
    final alertBadgeAsync = ref.watch(alertBadgeCountProvider);
    // Watch proactive nudges
    final nudgesAsync = ref.watch(proactiveNudgesProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: Text(
          'Health Keeper',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          // Health Monitor with badge
          alertBadgeAsync.when(
            loading: () => IconButton(
              icon: const Icon(Icons.monitor_heart_outlined),
              color: AppColors.textSecondary,
              onPressed: () => context.go('/health-monitor'),
            ),
            error: (_, __) => IconButton(
              icon: const Icon(Icons.monitor_heart_outlined),
              color: AppColors.textSecondary,
              onPressed: () => context.go('/health-monitor'),
            ),
            data: (badgeCount) => Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.monitor_heart_outlined),
                  color: AppColors.textSecondary,
                  onPressed: () => context.go('/health-monitor'),
                ),
                if (badgeCount > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.alert,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '$badgeCount',
                        style: AppTypography.badgeText.copyWith(
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            color: AppColors.textSecondary,
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(todayStrainScoreProvider);
          ref.invalidate(todayRecoveryScoreProvider);
          ref.invalidate(alertBadgeCountProvider);
          ref.invalidate(proactiveNudgesProvider);
        },
        color: AppColors.recovery,
        backgroundColor: AppColors.cardDark,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPaddingHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.md),

              // Connect Health Banner (shows when permissions not granted)
              const ConnectHealthBanner(),

              // ✨ NEW: Daily Summary Card
              const DailySummaryCard(),

              // ✨ NEW: Voice Command Widget
              const VoiceCommandWidget(),

              // ✨ NEW: Agent Suggestions
              const AgentSuggestionsWidget(),

              // ✨ NEW: Weight Trend Chart
              const WeightTrendChart(),

              // ✨ NEW: Photo Progress Card
              const PhotoProgressCard(),

              // Dual Score Rings (Strain + Recovery)
              _buildScoreRings(context, strainAsync, recoveryAsync),
              const SizedBox(height: AppSpacing.lg),

              // Proactive Nudges (max 2)
              _buildProactiveNudges(context, nudgesAsync),

              // Daily Brief Card
              _buildDailyBriefCard(recoveryAsync),
              const SizedBox(height: AppSpacing.lg),

              // Quick Actions
              _buildSectionHeader('QUICK ADD'),
              const SizedBox(height: AppSpacing.sm),
              Row(
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
                      onTap: () => context.go('/meal-log'),
                      color: AppColors.calories,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: QuickActionButton(
                      icon: Icons.fitness_center_outlined,
                      label: 'Workout',
                      onTap: () => context.go('/workout-log'),
                      color: AppColors.strain,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: QuickActionButton(
                      icon: Icons.edit_note_outlined,
                      label: 'Journal',
                      onTap: () => context.go('/journal'),
                      color: AppColors.sleep,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),

              // AI Plans Section
              _buildSectionHeader('AI PLANS'),
              const SizedBox(height: AppSpacing.sm),
              _buildAiPlansSection(context),
              const SizedBox(height: AppSpacing.xl),

              // Today's Progress
              _buildSectionHeader('TODAY\'S PROGRESS'),
              const SizedBox(height: AppSpacing.sm),
              _buildProgressCards(),
              const SizedBox(height: AppSpacing.xl),

              // Warnings/Alerts (if any)
              _buildWarningCard(),
              const SizedBox(height: AppSpacing.xl),

              // Recent Activity
              _buildSectionHeader('RECENT ACTIVITY'),
              const SizedBox(height: AppSpacing.sm),
              _buildRecentActivity(),
              const SizedBox(height: AppSpacing.xxl + AppSpacing.bottomNavHeight),
            ],
          ),
        ),
      ),
      floatingActionButton: const CoachChatButton(
        contextTag: 'home',
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surfaceDark,
          border: Border(
            top: BorderSide(color: AppColors.borderDark, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: AppColors.surfaceDark,
          selectedItemColor: AppColors.recovery,
          unselectedItemColor: AppColors.textTertiary,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: (index) {
            switch (index) {
              case 0:
                break; // Already home
              case 1:
                context.go('/meal-log');
                break;
              case 2:
                context.go('/coach');
                break;
              case 3:
                context.go('/recovery');
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_outlined),
              activeIcon: Icon(Icons.restaurant),
              label: 'Nutrition',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_outlined),
              activeIcon: Icon(Icons.fitness_center),
              label: 'Coach',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: 'Recovery',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTypography.sectionHeader,
    );
  }

  Widget _buildScoreRings(
    BuildContext context,
    AsyncValue strainAsync,
    AsyncValue recoveryAsync,
  ) {
    return strainAsync.when(
      loading: () => Container(
        height: 180,
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
          border: Border.all(color: AppColors.borderDark),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.recovery,
          ),
        ),
      ),
      error: (error, stack) => _buildFallbackRings(context),
      data: (strain) => recoveryAsync.when(
        loading: () => _buildFallbackRings(context),
        error: (error, stack) => _buildFallbackRings(context),
        data: (recovery) => DualScoreRings(
          strainScore: strain?.score ?? 0,
          recoveryScore: recovery?.score ?? 75,
          readinessScore: recovery?.score != null ? (recovery!.score * 0.9).round() : 70,
          onStrainTap: () => context.go('/recovery'),
          onRecoveryTap: () => context.go('/recovery'),
        ),
      ),
    );
  }

  Widget _buildFallbackRings(BuildContext context) {
    return DualScoreRings(
      strainScore: 0,
      recoveryScore: 75,
      readinessScore: 70,
      onStrainTap: () => context.go('/recovery'),
      onRecoveryTap: () => context.go('/recovery'),
    );
  }

  Widget _buildDailyBriefCard(AsyncValue recoveryAsync) {
    return recoveryAsync.when(
      loading: () => const DailyBriefCard(
        coachingText: 'Loading your personalized insights...',
        topActions: [],
        suggestedIntensity: 3,
      ),
      error: (error, stack) => const DailyBriefCard(
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
        final insights = recovery != null
            ? RecoveryInsights(recovery)
            : null;

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

  Widget _buildAiPlansSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _AiPlanCard(
            title: 'خطة الوجبات',
            subtitle: 'Weekly Meal Plan',
            icon: Icons.restaurant_menu,
            color: AppColors.calories,
            onTap: () => context.go('/weekly-meal-plan'),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _AiPlanCard(
            title: 'الخطة الرئيسية',
            subtitle: 'Master Plan',
            icon: Icons.hub,
            color: AppColors.strain,
            onTap: () => context.go('/master-plan'),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCards() {
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

  Widget _buildWarningCard() {
    return WarningCard(
      title: 'Recovery Notice',
      message: 'Your HRV is lower than usual. Consider a lighter workout today.',
      icon: Icons.warning_amber_rounded,
      color: AppColors.strain,
    );
  }

  Widget _buildRecentActivity() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Column(
        children: [
          ActivityRow(
            icon: Icons.restaurant,
            title: 'Lunch logged',
            subtitle: '650 cal - 35g protein',
            time: '1:30 PM',
            iconColor: AppColors.calories,
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            color: AppColors.borderDark,
          ),
          ActivityRow(
            icon: Icons.fitness_center,
            title: 'Morning walk',
            subtitle: '30 min - 180 cal',
            time: '7:00 AM',
            iconColor: AppColors.strain,
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            color: AppColors.borderDark,
          ),
          ActivityRow(
            icon: Icons.monitor_weight,
            title: 'Weight logged',
            subtitle: '82.5 kg',
            time: 'Yesterday',
            iconColor: AppColors.recovery,
          ),
        ],
      ),
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
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.borderDark,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Log Weight',
                style: AppTypography.titleLarge,
              ),
              const SizedBox(height: AppSpacing.lg),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: AppTypography.metricLarge.copyWith(
                  color: AppColors.recovery,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter weight',
                  hintStyle: AppTypography.metricLarge.copyWith(
                    color: AppColors.textTertiary,
                  ),
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
                    // TODO: Save weight
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.recovery,
                    foregroundColor: AppColors.backgroundDark,
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  ),
                  child: Text(
                    'Save',
                    style: AppTypography.button.copyWith(
                      color: AppColors.backgroundDark,
                    ),
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

/// Card widget for AI Plans section
class _AiPlanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _AiPlanCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(color: AppColors.borderDark),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const Spacer(),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.textTertiary,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textPrimary,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subtitle,
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
