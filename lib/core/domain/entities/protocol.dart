import 'package:freezed_annotation/freezed_annotation.dart';

part 'protocol.freezed.dart';
part 'protocol.g.dart';

@freezed
class Protocol with _$Protocol {
  const factory Protocol({
    required String id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required TimeOfDay eatingWindowStart,
    required TimeOfDay eatingWindowEnd,
    @Default([]) List<MedicationSchedule> medicationSchedule,
    @Default([]) List<WeeklyActivity> weeklyActivityPlan,
    @Default([]) List<ProtocolConstraint> constraints,
    @Default([]) List<Medication> medications,
    @Default([]) List<Supplement> supplements,
    @Default([]) List<ScheduledWorkout> workoutSchedule,
    DateTime? lockedUntil,
  }) = _Protocol;

  factory Protocol.fromJson(Map<String, dynamic> json) =>
      _$ProtocolFromJson(json);
}

@freezed
class TimeOfDay with _$TimeOfDay {
  const factory TimeOfDay({
    required int hour,
    required int minute,
  }) = _TimeOfDay;

  factory TimeOfDay.fromJson(Map<String, dynamic> json) =>
      _$TimeOfDayFromJson(json);
}

@freezed
class MedicationSchedule with _$MedicationSchedule {
  const factory MedicationSchedule({
    required String id,
    required String name,
    required String dose,
    required List<int> weekdays, // 1=Monday, 7=Sunday
    required TimeOfDay time,
    String? notes,
    @Default(true) bool isActive,
  }) = _MedicationSchedule;

  factory MedicationSchedule.fromJson(Map<String, dynamic> json) =>
      _$MedicationScheduleFromJson(json);
}

@freezed
class WeeklyActivity with _$WeeklyActivity {
  const factory WeeklyActivity({
    required String id,
    required String name,
    required ActivityType type,
    required List<int> weekdays, // 1=Monday, 7=Sunday
    TimeOfDay? preferredTime,
    int? targetDuration, // in minutes
    String? notes,
    @Default(true) bool isActive,
  }) = _WeeklyActivity;

  factory WeeklyActivity.fromJson(Map<String, dynamic> json) =>
      _$WeeklyActivityFromJson(json);
}

@freezed
class ProtocolConstraint with _$ProtocolConstraint {
  const factory ProtocolConstraint({
    required String id,
    required ConstraintType type,
    required String description,
    DateTime? validUntil,
    @Default(true) bool isActive,
  }) = _ProtocolConstraint;

  factory ProtocolConstraint.fromJson(Map<String, dynamic> json) =>
      _$ProtocolConstraintFromJson(json);
}

@freezed
class ProtocolSnapshot with _$ProtocolSnapshot {
  const factory ProtocolSnapshot({
    required String id,
    required String protocolId,
    required DateTime effectiveDate,
    required String serializedProtocol,
    String? changeReason,
  }) = _ProtocolSnapshot;

  factory ProtocolSnapshot.fromJson(Map<String, dynamic> json) =>
      _$ProtocolSnapshotFromJson(json);
}

@JsonEnum()
enum ActivityType {
  @JsonValue('walking')
  walking,
  @JsonValue('running')
  running,
  @JsonValue('cycling')
  cycling,
  @JsonValue('swimming')
  swimming,
  @JsonValue('gym')
  gym,
  @JsonValue('sport')
  sport,
  @JsonValue('yoga')
  yoga,
  @JsonValue('other')
  other,
}

@JsonEnum()
enum ConstraintType {
  @JsonValue('injury')
  injury,
  @JsonValue('medical')
  medical,
  @JsonValue('equipment')
  equipment,
  @JsonValue('schedule')
  schedule,
  @JsonValue('other')
  other,
}

// New Medication entity with frequency support
@freezed
class Medication with _$Medication {
  const factory Medication({
    required String id,
    required String name,
    required String dosage,
    required MedicationFrequency frequency,
    @Default([]) List<TimeOfDay> times,
    required DateTime startDate,
    DateTime? endDate,
    String? notes,
    @Default(true) bool remindersEnabled,
    @Default(true) bool isActive,
  }) = _Medication;

  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);
}

@JsonEnum()
enum MedicationFrequency {
  @JsonValue('daily')
  daily,
  @JsonValue('twice_daily')
  twiceDaily,
  @JsonValue('weekly')
  weekly,
  @JsonValue('bi_weekly')
  biWeekly,
  @JsonValue('monthly')
  monthly,
  @JsonValue('as_needed')
  asNeeded,
}

// New Supplement entity
@freezed
class Supplement with _$Supplement {
  const factory Supplement({
    required String id,
    required String name,
    required String dosage,
    required SupplementFrequency frequency,
    @Default([]) List<TimeOfDay> times,
    @Default(false) bool withMeals,
    String? notes,
    @Default(true) bool remindersEnabled,
    @Default(true) bool isActive,
  }) = _Supplement;

  factory Supplement.fromJson(Map<String, dynamic> json) =>
      _$SupplementFromJson(json);
}

@JsonEnum()
enum SupplementFrequency {
  @JsonValue('daily')
  daily,
  @JsonValue('twice_daily')
  twiceDaily,
  @JsonValue('three_times_daily')
  threeTimesDaily,
  @JsonValue('with_meals')
  withMeals,
  @JsonValue('as_needed')
  asNeeded,
}

// New ScheduledWorkout entity for weekly workout schedule
@freezed
class ScheduledWorkout with _$ScheduledWorkout {
  const factory ScheduledWorkout({
    required String id,
    required String name,
    required WorkoutType type,
    required int dayOfWeek, // 1=Monday, 7=Sunday
    TimeOfDay? preferredTime,
    int? duration, // in minutes
    double? targetStrain,
    String? notes,
    @Default(true) bool isActive,
  }) = _ScheduledWorkout;

  factory ScheduledWorkout.fromJson(Map<String, dynamic> json) =>
      _$ScheduledWorkoutFromJson(json);
}

@JsonEnum()
enum WorkoutType {
  @JsonValue('strength')
  strength,
  @JsonValue('cardio')
  cardio,
  @JsonValue('flexibility')
  flexibility,
  @JsonValue('sports')
  sports,
  @JsonValue('hiit')
  hiit,
  @JsonValue('yoga')
  yoga,
  @JsonValue('swimming')
  swimming,
  @JsonValue('cycling')
  cycling,
  @JsonValue('running')
  running,
  @JsonValue('walking')
  walking,
  @JsonValue('other')
  other,
}
