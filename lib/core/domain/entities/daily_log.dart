import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_log.freezed.dart';
part 'daily_log.g.dart';

@freezed
class DailyLog with _$DailyLog {
  const factory DailyLog({
    required String id,
    required DateTime date,
    required DateTime createdAt,
    required DateTime updatedAt,
    double? weight, // in kg
    String? notes,
    int? moodEnergy, // 1-5
    int? hunger, // 1-5
    int? stress, // 1-5
    @Default([]) List<String> symptoms,
  }) = _DailyLog;

  factory DailyLog.fromJson(Map<String, dynamic> json) =>
      _$DailyLogFromJson(json);
}

@freezed
class MeasurementLog with _$MeasurementLog {
  const factory MeasurementLog({
    required String id,
    required String dailyLogId,
    required DateTime date,
    double? waist, // in cm
    double? chest, // in cm
    double? hip, // in cm
    double? thigh, // in cm
    double? arm, // in cm
  }) = _MeasurementLog;

  factory MeasurementLog.fromJson(Map<String, dynamic> json) =>
      _$MeasurementLogFromJson(json);
}

@freezed
class MealLog with _$MealLog {
  const factory MealLog({
    required String id,
    required String dailyLogId,
    required DateTime time,
    required DateTime createdAt,
    required MealLogMethod method,
    String? photoUri,
    String? templateId,
    String? aiAnalysisId,
    @Default([]) List<MealItem> items,
  }) = _MealLog;

  factory MealLog.fromJson(Map<String, dynamic> json) =>
      _$MealLogFromJson(json);
}

@freezed
class MealItem with _$MealItem {
  const factory MealItem({
    required String id,
    required String mealLogId,
    required String name,
    String? portion,
    int? caloriesEstimate,
    int? proteinEstimate, // in grams
    int? carbsEstimate, // in grams
    int? fatEstimate, // in grams
    @Default(false) bool isAiEstimate,
    @Default(false) bool isUserEdited,
    int? confidence, // 0-100
  }) = _MealItem;

  factory MealItem.fromJson(Map<String, dynamic> json) =>
      _$MealItemFromJson(json);
}

@freezed
class WorkoutLog with _$WorkoutLog {
  const factory WorkoutLog({
    required String id,
    required String dailyLogId,
    required DateTime date,
    required String type,
    required int duration, // in minutes
    int? intensity, // 1-10
    String? notes,
    required WorkoutSource source,
    int? caloriesBurned,
  }) = _WorkoutLog;

  factory WorkoutLog.fromJson(Map<String, dynamic> json) =>
      _$WorkoutLogFromJson(json);
}

@JsonEnum()
enum MealLogMethod {
  @JsonValue('manual')
  manual,
  @JsonValue('camera')
  camera,
  @JsonValue('template')
  template,
}

@JsonEnum()
enum WorkoutSource {
  @JsonValue('manual')
  manual,
  @JsonValue('watch')
  watch,
}
