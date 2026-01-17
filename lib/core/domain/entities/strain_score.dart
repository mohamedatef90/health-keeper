import 'package:freezed_annotation/freezed_annotation.dart';

part 'strain_score.freezed.dart';
part 'strain_score.g.dart';

/// Strain score entity representing physical exertion on a 0-21 scale
/// Based on WHOOP-inspired heart rate zone calculations
@freezed
class StrainScore with _$StrainScore {
  const factory StrainScore({
    required String id,
    required DateTime date,
    required DateTime calculatedAt,

    /// Overall strain score (0-21)
    required double score,

    /// Maximum heart rate used for zone calculations
    required int maxHeartRate,

    /// Time spent in each HR zone in minutes
    required HRZoneData zoneData,

    /// Total active minutes across all zones
    required int totalActiveMinutes,

    /// Peak heart rate recorded
    int? peakHeartRate,

    /// Average heart rate during activity
    int? averageHeartRate,

    /// Number of workouts contributing to strain
    @Default(0) int workoutCount,

    /// Calories burned
    int? caloriesBurned,

    /// Source of the data
    required StrainDataSource dataSource,
  }) = _StrainScore;

  factory StrainScore.fromJson(Map<String, dynamic> json) =>
      _$StrainScoreFromJson(json);
}

/// Heart rate zone data
@freezed
class HRZoneData with _$HRZoneData {
  const factory HRZoneData({
    /// Zone 1: 50-60% max HR (recovery zone)
    @Default(0) int zone1Minutes,

    /// Zone 2: 60-70% max HR (fat burn zone)
    @Default(0) int zone2Minutes,

    /// Zone 3: 70-80% max HR (aerobic zone)
    @Default(0) int zone3Minutes,

    /// Zone 4: 80-90% max HR (threshold zone)
    @Default(0) int zone4Minutes,

    /// Zone 5: 90-100% max HR (anaerobic zone)
    @Default(0) int zone5Minutes,
  }) = _HRZoneData;

  factory HRZoneData.fromJson(Map<String, dynamic> json) =>
      _$HRZoneDataFromJson(json);
}

/// Strain level classification
enum StrainLevel {
  /// 0-5: Light activity day
  light,

  /// 5-10: Moderate activity
  moderate,

  /// 10-14: Active day
  active,

  /// 14-18: Strenuous day
  strenuous,

  /// 18-21: All out / max strain
  allOut,
}

/// Extension for strain level helpers
extension StrainLevelExtension on StrainLevel {
  String get label {
    switch (this) {
      case StrainLevel.light:
        return 'Light';
      case StrainLevel.moderate:
        return 'Moderate';
      case StrainLevel.active:
        return 'Active';
      case StrainLevel.strenuous:
        return 'Strenuous';
      case StrainLevel.allOut:
        return 'All Out';
    }
  }

  String get description {
    switch (this) {
      case StrainLevel.light:
        return 'Recovery day';
      case StrainLevel.moderate:
        return 'Light activity';
      case StrainLevel.active:
        return 'Good training day';
      case StrainLevel.strenuous:
        return 'Hard training day';
      case StrainLevel.allOut:
        return 'Maximum effort';
    }
  }
}

/// Extension for strain score helpers
extension StrainScoreExtension on StrainScore {
  /// Get the strain level classification
  StrainLevel get level {
    if (score < 5) return StrainLevel.light;
    if (score < 10) return StrainLevel.moderate;
    if (score < 14) return StrainLevel.active;
    if (score < 18) return StrainLevel.strenuous;
    return StrainLevel.allOut;
  }

  /// Get percentage of max strain (0-100)
  double get percentage => (score / 21 * 100).clamp(0, 100);

  /// Check if strain is within optimal range based on recovery
  bool isOptimalForRecovery(int recoveryScore) {
    if (recoveryScore >= 80) {
      // Good recovery: can handle high strain
      return score <= 18;
    } else if (recoveryScore >= 60) {
      // Moderate recovery: moderate strain recommended
      return score <= 14;
    } else if (recoveryScore >= 40) {
      // Low recovery: light strain recommended
      return score <= 10;
    } else {
      // Poor recovery: minimal strain
      return score <= 5;
    }
  }
}

/// Data source for strain calculation
@JsonEnum()
enum StrainDataSource {
  @JsonValue('healthkit')
  healthkit,

  @JsonValue('manual')
  manual,

  @JsonValue('calculated')
  calculated,
}
