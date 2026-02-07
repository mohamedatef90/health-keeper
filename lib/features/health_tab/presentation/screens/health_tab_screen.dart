import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/database/database.dart';
import '../../../../core/providers/protocol_provider.dart';
import '../../../../core/ui/components/section_card.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Health Tab - Protocol rules + daily logging + medication tracking
class HealthTabScreen extends ConsumerWidget {
  const HealthTabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rulesAsync = ref.watch(protocolRulesProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: Text(
          'Health',
          style: AppTypography.titleLarge.copyWith(color: AppColors.textPrimary),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: AppColors.textSecondary),
            onPressed: () => context.go('/health/protocol'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(protocolRulesProvider),
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

              // Protocol Rules
              Text('PROTOCOL RULES', style: AppTypography.sectionHeader),
              const SizedBox(height: AppSpacing.sm),
              rulesAsync.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
                error: (e, _) => SectionCard(
                  child: Text('Error loading rules', style: TextStyle(color: AppColors.error)),
                ),
                data: (rules) => _buildProtocolRulesSection(context, rules),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Today's Logging
              Text('TODAY\'S LOGGING', style: AppTypography.sectionHeader),
              const SizedBox(height: AppSpacing.sm),
              _buildLoggingSection(context),
              const SizedBox(height: AppSpacing.lg),

              // Medication Tracker
              Text('MEDICATION TRACKER', style: AppTypography.sectionHeader),
              const SizedBox(height: AppSpacing.sm),
              _buildMedicationTracker(),
              const SizedBox(height: AppSpacing.xxl + AppSpacing.bottomNavHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProtocolRulesSection(BuildContext context, List<ProtocolRule> rules) {
    if (rules.isEmpty) {
      return SectionCard(
        onTap: () => context.go('/health/protocol'),
        child: Row(
          children: [
            Icon(Icons.add_circle_outline, color: AppColors.primary),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Add your first protocol rule',
              style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      );
    }

    // Group by category
    final grouped = <String, List<ProtocolRule>>{};
    for (final rule in rules) {
      grouped.putIfAbsent(rule.category, () => []).add(rule);
    }

    return Column(
      children: grouped.entries.map((entry) {
        final categoryIcon = _getCategoryIcon(entry.key);
        final categoryColor = _getCategoryColor(entry.key);

        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.cardDark,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            border: Border.all(color: AppColors.borderDark),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md, AppSpacing.sm, AppSpacing.md, 0,
                ),
                child: Row(
                  children: [
                    Icon(categoryIcon, color: categoryColor, size: 18),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      entry.key.toUpperCase(),
                      style: AppTypography.labelSmall.copyWith(
                        color: categoryColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              ...entry.value.map((rule) {
                String schedule = '';
                try {
                  final map = jsonDecode(rule.scheduleJson) as Map<String, dynamic>;
                  schedule = map['description'] as String? ?? '';
                } catch (_) {}

                return ListTile(
                  dense: true,
                  title: Text(
                    rule.name,
                    style: AppTypography.bodyMedium.copyWith(
                      color: rule.isActive ? AppColors.textPrimary : AppColors.textTertiary,
                    ),
                  ),
                  subtitle: schedule.isNotEmpty
                      ? Text(
                          schedule,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        )
                      : null,
                  trailing: Container(
                    width: 8, height: 8,
                    decoration: BoxDecoration(
                      color: rule.isActive ? AppColors.success : AppColors.textHint,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLoggingSection(BuildContext context) {
    return SectionCard(
      child: Column(
        children: [
          _LoggingRow(
            icon: Icons.monitor_weight_outlined,
            label: 'Weight',
            value: 'Not logged',
            color: AppColors.recovery,
            onTap: () {},
          ),
          const Divider(color: AppColors.borderDark, height: 1),
          _LoggingRow(
            icon: Icons.restaurant_outlined,
            label: 'Meals',
            value: '0 logged',
            color: AppColors.calories,
            onTap: () => context.go('/health/meal-log'),
          ),
          const Divider(color: AppColors.borderDark, height: 1),
          _LoggingRow(
            icon: Icons.fitness_center_outlined,
            label: 'Workouts',
            value: '0 logged',
            color: AppColors.strain,
            onTap: () => context.go('/health/workout-log'),
          ),
          const Divider(color: AppColors.borderDark, height: 1),
          _LoggingRow(
            icon: Icons.edit_note_outlined,
            label: 'Journal',
            value: 'Not logged',
            color: AppColors.sleep,
            onTap: () => context.go('/health/journal'),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationTracker() {
    return SectionCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: const Icon(Icons.medication, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mounjaro',
                  style: AppTypography.bodyLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Next scheduled: Sunday',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: false,
            onChanged: (v) {},
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'medication': return Icons.medication_outlined;
      case 'activity': return Icons.fitness_center_outlined;
      case 'nutrition': return Icons.restaurant_outlined;
      case 'sleep': return Icons.bedtime_outlined;
      default: return Icons.rule_outlined;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'medication': return AppColors.primary;
      case 'activity': return AppColors.strain;
      case 'nutrition': return AppColors.calories;
      case 'sleep': return AppColors.sleep;
      default: return AppColors.textSecondary;
    }
  }
}

class _LoggingRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const _LoggingRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
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
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              const Icon(Icons.chevron_right, color: AppColors.textTertiary, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
