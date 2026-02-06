import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/data/database/database.dart';

/// Protocol Settings Screen - View & Edit User Protocol
/// 
/// Shows: Mounjaro schedule, Football days, Eating window, etc.
class ProtocolSettingsScreen extends ConsumerStatefulWidget {
  const ProtocolSettingsScreen({super.key});

  @override
  ConsumerState<ProtocolSettingsScreen> createState() =>
      _ProtocolSettingsScreenState();
}

class _ProtocolSettingsScreenState
    extends ConsumerState<ProtocolSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: _buildAppBar(),
      body: FutureBuilder<List<ProtocolRule>>(
        future: _loadProtocolRules(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.alert,
                ),
              ),
            );
          }

          final rules = snapshot.data ?? [];
          if (rules.isEmpty) {
            return _buildEmptyState();
          }

          return _buildRulesList(rules);
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.surfaceDark.withValues(alpha: 0.9),
      elevation: 0,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withValues(alpha: 0.1),
                  AppColors.surfaceDark.withValues(alpha: 0.9),
                ],
              ),
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Protocol Settings',
        style: AppTypography.titleLarge.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.2),
                  AppColors.accent.withValues(alpha: 0.2),
                ],
              ),
            ),
            child: const Icon(
              Icons.rule_outlined,
              size: 64,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'No Protocol Rules',
            style: AppTypography.titleLarge.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Protocol rules will be seeded on first launch',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRulesList(List<ProtocolRule> rules) {
    // Group rules by category
    final grouped = <String, List<ProtocolRule>>{};
    for (final rule in rules) {
      grouped.putIfAbsent(rule.category, () => []).add(rule);
    }

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        // Intro card
        _buildIntroCard(),
        const SizedBox(height: AppSpacing.lg),

        // Medication rules
        if (grouped.containsKey('medication')) ...[
          _buildCategoryHeader('💉 Medication'),
          ...grouped['medication']!.map((rule) => _buildRuleCard(rule)),
          const SizedBox(height: AppSpacing.md),
        ],

        // Activity rules
        if (grouped.containsKey('activity')) ...[
          _buildCategoryHeader('⚽ Activities'),
          ...grouped['activity']!.map((rule) => _buildRuleCard(rule)),
          const SizedBox(height: AppSpacing.md),
        ],

        // Nutrition rules
        if (grouped.containsKey('nutrition')) ...[
          _buildCategoryHeader('🍽️ Nutrition'),
          ...grouped['nutrition']!.map((rule) => _buildRuleCard(rule)),
          const SizedBox(height: AppSpacing.md),
        ],

        // Sleep rules
        if (grouped.containsKey('sleep')) ...[
          _buildCategoryHeader('😴 Sleep'),
          ...grouped['sleep']!.map((rule) => _buildRuleCard(rule)),
        ],
      ],
    );
  }

  Widget _buildIntroCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.2),
            AppColors.accent.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(AppSpacing.md),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                color: AppColors.primary,
                size: 24,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'What is Protocol?',
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Your protocol defines routines and rules that AI agents follow when giving advice. '
            'Set your medication schedule, activity days, eating window, and more.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.sm,
        bottom: AppSpacing.sm,
      ),
      child: Text(
        title,
        style: AppTypography.titleMedium.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildRuleCard(ProtocolRule rule) {
    final schedule = _parseSchedule(rule.scheduleJson);
    final rulesData = _parseRules(rule.rulesJson);

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        border: Border.all(
          color: rule.isActive
              ? AppColors.primary.withValues(alpha: 0.3)
              : AppColors.textSecondary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Expanded(
                child: Text(
                  _formatRuleName(rule.name),
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: rule.isActive
                      ? AppColors.primary.withValues(alpha: 0.2)
                      : AppColors.textSecondary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                ),
                child: Text(
                  rule.isActive ? 'Active' : 'Inactive',
                  style: AppTypography.bodySmall.copyWith(
                    color: rule.isActive
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),

          // Schedule info
          if (schedule.isNotEmpty) ...[
            _buildInfoRow(
              Icons.schedule,
              'Schedule',
              _formatSchedule(schedule),
            ),
            const SizedBox(height: AppSpacing.xs),
          ],

          // Rules info
          if (rulesData.isNotEmpty)
            ...rulesData.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: _buildInfoRow(
                  Icons.info_outline,
                  entry.key,
                  entry.value.toString(),
                ),
              );
            }),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: AppSpacing.xs),
        Text(
          '$label:',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(
            value,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================================================
  // HELPERS
  // ==========================================================================

  Future<List<ProtocolRule>> _loadProtocolRules() async {
    final db = ref.read(databaseProvider);
    return await db.getAllProtocolRules(activeOnly: false);
  }

  Map<String, dynamic> _parseSchedule(String? json) {
    if (json == null || json.isEmpty) return {};
    try {
      return jsonDecode(json) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }

  Map<String, dynamic> _parseRules(String? json) {
    if (json == null || json.isEmpty) return {};
    try {
      return jsonDecode(json) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }

  String _formatRuleName(String name) {
    return name
        .split('-')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  String _formatSchedule(Map<String, dynamic> schedule) {
    if (schedule.containsKey('days')) {
      final days = (schedule['days'] as List).join(', ');
      final time = schedule['time'] ?? '';
      return '$days @ $time';
    }
    if (schedule.containsKey('start') && schedule.containsKey('end')) {
      return '${schedule['start']} - ${schedule['end']}';
    }
    return schedule.toString();
  }
}
