// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_adjustment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlanAdjustment _$PlanAdjustmentFromJson(Map<String, dynamic> json) {
  return _PlanAdjustment.fromJson(json);
}

/// @nodoc
mixin _$PlanAdjustment {
  String get id => throw _privateConstructorUsedError;
  AdjustmentType get type => throw _privateConstructorUsedError;
  AdjustmentDomain get domain => throw _privateConstructorUsedError;

  /// Reason for the adjustment (English)
  String get reason => throw _privateConstructorUsedError;
  String? get reasonAr => throw _privateConstructorUsedError;

  /// Detailed explanation
  String? get explanation => throw _privateConstructorUsedError;
  String? get explanationAr => throw _privateConstructorUsedError;

  /// What triggered this adjustment
  String get trigger => throw _privateConstructorUsedError;
  String? get triggerAr => throw _privateConstructorUsedError;

  /// Original value (JSON-serializable)
  Map<String, dynamic> get originalValue => throw _privateConstructorUsedError;

  /// Proposed new value (JSON-serializable)
  Map<String, dynamic> get proposedValue => throw _privateConstructorUsedError;

  /// Day index affected (0 = Monday, null = whole week)
  int? get affectedDayIndex => throw _privateConstructorUsedError;

  /// Impact score (0-100)
  int get impactScore => throw _privateConstructorUsedError;

  /// Confidence in this adjustment (0-100)
  int get confidence => throw _privateConstructorUsedError;

  /// Current status
  AdjustmentStatus get status => throw _privateConstructorUsedError;

  /// Related plan IDs
  String? get mealPlanId => throw _privateConstructorUsedError;
  String? get workoutPlanId => throw _privateConstructorUsedError;
  String? get masterPlanId => throw _privateConstructorUsedError;

  /// Timestamps
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get appliedAt => throw _privateConstructorUsedError;
  DateTime? get revertedAt => throw _privateConstructorUsedError;

  /// User feedback
  String? get userFeedback => throw _privateConstructorUsedError;

  /// Serializes this PlanAdjustment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanAdjustment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanAdjustmentCopyWith<PlanAdjustment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanAdjustmentCopyWith<$Res> {
  factory $PlanAdjustmentCopyWith(
    PlanAdjustment value,
    $Res Function(PlanAdjustment) then,
  ) = _$PlanAdjustmentCopyWithImpl<$Res, PlanAdjustment>;
  @useResult
  $Res call({
    String id,
    AdjustmentType type,
    AdjustmentDomain domain,
    String reason,
    String? reasonAr,
    String? explanation,
    String? explanationAr,
    String trigger,
    String? triggerAr,
    Map<String, dynamic> originalValue,
    Map<String, dynamic> proposedValue,
    int? affectedDayIndex,
    int impactScore,
    int confidence,
    AdjustmentStatus status,
    String? mealPlanId,
    String? workoutPlanId,
    String? masterPlanId,
    DateTime createdAt,
    DateTime? appliedAt,
    DateTime? revertedAt,
    String? userFeedback,
  });
}

