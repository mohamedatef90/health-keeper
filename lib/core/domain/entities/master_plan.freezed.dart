// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MasterPlan _$MasterPlanFromJson(Map<String, dynamic> json) {
  return _MasterPlan.fromJson(json);
}

/// @nodoc
mixin _$MasterPlan {
  String get id => throw _privateConstructorUsedError;

  /// Start date of the week (Monday)
  DateTime get weekStartDate => throw _privateConstructorUsedError;

  /// When this master plan was created
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// When this master plan was last updated
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// ID of linked weekly meal plan
  String? get weeklyMealPlanId => throw _privateConstructorUsedError;

  /// ID of linked weekly workout plan
  String? get weeklyWorkoutPlanId => throw _privateConstructorUsedError;

  /// Current status of the master plan
  MasterPlanStatus get status => throw _privateConstructorUsedError;

  /// Pending changes awaiting approval
  List<PendingPlanChange> get pendingChanges =>
      throw _privateConstructorUsedError;

  /// Total planned calorie burn from workouts
  int? get plannedCalorieBurn => throw _privateConstructorUsedError;

  /// Total planned calorie intake from meals
  int? get plannedCalorieIntake => throw _privateConstructorUsedError;

  /// Net calorie balance (intake - burn)
  int? get netCalorieBalance => throw _privateConstructorUsedError;

  /// Is this the active plan for the week?
  bool get isActive => throw _privateConstructorUsedError;

  /// Notes for the master plan
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this MasterPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MasterPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasterPlanCopyWith<MasterPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterPlanCopyWith<$Res> {
  factory $MasterPlanCopyWith(
    MasterPlan value,
    $Res Function(MasterPlan) then,
  ) = _$MasterPlanCopyWithImpl<$Res, MasterPlan>;
  @useResult
  $Res call({
    String id,
    DateTime weekStartDate,
    DateTime createdAt,
    DateTime updatedAt,
    String? weeklyMealPlanId,
    String? weeklyWorkoutPlanId,
    MasterPlanStatus status,
    List<PendingPlanChange> pendingChanges,
    int? plannedCalorieBurn,
    int? plannedCalorieIntake,
    int? netCalorieBalance,
    bool isActive,
    String? notes,
  });
}

/// @nodoc
class _$MasterPlanCopyWithImpl<$Res, $Val extends MasterPlan>
    implements $MasterPlanCopyWith<$Res> {
  _$MasterPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasterPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekStartDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? weeklyMealPlanId = freezed,
    Object? weeklyWorkoutPlanId = freezed,
    Object? status = null,
    Object? pendingChanges = null,
    Object? plannedCalorieBurn = freezed,
    Object? plannedCalorieIntake = freezed,
    Object? netCalorieBalance = freezed,
    Object? isActive = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            weekStartDate: null == weekStartDate
                ? _value.weekStartDate
                : weekStartDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            weeklyMealPlanId: freezed == weeklyMealPlanId
                ? _value.weeklyMealPlanId
                : weeklyMealPlanId // ignore: cast_nullable_to_non_nullable
                      as String?,
            weeklyWorkoutPlanId: freezed == weeklyWorkoutPlanId
                ? _value.weeklyWorkoutPlanId
                : weeklyWorkoutPlanId // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MasterPlanStatus,
            pendingChanges: null == pendingChanges
                ? _value.pendingChanges
                : pendingChanges // ignore: cast_nullable_to_non_nullable
                      as List<PendingPlanChange>,
            plannedCalorieBurn: freezed == plannedCalorieBurn
                ? _value.plannedCalorieBurn
                : plannedCalorieBurn // ignore: cast_nullable_to_non_nullable
                      as int?,
            plannedCalorieIntake: freezed == plannedCalorieIntake
                ? _value.plannedCalorieIntake
                : plannedCalorieIntake // ignore: cast_nullable_to_non_nullable
                      as int?,
            netCalorieBalance: freezed == netCalorieBalance
                ? _value.netCalorieBalance
                : netCalorieBalance // ignore: cast_nullable_to_non_nullable
                      as int?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MasterPlanImplCopyWith<$Res>
    implements $MasterPlanCopyWith<$Res> {
  factory _$$MasterPlanImplCopyWith(
    _$MasterPlanImpl value,
    $Res Function(_$MasterPlanImpl) then,
  ) = __$$MasterPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime weekStartDate,
    DateTime createdAt,
    DateTime updatedAt,
    String? weeklyMealPlanId,
    String? weeklyWorkoutPlanId,
    MasterPlanStatus status,
    List<PendingPlanChange> pendingChanges,
    int? plannedCalorieBurn,
    int? plannedCalorieIntake,
    int? netCalorieBalance,
    bool isActive,
    String? notes,
  });
}

