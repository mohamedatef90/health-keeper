import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../data/repositories/journal_repository.dart';
import '../../domain/entities/journal_behavior.dart';
import '../../domain/entities/journal_entry.dart';
import '../widgets/behavior_chip.dart';

class JournalScreen extends ConsumerStatefulWidget {
  final DateTime? initialDate;

  const JournalScreen({
    super.key,
    this.initialDate,
  });

  @override
  ConsumerState<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends ConsumerState<JournalScreen> {
  late DateTime _selectedDate;
  final Map<BehaviorCategory, bool> _expandedCategories = {};
  String? _searchQuery;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();

    // Expand all categories by default
    for (final category in BehaviorCategory.values) {
      _expandedCategories[category] = true;
    }

    // Load entry for selected date
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(journalEntryNotifierProvider.notifier).loadEntry(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final entryState = ref.watch(journalEntryNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _selectDate,
          ),
        ],
      ),
      body: Column(
        children: [
          // Date selector header
          _buildDateHeader(),

          // Main content
          Expanded(
            child: entryState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : entryState.error != null
                    ? _buildErrorState(entryState.error!)
                    : _buildContent(entryState.entry),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showQuickAddSheet(context),
        icon: const Icon(Icons.add),
        label: const Text('Quick Add'),
      ),
    );
  }

