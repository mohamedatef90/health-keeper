// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String,
      threadId: json['threadId'] as String,
      role: $enumDecode(_$MessageRoleEnumMap, json['role']),
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      contextTag: json['contextTag'] as String?,
      metadataJson: json['metadataJson'] as String?,
      proposalId: json['proposalId'] as String?,
      isError: json['isError'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'threadId': instance.threadId,
      'role': _$MessageRoleEnumMap[instance.role]!,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'contextTag': instance.contextTag,
      'metadataJson': instance.metadataJson,
      'proposalId': instance.proposalId,
      'isError': instance.isError,
    };

const _$MessageRoleEnumMap = {
  MessageRole.user: 'user',
  MessageRole.assistant: 'assistant',
  MessageRole.system: 'system',
};

_$ChatMessageMetadataImpl _$$ChatMessageMetadataImplFromJson(
  Map<String, dynamic> json,
) => _$ChatMessageMetadataImpl(
  quickReplies:
      (json['quickReplies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  attachmentRefs:
      (json['attachmentRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  isStreaming: json['isStreaming'] as bool? ?? false,
  model: json['model'] as String?,
  processingTimeMs: (json['processingTimeMs'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ChatMessageMetadataImplToJson(
  _$ChatMessageMetadataImpl instance,
) => <String, dynamic>{
  'quickReplies': instance.quickReplies,
  'attachmentRefs': instance.attachmentRefs,
  'isStreaming': instance.isStreaming,
  'model': instance.model,
  'processingTimeMs': instance.processingTimeMs,
};
