// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyLog _$DailyLogFromJson(Map<String, dynamic> json) {
  return _DailyLog.fromJson(json);
}

/// @nodoc
mixin _$DailyLog {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError; // in kg
  String? get notes => throw _privateConstructorUsedError;
  int? get moodEnergy => throw _privateConstructorUsedError; // 1-5
  int? get hunger => throw _privateConstructorUsedError; // 1-5
  int? get stress => throw _privateConstructorUsedError; // 1-5
  List<String> get symptoms => throw _privateConstructorUsedError;

  /// Serializes this DailyLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyLogCopyWith<DailyLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyLogCopyWith<$Res> {
  factory $DailyLogCopyWith(DailyLog value, $Res Function(DailyLog) then) =
      _$DailyLogCopyWithImpl<$Res, DailyLog>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime createdAt,
    DateTime updatedAt,
    double? weight,
    String? notes,
    int? moodEnergy,
    int? hunger,
    int? stress,
    List<String> symptoms,
  });
}

/// @nodoc
class _$DailyLogCopyWithImpl<$Res, $Val extends DailyLog>
    implements $DailyLogCopyWith<$Res> {
  _$DailyLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? weight = freezed,
    Object? notes = freezed,
    Object? moodEnergy = freezed,
    Object? hunger = freezed,
    Object? stress = freezed,
    Object? symptoms = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            moodEnergy: freezed == moodEnergy
                ? _value.moodEnergy
                : moodEnergy // ignore: cast_nullable_to_non_nullable
                      as int?,
            hunger: freezed == hunger
                ? _value.hunger
                : hunger // ignore: cast_nullable_to_non_nullable
                      as int?,
            stress: freezed == stress
                ? _value.stress
                : stress // ignore: cast_nullable_to_non_nullable
                      as int?,
            symptoms: null == symptoms
                ? _value.symptoms
                : symptoms // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyLogImplCopyWith<$Res>
    implements $DailyLogCopyWith<$Res> {
  factory _$$DailyLogImplCopyWith(
    _$DailyLogImpl value,
    $Res Function(_$DailyLogImpl) then,
  ) = __$$DailyLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime createdAt,
    DateTime updatedAt,
    double? weight,
    String? notes,
    int? moodEnergy,
    int? hunger,
    int? stress,
    List<String> symptoms,
  });
}

/// @nodoc
class __$$DailyLogImplCopyWithImpl<$Res>
    extends _$DailyLogCopyWithImpl<$Res, _$DailyLogImpl>
    implements _$$DailyLogImplCopyWith<$Res> {
  __$$DailyLogImplCopyWithImpl(
    _$DailyLogImpl _value,
    $Res Function(_$DailyLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? weight = freezed,
    Object? notes = freezed,
    Object? moodEnergy = freezed,
    Object? hunger = freezed,
    Object? stress = freezed,
    Object? symptoms = null,
  }) {
    return _then(
      _$DailyLogImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        moodEnergy: freezed == moodEnergy
            ? _value.moodEnergy
            : moodEnergy // ignore: cast_nullable_to_non_nullable
                  as int?,
        hunger: freezed == hunger
            ? _value.hunger
            : hunger // ignore: cast_nullable_to_non_nullable
                  as int?,
        stress: freezed == stress
            ? _value.stress
            : stress // ignore: cast_nullable_to_non_nullable
                  as int?,
        symptoms: null == symptoms
            ? _value._symptoms
            : symptoms // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyLogImpl implements _DailyLog {
  const _$DailyLogImpl({
    required this.id,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    this.weight,
    this.notes,
    this.moodEnergy,
    this.hunger,
    this.stress,
    final List<String> symptoms = const [],
  }) : _symptoms = symptoms;

  factory _$DailyLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyLogImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final double? weight;
  // in kg
  @override
  final String? notes;
  @override
  final int? moodEnergy;
  // 1-5
  @override
  final int? hunger;
  // 1-5
  @override
  final int? stress;
  // 1-5
  final List<String> _symptoms;
  // 1-5
  @override
  @JsonKey()
  List<String> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  @override
  String toString() {
    return 'DailyLog(id: $id, date: $date, createdAt: $createdAt, updatedAt: $updatedAt, weight: $weight, notes: $notes, moodEnergy: $moodEnergy, hunger: $hunger, stress: $stress, symptoms: $symptoms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.moodEnergy, moodEnergy) ||
                other.moodEnergy == moodEnergy) &&
            (identical(other.hunger, hunger) || other.hunger == hunger) &&
            (identical(other.stress, stress) || other.stress == stress) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    createdAt,
    updatedAt,
    weight,
    notes,
    moodEnergy,
    hunger,
    stress,
    const DeepCollectionEquality().hash(_symptoms),
  );

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyLogImplCopyWith<_$DailyLogImpl> get copyWith =>
      __$$DailyLogImplCopyWithImpl<_$DailyLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyLogImplToJson(this);
  }
}

