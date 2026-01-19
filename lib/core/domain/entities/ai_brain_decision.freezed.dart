// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_brain_decision.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiBrainDecision _$AiBrainDecisionFromJson(Map<String, dynamic> json) {
  return _AiBrainDecision.fromJson(json);
}

/// @nodoc
mixin _$AiBrainDecision {
  String get id => throw _privateConstructorUsedError;
  DecisionType get type => throw _privateConstructorUsedError;
  DecisionUrgency get urgency => throw _privateConstructorUsedError;
  DecisionDomain get domain => throw _privateConstructorUsedError;

  /// Description of the decision (English)
  String get description => throw _privateConstructorUsedError;

  /// Description of the decision (Arabic)
  String? get descriptionAr => throw _privateConstructorUsedError;

  /// Detailed reasoning for the decision
  String? get reasoning => throw _privateConstructorUsedError;
  String? get reasoningAr => throw _privateConstructorUsedError;

  /// JSON payload with decision-specific data
  Map<String, dynamic> get payload => throw _privateConstructorUsedError;

  /// Whether this decision requires user approval
  bool get requiresApproval => throw _privateConstructorUsedError;

  /// Confidence score (0-100)
  int get confidence => throw _privateConstructorUsedError;

  /// Impact score (0-100) - how much this affects the plan
  int get impactScore => throw _privateConstructorUsedError;

  /// Current status
  DecisionStatus get status => throw _privateConstructorUsedError;

  /// Timestamps
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  DateTime? get executedAt => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;
  DateTime? get rejectedAt => throw _privateConstructorUsedError;

  /// User feedback on the decision
  String? get userFeedback => throw _privateConstructorUsedError;

  /// Source context that triggered this decision
  String? get triggerSource => throw _privateConstructorUsedError;

  /// Related entity IDs (plan ID, message ID, etc.)
  Map<String, String> get relatedIds => throw _privateConstructorUsedError;

  /// Serializes this AiBrainDecision to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainDecision
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainDecisionCopyWith<AiBrainDecision> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainDecisionCopyWith<$Res> {
  factory $AiBrainDecisionCopyWith(
    AiBrainDecision value,
    $Res Function(AiBrainDecision) then,
  ) = _$AiBrainDecisionCopyWithImpl<$Res, AiBrainDecision>;
  @useResult
  $Res call({
    String id,
    DecisionType type,
    DecisionUrgency urgency,
    DecisionDomain domain,
    String description,
    String? descriptionAr,
    String? reasoning,
    String? reasoningAr,
    Map<String, dynamic> payload,
    bool requiresApproval,
    int confidence,
    int impactScore,
    DecisionStatus status,
    DateTime createdAt,
    DateTime? scheduledAt,
    DateTime? executedAt,
    DateTime? approvedAt,
    DateTime? rejectedAt,
    String? userFeedback,
    String? triggerSource,
    Map<String, String> relatedIds,
  });
}

/// @nodoc
class _$AiBrainDecisionCopyWithImpl<$Res, $Val extends AiBrainDecision>
    implements $AiBrainDecisionCopyWith<$Res> {
  _$AiBrainDecisionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainDecision
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? urgency = null,
    Object? domain = null,
    Object? description = null,
    Object? descriptionAr = freezed,
    Object? reasoning = freezed,
    Object? reasoningAr = freezed,
    Object? payload = null,
    Object? requiresApproval = null,
    Object? confidence = null,
    Object? impactScore = null,
    Object? status = null,
    Object? createdAt = null,
    Object? scheduledAt = freezed,
    Object? executedAt = freezed,
    Object? approvedAt = freezed,
    Object? rejectedAt = freezed,
    Object? userFeedback = freezed,
    Object? triggerSource = freezed,
    Object? relatedIds = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DecisionType,
            urgency: null == urgency
                ? _value.urgency
                : urgency // ignore: cast_nullable_to_non_nullable
                      as DecisionUrgency,
            domain: null == domain
                ? _value.domain
                : domain // ignore: cast_nullable_to_non_nullable
                      as DecisionDomain,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionAr: freezed == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            reasoning: freezed == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String?,
            reasoningAr: freezed == reasoningAr
                ? _value.reasoningAr
                : reasoningAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            payload: null == payload
                ? _value.payload
                : payload // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            requiresApproval: null == requiresApproval
                ? _value.requiresApproval
                : requiresApproval // ignore: cast_nullable_to_non_nullable
                      as bool,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            impactScore: null == impactScore
                ? _value.impactScore
                : impactScore // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as DecisionStatus,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            scheduledAt: freezed == scheduledAt
                ? _value.scheduledAt
                : scheduledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            executedAt: freezed == executedAt
                ? _value.executedAt
                : executedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            approvedAt: freezed == approvedAt
                ? _value.approvedAt
                : approvedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            rejectedAt: freezed == rejectedAt
                ? _value.rejectedAt
                : rejectedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            userFeedback: freezed == userFeedback
                ? _value.userFeedback
                : userFeedback // ignore: cast_nullable_to_non_nullable
                      as String?,
            triggerSource: freezed == triggerSource
                ? _value.triggerSource
                : triggerSource // ignore: cast_nullable_to_non_nullable
                      as String?,
            relatedIds: null == relatedIds
                ? _value.relatedIds
                : relatedIds // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainDecisionImplCopyWith<$Res>
    implements $AiBrainDecisionCopyWith<$Res> {
  factory _$$AiBrainDecisionImplCopyWith(
    _$AiBrainDecisionImpl value,
    $Res Function(_$AiBrainDecisionImpl) then,
  ) = __$$AiBrainDecisionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DecisionType type,
    DecisionUrgency urgency,
    DecisionDomain domain,
    String description,
    String? descriptionAr,
    String? reasoning,
    String? reasoningAr,
    Map<String, dynamic> payload,
    bool requiresApproval,
    int confidence,
    int impactScore,
    DecisionStatus status,
    DateTime createdAt,
    DateTime? scheduledAt,
    DateTime? executedAt,
    DateTime? approvedAt,
    DateTime? rejectedAt,
    String? userFeedback,
    String? triggerSource,
    Map<String, String> relatedIds,
  });
}