/// @nodoc
class _$PlanAdjustmentCopyWithImpl<$Res, $Val extends PlanAdjustment>
    implements $PlanAdjustmentCopyWith<$Res> {
  _$PlanAdjustmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanAdjustment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? domain = null,
    Object? reason = null,
    Object? reasonAr = freezed,
    Object? explanation = freezed,
    Object? explanationAr = freezed,
    Object? trigger = null,
    Object? triggerAr = freezed,
    Object? originalValue = null,
    Object? proposedValue = null,
    Object? affectedDayIndex = freezed,
    Object? impactScore = null,
    Object? confidence = null,
    Object? status = null,
    Object? mealPlanId = freezed,
    Object? workoutPlanId = freezed,
    Object? masterPlanId = freezed,
    Object? createdAt = null,
    Object? appliedAt = freezed,
    Object? revertedAt = freezed,
    Object? userFeedback = freezed,
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
                      as AdjustmentType,
            domain: null == domain
                ? _value.domain
                : domain // ignore: cast_nullable_to_non_nullable
                      as AdjustmentDomain,
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
            reasonAr: freezed == reasonAr
                ? _value.reasonAr
                : reasonAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            explanation: freezed == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String?,
            explanationAr: freezed == explanationAr
                ? _value.explanationAr
                : explanationAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            trigger: null == trigger
                ? _value.trigger
                : trigger // ignore: cast_nullable_to_non_nullable
                      as String,
            triggerAr: freezed == triggerAr
                ? _value.triggerAr
                : triggerAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            originalValue: null == originalValue
                ? _value.originalValue
                : originalValue // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            proposedValue: null == proposedValue
                ? _value.proposedValue
                : proposedValue // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            affectedDayIndex: freezed == affectedDayIndex
                ? _value.affectedDayIndex
                : affectedDayIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
            impactScore: null == impactScore
                ? _value.impactScore
                : impactScore // ignore: cast_nullable_to_non_nullable
                      as int,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as AdjustmentStatus,
            mealPlanId: freezed == mealPlanId
                ? _value.mealPlanId
                : mealPlanId // ignore: cast_nullable_to_non_nullable
                      as String?,
            workoutPlanId: freezed == workoutPlanId
                ? _value.workoutPlanId
                : workoutPlanId // ignore: cast_nullable_to_non_nullable
                      as String?,
            masterPlanId: freezed == masterPlanId
                ? _value.masterPlanId
                : masterPlanId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            appliedAt: freezed == appliedAt
                ? _value.appliedAt
                : appliedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            revertedAt: freezed == revertedAt
                ? _value.revertedAt
                : revertedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            userFeedback: freezed == userFeedback
                ? _value.userFeedback
                : userFeedback // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanAdjustmentImplCopyWith<$Res>
    implements $PlanAdjustmentCopyWith<$Res> {
  factory _$$PlanAdjustmentImplCopyWith(
    _$PlanAdjustmentImpl value,
    $Res Function(_$PlanAdjustmentImpl) then,
  ) = __$$PlanAdjustmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    AdjustmentType type,
    AdjustmentDomain domain,
    String reason,
    String? reasonAr,
    String? explanation,
    String? explanationAr,
    String trigger,
    String? triggerAr,
    Map<String, dynamic> originalValue,
    Map<String, dynamic> proposedValue,
    int? affectedDayIndex,
    int impactScore,
    int confidence,
    AdjustmentStatus status,
    String? mealPlanId,
    String? workoutPlanId,
    String? masterPlanId,
    DateTime createdAt,
    DateTime? appliedAt,
    DateTime? revertedAt,
    String? userFeedback,
  });
}