abstract class _DailyLog implements DailyLog {
  const factory _DailyLog({
    required final String id,
    required final DateTime date,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final double? weight,
    final String? notes,
    final int? moodEnergy,
    final int? hunger,
    final int? stress,
    final List<String> symptoms,
  }) = _$DailyLogImpl;

  factory _DailyLog.fromJson(Map<String, dynamic> json) =
      _$DailyLogImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  double? get weight; // in kg
  @override
  String? get notes;
  @override
  int? get moodEnergy; // 1-5
  @override
  int? get hunger; // 1-5
  @override
  int? get stress; // 1-5
  @override
  List<String> get symptoms;

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyLogImplCopyWith<_$DailyLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MeasurementLog _$MeasurementLogFromJson(Map<String, dynamic> json) {
  return _MeasurementLog.fromJson(json);
}

/// @nodoc
mixin _$MeasurementLog {
  String get id => throw _privateConstructorUsedError;
  String get dailyLogId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double? get waist => throw _privateConstructorUsedError; // in cm
  double? get chest => throw _privateConstructorUsedError; // in cm
  double? get hip => throw _privateConstructorUsedError; // in cm
  double? get thigh => throw _privateConstructorUsedError; // in cm
  double? get arm => throw _privateConstructorUsedError;

  /// Serializes this MeasurementLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeasurementLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeasurementLogCopyWith<MeasurementLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementLogCopyWith<$Res> {
  factory $MeasurementLogCopyWith(
    MeasurementLog value,
    $Res Function(MeasurementLog) then,
  ) = _$MeasurementLogCopyWithImpl<$Res, MeasurementLog>;
  @useResult
  $Res call({
    String id,
    String dailyLogId,
    DateTime date,
    double? waist,
    double? chest,
    double? hip,
    double? thigh,
    double? arm,
  });
}

/// @nodoc
class _$MeasurementLogCopyWithImpl<$Res, $Val extends MeasurementLog>
    implements $MeasurementLogCopyWith<$Res> {
  _$MeasurementLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeasurementLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dailyLogId = null,
    Object? date = null,
    Object? waist = freezed,
    Object? chest = freezed,
    Object? hip = freezed,
    Object? thigh = freezed,
    Object? arm = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            dailyLogId: null == dailyLogId
                ? _value.dailyLogId
                : dailyLogId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            waist: freezed == waist
                ? _value.waist
                : waist // ignore: cast_nullable_to_non_nullable
                      as double?,
            chest: freezed == chest
                ? _value.chest
                : chest // ignore: cast_nullable_to_non_nullable
                      as double?,
            hip: freezed == hip
                ? _value.hip
                : hip // ignore: cast_nullable_to_non_nullable
                      as double?,
            thigh: freezed == thigh
                ? _value.thigh
                : thigh // ignore: cast_nullable_to_non_nullable
                      as double?,
            arm: freezed == arm
                ? _value.arm
                : arm // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MeasurementLogImplCopyWith<$Res>
    implements $MeasurementLogCopyWith<$Res> {
  factory _$$MeasurementLogImplCopyWith(
    _$MeasurementLogImpl value,
    $Res Function(_$MeasurementLogImpl) then,
  ) = __$$MeasurementLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String dailyLogId,
    DateTime date,
    double? waist,
    double? chest,
    double? hip,
    double? thigh,
    double? arm,
  });
}