/// @nodoc
class __$$AiBrainDecisionImplCopyWithImpl<$Res>
    extends _$AiBrainDecisionCopyWithImpl<$Res, _$AiBrainDecisionImpl>
    implements _$$AiBrainDecisionImplCopyWith<$Res> {
  __$$AiBrainDecisionImplCopyWithImpl(
    _$AiBrainDecisionImpl _value,
    $Res Function(_$AiBrainDecisionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainDecision
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? urgency = null,
    Object? domain = null,
    Object? description = null,
    Object? descriptionAr = freezed,
    Object? reasoning = freezed,
    Object? reasoningAr = freezed,
    Object? payload = null,
    Object? requiresApproval = null,
    Object? confidence = null,
    Object? impactScore = null,
    Object? status = null,
    Object? createdAt = null,
    Object? scheduledAt = freezed,
    Object? executedAt = freezed,
    Object? approvedAt = freezed,
    Object? rejectedAt = freezed,
    Object? userFeedback = freezed,
    Object? triggerSource = freezed,
    Object? relatedIds = null,
  }) {
    return _then(
      _$AiBrainDecisionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DecisionType,
        urgency: null == urgency
            ? _value.urgency
            : urgency // ignore: cast_nullable_to_non_nullable
                  as DecisionUrgency,
        domain: null == domain
            ? _value.domain
            : domain // ignore: cast_nullable_to_non_nullable
                  as DecisionDomain,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: freezed == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasoning: freezed == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasoningAr: freezed == reasoningAr
            ? _value.reasoningAr
            : reasoningAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        payload: null == payload
            ? _value._payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        requiresApproval: null == requiresApproval
            ? _value.requiresApproval
            : requiresApproval // ignore: cast_nullable_to_non_nullable
                  as bool,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        impactScore: null == impactScore
            ? _value.impactScore
            : impactScore // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as DecisionStatus,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        scheduledAt: freezed == scheduledAt
            ? _value.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        executedAt: freezed == executedAt
            ? _value.executedAt
            : executedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        approvedAt: freezed == approvedAt
            ? _value.approvedAt
            : approvedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        rejectedAt: freezed == rejectedAt
            ? _value.rejectedAt
            : rejectedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        userFeedback: freezed == userFeedback
            ? _value.userFeedback
            : userFeedback // ignore: cast_nullable_to_non_nullable
                  as String?,
        triggerSource: freezed == triggerSource
            ? _value.triggerSource
            : triggerSource // ignore: cast_nullable_to_non_nullable
                  as String?,
        relatedIds: null == relatedIds
            ? _value._relatedIds
            : relatedIds // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainDecisionImpl extends _AiBrainDecision {
  const _$AiBrainDecisionImpl({
    required this.id,
    required this.type,
    required this.urgency,
    required this.domain,
    required this.description,
    this.descriptionAr,
    this.reasoning,
    this.reasoningAr,
    required final Map<String, dynamic> payload,
    required this.requiresApproval,
    this.confidence = 80,
    this.impactScore = 50,
    this.status = DecisionStatus.pending,
    required this.createdAt,
    this.scheduledAt,
    this.executedAt,
    this.approvedAt,
    this.rejectedAt,
    this.userFeedback,
    this.triggerSource,
    final Map<String, String> relatedIds = const {},
  }) : _payload = payload,
       _relatedIds = relatedIds,
       super._();

  factory _$AiBrainDecisionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainDecisionImplFromJson(json);

  @override
  final String id;
  @override
  final DecisionType type;
  @override
  final DecisionUrgency urgency;
  @override
  final DecisionDomain domain;

  /// Description of the decision (English)
  @override
  final String description;

  /// Description of the decision (Arabic)
  @override
  final String? descriptionAr;

  /// Detailed reasoning for the decision
  @override
  final String? reasoning;
  @override
  final String? reasoningAr;

  /// JSON payload with decision-specific data
  final Map<String, dynamic> _payload;

  /// JSON payload with decision-specific data
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  /// Whether this decision requires user approval
  @override
  final bool requiresApproval;

  /// Confidence score (0-100)
  @override
  @JsonKey()
  final int confidence;

  /// Impact score (0-100) - how much this affects the plan
  @override
  @JsonKey()
  final int impactScore;

  /// Current status
  @override
  @JsonKey()
  final DecisionStatus status;

  /// Timestamps
  @override
  final DateTime createdAt;
  @override
  final DateTime? scheduledAt;
  @override
  final DateTime? executedAt;
  @override
  final DateTime? approvedAt;
  @override
  final DateTime? rejectedAt;

  /// User feedback on the decision
  @override
  final String? userFeedback;

  /// Source context that triggered this decision
  @override
  final String? triggerSource;

  /// Related entity IDs (plan ID, message ID, etc.)
  final Map<String, String> _relatedIds;

  /// Related entity IDs (plan ID, message ID, etc.)
  @override
  @JsonKey()
  Map<String, String> get relatedIds {
    if (_relatedIds is EqualUnmodifiableMapView) return _relatedIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_relatedIds);
  }

  @override
  String toString() {
    return 'AiBrainDecision(id: $id, type: $type, urgency: $urgency, domain: $domain, description: $description, descriptionAr: $descriptionAr, reasoning: $reasoning, reasoningAr: $reasoningAr, payload: $payload, requiresApproval: $requiresApproval, confidence: $confidence, impactScore: $impactScore, status: $status, createdAt: $createdAt, scheduledAt: $scheduledAt, executedAt: $executedAt, approvedAt: $approvedAt, rejectedAt: $rejectedAt, userFeedback: $userFeedback, triggerSource: $triggerSource, relatedIds: $relatedIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainDecisionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.urgency, urgency) || other.urgency == urgency) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.reasoningAr, reasoningAr) ||
                other.reasoningAr == reasoningAr) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(other.requiresApproval, requiresApproval) ||
                other.requiresApproval == requiresApproval) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.impactScore, impactScore) ||
                other.impactScore == impactScore) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.executedAt, executedAt) ||
                other.executedAt == executedAt) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            (identical(other.userFeedback, userFeedback) ||
                other.userFeedback == userFeedback) &&
            (identical(other.triggerSource, triggerSource) ||
                other.triggerSource == triggerSource) &&
            const DeepCollectionEquality().equals(
              other._relatedIds,
              _relatedIds,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    type,
    urgency,
    domain,
    description,
    descriptionAr,
    reasoning,
    reasoningAr,
    const DeepCollectionEquality().hash(_payload),
    requiresApproval,
    confidence,
    impactScore,
    status,
    createdAt,
    scheduledAt,
    executedAt,
    approvedAt,
    rejectedAt,
    userFeedback,
    triggerSource,
    const DeepCollectionEquality().hash(_relatedIds),
  ]);

  /// Create a copy of AiBrainDecision
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainDecisionImplCopyWith<_$AiBrainDecisionImpl> get copyWith =>
      __$$AiBrainDecisionImplCopyWithImpl<_$AiBrainDecisionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainDecisionImplToJson(this);
  }
}

