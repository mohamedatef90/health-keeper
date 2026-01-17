// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'protocol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Protocol _$ProtocolFromJson(Map<String, dynamic> json) {
  return _Protocol.fromJson(json);
}

/// @nodoc
mixin _$Protocol {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  TimeOfDay get eatingWindowStart => throw _privateConstructorUsedError;
  TimeOfDay get eatingWindowEnd => throw _privateConstructorUsedError;
  List<MedicationSchedule> get medicationSchedule =>
      throw _privateConstructorUsedError;
  List<WeeklyActivity> get weeklyActivityPlan =>
      throw _privateConstructorUsedError;
  List<ProtocolConstraint> get constraints =>
      throw _privateConstructorUsedError;
  List<Medication> get medications => throw _privateConstructorUsedError;
  List<Supplement> get supplements => throw _privateConstructorUsedError;
  List<ScheduledWorkout> get workoutSchedule =>
      throw _privateConstructorUsedError;
  DateTime? get lockedUntil => throw _privateConstructorUsedError;

  /// Serializes this Protocol to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Protocol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProtocolCopyWith<Protocol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolCopyWith<$Res> {
  factory $ProtocolCopyWith(Protocol value, $Res Function(Protocol) then) =
      _$ProtocolCopyWithImpl<$Res, Protocol>;
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime createdAt,
    DateTime updatedAt,
    TimeOfDay eatingWindowStart,
    TimeOfDay eatingWindowEnd,
    List<MedicationSchedule> medicationSchedule,
    List<WeeklyActivity> weeklyActivityPlan,
    List<ProtocolConstraint> constraints,
    List<Medication> medications,
    List<Supplement> supplements,
    List<ScheduledWorkout> workoutSchedule,
    DateTime? lockedUntil,
  });

  $TimeOfDayCopyWith<$Res> get eatingWindowStart;
  $TimeOfDayCopyWith<$Res> get eatingWindowEnd;
}