/// @nodoc
class __$$MeasurementLogImplCopyWithImpl<$Res>
    extends _$MeasurementLogCopyWithImpl<$Res, _$MeasurementLogImpl>
    implements _$$MeasurementLogImplCopyWith<$Res> {
  __$$MeasurementLogImplCopyWithImpl(
    _$MeasurementLogImpl _value,
    $Res Function(_$MeasurementLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MeasurementLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dailyLogId = null,
    Object? date = null,
    Object? waist = freezed,
    Object? chest = freezed,
    Object? hip = freezed,
    Object? thigh = freezed,
    Object? arm = freezed,
  }) {
    return _then(
      _$MeasurementLogImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyLogId: null == dailyLogId
            ? _value.dailyLogId
            : dailyLogId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        waist: freezed == waist
            ? _value.waist
            : waist // ignore: cast_nullable_to_non_nullable
                  as double?,
        chest: freezed == chest
            ? _value.chest
            : chest // ignore: cast_nullable_to_non_nullable
                  as double?,
        hip: freezed == hip
            ? _value.hip
            : hip // ignore: cast_nullable_to_non_nullable
                  as double?,
        thigh: freezed == thigh
            ? _value.thigh
            : thigh // ignore: cast_nullable_to_non_nullable
                  as double?,
        arm: freezed == arm
            ? _value.arm
            : arm // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MeasurementLogImpl implements _MeasurementLog {
  const _$MeasurementLogImpl({
    required this.id,
    required this.dailyLogId,
    required this.date,
    this.waist,
    this.chest,
    this.hip,
    this.thigh,
    this.arm,
  });

  factory _$MeasurementLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeasurementLogImplFromJson(json);

  @override
  final String id;
  @override
  final String dailyLogId;
  @override
  final DateTime date;
  @override
  final double? waist;
  // in cm
  @override
  final double? chest;
  // in cm
  @override
  final double? hip;
  // in cm
  @override
  final double? thigh;
  // in cm
  @override
  final double? arm;

  @override
  String toString() {
    return 'MeasurementLog(id: $id, dailyLogId: $dailyLogId, date: $date, waist: $waist, chest: $chest, hip: $hip, thigh: $thigh, arm: $arm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurementLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dailyLogId, dailyLogId) ||
                other.dailyLogId == dailyLogId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.waist, waist) || other.waist == waist) &&
            (identical(other.chest, chest) || other.chest == chest) &&
            (identical(other.hip, hip) || other.hip == hip) &&
            (identical(other.thigh, thigh) || other.thigh == thigh) &&
            (identical(other.arm, arm) || other.arm == arm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    dailyLogId,
    date,
    waist,
    chest,
    hip,
    thigh,
    arm,
  );

  /// Create a copy of MeasurementLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeasurementLogImplCopyWith<_$MeasurementLogImpl> get copyWith =>
      __$$MeasurementLogImplCopyWithImpl<_$MeasurementLogImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MeasurementLogImplToJson(this);
  }
}

abstract class _MeasurementLog implements MeasurementLog {
  const factory _MeasurementLog({
    required final String id,
    required final String dailyLogId,
    required final DateTime date,
    final double? waist,
    final double? chest,
    final double? hip,
    final double? thigh,
    final double? arm,
  }) = _$MeasurementLogImpl;

  factory _MeasurementLog.fromJson(Map<String, dynamic> json) =
      _$MeasurementLogImpl.fromJson;

  @override
  String get id;
  @override
  String get dailyLogId;
  @override
  DateTime get date;
  @override
  double? get waist; // in cm
  @override
  double? get chest; // in cm
  @override
  double? get hip; // in cm
  @override
  double? get thigh; // in cm
  @override
  double? get arm;

  /// Create a copy of MeasurementLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeasurementLogImplCopyWith<_$MeasurementLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealLog _$MealLogFromJson(Map<String, dynamic> json) {
  return _MealLog.fromJson(json);
}

