// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetectedWorkoutImpl _$$DetectedWorkoutImplFromJson(
  Map<String, dynamic> json,
) => _$DetectedWorkoutImpl(
  id: json['id'] as String,
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: DateTime.parse(json['endTime'] as String),
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  averageHeartRate: (json['averageHeartRate'] as num).toDouble(),
  maxHeartRate: (json['maxHeartRate'] as num).toDouble(),
  minHeartRate: (json['minHeartRate'] as num?)?.toDouble(),
  heartRateSamples:
      (json['heartRateSamples'] as List<dynamic>?)
          ?.map((e) => HeartRateSample.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  estimatedCalories: (json['estimatedCalories'] as num).toInt(),
  intensity: $enumDecode(_$WorkoutIntensityEnumMap, json['intensity']),
  suggestedType: json['suggestedType'] as String,
  confidence: (json['confidence'] as num).toDouble(),
  steps: (json['steps'] as num?)?.toInt(),
  activeEnergy: (json['activeEnergy'] as num?)?.toInt(),
  distanceMeters: (json['distanceMeters'] as num?)?.toDouble(),
  elevationGain: (json['elevationGain'] as num?)?.toDouble(),
  heartRateZones: json['heartRateZones'] == null
      ? null
      : HeartRateZones.fromJson(json['heartRateZones'] as Map<String, dynamic>),
  source:
      $enumDecodeNullable(_$DetectionSourceEnumMap, json['source']) ??
      DetectionSource.healthkit,
  isConfirmed: json['isConfirmed'] as bool? ?? false,
  isDismissed: json['isDismissed'] as bool? ?? false,
  analysisNotes: json['analysisNotes'] as String?,
);

Map<String, dynamic> _$$DetectedWorkoutImplToJson(
  _$DetectedWorkoutImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'startTime': instance.startTime.toIso8601String(),
  'endTime': instance.endTime.toIso8601String(),
  'durationMinutes': instance.durationMinutes,
  'averageHeartRate': instance.averageHeartRate,
  'maxHeartRate': instance.maxHeartRate,
  'minHeartRate': instance.minHeartRate,
  'heartRateSamples': instance.heartRateSamples,
  'estimatedCalories': instance.estimatedCalories,
  'intensity': _$WorkoutIntensityEnumMap[instance.intensity]!,
  'suggestedType': instance.suggestedType,
  'confidence': instance.confidence,
  'steps': instance.steps,
  'activeEnergy': instance.activeEnergy,
  'distanceMeters': instance.distanceMeters,
  'elevationGain': instance.elevationGain,
  'heartRateZones': instance.heartRateZones,
  'source': _$DetectionSourceEnumMap[instance.source]!,
  'isConfirmed': instance.isConfirmed,
  'isDismissed': instance.isDismissed,
  'analysisNotes': instance.analysisNotes,
};

const _$WorkoutIntensityEnumMap = {
  WorkoutIntensity.veryLight: 'very_light',
  WorkoutIntensity.light: 'light',
  WorkoutIntensity.moderate: 'moderate',
  WorkoutIntensity.high: 'high',
  WorkoutIntensity.maximum: 'maximum',
};

const _$DetectionSourceEnumMap = {
  DetectionSource.healthkit: 'healthkit',
  DetectionSource.watch: 'watch',
  DetectionSource.manual: 'manual',
  DetectionSource.ai: 'ai',
};

_$HeartRateSampleImpl _$$HeartRateSampleImplFromJson(
  Map<String, dynamic> json,
) => _$HeartRateSampleImpl(
  timestamp: DateTime.parse(json['timestamp'] as String),
  heartRate: (json['heartRate'] as num).toInt(),
);

Map<String, dynamic> _$$HeartRateSampleImplToJson(
  _$HeartRateSampleImpl instance,
) => <String, dynamic>{
  'timestamp': instance.timestamp.toIso8601String(),
  'heartRate': instance.heartRate,
};

_$StepSampleImpl _$$StepSampleImplFromJson(Map<String, dynamic> json) =>
    _$StepSampleImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      steps: (json['steps'] as num).toInt(),
    );

Map<String, dynamic> _$$StepSampleImplToJson(_$StepSampleImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'steps': instance.steps,
    };

_$HeartRateZonesImpl _$$HeartRateZonesImplFromJson(Map<String, dynamic> json) =>
    _$HeartRateZonesImpl(
      zone1Minutes: (json['zone1Minutes'] as num?)?.toInt() ?? 0,
      zone2Minutes: (json['zone2Minutes'] as num?)?.toInt() ?? 0,
      zone3Minutes: (json['zone3Minutes'] as num?)?.toInt() ?? 0,
      zone4Minutes: (json['zone4Minutes'] as num?)?.toInt() ?? 0,
      zone5Minutes: (json['zone5Minutes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$HeartRateZonesImplToJson(
  _$HeartRateZonesImpl instance,
) => <String, dynamic>{
  'zone1Minutes': instance.zone1Minutes,
  'zone2Minutes': instance.zone2Minutes,
  'zone3Minutes': instance.zone3Minutes,
  'zone4Minutes': instance.zone4Minutes,
  'zone5Minutes': instance.zone5Minutes,
};

_$WorkoutClassificationImpl _$$WorkoutClassificationImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutClassificationImpl(
  primaryType: json['primaryType'] as String,
  confidence: (json['confidence'] as num).toDouble(),
  alternatives:
      (json['alternatives'] as List<dynamic>?)
          ?.map(
            (e) =>
                ClassificationAlternative.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  reasoning: json['reasoning'] as String?,
  isAiClassified: json['isAiClassified'] as bool? ?? false,
);

Map<String, dynamic> _$$WorkoutClassificationImplToJson(
  _$WorkoutClassificationImpl instance,
) => <String, dynamic>{
  'primaryType': instance.primaryType,
  'confidence': instance.confidence,
  'alternatives': instance.alternatives,
  'reasoning': instance.reasoning,
  'isAiClassified': instance.isAiClassified,
};

_$ClassificationAlternativeImpl _$$ClassificationAlternativeImplFromJson(
  Map<String, dynamic> json,
) => _$ClassificationAlternativeImpl(
  type: json['type'] as String,
  confidence: (json['confidence'] as num).toDouble(),
);

Map<String, dynamic> _$$ClassificationAlternativeImplToJson(
  _$ClassificationAlternativeImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'confidence': instance.confidence,
};
