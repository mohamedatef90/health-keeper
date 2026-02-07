import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/domain/entities/user_profile.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../widgets/profile_form_field.dart';
import '../widgets/goal_slider.dart';
import '../widgets/unit_picker.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _currentWeightController = TextEditingController();

  String? _selectedGender;
  UnitSystem _unitSystem = UnitSystem.metric;
  CoachingTone _coachingTone = CoachingTone.supportive;
  AppLanguage _language = AppLanguage.arabic;

  // Goals
  double _targetWeight = 80.0;
  double _targetWaist = 85.0;
  int _targetSteps = 8000;
  int _targetCalories = 2000;
  int _targetProtein = 150;
  double _targetSleepHours = 7.5;

  bool _isSaving = false;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() {
    // In production, this would load from database
    // For now, set mock values
    _nameController.text = 'Mohamed';
    _ageController.text = '30';
    _heightController.text = '175';
    _currentWeightController.text = '85';
    _selectedGender = 'male';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _currentWeightController.dispose();
    super.dispose();
  }

  void _markChanged() {
    if (!_hasChanges) {
      setState(() => _hasChanges = true);
    }
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      // In production, this would save to database
      await Future.delayed(const Duration(seconds: 1)); // Simulate save

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile saved successfully'),
            backgroundColor: AppColors.success,
          ),
        );
        context.go('/profile/settings');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  void _showDiscardChangesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discard changes?'),
        content: const Text('You have unsaved changes. Are you sure you want to discard them?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Keep editing'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/profile/settings');
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Discard'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_hasChanges,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _hasChanges) {
          _showDiscardChangesDialog();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (_hasChanges) {
                _showDiscardChangesDialog();
              } else {
                context.go('/profile/settings');
              }
            },
          ),
          actions: [
            if (_isSaving)
              const Padding(
                padding: EdgeInsets.all(AppSpacing.md),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            else
              TextButton(
                onPressed: _hasChanges ? _saveProfile : null,
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: _hasChanges ? AppColors.primary : AppColors.textHintDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
            children: [
              // Personal Information Section
              _SectionHeader(title: 'Personal Information'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.cardPadding),
                  child: Column(
                    children: [
                      ProfileFormField(
                        label: 'Name',
                        hint: 'Enter your name',
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        onChanged: (_) => _markChanged(),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      NumericFormField(
                        label: 'Age',
                        hint: 'Enter your age',
                        unit: 'years',
                        controller: _ageController,
                        allowDecimals: false,
                        onChanged: (_) => _markChanged(),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            final age = int.tryParse(value);
                            if (age == null || age < 13 || age > 120) {
                              return 'Please enter a valid age';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      GenderPicker(
                        value: _selectedGender,
                        onChanged: (value) {
                          setState(() => _selectedGender = value);
                          _markChanged();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Body Metrics Section
              _SectionHeader(title: 'Body Metrics'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.cardPadding),
                  child: Column(
                    children: [
                      UnitPicker(
                        value: _unitSystem,
                        onChanged: (value) {
                          setState(() => _unitSystem = value);
                          _markChanged();
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      NumericFormField(
                        label: 'Height',
                        hint: 'Enter your height',
                        unit: _unitSystem == UnitSystem.metric ? 'cm' : 'in',
                        controller: _heightController,
                        onChanged: (_) => _markChanged(),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            final height = double.tryParse(value);
                            if (height == null || height < 50 || height > 300) {
                              return 'Please enter a valid height';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      NumericFormField(
                        label: 'Current Weight',
                        hint: 'Enter your current weight',
                        unit: _unitSystem == UnitSystem.metric ? 'kg' : 'lb',
                        controller: _currentWeightController,
                        onChanged: (_) => _markChanged(),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            final weight = double.tryParse(value);
                            if (weight == null || weight < 20 || weight > 500) {
                              return 'Please enter a valid weight';
                            }
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Goals Section
              _SectionHeader(title: 'Goals'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.cardPadding),
                  child: Column(
                    children: [
                      GoalSlider(
                        label: 'Target Weight',
                        description: 'Your goal weight',
                        value: _targetWeight,
                        min: 40,
                        max: 200,
                        divisions: 160,
                        unit: _unitSystem == UnitSystem.metric ? 'kg' : 'lb',
                        activeColor: AppColors.primary,
                        onChanged: (value) {
                          setState(() => _targetWeight = value);
                          _markChanged();
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      GoalSlider(
                        label: 'Target Waist',
                        description: 'Waist circumference goal',
                        value: _targetWaist,
                        min: 50,
                        max: 150,
                        divisions: 100,
                        unit: _unitSystem == UnitSystem.metric ? 'cm' : 'in',
                        activeColor: AppColors.accent,
                        onChanged: (value) {
                          setState(() => _targetWaist = value);
                          _markChanged();
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      GoalSlider(
                        label: 'Daily Steps',
                        value: _targetSteps.toDouble(),
                        min: 2000,
                        max: 20000,
                        divisions: 18,
                        unit: 'steps',
                        activeColor: AppColors.recoveryGood,
                        valueFormatter: (v) => v.toInt().toString(),
                        onChanged: (value) {
                          setState(() => _targetSteps = value.toInt());
                          _markChanged();
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      GoalSlider(
                        label: 'Daily Calories',
                        value: _targetCalories.toDouble(),
                        min: 1200,
                        max: 4000,
                        divisions: 28,
                        unit: 'kcal',
                        activeColor: AppColors.calories,
                        valueFormatter: (v) => v.toInt().toString(),
                        onChanged: (value) {
                          setState(() => _targetCalories = value.toInt());
                          _markChanged();
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      GoalSlider(
                        label: 'Daily Protein',
                        value: _targetProtein.toDouble(),
                        min: 50,
                        max: 300,
                        divisions: 25,
                        unit: 'g',
                        activeColor: AppColors.protein,
                        valueFormatter: (v) => v.toInt().toString(),
                        onChanged: (value) {
                          setState(() => _targetProtein = value.toInt());
                          _markChanged();
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      GoalSlider(
                        label: 'Sleep Target',
                        value: _targetSleepHours,
                        min: 5,
                        max: 10,
                        divisions: 10,
                        unit: 'hours',
                        activeColor: AppColors.secondary,
                        onChanged: (value) {
                          setState(() => _targetSleepHours = value);
                          _markChanged();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // AI Preferences Section
              _SectionHeader(title: 'AI Preferences'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.cardPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Coaching Tone',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.textSecondaryDark,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _CoachingToneOption(
                        title: 'Supportive',
                        description: 'Encouraging and gentle guidance',
                        icon: Icons.favorite_outline,
                        isSelected: _coachingTone == CoachingTone.supportive,
                        onTap: () {
                          setState(() => _coachingTone = CoachingTone.supportive);
                          _markChanged();
                        },
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _CoachingToneOption(
                        title: 'Direct',
                        description: 'Straight to the point',
                        icon: Icons.bolt_outlined,
                        isSelected: _coachingTone == CoachingTone.direct,
                        onTap: () {
                          setState(() => _coachingTone = CoachingTone.direct);
                          _markChanged();
                        },
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _CoachingToneOption(
                        title: 'Motivational',
                        description: 'High energy and pushing',
                        icon: Icons.local_fire_department_outlined,
                        isSelected: _coachingTone == CoachingTone.motivational,
                        onTap: () {
                          setState(() => _coachingTone = CoachingTone.motivational);
                          _markChanged();
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        'App Language',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.textSecondaryDark,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        children: [
                          Expanded(
                            child: _LanguageOption(
                              label: 'Arabic',
                              nativeLabel: 'العربية',
                              isSelected: _language == AppLanguage.arabic,
                              onTap: () {
                                setState(() => _language = AppLanguage.arabic);
                                _markChanged();
                              },
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: _LanguageOption(
                              label: 'English',
                              nativeLabel: 'English',
                              isSelected: _language == AppLanguage.english,
                              onTap: () {
                                setState(() => _language = AppLanguage.english);
                                _markChanged();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: AppSpacing.buttonHeightLarge,
                child: ElevatedButton(
                  onPressed: _hasChanges && !_isSaving ? _saveProfile : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                  ),
                  child: _isSaving
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text('Save Profile', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.xs,
        bottom: AppSpacing.sm,
      ),
      child: Text(
        title,
        style: AppTypography.labelMedium.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _CoachingToneOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const _CoachingToneOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.dividerDark,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : AppColors.textSecondaryDark,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.titleSmall.copyWith(
                      color: isSelected ? AppColors.primary : AppColors.textPrimaryDark,
                    ),
                  ),
                  Text(
                    description,
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String label;
  final String nativeLabel;
  final bool isSelected;
  final VoidCallback? onTap;

  const _LanguageOption({
    required this.label,
    required this.nativeLabel,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.dividerDark,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              nativeLabel,
              style: AppTypography.titleSmall.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textPrimaryDark,
              ),
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.textSecondaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
