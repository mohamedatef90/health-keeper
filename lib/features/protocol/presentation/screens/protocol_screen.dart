import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/database/database.dart';
import '../../../../core/providers/protocol_provider.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class ProtocolScreen extends ConsumerStatefulWidget {
  const ProtocolScreen({super.key});

  @override
  ConsumerState<ProtocolScreen> createState() => _ProtocolScreenState();
}

class _ProtocolScreenState extends ConsumerState<ProtocolScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const _categories = ['medication', 'activity', 'nutrition', 'sleep'];
  static const _categoryLabels = ['Medications', 'Activity', 'Nutrition', 'Sleep'];
  static const _categoryIcons = [
    Icons.medication_outlined,
    Icons.fitness_center_outlined,
    Icons.restaurant_outlined,
    Icons.bedtime_outlined,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceDark,
        title: const Text('My Protocol'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          tabs: List.generate(4, (i) => Tab(
            icon: Icon(_categoryIcons[i], size: 20),
            text: _categoryLabels[i],
          )),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(4, (i) => _ProtocolCategoryTab(
          category: _categories[i],
          label: _categoryLabels[i],
          icon: _categoryIcons[i],
        )),
      ),
    );
  }
}

class _ProtocolCategoryTab extends ConsumerWidget {
  final String category;
  final String label;
  final IconData icon;

  const _ProtocolCategoryTab({
    required this.category,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rulesAsync = ref.watch(protocolRulesByCategoryProvider(category));

    return rulesAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      error: (e, _) => Center(
        child: Text('Error: $e', style: const TextStyle(color: AppColors.error)),
      ),
      data: (rules) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${rules.length} $label',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _showAddDialog(context, ref),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.backgroundDark,
                  ),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: rules.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                    ),
                    itemCount: rules.length,
                    itemBuilder: (context, index) {
                      final rule = rules[index];
                      return _ProtocolRuleCard(
                        rule: rule,
                        onTap: () => _showEditDialog(context, ref, rule),
                        onToggle: (value) {
                          ref.read(protocolNotifierProvider.notifier)
                              .toggleActive(rule.id, value);
                        },
                        onDelete: () => _showDeleteDialog(context, ref, rule),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: AppColors.textHint),
          const SizedBox(height: AppSpacing.md),
          Text(
            'No $label rules',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Tap + to add your first rule',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textHint,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    _showRuleDialog(context, ref, null);
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, ProtocolRule rule) {
    _showRuleDialog(context, ref, rule);
  }

  void _showRuleDialog(BuildContext context, WidgetRef ref, ProtocolRule? rule) {
    final nameController = TextEditingController(text: rule?.name ?? '');
    final scheduleController = TextEditingController(
      text: rule != null ? _formatSchedule(rule.scheduleJson) : '',
    );
    final detailsController = TextEditingController(
      text: rule != null ? _formatDetails(rule.rulesJson) : '',
    );

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
              Text(
                rule == null ? 'Add $label Rule' : 'Edit $label Rule',
                style: AppTypography.titleLarge,
              ),
              const SizedBox(height: AppSpacing.lg),
              _buildTextField(nameController, 'Name', 'e.g. Mounjaro, Walking'),
              const SizedBox(height: AppSpacing.md),
              _buildTextField(scheduleController, 'Schedule', 'e.g. Daily at 9:00 AM, Monday & Friday'),
              const SizedBox(height: AppSpacing.md),
              _buildTextField(detailsController, 'Details', 'e.g. 5mg dosage, 30 min duration'),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final name = nameController.text.trim();
                    if (name.isEmpty) return;

                    final scheduleJson = jsonEncode({
                      'description': scheduleController.text.trim(),
                    });
                    final rulesJson = jsonEncode({
                      'details': detailsController.text.trim(),
                    });

                    if (rule == null) {
                      ref.read(protocolNotifierProvider.notifier).addRule(
                        category: category,
                        name: name,
                        scheduleJson: scheduleJson,
                        rulesJson: rulesJson,
                      );
                    } else {
                      ref.read(protocolNotifierProvider.notifier).updateRule(
                        id: rule.id,
                        category: category,
                        name: name,
                        scheduleJson: scheduleJson,
                        rulesJson: rulesJson,
                        isActive: rule.isActive,
                        createdAt: rule.createdAt,
                      );
                    }
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.backgroundDark,
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  ),
                  child: Text(rule == null ? 'Add Rule' : 'Save Changes'),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String hint) {
    return TextField(
      controller: controller,
      style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
        hintText: hint,
        hintStyle: AppTypography.bodySmall.copyWith(color: AppColors.textHint),
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
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }

  String _formatSchedule(String json) {
    try {
      final map = jsonDecode(json) as Map<String, dynamic>;
      return map['description'] as String? ?? json;
    } catch (_) {
      return json;
    }
  }

  String _formatDetails(String json) {
    try {
      final map = jsonDecode(json) as Map<String, dynamic>;
      return map['details'] as String? ?? json;
    } catch (_) {
      return json;
    }
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, ProtocolRule rule) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceDark,
        title: Text('Delete ${rule.name}?', style: const TextStyle(color: AppColors.textPrimary)),
        content: Text(
          'This will permanently remove this rule.',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(protocolNotifierProvider.notifier).deleteRule(rule.id);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class _ProtocolRuleCard extends StatelessWidget {
  final ProtocolRule rule;
  final VoidCallback onTap;
  final ValueChanged<bool> onToggle;
  final VoidCallback onDelete;

  const _ProtocolRuleCard({
    required this.rule,
    required this.onTap,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    String schedule = '';
    String details = '';
    try {
      final scheduleMap = jsonDecode(rule.scheduleJson) as Map<String, dynamic>;
      schedule = scheduleMap['description'] as String? ?? '';
    } catch (_) {
      schedule = rule.scheduleJson;
    }
    try {
      final rulesMap = jsonDecode(rule.rulesJson) as Map<String, dynamic>;
      details = rulesMap['details'] as String? ?? '';
    } catch (_) {
      details = rule.rulesJson;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(
          color: rule.isActive ? AppColors.borderDark : AppColors.borderDarkSubtle,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rule.name,
                        style: AppTypography.bodyLarge.copyWith(
                          color: rule.isActive
                              ? AppColors.textPrimary
                              : AppColors.textTertiary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (schedule.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          schedule,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                      if (details.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          details,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Switch(
                  value: rule.isActive,
                  onChanged: onToggle,
                  activeColor: AppColors.primary,
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  color: AppColors.textTertiary,
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