abstract class _AiBrainDecision extends AiBrainDecision {
  const factory _AiBrainDecision({
    required final String id,
    required final DecisionType type,
    required final DecisionUrgency urgency,
    required final DecisionDomain domain,
    required final String description,
    final String? descriptionAr,
    final String? reasoning,
    final String? reasoningAr,
    required final Map<String, dynamic> payload,
    required final bool requiresApproval,
    final int confidence,
    final int impactScore,
    final DecisionStatus status,
    required final DateTime createdAt,
    final DateTime? scheduledAt,
    final DateTime? executedAt,
    final DateTime? approvedAt,
    final DateTime? rejectedAt,
    final String? userFeedback,
    final String? triggerSource,
    final Map<String, String> relatedIds,
  }) = _$AiBrainDecisionImpl;
  const _AiBrainDecision._() : super._();

  factory _AiBrainDecision.fromJson(Map<String, dynamic> json) =
      _$AiBrainDecisionImpl.fromJson;

  @override
  String get id;
  @override
  DecisionType get type;
  @override
  DecisionUrgency get urgency;
  @override
  DecisionDomain get domain;

  /// Description of the decision (English)
  @override
  String get description;

  /// Description of the decision (Arabic)
  @override
  String? get descriptionAr;

  /// Detailed reasoning for the decision
  @override
  String? get reasoning;
  @override
  String? get reasoningAr;

