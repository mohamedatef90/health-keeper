import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/domain/entities/protocol.dart' as protocol;
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class AddSupplementDialog extends StatefulWidget {
  final protocol.Supplement? supplement; // For editing existing supplement

  const AddSupplementDialog({super.key, this.supplement});

  @override
  State<AddSupplementDialog> createState() => _AddSupplementDialogState();
}

class _AddSupplementDialogState extends State<AddSupplementDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _dosageController;
  late TextEditingController _notesController;
  late protocol.SupplementFrequency _frequency;
  late List<protocol.TimeOfDay> _times;
  late bool _withMeals;
  late bool _remindersEnabled;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.supplement?.name ?? '');
    _dosageController = TextEditingController(text: widget.supplement?.dosage ?? '');
    _notesController = TextEditingController(text: widget.supplement?.notes ?? '');
    _frequency = widget.supplement?.frequency ?? protocol.SupplementFrequency.daily;
    _times = widget.supplement?.times.toList() ?? [];
    _withMeals = widget.supplement?.withMeals ?? false;
    _remindersEnabled = widget.supplement?.remindersEnabled ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String _getFrequencyText(protocol.SupplementFrequency freq) {
    switch (freq) {
      case protocol.SupplementFrequency.daily:
        return 'Daily';
      case protocol.SupplementFrequency.twiceDaily:
        return 'Twice Daily';
      case protocol.SupplementFrequency.threeTimesDaily:
        return 'Three Times Daily';
      case protocol.SupplementFrequency.withMeals:
        return 'With Meals';
      case protocol.SupplementFrequency.asNeeded:
        return 'As Needed';
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _times.add(protocol.TimeOfDay(hour: picked.hour, minute: picked.minute));
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final supplement = protocol.Supplement(
        id: widget.supplement?.id ?? const Uuid().v4(),
        name: _nameController.text.trim(),
        dosage: _dosageController.text.trim(),
        frequency: _frequency,
        times: _times,
        withMeals: _withMeals,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        remindersEnabled: _remindersEnabled,
        isActive: widget.supplement?.isActive ?? true,
      );
      Navigator.of(context).pop(supplement);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surfaceDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.supplement == null ? 'Add Supplement' : 'Edit Supplement',
                  style: AppTypography.titleLarge.copyWith(
                    color: AppColors.textPrimaryDark,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Supplement Name',
                    hintText: 'e.g., Vitamin D',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter supplement name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _dosageController,
                  decoration: const InputDecoration(
                    labelText: 'Dosage',
                    hintText: 'e.g., 1000 IU',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter dosage';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                DropdownButtonFormField<protocol.SupplementFrequency>(
                  initialValue: _frequency,
                  decoration: const InputDecoration(
                    labelText: 'Frequency',
                  ),
                  dropdownColor: AppColors.surfaceDark,
                  items: protocol.SupplementFrequency.values.map((freq) {
                    return DropdownMenuItem(
                      value: freq,
                      child: Text(_getFrequencyText(freq)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _frequency = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Times',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.textSecondaryDark,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: AppColors.primary),
                      onPressed: _selectTime,
                    ),
                  ],
                ),
                if (_times.isNotEmpty)
                  Wrap(
                    spacing: AppSpacing.sm,
                    children: _times.asMap().entries.map((entry) {
                      final idx = entry.key;
                      final time = entry.value;
                      return Chip(
                        label: Text(
                          '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                        ),
                        deleteIcon: const Icon(Icons.close, size: 16),
                        onDeleted: () {
                          setState(() {
                            _times.removeAt(idx);
                          });
                        },
                      );
                    }).toList(),
                  ),
                const SizedBox(height: AppSpacing.md),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Take With Meals'),
                  subtitle: Text(
                    'Better absorption with food',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                  value: _withMeals,
                  onChanged: (value) {
                    setState(() {
                      _withMeals = value;
                    });
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notes (Optional)',
                    hintText: 'e.g., Take in the morning',
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: AppSpacing.md),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Enable Reminders'),
                  value: _remindersEnabled,
                  onChanged: (value) {
                    setState(() {
                      _remindersEnabled = value;
                    });
                  },
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    ElevatedButton(
                      onPressed: _save,
                      child: Text(widget.supplement == null ? 'Add' : 'Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
