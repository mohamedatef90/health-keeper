// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecoveryMetricsImpl _$$RecoveryMetricsImplFromJson(
  Map<String, dynamic> json,
) => _$RecoveryMetricsImpl(
  id: json['id'] as String,
  dailyLogId: json['dailyLogId'] as String,
  date: DateTime.parse(json['date'] as String),
  fetchedAt: DateTime.parse(json['fetchedAt'] as String),
  sleepDuration: (json['sleepDuration'] as num?)?.toDouble(),
  sleepQuality: (json['sleepQuality'] as num?)?.toInt(),
  hrv: (json['hrv'] as num?)?.toInt(),
  restingHR: (json['restingHR'] as num?)?.toInt(),
  steps: (json['steps'] as num?)?.toInt(),
  activeEnergy: (json['activeEnergy'] as num?)?.toInt(),
  workoutsCount: (json['workoutsCount'] as num?)?.toInt(),
  dataSource: $enumDecode(_$DataSourceEnumMap, json['dataSource']),
);

Map<String, dynamic> _$$RecoveryMetricsImplToJson(
  _$RecoveryMetricsImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'dailyLogId': instance.dailyLogId,
  'date': instance.date.toIso8601String(),
  'fetchedAt': instance.fetchedAt.toIso8601String(),
  'sleepDuration': instance.sleepDuration,
  'sleepQuality': instance.sleepQuality,
  'hrv': instance.hrv,
  'restingHR': instance.restingHR,
  'steps': instance.steps,
  'activeEnergy': instance.activeEnergy,
  'workoutsCount': instance.workoutsCount,
  'dataSource': _$DataSourceEnumMap[instance.dataSource]!,
};

const _$DataSourceEnumMap = {
  DataSource.healthkit: 'healthkit',
  DataSource.manual: 'manual',
};

_$DailyBriefImpl _$$DailyBriefImplFromJson(Map<String, dynamic> json) =>
    _$DailyBriefImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      recoveryScore: (json['recoveryScore'] as num).toInt(),
      readinessScore: (json['readinessScore'] as num).toInt(),
      topActions:
          (json['topActions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      warnings:
          (json['warnings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      suggestedIntensity: (json['suggestedIntensity'] as num).toInt(),
      coachingText: json['coachingText'] as String,
      isAiGenerated: json['isAiGenerated'] as bool? ?? true,
      dailyLogId: json['dailyLogId'] as String?,
    );

Map<String, dynamic> _$$DailyBriefImplToJson(_$DailyBriefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'generatedAt': instance.generatedAt.toIso8601String(),
      'recoveryScore': instance.recoveryScore,
      'readinessScore': instance.readinessScore,
      'topActions': instance.topActions,
      'warnings': instance.warnings,
      'suggestedIntensity': instance.suggestedIntensity,
      'coachingText': instance.coachingText,
      'isAiGenerated': instance.isAiGenerated,
      'dailyLogId': instance.dailyLogId,
    };

_$WeeklyReportImpl _$$WeeklyReportImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyReportImpl(
      id: json['id'] as String,
      weekStartDate: DateTime.parse(json['weekStartDate'] as String),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      summary: json['summary'] as String,
      highlights:
          (json['highlights'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      concerns:
          (json['concerns'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      progressAnalysis: json['progressAnalysis'] as String,
      nextWeekFocus: json['nextWeekFocus'] as String,
      isAiGenerated: json['isAiGenerated'] as bool? ?? true,
    );

Map<String, dynamic> _$$WeeklyReportImplToJson(_$WeeklyReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weekStartDate': instance.weekStartDate.toIso8601String(),
      'generatedAt': instance.generatedAt.toIso8601String(),
      'summary': instance.summary,
      'highlights': instance.highlights,
      'concerns': instance.concerns,
      'progressAnalysis': instance.progressAnalysis,
      'nextWeekFocus': instance.nextWeekFocus,
      'isAiGenerated': instance.isAiGenerated,
    };