  /// JSON payload with decision-specific data
  @override
  Map<String, dynamic> get payload;

  /// Whether this decision requires user approval
  @override
  bool get requiresApproval;

  /// Confidence score (0-100)
  @override
  int get confidence;

  /// Impact score (0-100) - how much this affects the plan
  @override
  int get impactScore;

  /// Current status
  @override
  DecisionStatus get status;

  /// Timestamps
  @override
  DateTime get createdAt;
  @override
  DateTime? get scheduledAt;
  @override
  DateTime? get executedAt;
  @override
  DateTime? get approvedAt;
  @override
  DateTime? get rejectedAt;

  /// User feedback on the decision
  @override
  String? get userFeedback;

  /// Source context that triggered this decision
  @override
  String? get triggerSource;

  /// Related entity IDs (plan ID, message ID, etc.)
  @override
  Map<String, String> get relatedIds;

  /// Create a copy of AiBrainDecision
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainDecisionImplCopyWith<_$AiBrainDecisionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatAction _$ChatActionFromJson(Map<String, dynamic> json) {
  return _ChatAction.fromJson(json);
}

/// @nodoc
mixin _$ChatAction {
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get descriptionAr => throw _privateConstructorUsedError;
  Map<String, dynamic> get parameters => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError;
  bool get requiresConfirmation => throw _privateConstructorUsedError;

  /// Serializes this ChatAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatActionCopyWith<ChatAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatActionCopyWith<$Res> {
  factory $ChatActionCopyWith(
    ChatAction value,
    $Res Function(ChatAction) then,
  ) = _$ChatActionCopyWithImpl<$Res, ChatAction>;
  @useResult
  $Res call({
    String type,
    String description,
    String? descriptionAr,
    Map<String, dynamic> parameters,
    int confidence,
    bool requiresConfirmation,
  });
}

/// @nodoc
class _$ChatActionCopyWithImpl<$Res, $Val extends ChatAction>
    implements $ChatActionCopyWith<$Res> {
  _$ChatActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = null,
    Object? descriptionAr = freezed,
    Object? parameters = null,
    Object? confidence = null,
    Object? requiresConfirmation = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionAr: freezed == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            parameters: null == parameters
                ? _value.parameters
                : parameters // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            requiresConfirmation: null == requiresConfirmation
                ? _value.requiresConfirmation
                : requiresConfirmation // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatActionImplCopyWith<$Res>
    implements $ChatActionCopyWith<$Res> {
  factory _$$ChatActionImplCopyWith(
    _$ChatActionImpl value,
    $Res Function(_$ChatActionImpl) then,
  ) = __$$ChatActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    String description,
    String? descriptionAr,
    Map<String, dynamic> parameters,
    int confidence,
    bool requiresConfirmation,
  });
}

