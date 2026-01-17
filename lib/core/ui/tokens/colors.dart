import 'package:flutter/material.dart';

/// Design system color tokens for Health Keeper
/// Dark-first theme with purple-to-magenta gradient accent
class AppColors {
  AppColors._();

  // ============================================
  // Dark Theme Backgrounds (Primary)
  // ============================================
  static const Color backgroundDark = Color(0xFF0D0D0D);
  static const Color backgroundDarkElevated = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1A1A1A);
  static const Color cardDark = Color(0xFF252525);
  static const Color cardDarkElevated = Color(0xFF2C2C2C);
  static const Color borderDark = Color(0xFF333333);
  static const Color borderDarkSubtle = Color(0xFF2A2A2A);

  // ============================================
  // Primary Gradient Colors (Purple to Magenta)
  // ============================================

  /// Purple - Start of primary gradient
  static const Color purple = Color(0xFF9D7AFF);
  static const Color purpleLight = Color(0xFFB49FFF);
  static const Color purpleDark = Color(0xFF7C5CE6);

  /// Magenta - End of primary gradient
  static const Color magenta = Color(0xFFFF6B9D);
  static const Color magentaLight = Color(0xFFFF8AB3);
  static const Color magentaDark = Color(0xFFE6558A);

  /// Primary color (center of gradient for solid uses)
  static const Color primaryPurple = Color(0xFFBE72FF);
  static const Color primaryPurpleLight = Color(0xFFCB8FFF);
  static const Color primaryPurpleDark = Color(0xFFA855E6);

  // ============================================
  // Secondary Accent Colors
  // ============================================

  /// Teal/Cyan - Recovery, positive metrics
  static const Color recovery = Color(0xFF00D4AA);
  static const Color recoveryLight = Color(0xFF33DDBB);
  static const Color recoveryDark = Color(0xFF00A080);

  /// Yellow/Gold - Strain, activity, warnings
  static const Color strain = Color(0xFFFFD700);
  static const Color strainLight = Color(0xFFFFE033);
  static const Color strainDark = Color(0xFFE6C200);

  /// Red/Orange - Alerts, high strain, danger
  static const Color alert = Color(0xFFFF6B6B);
  static const Color alertLight = Color(0xFFFF8A8A);
  static const Color alertDark = Color(0xFFE65555);

  /// Blue - Sleep metrics
  static const Color sleep = Color(0xFF6B7AFF);
  static const Color sleepLight = Color(0xFF8A96FF);
  static const Color sleepDark = Color(0xFF5563E6);

  // ============================================
  // Recovery Score States
  // ============================================
  static const Color recoveryGreen = Color(0xFF00D4AA);    // 67-100 (Peak/Good)
  static const Color recoveryYellow = Color(0xFFFFD700);   // 34-66 (Moderate)
  static const Color recoveryRed = Color(0xFFFF6B6B);      // 0-33 (Low/Rest)

  // Legacy recovery colors (for compatibility)
  static const Color recoveryExcellent = Color(0xFF00D4AA); // 80-100
  static const Color recoveryGood = Color(0xFF33DDBB);      // 60-79
  static const Color recoveryModerate = Color(0xFFFFD700);  // 40-59
  static const Color recoveryLow = Color(0xFFFF9500);       // 20-39
  static const Color recoveryPoor = Color(0xFFFF6B6B);      // 0-19

  // ============================================
  // Text Colors
  // ============================================
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color textTertiary = Color(0xFF636366);
  static const Color textHint = Color(0xFF48484A);
  static const Color textDisabled = Color(0xFF3A3A3C);

  // Dark theme text (aliases for clarity)
  static const Color textPrimaryDark = textPrimary;
  static const Color textSecondaryDark = textSecondary;
  static const Color textHintDark = textTertiary;

  // ============================================
  // Semantic Colors
  // ============================================
  static const Color success = Color(0xFF00D4AA);
  static const Color warning = Color(0xFFFFD700);
  static const Color error = Color(0xFFFF6B6B);
  static const Color info = Color(0xFF6B7AFF);

  // Primary colors (Purple-Magenta gradient based)
  static const Color primary = Color(0xFFBE72FF);
  static const Color primaryLight = Color(0xFFCB8FFF);
  static const Color primaryDark = Color(0xFFA855E6);

  static const Color secondary = Color(0xFF00D4AA);
  static const Color secondaryLight = Color(0xFF33DDBB);
  static const Color secondaryDark = Color(0xFF00A080);

  static const Color accent = Color(0xFFFF6B9D);
  static const Color accentLight = Color(0xFFFF8AB3);
  static const Color accentDark = Color(0xFFE6558A);

  // ============================================
  // Macro Colors (for nutrition charts)
  // ============================================
  static const Color protein = Color(0xFFFF6B9D);   // Pink - Protein
  static const Color carbs = Color(0xFF9D7AFF);     // Purple - Carbs
  static const Color fat = Color(0xFFFFAA5C);       // Orange - Fat
  static const Color calories = Color(0xFF00D4AA); // Teal - Calories

  // ============================================
  // Light Theme (secondary, for compatibility)
  // ============================================
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFF333333);
  static const Color dividerDark = Color(0xFF333333);
  static const Color cardBackground = Color(0xFF252525);
  static const Color cardBackgroundDark = Color(0xFF252525);

  // ============================================
  // Gradients
  // ============================================

  /// Primary gradient: Purple to Magenta (brand colors)
  static const List<Color> primaryGradientColors = [
    Color(0xFF9D7AFF),  // Purple
    Color(0xFFFF6B9D),  // Magenta
  ];

  /// Extended primary gradient with center color
  static const List<Color> primaryGradientColorsExtended = [
    Color(0xFF9D7AFF),  // Purple
    Color(0xFFBE72FF),  // Purple-Magenta mid
    Color(0xFFFF6B9D),  // Magenta
  ];

  static const List<Color> recoveryGradientColors = [
    Color(0xFF00D4AA),
    Color(0xFF00A080),
  ];

  static const List<Color> strainGradientColors = [
    Color(0xFFFFD700),
    Color(0xFFFF9500),
  ];

  static const List<Color> sleepGradientColors = [
    Color(0xFF6B7AFF),
    Color(0xFF5563E6),
  ];

  static const List<Color> alertGradientColors = [
    Color(0xFFFF6B6B),
    Color(0xFFE65555),
  ];

  /// Primary gradient: Purple to Magenta
  static const LinearGradient primaryGradient = LinearGradient(
    colors: primaryGradientColors,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Primary gradient (vertical)
  static const LinearGradient primaryGradientVertical = LinearGradient(
    colors: primaryGradientColors,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Primary gradient (diagonal)
  static const LinearGradient primaryGradientDiagonal = LinearGradient(
    colors: primaryGradientColors,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient recoveryGradient = LinearGradient(
    colors: recoveryGradientColors,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient strainGradient = LinearGradient(
    colors: strainGradientColors,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient sleepGradient = LinearGradient(
    colors: sleepGradientColors,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============================================
  // Ring/Chart Colors
  // ============================================
  static const Color ringBackground = Color(0xFF2A2A2A);
  static const Color ringBackgroundSubtle = Color(0xFF1F1F1F);

  // ============================================
  // Utility Methods
  // ============================================

  /// Get recovery score color based on score value (0-100)
  static Color getRecoveryColor(int score) {
    if (score >= 67) return recoveryGreen;
    if (score >= 34) return recoveryYellow;
    return recoveryRed;
  }

  /// Get detailed recovery color based on score value (0-100)
  static Color getRecoveryColorDetailed(int score) {
    if (score >= 80) return recoveryExcellent;
    if (score >= 60) return recoveryGood;
    if (score >= 40) return recoveryModerate;
    if (score >= 20) return recoveryLow;
    return recoveryPoor;
  }

  /// Get strain color based on strain value (0-21)
  static Color getStrainColor(double strainScore) {
    if (strainScore >= 18) return alert;           // All out
    if (strainScore >= 14) return alertLight;      // Strenuous
    if (strainScore >= 10) return strain;          // Active
    if (strainScore >= 5) return strainLight;      // Moderate
    return recoveryGreen;                          // Light
  }

  /// Get intensity color based on suggested intensity (1-5)
  static Color getIntensityColor(int intensity) {
    switch (intensity) {
      case 1:
        return recoveryPoor;
      case 2:
        return recoveryLow;
      case 3:
        return recoveryModerate;
      case 4:
        return recoveryGood;
      case 5:
        return recoveryExcellent;
      default:
        return recoveryModerate;
    }
  }

  /// Get sleep quality color
  static Color getSleepColor(double quality) {
    if (quality >= 0.8) return recoveryGreen;
    if (quality >= 0.6) return sleep;
    if (quality >= 0.4) return strain;
    return alert;
  }

  /// Create a subtle background color from an accent color
  static Color withSurfaceOpacity(Color color) {
    return color.withOpacity(0.12);
  }

  /// Create a card overlay color
  static Color withCardOpacity(Color color) {
    return color.withOpacity(0.08);
  }
}