/// @nodoc
class __$$MasterPlanImplCopyWithImpl<$Res>
    extends _$MasterPlanCopyWithImpl<$Res, _$MasterPlanImpl>
    implements _$$MasterPlanImplCopyWith<$Res> {
  __$$MasterPlanImplCopyWithImpl(
    _$MasterPlanImpl _value,
    $Res Function(_$MasterPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MasterPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekStartDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? weeklyMealPlanId = freezed,
    Object? weeklyWorkoutPlanId = freezed,
    Object? status = null,
    Object? pendingChanges = null,
    Object? plannedCalorieBurn = freezed,
    Object? plannedCalorieIntake = freezed,
    Object? netCalorieBalance = freezed,
    Object? isActive = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$MasterPlanImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        weekStartDate: null == weekStartDate
            ? _value.weekStartDate
            : weekStartDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        weeklyMealPlanId: freezed == weeklyMealPlanId
            ? _value.weeklyMealPlanId
            : weeklyMealPlanId // ignore: cast_nullable_to_non_nullable
                  as String?,
        weeklyWorkoutPlanId: freezed == weeklyWorkoutPlanId
            ? _value.weeklyWorkoutPlanId
            : weeklyWorkoutPlanId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MasterPlanStatus,
        pendingChanges: null == pendingChanges
            ? _value._pendingChanges
            : pendingChanges // ignore: cast_nullable_to_non_nullable
                  as List<PendingPlanChange>,
        plannedCalorieBurn: freezed == plannedCalorieBurn
            ? _value.plannedCalorieBurn
            : plannedCalorieBurn // ignore: cast_nullable_to_non_nullable
                  as int?,
        plannedCalorieIntake: freezed == plannedCalorieIntake
            ? _value.plannedCalorieIntake
            : plannedCalorieIntake // ignore: cast_nullable_to_non_nullable
                  as int?,
        netCalorieBalance: freezed == netCalorieBalance
            ? _value.netCalorieBalance
            : netCalorieBalance // ignore: cast_nullable_to_non_nullable
                  as int?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MasterPlanImpl extends _MasterPlan {
  const _$MasterPlanImpl({
    required this.id,
    required this.weekStartDate,
    required this.createdAt,
    required this.updatedAt,
    this.weeklyMealPlanId,
    this.weeklyWorkoutPlanId,
    this.status = MasterPlanStatus.draft,
    final List<PendingPlanChange> pendingChanges = const [],
    this.plannedCalorieBurn,
    this.plannedCalorieIntake,
    this.netCalorieBalance,
    this.isActive = false,
    this.notes,
  }) : _pendingChanges = pendingChanges,
       super._();

  factory _$MasterPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$MasterPlanImplFromJson(json);

  @override
  final String id;

  /// Start date of the week (Monday)
  @override
  final DateTime weekStartDate;

  /// When this master plan was created
  @override
  final DateTime createdAt;

  /// When this master plan was last updated
  @override
  final DateTime updatedAt;

  /// ID of linked weekly meal plan
  @override
  final String? weeklyMealPlanId;

  /// ID of linked weekly workout plan
  @override
  final String? weeklyWorkoutPlanId;

  /// Current status of the master plan
  @override
  @JsonKey()
  final MasterPlanStatus status;

  /// Pending changes awaiting approval
  final List<PendingPlanChange> _pendingChanges;

  /// Pending changes awaiting approval
  @override
  @JsonKey()
  List<PendingPlanChange> get pendingChanges {
    if (_pendingChanges is EqualUnmodifiableListView) return _pendingChanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingChanges);
  }

  /// Total planned calorie burn from workouts
  @override
  final int? plannedCalorieBurn;

  /// Total planned calorie intake from meals
  @override
  final int? plannedCalorieIntake;

  /// Net calorie balance (intake - burn)
  @override
  final int? netCalorieBalance;

  /// Is this the active plan for the week?
  @override
  @JsonKey()
  final bool isActive;

  /// Notes for the master plan
  @override
  final String? notes;

  @override
  String toString() {
    return 'MasterPlan(id: $id, weekStartDate: $weekStartDate, createdAt: $createdAt, updatedAt: $updatedAt, weeklyMealPlanId: $weeklyMealPlanId, weeklyWorkoutPlanId: $weeklyWorkoutPlanId, status: $status, pendingChanges: $pendingChanges, plannedCalorieBurn: $plannedCalorieBurn, plannedCalorieIntake: $plannedCalorieIntake, netCalorieBalance: $netCalorieBalance, isActive: $isActive, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.weeklyMealPlanId, weeklyMealPlanId) ||
                other.weeklyMealPlanId == weeklyMealPlanId) &&
            (identical(other.weeklyWorkoutPlanId, weeklyWorkoutPlanId) ||
                other.weeklyWorkoutPlanId == weeklyWorkoutPlanId) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._pendingChanges,
              _pendingChanges,
            ) &&
            (identical(other.plannedCalorieBurn, plannedCalorieBurn) ||
                other.plannedCalorieBurn == plannedCalorieBurn) &&
            (identical(other.plannedCalorieIntake, plannedCalorieIntake) ||
                other.plannedCalorieIntake == plannedCalorieIntake) &&
            (identical(other.netCalorieBalance, netCalorieBalance) ||
                other.netCalorieBalance == netCalorieBalance) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    weekStartDate,
    createdAt,
    updatedAt,
    weeklyMealPlanId,
    weeklyWorkoutPlanId,
    status,
    const DeepCollectionEquality().hash(_pendingChanges),
    plannedCalorieBurn,
    plannedCalorieIntake,
    netCalorieBalance,
    isActive,
    notes,
  );

  /// Create a copy of MasterPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterPlanImplCopyWith<_$MasterPlanImpl> get copyWith =>
      __$$MasterPlanImplCopyWithImpl<_$MasterPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MasterPlanImplToJson(this);
  }
}

abstract class _MasterPlan extends MasterPlan {
  const factory _MasterPlan({
    required final String id,
    required final DateTime weekStartDate,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final String? weeklyMealPlanId,
    final String? weeklyWorkoutPlanId,
    final MasterPlanStatus status,
    final List<PendingPlanChange> pendingChanges,
    final int? plannedCalorieBurn,
    final int? plannedCalorieIntake,
    final int? netCalorieBalance,
    final bool isActive,
    final String? notes,
  }) = _$MasterPlanImpl;
  const _MasterPlan._() : super._();

  factory _MasterPlan.fromJson(Map<String, dynamic> json) =
      _$MasterPlanImpl.fromJson;

  @override
  String get id;

  /// Start date of the week (Monday)
  @override
  DateTime get weekStartDate;

  /// When this master plan was created
  @override
  DateTime get createdAt;

  /// When this master plan was last updated
  @override
  DateTime get updatedAt;

  /// ID of linked weekly meal plan
  @override
  String? get weeklyMealPlanId;

  /// ID of linked weekly workout plan
  @override
  String? get weeklyWorkoutPlanId;

  /// Current status of the master plan
  @override
  MasterPlanStatus get status;

  /// Pending changes awaiting approval
  @override
  List<PendingPlanChange> get pendingChanges;

  /// Total planned calorie burn from workouts
  @override
  int? get plannedCalorieBurn;

  /// Total planned calorie intake from meals
  @override
  int? get plannedCalorieIntake;

  /// Net calorie balance (intake - burn)
  @override
  int? get netCalorieBalance;

  /// Is this the active plan for the week?
  @override
  bool get isActive;

  /// Notes for the master plan
  @override
  String? get notes;

  /// Create a copy of MasterPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasterPlanImplCopyWith<_$MasterPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PendingPlanChange _$PendingPlanChangeFromJson(Map<String, dynamic> json) {
  return _PendingPlanChange.fromJson(json);
}