/// @nodoc
class __$$PlanAdjustmentImplCopyWithImpl<$Res>
    extends _$PlanAdjustmentCopyWithImpl<$Res, _$PlanAdjustmentImpl>
    implements _$$PlanAdjustmentImplCopyWith<$Res> {
  __$$PlanAdjustmentImplCopyWithImpl(
    _$PlanAdjustmentImpl _value,
    $Res Function(_$PlanAdjustmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanAdjustment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? domain = null,
    Object? reason = null,
    Object? reasonAr = freezed,
    Object? explanation = freezed,
    Object? explanationAr = freezed,
    Object? trigger = null,
    Object? triggerAr = freezed,
    Object? originalValue = null,
    Object? proposedValue = null,
    Object? affectedDayIndex = freezed,
    Object? impactScore = null,
    Object? confidence = null,
    Object? status = null,
    Object? mealPlanId = freezed,
    Object? workoutPlanId = freezed,
    Object? masterPlanId = freezed,
    Object? createdAt = null,
    Object? appliedAt = freezed,
    Object? revertedAt = freezed,
    Object? userFeedback = freezed,
  }) {
    return _then(
      _$PlanAdjustmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AdjustmentType,
        domain: null == domain
            ? _value.domain
            : domain // ignore: cast_nullable_to_non_nullable
                  as AdjustmentDomain,
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
        reasonAr: freezed == reasonAr
            ? _value.reasonAr
            : reasonAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        explanation: freezed == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String?,
        explanationAr: freezed == explanationAr
            ? _value.explanationAr
            : explanationAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        trigger: null == trigger
            ? _value.trigger
            : trigger // ignore: cast_nullable_to_non_nullable
                  as String,
        triggerAr: freezed == triggerAr
            ? _value.triggerAr
            : triggerAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        originalValue: null == originalValue
            ? _value._originalValue
            : originalValue // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        proposedValue: null == proposedValue
            ? _value._proposedValue
            : proposedValue // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        affectedDayIndex: freezed == affectedDayIndex
            ? _value.affectedDayIndex
            : affectedDayIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        impactScore: null == impactScore
            ? _value.impactScore
            : impactScore // ignore: cast_nullable_to_non_nullable
                  as int,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AdjustmentStatus,
        mealPlanId: freezed == mealPlanId
            ? _value.mealPlanId
            : mealPlanId // ignore: cast_nullable_to_non_nullable
                  as String?,
        workoutPlanId: freezed == workoutPlanId
            ? _value.workoutPlanId
            : workoutPlanId // ignore: cast_nullable_to_non_nullable
                  as String?,
        masterPlanId: freezed == masterPlanId
            ? _value.masterPlanId
            : masterPlanId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        appliedAt: freezed == appliedAt
            ? _value.appliedAt
            : appliedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        revertedAt: freezed == revertedAt
            ? _value.revertedAt
            : revertedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        userFeedback: freezed == userFeedback
            ? _value.userFeedback
            : userFeedback // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanAdjustmentImpl extends _PlanAdjustment {
  const _$PlanAdjustmentImpl({
    required this.id,
    required this.type,
    required this.domain,
    required this.reason,
    this.reasonAr,
    this.explanation,
    this.explanationAr,
    required this.trigger,
    this.triggerAr,
    required final Map<String, dynamic> originalValue,
    required final Map<String, dynamic> proposedValue,
    this.affectedDayIndex,
    this.impactScore = 50,
    this.confidence = 80,
    this.status = AdjustmentStatus.proposed,
    this.mealPlanId,
    this.workoutPlanId,
    this.masterPlanId,
    required this.createdAt,
    this.appliedAt,
    this.revertedAt,
    this.userFeedback,
  }) : _originalValue = originalValue,
       _proposedValue = proposedValue,
       super._();

  factory _$PlanAdjustmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanAdjustmentImplFromJson(json);

  @override
  final String id;
  @override
  final AdjustmentType type;
  @override
  final AdjustmentDomain domain;

  /// Reason for the adjustment (English)
  @override
  final String reason;
  @override
  final String? reasonAr;

  /// Detailed explanation
  @override
  final String? explanation;
  @override
  final String? explanationAr;

  /// What triggered this adjustment
  @override
  final String trigger;
  @override
  final String? triggerAr;

  /// Original value (JSON-serializable)
  final Map<String, dynamic> _originalValue;

  /// Original value (JSON-serializable)
  @override
  Map<String, dynamic> get originalValue {
    if (_originalValue is EqualUnmodifiableMapView) return _originalValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_originalValue);
  }

  /// Proposed new value (JSON-serializable)
  final Map<String, dynamic> _proposedValue;

  /// Proposed new value (JSON-serializable)
  @override
  Map<String, dynamic> get proposedValue {
    if (_proposedValue is EqualUnmodifiableMapView) return _proposedValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_proposedValue);
  }

  /// Day index affected (0 = Monday, null = whole week)
  @override
  final int? affectedDayIndex;

  /// Impact score (0-100)
  @override
  @JsonKey()
  final int impactScore;

  /// Confidence in this adjustment (0-100)
  @override
  @JsonKey()
  final int confidence;

  /// Current status
  @override
  @JsonKey()
  final AdjustmentStatus status;

  /// Related plan IDs
  @override
  final String? mealPlanId;
  @override
  final String? workoutPlanId;
  @override
  final String? masterPlanId;

  /// Timestamps
  @override
  final DateTime createdAt;
  @override
  final DateTime? appliedAt;
  @override
  final DateTime? revertedAt;

  /// User feedback
  @override
  final String? userFeedback;

  @override
  String toString() {
    return 'PlanAdjustment(id: $id, type: $type, domain: $domain, reason: $reason, reasonAr: $reasonAr, explanation: $explanation, explanationAr: $explanationAr, trigger: $trigger, triggerAr: $triggerAr, originalValue: $originalValue, proposedValue: $proposedValue, affectedDayIndex: $affectedDayIndex, impactScore: $impactScore, confidence: $confidence, status: $status, mealPlanId: $mealPlanId, workoutPlanId: $workoutPlanId, masterPlanId: $masterPlanId, createdAt: $createdAt, appliedAt: $appliedAt, revertedAt: $revertedAt, userFeedback: $userFeedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanAdjustmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.reasonAr, reasonAr) ||
                other.reasonAr == reasonAr) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.explanationAr, explanationAr) ||
                other.explanationAr == explanationAr) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.triggerAr, triggerAr) ||
                other.triggerAr == triggerAr) &&
            const DeepCollectionEquality().equals(
              other._originalValue,
              _originalValue,
            ) &&
            const DeepCollectionEquality().equals(
              other._proposedValue,
              _proposedValue,
            ) &&
            (identical(other.affectedDayIndex, affectedDayIndex) ||
                other.affectedDayIndex == affectedDayIndex) &&
            (identical(other.impactScore, impactScore) ||
                other.impactScore == impactScore) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mealPlanId, mealPlanId) ||
                other.mealPlanId == mealPlanId) &&
            (identical(other.workoutPlanId, workoutPlanId) ||
                other.workoutPlanId == workoutPlanId) &&
            (identical(other.masterPlanId, masterPlanId) ||
                other.masterPlanId == masterPlanId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.appliedAt, appliedAt) ||
                other.appliedAt == appliedAt) &&
            (identical(other.revertedAt, revertedAt) ||
                other.revertedAt == revertedAt) &&
            (identical(other.userFeedback, userFeedback) ||
                other.userFeedback == userFeedback));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    type,
    domain,
    reason,
    reasonAr,
    explanation,
    explanationAr,
    trigger,
    triggerAr,
    const DeepCollectionEquality().hash(_originalValue),
    const DeepCollectionEquality().hash(_proposedValue),
    affectedDayIndex,
    impactScore,
    confidence,
    status,
    mealPlanId,
    workoutPlanId,
    masterPlanId,
    createdAt,
    appliedAt,
    revertedAt,
    userFeedback,
  ]);

  /// Create a copy of PlanAdjustment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanAdjustmentImplCopyWith<_$PlanAdjustmentImpl> get copyWith =>
      __$$PlanAdjustmentImplCopyWithImpl<_$PlanAdjustmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanAdjustmentImplToJson(this);
  }
}

