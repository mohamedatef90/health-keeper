// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_brain_decision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiBrainDecisionImpl _$$AiBrainDecisionImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainDecisionImpl(
  id: json['id'] as String,
  type: $enumDecode(_$DecisionTypeEnumMap, json['type']),
  urgency: $enumDecode(_$DecisionUrgencyEnumMap, json['urgency']),
  domain: $enumDecode(_$DecisionDomainEnumMap, json['domain']),
  description: json['description'] as String,
  descriptionAr: json['descriptionAr'] as String?,
  reasoning: json['reasoning'] as String?,
  reasoningAr: json['reasoningAr'] as String?,
  payload: json['payload'] as Map<String, dynamic>,
  requiresApproval: json['requiresApproval'] as bool,
  confidence: (json['confidence'] as num?)?.toInt() ?? 80,
  impactScore: (json['impactScore'] as num?)?.toInt() ?? 50,
  status:
      $enumDecodeNullable(_$DecisionStatusEnumMap, json['status']) ??
      DecisionStatus.pending,
  createdAt: DateTime.parse(json['createdAt'] as String),
  scheduledAt: json['scheduledAt'] == null
      ? null
      : DateTime.parse(json['scheduledAt'] as String),
  executedAt: json['executedAt'] == null
      ? null
      : DateTime.parse(json['executedAt'] as String),
  approvedAt: json['approvedAt'] == null
      ? null
      : DateTime.parse(json['approvedAt'] as String),
  rejectedAt: json['rejectedAt'] == null
      ? null
      : DateTime.parse(json['rejectedAt'] as String),
  userFeedback: json['userFeedback'] as String?,
  triggerSource: json['triggerSource'] as String?,
  relatedIds:
      (json['relatedIds'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
);

Map<String, dynamic> _$$AiBrainDecisionImplToJson(
  _$AiBrainDecisionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$DecisionTypeEnumMap[instance.type]!,
  'urgency': _$DecisionUrgencyEnumMap[instance.urgency]!,
  'domain': _$DecisionDomainEnumMap[instance.domain]!,
  'description': instance.description,
  'descriptionAr': instance.descriptionAr,
  'reasoning': instance.reasoning,
  'reasoningAr': instance.reasoningAr,
  'payload': instance.payload,
  'requiresApproval': instance.requiresApproval,
  'confidence': instance.confidence,
  'impactScore': instance.impactScore,
  'status': _$DecisionStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'scheduledAt': instance.scheduledAt?.toIso8601String(),
  'executedAt': instance.executedAt?.toIso8601String(),
  'approvedAt': instance.approvedAt?.toIso8601String(),
  'rejectedAt': instance.rejectedAt?.toIso8601String(),
  'userFeedback': instance.userFeedback,
  'triggerSource': instance.triggerSource,
  'relatedIds': instance.relatedIds,
};

const _$DecisionTypeEnumMap = {
  DecisionType.adjustPlan: 'adjust_plan',
  DecisionType.sendNotification: 'send_notification',
  DecisionType.generateAlert: 'generate_alert',
  DecisionType.respondToChat: 'respond_to_chat',
  DecisionType.logData: 'log_data',
  DecisionType.triggerRescueMode: 'trigger_rescue_mode',
  DecisionType.suggestBehavior: 'suggest_behavior',
  DecisionType.scheduleReminder: 'schedule_reminder',
};

const _$DecisionUrgencyEnumMap = {
  DecisionUrgency.immediate: 'immediate',
  DecisionUrgency.soon: 'soon',
  DecisionUrgency.scheduled: 'scheduled',
  DecisionUrgency.background: 'background',
};

const _$DecisionDomainEnumMap = {
  DecisionDomain.workout: 'workout',
  DecisionDomain.nutrition: 'nutrition',
  DecisionDomain.sleep: 'sleep',
  DecisionDomain.recovery: 'recovery',
  DecisionDomain.health: 'health',
  DecisionDomain.protocol: 'protocol',
  DecisionDomain.chat: 'chat',
};

const _$DecisionStatusEnumMap = {
  DecisionStatus.pending: 'pending',
  DecisionStatus.awaitingApproval: 'awaiting_approval',
  DecisionStatus.approved: 'approved',
  DecisionStatus.rejected: 'rejected',
  DecisionStatus.executed: 'executed',
  DecisionStatus.failed: 'failed',
  DecisionStatus.cancelled: 'cancelled',
};

_$ChatActionImpl _$$ChatActionImplFromJson(Map<String, dynamic> json) =>
    _$ChatActionImpl(
      type: json['type'] as String,
      description: json['description'] as String,
      descriptionAr: json['descriptionAr'] as String?,
      parameters: json['parameters'] as Map<String, dynamic>,
      confidence: (json['confidence'] as num?)?.toInt() ?? 80,
      requiresConfirmation: json['requiresConfirmation'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatActionImplToJson(_$ChatActionImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
      'descriptionAr': instance.descriptionAr,
      'parameters': instance.parameters,
      'confidence': instance.confidence,
      'requiresConfirmation': instance.requiresConfirmation,
    };

_$AiBrainChatResponseImpl _$$AiBrainChatResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainChatResponseImpl(
  content: json['content'] as String,
  contentAr: json['contentAr'] as String?,
  quickReplies:
      (json['quickReplies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  quickRepliesAr:
      (json['quickRepliesAr'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  suggestedAction: json['suggestedAction'] == null
      ? null
      : ChatAction.fromJson(json['suggestedAction'] as Map<String, dynamic>),
  requiresActionConfirmation:
      json['requiresActionConfirmation'] as bool? ?? false,
  reasoning: json['reasoning'] as String?,
  processingTimeMs: (json['processingTimeMs'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$AiBrainChatResponseImplToJson(
  _$AiBrainChatResponseImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'contentAr': instance.contentAr,
  'quickReplies': instance.quickReplies,
  'quickRepliesAr': instance.quickRepliesAr,
  'suggestedAction': instance.suggestedAction,
  'requiresActionConfirmation': instance.requiresActionConfirmation,
  'reasoning': instance.reasoning,
  'processingTimeMs': instance.processingTimeMs,
};
