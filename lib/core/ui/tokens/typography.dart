import 'package:flutter/material.dart';

import 'colors.dart';

/// Design system typography tokens for Health Keeper - WHOOP 5 Style
/// Clean sans-serif, large numbers for metrics, small labels
class AppTypography {
  AppTypography._();

  // Font Families
  static const String fontFamily = 'SF Pro Display';
  static const String fontFamilyArabic = 'SF Arabic';

  // ============================================
  // Large Metric Displays (WHOOP Style)
  // ============================================

  /// Extra large display for hero scores (Recovery, Strain main values)
  static const TextStyle displayLarge = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.1,
    color: AppColors.textPrimary,
  );

  /// Large display for secondary scores
  static const TextStyle displayMedium = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  /// Medium display for tertiary metrics
  static const TextStyle displaySmall = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.25,
    color: AppColors.textPrimary,
  );

  // ============================================
  // Metric Values (Numbers in cards/rings)
  // ============================================

  /// Large metric value (main card numbers)
  static const TextStyle metricLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.1,
    color: AppColors.textPrimary,
  );

  /// Medium metric value (secondary card numbers)
  static const TextStyle metricMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  /// Small metric value (inline numbers)
  static const TextStyle metricSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  // ============================================
  // Score Display (Ring centers)
  // ============================================

  /// Main score display (64pt, bold) for recovery/strain rings
  static const TextStyle scoreDisplay = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
    height: 1.0,
    color: AppColors.recovery,
  );

  /// Secondary score display (48pt) for smaller rings
  static const TextStyle scoreDisplayMedium = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.0,
    color: AppColors.recovery,
  );

  /// Compact score display (36pt) for mini rings
  static const TextStyle scoreDisplaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.25,
    height: 1.0,
    color: AppColors.recovery,
  );

  // ============================================
  // Headline Styles
  // ============================================

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.25,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.29,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.33,
    color: AppColors.textPrimary,
  );

  // ============================================
  // Title Styles
  // ============================================

  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.27,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
    color: AppColors.textPrimary,
  );

  // ============================================
  // Body Styles
  // ============================================

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    color: AppColors.textSecondary,
  );

  // ============================================
  // Label Styles (WHOOP Style - Small caps)
  // ============================================

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
    color: AppColors.textPrimary,
  );

  /// Small label for metric descriptions (WHOOP style - small, uppercase)
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    color: AppColors.textSecondary,
  );

  /// Extra small label for tertiary information
  static const TextStyle labelXSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.6,
    height: 1.4,
    color: AppColors.textTertiary,
  );

  // ============================================
  // Metric Labels (Below numbers in cards)
  // ============================================

  /// Metric value text (large numbers)
  static const TextStyle metricValue = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  /// Metric label text (small text below numbers)
  static const TextStyle metricLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    color: AppColors.textSecondary,
  );

  /// Metric unit text (kg, cal, etc.)
  static const TextStyle metricUnit = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.4,
    color: AppColors.textTertiary,
  );

  // ============================================
  // Special Styles
  // ============================================

  /// AI generated indicator
  static const TextStyle aiGenerated = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    letterSpacing: 0.4,
    height: 1.45,
    color: AppColors.textTertiary,
  );

  /// Badge/chip text
  static const TextStyle badgeText = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  /// Section header (uppercase label)
  static const TextStyle sectionHeader = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0,
    height: 1.33,
    color: AppColors.textSecondary,
  );

  /// Time/timestamp text
  static const TextStyle timestamp = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.45,
    color: AppColors.textTertiary,
  );

  /// Button text (medium weight)
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.25,
    color: AppColors.textPrimary,
  );

  /// Button text small
  static const TextStyle buttonSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    height: 1.3,
    color: AppColors.textPrimary,
  );
}
