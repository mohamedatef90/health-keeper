// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_adjustment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanAdjustmentImpl _$$PlanAdjustmentImplFromJson(Map<String, dynamic> json) =>
    _$PlanAdjustmentImpl(
      id: json['id'] as String,
      type: $enumDecode(_$AdjustmentTypeEnumMap, json['type']),
      domain: $enumDecode(_$AdjustmentDomainEnumMap, json['domain']),
      reason: json['reason'] as String,
      reasonAr: json['reasonAr'] as String?,
      explanation: json['explanation'] as String?,
      explanationAr: json['explanationAr'] as String?,
      trigger: json['trigger'] as String,
      triggerAr: json['triggerAr'] as String?,
      originalValue: json['originalValue'] as Map<String, dynamic>,
      proposedValue: json['proposedValue'] as Map<String, dynamic>,
      affectedDayIndex: (json['affectedDayIndex'] as num?)?.toInt(),
      impactScore: (json['impactScore'] as num?)?.toInt() ?? 50,
      confidence: (json['confidence'] as num?)?.toInt() ?? 80,
      status:
          $enumDecodeNullable(_$AdjustmentStatusEnumMap, json['status']) ??
          AdjustmentStatus.proposed,
      mealPlanId: json['mealPlanId'] as String?,
      workoutPlanId: json['workoutPlanId'] as String?,
      masterPlanId: json['masterPlanId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      appliedAt: json['appliedAt'] == null
          ? null
          : DateTime.parse(json['appliedAt'] as String),
      revertedAt: json['revertedAt'] == null
          ? null
          : DateTime.parse(json['revertedAt'] as String),
      userFeedback: json['userFeedback'] as String?,
    );

Map<String, dynamic> _$$PlanAdjustmentImplToJson(
  _$PlanAdjustmentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$AdjustmentTypeEnumMap[instance.type]!,
  'domain': _$AdjustmentDomainEnumMap[instance.domain]!,
  'reason': instance.reason,
  'reasonAr': instance.reasonAr,
  'explanation': instance.explanation,
  'explanationAr': instance.explanationAr,
  'trigger': instance.trigger,
  'triggerAr': instance.triggerAr,
  'originalValue': instance.originalValue,
  'proposedValue': instance.proposedValue,
  'affectedDayIndex': instance.affectedDayIndex,
  'impactScore': instance.impactScore,
  'confidence': instance.confidence,
  'status': _$AdjustmentStatusEnumMap[instance.status]!,
  'mealPlanId': instance.mealPlanId,
  'workoutPlanId': instance.workoutPlanId,
  'masterPlanId': instance.masterPlanId,
  'createdAt': instance.createdAt.toIso8601String(),
  'appliedAt': instance.appliedAt?.toIso8601String(),
  'revertedAt': instance.revertedAt?.toIso8601String(),
  'userFeedback': instance.userFeedback,
};

const _$AdjustmentTypeEnumMap = {
  AdjustmentType.calorieAdjustment: 'calorie_adjustment',
  AdjustmentType.proteinAdjustment: 'protein_adjustment',
  AdjustmentType.intensityAdjustment: 'intensity_adjustment',
  AdjustmentType.restDayAdded: 'rest_day_added',
  AdjustmentType.restDayRemoved: 'rest_day_removed',
  AdjustmentType.workoutMoved: 'workout_moved',
  AdjustmentType.workoutSwapped: 'workout_swapped',
  AdjustmentType.mealTiming: 'meal_timing',
  AdjustmentType.extraCalories: 'extra_calories',
  AdjustmentType.deloadWeek: 'deload_week',
};

const _$AdjustmentDomainEnumMap = {
  AdjustmentDomain.workout: 'workout',
  AdjustmentDomain.meal: 'meal',
  AdjustmentDomain.recovery: 'recovery',
  AdjustmentDomain.both: 'both',
};

const _$AdjustmentStatusEnumMap = {
  AdjustmentStatus.proposed: 'proposed',
  AdjustmentStatus.autoApplied: 'auto_applied',
  AdjustmentStatus.approved: 'approved',
  AdjustmentStatus.rejected: 'rejected',
  AdjustmentStatus.applied: 'applied',
  AdjustmentStatus.reverted: 'reverted',
};
