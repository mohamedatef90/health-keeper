// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyLogImpl _$$DailyLogImplFromJson(Map<String, dynamic> json) =>
    _$DailyLogImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      weight: (json['weight'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      moodEnergy: (json['moodEnergy'] as num?)?.toInt(),
      hunger: (json['hunger'] as num?)?.toInt(),
      stress: (json['stress'] as num?)?.toInt(),
      symptoms:
          (json['symptoms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DailyLogImplToJson(_$DailyLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'weight': instance.weight,
      'notes': instance.notes,
      'moodEnergy': instance.moodEnergy,
      'hunger': instance.hunger,
      'stress': instance.stress,
      'symptoms': instance.symptoms,
    };

_$MeasurementLogImpl _$$MeasurementLogImplFromJson(Map<String, dynamic> json) =>
    _$MeasurementLogImpl(
      id: json['id'] as String,
      dailyLogId: json['dailyLogId'] as String,
      date: DateTime.parse(json['date'] as String),
      waist: (json['waist'] as num?)?.toDouble(),
      chest: (json['chest'] as num?)?.toDouble(),
      hip: (json['hip'] as num?)?.toDouble(),
      thigh: (json['thigh'] as num?)?.toDouble(),
      arm: (json['arm'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MeasurementLogImplToJson(
  _$MeasurementLogImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'dailyLogId': instance.dailyLogId,
  'date': instance.date.toIso8601String(),
  'waist': instance.waist,
  'chest': instance.chest,
  'hip': instance.hip,
  'thigh': instance.thigh,
  'arm': instance.arm,
};

_$MealLogImpl _$$MealLogImplFromJson(Map<String, dynamic> json) =>
    _$MealLogImpl(
      id: json['id'] as String,
      dailyLogId: json['dailyLogId'] as String,
      time: DateTime.parse(json['time'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      method: $enumDecode(_$MealLogMethodEnumMap, json['method']),
      photoUri: json['photoUri'] as String?,
      templateId: json['templateId'] as String?,
      aiAnalysisId: json['aiAnalysisId'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => MealItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MealLogImplToJson(_$MealLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dailyLogId': instance.dailyLogId,
      'time': instance.time.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'method': _$MealLogMethodEnumMap[instance.method]!,
      'photoUri': instance.photoUri,
      'templateId': instance.templateId,
      'aiAnalysisId': instance.aiAnalysisId,
      'items': instance.items,
    };

const _$MealLogMethodEnumMap = {
  MealLogMethod.manual: 'manual',
  MealLogMethod.camera: 'camera',
  MealLogMethod.template: 'template',
};

_$MealItemImpl _$$MealItemImplFromJson(Map<String, dynamic> json) =>
    _$MealItemImpl(
      id: json['id'] as String,
      mealLogId: json['mealLogId'] as String,
      name: json['name'] as String,
      portion: json['portion'] as String?,
      caloriesEstimate: (json['caloriesEstimate'] as num?)?.toInt(),
      proteinEstimate: (json['proteinEstimate'] as num?)?.toInt(),
      carbsEstimate: (json['carbsEstimate'] as num?)?.toInt(),
      fatEstimate: (json['fatEstimate'] as num?)?.toInt(),
      isAiEstimate: json['isAiEstimate'] as bool? ?? false,
      isUserEdited: json['isUserEdited'] as bool? ?? false,
      confidence: (json['confidence'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MealItemImplToJson(_$MealItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mealLogId': instance.mealLogId,
      'name': instance.name,
      'portion': instance.portion,
      'caloriesEstimate': instance.caloriesEstimate,
      'proteinEstimate': instance.proteinEstimate,
      'carbsEstimate': instance.carbsEstimate,
      'fatEstimate': instance.fatEstimate,
      'isAiEstimate': instance.isAiEstimate,
      'isUserEdited': instance.isUserEdited,
      'confidence': instance.confidence,
    };

_$WorkoutLogImpl _$$WorkoutLogImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutLogImpl(
      id: json['id'] as String,
      dailyLogId: json['dailyLogId'] as String,
      date: DateTime.parse(json['date'] as String),
      type: json['type'] as String,
      duration: (json['duration'] as num).toInt(),
      intensity: (json['intensity'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      source: $enumDecode(_$WorkoutSourceEnumMap, json['source']),
      caloriesBurned: (json['caloriesBurned'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WorkoutLogImplToJson(_$WorkoutLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dailyLogId': instance.dailyLogId,
      'date': instance.date.toIso8601String(),
      'type': instance.type,
      'duration': instance.duration,
      'intensity': instance.intensity,
      'notes': instance.notes,
      'source': _$WorkoutSourceEnumMap[instance.source]!,
      'caloriesBurned': instance.caloriesBurned,
    };

const _$WorkoutSourceEnumMap = {
  WorkoutSource.manual: 'manual',
  WorkoutSource.watch: 'watch',
};