/// @nodoc
mixin _$PendingPlanChange {
  String get id => throw _privateConstructorUsedError;

  /// Source that triggered this change
  PlanChangeSource get source => throw _privateConstructorUsedError;

  /// Type of change
  PlanChangeType get type => throw _privateConstructorUsedError;

  /// Description of the change (English)
  String get description => throw _privateConstructorUsedError;

  /// Description of the change (Arabic)
  String get descriptionAr => throw _privateConstructorUsedError;

  /// What triggered this change
  String get trigger => throw _privateConstructorUsedError;

  /// Arabic trigger description
  String? get triggerAr => throw _privateConstructorUsedError;

  /// Day index affected (0 = Monday, null = whole week)
  int? get affectedDayIndex => throw _privateConstructorUsedError;

  /// Proposed changes as key-value pairs
  Map<String, dynamic> get proposedChanges =>
      throw _privateConstructorUsedError;

  /// Current approval status
  ChangeApprovalStatus get status => throw _privateConstructorUsedError;

  /// When this change was created
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// When this change was approved/rejected
  DateTime? get resolvedAt => throw _privateConstructorUsedError;

  /// Priority of the change (higher = more urgent)
  int get priority => throw _privateConstructorUsedError;

  /// Impact score (0-100, how much this affects the overall plan)
  int get impactScore => throw _privateConstructorUsedError;

  /// Serializes this PendingPlanChange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingPlanChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingPlanChangeCopyWith<PendingPlanChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingPlanChangeCopyWith<$Res> {
  factory $PendingPlanChangeCopyWith(
    PendingPlanChange value,
    $Res Function(PendingPlanChange) then,
  ) = _$PendingPlanChangeCopyWithImpl<$Res, PendingPlanChange>;
  @useResult
  $Res call({
    String id,
    PlanChangeSource source,
    PlanChangeType type,
    String description,
    String descriptionAr,
    String trigger,
    String? triggerAr,
    int? affectedDayIndex,
    Map<String, dynamic> proposedChanges,
    ChangeApprovalStatus status,
    DateTime createdAt,
    DateTime? resolvedAt,
    int priority,
    int impactScore,
  });
}

/// @nodoc
class _$PendingPlanChangeCopyWithImpl<$Res, $Val extends PendingPlanChange>
    implements $PendingPlanChangeCopyWith<$Res> {
  _$PendingPlanChangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingPlanChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? source = null,
    Object? type = null,
    Object? description = null,
    Object? descriptionAr = null,
    Object? trigger = null,
    Object? triggerAr = freezed,
    Object? affectedDayIndex = freezed,
    Object? proposedChanges = null,
    Object? status = null,
    Object? createdAt = null,
    Object? resolvedAt = freezed,
    Object? priority = null,
    Object? impactScore = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as PlanChangeSource,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as PlanChangeType,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionAr: null == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String,
            trigger: null == trigger
                ? _value.trigger
                : trigger // ignore: cast_nullable_to_non_nullable
                      as String,
            triggerAr: freezed == triggerAr
                ? _value.triggerAr
                : triggerAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            affectedDayIndex: freezed == affectedDayIndex
                ? _value.affectedDayIndex
                : affectedDayIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
            proposedChanges: null == proposedChanges
                ? _value.proposedChanges
                : proposedChanges // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ChangeApprovalStatus,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            resolvedAt: freezed == resolvedAt
                ? _value.resolvedAt
                : resolvedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as int,
            impactScore: null == impactScore
                ? _value.impactScore
                : impactScore // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PendingPlanChangeImplCopyWith<$Res>
    implements $PendingPlanChangeCopyWith<$Res> {
  factory _$$PendingPlanChangeImplCopyWith(
    _$PendingPlanChangeImpl value,
    $Res Function(_$PendingPlanChangeImpl) then,
  ) = __$$PendingPlanChangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    PlanChangeSource source,
    PlanChangeType type,
    String description,
    String descriptionAr,
    String trigger,
    String? triggerAr,
    int? affectedDayIndex,
    Map<String, dynamic> proposedChanges,
    ChangeApprovalStatus status,
    DateTime createdAt,
    DateTime? resolvedAt,
    int priority,
    int impactScore,
  });
}

/// @nodoc
class __$$PendingPlanChangeImplCopyWithImpl<$Res>
    extends _$PendingPlanChangeCopyWithImpl<$Res, _$PendingPlanChangeImpl>
    implements _$$PendingPlanChangeImplCopyWith<$Res> {
  __$$PendingPlanChangeImplCopyWithImpl(
    _$PendingPlanChangeImpl _value,
    $Res Function(_$PendingPlanChangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingPlanChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? source = null,
    Object? type = null,
    Object? description = null,
    Object? descriptionAr = null,
    Object? trigger = null,
    Object? triggerAr = freezed,
    Object? affectedDayIndex = freezed,
    Object? proposedChanges = null,
    Object? status = null,
    Object? createdAt = null,
    Object? resolvedAt = freezed,
    Object? priority = null,
    Object? impactScore = null,
  }) {
    return _then(
      _$PendingPlanChangeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as PlanChangeSource,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as PlanChangeType,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: null == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String,
        trigger: null == trigger
            ? _value.trigger
            : trigger // ignore: cast_nullable_to_non_nullable
                  as String,
        triggerAr: freezed == triggerAr
            ? _value.triggerAr
            : triggerAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        affectedDayIndex: freezed == affectedDayIndex
            ? _value.affectedDayIndex
            : affectedDayIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        proposedChanges: null == proposedChanges
            ? _value._proposedChanges
            : proposedChanges // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ChangeApprovalStatus,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        resolvedAt: freezed == resolvedAt
            ? _value.resolvedAt
            : resolvedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as int,
        impactScore: null == impactScore
            ? _value.impactScore
            : impactScore // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingPlanChangeImpl extends _PendingPlanChange {
  const _$PendingPlanChangeImpl({
    required this.id,
    required this.source,
    required this.type,
    required this.description,
    required this.descriptionAr,
    required this.trigger,
    this.triggerAr,
    this.affectedDayIndex,
    final Map<String, dynamic> proposedChanges = const {},
    this.status = ChangeApprovalStatus.pending,
    required this.createdAt,
    this.resolvedAt,
    this.priority = 1,
    this.impactScore = 50,
  }) : _proposedChanges = proposedChanges,
       super._();

  factory _$PendingPlanChangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingPlanChangeImplFromJson(json);

  @override
  final String id;

  /// Source that triggered this change
  @override
  final PlanChangeSource source;

  /// Type of change
  @override
  final PlanChangeType type;

  /// Description of the change (English)
  @override
  final String description;

  /// Description of the change (Arabic)
  @override
  final String descriptionAr;

  /// What triggered this change
  @override
  final String trigger;

  /// Arabic trigger description
  @override
  final String? triggerAr;

  /// Day index affected (0 = Monday, null = whole week)
  @override
  final int? affectedDayIndex;

  /// Proposed changes as key-value pairs
  final Map<String, dynamic> _proposedChanges;

  /// Proposed changes as key-value pairs
  @override
  @JsonKey()
  Map<String, dynamic> get proposedChanges {
    if (_proposedChanges is EqualUnmodifiableMapView) return _proposedChanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_proposedChanges);
  }

  /// Current approval status
  @override
  @JsonKey()
  final ChangeApprovalStatus status;

  /// When this change was created
  @override
  final DateTime createdAt;

  /// When this change was approved/rejected
  @override
  final DateTime? resolvedAt;

  /// Priority of the change (higher = more urgent)
  @override
  @JsonKey()
  final int priority;

  /// Impact score (0-100, how much this affects the overall plan)
  @override
  @JsonKey()
  final int impactScore;

  @override
  String toString() {
    return 'PendingPlanChange(id: $id, source: $source, type: $type, description: $description, descriptionAr: $descriptionAr, trigger: $trigger, triggerAr: $triggerAr, affectedDayIndex: $affectedDayIndex, proposedChanges: $proposedChanges, status: $status, createdAt: $createdAt, resolvedAt: $resolvedAt, priority: $priority, impactScore: $impactScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingPlanChangeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.triggerAr, triggerAr) ||
                other.triggerAr == triggerAr) &&
            (identical(other.affectedDayIndex, affectedDayIndex) ||
                other.affectedDayIndex == affectedDayIndex) &&
            const DeepCollectionEquality().equals(
              other._proposedChanges,
              _proposedChanges,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.impactScore, impactScore) ||
                other.impactScore == impactScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    source,
    type,
    description,
    descriptionAr,
    trigger,
    triggerAr,
    affectedDayIndex,
    const DeepCollectionEquality().hash(_proposedChanges),
    status,
    createdAt,
    resolvedAt,
    priority,
    impactScore,
  );

  /// Create a copy of PendingPlanChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingPlanChangeImplCopyWith<_$PendingPlanChangeImpl> get copyWith =>
      __$$PendingPlanChangeImplCopyWithImpl<_$PendingPlanChangeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingPlanChangeImplToJson(this);
  }
}

