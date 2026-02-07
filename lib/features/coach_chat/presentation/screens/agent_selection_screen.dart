import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class AgentSelectionScreen extends ConsumerWidget {
  const AgentSelectionScreen({super.key});

  static const _agents = [
    _AgentInfo(
      type: 'fitness',
      name: 'Fitness Coach',
      nameAr: 'مدرب اللياقة',
      emoji: '🏋️',
      description: 'Workouts, strain targets, recovery guidance',
      color: AppColors.agentFitness,
    ),
    _AgentInfo(
      type: 'nutrition',
      name: 'Nutrition Coach',
      nameAr: 'مدرب التغذية',
      emoji: '🍽️',
      description: 'Meals, macros, diet suggestions',
      color: AppColors.agentNutrition,
    ),
    _AgentInfo(
      type: 'health',
      name: 'Health Advisor',
      nameAr: 'مستشار الصحة',
      emoji: '🩺',
      description: 'Sleep, HRV, medications, health insights',
      color: AppColors.agentHealth,
    ),
    _AgentInfo(
      type: 'general',
      name: 'General Assistant',
      nameAr: 'المساعد العام',
      emoji: '🤖',
      description: 'Anything else — routes to the right specialist',
      color: AppColors.agentGeneral,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPaddingHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.lg),
              Text(
                'AI Coach',
                style: AppTypography.titleLarge.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Choose a specialist or let Smart Chat decide',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Smart Chat card
              _SmartChatCard(
                onTap: () => context.go('/agents/chat?context=smart'),
              ),
              const SizedBox(height: AppSpacing.lg),

              Text(
                'SPECIALISTS',
                style: AppTypography.sectionHeader,
              ),
              const SizedBox(height: AppSpacing.sm),

              // Agent grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSpacing.sm,
                  crossAxisSpacing: AppSpacing.sm,
                  childAspectRatio: 0.9,
                  children: _agents.map((agent) => _AgentCard(
                    agent: agent,
                    onTap: () => context.go('/agents/chat?context=agent:${agent.type}'),
                  )).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgentInfo {
  final String type;
  final String name;
  final String nameAr;
  final String emoji;
  final String description;
  final Color color;

  const _AgentInfo({
    required this.type,
    required this.name,
    required this.nameAr,
    required this.emoji,
    required this.description,
    required this.color,
  });
}

class _SmartChatCard extends StatelessWidget {
  final VoidCallback onTap;

  const _SmartChatCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary.withValues(alpha: 0.15),
                AppColors.accent.withValues(alpha: 0.15),
              ],
            ),
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: const Center(
                  child: Text('✨', style: TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Smart Chat',
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Auto-routes your message to the right specialist',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: AppColors.textTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgentCard extends StatelessWidget {
  final _AgentInfo agent;
  final VoidCallback onTap;

  const _AgentCard({
    required this.agent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
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
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: agent.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Center(
                  child: Text(agent.emoji, style: const TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                agent.name,
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                agent.nameAr,
                style: AppTypography.bodySmall.copyWith(
                  color: agent.color,
                  fontFamily: 'Cairo',
                ),
              ),
              const Spacer(),
              Text(
                agent.description,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