/// @nodoc
mixin _$MealLog {
  String get id => throw _privateConstructorUsedError;
  String get dailyLogId => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  MealLogMethod get method => throw _privateConstructorUsedError;
  String? get photoUri => throw _privateConstructorUsedError;
  String? get templateId => throw _privateConstructorUsedError;
  String? get aiAnalysisId => throw _privateConstructorUsedError;
  List<MealItem> get items => throw _privateConstructorUsedError;

  /// Serializes this MealLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealLogCopyWith<MealLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealLogCopyWith<$Res> {
  factory $MealLogCopyWith(MealLog value, $Res Function(MealLog) then) =
      _$MealLogCopyWithImpl<$Res, MealLog>;
  @useResult
  $Res call({
    String id,
    String dailyLogId,
    DateTime time,
    DateTime createdAt,
    MealLogMethod method,
    String? photoUri,
    String? templateId,
    String? aiAnalysisId,
    List<MealItem> items,
  });
}

/// @nodoc
class _$MealLogCopyWithImpl<$Res, $Val extends MealLog>
    implements $MealLogCopyWith<$Res> {
  _$MealLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dailyLogId = null,
    Object? time = null,
    Object? createdAt = null,
    Object? method = null,
    Object? photoUri = freezed,
    Object? templateId = freezed,
    Object? aiAnalysisId = freezed,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            dailyLogId: null == dailyLogId
                ? _value.dailyLogId
                : dailyLogId // ignore: cast_nullable_to_non_nullable
                      as String,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            method: null == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                      as MealLogMethod,
            photoUri: freezed == photoUri
                ? _value.photoUri
                : photoUri // ignore: cast_nullable_to_non_nullable
                      as String?,
            templateId: freezed == templateId
                ? _value.templateId
                : templateId // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiAnalysisId: freezed == aiAnalysisId
                ? _value.aiAnalysisId
                : aiAnalysisId // ignore: cast_nullable_to_non_nullable
                      as String?,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<MealItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MealLogImplCopyWith<$Res> implements $MealLogCopyWith<$Res> {
  factory _$$MealLogImplCopyWith(
    _$MealLogImpl value,
    $Res Function(_$MealLogImpl) then,
  ) = __$$MealLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String dailyLogId,
    DateTime time,
    DateTime createdAt,
    MealLogMethod method,
    String? photoUri,
    String? templateId,
    String? aiAnalysisId,
    List<MealItem> items,
  });
}

/// @nodoc
class __$$MealLogImplCopyWithImpl<$Res>
    extends _$MealLogCopyWithImpl<$Res, _$MealLogImpl>
    implements _$$MealLogImplCopyWith<$Res> {
  __$$MealLogImplCopyWithImpl(
    _$MealLogImpl _value,
    $Res Function(_$MealLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dailyLogId = null,
    Object? time = null,
    Object? createdAt = null,
    Object? method = null,
    Object? photoUri = freezed,
    Object? templateId = freezed,
    Object? aiAnalysisId = freezed,
    Object? items = null,
  }) {
    return _then(
      _$MealLogImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyLogId: null == dailyLogId
            ? _value.dailyLogId
            : dailyLogId // ignore: cast_nullable_to_non_nullable
                  as String,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        method: null == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as MealLogMethod,
        photoUri: freezed == photoUri
            ? _value.photoUri
            : photoUri // ignore: cast_nullable_to_non_nullable
                  as String?,
        templateId: freezed == templateId
            ? _value.templateId
            : templateId // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiAnalysisId: freezed == aiAnalysisId
            ? _value.aiAnalysisId
            : aiAnalysisId // ignore: cast_nullable_to_non_nullable
                  as String?,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<MealItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MealLogImpl implements _MealLog {
  const _$MealLogImpl({
    required this.id,
    required this.dailyLogId,
    required this.time,
    required this.createdAt,
    required this.method,
    this.photoUri,
    this.templateId,
    this.aiAnalysisId,
    final List<MealItem> items = const [],
  }) : _items = items;

  factory _$MealLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealLogImplFromJson(json);

  @override
  final String id;
  @override
  final String dailyLogId;
  @override
  final DateTime time;
  @override
  final DateTime createdAt;
  @override
  final MealLogMethod method;
  @override
  final String? photoUri;
  @override
  final String? templateId;
  @override
  final String? aiAnalysisId;
  final List<MealItem> _items;
  @override
  @JsonKey()
  List<MealItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'MealLog(id: $id, dailyLogId: $dailyLogId, time: $time, createdAt: $createdAt, method: $method, photoUri: $photoUri, templateId: $templateId, aiAnalysisId: $aiAnalysisId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dailyLogId, dailyLogId) ||
                other.dailyLogId == dailyLogId) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.photoUri, photoUri) ||
                other.photoUri == photoUri) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.aiAnalysisId, aiAnalysisId) ||
                other.aiAnalysisId == aiAnalysisId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    dailyLogId,
    time,
    createdAt,
    method,
    photoUri,
    templateId,
    aiAnalysisId,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of MealLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealLogImplCopyWith<_$MealLogImpl> get copyWith =>
      __$$MealLogImplCopyWithImpl<_$MealLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealLogImplToJson(this);
  }
}