abstract class _PendingPlanChange extends PendingPlanChange {
  const factory _PendingPlanChange({
    required final String id,
    required final PlanChangeSource source,
    required final PlanChangeType type,
    required final String description,
    required final String descriptionAr,
    required final String trigger,
    final String? triggerAr,
    final int? affectedDayIndex,
    final Map<String, dynamic> proposedChanges,
    final ChangeApprovalStatus status,
    required final DateTime createdAt,
    final DateTime? resolvedAt,
    final int priority,
    final int impactScore,
  }) = _$PendingPlanChangeImpl;
  const _PendingPlanChange._() : super._();

  factory _PendingPlanChange.fromJson(Map<String, dynamic> json) =
      _$PendingPlanChangeImpl.fromJson;

  @override
  String get id;

  /// Source that triggered this change
  @override
  PlanChangeSource get source;

  /// Type of change
  @override
  PlanChangeType get type;

  /// Description of the change (English)
  @override
  String get description;

  /// Description of the change (Arabic)
  @override
  String get descriptionAr;

  /// What triggered this change
  @override
  String get trigger;

  /// Arabic trigger description
  @override
  String? get triggerAr;

  /// Day index affected (0 = Monday, null = whole week)
  @override
  int? get affectedDayIndex;

  /// Proposed changes as key-value pairs
  @override
  Map<String, dynamic> get proposedChanges;

  /// Current approval status
  @override
  ChangeApprovalStatus get status;

  /// When this change was created
  @override
  DateTime get createdAt;

  /// When this change was approved/rejected
  @override
  DateTime? get resolvedAt;

  /// Priority of the change (higher = more urgent)
  @override
  int get priority;

  /// Impact score (0-100, how much this affects the overall plan)
  @override
  int get impactScore;

  /// Create a copy of PendingPlanChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingPlanChangeImplCopyWith<_$PendingPlanChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlanCoordinationContext _$PlanCoordinationContextFromJson(
  Map<String, dynamic> json,
) {
  return _PlanCoordinationContext.fromJson(json);
}

/// @nodoc
mixin _$PlanCoordinationContext {
  /// Current week's meal plan summary
  MealPlanSummary? get mealPlan => throw _privateConstructorUsedError;

  /// Current week's workout plan summary
  WorkoutPlanSummary? get workoutPlan => throw _privateConstructorUsedError;

  /// User's recovery score
  int? get recoveryScore => throw _privateConstructorUsedError;

  /// User's strain score
  double? get strainScore => throw _privateConstructorUsedError;

  /// User's calorie target
  int get dailyCalorieTarget => throw _privateConstructorUsedError;

  /// User's protein target
  int get dailyProteinTarget => throw _privateConstructorUsedError;

  /// Preferred language for AI responses
  String get language => throw _privateConstructorUsedError;

  /// Serializes this PlanCoordinationContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanCoordinationContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanCoordinationContextCopyWith<PlanCoordinationContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanCoordinationContextCopyWith<$Res> {
  factory $PlanCoordinationContextCopyWith(
    PlanCoordinationContext value,
    $Res Function(PlanCoordinationContext) then,
  ) = _$PlanCoordinationContextCopyWithImpl<$Res, PlanCoordinationContext>;
  @useResult
  $Res call({
    MealPlanSummary? mealPlan,
    WorkoutPlanSummary? workoutPlan,
    int? recoveryScore,
    double? strainScore,
    int dailyCalorieTarget,
    int dailyProteinTarget,
    String language,
  });

  $MealPlanSummaryCopyWith<$Res>? get mealPlan;
  $WorkoutPlanSummaryCopyWith<$Res>? get workoutPlan;
}

/// @nodoc
class _$PlanCoordinationContextCopyWithImpl<
  $Res,
  $Val extends PlanCoordinationContext