abstract class _PlanAdjustment extends PlanAdjustment {
  const factory _PlanAdjustment({
    required final String id,
    required final AdjustmentType type,
    required final AdjustmentDomain domain,
    required final String reason,
    final String? reasonAr,
    final String? explanation,
    final String? explanationAr,
    required final String trigger,
    final String? triggerAr,
    required final Map<String, dynamic> originalValue,
    required final Map<String, dynamic> proposedValue,
    final int? affectedDayIndex,
    final int impactScore,
    final int confidence,
    final AdjustmentStatus status,
    final String? mealPlanId,
    final String? workoutPlanId,
    final String? masterPlanId,
    required final DateTime createdAt,
    final DateTime? appliedAt,
    final DateTime? revertedAt,
    final String? userFeedback,
  }) = _$PlanAdjustmentImpl;
  const _PlanAdjustment._() : super._();

  factory _PlanAdjustment.fromJson(Map<String, dynamic> json) =
      _$PlanAdjustmentImpl.fromJson;

  @override
  String get id;
  @override
  AdjustmentType get type;
  @override
  AdjustmentDomain get domain;

  /// Reason for the adjustment (English)
  @override
  String get reason;
  @override
  String? get reasonAr;

  /// Detailed explanation
  @override
  String? get explanation;
  @override
  String? get explanationAr;

  /// What triggered this adjustment
  @override
  String get trigger;
  @override
  String? get triggerAr;

  /// Original value (JSON-serializable)
  @override
  Map<String, dynamic> get originalValue;

  /// Proposed new value (JSON-serializable)
  @override
  Map<String, dynamic> get proposedValue;

  /// Day index affected (0 = Monday, null = whole week)
  @override
  int? get affectedDayIndex;

  /// Impact score (0-100)
  @override
  int get impactScore;

  /// Confidence in this adjustment (0-100)
  @override
  int get confidence;

  /// Current status
  @override
  AdjustmentStatus get status;

  /// Related plan IDs
  @override
  String? get mealPlanId;
  @override
  String? get workoutPlanId;
  @override
  String? get masterPlanId;

  /// Timestamps
  @override
  DateTime get createdAt;
  @override
  DateTime? get appliedAt;
  @override
  DateTime? get revertedAt;

  /// User feedback
  @override
  String? get userFeedback;

  /// Create a copy of PlanAdjustment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanAdjustmentImplCopyWith<_$PlanAdjustmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
