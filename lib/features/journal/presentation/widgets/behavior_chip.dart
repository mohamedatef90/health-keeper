import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../domain/entities/journal_behavior.dart';
import '../../domain/entities/journal_entry.dart';

/// A chip widget for displaying and interacting with journal behaviors
class BehaviorChip extends StatelessWidget {
  final JournalBehavior behavior;
  final bool isSelected;
  final LoggedBehavior? loggedBehavior;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool showValue;

  const BehaviorChip({
    super.key,
    required this.behavior,
    this.isSelected = false,
    this.loggedBehavior,
    this.onTap,
    this.onLongPress,
    this.showValue = true,
  });

  @override
  Widget build(BuildContext context) {
    final categoryColor = behavior.category.color;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? categoryColor.withOpacity(0.2)
                : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            border: Border.all(
              color: isSelected ? categoryColor : AppColors.divider,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getIconData(),
                size: 18,
                color: isSelected ? categoryColor : AppColors.textSecondary,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                behavior.name,
                style: AppTypography.labelMedium.copyWith(
                  color: isSelected ? categoryColor : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              if (showValue && loggedBehavior != null) ...[
                const SizedBox(width: AppSpacing.xs),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: categoryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Text(
                    loggedBehavior!.displayValue,
                    style: AppTypography.labelSmall.copyWith(
                      color: categoryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
              if (isSelected && loggedBehavior == null) ...[
                const SizedBox(width: AppSpacing.xs),
                Icon(
                  Icons.check_circle,
                  size: 16,
                  color: categoryColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconData() {
    // Try to map icon string to IconData
    switch (behavior.icon) {
      case 'coffee':
        return Icons.coffee;
      case 'wine_bar':
        return Icons.wine_bar;
      case 'cake':
        return Icons.cake;
      case 'fastfood':
        return Icons.fastfood;
      case 'water_drop':
        return Icons.water_drop;
      case 'schedule':
        return Icons.schedule;
      case 'timer':
        return Icons.timer;
      case 'eco':
        return Icons.eco;
      case 'egg':
        return Icons.egg;
      case 'phone_android':
        return Icons.phone_android;
      case 'thermostat':
        return Icons.thermostat;
      case 'airline_seat_flat':
        return Icons.airline_seat_flat;
      case 'nights_stay':
        return Icons.nights_stay;
      case 'visibility':
        return Icons.visibility;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'directions_run':
        return Icons.directions_run;
      case 'self_improvement':
        return Icons.self_improvement;
      case 'directions_walk':
        return Icons.directions_walk;
      case 'speed':
        return Icons.speed;
      case 'pool':
        return Icons.pool;
      case 'pedal_bike':
        return Icons.pedal_bike;
      case 'weekend':
        return Icons.weekend;
      case 'ac_unit':
        return Icons.ac_unit;
      case 'hot_tub':
        return Icons.hot_tub;
      case 'back_hand':
        return Icons.back_hand;
      case 'air':
        return Icons.air;
      case 'wb_sunny':
        return Icons.wb_sunny;
      case 'edit_note':
        return Icons.edit_note;
      case 'volunteer_activism':
        return Icons.volunteer_activism;
      case 'sports_gymnastics':
        return Icons.sports_gymnastics;
      case 'battery_alert':
        return Icons.battery_alert;
      case 'accessibility_new':
        return Icons.accessibility_new;
      case 'psychology':
        return Icons.psychology;
      case 'mood':
        return Icons.mood;
      case 'sentiment_stressed':
        return Icons.sentiment_dissatisfied;
      case 'psychology_alt':
        return Icons.psychology_alt;
      case 'sick':
        return Icons.sick;
      case 'elderly':
        return Icons.elderly;
      case 'masks':
        return Icons.masks;
      case 'medication':
        return Icons.medication;
      case 'water':
        return Icons.water;
      case 'blender':
        return Icons.blender;
      case 'bolt':
        return Icons.bolt;
      case 'bedtime':
        return Icons.bedtime;
      case 'biotech':
        return Icons.biotech;
      case 'flash_on':
        return Icons.flash_on;
      case 'healing':
        return Icons.healing;
      case 'local_pharmacy':
        return Icons.local_pharmacy;
      case 'medical_services':
        return Icons.medical_services;
      case 'circle':
        return Icons.circle;
      case 'sentiment_dissatisfied':
        return Icons.sentiment_dissatisfied;
      case 'expand':
        return Icons.expand;
      case 'mood_bad':
        return Icons.mood_bad;
      case 'groups':
        return Icons.groups;
      case 'favorite':
        return Icons.favorite;
      case 'person_off':
        return Icons.person_off;
      case 'palette':
        return Icons.palette;
      case 'school':
        return Icons.school;
      case 'devices':
        return Icons.devices;
      default:
        return behavior.category.icon;
    }
  }
}

/// A selectable grid of behavior chips
class BehaviorChipGrid extends StatelessWidget {
  final List<JournalBehavior> behaviors;
  final Set<String> selectedBehaviorIds;
  final Map<String, LoggedBehavior> loggedBehaviors;
  final Function(JournalBehavior)? onBehaviorTap;
  final Function(JournalBehavior)? onBehaviorLongPress;

  const BehaviorChipGrid({
    super.key,
    required this.behaviors,
    this.selectedBehaviorIds = const {},
    this.loggedBehaviors = const {},
    this.onBehaviorTap,
    this.onBehaviorLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: behaviors.map((behavior) {
        final isSelected = selectedBehaviorIds.contains(behavior.id);
        final loggedBehavior = loggedBehaviors[behavior.id];

        return BehaviorChip(
          behavior: behavior,
          isSelected: isSelected || loggedBehavior != null,
          loggedBehavior: loggedBehavior,
          onTap: onBehaviorTap != null ? () => onBehaviorTap!(behavior) : null,
          onLongPress: onBehaviorLongPress != null
              ? () => onBehaviorLongPress!(behavior)
              : null,
        );
      }).toList(),
    );
  }
}

/// Category header with expandable behavior chips
class BehaviorCategorySection extends StatelessWidget {
  final BehaviorCategory category;
  final List<JournalBehavior> behaviors;
  final Set<String> selectedBehaviorIds;
  final Map<String, LoggedBehavior> loggedBehaviors;
  final Function(JournalBehavior)? onBehaviorTap;
  final bool isExpanded;
  final VoidCallback? onExpandToggle;

  const BehaviorCategorySection({
    super.key,
    required this.category,
    required this.behaviors,
    this.selectedBehaviorIds = const {},
    this.loggedBehaviors = const {},
    this.onBehaviorTap,
    this.isExpanded = true,
    this.onExpandToggle,
  });

  @override
  Widget build(BuildContext context) {
    final loggedCount = behaviors.where(
      (b) => selectedBehaviorIds.contains(b.id) || loggedBehaviors.containsKey(b.id),
    ).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onExpandToggle,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: category.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Icon(
                    category.icon,
                    color: category.color,
                    size: 18,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    category.displayName,
                    style: AppTypography.titleSmall.copyWith(
                      color: category.color,
                    ),
                  ),
                ),
                if (loggedCount > 0) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: category.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                    ),
                    child: Text(
                      '$loggedCount',
                      style: AppTypography.labelSmall.copyWith(
                        color: category.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                ],
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) ...[
          const SizedBox(height: AppSpacing.xs),
          BehaviorChipGrid(
            behaviors: behaviors,
            selectedBehaviorIds: selectedBehaviorIds,
            loggedBehaviors: loggedBehaviors,
            onBehaviorTap: onBehaviorTap,
          ),
        ],
      ],
    );
  }
}

/// Input dialog for behavior value entry
class BehaviorInputDialog extends StatefulWidget {
  final JournalBehavior behavior;
  final LoggedBehavior? existingBehavior;

  const BehaviorInputDialog({
    super.key,
    required this.behavior,
    this.existingBehavior,
  });

  @override
  State<BehaviorInputDialog> createState() => _BehaviorInputDialogState();
}

class _BehaviorInputDialogState extends State<BehaviorInputDialog> {
  late TextEditingController _valueController;
  late TextEditingController _noteController;
  int? _intensity;
  int? _duration;
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _valueController = TextEditingController(
      text: widget.existingBehavior?.value?.toString() ??
            widget.behavior.defaultValue?.toString() ?? '',
    );
    _noteController = TextEditingController(
      text: widget.existingBehavior?.note ?? '',
    );
    _intensity = widget.existingBehavior?.intensity;
    _duration = widget.existingBehavior?.durationMinutes;

    if (widget.behavior.inputType == BehaviorInputType.options &&
        widget.existingBehavior?.customDataJson != null) {
      _selectedOption = widget.existingBehavior!.customDataJson;
    }
  }

  @override
  void dispose() {
    _valueController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryColor = widget.behavior.category.color;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: categoryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Icon(
                    widget.behavior.category.icon,
                    color: categoryColor,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.behavior.name,
                        style: AppTypography.titleMedium,
                      ),
                      if (widget.behavior.description != null)
                        Text(
                          widget.behavior.description!,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            _buildInputWidget(),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Note (optional)',
                hintText: 'Add a note...',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: AppSpacing.sm),
                ElevatedButton(
                  onPressed: _onSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: categoryColor,
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputWidget() {
    switch (widget.behavior.inputType) {
      case BehaviorInputType.toggle:
        return const SizedBox.shrink();

      case BehaviorInputType.numeric:
        return TextField(
          controller: _valueController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: 'Value',
            suffixText: widget.behavior.unit,
            border: const OutlineInputBorder(),
          ),
        );

      case BehaviorInputType.duration:
        return TextField(
          controller: _valueController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Duration',
            suffixText: 'minutes',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            _duration = int.tryParse(value);
          },
        );

      case BehaviorInputType.intensity:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Intensity', style: AppTypography.labelMedium),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                final level = index + 1;
                final isSelected = _intensity == level;
                return GestureDetector(
                  onTap: () => setState(() => _intensity = level),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? widget.behavior.category.color
                          : AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                      border: Border.all(
                        color: isSelected
                            ? widget.behavior.category.color
                            : AppColors.divider,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$level',
                        style: AppTypography.titleMedium.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        );

      case BehaviorInputType.time:
        return TextField(
          controller: _valueController,
          readOnly: true,
          decoration: const InputDecoration(
            labelText: 'Time',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.access_time),
          ),
          onTap: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (time != null) {
              _valueController.text = time.format(context);
            }
          },
        );

      case BehaviorInputType.options:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Option', style: AppTypography.labelMedium),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: widget.behavior.options.map((option) {
                final isSelected = _selectedOption == option;
                return ChoiceChip(
                  label: Text(option),
                  selected: isSelected,
                  selectedColor: widget.behavior.category.color.withOpacity(0.2),
                  onSelected: (selected) {
                    setState(() {
                      _selectedOption = selected ? option : null;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        );
    }
  }

  void _onSave() {
    double? value;
    int? duration;
    int? intensity;
    String? customData;

    switch (widget.behavior.inputType) {
      case BehaviorInputType.toggle:
        // No value needed
        break;
      case BehaviorInputType.numeric:
        value = double.tryParse(_valueController.text);
        break;
      case BehaviorInputType.duration:
        duration = int.tryParse(_valueController.text);
        break;
      case BehaviorInputType.intensity:
        intensity = _intensity;
        break;
      case BehaviorInputType.time:
        customData = _valueController.text;
        break;
      case BehaviorInputType.options:
        customData = _selectedOption;
        break;
    }

    Navigator.pop(context, {
      'value': value,
      'unit': widget.behavior.unit,
      'intensity': intensity,
      'durationMinutes': duration,
      'note': _noteController.text.isEmpty ? null : _noteController.text,
      'customDataJson': customData,
    });
  }
}