>
    implements $PlanCoordinationContextCopyWith<$Res> {
  _$PlanCoordinationContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanCoordinationContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealPlan = freezed,
    Object? workoutPlan = freezed,
    Object? recoveryScore = freezed,
    Object? strainScore = freezed,
    Object? dailyCalorieTarget = null,
    Object? dailyProteinTarget = null,
    Object? language = null,
  }) {
    return _then(
      _value.copyWith(
            mealPlan: freezed == mealPlan
                ? _value.mealPlan
                : mealPlan // ignore: cast_nullable_to_non_nullable
                      as MealPlanSummary?,
            workoutPlan: freezed == workoutPlan
                ? _value.workoutPlan
                : workoutPlan // ignore: cast_nullable_to_non_nullable
                      as WorkoutPlanSummary?,
            recoveryScore: freezed == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            strainScore: freezed == strainScore
                ? _value.strainScore
                : strainScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            dailyCalorieTarget: null == dailyCalorieTarget
                ? _value.dailyCalorieTarget
                : dailyCalorieTarget // ignore: cast_nullable_to_non_nullable
                      as int,
            dailyProteinTarget: null == dailyProteinTarget
                ? _value.dailyProteinTarget
                : dailyProteinTarget // ignore: cast_nullable_to_non_nullable
                      as int,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of PlanCoordinationContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealPlanSummaryCopyWith<$Res>? get mealPlan {
    if (_value.mealPlan == null) {
      return null;
    }

    return $MealPlanSummaryCopyWith<$Res>(_value.mealPlan!, (value) {
      return _then(_value.copyWith(mealPlan: value) as $Val);
    });
  }

  /// Create a copy of PlanCoordinationContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutPlanSummaryCopyWith<$Res>? get workoutPlan {
    if (_value.workoutPlan == null) {
      return null;
    }

    return $WorkoutPlanSummaryCopyWith<$Res>(_value.workoutPlan!, (value) {
      return _then(_value.copyWith(workoutPlan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlanCoordinationContextImplCopyWith<$Res>
    implements $PlanCoordinationContextCopyWith<$Res> {
  factory _$$PlanCoordinationContextImplCopyWith(
    _$PlanCoordinationContextImpl value,
    $Res Function(_$PlanCoordinationContextImpl) then,
  ) = __$$PlanCoordinationContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    MealPlanSummary? mealPlan,
    WorkoutPlanSummary? workoutPlan,
    int? recoveryScore,
    double? strainScore,
    int dailyCalorieTarget,
    int dailyProteinTarget,
    String language,
  });

  @override
  $MealPlanSummaryCopyWith<$Res>? get mealPlan;
  @override
  $WorkoutPlanSummaryCopyWith<$Res>? get workoutPlan;
}

/// @nodoc
class __$$PlanCoordinationContextImplCopyWithImpl<$Res>
    extends
        _$PlanCoordinationContextCopyWithImpl<
          $Res,
          _$PlanCoordinationContextImpl
        >
    implements _$$PlanCoordinationContextImplCopyWith<$Res> {
  __$$PlanCoordinationContextImplCopyWithImpl(
    _$PlanCoordinationContextImpl _value,
    $Res Function(_$PlanCoordinationContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanCoordinationContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealPlan = freezed,
    Object? workoutPlan = freezed,
    Object? recoveryScore = freezed,
    Object? strainScore = freezed,
    Object? dailyCalorieTarget = null,
    Object? dailyProteinTarget = null,
    Object? language = null,
  }) {
    return _then(
      _$PlanCoordinationContextImpl(
        mealPlan: freezed == mealPlan
            ? _value.mealPlan
            : mealPlan // ignore: cast_nullable_to_non_nullable
                  as MealPlanSummary?,
        workoutPlan: freezed == workoutPlan
            ? _value.workoutPlan
            : workoutPlan // ignore: cast_nullable_to_non_nullable
                  as WorkoutPlanSummary?,
        recoveryScore: freezed == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        strainScore: freezed == strainScore
            ? _value.strainScore
            : strainScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        dailyCalorieTarget: null == dailyCalorieTarget
            ? _value.dailyCalorieTarget
            : dailyCalorieTarget // ignore: cast_nullable_to_non_nullable
                  as int,
        dailyProteinTarget: null == dailyProteinTarget
            ? _value.dailyProteinTarget
            : dailyProteinTarget // ignore: cast_nullable_to_non_nullable
                  as int,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanCoordinationContextImpl implements _PlanCoordinationContext {
  const _$PlanCoordinationContextImpl({
    required this.mealPlan,
    required this.workoutPlan,
    this.recoveryScore,
    this.strainScore,
    required this.dailyCalorieTarget,
    required this.dailyProteinTarget,
    this.language = 'ar',
  });

  factory _$PlanCoordinationContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanCoordinationContextImplFromJson(json);

  /// Current week's meal plan summary
  @override
  final MealPlanSummary? mealPlan;

  /// Current week's workout plan summary
  @override
  final WorkoutPlanSummary? workoutPlan;

  /// User's recovery score
  @override
  final int? recoveryScore;

  /// User's strain score
  @override
  final double? strainScore;

  /// User's calorie target
  @override
  final int dailyCalorieTarget;

  /// User's protein target
  @override
  final int dailyProteinTarget;

  /// Preferred language for AI responses
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'PlanCoordinationContext(mealPlan: $mealPlan, workoutPlan: $workoutPlan, recoveryScore: $recoveryScore, strainScore: $strainScore, dailyCalorieTarget: $dailyCalorieTarget, dailyProteinTarget: $dailyProteinTarget, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanCoordinationContextImpl &&
            (identical(other.mealPlan, mealPlan) ||
                other.mealPlan == mealPlan) &&
            (identical(other.workoutPlan, workoutPlan) ||
                other.workoutPlan == workoutPlan) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.strainScore, strainScore) ||
                other.strainScore == strainScore) &&
            (identical(other.dailyCalorieTarget, dailyCalorieTarget) ||
                other.dailyCalorieTarget == dailyCalorieTarget) &&
            (identical(other.dailyProteinTarget, dailyProteinTarget) ||
                other.dailyProteinTarget == dailyProteinTarget) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mealPlan,
    workoutPlan,
    recoveryScore,
    strainScore,
    dailyCalorieTarget,
    dailyProteinTarget,
    language,
  );

  /// Create a copy of PlanCoordinationContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanCoordinationContextImplCopyWith<_$PlanCoordinationContextImpl>
  get copyWith =>
      __$$PlanCoordinationContextImplCopyWithImpl<
        _$PlanCoordinationContextImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanCoordinationContextImplToJson(this);
  }
}

abstract class _PlanCoordinationContext implements PlanCoordinationContext {
  const factory _PlanCoordinationContext({
    required final MealPlanSummary? mealPlan,
    required final WorkoutPlanSummary? workoutPlan,
    final int? recoveryScore,
    final double? strainScore,
    required final int dailyCalorieTarget,
    required final int dailyProteinTarget,
    final String language,
  }) = _$PlanCoordinationContextImpl;

  factory _PlanCoordinationContext.fromJson(Map<String, dynamic> json) =
      _$PlanCoordinationContextImpl.fromJson;

  /// Current week's meal plan summary
  @override
  MealPlanSummary? get mealPlan;

  /// Current week's workout plan summary
  @override
  WorkoutPlanSummary? get workoutPlan;

  /// User's recovery score
  @override
  int? get recoveryScore;

  /// User's strain score
  @override
  double? get strainScore;

  /// User's calorie target
  @override
  int get dailyCalorieTarget;

  /// User's protein target
  @override
  int get dailyProteinTarget;

  /// Preferred language for AI responses
  @override
  String get language;

  /// Create a copy of PlanCoordinationContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanCoordinationContextImplCopyWith<_$PlanCoordinationContextImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MealPlanSummary _$MealPlanSummaryFromJson(Map<String, dynamic> json) {
  return _MealPlanSummary.fromJson(json);
}

/// @nodoc
mixin _$MealPlanSummary {
  String get planId => throw _privateConstructorUsedError;

  /// Daily calories for each day (index 0 = Monday)
  List<int> get dailyCalories => throw _privateConstructorUsedError;

  /// Daily protein for each day
  List<int> get dailyProtein => throw _privateConstructorUsedError;

  /// Total weekly calories
  int get totalCalories => throw _privateConstructorUsedError;

  /// Total weekly protein
  int get totalProtein => throw _privateConstructorUsedError;

  /// Average daily calories
  int get averageDailyCalories => throw _privateConstructorUsedError;

  /// Average daily protein
  int get averageDailyProtein => throw _privateConstructorUsedError;

  /// Serializes this MealPlanSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealPlanSummaryCopyWith<MealPlanSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPlanSummaryCopyWith<$Res> {
  factory $MealPlanSummaryCopyWith(
    MealPlanSummary value,
    $Res Function(MealPlanSummary) then,
  ) = _$MealPlanSummaryCopyWithImpl<$Res, MealPlanSummary>;
  @useResult
  $Res call({
    String planId,
    List<int> dailyCalories,
    List<int> dailyProtein,
    int totalCalories,
    int totalProtein,
    int averageDailyCalories,
    int averageDailyProtein,
  });
}

/// @nodoc
class _$MealPlanSummaryCopyWithImpl<$Res, $Val extends MealPlanSummary>
    implements $MealPlanSummaryCopyWith<$Res> {
  _$MealPlanSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? dailyCalories = null,
    Object? dailyProtein = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? averageDailyCalories = null,
    Object? averageDailyProtein = null,
  }) {
    return _then(
      _value.copyWith(
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as String,
            dailyCalories: null == dailyCalories
                ? _value.dailyCalories
                : dailyCalories // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            dailyProtein: null == dailyProtein
                ? _value.dailyProtein
                : dailyProtein // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            totalCalories: null == totalCalories
                ? _value.totalCalories
                : totalCalories // ignore: cast_nullable_to_non_nullable
                      as int,
            totalProtein: null == totalProtein
                ? _value.totalProtein
                : totalProtein // ignore: cast_nullable_to_non_nullable
                      as int,
            averageDailyCalories: null == averageDailyCalories
                ? _value.averageDailyCalories
                : averageDailyCalories // ignore: cast_nullable_to_non_nullable
                      as int,
            averageDailyProtein: null == averageDailyProtein
                ? _value.averageDailyProtein
                : averageDailyProtein // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MealPlanSummaryImplCopyWith<$Res>
    implements $MealPlanSummaryCopyWith<$Res> {
  factory _$$MealPlanSummaryImplCopyWith(
    _$MealPlanSummaryImpl value,
    $Res Function(_$MealPlanSummaryImpl) then,
  ) = __$$MealPlanSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String planId,
    List<int> dailyCalories,
    List<int> dailyProtein,
    int totalCalories,
    int totalProtein,
    int averageDailyCalories,
    int averageDailyProtein,
  });
}

/// @nodoc
class __$$MealPlanSummaryImplCopyWithImpl<$Res>
    extends _$MealPlanSummaryCopyWithImpl<$Res, _$MealPlanSummaryImpl>
    implements _$$MealPlanSummaryImplCopyWith<$Res> {
  __$$MealPlanSummaryImplCopyWithImpl(
    _$MealPlanSummaryImpl _value,
    $Res Function(_$MealPlanSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? dailyCalories = null,
    Object? dailyProtein = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? averageDailyCalories = null,
    Object? averageDailyProtein = null,
  }) {
    return _then(
      _$MealPlanSummaryImpl(
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyCalories: null == dailyCalories
            ? _value._dailyCalories
            : dailyCalories // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        dailyProtein: null == dailyProtein
            ? _value._dailyProtein
            : dailyProtein // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        totalCalories: null == totalCalories
            ? _value.totalCalories
            : totalCalories // ignore: cast_nullable_to_non_nullable
                  as int,
        totalProtein: null == totalProtein
            ? _value.totalProtein
            : totalProtein // ignore: cast_nullable_to_non_nullable
                  as int,
        averageDailyCalories: null == averageDailyCalories
            ? _value.averageDailyCalories
            : averageDailyCalories // ignore: cast_nullable_to_non_nullable
                  as int,
        averageDailyProtein: null == averageDailyProtein
            ? _value.averageDailyProtein
            : averageDailyProtein // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MealPlanSummaryImpl implements _MealPlanSummary {
  const _$MealPlanSummaryImpl({
    required this.planId,
    final List<int> dailyCalories = const [],
    final List<int> dailyProtein = const [],
    required this.totalCalories,
    required this.totalProtein,
    required this.averageDailyCalories,
    required this.averageDailyProtein,
  }) : _dailyCalories = dailyCalories,
       _dailyProtein = dailyProtein;

  factory _$MealPlanSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealPlanSummaryImplFromJson(json);

  @override
  final String planId;

  /// Daily calories for each day (index 0 = Monday)
  final List<int> _dailyCalories;

  /// Daily calories for each day (index 0 = Monday)
  @override
  @JsonKey()
  List<int> get dailyCalories {
    if (_dailyCalories is EqualUnmodifiableListView) return _dailyCalories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyCalories);
  }

  /// Daily protein for each day
  final List<int> _dailyProtein;

  /// Daily protein for each day
  @override
  @JsonKey()
  List<int> get dailyProtein {
    if (_dailyProtein is EqualUnmodifiableListView) return _dailyProtein;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyProtein);
  }

  /// Total weekly calories
  @override
  final int totalCalories;

  /// Total weekly protein
  @override
  final int totalProtein;

  /// Average daily calories
  @override
  final int averageDailyCalories;

  /// Average daily protein
  @override
  final int averageDailyProtein;

  @override
  String toString() {
    return 'MealPlanSummary(planId: $planId, dailyCalories: $dailyCalories, dailyProtein: $dailyProtein, totalCalories: $totalCalories, totalProtein: $totalProtein, averageDailyCalories: $averageDailyCalories, averageDailyProtein: $averageDailyProtein)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlanSummaryImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            const DeepCollectionEquality().equals(
              other._dailyCalories,
              _dailyCalories,
            ) &&
            const DeepCollectionEquality().equals(
              other._dailyProtein,
              _dailyProtein,
            ) &&
            (identical(other.totalCalories, totalCalories) ||
                other.totalCalories == totalCalories) &&
            (identical(other.totalProtein, totalProtein) ||
                other.totalProtein == totalProtein) &&
            (identical(other.averageDailyCalories, averageDailyCalories) ||
                other.averageDailyCalories == averageDailyCalories) &&
            (identical(other.averageDailyProtein, averageDailyProtein) ||
                other.averageDailyProtein == averageDailyProtein));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    planId,
    const DeepCollectionEquality().hash(_dailyCalories),
    const DeepCollectionEquality().hash(_dailyProtein),
    totalCalories,
    totalProtein,
    averageDailyCalories,
    averageDailyProtein,
  );

  /// Create a copy of MealPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealPlanSummaryImplCopyWith<_$MealPlanSummaryImpl> get copyWith =>
      __$$MealPlanSummaryImplCopyWithImpl<_$MealPlanSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MealPlanSummaryImplToJson(this);
  }
}

abstract class _MealPlanSummary implements MealPlanSummary {
  const factory _MealPlanSummary({
    required final String planId,
    final List<int> dailyCalories,
    final List<int> dailyProtein,
    required final int totalCalories,
    required final int totalProtein,
    required final int averageDailyCalories,
    required final int averageDailyProtein,
  }) = _$MealPlanSummaryImpl;

  factory _MealPlanSummary.fromJson(Map<String, dynamic> json) =
      _$MealPlanSummaryImpl.fromJson;

  @override
  String get planId;

  /// Daily calories for each day (index 0 = Monday)
  @override
  List<int> get dailyCalories;

  /// Daily protein for each day
  @override
  List<int> get dailyProtein;

  /// Total weekly calories
  @override
  int get totalCalories;

  /// Total weekly protein
  @override
  int get totalProtein;

  /// Average daily calories
  @override
  int get averageDailyCalories;

  /// Average daily protein
  @override
  int get averageDailyProtein;

  /// Create a copy of MealPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealPlanSummaryImplCopyWith<_$MealPlanSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutPlanSummary _$WorkoutPlanSummaryFromJson(Map<String, dynamic> json) {
  return _WorkoutPlanSummary.fromJson(json);
}

/// @nodoc
mixin _$WorkoutPlanSummary {
  String get planId => throw _privateConstructorUsedError;

  /// Workout days (0 = Monday)
  List<int> get workoutDays => throw _privateConstructorUsedError;

  /// Strength training days
  List<int> get strengthDays => throw _privateConstructorUsedError;

  /// Cardio days
  List<int> get cardioDays => throw _privateConstructorUsedError;

  /// Rest days
  List<int> get restDays => throw _privateConstructorUsedError;

  /// Estimated calorie burn per day
  Map<int, int> get dailyCalorieBurn => throw _privateConstructorUsedError;

  /// Total estimated weekly calorie burn
  int get totalCalorieBurn => throw _privateConstructorUsedError;

  /// Total workout minutes for the week
  int get totalWorkoutMinutes => throw _privateConstructorUsedError;

  /// Number of workout days
  int get workoutDaysCount => throw _privateConstructorUsedError;

  /// Serializes this WorkoutPlanSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutPlanSummaryCopyWith<WorkoutPlanSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutPlanSummaryCopyWith<$Res> {
  factory $WorkoutPlanSummaryCopyWith(
    WorkoutPlanSummary value,
    $Res Function(WorkoutPlanSummary) then,
  ) = _$WorkoutPlanSummaryCopyWithImpl<$Res, WorkoutPlanSummary>;
  @useResult
  $Res call({
    String planId,
    List<int> workoutDays,
    List<int> strengthDays,
    List<int> cardioDays,
    List<int> restDays,
    Map<int, int> dailyCalorieBurn,
    int totalCalorieBurn,
    int totalWorkoutMinutes,
    int workoutDaysCount,
  });
}

/// @nodoc
class _$WorkoutPlanSummaryCopyWithImpl<$Res, $Val extends WorkoutPlanSummary>
    implements $WorkoutPlanSummaryCopyWith<$Res> {
  _$WorkoutPlanSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? workoutDays = null,
    Object? strengthDays = null,
    Object? cardioDays = null,
    Object? restDays = null,
    Object? dailyCalorieBurn = null,
    Object? totalCalorieBurn = null,
    Object? totalWorkoutMinutes = null,
    Object? workoutDaysCount = null,
  }) {
    return _then(
      _value.copyWith(
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as String,
            workoutDays: null == workoutDays
                ? _value.workoutDays
                : workoutDays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            strengthDays: null == strengthDays
                ? _value.strengthDays
                : strengthDays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            cardioDays: null == cardioDays
                ? _value.cardioDays
                : cardioDays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            restDays: null == restDays
                ? _value.restDays
                : restDays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            dailyCalorieBurn: null == dailyCalorieBurn
                ? _value.dailyCalorieBurn
                : dailyCalorieBurn // ignore: cast_nullable_to_non_nullable
                      as Map<int, int>,
            totalCalorieBurn: null == totalCalorieBurn
                ? _value.totalCalorieBurn
                : totalCalorieBurn // ignore: cast_nullable_to_non_nullable
                      as int,
            totalWorkoutMinutes: null == totalWorkoutMinutes
                ? _value.totalWorkoutMinutes
                : totalWorkoutMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            workoutDaysCount: null == workoutDaysCount
                ? _value.workoutDaysCount
                : workoutDaysCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutPlanSummaryImplCopyWith<$Res>
    implements $WorkoutPlanSummaryCopyWith<$Res> {
  factory _$$WorkoutPlanSummaryImplCopyWith(
    _$WorkoutPlanSummaryImpl value,
    $Res Function(_$WorkoutPlanSummaryImpl) then,
  ) = __$$WorkoutPlanSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String planId,
    List<int> workoutDays,
    List<int> strengthDays,
    List<int> cardioDays,
    List<int> restDays,
    Map<int, int> dailyCalorieBurn,
    int totalCalorieBurn,
    int totalWorkoutMinutes,
    int workoutDaysCount,
  });
}

/// @nodoc
class __$$WorkoutPlanSummaryImplCopyWithImpl<$Res>
    extends _$WorkoutPlanSummaryCopyWithImpl<$Res, _$WorkoutPlanSummaryImpl>
    implements _$$WorkoutPlanSummaryImplCopyWith<$Res> {
  __$$WorkoutPlanSummaryImplCopyWithImpl(
    _$WorkoutPlanSummaryImpl _value,
    $Res Function(_$WorkoutPlanSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? workoutDays = null,
    Object? strengthDays = null,
    Object? cardioDays = null,
    Object? restDays = null,
    Object? dailyCalorieBurn = null,
    Object? totalCalorieBurn = null,
    Object? totalWorkoutMinutes = null,
    Object? workoutDaysCount = null,
  }) {
    return _then(
      _$WorkoutPlanSummaryImpl(
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as String,
        workoutDays: null == workoutDays
            ? _value._workoutDays
            : workoutDays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        strengthDays: null == strengthDays
            ? _value._strengthDays
            : strengthDays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        cardioDays: null == cardioDays
            ? _value._cardioDays
            : cardioDays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        restDays: null == restDays
            ? _value._restDays
            : restDays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        dailyCalorieBurn: null == dailyCalorieBurn
            ? _value._dailyCalorieBurn
            : dailyCalorieBurn // ignore: cast_nullable_to_non_nullable
                  as Map<int, int>,
        totalCalorieBurn: null == totalCalorieBurn
            ? _value.totalCalorieBurn
            : totalCalorieBurn // ignore: cast_nullable_to_non_nullable
                  as int,
        totalWorkoutMinutes: null == totalWorkoutMinutes
            ? _value.totalWorkoutMinutes
            : totalWorkoutMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        workoutDaysCount: null == workoutDaysCount
            ? _value.workoutDaysCount
            : workoutDaysCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutPlanSummaryImpl implements _WorkoutPlanSummary {
  const _$WorkoutPlanSummaryImpl({
    required this.planId,
    final List<int> workoutDays = const [],
    final List<int> strengthDays = const [],
    final List<int> cardioDays = const [],
    final List<int> restDays = const [],
    final Map<int, int> dailyCalorieBurn = const {},
    required this.totalCalorieBurn,
    required this.totalWorkoutMinutes,
    required this.workoutDaysCount,
  }) : _workoutDays = workoutDays,
       _strengthDays = strengthDays,
       _cardioDays = cardioDays,
       _restDays = restDays,
       _dailyCalorieBurn = dailyCalorieBurn;

  factory _$WorkoutPlanSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutPlanSummaryImplFromJson(json);

  @override
  final String planId;

  /// Workout days (0 = Monday)
  final List<int> _workoutDays;

  /// Workout days (0 = Monday)
  @override
  @JsonKey()
  List<int> get workoutDays {
    if (_workoutDays is EqualUnmodifiableListView) return _workoutDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workoutDays);
  }

  /// Strength training days
  final List<int> _strengthDays;

  /// Strength training days
  @override
  @JsonKey()
  List<int> get strengthDays {
    if (_strengthDays is EqualUnmodifiableListView) return _strengthDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengthDays);
  }

  /// Cardio days
  final List<int> _cardioDays;

  /// Cardio days
  @override
  @JsonKey()
  List<int> get cardioDays {
    if (_cardioDays is EqualUnmodifiableListView) return _cardioDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardioDays);
  }

  /// Rest days
  final List<int> _restDays;

  /// Rest days
  @override
  @JsonKey()
  List<int> get restDays {
    if (_restDays is EqualUnmodifiableListView) return _restDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restDays);
  }

  /// Estimated calorie burn per day
  final Map<int, int> _dailyCalorieBurn;

  /// Estimated calorie burn per day
  @override
  @JsonKey()
  Map<int, int> get dailyCalorieBurn {
    if (_dailyCalorieBurn is EqualUnmodifiableMapView) return _dailyCalorieBurn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dailyCalorieBurn);
  }

  /// Total estimated weekly calorie burn
  @override
  final int totalCalorieBurn;

  /// Total workout minutes for the week
  @override
  final int totalWorkoutMinutes;

  /// Number of workout days
  @override
  final int workoutDaysCount;

  @override
  String toString() {
    return 'WorkoutPlanSummary(planId: $planId, workoutDays: $workoutDays, strengthDays: $strengthDays, cardioDays: $cardioDays, restDays: $restDays, dailyCalorieBurn: $dailyCalorieBurn, totalCalorieBurn: $totalCalorieBurn, totalWorkoutMinutes: $totalWorkoutMinutes, workoutDaysCount: $workoutDaysCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutPlanSummaryImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            const DeepCollectionEquality().equals(
              other._workoutDays,
              _workoutDays,
            ) &&
            const DeepCollectionEquality().equals(
              other._strengthDays,
              _strengthDays,
            ) &&
            const DeepCollectionEquality().equals(
              other._cardioDays,
              _cardioDays,
            ) &&
            const DeepCollectionEquality().equals(other._restDays, _restDays) &&
            const DeepCollectionEquality().equals(
              other._dailyCalorieBurn,
              _dailyCalorieBurn,
            ) &&
            (identical(other.totalCalorieBurn, totalCalorieBurn) ||
                other.totalCalorieBurn == totalCalorieBurn) &&
            (identical(other.totalWorkoutMinutes, totalWorkoutMinutes) ||
                other.totalWorkoutMinutes == totalWorkoutMinutes) &&
            (identical(other.workoutDaysCount, workoutDaysCount) ||
                other.workoutDaysCount == workoutDaysCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    planId,
    const DeepCollectionEquality().hash(_workoutDays),
    const DeepCollectionEquality().hash(_strengthDays),
    const DeepCollectionEquality().hash(_cardioDays),
    const DeepCollectionEquality().hash(_restDays),
    const DeepCollectionEquality().hash(_dailyCalorieBurn),
    totalCalorieBurn,
    totalWorkoutMinutes,
    workoutDaysCount,
  );

  /// Create a copy of WorkoutPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutPlanSummaryImplCopyWith<_$WorkoutPlanSummaryImpl> get copyWith =>
      __$$WorkoutPlanSummaryImplCopyWithImpl<_$WorkoutPlanSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutPlanSummaryImplToJson(this);
  }
}

abstract class _WorkoutPlanSummary implements WorkoutPlanSummary {
  const factory _WorkoutPlanSummary({
    required final String planId,
    final List<int> workoutDays,
    final List<int> strengthDays,
    final List<int> cardioDays,
    final List<int> restDays,
    final Map<int, int> dailyCalorieBurn,
    required final int totalCalorieBurn,
    required final int totalWorkoutMinutes,
    required final int workoutDaysCount,
  }) = _$WorkoutPlanSummaryImpl;

  factory _WorkoutPlanSummary.fromJson(Map<String, dynamic> json) =
      _$WorkoutPlanSummaryImpl.fromJson;

  @override
  String get planId;

  /// Workout days (0 = Monday)
  @override
  List<int> get workoutDays;

  /// Strength training days
  @override
  List<int> get strengthDays;

  /// Cardio days
  @override
  List<int> get cardioDays;

  /// Rest days
  @override
  List<int> get restDays;

  /// Estimated calorie burn per day
  @override
  Map<int, int> get dailyCalorieBurn;

  /// Total estimated weekly calorie burn
  @override
  int get totalCalorieBurn;

  /// Total workout minutes for the week
  @override
  int get totalWorkoutMinutes;

  /// Number of workout days
  @override
  int get workoutDaysCount;

  /// Create a copy of WorkoutPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutPlanSummaryImplCopyWith<_$WorkoutPlanSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