/// @nodoc
class _$ProtocolCopyWithImpl<$Res, $Val extends Protocol>
    implements $ProtocolCopyWith<$Res> {
  _$ProtocolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Protocol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? eatingWindowStart = null,
    Object? eatingWindowEnd = null,
    Object? medicationSchedule = null,
    Object? weeklyActivityPlan = null,
    Object? constraints = null,
    Object? medications = null,
    Object? supplements = null,
    Object? workoutSchedule = null,
    Object? lockedUntil = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            eatingWindowStart: null == eatingWindowStart
                ? _value.eatingWindowStart
                : eatingWindowStart // ignore: cast_nullable_to_non_nullable
                      as TimeOfDay,
            eatingWindowEnd: null == eatingWindowEnd
                ? _value.eatingWindowEnd
                : eatingWindowEnd // ignore: cast_nullable_to_non_nullable
                      as TimeOfDay,
            medicationSchedule: null == medicationSchedule
                ? _value.medicationSchedule
                : medicationSchedule // ignore: cast_nullable_to_non_nullable
                      as List<MedicationSchedule>,
            weeklyActivityPlan: null == weeklyActivityPlan
                ? _value.weeklyActivityPlan
                : weeklyActivityPlan // ignore: cast_nullable_to_non_nullable
                      as List<WeeklyActivity>,
            constraints: null == constraints
                ? _value.constraints
                : constraints // ignore: cast_nullable_to_non_nullable
                      as List<ProtocolConstraint>,
            medications: null == medications
                ? _value.medications
                : medications // ignore: cast_nullable_to_non_nullable
                      as List<Medication>,
            supplements: null == supplements
                ? _value.supplements
                : supplements // ignore: cast_nullable_to_non_nullable
                      as List<Supplement>,
            workoutSchedule: null == workoutSchedule
                ? _value.workoutSchedule
                : workoutSchedule // ignore: cast_nullable_to_non_nullable
                      as List<ScheduledWorkout>,
            lockedUntil: freezed == lockedUntil
                ? _value.lockedUntil
                : lockedUntil // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of Protocol
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeOfDayCopyWith<$Res> get eatingWindowStart {
    return $TimeOfDayCopyWith<$Res>(_value.eatingWindowStart, (value) {
      return _then(_value.copyWith(eatingWindowStart: value) as $Val);
    });
  }

  /// Create a copy of Protocol
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeOfDayCopyWith<$Res> get eatingWindowEnd {
    return $TimeOfDayCopyWith<$Res>(_value.eatingWindowEnd, (value) {
      return _then(_value.copyWith(eatingWindowEnd: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProtocolImplCopyWith<$Res>
    implements $ProtocolCopyWith<$Res> {
  factory _$$ProtocolImplCopyWith(
    _$ProtocolImpl value,
    $Res Function(_$ProtocolImpl) then,
  ) = __$$ProtocolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime createdAt,
    DateTime updatedAt,
    TimeOfDay eatingWindowStart,
    TimeOfDay eatingWindowEnd,
    List<MedicationSchedule> medicationSchedule,
    List<WeeklyActivity> weeklyActivityPlan,
    List<ProtocolConstraint> constraints,
    List<Medication> medications,
    List<Supplement> supplements,
    List<ScheduledWorkout> workoutSchedule,
    DateTime? lockedUntil,
  });

  @override
  $TimeOfDayCopyWith<$Res> get eatingWindowStart;
  @override
  $TimeOfDayCopyWith<$Res> get eatingWindowEnd;
}

/// @nodoc
class __$$ProtocolImplCopyWithImpl<$Res>
    extends _$ProtocolCopyWithImpl<$Res, _$ProtocolImpl>
    implements _$$ProtocolImplCopyWith<$Res> {
  __$$ProtocolImplCopyWithImpl(
    _$ProtocolImpl _value,
    $Res Function(_$ProtocolImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Protocol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? eatingWindowStart = null,
    Object? eatingWindowEnd = null,
    Object? medicationSchedule = null,
    Object? weeklyActivityPlan = null,
    Object? constraints = null,
    Object? medications = null,
    Object? supplements = null,
    Object? workoutSchedule = null,
    Object? lockedUntil = freezed,
  }) {
    return _then(
      _$ProtocolImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        eatingWindowStart: null == eatingWindowStart
            ? _value.eatingWindowStart
            : eatingWindowStart // ignore: cast_nullable_to_non_nullable
                  as TimeOfDay,
        eatingWindowEnd: null == eatingWindowEnd
            ? _value.eatingWindowEnd
            : eatingWindowEnd // ignore: cast_nullable_to_non_nullable
                  as TimeOfDay,
        medicationSchedule: null == medicationSchedule
            ? _value._medicationSchedule
            : medicationSchedule // ignore: cast_nullable_to_non_nullable
                  as List<MedicationSchedule>,
        weeklyActivityPlan: null == weeklyActivityPlan
            ? _value._weeklyActivityPlan
            : weeklyActivityPlan // ignore: cast_nullable_to_non_nullable
                  as List<WeeklyActivity>,
        constraints: null == constraints
            ? _value._constraints
            : constraints // ignore: cast_nullable_to_non_nullable
                  as List<ProtocolConstraint>,
        medications: null == medications
            ? _value._medications
            : medications // ignore: cast_nullable_to_non_nullable
                  as List<Medication>,
        supplements: null == supplements
            ? _value._supplements
            : supplements // ignore: cast_nullable_to_non_nullable
                  as List<Supplement>,
        workoutSchedule: null == workoutSchedule
            ? _value._workoutSchedule
            : workoutSchedule // ignore: cast_nullable_to_non_nullable
                  as List<ScheduledWorkout>,
        lockedUntil: freezed == lockedUntil
            ? _value.lockedUntil
            : lockedUntil // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProtocolImpl implements _Protocol {
  const _$ProtocolImpl({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.eatingWindowStart,
    required this.eatingWindowEnd,
    final List<MedicationSchedule> medicationSchedule = const [],
    final List<WeeklyActivity> weeklyActivityPlan = const [],
    final List<ProtocolConstraint> constraints = const [],
    final List<Medication> medications = const [],
    final List<Supplement> supplements = const [],
    final List<ScheduledWorkout> workoutSchedule = const [],
    this.lockedUntil,
  }) : _medicationSchedule = medicationSchedule,
       _weeklyActivityPlan = weeklyActivityPlan,
       _constraints = constraints,
       _medications = medications,
       _supplements = supplements,
       _workoutSchedule = workoutSchedule;

  factory _$ProtocolImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProtocolImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final TimeOfDay eatingWindowStart;
  @override
  final TimeOfDay eatingWindowEnd;
  final List<MedicationSchedule> _medicationSchedule;
  @override
  @JsonKey()
  List<MedicationSchedule> get medicationSchedule {
    if (_medicationSchedule is EqualUnmodifiableListView)
      return _medicationSchedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicationSchedule);
  }

  final List<WeeklyActivity> _weeklyActivityPlan;
  @override
  @JsonKey()
  List<WeeklyActivity> get weeklyActivityPlan {
    if (_weeklyActivityPlan is EqualUnmodifiableListView)
      return _weeklyActivityPlan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyActivityPlan);
  }

  final List<ProtocolConstraint> _constraints;
  @override
  @JsonKey()
  List<ProtocolConstraint> get constraints {
    if (_constraints is EqualUnmodifiableListView) return _constraints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_constraints);
  }

  final List<Medication> _medications;
  @override
  @JsonKey()
  List<Medication> get medications {
    if (_medications is EqualUnmodifiableListView) return _medications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medications);
  }

  final List<Supplement> _supplements;
  @override
  @JsonKey()
  List<Supplement> get supplements {
    if (_supplements is EqualUnmodifiableListView) return _supplements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supplements);
  }

  final List<ScheduledWorkout> _workoutSchedule;
  @override
  @JsonKey()
  List<ScheduledWorkout> get workoutSchedule {
    if (_workoutSchedule is EqualUnmodifiableListView) return _workoutSchedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workoutSchedule);
  }

  @override
  final DateTime? lockedUntil;

  @override
  String toString() {
    return 'Protocol(id: $id, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, eatingWindowStart: $eatingWindowStart, eatingWindowEnd: $eatingWindowEnd, medicationSchedule: $medicationSchedule, weeklyActivityPlan: $weeklyActivityPlan, constraints: $constraints, medications: $medications, supplements: $supplements, workoutSchedule: $workoutSchedule, lockedUntil: $lockedUntil)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtocolImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.eatingWindowStart, eatingWindowStart) ||
                other.eatingWindowStart == eatingWindowStart) &&
            (identical(other.eatingWindowEnd, eatingWindowEnd) ||
                other.eatingWindowEnd == eatingWindowEnd) &&
            const DeepCollectionEquality().equals(
              other._medicationSchedule,
              _medicationSchedule,
            ) &&
            const DeepCollectionEquality().equals(
              other._weeklyActivityPlan,
              _weeklyActivityPlan,
            ) &&
            const DeepCollectionEquality().equals(
              other._constraints,
              _constraints,
            ) &&
            const DeepCollectionEquality().equals(
              other._medications,
              _medications,
            ) &&
            const DeepCollectionEquality().equals(
              other._supplements,
              _supplements,
            ) &&
            const DeepCollectionEquality().equals(
              other._workoutSchedule,
              _workoutSchedule,
            ) &&
            (identical(other.lockedUntil, lockedUntil) ||
                other.lockedUntil == lockedUntil));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    createdAt,
    updatedAt,
    eatingWindowStart,
    eatingWindowEnd,
    const DeepCollectionEquality().hash(_medicationSchedule),
    const DeepCollectionEquality().hash(_weeklyActivityPlan),
    const DeepCollectionEquality().hash(_constraints),
    const DeepCollectionEquality().hash(_medications),
    const DeepCollectionEquality().hash(_supplements),
    const DeepCollectionEquality().hash(_workoutSchedule),
    lockedUntil,
  );

  /// Create a copy of Protocol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtocolImplCopyWith<_$ProtocolImpl> get copyWith =>
      __$$ProtocolImplCopyWithImpl<_$ProtocolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProtocolImplToJson(this);
  }
}

abstract class _Protocol implements Protocol {
  const factory _Protocol({
    required final String id,
    required final String userId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    required final TimeOfDay eatingWindowStart,
    required final TimeOfDay eatingWindowEnd,
    final List<MedicationSchedule> medicationSchedule,
    final List<WeeklyActivity> weeklyActivityPlan,
    final List<ProtocolConstraint> constraints,
    final List<Medication> medications,
    final List<Supplement> supplements,
    final List<ScheduledWorkout> workoutSchedule,
    final DateTime? lockedUntil,
  }) = _$ProtocolImpl;

  factory _Protocol.fromJson(Map<String, dynamic> json) =
      _$ProtocolImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  TimeOfDay get eatingWindowStart;
  @override
  TimeOfDay get eatingWindowEnd;
  @override
  List<MedicationSchedule> get medicationSchedule;
  @override
  List<WeeklyActivity> get weeklyActivityPlan;
  @override
  List<ProtocolConstraint> get constraints;
  @override
  List<Medication> get medications;
  @override
  List<Supplement> get supplements;
  @override
  List<ScheduledWorkout> get workoutSchedule;
  @override
  DateTime? get lockedUntil;

