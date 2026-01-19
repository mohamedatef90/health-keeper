import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

/// Message role in the conversation
enum MessageRole {
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
  @JsonValue('system')
  system,
}

/// Chat message entity representing a single message in a thread
@freezed
class ChatMessage with _$ChatMessage {
  const ChatMessage._();

  const factory ChatMessage({
    required String id,
    required String threadId,
    required MessageRole role,
    required String content,
    required DateTime createdAt,

    /// Context tag when message was sent
    String? contextTag,

    /// Metadata JSON containing quick replies, attachments, etc.
    String? metadataJson,

    /// Reference to a pending proposal if this message contains one
    String? proposalId,

    /// Whether this message is an error message
    @Default(false) bool isError,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  /// Get parsed metadata
  ChatMessageMetadata? get metadata {
    if (metadataJson == null) return null;
    try {
      final json = jsonDecode(metadataJson!);
      return ChatMessageMetadata.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  /// Check if this is a user message
  bool get isUserMessage => role == MessageRole.user;

  /// Check if this is an assistant message
  bool get isAssistantMessage => role == MessageRole.assistant;

  /// Check if this is a system message
  bool get isSystemMessage => role == MessageRole.system;

  /// Get quick replies if available
  List<String> get quickReplies => metadata?.quickReplies ?? [];

  /// Check if message has a proposal
  bool get hasProposal => proposalId != null;

  /// Get truncated content for preview
  String get previewContent {
    if (content.length <= 100) return content;
    return '${content.substring(0, 97)}...';
  }

  /// Get formatted time string
  String get timeString {
    final hour = createdAt.hour.toString().padLeft(2, '0');
    final minute = createdAt.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

/// Metadata for chat messages (quick replies, attachments, etc.)
@freezed
class ChatMessageMetadata with _$ChatMessageMetadata {
  const factory ChatMessageMetadata({
    /// Quick reply suggestions from AI
    @Default([]) List<String> quickReplies,

    /// References to logs (meal, workout, etc.)
    @Default([]) List<String> attachmentRefs,

    /// Whether the message is still being generated
    @Default(false) bool isStreaming,

    /// Model used for generation
    String? model,

    /// Processing time in milliseconds
    int? processingTimeMs,
  }) = _ChatMessageMetadata;

  factory ChatMessageMetadata.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageMetadataFromJson(json);
}

