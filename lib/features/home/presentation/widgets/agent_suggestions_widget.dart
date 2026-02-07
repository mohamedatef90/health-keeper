import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/data/database/database.dart';

/// Agent Suggestions Widget - Proactive tips from AI agents
/// 
/// Shows contextual suggestions based on:
/// - HRV (low → rest day)
/// - Sleep (poor → light workout)
/// - Protocol (Mounjaro today, Football tomorrow)
/// - Weight trend
class AgentSuggestionsWidget extends ConsumerWidget {
  const AgentSuggestionsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<AgentSuggestion>>(
      future: _generateSuggestions(ref),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }

        final suggestions = snapshot.data!;
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSpacing.sm,
                  bottom: AppSpacing.sm,
                ),
                child: Text(
                  '💡 Agent Suggestions',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ...suggestions.map((suggestion) => _buildSuggestionCard(
                    context,
                    suggestion,
                  )),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSuggestionCard(BuildContext context, AgentSuggestion suggestion) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.md),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            suggestion.color.withValues(alpha: 0.2),
            suggestion.color.withValues(alpha: 0.1),
            AppColors.surfaceDark.withValues(alpha: 0.9),
          ],
        ),
        border: Border.all(
          color: suggestion.color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.md),
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
                    Text(
                      suggestion.emoji,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            suggestion.agentName,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            suggestion.title,
                            style: AppTypography.titleSmall.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),

                // Message
                Text(
                  suggestion.message,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),

                // Action button
                if (suggestion.actionLabel != null) ...[
                  const SizedBox(height: AppSpacing.sm),
                  GestureDetector(
                    onTap: () {
                      if (suggestion.actionRoute != null) {
                        context.go(suggestion.actionRoute!);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            suggestion.color.withValues(alpha: 0.3),
                            suggestion.color.withValues(alpha: 0.2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(AppSpacing.sm),
                        border: Border.all(
                          color: suggestion.color.withValues(alpha: 0.4),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: suggestion.color,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            suggestion.actionLabel!,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  // SUGGESTIONS LOGIC
  // ==========================================================================

  Future<List<AgentSuggestion>> _generateSuggestions(WidgetRef ref) async {
    final suggestions = <AgentSuggestion>[];
    final db = ref.read(databaseProvider);

    // Get today's context
    final today = DateTime.now();
    final dateOnly = DateTime(today.year, today.month, today.day);
    final context = await db.getAgentContextForDate(dateOnly);

    // Get protocol rules
    final protocols = await db.getAllProtocolRules(activeOnly: true);

    // 1. HRV-based suggestion (Fitness Agent)
    if (context?.sleepHRV != null && context!.sleepHRV! < 50) {
      suggestions.add(
        AgentSuggestion(
          agentName: '🏋️ Fitness Agent',
          emoji: '🏋️',
          title: 'Low HRV Detected',
          message: 'Your HRV is ${context.sleepHRV!.toStringAsFixed(0)} (low). '
              'Consider a rest day or light activity today.',
          color: AppColors.warning,
          actionLabel: 'View Recovery',
          actionRoute: '/recovery',
        ),
      );
    }

    // 2. Sleep-based suggestion (Health Agent)
    if (context?.sleepDuration != null && context!.sleepDuration! < 6.5) {
      suggestions.add(
        AgentSuggestion(
          agentName: '🩺 Health Agent',
          emoji: '🩺',
          title: 'Poor Sleep Quality',
          message: 'You slept only ${context.sleepDuration!.toStringAsFixed(1)}h. '
              'Prioritize recovery today and aim for earlier bedtime tonight.',
          color: AppColors.alert,
          actionLabel: 'Sleep Tips',
          actionRoute: '/agent-chat?context=sleep',
        ),
      );
    }

    // 3. Protocol reminder (Mounjaro)
    final mounjaroRule = protocols.firstWhere(
      (r) => r.name == 'mounjaro',
      orElse: () => protocols.first,
    );
    if (_isMounjaroToday(mounjaroRule)) {
      final taken = context?.mounjaroTaken ?? false;
      if (!taken) {
        suggestions.add(
          AgentSuggestion(
            agentName: '🩺 Health Agent',
            emoji: '💉',
            title: 'Mounjaro Reminder',
            message: 'Don\'t forget your Mounjaro injection today!',
            color: AppColors.primary,
            actionLabel: 'Mark as Taken',
            actionRoute: null, // Could trigger voice command
          ),
        );
      }
    }

    // 4. Football prep (Activity Agent)
    final footballRule = protocols.firstWhere(
      (r) => r.name == 'football',
      orElse: () => protocols.first,
    );
    if (_isFootballTomorrow(footballRule)) {
      suggestions.add(
        AgentSuggestion(
          agentName: '🏋️ Fitness Agent',
          emoji: '⚽',
          title: 'Match Tomorrow',
          message: 'Football match tomorrow! Avoid intense workouts today '
              'and focus on hydration.',
          color: AppColors.accent,
          actionLabel: 'Prep Tips',
          actionRoute: '/agent-chat?context=football',
        ),
      );
    }

    // 5. Weight trend (Nutrition Agent)
    if (context?.weight != null) {
      final yesterday = dateOnly.subtract(const Duration(days: 1));
      final yesterdayContext = await db.getAgentContextForDate(yesterday);
      
      if (yesterdayContext?.weight != null) {
        final diff = context!.weight! - yesterdayContext!.weight!;
        if (diff > 0.5) {
          suggestions.add(
            AgentSuggestion(
              agentName: '🍽️ Nutrition Agent',
              emoji: '🍽️',
              title: 'Weight Increased',
              message: 'Weight up ${diff.toStringAsFixed(1)} kg from yesterday. '
                  'Review your eating window and meal quality.',
              color: AppColors.warning,
              actionLabel: 'Review Meals',
              actionRoute: '/meal-log',
            ),
          );
        }
      }
    }

    // Limit to top 2 suggestions
    return suggestions.take(2).toList();
  }

  bool _isMounjaroToday(ProtocolRule rule) {
    try {
      final today = DateTime.now();
      final dayName = _getDayName(today.weekday);
      // TODO: Parse JSON schedule
      // For now, hardcoded Mon/Wed/Fri
      return ['monday', 'wednesday', 'friday'].contains(dayName);
    } catch (_) {
      return false;
    }
  }

  bool _isFootballTomorrow(ProtocolRule rule) {
    try {
      final tomorrow = DateTime.now().add(const Duration(days: 1));
      final dayName = _getDayName(tomorrow.weekday);
      // TODO: Parse JSON schedule
      // For now, hardcoded Monday
      return dayName == 'monday';
    } catch (_) {
      return false;
    }
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
}

/// Agent suggestion model
class AgentSuggestion {
  final String agentName;
  final String emoji;
  final String title;
  final String message;
  final Color color;
  final String? actionLabel;
  final String? actionRoute;

  AgentSuggestion({
    required this.agentName,
    required this.emoji,
    required this.title,
    required this.message,
    required this.color,
    this.actionLabel,
    this.actionRoute,
  });
}
