// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_anomaly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthAnomalyImpl _$$HealthAnomalyImplFromJson(Map<String, dynamic> json) =>
    _$HealthAnomalyImpl(
      id: json['id'] as String,
      type: $enumDecode(_$AnomalyTypeEnumMap, json['type']),
      severity: $enumDecode(_$AnomalySeverityEnumMap, json['severity']),
      title: json['title'] as String,
      titleAr: json['titleAr'] as String?,
      description: json['description'] as String,
      descriptionAr: json['descriptionAr'] as String?,
      metric: json['metric'] as String,
      currentValue: (json['currentValue'] as num).toDouble(),
      expectedValue: (json['expectedValue'] as num).toDouble(),
      deviation: (json['deviation'] as num).toDouble(),
      unit: json['unit'] as String?,
      recommendedActions:
          (json['recommendedActions'] as List<dynamic>?)
              ?.map((e) => AnomalyAction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      relatedMetrics:
          (json['relatedMetrics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      daysActive: (json['daysActive'] as num?)?.toInt(),
      confidence: (json['confidence'] as num?)?.toInt() ?? 80,
      isAcknowledged: json['isAcknowledged'] as bool? ?? false,
      isResolved: json['isResolved'] as bool? ?? false,
      detectedAt: DateTime.parse(json['detectedAt'] as String),
      acknowledgedAt: json['acknowledgedAt'] == null
          ? null
          : DateTime.parse(json['acknowledgedAt'] as String),
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$HealthAnomalyImplToJson(_$HealthAnomalyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$AnomalyTypeEnumMap[instance.type]!,
      'severity': _$AnomalySeverityEnumMap[instance.severity]!,
      'title': instance.title,
      'titleAr': instance.titleAr,
      'description': instance.description,
      'descriptionAr': instance.descriptionAr,
      'metric': instance.metric,
      'currentValue': instance.currentValue,
      'expectedValue': instance.expectedValue,
      'deviation': instance.deviation,
      'unit': instance.unit,
      'recommendedActions': instance.recommendedActions,
      'relatedMetrics': instance.relatedMetrics,
      'daysActive': instance.daysActive,
      'confidence': instance.confidence,
      'isAcknowledged': instance.isAcknowledged,
      'isResolved': instance.isResolved,
      'detectedAt': instance.detectedAt.toIso8601String(),
      'acknowledgedAt': instance.acknowledgedAt?.toIso8601String(),
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'rawData': instance.rawData,
    };

const _$AnomalyTypeEnumMap = {
  AnomalyType.hrvDrop: 'hrv_drop',
  AnomalyType.rhrElevation: 'rhr_elevation',
  AnomalyType.sleepDebt: 'sleep_debt',
  AnomalyType.strainRecoveryImbalance: 'strain_recovery_imbalance',
  AnomalyType.prolongedLowRecovery: 'prolonged_low_recovery',
  AnomalyType.weightChange: 'weight_change',
  AnomalyType.activityAnomaly: 'activity_anomaly',
  AnomalyType.combinedWarning: 'combined_warning',
};

const _$AnomalySeverityEnumMap = {
  AnomalySeverity.info: 'info',
  AnomalySeverity.low: 'low',
  AnomalySeverity.moderate: 'moderate',
  AnomalySeverity.high: 'high',
  AnomalySeverity.critical: 'critical',
};

_$AnomalyActionImpl _$$AnomalyActionImplFromJson(Map<String, dynamic> json) =>
    _$AnomalyActionImpl(
      action: json['action'] as String,
      actionAr: json['actionAr'] as String?,
      rationale: json['rationale'] as String,
      rationaleAr: json['rationaleAr'] as String?,
      priority: json['priority'] as String? ?? 'medium',
      category: json['category'] as String? ?? 'general',
    );

Map<String, dynamic> _$$AnomalyActionImplToJson(_$AnomalyActionImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'actionAr': instance.actionAr,
      'rationale': instance.rationale,
      'rationaleAr': instance.rationaleAr,
      'priority': instance.priority,
      'category': instance.category,
    };
