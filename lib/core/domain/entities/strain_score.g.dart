// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strain_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrainScoreImpl _$$StrainScoreImplFromJson(Map<String, dynamic> json) =>
    _$StrainScoreImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      calculatedAt: DateTime.parse(json['calculatedAt'] as String),
      score: (json['score'] as num).toDouble(),
      maxHeartRate: (json['maxHeartRate'] as num).toInt(),
      zoneData: HRZoneData.fromJson(json['zoneData'] as Map<String, dynamic>),
      totalActiveMinutes: (json['totalActiveMinutes'] as num).toInt(),
      peakHeartRate: (json['peakHeartRate'] as num?)?.toInt(),
      averageHeartRate: (json['averageHeartRate'] as num?)?.toInt(),
      workoutCount: (json['workoutCount'] as num?)?.toInt() ?? 0,
      caloriesBurned: (json['caloriesBurned'] as num?)?.toInt(),
      dataSource: $enumDecode(_$StrainDataSourceEnumMap, json['dataSource']),
    );

Map<String, dynamic> _$$StrainScoreImplToJson(_$StrainScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'calculatedAt': instance.calculatedAt.toIso8601String(),
      'score': instance.score,
      'maxHeartRate': instance.maxHeartRate,
      'zoneData': instance.zoneData,
      'totalActiveMinutes': instance.totalActiveMinutes,
      'peakHeartRate': instance.peakHeartRate,
      'averageHeartRate': instance.averageHeartRate,
      'workoutCount': instance.workoutCount,
      'caloriesBurned': instance.caloriesBurned,
      'dataSource': _$StrainDataSourceEnumMap[instance.dataSource]!,
    };

const _$StrainDataSourceEnumMap = {
  StrainDataSource.healthkit: 'healthkit',
  StrainDataSource.manual: 'manual',
  StrainDataSource.calculated: 'calculated',
};

_$HRZoneDataImpl _$$HRZoneDataImplFromJson(Map<String, dynamic> json) =>
    _$HRZoneDataImpl(
      zone1Minutes: (json['zone1Minutes'] as num?)?.toInt() ?? 0,
      zone2Minutes: (json['zone2Minutes'] as num?)?.toInt() ?? 0,
      zone3Minutes: (json['zone3Minutes'] as num?)?.toInt() ?? 0,
      zone4Minutes: (json['zone4Minutes'] as num?)?.toInt() ?? 0,
      zone5Minutes: (json['zone5Minutes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$HRZoneDataImplToJson(_$HRZoneDataImpl instance) =>
    <String, dynamic>{
      'zone1Minutes': instance.zone1Minutes,
      'zone2Minutes': instance.zone2Minutes,
      'zone3Minutes': instance.zone3Minutes,
      'zone4Minutes': instance.zone4Minutes,
      'zone5Minutes': instance.zone5Minutes,
    };
