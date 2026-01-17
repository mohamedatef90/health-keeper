// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalEntryImpl _$$JournalEntryImplFromJson(Map<String, dynamic> json) =>
    _$JournalEntryImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      behaviors:
          (json['behaviors'] as List<dynamic>?)
              ?.map((e) => LoggedBehavior.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      notes: json['notes'] as String?,
      moodLevel: (json['moodLevel'] as num?)?.toInt(),
      stressLevel: (json['stressLevel'] as num?)?.toInt(),
      isReviewed: json['isReviewed'] as bool? ?? false,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$JournalEntryImplToJson(_$JournalEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'behaviors': instance.behaviors,
      'notes': instance.notes,
      'moodLevel': instance.moodLevel,
      'stressLevel': instance.stressLevel,
      'isReviewed': instance.isReviewed,
      'tags': instance.tags,
    };

_$LoggedBehaviorImpl _$$LoggedBehaviorImplFromJson(Map<String, dynamic> json) =>
    _$LoggedBehaviorImpl(
      id: json['id'] as String,
      behaviorId: json['behaviorId'] as String,
      loggedAt: DateTime.parse(json['loggedAt'] as String),
      value: (json['value'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      intensity: (json['intensity'] as num?)?.toInt(),
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
      note: json['note'] as String?,
      customDataJson: json['customDataJson'] as String?,
    );

Map<String, dynamic> _$$LoggedBehaviorImplToJson(
  _$LoggedBehaviorImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'behaviorId': instance.behaviorId,
  'loggedAt': instance.loggedAt.toIso8601String(),
  'value': instance.value,
  'unit': instance.unit,
  'intensity': instance.intensity,
  'durationMinutes': instance.durationMinutes,
  'note': instance.note,
  'customDataJson': instance.customDataJson,
};

_$JournalEntrySummaryImpl _$$JournalEntrySummaryImplFromJson(
  Map<String, dynamic> json,
) => _$JournalEntrySummaryImpl(
  id: json['id'] as String,
  date: DateTime.parse(json['date'] as String),
  behaviorsCount: (json['behaviorsCount'] as num).toInt(),
  topCategories: (json['topCategories'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  moodLevel: (json['moodLevel'] as num?)?.toInt(),
  stressLevel: (json['stressLevel'] as num?)?.toInt(),
);

Map<String, dynamic> _$$JournalEntrySummaryImplToJson(
  _$JournalEntrySummaryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'behaviorsCount': instance.behaviorsCount,
  'topCategories': instance.topCategories,
  'moodLevel': instance.moodLevel,
  'stressLevel': instance.stressLevel,
};
