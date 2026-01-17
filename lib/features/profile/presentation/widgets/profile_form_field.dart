import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// A styled form field for the dark WHOOP-style theme
class ProfileFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final Widget? suffix;
  final Widget? prefix;
  final bool enabled;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;

  const ProfileFormField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.maxLines = 1,
    this.suffix,
    this.prefix,
    this.enabled = true,
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
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
        const SizedBox(height: AppSpacing.xs),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          enabled: enabled,
          focusNode: focusNode,
          textInputAction: textInputAction,
          onFieldSubmitted: onSubmitted,
          style: AppTypography.bodyLarge.copyWith(
            color: enabled ? AppColors.textPrimaryDark : AppColors.textHintDark,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: AppColors.textHintDark,
            ),
            filled: true,
            fillColor: AppColors.cardBackgroundDark,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: const BorderSide(color: AppColors.dividerDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: const BorderSide(color: AppColors.dividerDark),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: BorderSide(color: AppColors.dividerDark.withOpacity(0.5)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            suffixIcon: suffix,
            prefixIcon: prefix,
          ),
        ),
      ],
    );
  }
}

/// A numeric form field with unit display
class NumericFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final String unit;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool allowDecimals;
  final bool enabled;

  const NumericFormField({
    super.key,
    required this.label,
    required this.unit,
    this.hint,
    this.controller,
    this.validator,
    this.onChanged,
    this.allowDecimals = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileFormField(
      label: label,
      hint: hint,
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: allowDecimals),
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          allowDecimals ? RegExp(r'^\d*\.?\d*$') : RegExp(r'^\d*$'),
        ),
      ],
      suffix: Container(
        padding: const EdgeInsets.only(right: AppSpacing.md),
        child: Text(
          unit,
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textSecondaryDark,
          ),
        ),
      ),
    );
  }
}
