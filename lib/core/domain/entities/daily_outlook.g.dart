// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_outlook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyOutlookImpl _$$DailyOutlookImplFromJson(Map<String, dynamic> json) =>
    _$DailyOutlookImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      recoveryScore: (json['recoveryScore'] as num).toInt(),
      recoveryState: $enumDecode(
        _$RecoveryOutlookStateEnumMap,
        json['recoveryState'],
      ),
      strainTarget: StrainTarget.fromJson(
        json['strainTarget'] as Map<String, dynamic>,
      ),
      sleepOutlook: SleepOutlook.fromJson(
        json['sleepOutlook'] as Map<String, dynamic>,
      ),
      sleepNeedHours: (json['sleepNeedHours'] as num).toDouble(),
      recommendedBedtime: json['recommendedBedtime'] == null
          ? null
          : DateTime.parse(json['recommendedBedtime'] as String),
      recommendedActivities:
          (json['recommendedActivities'] as List<dynamic>?)
              ?.map(
                (e) => RecommendedActivity.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      behaviorsToTrack:
          (json['behaviorsToTrack'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      insights:
          (json['insights'] as List<dynamic>?)
              ?.map((e) => OutlookInsight.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      aiInsight: json['aiInsight'] as String?,
      aiInsightAr: json['aiInsightAr'] as String?,
      isAiGenerated: json['isAiGenerated'] as bool? ?? false,
      confidence: (json['confidence'] as num?)?.toInt() ?? 70,
    );

Map<String, dynamic> _$$DailyOutlookImplToJson(_$DailyOutlookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'generatedAt': instance.generatedAt.toIso8601String(),
      'recoveryScore': instance.recoveryScore,
      'recoveryState': _$RecoveryOutlookStateEnumMap[instance.recoveryState]!,
      'strainTarget': instance.strainTarget,
      'sleepOutlook': instance.sleepOutlook,
      'sleepNeedHours': instance.sleepNeedHours,
      'recommendedBedtime': instance.recommendedBedtime?.toIso8601String(),
      'recommendedActivities': instance.recommendedActivities,
      'behaviorsToTrack': instance.behaviorsToTrack,
      'insights': instance.insights,
      'aiInsight': instance.aiInsight,
      'aiInsightAr': instance.aiInsightAr,
      'isAiGenerated': instance.isAiGenerated,
      'confidence': instance.confidence,
    };

const _$RecoveryOutlookStateEnumMap = {
  RecoveryOutlookState.peak: 'peak',
  RecoveryOutlookState.good: 'good',
  RecoveryOutlookState.moderate: 'moderate',
  RecoveryOutlookState.low: 'low',
  RecoveryOutlookState.rest: 'rest',
};

_$SleepOutlookImpl _$$SleepOutlookImplFromJson(Map<String, dynamic> json) =>
    _$SleepOutlookImpl(
      hoursSlept: (json['hoursSlept'] as num).toDouble(),
      qualityScore: (json['qualityScore'] as num?)?.toInt(),
      hoursNeeded: (json['hoursNeeded'] as num).toDouble(),
      efficiency: (json['efficiency'] as num?)?.toInt(),
      metNeed: json['metNeed'] as bool,
    );

Map<String, dynamic> _$$SleepOutlookImplToJson(_$SleepOutlookImpl instance) =>
    <String, dynamic>{
      'hoursSlept': instance.hoursSlept,
      'qualityScore': instance.qualityScore,
      'hoursNeeded': instance.hoursNeeded,
      'efficiency': instance.efficiency,
      'metNeed': instance.metNeed,
    };

_$RecommendedActivityImpl _$$RecommendedActivityImplFromJson(
  Map<String, dynamic> json,
) => _$RecommendedActivityImpl(
  id: json['id'] as String,
  type: json['type'] as String,
  name: json['name'] as String,
  nameAr: json['nameAr'] as String,
  description: json['description'] as String,
  descriptionAr: json['descriptionAr'] as String,
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  intensity: (json['intensity'] as num).toInt(),
  expectedStrain: (json['expectedStrain'] as num).toDouble(),
  isPrimary: json['isPrimary'] as bool? ?? false,
  iconName: json['iconName'] as String?,
);

Map<String, dynamic> _$$RecommendedActivityImplToJson(
  _$RecommendedActivityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'name': instance.name,
  'nameAr': instance.nameAr,
  'description': instance.description,
  'descriptionAr': instance.descriptionAr,
  'durationMinutes': instance.durationMinutes,
  'intensity': instance.intensity,
  'expectedStrain': instance.expectedStrain,
  'isPrimary': instance.isPrimary,
  'iconName': instance.iconName,
};

_$OutlookInsightImpl _$$OutlookInsightImplFromJson(Map<String, dynamic> json) =>
    _$OutlookInsightImpl(
      id: json['id'] as String,
      type: $enumDecode(_$OutlookInsightTypeEnumMap, json['type']),
      title: json['title'] as String,
      titleAr: json['titleAr'] as String,
      message: json['message'] as String,
      messageAr: json['messageAr'] as String,
      priority: (json['priority'] as num?)?.toInt() ?? 3,
      isActionable: json['isActionable'] as bool? ?? false,
      actionType: json['actionType'] as String?,
    );

Map<String, dynamic> _$$OutlookInsightImplToJson(
  _$OutlookInsightImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$OutlookInsightTypeEnumMap[instance.type]!,
  'title': instance.title,
  'titleAr': instance.titleAr,
  'message': instance.message,
  'messageAr': instance.messageAr,
  'priority': instance.priority,
  'isActionable': instance.isActionable,
  'actionType': instance.actionType,
};

const _$OutlookInsightTypeEnumMap = {
  OutlookInsightType.recovery: 'recovery',
  OutlookInsightType.sleep: 'sleep',
  OutlookInsightType.strain: 'strain',
  OutlookInsightType.nutrition: 'nutrition',
  OutlookInsightType.trend: 'trend',
  OutlookInsightType.alert: 'alert',
  OutlookInsightType.achievement: 'achievement',
};
