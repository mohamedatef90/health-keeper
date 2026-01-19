// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_need.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SleepNeedImpl _$$SleepNeedImplFromJson(Map<String, dynamic> json) =>
    _$SleepNeedImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      calculatedAt: DateTime.parse(json['calculatedAt'] as String),
      baseNeed: (json['baseNeed'] as num).toDouble(),
      debtPayback: (json['debtPayback'] as num).toDouble(),
      strainAdjustment: (json['strainAdjustment'] as num).toDouble(),
      totalNeed: (json['totalNeed'] as num).toDouble(),
      actualSleep: (json['actualSleep'] as num?)?.toDouble(),
      sleepDebt: (json['sleepDebt'] as num).toDouble(),
      strainScore: (json['strainScore'] as num).toDouble(),
      recommendedBedtime: json['recommendedBedtime'] == null
          ? null
          : DateTime.parse(json['recommendedBedtime'] as String),
      recommendedWakeTime: json['recommendedWakeTime'] == null
          ? null
          : DateTime.parse(json['recommendedWakeTime'] as String),
    );

Map<String, dynamic> _$$SleepNeedImplToJson(_$SleepNeedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'calculatedAt': instance.calculatedAt.toIso8601String(),
      'baseNeed': instance.baseNeed,
      'debtPayback': instance.debtPayback,
      'strainAdjustment': instance.strainAdjustment,
      'totalNeed': instance.totalNeed,
      'actualSleep': instance.actualSleep,
      'sleepDebt': instance.sleepDebt,
      'strainScore': instance.strainScore,
      'recommendedBedtime': instance.recommendedBedtime?.toIso8601String(),
      'recommendedWakeTime': instance.recommendedWakeTime?.toIso8601String(),
    };

_$SleepDebtTrackerImpl _$$SleepDebtTrackerImplFromJson(
  Map<String, dynamic> json,
) => _$SleepDebtTrackerImpl(
  id: json['id'] as String,
  date: DateTime.parse(json['date'] as String),
  totalDebt: (json['totalDebt'] as num).toDouble(),
  recentRecords: (json['recentRecords'] as List<dynamic>)
      .map((e) => DailySleepRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
  avgNightlyDeficit: (json['avgNightlyDeficit'] as num).toDouble(),
  estimatedRecoveryDays: (json['estimatedRecoveryDays'] as num).toInt(),
);

Map<String, dynamic> _$$SleepDebtTrackerImplToJson(
  _$SleepDebtTrackerImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'totalDebt': instance.totalDebt,
  'recentRecords': instance.recentRecords,
  'avgNightlyDeficit': instance.avgNightlyDeficit,
  'estimatedRecoveryDays': instance.estimatedRecoveryDays,
};

_$DailySleepRecordImpl _$$DailySleepRecordImplFromJson(
  Map<String, dynamic> json,
) => _$DailySleepRecordImpl(
  date: DateTime.parse(json['date'] as String),
  needed: (json['needed'] as num).toDouble(),
  actual: (json['actual'] as num).toDouble(),
  deficit: (json['deficit'] as num).toDouble(),
);

Map<String, dynamic> _$$DailySleepRecordImplToJson(
  _$DailySleepRecordImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'needed': instance.needed,
  'actual': instance.actual,
  'deficit': instance.deficit,
};