abstract class _MealLog implements MealLog {
  const factory _MealLog({
    required final String id,
    required final String dailyLogId,
    required final DateTime time,
    required final DateTime createdAt,
    required final MealLogMethod method,
    final String? photoUri,
    final String? templateId,
    final String? aiAnalysisId,
    final List<MealItem> items,
  }) = _$MealLogImpl;

  factory _MealLog.fromJson(Map<String, dynamic> json) = _$MealLogImpl.fromJson;

  @override
  String get id;
  @override
  String get dailyLogId;
  @override
  DateTime get time;
  @override
  DateTime get createdAt;
  @override
  MealLogMethod get method;
  @override
  String? get photoUri;
  @override
  String? get templateId;
  @override
  String? get aiAnalysisId;
  @override
  List<MealItem> get items;

  /// Create a copy of MealLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealLogImplCopyWith<_$MealLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealItem _$MealItemFromJson(Map<String, dynamic> json) {
  return _MealItem.fromJson(json);
}

/// @nodoc
mixin _$MealItem {
  String get id => throw _privateConstructorUsedError;
  String get mealLogId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get portion => throw _privateConstructorUsedError;
  int? get caloriesEstimate => throw _privateConstructorUsedError;
  int? get proteinEstimate => throw _privateConstructorUsedError; // in grams
  int? get carbsEstimate => throw _privateConstructorUsedError; // in grams
  int? get fatEstimate => throw _privateConstructorUsedError; // in grams
  bool get isAiEstimate => throw _privateConstructorUsedError;
  bool get isUserEdited => throw _privateConstructorUsedError;
  int? get confidence => throw _privateConstructorUsedError;

  /// Serializes this MealItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealItemCopyWith<MealItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealItemCopyWith<$Res> {
  factory $MealItemCopyWith(MealItem value, $Res Function(MealItem) then) =
      _$MealItemCopyWithImpl<$Res, MealItem>;
  @useResult
  $Res call({
    String id,
    String mealLogId,
    String name,
    String? portion,
    int? caloriesEstimate,
    int? proteinEstimate,
    int? carbsEstimate,
    int? fatEstimate,
    bool isAiEstimate,
    bool isUserEdited,
    int? confidence,
  });
}