/// @nodoc
class __$$ChatActionImplCopyWithImpl<$Res>
    extends _$ChatActionCopyWithImpl<$Res, _$ChatActionImpl>
    implements _$$ChatActionImplCopyWith<$Res> {
  __$$ChatActionImplCopyWithImpl(
    _$ChatActionImpl _value,
    $Res Function(_$ChatActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = null,
    Object? descriptionAr = freezed,
    Object? parameters = null,
    Object? confidence = null,
    Object? requiresConfirmation = null,
  }) {
    return _then(
      _$ChatActionImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: freezed == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        parameters: null == parameters
            ? _value._parameters
            : parameters // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        requiresConfirmation: null == requiresConfirmation
            ? _value.requiresConfirmation
            : requiresConfirmation // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatActionImpl extends _ChatAction {
  const _$ChatActionImpl({
    required this.type,
    required this.description,
    this.descriptionAr,
    required final Map<String, dynamic> parameters,
    this.confidence = 80,
    this.requiresConfirmation = false,
  }) : _parameters = parameters,
       super._();

  factory _$ChatActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatActionImplFromJson(json);

  @override
  final String type;
  @override
  final String description;
  @override
  final String? descriptionAr;
  final Map<String, dynamic> _parameters;
  @override
  Map<String, dynamic> get parameters {
    if (_parameters is EqualUnmodifiableMapView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_parameters);
  }

  @override
  @JsonKey()
  final int confidence;
  @override
  @JsonKey()
  final bool requiresConfirmation;

  @override
  String toString() {
    return 'ChatAction(type: $type, description: $description, descriptionAr: $descriptionAr, parameters: $parameters, confidence: $confidence, requiresConfirmation: $requiresConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatActionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            const DeepCollectionEquality().equals(
              other._parameters,
              _parameters,
            ) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.requiresConfirmation, requiresConfirmation) ||
                other.requiresConfirmation == requiresConfirmation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    description,
    descriptionAr,
    const DeepCollectionEquality().hash(_parameters),
    confidence,
    requiresConfirmation,
  );

  /// Create a copy of ChatAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatActionImplCopyWith<_$ChatActionImpl> get copyWith =>
      __$$ChatActionImplCopyWithImpl<_$ChatActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatActionImplToJson(this);
  }
}

abstract class _ChatAction extends ChatAction {
  const factory _ChatAction({
    required final String type,
    required final String description,
    final String? descriptionAr,
    required final Map<String, dynamic> parameters,
    final int confidence,
    final bool requiresConfirmation,
  }) = _$ChatActionImpl;
  const _ChatAction._() : super._();

  factory _ChatAction.fromJson(Map<String, dynamic> json) =
      _$ChatActionImpl.fromJson;

  @override
  String get type;
  @override
  String get description;
  @override
  String? get descriptionAr;
  @override
  Map<String, dynamic> get parameters;
  @override
  int get confidence;
  @override
  bool get requiresConfirmation;

  /// Create a copy of ChatAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatActionImplCopyWith<_$ChatActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiBrainChatResponse _$AiBrainChatResponseFromJson(Map<String, dynamic> json) {
  return _AiBrainChatResponse.fromJson(json);
}

