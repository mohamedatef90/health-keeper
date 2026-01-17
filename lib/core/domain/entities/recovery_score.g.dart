// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecoveryScoreImpl _$$RecoveryScoreImplFromJson(Map<String, dynamic> json) =>
    _$RecoveryScoreImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      calculatedAt: DateTime.parse(json['calculatedAt'] as String),
      score: (json['score'] as num).toInt(),
      components: RecoveryComponents.fromJson(
        json['components'] as Map<String, dynamic>,
      ),
      baseline: BaselineMetrics.fromJson(
        json['baseline'] as Map<String, dynamic>,
      ),
      deviations: MetricDeviations.fromJson(
        json['deviations'] as Map<String, dynamic>,
      ),
      sleepPerformance: json['sleepPerformance'] == null
          ? null
          : SleepPerformance.fromJson(
              json['sleepPerformance'] as Map<String, dynamic>,
            ),
      state: $enumDecode(_$RecoveryStateEnumMap, json['state']),
      dataSource: $enumDecode(_$RecoveryDataSourceEnumMap, json['dataSource']),
    );

Map<String, dynamic> _$$RecoveryScoreImplToJson(_$RecoveryScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'calculatedAt': instance.calculatedAt.toIso8601String(),
      'score': instance.score,
      'components': instance.components,
      'baseline': instance.baseline,
      'deviations': instance.deviations,
      'sleepPerformance': instance.sleepPerformance,
      'state': _$RecoveryStateEnumMap[instance.state]!,
      'dataSource': _$RecoveryDataSourceEnumMap[instance.dataSource]!,
    };

const _$RecoveryStateEnumMap = {
  RecoveryState.peak: 'peak',
  RecoveryState.good: 'good',
  RecoveryState.moderate: 'moderate',
  RecoveryState.low: 'low',
  RecoveryState.rest: 'rest',
};

const _$RecoveryDataSourceEnumMap = {
  RecoveryDataSource.healthkit: 'healthkit',
  RecoveryDataSource.manual: 'manual',
  RecoveryDataSource.calculated: 'calculated',
};

_$RecoveryComponentsImpl _$$RecoveryComponentsImplFromJson(
  Map<String, dynamic> json,
) => _$RecoveryComponentsImpl(
  hrvScore: (json['hrvScore'] as num).toInt(),
  rhrScore: (json['rhrScore'] as num).toInt(),
  sleepScore: (json['sleepScore'] as num).toInt(),
  respiratoryScore: (json['respiratoryScore'] as num).toInt(),
);

Map<String, dynamic> _$$RecoveryComponentsImplToJson(
  _$RecoveryComponentsImpl instance,
) => <String, dynamic>{
  'hrvScore': instance.hrvScore,
  'rhrScore': instance.rhrScore,
  'sleepScore': instance.sleepScore,
  'respiratoryScore': instance.respiratoryScore,
};

_$BaselineMetricsImpl _$$BaselineMetricsImplFromJson(
  Map<String, dynamic> json,
) => _$BaselineMetricsImpl(
  avgHrv: (json['avgHrv'] as num).toDouble(),
  hrvStdDev: (json['hrvStdDev'] as num).toDouble(),
  avgRhr: (json['avgRhr'] as num).toDouble(),
  rhrStdDev: (json['rhrStdDev'] as num).toDouble(),
  avgSleepDuration: (json['avgSleepDuration'] as num).toDouble(),
  avgRespiratoryRate: (json['avgRespiratoryRate'] as num).toDouble(),
  respiratoryRateStdDev: (json['respiratoryRateStdDev'] as num).toDouble(),
  daysInBaseline: (json['daysInBaseline'] as num).toInt(),
);

Map<String, dynamic> _$$BaselineMetricsImplToJson(
  _$BaselineMetricsImpl instance,
) => <String, dynamic>{
  'avgHrv': instance.avgHrv,
  'hrvStdDev': instance.hrvStdDev,
  'avgRhr': instance.avgRhr,
  'rhrStdDev': instance.rhrStdDev,
  'avgSleepDuration': instance.avgSleepDuration,
  'avgRespiratoryRate': instance.avgRespiratoryRate,
  'respiratoryRateStdDev': instance.respiratoryRateStdDev,
  'daysInBaseline': instance.daysInBaseline,
};

_$MetricDeviationsImpl _$$MetricDeviationsImplFromJson(
  Map<String, dynamic> json,
) => _$MetricDeviationsImpl(
  hrvDeviation: (json['hrvDeviation'] as num).toDouble(),
  rhrDeviation: (json['rhrDeviation'] as num).toDouble(),
  sleepDeviation: (json['sleepDeviation'] as num).toDouble(),
  respiratoryDeviation: (json['respiratoryDeviation'] as num).toDouble(),
);

Map<String, dynamic> _$$MetricDeviationsImplToJson(
  _$MetricDeviationsImpl instance,
) => <String, dynamic>{
  'hrvDeviation': instance.hrvDeviation,
  'rhrDeviation': instance.rhrDeviation,
  'sleepDeviation': instance.sleepDeviation,
  'respiratoryDeviation': instance.respiratoryDeviation,
};

_$SleepPerformanceImpl _$$SleepPerformanceImplFromJson(
  Map<String, dynamic> json,
) => _$SleepPerformanceImpl(
  actualSleep: (json['actualSleep'] as num).toDouble(),
  neededSleep: (json['neededSleep'] as num).toDouble(),
  efficiency: (json['efficiency'] as num?)?.toInt(),
  stages: json['stages'] == null
      ? null
      : SleepStages.fromJson(json['stages'] as Map<String, dynamic>),
  qualityScore: (json['qualityScore'] as num?)?.toInt(),
);

Map<String, dynamic> _$$SleepPerformanceImplToJson(
  _$SleepPerformanceImpl instance,
) => <String, dynamic>{
  'actualSleep': instance.actualSleep,
  'neededSleep': instance.neededSleep,
  'efficiency': instance.efficiency,
  'stages': instance.stages,
  'qualityScore': instance.qualityScore,
};

_$SleepStagesImpl _$$SleepStagesImplFromJson(Map<String, dynamic> json) =>
    _$SleepStagesImpl(
      lightMinutes: (json['lightMinutes'] as num?)?.toInt() ?? 0,
      deepMinutes: (json['deepMinutes'] as num?)?.toInt() ?? 0,
      remMinutes: (json['remMinutes'] as num?)?.toInt() ?? 0,
      awakeMinutes: (json['awakeMinutes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SleepStagesImplToJson(_$SleepStagesImpl instance) =>
    <String, dynamic>{
      'lightMinutes': instance.lightMinutes,
      'deepMinutes': instance.deepMinutes,
      'remMinutes': instance.remMinutes,
      'awakeMinutes': instance.awakeMinutes,
    };
