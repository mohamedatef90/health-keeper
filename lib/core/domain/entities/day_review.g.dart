// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DayReviewImpl _$$DayReviewImplFromJson(Map<String, dynamic> json) =>
    _$DayReviewImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      strainReview: StrainReview.fromJson(
        json['strainReview'] as Map<String, dynamic>,
      ),
      sleepReview: SleepReview.fromJson(
        json['sleepReview'] as Map<String, dynamic>,
      ),
      nutritionReview: json['nutritionReview'] == null
          ? null
          : NutritionReview.fromJson(
              json['nutritionReview'] as Map<String, dynamic>,
            ),
      recoveryPrediction: RecoveryPrediction.fromJson(
        json['recoveryPrediction'] as Map<String, dynamic>,
      ),
      behaviorImpacts:
          (json['behaviorImpacts'] as List<dynamic>?)
              ?.map(
                (e) => DayBehaviorImpact.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      whatWentWell:
          (json['whatWentWell'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      whatWentWellAr:
          (json['whatWentWellAr'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      areasToImprove:
          (json['areasToImprove'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      areasToImproveAr:
          (json['areasToImproveAr'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sleepRecommendationHours: (json['sleepRecommendationHours'] as num)
          .toDouble(),
      recommendedBedtime: json['recommendedBedtime'] == null
          ? null
          : DateTime.parse(json['recommendedBedtime'] as String),
      aiSummary: json['aiSummary'] as String?,
      aiSummaryAr: json['aiSummaryAr'] as String?,
      overallScore: (json['overallScore'] as num).toInt(),
      isAiGenerated: json['isAiGenerated'] as bool? ?? false,
      confidence: (json['confidence'] as num?)?.toInt() ?? 70,
    );

Map<String, dynamic> _$$DayReviewImplToJson(_$DayReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'generatedAt': instance.generatedAt.toIso8601String(),
      'strainReview': instance.strainReview,
      'sleepReview': instance.sleepReview,
      'nutritionReview': instance.nutritionReview,
      'recoveryPrediction': instance.recoveryPrediction,
      'behaviorImpacts': instance.behaviorImpacts,
      'whatWentWell': instance.whatWentWell,
      'whatWentWellAr': instance.whatWentWellAr,
      'areasToImprove': instance.areasToImprove,
      'areasToImproveAr': instance.areasToImproveAr,
      'sleepRecommendationHours': instance.sleepRecommendationHours,
      'recommendedBedtime': instance.recommendedBedtime?.toIso8601String(),
      'aiSummary': instance.aiSummary,
      'aiSummaryAr': instance.aiSummaryAr,
      'overallScore': instance.overallScore,
      'isAiGenerated': instance.isAiGenerated,
      'confidence': instance.confidence,
    };

_$StrainReviewImpl _$$StrainReviewImplFromJson(Map<String, dynamic> json) =>
    _$StrainReviewImpl(
      strainAchieved: (json['strainAchieved'] as num).toDouble(),
      strainTarget: (json['strainTarget'] as num).toDouble(),
      targetMet: json['targetMet'] as bool,
      wasOptimal: json['wasOptimal'] as bool,
      contributions:
          (json['contributions'] as List<dynamic>?)
              ?.map(
                (e) => StrainContribution.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      totalActiveMinutes: (json['totalActiveMinutes'] as num).toInt(),
      caloriesBurned: (json['caloriesBurned'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StrainReviewImplToJson(_$StrainReviewImpl instance) =>
    <String, dynamic>{
      'strainAchieved': instance.strainAchieved,
      'strainTarget': instance.strainTarget,
      'targetMet': instance.targetMet,
      'wasOptimal': instance.wasOptimal,
      'contributions': instance.contributions,
      'totalActiveMinutes': instance.totalActiveMinutes,
      'caloriesBurned': instance.caloriesBurned,
    };

_$StrainContributionImpl _$$StrainContributionImplFromJson(
  Map<String, dynamic> json,
) => _$StrainContributionImpl(
  activityType: json['activityType'] as String,
  activityName: json['activityName'] as String,
  strain: (json['strain'] as num).toDouble(),
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  startTime: json['startTime'] == null
      ? null
      : DateTime.parse(json['startTime'] as String),
);

Map<String, dynamic> _$$StrainContributionImplToJson(
  _$StrainContributionImpl instance,
) => <String, dynamic>{
  'activityType': instance.activityType,
  'activityName': instance.activityName,
  'strain': instance.strain,
  'durationMinutes': instance.durationMinutes,
  'startTime': instance.startTime?.toIso8601String(),
};

_$SleepReviewImpl _$$SleepReviewImplFromJson(Map<String, dynamic> json) =>
    _$SleepReviewImpl(
      hoursSlept: (json['hoursSlept'] as num).toDouble(),
      hoursNeeded: (json['hoursNeeded'] as num).toDouble(),
      qualityScore: (json['qualityScore'] as num?)?.toInt(),
      efficiency: (json['efficiency'] as num?)?.toInt(),
      timeInBed: (json['timeInBed'] as num?)?.toDouble(),
      stages: json['stages'] == null
          ? null
          : SleepStagesReview.fromJson(json['stages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SleepReviewImplToJson(_$SleepReviewImpl instance) =>
    <String, dynamic>{
      'hoursSlept': instance.hoursSlept,
      'hoursNeeded': instance.hoursNeeded,
      'qualityScore': instance.qualityScore,
      'efficiency': instance.efficiency,
      'timeInBed': instance.timeInBed,
      'stages': instance.stages,
    };

_$SleepStagesReviewImpl _$$SleepStagesReviewImplFromJson(
  Map<String, dynamic> json,
) => _$SleepStagesReviewImpl(
  lightMinutes: (json['lightMinutes'] as num?)?.toInt() ?? 0,
  deepMinutes: (json['deepMinutes'] as num?)?.toInt() ?? 0,
  remMinutes: (json['remMinutes'] as num?)?.toInt() ?? 0,
  awakeMinutes: (json['awakeMinutes'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$SleepStagesReviewImplToJson(
  _$SleepStagesReviewImpl instance,
) => <String, dynamic>{
  'lightMinutes': instance.lightMinutes,
  'deepMinutes': instance.deepMinutes,
  'remMinutes': instance.remMinutes,
  'awakeMinutes': instance.awakeMinutes,
};

_$NutritionReviewImpl _$$NutritionReviewImplFromJson(
  Map<String, dynamic> json,
) => _$NutritionReviewImpl(
  caloriesConsumed: (json['caloriesConsumed'] as num).toInt(),
  caloriesTarget: (json['caloriesTarget'] as num).toInt(),
  proteinConsumed: (json['proteinConsumed'] as num).toInt(),
  proteinTarget: (json['proteinTarget'] as num).toInt(),
  mealsLogged: (json['mealsLogged'] as num).toInt(),
  wasInEatingWindow: json['wasInEatingWindow'] as bool? ?? true,
);

Map<String, dynamic> _$$NutritionReviewImplToJson(
  _$NutritionReviewImpl instance,
) => <String, dynamic>{
  'caloriesConsumed': instance.caloriesConsumed,
  'caloriesTarget': instance.caloriesTarget,
  'proteinConsumed': instance.proteinConsumed,
  'proteinTarget': instance.proteinTarget,
  'mealsLogged': instance.mealsLogged,
  'wasInEatingWindow': instance.wasInEatingWindow,
};

_$RecoveryPredictionImpl _$$RecoveryPredictionImplFromJson(
  Map<String, dynamic> json,
) => _$RecoveryPredictionImpl(
  predictedScore: (json['predictedScore'] as num).toInt(),
  rangeMin: (json['rangeMin'] as num).toInt(),
  rangeMax: (json['rangeMax'] as num).toInt(),
  factors:
      (json['factors'] as List<dynamic>?)
          ?.map((e) => PredictionFactor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  confidence: (json['confidence'] as num?)?.toInt() ?? 70,
);

Map<String, dynamic> _$$RecoveryPredictionImplToJson(
  _$RecoveryPredictionImpl instance,
) => <String, dynamic>{
  'predictedScore': instance.predictedScore,
  'rangeMin': instance.rangeMin,
  'rangeMax': instance.rangeMax,
  'factors': instance.factors,
  'confidence': instance.confidence,
};

_$PredictionFactorImpl _$$PredictionFactorImplFromJson(
  Map<String, dynamic> json,
) => _$PredictionFactorImpl(
  name: json['name'] as String,
  nameAr: json['nameAr'] as String,
  impact: (json['impact'] as num).toInt(),
  description: json['description'] as String,
  descriptionAr: json['descriptionAr'] as String,
);

Map<String, dynamic> _$$PredictionFactorImplToJson(
  _$PredictionFactorImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'nameAr': instance.nameAr,
  'impact': instance.impact,
  'description': instance.description,
  'descriptionAr': instance.descriptionAr,
};

_$DayBehaviorImpactImpl _$$DayBehaviorImpactImplFromJson(
  Map<String, dynamic> json,
) => _$DayBehaviorImpactImpl(
  behaviorId: json['behaviorId'] as String,
  behaviorName: json['behaviorName'] as String,
  behaviorNameAr: json['behaviorNameAr'] as String,
  impactPercent: (json['impactPercent'] as num).toDouble(),
  isPositive: json['isPositive'] as bool,
  correlationStrength: (json['correlationStrength'] as num).toDouble(),
  dataPoints: (json['dataPoints'] as num).toInt(),
);

Map<String, dynamic> _$$DayBehaviorImpactImplToJson(
  _$DayBehaviorImpactImpl instance,
) => <String, dynamic>{
  'behaviorId': instance.behaviorId,
  'behaviorName': instance.behaviorName,
  'behaviorNameAr': instance.behaviorNameAr,
  'impactPercent': instance.impactPercent,
  'isPositive': instance.isPositive,
  'correlationStrength': instance.correlationStrength,
  'dataPoints': instance.dataPoints,
};