/// @nodoc
mixin _$AiBrainChatResponse {
  String get content => throw _privateConstructorUsedError;
  String? get contentAr => throw _privateConstructorUsedError;
  List<String> get quickReplies => throw _privateConstructorUsedError;
  List<String> get quickRepliesAr => throw _privateConstructorUsedError;
  ChatAction? get suggestedAction => throw _privateConstructorUsedError;
  bool get requiresActionConfirmation => throw _privateConstructorUsedError;
  String? get reasoning => throw _privateConstructorUsedError;
  int get processingTimeMs => throw _privateConstructorUsedError;

  /// Serializes this AiBrainChatResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainChatResponseCopyWith<AiBrainChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainChatResponseCopyWith<$Res> {
  factory $AiBrainChatResponseCopyWith(
    AiBrainChatResponse value,
    $Res Function(AiBrainChatResponse) then,
  ) = _$AiBrainChatResponseCopyWithImpl<$Res, AiBrainChatResponse>;
  @useResult
  $Res call({
    String content,
    String? contentAr,
    List<String> quickReplies,
    List<String> quickRepliesAr,
    ChatAction? suggestedAction,
    bool requiresActionConfirmation,
    String? reasoning,
    int processingTimeMs,
  });

  $ChatActionCopyWith<$Res>? get suggestedAction;
}

