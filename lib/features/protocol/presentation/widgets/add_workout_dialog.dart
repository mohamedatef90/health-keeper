import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/domain/entities/protocol.dart' as protocol;
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class AddWorkoutDialog extends StatefulWidget {
  final protocol.ScheduledWorkout? workout; // For editing existing workout

  const AddWorkoutDialog({super.key, this.workout});

  @override
  State<AddWorkoutDialog> createState() => _AddWorkoutDialogState();
}

class _AddWorkoutDialogState extends State<AddWorkoutDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _durationController;
  late TextEditingController _notesController;
  late protocol.WorkoutType _type;
  late int _dayOfWeek;
  protocol.TimeOfDay? _preferredTime;
  double? _targetStrain;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.workout?.name ?? '');
    _durationController = TextEditingController(
      text: widget.workout?.duration?.toString() ?? '',
    );
    _notesController = TextEditingController(text: widget.workout?.notes ?? '');
    _type = widget.workout?.type ?? protocol.WorkoutType.strength;
    _dayOfWeek = widget.workout?.dayOfWeek ?? 1;
    _preferredTime = widget.workout?.preferredTime;
    _targetStrain = widget.workout?.targetStrain;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _durationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String _getWorkoutTypeText(protocol.WorkoutType type) {
    switch (type) {
      case protocol.WorkoutType.strength:
        return 'Strength Training';
      case protocol.WorkoutType.cardio:
        return 'Cardio';
      case protocol.WorkoutType.flexibility:
        return 'Flexibility';
      case protocol.WorkoutType.sports:
        return 'Sports';
      case protocol.WorkoutType.hiit:
        return 'HIIT';
      case protocol.WorkoutType.yoga:
        return 'Yoga';
      case protocol.WorkoutType.swimming:
        return 'Swimming';
      case protocol.WorkoutType.cycling:
        return 'Cycling';
      case protocol.WorkoutType.running:
        return 'Running';
      case protocol.WorkoutType.walking:
        return 'Walking';
      case protocol.WorkoutType.other:
        return 'Other';
    }
  }

  String _getDayName(int day) {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    if (day >= 1 && day <= 7) {
      return days[day - 1];
    }
    return 'Unknown';
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _preferredTime != null
          ? TimeOfDay(hour: _preferredTime!.hour, minute: _preferredTime!.minute)
          : const TimeOfDay(hour: 9, minute: 0),
    );
    if (picked != null) {
      setState(() {
        _preferredTime = protocol.TimeOfDay(hour: picked.hour, minute: picked.minute);
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final workout = protocol.ScheduledWorkout(
        id: widget.workout?.id ?? const Uuid().v4(),
        name: _nameController.text.trim(),
        type: _type,
        dayOfWeek: _dayOfWeek,
        preferredTime: _preferredTime,
        duration: _durationController.text.isNotEmpty
            ? int.tryParse(_durationController.text)
            : null,
        targetStrain: _targetStrain,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        isActive: widget.workout?.isActive ?? true,
      );
      Navigator.of(context).pop(workout);
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
                  widget.workout == null ? 'Add Scheduled Workout' : 'Edit Workout',
                  style: AppTypography.titleLarge.copyWith(
                    color: AppColors.textPrimaryDark,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Workout Name',
                    hintText: 'e.g., Upper Body Day',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter workout name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                DropdownButtonFormField<protocol.WorkoutType>(
                  initialValue: _type,
                  decoration: const InputDecoration(
                    labelText: 'Workout Type',
                  ),
                  dropdownColor: AppColors.surfaceDark,
                  items: protocol.WorkoutType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(_getWorkoutTypeText(type)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _type = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                DropdownButtonFormField<int>(
                  initialValue: _dayOfWeek,
                  decoration: const InputDecoration(
                    labelText: 'Day of Week',
                  ),
                  dropdownColor: AppColors.surfaceDark,
                  items: List.generate(7, (index) {
                    return DropdownMenuItem(
                      value: index + 1,
                      child: Text(_getDayName(index + 1)),
                    );
                  }),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _dayOfWeek = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Preferred Time (Optional)'),
                  subtitle: Text(
                    _preferredTime != null
                        ? '${_preferredTime!.hour.toString().padLeft(2, '0')}:${_preferredTime!.minute.toString().padLeft(2, '0')}'
                        : 'Not set',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_preferredTime != null)
                        IconButton(
                          icon: const Icon(Icons.clear, color: AppColors.error),
                          onPressed: () {
                            setState(() {
                              _preferredTime = null;
                            });
                          },
                        ),
                      const Icon(Icons.access_time, color: AppColors.primary),
                    ],
                  ),
                  onTap: _selectTime,
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _durationController,
                  decoration: const InputDecoration(
                    labelText: 'Duration (minutes)',
                    hintText: 'e.g., 60',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Target Strain (Optional)',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.textSecondaryDark,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _targetStrain ?? 10,
                        min: 0,
                        max: 21,
                        divisions: 21,
                        label: _targetStrain?.toStringAsFixed(1) ?? 'Not set',
                        onChanged: (value) {
                          setState(() {
                            _targetStrain = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        _targetStrain?.toStringAsFixed(1) ?? '--',
                        style: AppTypography.titleSmall.copyWith(
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notes (Optional)',
                    hintText: 'e.g., Focus on legs',
                  ),
                  maxLines: 2,
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
                      child: Text(widget.workout == null ? 'Add' : 'Save'),
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
