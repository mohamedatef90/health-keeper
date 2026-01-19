// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  String get id => throw _privateConstructorUsedError;
  String get threadId => throw _privateConstructorUsedError;
  MessageRole get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Context tag when message was sent
  String? get contextTag => throw _privateConstructorUsedError;

  /// Metadata JSON containing quick replies, attachments, etc.
  String? get metadataJson => throw _privateConstructorUsedError;

  /// Reference to a pending proposal if this message contains one
  String? get proposalId => throw _privateConstructorUsedError;

  /// Whether this message is an error message
  bool get isError => throw _privateConstructorUsedError;

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
    ChatMessage value,
    $Res Function(ChatMessage) then,
  ) = _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call({
    String id,
    String threadId,
    MessageRole role,
    String content,
    DateTime createdAt,
    String? contextTag,
    String? metadataJson,
    String? proposalId,
    bool isError,
  });
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? threadId = null,
    Object? role = null,
    Object? content = null,
    Object? createdAt = null,
    Object? contextTag = freezed,
    Object? metadataJson = freezed,
    Object? proposalId = freezed,
    Object? isError = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            threadId: null == threadId
                ? _value.threadId
                : threadId // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as MessageRole,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            contextTag: freezed == contextTag
                ? _value.contextTag
                : contextTag // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadataJson: freezed == metadataJson
                ? _value.metadataJson
                : metadataJson // ignore: cast_nullable_to_non_nullable
                      as String?,
            proposalId: freezed == proposalId
                ? _value.proposalId
                : proposalId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isError: null == isError
                ? _value.isError
                : isError // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
    _$ChatMessageImpl value,
    $Res Function(_$ChatMessageImpl) then,
  ) = __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String threadId,
    MessageRole role,
    String content,
    DateTime createdAt,
    String? contextTag,
    String? metadataJson,
    String? proposalId,
    bool isError,
  });
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
    _$ChatMessageImpl _value,
    $Res Function(_$ChatMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? threadId = null,
    Object? role = null,
    Object? content = null,
    Object? createdAt = null,
    Object? contextTag = freezed,
    Object? metadataJson = freezed,
    Object? proposalId = freezed,
    Object? isError = null,
  }) {
    return _then(
      _$ChatMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        threadId: null == threadId
            ? _value.threadId
            : threadId // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as MessageRole,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        contextTag: freezed == contextTag
            ? _value.contextTag
            : contextTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadataJson: freezed == metadataJson
            ? _value.metadataJson
            : metadataJson // ignore: cast_nullable_to_non_nullable
                  as String?,
        proposalId: freezed == proposalId
            ? _value.proposalId
            : proposalId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isError: null == isError
            ? _value.isError
            : isError // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl extends _ChatMessage {
  const _$ChatMessageImpl({
    required this.id,
    required this.threadId,
    required this.role,
    required this.content,
    required this.createdAt,
    this.contextTag,
    this.metadataJson,
    this.proposalId,
    this.isError = false,
  }) : super._();

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String threadId;
  @override
  final MessageRole role;
  @override
  final String content;
  @override
  final DateTime createdAt;

  /// Context tag when message was sent
  @override
  final String? contextTag;

  /// Metadata JSON containing quick replies, attachments, etc.
  @override
  final String? metadataJson;

  /// Reference to a pending proposal if this message contains one
  @override
  final String? proposalId;

  /// Whether this message is an error message
  @override
  @JsonKey()
  final bool isError;

  @override
  String toString() {
    return 'ChatMessage(id: $id, threadId: $threadId, role: $role, content: $content, createdAt: $createdAt, contextTag: $contextTag, metadataJson: $metadataJson, proposalId: $proposalId, isError: $isError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.contextTag, contextTag) ||
                other.contextTag == contextTag) &&
            (identical(other.metadataJson, metadataJson) ||
                other.metadataJson == metadataJson) &&
            (identical(other.proposalId, proposalId) ||
                other.proposalId == proposalId) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    threadId,
    role,
    content,
    createdAt,
    contextTag,
    metadataJson,
    proposalId,
    isError,
  );

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(this);
  }
}

