// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProtocolImpl _$$ProtocolImplFromJson(
  Map<String, dynamic> json,
) => _$ProtocolImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  eatingWindowStart: TimeOfDay.fromJson(
    json['eatingWindowStart'] as Map<String, dynamic>,
  ),
  eatingWindowEnd: TimeOfDay.fromJson(
    json['eatingWindowEnd'] as Map<String, dynamic>,
  ),
  medicationSchedule:
      (json['medicationSchedule'] as List<dynamic>?)
          ?.map((e) => MedicationSchedule.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  weeklyActivityPlan:
      (json['weeklyActivityPlan'] as List<dynamic>?)
          ?.map((e) => WeeklyActivity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  constraints:
      (json['constraints'] as List<dynamic>?)
          ?.map((e) => ProtocolConstraint.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  medications:
      (json['medications'] as List<dynamic>?)
          ?.map((e) => Medication.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  supplements:
      (json['supplements'] as List<dynamic>?)
          ?.map((e) => Supplement.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  workoutSchedule:
      (json['workoutSchedule'] as List<dynamic>?)
          ?.map((e) => ScheduledWorkout.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  lockedUntil: json['lockedUntil'] == null
      ? null
      : DateTime.parse(json['lockedUntil'] as String),
);

Map<String, dynamic> _$$ProtocolImplToJson(_$ProtocolImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'eatingWindowStart': instance.eatingWindowStart,
      'eatingWindowEnd': instance.eatingWindowEnd,
      'medicationSchedule': instance.medicationSchedule,
      'weeklyActivityPlan': instance.weeklyActivityPlan,
      'constraints': instance.constraints,
      'medications': instance.medications,
      'supplements': instance.supplements,
      'workoutSchedule': instance.workoutSchedule,
      'lockedUntil': instance.lockedUntil?.toIso8601String(),
    };

_$TimeOfDayImpl _$$TimeOfDayImplFromJson(Map<String, dynamic> json) =>
    _$TimeOfDayImpl(
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
    );

Map<String, dynamic> _$$TimeOfDayImplToJson(_$TimeOfDayImpl instance) =>
    <String, dynamic>{'hour': instance.hour, 'minute': instance.minute};

_$MedicationScheduleImpl _$$MedicationScheduleImplFromJson(
  Map<String, dynamic> json,
) => _$MedicationScheduleImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  dose: json['dose'] as String,
  weekdays: (json['weekdays'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  time: TimeOfDay.fromJson(json['time'] as Map<String, dynamic>),
  notes: json['notes'] as String?,
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$$MedicationScheduleImplToJson(
  _$MedicationScheduleImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'dose': instance.dose,
  'weekdays': instance.weekdays,
  'time': instance.time,
  'notes': instance.notes,
  'isActive': instance.isActive,
};

_$WeeklyActivityImpl _$$WeeklyActivityImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyActivityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
      weekdays: (json['weekdays'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      preferredTime: json['preferredTime'] == null
          ? null
          : TimeOfDay.fromJson(json['preferredTime'] as Map<String, dynamic>),
      targetDuration: (json['targetDuration'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$WeeklyActivityImplToJson(
  _$WeeklyActivityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': _$ActivityTypeEnumMap[instance.type]!,
  'weekdays': instance.weekdays,
  'preferredTime': instance.preferredTime,
  'targetDuration': instance.targetDuration,
  'notes': instance.notes,
  'isActive': instance.isActive,
};

const _$ActivityTypeEnumMap = {
  ActivityType.walking: 'walking',
  ActivityType.running: 'running',
  ActivityType.cycling: 'cycling',
  ActivityType.swimming: 'swimming',
  ActivityType.gym: 'gym',
  ActivityType.sport: 'sport',
  ActivityType.yoga: 'yoga',
  ActivityType.other: 'other',
};

_$ProtocolConstraintImpl _$$ProtocolConstraintImplFromJson(
  Map<String, dynamic> json,
) => _$ProtocolConstraintImpl(
  id: json['id'] as String,
  type: $enumDecode(_$ConstraintTypeEnumMap, json['type']),
  description: json['description'] as String,
  validUntil: json['validUntil'] == null
      ? null
      : DateTime.parse(json['validUntil'] as String),
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$$ProtocolConstraintImplToJson(
  _$ProtocolConstraintImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$ConstraintTypeEnumMap[instance.type]!,
  'description': instance.description,
  'validUntil': instance.validUntil?.toIso8601String(),
  'isActive': instance.isActive,
};

const _$ConstraintTypeEnumMap = {
  ConstraintType.injury: 'injury',
  ConstraintType.medical: 'medical',
  ConstraintType.equipment: 'equipment',
  ConstraintType.schedule: 'schedule',
  ConstraintType.other: 'other',
};

_$ProtocolSnapshotImpl _$$ProtocolSnapshotImplFromJson(
  Map<String, dynamic> json,
) => _$ProtocolSnapshotImpl(
  id: json['id'] as String,
  protocolId: json['protocolId'] as String,
  effectiveDate: DateTime.parse(json['effectiveDate'] as String),
  serializedProtocol: json['serializedProtocol'] as String,
  changeReason: json['changeReason'] as String?,
);

Map<String, dynamic> _$$ProtocolSnapshotImplToJson(
  _$ProtocolSnapshotImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'protocolId': instance.protocolId,
  'effectiveDate': instance.effectiveDate.toIso8601String(),
  'serializedProtocol': instance.serializedProtocol,
  'changeReason': instance.changeReason,
};

_$MedicationImpl _$$MedicationImplFromJson(Map<String, dynamic> json) =>
    _$MedicationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      dosage: json['dosage'] as String,
      frequency: $enumDecode(_$MedicationFrequencyEnumMap, json['frequency']),
      times:
          (json['times'] as List<dynamic>?)
              ?.map((e) => TimeOfDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      notes: json['notes'] as String?,
      remindersEnabled: json['remindersEnabled'] as bool? ?? true,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$MedicationImplToJson(_$MedicationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dosage': instance.dosage,
      'frequency': _$MedicationFrequencyEnumMap[instance.frequency]!,
      'times': instance.times,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'notes': instance.notes,
      'remindersEnabled': instance.remindersEnabled,
      'isActive': instance.isActive,
    };

const _$MedicationFrequencyEnumMap = {
  MedicationFrequency.daily: 'daily',
  MedicationFrequency.twiceDaily: 'twice_daily',
  MedicationFrequency.weekly: 'weekly',
  MedicationFrequency.biWeekly: 'bi_weekly',
  MedicationFrequency.monthly: 'monthly',
  MedicationFrequency.asNeeded: 'as_needed',
};

_$SupplementImpl _$$SupplementImplFromJson(Map<String, dynamic> json) =>
    _$SupplementImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      dosage: json['dosage'] as String,
      frequency: $enumDecode(_$SupplementFrequencyEnumMap, json['frequency']),
      times:
          (json['times'] as List<dynamic>?)
              ?.map((e) => TimeOfDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      withMeals: json['withMeals'] as bool? ?? false,
      notes: json['notes'] as String?,
      remindersEnabled: json['remindersEnabled'] as bool? ?? true,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$SupplementImplToJson(_$SupplementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dosage': instance.dosage,
      'frequency': _$SupplementFrequencyEnumMap[instance.frequency]!,
      'times': instance.times,
      'withMeals': instance.withMeals,
      'notes': instance.notes,
      'remindersEnabled': instance.remindersEnabled,
      'isActive': instance.isActive,
    };

const _$SupplementFrequencyEnumMap = {
  SupplementFrequency.daily: 'daily',
  SupplementFrequency.twiceDaily: 'twice_daily',
  SupplementFrequency.threeTimesDaily: 'three_times_daily',
  SupplementFrequency.withMeals: 'with_meals',
  SupplementFrequency.asNeeded: 'as_needed',
};

_$ScheduledWorkoutImpl _$$ScheduledWorkoutImplFromJson(
  Map<String, dynamic> json,
) => _$ScheduledWorkoutImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$WorkoutTypeEnumMap, json['type']),
  dayOfWeek: (json['dayOfWeek'] as num).toInt(),
  preferredTime: json['preferredTime'] == null
      ? null
      : TimeOfDay.fromJson(json['preferredTime'] as Map<String, dynamic>),
  duration: (json['duration'] as num?)?.toInt(),
  targetStrain: (json['targetStrain'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$$ScheduledWorkoutImplToJson(
  _$ScheduledWorkoutImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': _$WorkoutTypeEnumMap[instance.type]!,
  'dayOfWeek': instance.dayOfWeek,
  'preferredTime': instance.preferredTime,
  'duration': instance.duration,
  'targetStrain': instance.targetStrain,
  'notes': instance.notes,
  'isActive': instance.isActive,
};

const _$WorkoutTypeEnumMap = {
  WorkoutType.strength: 'strength',
  WorkoutType.cardio: 'cardio',
  WorkoutType.flexibility: 'flexibility',
  WorkoutType.sports: 'sports',
  WorkoutType.hiit: 'hiit',
  WorkoutType.yoga: 'yoga',
  WorkoutType.swimming: 'swimming',
  WorkoutType.cycling: 'cycling',
  WorkoutType.running: 'running',
  WorkoutType.walking: 'walking',
  WorkoutType.other: 'other',
};
