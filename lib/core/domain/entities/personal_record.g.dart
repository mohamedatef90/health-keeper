// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalRecordImpl _$$PersonalRecordImplFromJson(Map<String, dynamic> json) =>
    _$PersonalRecordImpl(
      id: json['id'] as String,
      category: $enumDecode(_$RecordCategoryEnumMap, json['category']),
      metric: $enumDecode(_$RecordMetricEnumMap, json['metric']),
      value: (json['value'] as num).toDouble(),
      formattedValue: json['formattedValue'] as String?,
      achievedAt: DateTime.parse(json['achievedAt'] as String),
      previousValue: (json['previousValue'] as num?)?.toDouble(),
      previousAchievedAt: json['previousAchievedAt'] == null
          ? null
          : DateTime.parse(json['previousAchievedAt'] as String),
      isAllTime: json['isAllTime'] as bool? ?? true,
      timesImproved: (json['timesImproved'] as num?)?.toInt() ?? 0,
      context: json['context'] as String?,
    );

Map<String, dynamic> _$$PersonalRecordImplToJson(
  _$PersonalRecordImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'category': _$RecordCategoryEnumMap[instance.category]!,
  'metric': _$RecordMetricEnumMap[instance.metric]!,
  'value': instance.value,
  'formattedValue': instance.formattedValue,
  'achievedAt': instance.achievedAt.toIso8601String(),
  'previousValue': instance.previousValue,
  'previousAchievedAt': instance.previousAchievedAt?.toIso8601String(),
  'isAllTime': instance.isAllTime,
  'timesImproved': instance.timesImproved,
  'context': instance.context,
};

const _$RecordCategoryEnumMap = {
  RecordCategory.recovery: 'recovery',
  RecordCategory.strain: 'strain',
  RecordCategory.sleep: 'sleep',
  RecordCategory.activity: 'activity',
  RecordCategory.nutrition: 'nutrition',
  RecordCategory.streaks: 'streaks',
  RecordCategory.consistency: 'consistency',
};

const _$RecordMetricEnumMap = {
  RecordMetric.highestRecovery: 'highest_recovery',
  RecordMetric.highestHrv: 'highest_hrv',
  RecordMetric.lowestRhr: 'lowest_rhr',
  RecordMetric.highestStrain: 'highest_strain',
  RecordMetric.highestDailyCaloriesBurned: 'highest_daily_calories_burned',
  RecordMetric.longestSleep: 'longest_sleep',
  RecordMetric.bestSleepQuality: 'best_sleep_quality',
  RecordMetric.bestSleepEfficiency: 'best_sleep_efficiency',
  RecordMetric.mostSteps: 'most_steps',
  RecordMetric.longestWorkout: 'longest_workout',
  RecordMetric.mostWorkoutsWeek: 'most_workouts_week',
  RecordMetric.mostActiveMinutes: 'most_active_minutes',
  RecordMetric.longestMealLoggingStreak: 'longest_meal_logging_streak',
  RecordMetric.mostConsistentProtein: 'most_consistent_protein',
  RecordMetric.longestRecoveryStreak: 'longest_recovery_streak',
  RecordMetric.longestWorkoutStreak: 'longest_workout_streak',
  RecordMetric.longestSleepStreak: 'longest_sleep_streak',
  RecordMetric.longestStrainTargetStreak: 'longest_strain_target_streak',
  RecordMetric.mostConsistentWeek: 'most_consistent_week',
  RecordMetric.mostConsistentMonth: 'most_consistent_month',
  RecordMetric.totalWorkouts: 'total_workouts',
  RecordMetric.totalMealsLogged: 'total_meals_logged',
};

_$PersonalRecordCollectionImpl _$$PersonalRecordCollectionImplFromJson(
  Map<String, dynamic> json,
) => _$PersonalRecordCollectionImpl(
  userId: json['userId'] as String,
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  records:
      (json['records'] as List<dynamic>?)
          ?.map((e) => PersonalRecord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$PersonalRecordCollectionImplToJson(
  _$PersonalRecordCollectionImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'records': instance.records,
};

_$AllTimeStatsImpl _$$AllTimeStatsImplFromJson(Map<String, dynamic> json) =>
    _$AllTimeStatsImpl(
      userId: json['userId'] as String,
      calculatedAt: DateTime.parse(json['calculatedAt'] as String),
      totalDaysTracked: (json['totalDaysTracked'] as num).toInt(),
      totalWorkouts: (json['totalWorkouts'] as num).toInt(),
      totalMealsLogged: (json['totalMealsLogged'] as num).toInt(),
      totalCaloriesBurned: (json['totalCaloriesBurned'] as num).toInt(),
      totalSteps: (json['totalSteps'] as num).toInt(),
      totalSleepHours: (json['totalSleepHours'] as num).toDouble(),
      avgRecovery: (json['avgRecovery'] as num).toDouble(),
      avgStrain: (json['avgStrain'] as num).toDouble(),
      bestWeekDate: json['bestWeekDate'] == null
          ? null
          : DateTime.parse(json['bestWeekDate'] as String),
      bestWeekScore: (json['bestWeekScore'] as num?)?.toDouble(),
      bestMonthDate: json['bestMonthDate'] == null
          ? null
          : DateTime.parse(json['bestMonthDate'] as String),
      bestMonthScore: (json['bestMonthScore'] as num?)?.toDouble(),
      records: PersonalRecordCollection.fromJson(
        json['records'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$AllTimeStatsImplToJson(_$AllTimeStatsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'calculatedAt': instance.calculatedAt.toIso8601String(),
      'totalDaysTracked': instance.totalDaysTracked,
      'totalWorkouts': instance.totalWorkouts,
      'totalMealsLogged': instance.totalMealsLogged,
      'totalCaloriesBurned': instance.totalCaloriesBurned,
      'totalSteps': instance.totalSteps,
      'totalSleepHours': instance.totalSleepHours,
      'avgRecovery': instance.avgRecovery,
      'avgStrain': instance.avgStrain,
      'bestWeekDate': instance.bestWeekDate?.toIso8601String(),
      'bestWeekScore': instance.bestWeekScore,
      'bestMonthDate': instance.bestMonthDate?.toIso8601String(),
      'bestMonthScore': instance.bestMonthScore,
      'records': instance.records,
    };