  Widget _buildDateHeader() {
    final isToday = _isToday(_selectedDate);
    final dateFormat = DateFormat('EEEE, MMMM d');

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      color: AppColors.surfaceLight,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => _changeDate(-1),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  isToday ? 'Today' : dateFormat.format(_selectedDate),
                  style: AppTypography.titleMedium,
                ),
                if (!isToday)
                  Text(
                    DateFormat.yMd().format(_selectedDate),
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: _canGoForward() ? () => _changeDate(1) : null,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.error.withOpacity(0.5),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Failed to load journal',
            style: AppTypography.titleMedium,
          ),
          Text(
            error,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          ElevatedButton(
            onPressed: () {
              ref.read(journalEntryNotifierProvider.notifier).loadEntry(_selectedDate);
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(JournalEntry? entry) {
    final loggedBehaviors = <String, LoggedBehavior>{};
    if (entry != null) {
      for (final behavior in entry.behaviors) {
        loggedBehaviors[behavior.behaviorId] = behavior;
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick summary
          if (entry != null && entry.behaviors.isNotEmpty)
            _buildSummaryCard(entry),

          // Mood and Stress quick input
          _buildMoodStressSection(entry),

          const SizedBox(height: AppSpacing.md),

          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search behaviors...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value.isEmpty ? null : value.toLowerCase();
              });
            },
          ),

          const SizedBox(height: AppSpacing.lg),

          // Behavior categories
          ...BehaviorCategory.values.map((category) {
            final behaviors = JournalBehaviors.getByCategory(category);
            final filteredBehaviors = _searchQuery != null
                ? behaviors.where((b) =>
                    b.name.toLowerCase().contains(_searchQuery!) ||
                    (b.description?.toLowerCase().contains(_searchQuery!) ?? false))
                    .toList()
                : behaviors;

            if (filteredBehaviors.isEmpty) return const SizedBox.shrink();

            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: BehaviorCategorySection(
                category: category,
                behaviors: filteredBehaviors,
                loggedBehaviors: loggedBehaviors,
                isExpanded: _expandedCategories[category] ?? true,
                onExpandToggle: () {
                  setState(() {
                    _expandedCategories[category] =
                        !(_expandedCategories[category] ?? true);
                  });
                },
                onBehaviorTap: (behavior) => _onBehaviorTap(behavior, loggedBehaviors),
              ),
            );
          }),

          const SizedBox(height: 80), // Space for FAB
        ],
      ),
    );
  }

  Widget _buildSummaryCard(JournalEntry entry) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.summarize,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Today\'s Summary',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '${entry.behaviors.length} behaviors logged',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: entry.behaviors.take(5).map((logged) {
                final behavior = JournalBehaviors.getById(logged.behaviorId);
                if (behavior == null) return const SizedBox.shrink();

                return Chip(
                  avatar: Icon(
                    behavior.category.icon,
                    size: 16,
                    color: behavior.category.color,
                  ),
                  label: Text(
                    behavior.name,
                    style: AppTypography.labelSmall,
                  ),
                  backgroundColor: behavior.category.color.withOpacity(0.1),
                  side: BorderSide.none,
                  padding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              }).toList(),
            ),
            if (entry.behaviors.length > 5)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Text(
                  '+${entry.behaviors.length - 5} more',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.textHint,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodStressSection(JournalEntry? entry) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How are you feeling?',
              style: AppTypography.titleSmall,
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _buildMoodPicker(
                    label: 'Mood',
                    value: entry?.moodLevel,
                    onChanged: (value) {
                      ref.read(journalEntryNotifierProvider.notifier).updateMood(value);
                    },
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _buildMoodPicker(
                    label: 'Stress',
                    value: entry?.stressLevel,
                    onChanged: (value) {
                      ref.read(journalEntryNotifierProvider.notifier).updateStress(value);
                    },
                    isStress: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodPicker({
    required String label,
    int? value,
    required Function(int?) onChanged,
    bool isStress = false,
  }) {
    final icons = isStress
        ? [Icons.sentiment_very_satisfied, Icons.sentiment_satisfied, Icons.sentiment_neutral, Icons.sentiment_dissatisfied, Icons.sentiment_very_dissatisfied]
        : [Icons.sentiment_very_dissatisfied, Icons.sentiment_dissatisfied, Icons.sentiment_neutral, Icons.sentiment_satisfied, Icons.sentiment_very_satisfied];

    final colors = isStress
        ? [AppColors.recoveryExcellent, AppColors.recoveryGood, AppColors.recoveryModerate, AppColors.recoveryLow, AppColors.recoveryPoor]
        : [AppColors.recoveryPoor, AppColors.recoveryLow, AppColors.recoveryModerate, AppColors.recoveryGood, AppColors.recoveryExcellent];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelMedium,
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            final level = index + 1;
            final isSelected = value == level;

            return GestureDetector(
              onTap: () => onChanged(isSelected ? null : level),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected ? colors[index].withOpacity(0.2) : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  border: Border.all(
                    color: isSelected ? colors[index] : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Icon(
                  icons[index],
                  color: isSelected ? colors[index] : AppColors.textHint,
                  size: 24,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Future<void> _onBehaviorTap(
    JournalBehavior behavior,
    Map<String, LoggedBehavior> loggedBehaviors,
  ) async {
    final existingBehavior = loggedBehaviors[behavior.id];
    final notifier = ref.read(journalEntryNotifierProvider.notifier);

    // If already logged and it's a toggle, remove it
    if (existingBehavior != null && behavior.inputType == BehaviorInputType.toggle) {
      notifier.removeBehavior(existingBehavior.id);
      return;
    }

    // If it's a toggle and not logged, add it directly
    if (behavior.inputType == BehaviorInputType.toggle && existingBehavior == null) {
      notifier.addBehavior(behaviorId: behavior.id);
      return;
    }

    // For other input types, show the dialog
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => BehaviorInputDialog(
        behavior: behavior,
        existingBehavior: existingBehavior,
      ),
    );

    if (result != null) {
      if (existingBehavior != null) {
        // Remove old and add new (simpler than updating)
        await notifier.removeBehavior(existingBehavior.id);
      }

      notifier.addBehavior(
        behaviorId: behavior.id,
        value: result['value'] as double?,
        unit: result['unit'] as String?,
        intensity: result['intensity'] as int?,
        durationMinutes: result['durationMinutes'] as int?,
        note: result['note'] as String?,
      );
    }
  }

  void _showQuickAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) => _QuickAddSheet(
          scrollController: scrollController,
          onBehaviorSelected: (behavior) {
            Navigator.pop(context);
            final loggedBehaviors = <String, LoggedBehavior>{};
            final entry = ref.read(journalEntryNotifierProvider).entry;
            if (entry != null) {
              for (final b in entry.behaviors) {
                loggedBehaviors[b.behaviorId] = b;
              }
            }
            _onBehaviorTap(behavior, loggedBehaviors);
          },
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      ref.read(journalEntryNotifierProvider.notifier).loadEntry(_selectedDate);
    }
  }

  void _changeDate(int days) {
    final newDate = _selectedDate.add(Duration(days: days));
    if (newDate.isAfter(DateTime.now())) return;

    setState(() {
      _selectedDate = newDate;
    });
    ref.read(journalEntryNotifierProvider.notifier).loadEntry(_selectedDate);
  }

  bool _canGoForward() {
    return !_isToday(_selectedDate);
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}

/// Quick add bottom sheet with popular behaviors
class _QuickAddSheet extends StatelessWidget {
  final ScrollController scrollController;
  final Function(JournalBehavior) onBehaviorSelected;

  const _QuickAddSheet({
    required this.scrollController,
    required this.onBehaviorSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Popular/frequently used behaviors
    final popularBehaviors = [
      JournalBehaviors.caffeine,
      JournalBehaviors.hydration,
      JournalBehaviors.strengthTraining,
      JournalBehaviors.cardio,
      JournalBehaviors.meditation,
      JournalBehaviors.fatigue,
      JournalBehaviors.mood,
      JournalBehaviors.stress,
      JournalBehaviors.alcohol,
      JournalBehaviors.lateScreenTime,
      JournalBehaviors.soreness,
      JournalBehaviors.coldExposure,
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Row(
              children: [
                Text(
                  'Quick Add',
                  style: AppTypography.titleLarge,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Text(
              'Popular Behaviors',
              style: AppTypography.titleSmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: popularBehaviors.map((behavior) {
                    return BehaviorChip(
                      behavior: behavior,
                      onTap: () => onBehaviorSelected(behavior),
                      showValue: false,
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  'All Categories',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                ...BehaviorCategory.values.map((category) {
                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: category.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                      ),
                      child: Icon(
                        category.icon,
                        color: category.color,
                      ),
                    ),
                    title: Text(category.displayName),
                    subtitle: Text(
                      '${JournalBehaviors.getByCategory(category).length} behaviors',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pop(context);
                      // Could navigate to category-specific screen
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