/// @nodoc
class _$MealItemCopyWithImpl<$Res, $Val extends MealItem>
    implements $MealItemCopyWith<$Res> {
  _$MealItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mealLogId = null,
    Object? name = null,
    Object? portion = freezed,
    Object? caloriesEstimate = freezed,
    Object? proteinEstimate = freezed,
    Object? carbsEstimate = freezed,
    Object? fatEstimate = freezed,
    Object? isAiEstimate = null,
    Object? isUserEdited = null,
    Object? confidence = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            mealLogId: null == mealLogId
                ? _value.mealLogId
                : mealLogId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            portion: freezed == portion
                ? _value.portion
                : portion // ignore: cast_nullable_to_non_nullable
                      as String?,
            caloriesEstimate: freezed == caloriesEstimate
                ? _value.caloriesEstimate
                : caloriesEstimate // ignore: cast_nullable_to_non_nullable
                      as int?,
            proteinEstimate: freezed == proteinEstimate
                ? _value.proteinEstimate
                : proteinEstimate // ignore: cast_nullable_to_non_nullable
                      as int?,
            carbsEstimate: freezed == carbsEstimate
                ? _value.carbsEstimate
                : carbsEstimate // ignore: cast_nullable_to_non_nullable
                      as int?,
            fatEstimate: freezed == fatEstimate
                ? _value.fatEstimate
                : fatEstimate // ignore: cast_nullable_to_non_nullable
                      as int?,
            isAiEstimate: null == isAiEstimate
                ? _value.isAiEstimate
                : isAiEstimate // ignore: cast_nullable_to_non_nullable
                      as bool,
            isUserEdited: null == isUserEdited
                ? _value.isUserEdited
                : isUserEdited // ignore: cast_nullable_to_non_nullable
                      as bool,
            confidence: freezed == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MealItemImplCopyWith<$Res>
    implements $MealItemCopyWith<$Res> {
  factory _$$MealItemImplCopyWith(
    _$MealItemImpl value,
    $Res Function(_$MealItemImpl) then,
  ) = __$$MealItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String mealLogId,
    String name,
    String? portion,
    int? caloriesEstimate,
    int? proteinEstimate,
    int? carbsEstimate,
    int? fatEstimate,
    bool isAiEstimate,
    bool isUserEdited,
    int? confidence,
  });
}

/// @nodoc
class __$$MealItemImplCopyWithImpl<$Res>
    extends _$MealItemCopyWithImpl<$Res, _$MealItemImpl>
    implements _$$MealItemImplCopyWith<$Res> {
  __$$MealItemImplCopyWithImpl(
    _$MealItemImpl _value,
    $Res Function(_$MealItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mealLogId = null,
    Object? name = null,
    Object? portion = freezed,
    Object? caloriesEstimate = freezed,
    Object? proteinEstimate = freezed,
    Object? carbsEstimate = freezed,
    Object? fatEstimate = freezed,
    Object? isAiEstimate = null,
    Object? isUserEdited = null,
    Object? confidence = freezed,
  }) {
    return _then(
      _$MealItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        mealLogId: null == mealLogId
            ? _value.mealLogId
            : mealLogId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        portion: freezed == portion
            ? _value.portion
            : portion // ignore: cast_nullable_to_non_nullable
                  as String?,
        caloriesEstimate: freezed == caloriesEstimate
            ? _value.caloriesEstimate
            : caloriesEstimate // ignore: cast_nullable_to_non_nullable
                  as int?,
        proteinEstimate: freezed == proteinEstimate
            ? _value.proteinEstimate
            : proteinEstimate // ignore: cast_nullable_to_non_nullable
                  as int?,
        carbsEstimate: freezed == carbsEstimate
            ? _value.carbsEstimate
            : carbsEstimate // ignore: cast_nullable_to_non_nullable
                  as int?,
        fatEstimate: freezed == fatEstimate
            ? _value.fatEstimate
            : fatEstimate // ignore: cast_nullable_to_non_nullable
                  as int?,
        isAiEstimate: null == isAiEstimate
            ? _value.isAiEstimate
            : isAiEstimate // ignore: cast_nullable_to_non_nullable
                  as bool,
        isUserEdited: null == isUserEdited
            ? _value.isUserEdited
            : isUserEdited // ignore: cast_nullable_to_non_nullable
                  as bool,
        confidence: freezed == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MealItemImpl implements _MealItem {
  const _$MealItemImpl({
    required this.id,
    required this.mealLogId,
    required this.name,
    this.portion,
    this.caloriesEstimate,
    this.proteinEstimate,
    this.carbsEstimate,
    this.fatEstimate,
    this.isAiEstimate = false,
    this.isUserEdited = false,
    this.confidence,
  });

  factory _$MealItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealItemImplFromJson(json);

  @override
  final String id;
  @override
  final String mealLogId;
  @override
  final String name;
  @override
  final String? portion;
  @override
  final int? caloriesEstimate;
  @override
  final int? proteinEstimate;
  // in grams
  @override
  final int? carbsEstimate;
  // in grams
  @override
  final int? fatEstimate;
  // in grams
  @override
  @JsonKey()
  final bool isAiEstimate;
  @override
  @JsonKey()
  final bool isUserEdited;
  @override
  final int? confidence;

  @override
  String toString() {
    return 'MealItem(id: $id, mealLogId: $mealLogId, name: $name, portion: $portion, caloriesEstimate: $caloriesEstimate, proteinEstimate: $proteinEstimate, carbsEstimate: $carbsEstimate, fatEstimate: $fatEstimate, isAiEstimate: $isAiEstimate, isUserEdited: $isUserEdited, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mealLogId, mealLogId) ||
                other.mealLogId == mealLogId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.portion, portion) || other.portion == portion) &&
            (identical(other.caloriesEstimate, caloriesEstimate) ||
                other.caloriesEstimate == caloriesEstimate) &&
            (identical(other.proteinEstimate, proteinEstimate) ||
                other.proteinEstimate == proteinEstimate) &&
            (identical(other.carbsEstimate, carbsEstimate) ||
                other.carbsEstimate == carbsEstimate) &&
            (identical(other.fatEstimate, fatEstimate) ||
                other.fatEstimate == fatEstimate) &&
            (identical(other.isAiEstimate, isAiEstimate) ||
                other.isAiEstimate == isAiEstimate) &&
            (identical(other.isUserEdited, isUserEdited) ||
                other.isUserEdited == isUserEdited) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    mealLogId,
    name,
    portion,
    caloriesEstimate,
    proteinEstimate,
    carbsEstimate,
    fatEstimate,
    isAiEstimate,
    isUserEdited,
    confidence,
  );

  /// Create a copy of MealItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealItemImplCopyWith<_$MealItemImpl> get copyWith =>
      __$$MealItemImplCopyWithImpl<_$MealItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealItemImplToJson(this);
  }
}