/// @nodoc
class _$AiBrainChatResponseCopyWithImpl<$Res, $Val extends AiBrainChatResponse>
    implements $AiBrainChatResponseCopyWith<$Res> {
  _$AiBrainChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? contentAr = freezed,
    Object? quickReplies = null,
    Object? quickRepliesAr = null,
    Object? suggestedAction = freezed,
    Object? requiresActionConfirmation = null,
    Object? reasoning = freezed,
    Object? processingTimeMs = null,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            contentAr: freezed == contentAr
                ? _value.contentAr
                : contentAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            quickReplies: null == quickReplies
                ? _value.quickReplies
                : quickReplies // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            quickRepliesAr: null == quickRepliesAr
                ? _value.quickRepliesAr
                : quickRepliesAr // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            suggestedAction: freezed == suggestedAction
                ? _value.suggestedAction
                : suggestedAction // ignore: cast_nullable_to_non_nullable
                      as ChatAction?,
            requiresActionConfirmation: null == requiresActionConfirmation
                ? _value.requiresActionConfirmation
                : requiresActionConfirmation // ignore: cast_nullable_to_non_nullable
                      as bool,
            reasoning: freezed == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String?,
            processingTimeMs: null == processingTimeMs
                ? _value.processingTimeMs
                : processingTimeMs // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of AiBrainChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatActionCopyWith<$Res>? get suggestedAction {
    if (_value.suggestedAction == null) {
      return null;
    }

    return $ChatActionCopyWith<$Res>(_value.suggestedAction!, (value) {
      return _then(_value.copyWith(suggestedAction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AiBrainChatResponseImplCopyWith<$Res>
    implements $AiBrainChatResponseCopyWith<$Res> {
  factory _$$AiBrainChatResponseImplCopyWith(
    _$AiBrainChatResponseImpl value,
    $Res Function(_$AiBrainChatResponseImpl) then,
  ) = __$$AiBrainChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String content,
    String? contentAr,
    List<String> quickReplies,
    List<String> quickRepliesAr,
    ChatAction? suggestedAction,
    bool requiresActionConfirmation,
    String? reasoning,
    int processingTimeMs,
  });

  @override
  $ChatActionCopyWith<$Res>? get suggestedAction;
}

/// @nodoc
class __$$AiBrainChatResponseImplCopyWithImpl<$Res>
    extends _$AiBrainChatResponseCopyWithImpl<$Res, _$AiBrainChatResponseImpl>
    implements _$$AiBrainChatResponseImplCopyWith<$Res> {
  __$$AiBrainChatResponseImplCopyWithImpl(
    _$AiBrainChatResponseImpl _value,
    $Res Function(_$AiBrainChatResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? contentAr = freezed,
    Object? quickReplies = null,
    Object? quickRepliesAr = null,
    Object? suggestedAction = freezed,
    Object? requiresActionConfirmation = null,
    Object? reasoning = freezed,
    Object? processingTimeMs = null,
  }) {
    return _then(
      _$AiBrainChatResponseImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        contentAr: freezed == contentAr
            ? _value.contentAr
            : contentAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        quickReplies: null == quickReplies
            ? _value._quickReplies
            : quickReplies // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        quickRepliesAr: null == quickRepliesAr
            ? _value._quickRepliesAr
            : quickRepliesAr // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        suggestedAction: freezed == suggestedAction
            ? _value.suggestedAction
            : suggestedAction // ignore: cast_nullable_to_non_nullable
                  as ChatAction?,
        requiresActionConfirmation: null == requiresActionConfirmation
            ? _value.requiresActionConfirmation
            : requiresActionConfirmation // ignore: cast_nullable_to_non_nullable
                  as bool,
        reasoning: freezed == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String?,
        processingTimeMs: null == processingTimeMs
            ? _value.processingTimeMs
            : processingTimeMs // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainChatResponseImpl implements _AiBrainChatResponse {
  const _$AiBrainChatResponseImpl({
    required this.content,
    this.contentAr,
    final List<String> quickReplies = const [],
    final List<String> quickRepliesAr = const [],
    this.suggestedAction,
    this.requiresActionConfirmation = false,
    this.reasoning,
    this.processingTimeMs = 0,
  }) : _quickReplies = quickReplies,
       _quickRepliesAr = quickRepliesAr;

  factory _$AiBrainChatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainChatResponseImplFromJson(json);

  @override
  final String content;
  @override
  final String? contentAr;
  final List<String> _quickReplies;
  @override
  @JsonKey()
  List<String> get quickReplies {
    if (_quickReplies is EqualUnmodifiableListView) return _quickReplies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quickReplies);
  }

  final List<String> _quickRepliesAr;
  @override
  @JsonKey()
  List<String> get quickRepliesAr {
    if (_quickRepliesAr is EqualUnmodifiableListView) return _quickRepliesAr;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quickRepliesAr);
  }

  @override
  final ChatAction? suggestedAction;
  @override
  @JsonKey()
  final bool requiresActionConfirmation;
  @override
  final String? reasoning;
  @override
  @JsonKey()
  final int processingTimeMs;

  @override
  String toString() {
    return 'AiBrainChatResponse(content: $content, contentAr: $contentAr, quickReplies: $quickReplies, quickRepliesAr: $quickRepliesAr, suggestedAction: $suggestedAction, requiresActionConfirmation: $requiresActionConfirmation, reasoning: $reasoning, processingTimeMs: $processingTimeMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainChatResponseImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.contentAr, contentAr) ||
                other.contentAr == contentAr) &&
            const DeepCollectionEquality().equals(
              other._quickReplies,
              _quickReplies,
            ) &&
            const DeepCollectionEquality().equals(
              other._quickRepliesAr,
              _quickRepliesAr,
            ) &&
            (identical(other.suggestedAction, suggestedAction) ||
                other.suggestedAction == suggestedAction) &&
            (identical(
                  other.requiresActionConfirmation,
                  requiresActionConfirmation,
                ) ||
                other.requiresActionConfirmation ==
                    requiresActionConfirmation) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.processingTimeMs, processingTimeMs) ||
                other.processingTimeMs == processingTimeMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    content,
    contentAr,
    const DeepCollectionEquality().hash(_quickReplies),
    const DeepCollectionEquality().hash(_quickRepliesAr),
    suggestedAction,
    requiresActionConfirmation,
    reasoning,
    processingTimeMs,
  );

  /// Create a copy of AiBrainChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainChatResponseImplCopyWith<_$AiBrainChatResponseImpl> get copyWith =>
      __$$AiBrainChatResponseImplCopyWithImpl<_$AiBrainChatResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainChatResponseImplToJson(this);
  }
}

abstract class _AiBrainChatResponse implements AiBrainChatResponse {
  const factory _AiBrainChatResponse({
    required final String content,
    final String? contentAr,
    final List<String> quickReplies,
    final List<String> quickRepliesAr,
    final ChatAction? suggestedAction,
    final bool requiresActionConfirmation,
    final String? reasoning,
    final int processingTimeMs,
  }) = _$AiBrainChatResponseImpl;

  factory _AiBrainChatResponse.fromJson(Map<String, dynamic> json) =
      _$AiBrainChatResponseImpl.fromJson;

  @override
  String get content;
  @override
  String? get contentAr;
  @override
  List<String> get quickReplies;
  @override
  List<String> get quickRepliesAr;
  @override
  ChatAction? get suggestedAction;
  @override
  bool get requiresActionConfirmation;
  @override
  String? get reasoning;
  @override
  int get processingTimeMs;

  /// Create a copy of AiBrainChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainChatResponseImplCopyWith<_$AiBrainChatResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