  /// Create a copy of Protocol
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProtocolImplCopyWith<_$ProtocolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeOfDay _$TimeOfDayFromJson(Map<String, dynamic> json) {
  return _TimeOfDay.fromJson(json);
}

/// @nodoc
mixin _$TimeOfDay {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  /// Serializes this TimeOfDay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeOfDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeOfDayCopyWith<TimeOfDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeOfDayCopyWith<$Res> {
  factory $TimeOfDayCopyWith(TimeOfDay value, $Res Function(TimeOfDay) then) =
      _$TimeOfDayCopyWithImpl<$Res, TimeOfDay>;
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class _$TimeOfDayCopyWithImpl<$Res, $Val extends TimeOfDay>
    implements $TimeOfDayCopyWith<$Res> {
  _$TimeOfDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeOfDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hour = null, Object? minute = null}) {
    return _then(
      _value.copyWith(
            hour: null == hour
                ? _value.hour
                : hour // ignore: cast_nullable_to_non_nullable
                      as int,
            minute: null == minute
                ? _value.minute
                : minute // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimeOfDayImplCopyWith<$Res>
    implements $TimeOfDayCopyWith<$Res> {
  factory _$$TimeOfDayImplCopyWith(
    _$TimeOfDayImpl value,
    $Res Function(_$TimeOfDayImpl) then,
  ) = __$$TimeOfDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class __$$TimeOfDayImplCopyWithImpl<$Res>
    extends _$TimeOfDayCopyWithImpl<$Res, _$TimeOfDayImpl>
    implements _$$TimeOfDayImplCopyWith<$Res> {
  __$$TimeOfDayImplCopyWithImpl(
    _$TimeOfDayImpl _value,
    $Res Function(_$TimeOfDayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimeOfDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hour = null, Object? minute = null}) {
    return _then(
      _$TimeOfDayImpl(
        hour: null == hour
            ? _value.hour
            : hour // ignore: cast_nullable_to_non_nullable
                  as int,
        minute: null == minute
            ? _value.minute
            : minute // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeOfDayImpl implements _TimeOfDay {
  const _$TimeOfDayImpl({required this.hour, required this.minute});

  factory _$TimeOfDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeOfDayImplFromJson(json);

  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'TimeOfDay(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeOfDayImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  /// Create a copy of TimeOfDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeOfDayImplCopyWith<_$TimeOfDayImpl> get copyWith =>
      __$$TimeOfDayImplCopyWithImpl<_$TimeOfDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeOfDayImplToJson(this);
  }
}

abstract class _TimeOfDay implements TimeOfDay {
  const factory _TimeOfDay({
    required final int hour,
    required final int minute,
  }) = _$TimeOfDayImpl;

  factory _TimeOfDay.fromJson(Map<String, dynamic> json) =
      _$TimeOfDayImpl.fromJson;

  @override
  int get hour;
  @override
  int get minute;

  /// Create a copy of TimeOfDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeOfDayImplCopyWith<_$TimeOfDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MedicationSchedule _$MedicationScheduleFromJson(Map<String, dynamic> json) {
  return _MedicationSchedule.fromJson(json);
}

/// @nodoc
mixin _$MedicationSchedule {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get dose => throw _privateConstructorUsedError;
  List<int> get weekdays =>
      throw _privateConstructorUsedError; // 1=Monday, 7=Sunday
  TimeOfDay get time => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this MedicationSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationScheduleCopyWith<MedicationSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationScheduleCopyWith<$Res> {
  factory $MedicationScheduleCopyWith(
    MedicationSchedule value,
    $Res Function(MedicationSchedule) then,
  ) = _$MedicationScheduleCopyWithImpl<$Res, MedicationSchedule>;
  @useResult
  $Res call({
    String id,
    String name,
    String dose,
    List<int> weekdays,
    TimeOfDay time,
    String? notes,
    bool isActive,
  });

  $TimeOfDayCopyWith<$Res> get time;
}

/// @nodoc
class _$MedicationScheduleCopyWithImpl<$Res, $Val extends MedicationSchedule>
    implements $MedicationScheduleCopyWith<$Res> {
  _$MedicationScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dose = null,
    Object? weekdays = null,
    Object? time = null,
    Object? notes = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            dose: null == dose
                ? _value.dose
                : dose // ignore: cast_nullable_to_non_nullable
                      as String,
            weekdays: null == weekdays
                ? _value.weekdays
                : weekdays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as TimeOfDay,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeOfDayCopyWith<$Res> get time {
    return $TimeOfDayCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MedicationScheduleImplCopyWith<$Res>
    implements $MedicationScheduleCopyWith<$Res> {
  factory _$$MedicationScheduleImplCopyWith(
    _$MedicationScheduleImpl value,
    $Res Function(_$MedicationScheduleImpl) then,
  ) = __$$MedicationScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String dose,
    List<int> weekdays,
    TimeOfDay time,
    String? notes,
    bool isActive,
  });

  @override
  $TimeOfDayCopyWith<$Res> get time;
}

/// @nodoc
class __$$MedicationScheduleImplCopyWithImpl<$Res>
    extends _$MedicationScheduleCopyWithImpl<$Res, _$MedicationScheduleImpl>
    implements _$$MedicationScheduleImplCopyWith<$Res> {
  __$$MedicationScheduleImplCopyWithImpl(
    _$MedicationScheduleImpl _value,
    $Res Function(_$MedicationScheduleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dose = null,
    Object? weekdays = null,
    Object? time = null,
    Object? notes = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$MedicationScheduleImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        dose: null == dose
            ? _value.dose
            : dose // ignore: cast_nullable_to_non_nullable
                  as String,
        weekdays: null == weekdays
            ? _value._weekdays
            : weekdays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as TimeOfDay,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicationScheduleImpl implements _MedicationSchedule {
  const _$MedicationScheduleImpl({
    required this.id,
    required this.name,
    required this.dose,
    required final List<int> weekdays,
    required this.time,
    this.notes,
    this.isActive = true,
  }) : _weekdays = weekdays;

  factory _$MedicationScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicationScheduleImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String dose;
  final List<int> _weekdays;
  @override
  List<int> get weekdays {
    if (_weekdays is EqualUnmodifiableListView) return _weekdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekdays);
  }

  // 1=Monday, 7=Sunday
  @override
  final TimeOfDay time;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'MedicationSchedule(id: $id, name: $name, dose: $dose, weekdays: $weekdays, time: $time, notes: $notes, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dose, dose) || other.dose == dose) &&
            const DeepCollectionEquality().equals(other._weekdays, _weekdays) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    dose,
    const DeepCollectionEquality().hash(_weekdays),
    time,
    notes,
    isActive,
  );

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationScheduleImplCopyWith<_$MedicationScheduleImpl> get copyWith =>
      __$$MedicationScheduleImplCopyWithImpl<_$MedicationScheduleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationScheduleImplToJson(this);
  }
}

abstract class _MedicationSchedule implements MedicationSchedule {
  const factory _MedicationSchedule({
    required final String id,
    required final String name,
    required final String dose,
    required final List<int> weekdays,
    required final TimeOfDay time,
    final String? notes,
    final bool isActive,
  }) = _$MedicationScheduleImpl;

  factory _MedicationSchedule.fromJson(Map<String, dynamic> json) =
      _$MedicationScheduleImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get dose;
  @override
  List<int> get weekdays; // 1=Monday, 7=Sunday
  @override
  TimeOfDay get time;
  @override
  String? get notes;
  @override
  bool get isActive;

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationScheduleImplCopyWith<_$MedicationScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyActivity _$WeeklyActivityFromJson(Map<String, dynamic> json) {
  return _WeeklyActivity.fromJson(json);
}

/// @nodoc
mixin _$WeeklyActivity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ActivityType get type => throw _privateConstructorUsedError;
  List<int> get weekdays =>
      throw _privateConstructorUsedError; // 1=Monday, 7=Sunday
  TimeOfDay? get preferredTime => throw _privateConstructorUsedError;
  int? get targetDuration => throw _privateConstructorUsedError; // in minutes
  String? get notes => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this WeeklyActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyActivityCopyWith<WeeklyActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyActivityCopyWith<$Res> {
  factory $WeeklyActivityCopyWith(
    WeeklyActivity value,
    $Res Function(WeeklyActivity) then,
  ) = _$WeeklyActivityCopyWithImpl<$Res, WeeklyActivity>;
  @useResult
  $Res call({
    String id,
    String name,
    ActivityType type,
    List<int> weekdays,
    TimeOfDay? preferredTime,
    int? targetDuration,
    String? notes,
    bool isActive,
  });

  $TimeOfDayCopyWith<$Res>? get preferredTime;
}

/// @nodoc
class _$WeeklyActivityCopyWithImpl<$Res, $Val extends WeeklyActivity>
    implements $WeeklyActivityCopyWith<$Res> {
  _$WeeklyActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? weekdays = null,
    Object? preferredTime = freezed,
    Object? targetDuration = freezed,
    Object? notes = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ActivityType,
            weekdays: null == weekdays
                ? _value.weekdays
                : weekdays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            preferredTime: freezed == preferredTime
                ? _value.preferredTime
                : preferredTime // ignore: cast_nullable_to_non_nullable
                      as TimeOfDay?,
            targetDuration: freezed == targetDuration
                ? _value.targetDuration
                : targetDuration // ignore: cast_nullable_to_non_nullable
                      as int?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeOfDayCopyWith<$Res>? get preferredTime {
    if (_value.preferredTime == null) {
      return null;
    }

    return $TimeOfDayCopyWith<$Res>(_value.preferredTime!, (value) {
      return _then(_value.copyWith(preferredTime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeeklyActivityImplCopyWith<$Res>
    implements $WeeklyActivityCopyWith<$Res> {
  factory _$$WeeklyActivityImplCopyWith(
    _$WeeklyActivityImpl value,
    $Res Function(_$WeeklyActivityImpl) then,
  ) = __$$WeeklyActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    ActivityType type,
    List<int> weekdays,
    TimeOfDay? preferredTime,
    int? targetDuration,
    String? notes,
    bool isActive,
  });

  @override
  $TimeOfDayCopyWith<$Res>? get preferredTime;
}

/// @nodoc
class __$$WeeklyActivityImplCopyWithImpl<$Res>
    extends _$WeeklyActivityCopyWithImpl<$Res, _$WeeklyActivityImpl>
    implements _$$WeeklyActivityImplCopyWith<$Res> {
  __$$WeeklyActivityImplCopyWithImpl(
    _$WeeklyActivityImpl _value,
    $Res Function(_$WeeklyActivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? weekdays = null,
    Object? preferredTime = freezed,
    Object? targetDuration = freezed,
    Object? notes = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$WeeklyActivityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ActivityType,
        weekdays: null == weekdays
            ? _value._weekdays
            : weekdays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        preferredTime: freezed == preferredTime
            ? _value.preferredTime
            : preferredTime // ignore: cast_nullable_to_non_nullable
                  as TimeOfDay?,
        targetDuration: freezed == targetDuration
            ? _value.targetDuration
            : targetDuration // ignore: cast_nullable_to_non_nullable
                  as int?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyActivityImpl implements _WeeklyActivity {
  const _$WeeklyActivityImpl({
    required this.id,
    required this.name,
    required this.type,
    required final List<int> weekdays,
    this.preferredTime,
    this.targetDuration,
    this.notes,
    this.isActive = true,
  }) : _weekdays = weekdays;

  factory _$WeeklyActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final ActivityType type;
  final List<int> _weekdays;
  @override
  List<int> get weekdays {
    if (_weekdays is EqualUnmodifiableListView) return _weekdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekdays);
  }

  // 1=Monday, 7=Sunday
  @override
  final TimeOfDay? preferredTime;
  @override
  final int? targetDuration;
  // in minutes
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'WeeklyActivity(id: $id, name: $name, type: $type, weekdays: $weekdays, preferredTime: $preferredTime, targetDuration: $targetDuration, notes: $notes, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._weekdays, _weekdays) &&
            (identical(other.preferredTime, preferredTime) ||
                other.preferredTime == preferredTime) &&
            (identical(other.targetDuration, targetDuration) ||
                other.targetDuration == targetDuration) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    const DeepCollectionEquality().hash(_weekdays),
    preferredTime,
    targetDuration,
    notes,
    isActive,
  );

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyActivityImplCopyWith<_$WeeklyActivityImpl> get copyWith =>
      __$$WeeklyActivityImplCopyWithImpl<_$WeeklyActivityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyActivityImplToJson(this);
  }
}

abstract class _WeeklyActivity implements WeeklyActivity {
  const factory _WeeklyActivity({
    required final String id,
    required final String name,
    required final ActivityType type,
    required final List<int> weekdays,
    final TimeOfDay? preferredTime,
    final int? targetDuration,
    final String? notes,
    final bool isActive,
  }) = _$WeeklyActivityImpl;

  factory _WeeklyActivity.fromJson(Map<String, dynamic> json) =
      _$WeeklyActivityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  ActivityType get type;
  @override
  List<int> get weekdays; // 1=Monday, 7=Sunday
  @override
  TimeOfDay? get preferredTime;
  @override
  int? get targetDuration; // in minutes
  @override
  String? get notes;
  @override
  bool get isActive;

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyActivityImplCopyWith<_$WeeklyActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProtocolConstraint _$ProtocolConstraintFromJson(Map<String, dynamic> json) {
  return _ProtocolConstraint.fromJson(json);
}

/// @nodoc
mixin _$ProtocolConstraint {
  String get id => throw _privateConstructorUsedError;
  ConstraintType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get validUntil => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this ProtocolConstraint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProtocolConstraint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProtocolConstraintCopyWith<ProtocolConstraint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolConstraintCopyWith<$Res> {
  factory $ProtocolConstraintCopyWith(
    ProtocolConstraint value,
    $Res Function(ProtocolConstraint) then,
  ) = _$ProtocolConstraintCopyWithImpl<$Res, ProtocolConstraint>;
  @useResult
  $Res call({
    String id,
    ConstraintType type,
    String description,
    DateTime? validUntil,
    bool isActive,
  });
}

/// @nodoc
class _$ProtocolConstraintCopyWithImpl<$Res, $Val extends ProtocolConstraint>
    implements $ProtocolConstraintCopyWith<$Res> {
  _$ProtocolConstraintCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProtocolConstraint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? description = null,
    Object? validUntil = freezed,
    Object? isActive = null,
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
                      as ConstraintType,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            validUntil: freezed == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProtocolConstraintImplCopyWith<$Res>
    implements $ProtocolConstraintCopyWith<$Res> {
  factory _$$ProtocolConstraintImplCopyWith(
    _$ProtocolConstraintImpl value,
    $Res Function(_$ProtocolConstraintImpl) then,
  ) = __$$ProtocolConstraintImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    ConstraintType type,
    String description,
    DateTime? validUntil,
    bool isActive,
  });
}

/// @nodoc
class __$$ProtocolConstraintImplCopyWithImpl<$Res>
    extends _$ProtocolConstraintCopyWithImpl<$Res, _$ProtocolConstraintImpl>
    implements _$$ProtocolConstraintImplCopyWith<$Res> {
  __$$ProtocolConstraintImplCopyWithImpl(
    _$ProtocolConstraintImpl _value,
    $Res Function(_$ProtocolConstraintImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProtocolConstraint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? description = null,
    Object? validUntil = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$ProtocolConstraintImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ConstraintType,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        validUntil: freezed == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProtocolConstraintImpl implements _ProtocolConstraint {
  const _$ProtocolConstraintImpl({
    required this.id,
    required this.type,
    required this.description,
    this.validUntil,
    this.isActive = true,
  });

  factory _$ProtocolConstraintImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProtocolConstraintImplFromJson(json);

  @override
  final String id;
  @override
  final ConstraintType type;
  @override
  final String description;
  @override
  final DateTime? validUntil;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'ProtocolConstraint(id: $id, type: $type, description: $description, validUntil: $validUntil, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtocolConstraintImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, description, validUntil, isActive);

  /// Create a copy of ProtocolConstraint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtocolConstraintImplCopyWith<_$ProtocolConstraintImpl> get copyWith =>
      __$$ProtocolConstraintImplCopyWithImpl<_$ProtocolConstraintImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProtocolConstraintImplToJson(this);
  }
}

abstract class _ProtocolConstraint implements ProtocolConstraint {
  const factory _ProtocolConstraint({
    required final String id,
    required final ConstraintType type,
    required final String description,
    final DateTime? validUntil,
    final bool isActive,
  }) = _$ProtocolConstraintImpl;

  factory _ProtocolConstraint.fromJson(Map<String, dynamic> json) =
      _$ProtocolConstraintImpl.fromJson;

  @override
  String get id;
  @override
  ConstraintType get type;
  @override
  String get description;
  @override
  DateTime? get validUntil;
  @override
  bool get isActive;

  /// Create a copy of ProtocolConstraint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProtocolConstraintImplCopyWith<_$ProtocolConstraintImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProtocolSnapshot _$ProtocolSnapshotFromJson(Map<String, dynamic> json) {
  return _ProtocolSnapshot.fromJson(json);
}

/// @nodoc
mixin _$ProtocolSnapshot {
  String get id => throw _privateConstructorUsedError;
  String get protocolId => throw _privateConstructorUsedError;
  DateTime get effectiveDate => throw _privateConstructorUsedError;
  String get serializedProtocol => throw _privateConstructorUsedError;
  String? get changeReason => throw _privateConstructorUsedError;

  /// Serializes this ProtocolSnapshot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProtocolSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProtocolSnapshotCopyWith<ProtocolSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolSnapshotCopyWith<$Res> {
  factory $ProtocolSnapshotCopyWith(
    ProtocolSnapshot value,
    $Res Function(ProtocolSnapshot) then,
  ) = _$ProtocolSnapshotCopyWithImpl<$Res, ProtocolSnapshot>;
  @useResult
  $Res call({
    String id,
    String protocolId,
    DateTime effectiveDate,
    String serializedProtocol,
    String? changeReason,
  });
}

/// @nodoc
class _$ProtocolSnapshotCopyWithImpl<$Res, $Val extends ProtocolSnapshot>
    implements $ProtocolSnapshotCopyWith<$Res> {
  _$ProtocolSnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProtocolSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? protocolId = null,
    Object? effectiveDate = null,
    Object? serializedProtocol = null,
    Object? changeReason = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            protocolId: null == protocolId
                ? _value.protocolId
                : protocolId // ignore: cast_nullable_to_non_nullable
                      as String,
            effectiveDate: null == effectiveDate
                ? _value.effectiveDate
                : effectiveDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            serializedProtocol: null == serializedProtocol
                ? _value.serializedProtocol
                : serializedProtocol // ignore: cast_nullable_to_non_nullable
                      as String,
            changeReason: freezed == changeReason
                ? _value.changeReason
                : changeReason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProtocolSnapshotImplCopyWith<$Res>
    implements $ProtocolSnapshotCopyWith<$Res> {
  factory _$$ProtocolSnapshotImplCopyWith(
    _$ProtocolSnapshotImpl value,
    $Res Function(_$ProtocolSnapshotImpl) then,
  ) = __$$ProtocolSnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String protocolId,
    DateTime effectiveDate,
    String serializedProtocol,
    String? changeReason,
  });
}

/// @nodoc
class __$$ProtocolSnapshotImplCopyWithImpl<$Res>
    extends _$ProtocolSnapshotCopyWithImpl<$Res, _$ProtocolSnapshotImpl>
    implements _$$ProtocolSnapshotImplCopyWith<$Res> {
  __$$ProtocolSnapshotImplCopyWithImpl(
    _$ProtocolSnapshotImpl _value,
    $Res Function(_$ProtocolSnapshotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProtocolSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? protocolId = null,
    Object? effectiveDate = null,
    Object? serializedProtocol = null,
    Object? changeReason = freezed,
  }) {
    return _then(
      _$ProtocolSnapshotImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        protocolId: null == protocolId
            ? _value.protocolId
            : protocolId // ignore: cast_nullable_to_non_nullable
                  as String,
        effectiveDate: null == effectiveDate
            ? _value.effectiveDate
            : effectiveDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        serializedProtocol: null == serializedProtocol
            ? _value.serializedProtocol
            : serializedProtocol // ignore: cast_nullable_to_non_nullable
                  as String,
        changeReason: freezed == changeReason
            ? _value.changeReason
            : changeReason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProtocolSnapshotImpl implements _ProtocolSnapshot {
  const _$ProtocolSnapshotImpl({
    required this.id,
    required this.protocolId,
    required this.effectiveDate,
    required this.serializedProtocol,
    this.changeReason,
  });

  factory _$ProtocolSnapshotImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProtocolSnapshotImplFromJson(json);

  @override
  final String id;
  @override
  final String protocolId;
  @override
  final DateTime effectiveDate;
  @override
  final String serializedProtocol;
  @override
  final String? changeReason;

  @override
  String toString() {
    return 'ProtocolSnapshot(id: $id, protocolId: $protocolId, effectiveDate: $effectiveDate, serializedProtocol: $serializedProtocol, changeReason: $changeReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtocolSnapshotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.protocolId, protocolId) ||
                other.protocolId == protocolId) &&
            (identical(other.effectiveDate, effectiveDate) ||
                other.effectiveDate == effectiveDate) &&
            (identical(other.serializedProtocol, serializedProtocol) ||
                other.serializedProtocol == serializedProtocol) &&
            (identical(other.changeReason, changeReason) ||
                other.changeReason == changeReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    protocolId,
    effectiveDate,
    serializedProtocol,
    changeReason,
  );

  /// Create a copy of ProtocolSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtocolSnapshotImplCopyWith<_$ProtocolSnapshotImpl> get copyWith =>
      __$$ProtocolSnapshotImplCopyWithImpl<_$ProtocolSnapshotImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProtocolSnapshotImplToJson(this);
  }
}

abstract class _ProtocolSnapshot implements ProtocolSnapshot {
  const factory _ProtocolSnapshot({
    required final String id,
    required final String protocolId,
    required final DateTime effectiveDate,
    required final String serializedProtocol,
    final String? changeReason,
  }) = _$ProtocolSnapshotImpl;

  factory _ProtocolSnapshot.fromJson(Map<String, dynamic> json) =
      _$ProtocolSnapshotImpl.fromJson;

  @override
  String get id;
  @override
  String get protocolId;
  @override
  DateTime get effectiveDate;
  @override
  String get serializedProtocol;
  @override
  String? get changeReason;

  /// Create a copy of ProtocolSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProtocolSnapshotImplCopyWith<_$ProtocolSnapshotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Medication _$MedicationFromJson(Map<String, dynamic> json) {
  return _Medication.fromJson(json);
}

/// @nodoc
mixin _$Medication {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  MedicationFrequency get frequency => throw _privateConstructorUsedError;
  List<TimeOfDay> get times => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get remindersEnabled => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this Medication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationCopyWith<Medication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationCopyWith<$Res> {
  factory $MedicationCopyWith(
    Medication value,
    $Res Function(Medication) then,
  ) = _$MedicationCopyWithImpl<$Res, Medication>;
  @useResult
  $Res call({
    String id,
    String name,
    String dosage,
    MedicationFrequency frequency,
    List<TimeOfDay> times,
    DateTime startDate,
    DateTime? endDate,
    String? notes,
    bool remindersEnabled,
    bool isActive,
  });
}

/// @nodoc
class _$MedicationCopyWithImpl<$Res, $Val extends Medication>
    implements $MedicationCopyWith<$Res> {
  _$MedicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? times = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? notes = freezed,
    Object? remindersEnabled = null,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            dosage: null == dosage
                ? _value.dosage
                : dosage // ignore: cast_nullable_to_non_nullable
                      as String,
            frequency: null == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as MedicationFrequency,
            times: null == times
                ? _value.times
                : times // ignore: cast_nullable_to_non_nullable
                      as List<TimeOfDay>,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            remindersEnabled: null == remindersEnabled
                ? _value.remindersEnabled
                : remindersEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MedicationImplCopyWith<$Res>
    implements $MedicationCopyWith<$Res> {
  factory _$$MedicationImplCopyWith(
    _$MedicationImpl value,
    $Res Function(_$MedicationImpl) then,
  ) = __$$MedicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String dosage,
    MedicationFrequency frequency,
    List<TimeOfDay> times,
    DateTime startDate,
    DateTime? endDate,
    String? notes,
    bool remindersEnabled,
    bool isActive,
  });
}

/// @nodoc
class __$$MedicationImplCopyWithImpl<$Res>
    extends _$MedicationCopyWithImpl<$Res, _$MedicationImpl>
    implements _$$MedicationImplCopyWith<$Res> {
  __$$MedicationImplCopyWithImpl(
    _$MedicationImpl _value,
    $Res Function(_$MedicationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? times = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? notes = freezed,
    Object? remindersEnabled = null,
    Object? isActive = null,
  }) {
    return _then(
      _$MedicationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        dosage: null == dosage
            ? _value.dosage
            : dosage // ignore: cast_nullable_to_non_nullable
                  as String,
        frequency: null == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as MedicationFrequency,
        times: null == times
            ? _value._times
            : times // ignore: cast_nullable_to_non_nullable
                  as List<TimeOfDay>,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        remindersEnabled: null == remindersEnabled
            ? _value.remindersEnabled
            : remindersEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicationImpl implements _Medication {
  const _$MedicationImpl({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    final List<TimeOfDay> times = const [],
    required this.startDate,
    this.endDate,
    this.notes,
    this.remindersEnabled = true,
    this.isActive = true,
  }) : _times = times;

  factory _$MedicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String dosage;
  @override
  final MedicationFrequency frequency;
  final List<TimeOfDay> _times;
  @override
  @JsonKey()
  List<TimeOfDay> get times {
    if (_times is EqualUnmodifiableListView) return _times;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_times);
  }

  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool remindersEnabled;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'Medication(id: $id, name: $name, dosage: $dosage, frequency: $frequency, times: $times, startDate: $startDate, endDate: $endDate, notes: $notes, remindersEnabled: $remindersEnabled, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality().equals(other._times, _times) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.remindersEnabled, remindersEnabled) ||
                other.remindersEnabled == remindersEnabled) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    dosage,
    frequency,
    const DeepCollectionEquality().hash(_times),
    startDate,
    endDate,
    notes,
    remindersEnabled,
    isActive,
  );

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      __$$MedicationImplCopyWithImpl<_$MedicationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationImplToJson(this);
  }
}

abstract class _Medication implements Medication {
  const factory _Medication({
    required final String id,
    required final String name,
    required final String dosage,
    required final MedicationFrequency frequency,
    final List<TimeOfDay> times,
    required final DateTime startDate,
    final DateTime? endDate,
    final String? notes,
    final bool remindersEnabled,
    final bool isActive,
  }) = _$MedicationImpl;

  factory _Medication.fromJson(Map<String, dynamic> json) =
      _$MedicationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get dosage;
  @override
  MedicationFrequency get frequency;
  @override
  List<TimeOfDay> get times;
  @override
  DateTime get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get notes;
  @override
  bool get remindersEnabled;
  @override
  bool get isActive;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Supplement _$SupplementFromJson(Map<String, dynamic> json) {
  return _Supplement.fromJson(json);
}

/// @nodoc
mixin _$Supplement {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  SupplementFrequency get frequency => throw _privateConstructorUsedError;
  List<TimeOfDay> get times => throw _privateConstructorUsedError;
  bool get withMeals => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get remindersEnabled => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this Supplement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Supplement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupplementCopyWith<Supplement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplementCopyWith<$Res> {
  factory $SupplementCopyWith(
    Supplement value,
    $Res Function(Supplement) then,
  ) = _$SupplementCopyWithImpl<$Res, Supplement>;
  @useResult
  $Res call({
    String id,
    String name,
    String dosage,
    SupplementFrequency frequency,
    List<TimeOfDay> times,
    bool withMeals,
    String? notes,
    bool remindersEnabled,
    bool isActive,
  });
}

/// @nodoc
class _$SupplementCopyWithImpl<$Res, $Val extends Supplement>
    implements $SupplementCopyWith<$Res> {
  _$SupplementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Supplement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? times = null,
    Object? withMeals = null,
    Object? notes = freezed,
    Object? remindersEnabled = null,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            dosage: null == dosage
                ? _value.dosage
                : dosage // ignore: cast_nullable_to_non_nullable
                      as String,
            frequency: null == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as SupplementFrequency,
            times: null == times
                ? _value.times
                : times // ignore: cast_nullable_to_non_nullable
                      as List<TimeOfDay>,
            withMeals: null == withMeals
                ? _value.withMeals
                : withMeals // ignore: cast_nullable_to_non_nullable
                      as bool,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            remindersEnabled: null == remindersEnabled
                ? _value.remindersEnabled
                : remindersEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SupplementImplCopyWith<$Res>
    implements $SupplementCopyWith<$Res> {
  factory _$$SupplementImplCopyWith(
    _$SupplementImpl value,
    $Res Function(_$SupplementImpl) then,
  ) = __$$SupplementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String dosage,
    SupplementFrequency frequency,
    List<TimeOfDay> times,
    bool withMeals,
    String? notes,
    bool remindersEnabled,
    bool isActive,
  });
}

/// @nodoc
class __$$SupplementImplCopyWithImpl<$Res>
    extends _$SupplementCopyWithImpl<$Res, _$SupplementImpl>
    implements _$$SupplementImplCopyWith<$Res> {
  __$$SupplementImplCopyWithImpl(
    _$SupplementImpl _value,
    $Res Function(_$SupplementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Supplement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? times = null,
    Object? withMeals = null,
    Object? notes = freezed,
    Object? remindersEnabled = null,
    Object? isActive = null,
  }) {
    return _then(
      _$SupplementImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        dosage: null == dosage
            ? _value.dosage
            : dosage // ignore: cast_nullable_to_non_nullable
                  as String,
        frequency: null == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as SupplementFrequency,
        times: null == times
            ? _value._times
            : times // ignore: cast_nullable_to_non_nullable
                  as List<TimeOfDay>,
        withMeals: null == withMeals
            ? _value.withMeals
            : withMeals // ignore: cast_nullable_to_non_nullable
                  as bool,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        remindersEnabled: null == remindersEnabled
            ? _value.remindersEnabled
            : remindersEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SupplementImpl implements _Supplement {
  const _$SupplementImpl({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    final List<TimeOfDay> times = const [],
    this.withMeals = false,
    this.notes,
    this.remindersEnabled = true,
    this.isActive = true,
  }) : _times = times;

  factory _$SupplementImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupplementImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String dosage;
  @override
  final SupplementFrequency frequency;
  final List<TimeOfDay> _times;
  @override
  @JsonKey()
  List<TimeOfDay> get times {
    if (_times is EqualUnmodifiableListView) return _times;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_times);
  }

  @override
  @JsonKey()
  final bool withMeals;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool remindersEnabled;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'Supplement(id: $id, name: $name, dosage: $dosage, frequency: $frequency, times: $times, withMeals: $withMeals, notes: $notes, remindersEnabled: $remindersEnabled, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupplementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality().equals(other._times, _times) &&
            (identical(other.withMeals, withMeals) ||
                other.withMeals == withMeals) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.remindersEnabled, remindersEnabled) ||
                other.remindersEnabled == remindersEnabled) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    dosage,
    frequency,
    const DeepCollectionEquality().hash(_times),
    withMeals,
    notes,
    remindersEnabled,
    isActive,
  );

  /// Create a copy of Supplement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupplementImplCopyWith<_$SupplementImpl> get copyWith =>
      __$$SupplementImplCopyWithImpl<_$SupplementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupplementImplToJson(this);
  }
}

abstract class _Supplement implements Supplement {
  const factory _Supplement({
    required final String id,
    required final String name,
    required final String dosage,
    required final SupplementFrequency frequency,
    final List<TimeOfDay> times,
    final bool withMeals,
    final String? notes,
    final bool remindersEnabled,
    final bool isActive,
  }) = _$SupplementImpl;

  factory _Supplement.fromJson(Map<String, dynamic> json) =
      _$SupplementImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get dosage;
  @override
  SupplementFrequency get frequency;
  @override
  List<TimeOfDay> get times;
  @override
  bool get withMeals;
  @override
  String? get notes;
  @override
  bool get remindersEnabled;
  @override
  bool get isActive;

  /// Create a copy of Supplement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupplementImplCopyWith<_$SupplementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduledWorkout _$ScheduledWorkoutFromJson(Map<String, dynamic> json) {
  return _ScheduledWorkout.fromJson(json);
}

/// @nodoc
mixin _$ScheduledWorkout {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  WorkoutType get type => throw _privateConstructorUsedError;
  int get dayOfWeek => throw _privateConstructorUsedError; // 1=Monday, 7=Sunday
  TimeOfDay? get preferredTime => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError; // in minutes
  double? get targetStrain => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this ScheduledWorkout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduledWorkout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduledWorkoutCopyWith<ScheduledWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledWorkoutCopyWith<$Res> {
  factory $ScheduledWorkoutCopyWith(
    ScheduledWorkout value,
    $Res Function(ScheduledWorkout) then,
  ) = _$ScheduledWorkoutCopyWithImpl<$Res, ScheduledWorkout>;
  @useResult
  $Res call({
    String id,
    String name,
    WorkoutType type,
    int dayOfWeek,
    TimeOfDay? preferredTime,
    int? duration,
    double? targetStrain,
    String? notes,
    bool isActive,
  });

  $TimeOfDayCopyWith<$Res>? get preferredTime;
}

/// @nodoc
class _$ScheduledWorkoutCopyWithImpl<$Res, $Val extends ScheduledWorkout>
    implements $ScheduledWorkoutCopyWith<$Res> {
  _$ScheduledWorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduledWorkout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? dayOfWeek = null,
    Object? preferredTime = freezed,
    Object? duration = freezed,
    Object? targetStrain = freezed,
    Object? notes = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as WorkoutType,
            dayOfWeek: null == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            preferredTime: freezed == preferredTime
                ? _value.preferredTime
                : preferredTime // ignore: cast_nullable_to_non_nullable
                      as TimeOfDay?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int?,
            targetStrain: freezed == targetStrain
                ? _value.targetStrain
                : targetStrain // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ScheduledWorkout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeOfDayCopyWith<$Res>? get preferredTime {
    if (_value.preferredTime == null) {
      return null;
    }

    return $TimeOfDayCopyWith<$Res>(_value.preferredTime!, (value) {
      return _then(_value.copyWith(preferredTime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduledWorkoutImplCopyWith<$Res>
    implements $ScheduledWorkoutCopyWith<$Res> {
  factory _$$ScheduledWorkoutImplCopyWith(
    _$ScheduledWorkoutImpl value,
    $Res Function(_$ScheduledWorkoutImpl) then,
  ) = __$$ScheduledWorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    WorkoutType type,
    int dayOfWeek,
    TimeOfDay? preferredTime,
    int? duration,
    double? targetStrain,
    String? notes,
    bool isActive,
  });

  @override
  $TimeOfDayCopyWith<$Res>? get preferredTime;
}

/// @nodoc
class __$$ScheduledWorkoutImplCopyWithImpl<$Res>
    extends _$ScheduledWorkoutCopyWithImpl<$Res, _$ScheduledWorkoutImpl>
    implements _$$ScheduledWorkoutImplCopyWith<$Res> {
  __$$ScheduledWorkoutImplCopyWithImpl(
    _$ScheduledWorkoutImpl _value,
    $Res Function(_$ScheduledWorkoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScheduledWorkout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? dayOfWeek = null,
    Object? preferredTime = freezed,
    Object? duration = freezed,
    Object? targetStrain = freezed,
    Object? notes = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$ScheduledWorkoutImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as WorkoutType,
        dayOfWeek: null == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        preferredTime: freezed == preferredTime
            ? _value.preferredTime
            : preferredTime // ignore: cast_nullable_to_non_nullable
                  as TimeOfDay?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int?,
        targetStrain: freezed == targetStrain
            ? _value.targetStrain
            : targetStrain // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduledWorkoutImpl implements _ScheduledWorkout {
  const _$ScheduledWorkoutImpl({
    required this.id,
    required this.name,
    required this.type,
    required this.dayOfWeek,
    this.preferredTime,
    this.duration,
    this.targetStrain,
    this.notes,
    this.isActive = true,
  });

  factory _$ScheduledWorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduledWorkoutImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final WorkoutType type;
  @override
  final int dayOfWeek;
  // 1=Monday, 7=Sunday
  @override
  final TimeOfDay? preferredTime;
  @override
  final int? duration;
  // in minutes
  @override
  final double? targetStrain;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'ScheduledWorkout(id: $id, name: $name, type: $type, dayOfWeek: $dayOfWeek, preferredTime: $preferredTime, duration: $duration, targetStrain: $targetStrain, notes: $notes, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduledWorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.preferredTime, preferredTime) ||
                other.preferredTime == preferredTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.targetStrain, targetStrain) ||
                other.targetStrain == targetStrain) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    dayOfWeek,
    preferredTime,
    duration,
    targetStrain,
    notes,
    isActive,
  );

  /// Create a copy of ScheduledWorkout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduledWorkoutImplCopyWith<_$ScheduledWorkoutImpl> get copyWith =>
      __$$ScheduledWorkoutImplCopyWithImpl<_$ScheduledWorkoutImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduledWorkoutImplToJson(this);
  }
}

abstract class _ScheduledWorkout implements ScheduledWorkout {
  const factory _ScheduledWorkout({
    required final String id,
    required final String name,
    required final WorkoutType type,
    required final int dayOfWeek,
    final TimeOfDay? preferredTime,
    final int? duration,
    final double? targetStrain,
    final String? notes,
    final bool isActive,
  }) = _$ScheduledWorkoutImpl;

  factory _ScheduledWorkout.fromJson(Map<String, dynamic> json) =
      _$ScheduledWorkoutImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  WorkoutType get type;
  @override
  int get dayOfWeek; // 1=Monday, 7=Sunday
  @override
  TimeOfDay? get preferredTime;
  @override
  int? get duration; // in minutes
  @override
  double? get targetStrain;
  @override
  String? get notes;
  @override
  bool get isActive;

  /// Create a copy of ScheduledWorkout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduledWorkoutImplCopyWith<_$ScheduledWorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
