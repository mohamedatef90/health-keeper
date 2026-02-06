import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/services/agent_sync_service.dart';
import '../../../../core/data/database/database.dart';

/// Daily Summary Card - Shows morning greeting + today's protocol
/// 
/// Displays:
/// - Personalized greeting
/// - Sync status
/// - Protocol for today (Mounjaro, Football, Eating window)
/// - Quick health stats
class DailySummaryCard extends ConsumerWidget {
  const DailySummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncStatusAsync = ref.watch(agentSyncStatusProvider);
    final todayContextFuture = _getTodayContext(ref);

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
            AppColors.primary.withValues(alpha: 0.2),
            AppColors.accent.withValues(alpha: 0.15),
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
                // Greeting header
                _buildGreeting(),
                const SizedBox(height: AppSpacing.md),

                // Sync status
                syncStatusAsync.when(
                  data: (status) => _buildSyncStatus(status, ref),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
                const SizedBox(height: AppSpacing.sm),

                // Today's context
                FutureBuilder<AgentContext?>(
                  future: todayContextFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return _buildTodayStats(snapshot.data!);
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                // Protocol for today
                _buildProtocolSection(ref),
                const SizedBox(height: AppSpacing.md),

                // Quick actions
                _buildQuickActions(context, ref),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGreeting() {
    final hour = DateTime.now().hour;
    String greeting;
    String emoji;

    if (hour < 12) {
      greeting = 'صباح الخير';
      emoji = '🌅';
    } else if (hour < 17) {
      greeting = 'مساء الخير';
      emoji = '☀️';
    } else {
      greeting = 'مساء الخير';
      emoji = '🌙';
    }

    return Row(
      children: [
        Text(
          emoji,
          style: const TextStyle(fontSize: 32),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: AppTypography.titleLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                _getMotivationalQuote(),
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSyncStatus(AgentSyncStatus status, WidgetRef ref) {
    IconData icon;
    String text;
    Color color;

    switch (status) {
      case AgentSyncStatus.synced:
        icon = Icons.check_circle;
        text = 'Synced';
        color = AppColors.success;
        break;
      case AgentSyncStatus.stale:
        icon = Icons.warning_amber;
        text = 'Data is old - tap to sync';
        color = AppColors.warning;
        break;
      case AgentSyncStatus.notSynced:
        icon = Icons.sync_problem;
        text = 'Not synced - tap to sync';
        color = AppColors.alert;
        break;
    }

    return GestureDetector(
      onTap: status != AgentSyncStatus.synced
          ? () async {
              final syncService = ref.read(agentSyncServiceProvider);
              await syncService.syncTodayContext();
              ref.invalidate(agentSyncStatusProvider);
            }
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(AppSpacing.sm),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: AppSpacing.xs),
            Text(
              text,
              style: AppTypography.bodySmall.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayStats(AgentContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.xs,
      children: [
        if (context.weight != null)
          _buildStatChip(
            '⚖️',
            '${context.weight!.toStringAsFixed(1)} kg',
          ),
        if (context.sleepHours != null)
          _buildStatChip(
            '😴',
            '${context.sleepHours!.toStringAsFixed(1)}h',
          ),
        if (context.hrv != null)
          _buildStatChip(
            '💓',
            'HRV ${context.hrv!.toStringAsFixed(0)}',
          ),
        if (context.steps != null)
          _buildStatChip(
            '👟',
            '${context.steps} steps',
          ),
      ],
    );
  }

  Widget _buildStatChip(String emoji, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppSpacing.sm),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: AppSpacing.xs),
          Text(
            value,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProtocolSection(WidgetRef ref) {
    return FutureBuilder<List<ProtocolRule>>(
      future: _getActiveProtocol(ref),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }

        final rules = snapshot.data!;
        final today = DateTime.now();
        final dayName = _getDayName(today.weekday);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Protocol',
              style: AppTypography.titleSmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            ...rules.map((rule) {
              final isToday = _isRuleActiveToday(rule, dayName);
              return _buildProtocolItem(rule, isToday);
            }),
          ],
        );
      },
    );
  }

  Widget _buildProtocolItem(ProtocolRule rule, bool isToday) {
    String emoji;
    String display;

    switch (rule.name) {
      case 'mounjaro':
        emoji = '💉';
        display = isToday ? 'Mounjaro Today' : 'Mounjaro';
        break;
      case 'football':
        emoji = '⚽';
        display = isToday ? 'Football Match Today!' : 'Football';
        break;
      case 'eating-window':
        emoji = '🍽️';
        display = 'Eating Window';
        break;
      default:
        emoji = '📋';
        display = rule.name;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              display,
              style: AppTypography.bodyMedium.copyWith(
                color: isToday ? AppColors.primary : AppColors.textSecondary,
                fontWeight: isToday ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          if (isToday)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Today',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            icon: Icons.chat_bubble_outline,
            label: 'Chat',
            onTap: () => context.go('/agent-chat'),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildActionButton(
            icon: Icons.rule_outlined,
            label: 'Protocol',
            onTap: () => context.go('/protocol-settings'),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary.withValues(alpha: 0.3),
              AppColors.accent.withValues(alpha: 0.2),
            ],
          ),
          borderRadius: BorderRadius.circular(AppSpacing.sm),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.4),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: AppColors.primary),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================================
  // HELPERS
  // ==========================================================================

  Future<AgentContext?> _getTodayContext(WidgetRef ref) async {
    final db = ref.read(databaseProvider);
    final today = DateTime.now();
    final dateOnly = DateTime(today.year, today.month, today.day);
    return await db.getAgentContextForDate(dateOnly);
  }

  Future<List<ProtocolRule>> _getActiveProtocol(WidgetRef ref) async {
    final db = ref.read(databaseProvider);
    return await db.getAllProtocolRules(activeOnly: true);
  }

  String _getMotivationalQuote() {
    final quotes = [
      'خطوة جديدة نحو هدفك',
      'اليوم أقوى من امبارح',
      'الاستمرارية هي السر',
      'جسمك يستحق الأفضل',
      'استثمر في صحتك',
    ];
    return quotes[DateTime.now().day % quotes.length];
  }

  String _getDayName(int weekday) {
    const days = [
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday',
    ];
    return days[weekday - 1];
  }

  bool _isRuleActiveToday(ProtocolRule rule, String dayName) {
    try {
      final schedule = rule.scheduleJson;
      if (schedule == null || schedule.isEmpty) return false;

      final Map<String, dynamic> data = 
          const {} as Map<String, dynamic>; // Will be parsed from JSON
      
      if (data.containsKey('days')) {
        final days = data['days'] as List;
        return days.contains(dayName);
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
