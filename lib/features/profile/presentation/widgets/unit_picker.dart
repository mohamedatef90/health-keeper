import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Unit system options
enum UnitSystem {
  metric,
  imperial,
}

/// A toggle picker for selecting between metric and imperial units
class UnitPicker extends StatelessWidget {
  final UnitSystem value;
  final ValueChanged<UnitSystem>? onChanged;
  final String label;

  const UnitPicker({
    super.key,
    required this.value,
    this.onChanged,
    this.label = 'Unit System',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textSecondaryDark,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackgroundDark,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(color: AppColors.dividerDark),
          ),
          child: Row(
            children: [
              Expanded(
                child: _UnitOption(
                  label: 'Metric',
                  subtitle: 'kg, cm',
                  isSelected: value == UnitSystem.metric,
                  onTap: () => onChanged?.call(UnitSystem.metric),
                  isLeft: true,
                ),
              ),
              Container(
                width: 1,
                height: 60,
                color: AppColors.dividerDark,
              ),
              Expanded(
                child: _UnitOption(
                  label: 'Imperial',
                  subtitle: 'lb, in',
                  isSelected: value == UnitSystem.imperial,
                  onTap: () => onChanged?.call(UnitSystem.imperial),
                  isLeft: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UnitOption extends StatelessWidget {
  final String label;
  final String subtitle;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isLeft;

  const _UnitOption({
    required this.label,
    required this.subtitle,
    required this.isSelected,
    this.onTap,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.horizontal(
        left: isLeft ? const Radius.circular(AppSpacing.radiusMd) : Radius.zero,
        right: !isLeft ? const Radius.circular(AppSpacing.radiusMd) : Radius.zero,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : null,
          borderRadius: BorderRadius.horizontal(
            left: isLeft ? const Radius.circular(AppSpacing.radiusMd - 1) : Radius.zero,
            right: !isLeft ? const Radius.circular(AppSpacing.radiusMd - 1) : Radius.zero,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isSelected)
                  Container(
                    width: 16,
                    height: 16,
                    margin: const EdgeInsets.only(right: AppSpacing.xs),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                Text(
                  label,
                  style: AppTypography.titleSmall.copyWith(
                    color: isSelected ? AppColors.primary : AppColors.textPrimaryDark,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              subtitle,
              style: AppTypography.labelSmall.copyWith(
                color: isSelected ? AppColors.primary.withOpacity(0.7) : AppColors.textHintDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A simple segmented control for gender selection
class GenderPicker extends StatelessWidget {
  final String? value;
  final ValueChanged<String>? onChanged;
  final String label;

  const GenderPicker({
    super.key,
    required this.value,
    this.onChanged,
    this.label = 'Gender (Optional)',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textSecondaryDark,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            _GenderOption(
              label: 'Male',
              icon: Icons.male,
              isSelected: value == 'male',
              onTap: () => onChanged?.call('male'),
            ),
            const SizedBox(width: AppSpacing.sm),
            _GenderOption(
              label: 'Female',
              icon: Icons.female,
              isSelected: value == 'female',
              onTap: () => onChanged?.call('female'),
            ),
            const SizedBox(width: AppSpacing.sm),
            _GenderOption(
              label: 'Other',
              icon: Icons.person_outline,
              isSelected: value == 'other',
              onTap: () => onChanged?.call('other'),
            ),
          ],
        ),
      ],
    );
  }
}

class _GenderOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const _GenderOption({
    required this.label,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.1)
                : AppColors.cardBackgroundDark,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.dividerDark,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.primary : AppColors.textSecondaryDark,
                size: 24,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                label,
                style: AppTypography.labelSmall.copyWith(
                  color: isSelected ? AppColors.primary : AppColors.textSecondaryDark,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