abstract class _MealItem implements MealItem {
  const factory _MealItem({
    required final String id,
    required final String mealLogId,
    required final String name,
    final String? portion,
    final int? caloriesEstimate,
    final int? proteinEstimate,
    final int? carbsEstimate,
    final int? fatEstimate,
    final bool isAiEstimate,
    final bool isUserEdited,
    final int? confidence,
  }) = _$MealItemImpl;

  factory _MealItem.fromJson(Map<String, dynamic> json) =
      _$MealItemImpl.fromJson;

  @override
  String get id;
  @override
  String get mealLogId;
  @override
  String get name;
  @override
  String? get portion;
  @override
  int? get caloriesEstimate;
  @override
  int? get proteinEstimate; // in grams
  @override
  int? get carbsEstimate; // in grams
  @override
  int? get fatEstimate; // in grams
  @override
  bool get isAiEstimate;
  @override
  bool get isUserEdited;
  @override
  int? get confidence;

  /// Create a copy of MealItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealItemImplCopyWith<_$MealItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutLog _$WorkoutLogFromJson(Map<String, dynamic> json) {
  return _WorkoutLog.fromJson(json);
}

/// @nodoc
mixin _$WorkoutLog {
  String get id => throw _privateConstructorUsedError;
  String get dailyLogId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError; // in minutes
  int? get intensity => throw _privateConstructorUsedError; // 1-10
  String? get notes => throw _privateConstructorUsedError;
  WorkoutSource get source => throw _privateConstructorUsedError;
  int? get caloriesBurned => throw _privateConstructorUsedError;

  /// Serializes this WorkoutLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutLogCopyWith<WorkoutLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutLogCopyWith<$Res> {
  factory $WorkoutLogCopyWith(
    WorkoutLog value,
    $Res Function(WorkoutLog) then,
  ) = _$WorkoutLogCopyWithImpl<$Res, WorkoutLog>;
  @useResult
  $Res call({
    String id,
    String dailyLogId,
    DateTime date,
    String type,
    int duration,
    int? intensity,
    String? notes,
    WorkoutSource source,
    int? caloriesBurned,
  });
}

