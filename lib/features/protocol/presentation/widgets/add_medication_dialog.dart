import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/domain/entities/protocol.dart' as protocol;
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class AddMedicationDialog extends StatefulWidget {
  final protocol.Medication? medication; // For editing existing medication

  const AddMedicationDialog({super.key, this.medication});

  @override
  State<AddMedicationDialog> createState() => _AddMedicationDialogState();
}

class _AddMedicationDialogState extends State<AddMedicationDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _dosageController;
  late TextEditingController _notesController;
  late protocol.MedicationFrequency _frequency;
  late List<protocol.TimeOfDay> _times;
  late DateTime _startDate;
  DateTime? _endDate;
  late bool _remindersEnabled;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.medication?.name ?? '');
    _dosageController = TextEditingController(text: widget.medication?.dosage ?? '');
    _notesController = TextEditingController(text: widget.medication?.notes ?? '');
    _frequency = widget.medication?.frequency ?? protocol.MedicationFrequency.daily;
    _times = widget.medication?.times.toList() ?? [];
    _startDate = widget.medication?.startDate ?? DateTime.now();
    _endDate = widget.medication?.endDate;
    _remindersEnabled = widget.medication?.remindersEnabled ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String _getFrequencyText(protocol.MedicationFrequency freq) {
    switch (freq) {
      case protocol.MedicationFrequency.daily:
        return 'Daily';
      case protocol.MedicationFrequency.twiceDaily:
        return 'Twice Daily';
      case protocol.MedicationFrequency.weekly:
        return 'Weekly';
      case protocol.MedicationFrequency.biWeekly:
        return 'Every 2 Weeks';
      case protocol.MedicationFrequency.monthly:
        return 'Monthly';
      case protocol.MedicationFrequency.asNeeded:
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

  Future<void> _selectStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now().add(const Duration(days: 30)),
      firstDate: _startDate,
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final medication = protocol.Medication(
        id: widget.medication?.id ?? const Uuid().v4(),
        name: _nameController.text.trim(),
        dosage: _dosageController.text.trim(),
        frequency: _frequency,
        times: _times,
        startDate: _startDate,
        endDate: _endDate,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        remindersEnabled: _remindersEnabled,
        isActive: widget.medication?.isActive ?? true,
      );
      Navigator.of(context).pop(medication);
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
                  widget.medication == null ? 'Add Medication' : 'Edit Medication',
                  style: AppTypography.titleLarge.copyWith(
                    color: AppColors.textPrimaryDark,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Medication Name',
                    hintText: 'e.g., Metformin',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter medication name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _dosageController,
                  decoration: const InputDecoration(
                    labelText: 'Dosage',
                    hintText: 'e.g., 500mg',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter dosage';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                DropdownButtonFormField<protocol.MedicationFrequency>(
                  initialValue: _frequency,
                  decoration: const InputDecoration(
                    labelText: 'Frequency',
                  ),
                  dropdownColor: AppColors.surfaceDark,
                  items: protocol.MedicationFrequency.values.map((freq) {
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
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Start Date'),
                  subtitle: Text(
                    '${_startDate.day}/${_startDate.month}/${_startDate.year}',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                  trailing: const Icon(Icons.calendar_today, color: AppColors.primary),
                  onTap: _selectStartDate,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('End Date (Optional)'),
                  subtitle: Text(
                    _endDate != null
                        ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                        : 'No end date',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_endDate != null)
                        IconButton(
                          icon: const Icon(Icons.clear, color: AppColors.error),
                          onPressed: () {
                            setState(() {
                              _endDate = null;
                            });
                          },
                        ),
                      const Icon(Icons.calendar_today, color: AppColors.primary),
                    ],
                  ),
                  onTap: _selectEndDate,
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notes (Optional)',
                    hintText: 'e.g., Take with food',
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
                      child: Text(widget.medication == null ? 'Add' : 'Save'),
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