abstract class _ChatMessage extends ChatMessage {
  const factory _ChatMessage({
    required final String id,
    required final String threadId,
    required final MessageRole role,
    required final String content,
    required final DateTime createdAt,
    final String? contextTag,
    final String? metadataJson,
    final String? proposalId,
    final bool isError,
  }) = _$ChatMessageImpl;
  const _ChatMessage._() : super._();

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get threadId;
  @override
  MessageRole get role;
  @override
  String get content;
  @override
  DateTime get createdAt;

  /// Context tag when message was sent
  @override
  String? get contextTag;

  /// Metadata JSON containing quick replies, attachments, etc.
  @override
  String? get metadataJson;

  /// Reference to a pending proposal if this message contains one
  @override
  String? get proposalId;

  /// Whether this message is an error message
  @override
  bool get isError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessageMetadata _$ChatMessageMetadataFromJson(Map<String, dynamic> json) {
  return _ChatMessageMetadata.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageMetadata {
  /// Quick reply suggestions from AI
  List<String> get quickReplies => throw _privateConstructorUsedError;

  /// References to logs (meal, workout, etc.)
  List<String> get attachmentRefs => throw _privateConstructorUsedError;

  /// Whether the message is still being generated
  bool get isStreaming => throw _privateConstructorUsedError;

  /// Model used for generation
  String? get model => throw _privateConstructorUsedError;

  /// Processing time in milliseconds
  int? get processingTimeMs => throw _privateConstructorUsedError;

  /// Serializes this ChatMessageMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageMetadataCopyWith<ChatMessageMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageMetadataCopyWith<$Res> {
  factory $ChatMessageMetadataCopyWith(
    ChatMessageMetadata value,
    $Res Function(ChatMessageMetadata) then,
  ) = _$ChatMessageMetadataCopyWithImpl<$Res, ChatMessageMetadata>;
  @useResult
  $Res call({
    List<String> quickReplies,
    List<String> attachmentRefs,
    bool isStreaming,
    String? model,
    int? processingTimeMs,
  });
}

/// @nodoc
class _$ChatMessageMetadataCopyWithImpl<$Res, $Val extends ChatMessageMetadata>
    implements $ChatMessageMetadataCopyWith<$Res> {
  _$ChatMessageMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quickReplies = null,
    Object? attachmentRefs = null,
    Object? isStreaming = null,
    Object? model = freezed,
    Object? processingTimeMs = freezed,
  }) {
    return _then(
      _value.copyWith(
            quickReplies: null == quickReplies
                ? _value.quickReplies
                : quickReplies // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            attachmentRefs: null == attachmentRefs
                ? _value.attachmentRefs
                : attachmentRefs // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isStreaming: null == isStreaming
                ? _value.isStreaming
                : isStreaming // ignore: cast_nullable_to_non_nullable
                      as bool,
            model: freezed == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String?,
            processingTimeMs: freezed == processingTimeMs
                ? _value.processingTimeMs
                : processingTimeMs // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageMetadataImplCopyWith<$Res>
    implements $ChatMessageMetadataCopyWith<$Res> {
  factory _$$ChatMessageMetadataImplCopyWith(
    _$ChatMessageMetadataImpl value,
    $Res Function(_$ChatMessageMetadataImpl) then,
  ) = __$$ChatMessageMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> quickReplies,
    List<String> attachmentRefs,
    bool isStreaming,
    String? model,
    int? processingTimeMs,
  });
}

/// @nodoc
class __$$ChatMessageMetadataImplCopyWithImpl<$Res>
    extends _$ChatMessageMetadataCopyWithImpl<$Res, _$ChatMessageMetadataImpl>
    implements _$$ChatMessageMetadataImplCopyWith<$Res> {
  __$$ChatMessageMetadataImplCopyWithImpl(
    _$ChatMessageMetadataImpl _value,
    $Res Function(_$ChatMessageMetadataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessageMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quickReplies = null,
    Object? attachmentRefs = null,
    Object? isStreaming = null,
    Object? model = freezed,
    Object? processingTimeMs = freezed,
  }) {
    return _then(
      _$ChatMessageMetadataImpl(
        quickReplies: null == quickReplies
            ? _value._quickReplies
            : quickReplies // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        attachmentRefs: null == attachmentRefs
            ? _value._attachmentRefs
            : attachmentRefs // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isStreaming: null == isStreaming
            ? _value.isStreaming
            : isStreaming // ignore: cast_nullable_to_non_nullable
                  as bool,
        model: freezed == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String?,
        processingTimeMs: freezed == processingTimeMs
            ? _value.processingTimeMs
            : processingTimeMs // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageMetadataImpl implements _ChatMessageMetadata {
  const _$ChatMessageMetadataImpl({
    final List<String> quickReplies = const [],
    final List<String> attachmentRefs = const [],
    this.isStreaming = false,
    this.model,
    this.processingTimeMs,
  }) : _quickReplies = quickReplies,
       _attachmentRefs = attachmentRefs;

  factory _$ChatMessageMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageMetadataImplFromJson(json);

  /// Quick reply suggestions from AI
  final List<String> _quickReplies;

  /// Quick reply suggestions from AI
  @override
  @JsonKey()
  List<String> get quickReplies {
    if (_quickReplies is EqualUnmodifiableListView) return _quickReplies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quickReplies);
  }

  /// References to logs (meal, workout, etc.)
  final List<String> _attachmentRefs;

  /// References to logs (meal, workout, etc.)
  @override
  @JsonKey()
  List<String> get attachmentRefs {
    if (_attachmentRefs is EqualUnmodifiableListView) return _attachmentRefs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachmentRefs);
  }

  /// Whether the message is still being generated
  @override
  @JsonKey()
  final bool isStreaming;

  /// Model used for generation
  @override
  final String? model;

  /// Processing time in milliseconds
  @override
  final int? processingTimeMs;

  @override
  String toString() {
    return 'ChatMessageMetadata(quickReplies: $quickReplies, attachmentRefs: $attachmentRefs, isStreaming: $isStreaming, model: $model, processingTimeMs: $processingTimeMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageMetadataImpl &&
            const DeepCollectionEquality().equals(
              other._quickReplies,
              _quickReplies,
            ) &&
            const DeepCollectionEquality().equals(
              other._attachmentRefs,
              _attachmentRefs,
            ) &&
            (identical(other.isStreaming, isStreaming) ||
                other.isStreaming == isStreaming) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.processingTimeMs, processingTimeMs) ||
                other.processingTimeMs == processingTimeMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_quickReplies),
    const DeepCollectionEquality().hash(_attachmentRefs),
    isStreaming,
    model,
    processingTimeMs,
  );

  /// Create a copy of ChatMessageMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageMetadataImplCopyWith<_$ChatMessageMetadataImpl> get copyWith =>
      __$$ChatMessageMetadataImplCopyWithImpl<_$ChatMessageMetadataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageMetadataImplToJson(this);
  }
}

abstract class _ChatMessageMetadata implements ChatMessageMetadata {
  const factory _ChatMessageMetadata({
    final List<String> quickReplies,
    final List<String> attachmentRefs,
    final bool isStreaming,
    final String? model,
    final int? processingTimeMs,
  }) = _$ChatMessageMetadataImpl;

  factory _ChatMessageMetadata.fromJson(Map<String, dynamic> json) =
      _$ChatMessageMetadataImpl.fromJson;

  /// Quick reply suggestions from AI
  @override
  List<String> get quickReplies;

  /// References to logs (meal, workout, etc.)
  @override
  List<String> get attachmentRefs;

  /// Whether the message is still being generated
  @override
  bool get isStreaming;

  /// Model used for generation
  @override
  String? get model;

  /// Processing time in milliseconds
  @override
  int? get processingTimeMs;

  /// Create a copy of ChatMessageMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageMetadataImplCopyWith<_$ChatMessageMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