/// @nodoc
class _$WorkoutLogCopyWithImpl<$Res, $Val extends WorkoutLog>
    implements $WorkoutLogCopyWith<$Res> {
  _$WorkoutLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dailyLogId = null,
    Object? date = null,
    Object? type = null,
    Object? duration = null,
    Object? intensity = freezed,
    Object? notes = freezed,
    Object? source = null,
    Object? caloriesBurned = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            dailyLogId: null == dailyLogId
                ? _value.dailyLogId
                : dailyLogId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
            intensity: freezed == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                      as int?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as WorkoutSource,
            caloriesBurned: freezed == caloriesBurned
                ? _value.caloriesBurned
                : caloriesBurned // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutLogImplCopyWith<$Res>
    implements $WorkoutLogCopyWith<$Res> {
  factory _$$WorkoutLogImplCopyWith(
    _$WorkoutLogImpl value,
    $Res Function(_$WorkoutLogImpl) then,
  ) = __$$WorkoutLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String dailyLogId,
    DateTime date,
    String type,
    int duration,
    int? intensity,
    String? notes,
    WorkoutSource source,
    int? caloriesBurned,
  });
}

/// @nodoc
class __$$WorkoutLogImplCopyWithImpl<$Res>
    extends _$WorkoutLogCopyWithImpl<$Res, _$WorkoutLogImpl>
    implements _$$WorkoutLogImplCopyWith<$Res> {
  __$$WorkoutLogImplCopyWithImpl(
    _$WorkoutLogImpl _value,
    $Res Function(_$WorkoutLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dailyLogId = null,
    Object? date = null,
    Object? type = null,
    Object? duration = null,
    Object? intensity = freezed,
    Object? notes = freezed,
    Object? source = null,
    Object? caloriesBurned = freezed,
  }) {
    return _then(
      _$WorkoutLogImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyLogId: null == dailyLogId
            ? _value.dailyLogId
            : dailyLogId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        intensity: freezed == intensity
            ? _value.intensity
            : intensity // ignore: cast_nullable_to_non_nullable
                  as int?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as WorkoutSource,
        caloriesBurned: freezed == caloriesBurned
            ? _value.caloriesBurned
            : caloriesBurned // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutLogImpl implements _WorkoutLog {
  const _$WorkoutLogImpl({
    required this.id,
    required this.dailyLogId,
    required this.date,
    required this.type,
    required this.duration,
    this.intensity,
    this.notes,
    required this.source,
    this.caloriesBurned,
  });

  factory _$WorkoutLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutLogImplFromJson(json);

  @override
  final String id;
  @override
  final String dailyLogId;
  @override
  final DateTime date;
  @override
  final String type;
  @override
  final int duration;
  // in minutes
  @override
  final int? intensity;
  // 1-10
  @override
  final String? notes;
  @override
  final WorkoutSource source;
  @override
  final int? caloriesBurned;

  @override
  String toString() {
    return 'WorkoutLog(id: $id, dailyLogId: $dailyLogId, date: $date, type: $type, duration: $duration, intensity: $intensity, notes: $notes, source: $source, caloriesBurned: $caloriesBurned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dailyLogId, dailyLogId) ||
                other.dailyLogId == dailyLogId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    dailyLogId,
    date,
    type,
    duration,
    intensity,
    notes,
    source,
    caloriesBurned,
  );

  /// Create a copy of WorkoutLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutLogImplCopyWith<_$WorkoutLogImpl> get copyWith =>
      __$$WorkoutLogImplCopyWithImpl<_$WorkoutLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutLogImplToJson(this);
  }
}

abstract class _WorkoutLog implements WorkoutLog {
  const factory _WorkoutLog({
    required final String id,
    required final String dailyLogId,
    required final DateTime date,
    required final String type,
    required final int duration,
    final int? intensity,
    final String? notes,
    required final WorkoutSource source,
    final int? caloriesBurned,
  }) = _$WorkoutLogImpl;

  factory _WorkoutLog.fromJson(Map<String, dynamic> json) =
      _$WorkoutLogImpl.fromJson;

  @override
  String get id;
  @override
  String get dailyLogId;
  @override
  DateTime get date;
  @override
  String get type;
  @override
  int get duration; // in minutes
  @override
  int? get intensity; // 1-10
  @override
  String? get notes;
  @override
  WorkoutSource get source;
  @override
  int? get caloriesBurned;

  /// Create a copy of WorkoutLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutLogImplCopyWith<_$WorkoutLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
