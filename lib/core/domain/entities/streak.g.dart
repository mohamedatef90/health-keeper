// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakImpl _$$StreakImplFromJson(Map<String, dynamic> json) => _$StreakImpl(
  id: json['id'] as String,
  type: $enumDecode(_$StreakTypeEnumMap, json['type']),
  currentCount: (json['currentCount'] as num).toInt(),
  longestEver: (json['longestEver'] as num).toInt(),
  lastAchievedAt: json['lastAchievedAt'] == null
      ? null
      : DateTime.parse(json['lastAchievedAt'] as String),
  startedAt: json['startedAt'] == null
      ? null
      : DateTime.parse(json['startedAt'] as String),
  brokenAt: json['brokenAt'] == null
      ? null
      : DateTime.parse(json['brokenAt'] as String),
  isActive: json['isActive'] as bool,
  currentMilestone: (json['currentMilestone'] as num?)?.toInt(),
  nextMilestone: (json['nextMilestone'] as num?)?.toInt(),
  daysToNextMilestone: (json['daysToNextMilestone'] as num?)?.toInt(),
);

Map<String, dynamic> _$$StreakImplToJson(_$StreakImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$StreakTypeEnumMap[instance.type]!,
      'currentCount': instance.currentCount,
      'longestEver': instance.longestEver,
      'lastAchievedAt': instance.lastAchievedAt?.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'brokenAt': instance.brokenAt?.toIso8601String(),
      'isActive': instance.isActive,
      'currentMilestone': instance.currentMilestone,
      'nextMilestone': instance.nextMilestone,
      'daysToNextMilestone': instance.daysToNextMilestone,
    };

const _$StreakTypeEnumMap = {
  StreakType.strainTarget: 'strain_target',
  StreakType.optimalSleep: 'optimal_sleep',
  StreakType.highRecovery: 'high_recovery',
  StreakType.mealLogging: 'meal_logging',
  StreakType.workoutComplete: 'workout_complete',
  StreakType.journalEntry: 'journal_entry',
  StreakType.weightLogging: 'weight_logging',
  StreakType.stepGoal: 'step_goal',
};

_$StreakCollectionImpl _$$StreakCollectionImplFromJson(
  Map<String, dynamic> json,
) => _$StreakCollectionImpl(
  userId: json['userId'] as String,
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  streaks:
      (json['streaks'] as List<dynamic>?)
          ?.map((e) => Streak.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$StreakCollectionImplToJson(
  _$StreakCollectionImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'streaks': instance.streaks,
};

_$StreakMilestoneImpl _$$StreakMilestoneImplFromJson(
  Map<String, dynamic> json,
) => _$StreakMilestoneImpl(
  streakType: $enumDecode(_$StreakTypeEnumMap, json['streakType']),
  milestone: (json['milestone'] as num).toInt(),
  achievedAt: DateTime.parse(json['achievedAt'] as String),
  title: json['title'] as String,
  titleAr: json['titleAr'] as String,
  message: json['message'] as String,
  messageAr: json['messageAr'] as String,
  celebrated: json['celebrated'] as bool? ?? false,
);

Map<String, dynamic> _$$StreakMilestoneImplToJson(
  _$StreakMilestoneImpl instance,
) => <String, dynamic>{
  'streakType': _$StreakTypeEnumMap[instance.streakType]!,
  'milestone': instance.milestone,
  'achievedAt': instance.achievedAt.toIso8601String(),
  'title': instance.title,
  'titleAr': instance.titleAr,
  'message': instance.message,
  'messageAr': instance.messageAr,
  'celebrated': instance.celebrated,
};
