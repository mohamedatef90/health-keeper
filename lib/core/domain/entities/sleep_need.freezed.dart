// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_need.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SleepNeed _$SleepNeedFromJson(Map<String, dynamic> json) {
  return _SleepNeed.fromJson(json);
}

/// @nodoc
mixin _$SleepNeed {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Base sleep need (typically 7-8 hours)
  double get baseNeed => throw _privateConstructorUsedError;

  /// Additional sleep needed to pay off sleep debt
  double get debtPayback => throw _privateConstructorUsedError;

  /// Additional sleep needed based on strain
  double get strainAdjustment => throw _privateConstructorUsedError;

  /// Total recommended sleep (hours)
  double get totalNeed => throw _privateConstructorUsedError;

  /// Actual sleep achieved (hours, if available)
  double? get actualSleep => throw _privateConstructorUsedError;

  /// Sleep debt accumulated (hours)
  double get sleepDebt => throw _privateConstructorUsedError;

  /// Today's strain score (0-21)
  double get strainScore => throw _privateConstructorUsedError;

  /// Recommended bedtime
  DateTime? get recommendedBedtime => throw _privateConstructorUsedError;

  /// Recommended wake time
  DateTime? get recommendedWakeTime => throw _privateConstructorUsedError;

  /// Serializes this SleepNeed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepNeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepNeedCopyWith<SleepNeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepNeedCopyWith<$Res> {
  factory $SleepNeedCopyWith(SleepNeed value, $Res Function(SleepNeed) then) =
      _$SleepNeedCopyWithImpl<$Res, SleepNeed>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime calculatedAt,
    double baseNeed,
    double debtPayback,
    double strainAdjustment,
    double totalNeed,
    double? actualSleep,
    double sleepDebt,
    double strainScore,
    DateTime? recommendedBedtime,
    DateTime? recommendedWakeTime,
  });
}

/// @nodoc
class _$SleepNeedCopyWithImpl<$Res, $Val extends SleepNeed>
    implements $SleepNeedCopyWith<$Res> {
  _$SleepNeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepNeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? calculatedAt = null,
    Object? baseNeed = null,
    Object? debtPayback = null,
    Object? strainAdjustment = null,
    Object? totalNeed = null,
    Object? actualSleep = freezed,
    Object? sleepDebt = null,
    Object? strainScore = null,
    Object? recommendedBedtime = freezed,
    Object? recommendedWakeTime = freezed,
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
            calculatedAt: null == calculatedAt
                ? _value.calculatedAt
                : calculatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            baseNeed: null == baseNeed
                ? _value.baseNeed
                : baseNeed // ignore: cast_nullable_to_non_nullable
                      as double,
            debtPayback: null == debtPayback
                ? _value.debtPayback
                : debtPayback // ignore: cast_nullable_to_non_nullable
                      as double,
            strainAdjustment: null == strainAdjustment
                ? _value.strainAdjustment
                : strainAdjustment // ignore: cast_nullable_to_non_nullable
                      as double,
            totalNeed: null == totalNeed
                ? _value.totalNeed
                : totalNeed // ignore: cast_nullable_to_non_nullable
                      as double,
            actualSleep: freezed == actualSleep
                ? _value.actualSleep
                : actualSleep // ignore: cast_nullable_to_non_nullable
                      as double?,
            sleepDebt: null == sleepDebt
                ? _value.sleepDebt
                : sleepDebt // ignore: cast_nullable_to_non_nullable
                      as double,
            strainScore: null == strainScore
                ? _value.strainScore
                : strainScore // ignore: cast_nullable_to_non_nullable
                      as double,
            recommendedBedtime: freezed == recommendedBedtime
                ? _value.recommendedBedtime
                : recommendedBedtime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            recommendedWakeTime: freezed == recommendedWakeTime
                ? _value.recommendedWakeTime
                : recommendedWakeTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SleepNeedImplCopyWith<$Res>
    implements $SleepNeedCopyWith<$Res> {
  factory _$$SleepNeedImplCopyWith(
    _$SleepNeedImpl value,
    $Res Function(_$SleepNeedImpl) then,
  ) = __$$SleepNeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime calculatedAt,
    double baseNeed,
    double debtPayback,
    double strainAdjustment,
    double totalNeed,
    double? actualSleep,
    double sleepDebt,
    double strainScore,
    DateTime? recommendedBedtime,
    DateTime? recommendedWakeTime,
  });
}

/// @nodoc
class __$$SleepNeedImplCopyWithImpl<$Res>
    extends _$SleepNeedCopyWithImpl<$Res, _$SleepNeedImpl>
    implements _$$SleepNeedImplCopyWith<$Res> {
  __$$SleepNeedImplCopyWithImpl(
    _$SleepNeedImpl _value,
    $Res Function(_$SleepNeedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SleepNeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? calculatedAt = null,
    Object? baseNeed = null,
    Object? debtPayback = null,
    Object? strainAdjustment = null,
    Object? totalNeed = null,
    Object? actualSleep = freezed,
    Object? sleepDebt = null,
    Object? strainScore = null,
    Object? recommendedBedtime = freezed,
    Object? recommendedWakeTime = freezed,
  }) {
    return _then(
      _$SleepNeedImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        calculatedAt: null == calculatedAt
            ? _value.calculatedAt
            : calculatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        baseNeed: null == baseNeed
            ? _value.baseNeed
            : baseNeed // ignore: cast_nullable_to_non_nullable
                  as double,
        debtPayback: null == debtPayback
            ? _value.debtPayback
            : debtPayback // ignore: cast_nullable_to_non_nullable
                  as double,
        strainAdjustment: null == strainAdjustment
            ? _value.strainAdjustment
            : strainAdjustment // ignore: cast_nullable_to_non_nullable
                  as double,
        totalNeed: null == totalNeed
            ? _value.totalNeed
            : totalNeed // ignore: cast_nullable_to_non_nullable
                  as double,
        actualSleep: freezed == actualSleep
            ? _value.actualSleep
            : actualSleep // ignore: cast_nullable_to_non_nullable
                  as double?,
        sleepDebt: null == sleepDebt
            ? _value.sleepDebt
            : sleepDebt // ignore: cast_nullable_to_non_nullable
                  as double,
        strainScore: null == strainScore
            ? _value.strainScore
            : strainScore // ignore: cast_nullable_to_non_nullable
                  as double,
        recommendedBedtime: freezed == recommendedBedtime
            ? _value.recommendedBedtime
            : recommendedBedtime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        recommendedWakeTime: freezed == recommendedWakeTime
            ? _value.recommendedWakeTime
            : recommendedWakeTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepNeedImpl extends _SleepNeed {
  const _$SleepNeedImpl({
    required this.id,
    required this.date,
    required this.calculatedAt,
    required this.baseNeed,
    required this.debtPayback,
    required this.strainAdjustment,
    required this.totalNeed,
    this.actualSleep,
    required this.sleepDebt,
    required this.strainScore,
    this.recommendedBedtime,
    this.recommendedWakeTime,
  }) : super._();

  factory _$SleepNeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepNeedImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime calculatedAt;

  /// Base sleep need (typically 7-8 hours)
  @override
  final double baseNeed;

  /// Additional sleep needed to pay off sleep debt
  @override
  final double debtPayback;

  /// Additional sleep needed based on strain
  @override
  final double strainAdjustment;

  /// Total recommended sleep (hours)
  @override
  final double totalNeed;

  /// Actual sleep achieved (hours, if available)
  @override
  final double? actualSleep;

  /// Sleep debt accumulated (hours)
  @override
  final double sleepDebt;

  /// Today's strain score (0-21)
  @override
  final double strainScore;

  /// Recommended bedtime
  @override
  final DateTime? recommendedBedtime;

  /// Recommended wake time
  @override
  final DateTime? recommendedWakeTime;

  @override
  String toString() {
    return 'SleepNeed(id: $id, date: $date, calculatedAt: $calculatedAt, baseNeed: $baseNeed, debtPayback: $debtPayback, strainAdjustment: $strainAdjustment, totalNeed: $totalNeed, actualSleep: $actualSleep, sleepDebt: $sleepDebt, strainScore: $strainScore, recommendedBedtime: $recommendedBedtime, recommendedWakeTime: $recommendedWakeTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepNeedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt) &&
            (identical(other.baseNeed, baseNeed) ||
                other.baseNeed == baseNeed) &&
            (identical(other.debtPayback, debtPayback) ||
                other.debtPayback == debtPayback) &&
            (identical(other.strainAdjustment, strainAdjustment) ||
                other.strainAdjustment == strainAdjustment) &&
            (identical(other.totalNeed, totalNeed) ||
                other.totalNeed == totalNeed) &&
            (identical(other.actualSleep, actualSleep) ||
                other.actualSleep == actualSleep) &&
            (identical(other.sleepDebt, sleepDebt) ||
                other.sleepDebt == sleepDebt) &&
            (identical(other.strainScore, strainScore) ||
                other.strainScore == strainScore) &&
            (identical(other.recommendedBedtime, recommendedBedtime) ||
                other.recommendedBedtime == recommendedBedtime) &&
            (identical(other.recommendedWakeTime, recommendedWakeTime) ||
                other.recommendedWakeTime == recommendedWakeTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    calculatedAt,
    baseNeed,
    debtPayback,
    strainAdjustment,
    totalNeed,
    actualSleep,
    sleepDebt,
    strainScore,
    recommendedBedtime,
    recommendedWakeTime,
  );

  /// Create a copy of SleepNeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepNeedImplCopyWith<_$SleepNeedImpl> get copyWith =>
      __$$SleepNeedImplCopyWithImpl<_$SleepNeedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepNeedImplToJson(this);
  }
}

abstract class _SleepNeed extends SleepNeed {
  const factory _SleepNeed({
    required final String id,
    required final DateTime date,
    required final DateTime calculatedAt,
    required final double baseNeed,
    required final double debtPayback,
    required final double strainAdjustment,
    required final double totalNeed,
    final double? actualSleep,
    required final double sleepDebt,
    required final double strainScore,
    final DateTime? recommendedBedtime,
    final DateTime? recommendedWakeTime,
  }) = _$SleepNeedImpl;
  const _SleepNeed._() : super._();

  factory _SleepNeed.fromJson(Map<String, dynamic> json) =
      _$SleepNeedImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get calculatedAt;

  /// Base sleep need (typically 7-8 hours)
  @override
  double get baseNeed;

  /// Additional sleep needed to pay off sleep debt
  @override
  double get debtPayback;

  /// Additional sleep needed based on strain
  @override
  double get strainAdjustment;

  /// Total recommended sleep (hours)
  @override
  double get totalNeed;

  /// Actual sleep achieved (hours, if available)
  @override
  double? get actualSleep;

  /// Sleep debt accumulated (hours)
  @override
  double get sleepDebt;

  /// Today's strain score (0-21)
  @override
  double get strainScore;

  /// Recommended bedtime
  @override
  DateTime? get recommendedBedtime;

  /// Recommended wake time
  @override
  DateTime? get recommendedWakeTime;

  /// Create a copy of SleepNeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepNeedImplCopyWith<_$SleepNeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SleepDebtTracker _$SleepDebtTrackerFromJson(Map<String, dynamic> json) {
  return _SleepDebtTracker.fromJson(json);
}

/// @nodoc
mixin _$SleepDebtTracker {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Total accumulated sleep debt (hours)
  double get totalDebt => throw _privateConstructorUsedError;

  /// Sleep debt from last 7 days
  List<DailySleepRecord> get recentRecords =>
      throw _privateConstructorUsedError;

  /// Average nightly deficit over 7 days
  double get avgNightlyDeficit => throw _privateConstructorUsedError;

  /// Days to recover if sleeping optimally
  int get estimatedRecoveryDays => throw _privateConstructorUsedError;

  /// Serializes this SleepDebtTracker to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepDebtTracker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepDebtTrackerCopyWith<SleepDebtTracker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepDebtTrackerCopyWith<$Res> {
  factory $SleepDebtTrackerCopyWith(
    SleepDebtTracker value,
    $Res Function(SleepDebtTracker) then,
  ) = _$SleepDebtTrackerCopyWithImpl<$Res, SleepDebtTracker>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    double totalDebt,
    List<DailySleepRecord> recentRecords,
    double avgNightlyDeficit,
    int estimatedRecoveryDays,
  });
}

/// @nodoc
class _$SleepDebtTrackerCopyWithImpl<$Res, $Val extends SleepDebtTracker>
    implements $SleepDebtTrackerCopyWith<$Res> {
  _$SleepDebtTrackerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepDebtTracker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? totalDebt = null,
    Object? recentRecords = null,
    Object? avgNightlyDeficit = null,
    Object? estimatedRecoveryDays = null,
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
            totalDebt: null == totalDebt
                ? _value.totalDebt
                : totalDebt // ignore: cast_nullable_to_non_nullable
                      as double,
            recentRecords: null == recentRecords
                ? _value.recentRecords
                : recentRecords // ignore: cast_nullable_to_non_nullable
                      as List<DailySleepRecord>,
            avgNightlyDeficit: null == avgNightlyDeficit
                ? _value.avgNightlyDeficit
                : avgNightlyDeficit // ignore: cast_nullable_to_non_nullable
                      as double,
            estimatedRecoveryDays: null == estimatedRecoveryDays
                ? _value.estimatedRecoveryDays
                : estimatedRecoveryDays // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SleepDebtTrackerImplCopyWith<$Res>
    implements $SleepDebtTrackerCopyWith<$Res> {
  factory _$$SleepDebtTrackerImplCopyWith(
    _$SleepDebtTrackerImpl value,
    $Res Function(_$SleepDebtTrackerImpl) then,
  ) = __$$SleepDebtTrackerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    double totalDebt,
    List<DailySleepRecord> recentRecords,
    double avgNightlyDeficit,
    int estimatedRecoveryDays,
  });
}

/// @nodoc
class __$$SleepDebtTrackerImplCopyWithImpl<$Res>
    extends _$SleepDebtTrackerCopyWithImpl<$Res, _$SleepDebtTrackerImpl>
    implements _$$SleepDebtTrackerImplCopyWith<$Res> {
  __$$SleepDebtTrackerImplCopyWithImpl(
    _$SleepDebtTrackerImpl _value,
    $Res Function(_$SleepDebtTrackerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SleepDebtTracker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? totalDebt = null,
    Object? recentRecords = null,
    Object? avgNightlyDeficit = null,
    Object? estimatedRecoveryDays = null,
  }) {
    return _then(
      _$SleepDebtTrackerImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        totalDebt: null == totalDebt
            ? _value.totalDebt
            : totalDebt // ignore: cast_nullable_to_non_nullable
                  as double,
        recentRecords: null == recentRecords
            ? _value._recentRecords
            : recentRecords // ignore: cast_nullable_to_non_nullable
                  as List<DailySleepRecord>,
        avgNightlyDeficit: null == avgNightlyDeficit
            ? _value.avgNightlyDeficit
            : avgNightlyDeficit // ignore: cast_nullable_to_non_nullable
                  as double,
        estimatedRecoveryDays: null == estimatedRecoveryDays
            ? _value.estimatedRecoveryDays
            : estimatedRecoveryDays // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepDebtTrackerImpl extends _SleepDebtTracker {
  const _$SleepDebtTrackerImpl({
    required this.id,
    required this.date,
    required this.totalDebt,
    required final List<DailySleepRecord> recentRecords,
    required this.avgNightlyDeficit,
    required this.estimatedRecoveryDays,
  }) : _recentRecords = recentRecords,
       super._();

  factory _$SleepDebtTrackerImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepDebtTrackerImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;

  /// Total accumulated sleep debt (hours)
  @override
  final double totalDebt;

  /// Sleep debt from last 7 days
  final List<DailySleepRecord> _recentRecords;

  /// Sleep debt from last 7 days
  @override
  List<DailySleepRecord> get recentRecords {
    if (_recentRecords is EqualUnmodifiableListView) return _recentRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentRecords);
  }

  /// Average nightly deficit over 7 days
  @override
  final double avgNightlyDeficit;

  /// Days to recover if sleeping optimally
  @override
  final int estimatedRecoveryDays;

  @override
  String toString() {
    return 'SleepDebtTracker(id: $id, date: $date, totalDebt: $totalDebt, recentRecords: $recentRecords, avgNightlyDeficit: $avgNightlyDeficit, estimatedRecoveryDays: $estimatedRecoveryDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepDebtTrackerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalDebt, totalDebt) ||
                other.totalDebt == totalDebt) &&
            const DeepCollectionEquality().equals(
              other._recentRecords,
              _recentRecords,
            ) &&
            (identical(other.avgNightlyDeficit, avgNightlyDeficit) ||
                other.avgNightlyDeficit == avgNightlyDeficit) &&
            (identical(other.estimatedRecoveryDays, estimatedRecoveryDays) ||
                other.estimatedRecoveryDays == estimatedRecoveryDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    totalDebt,
    const DeepCollectionEquality().hash(_recentRecords),
    avgNightlyDeficit,
    estimatedRecoveryDays,
  );

  /// Create a copy of SleepDebtTracker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepDebtTrackerImplCopyWith<_$SleepDebtTrackerImpl> get copyWith =>
      __$$SleepDebtTrackerImplCopyWithImpl<_$SleepDebtTrackerImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepDebtTrackerImplToJson(this);
  }
}

abstract class _SleepDebtTracker extends SleepDebtTracker {
  const factory _SleepDebtTracker({
    required final String id,
    required final DateTime date,
    required final double totalDebt,
    required final List<DailySleepRecord> recentRecords,
    required final double avgNightlyDeficit,
    required final int estimatedRecoveryDays,
  }) = _$SleepDebtTrackerImpl;
  const _SleepDebtTracker._() : super._();

  factory _SleepDebtTracker.fromJson(Map<String, dynamic> json) =
      _$SleepDebtTrackerImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;

  /// Total accumulated sleep debt (hours)
  @override
  double get totalDebt;

  /// Sleep debt from last 7 days
  @override
  List<DailySleepRecord> get recentRecords;

  /// Average nightly deficit over 7 days
  @override
  double get avgNightlyDeficit;

  /// Days to recover if sleeping optimally
  @override
  int get estimatedRecoveryDays;

  /// Create a copy of SleepDebtTracker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepDebtTrackerImplCopyWith<_$SleepDebtTrackerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailySleepRecord _$DailySleepRecordFromJson(Map<String, dynamic> json) {
  return _DailySleepRecord.fromJson(json);
}

/// @nodoc
mixin _$DailySleepRecord {
  DateTime get date => throw _privateConstructorUsedError;
  double get needed => throw _privateConstructorUsedError;
  double get actual => throw _privateConstructorUsedError;
  double get deficit => throw _privateConstructorUsedError;

  /// Serializes this DailySleepRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailySleepRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySleepRecordCopyWith<DailySleepRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySleepRecordCopyWith<$Res> {
  factory $DailySleepRecordCopyWith(
    DailySleepRecord value,
    $Res Function(DailySleepRecord) then,
  ) = _$DailySleepRecordCopyWithImpl<$Res, DailySleepRecord>;
  @useResult
  $Res call({DateTime date, double needed, double actual, double deficit});
}

/// @nodoc
class _$DailySleepRecordCopyWithImpl<$Res, $Val extends DailySleepRecord>
    implements $DailySleepRecordCopyWith<$Res> {
  _$DailySleepRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailySleepRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? needed = null,
    Object? actual = null,
    Object? deficit = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            needed: null == needed
                ? _value.needed
                : needed // ignore: cast_nullable_to_non_nullable
                      as double,
            actual: null == actual
                ? _value.actual
                : actual // ignore: cast_nullable_to_non_nullable
                      as double,
            deficit: null == deficit
                ? _value.deficit
                : deficit // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailySleepRecordImplCopyWith<$Res>
    implements $DailySleepRecordCopyWith<$Res> {
  factory _$$DailySleepRecordImplCopyWith(
    _$DailySleepRecordImpl value,
    $Res Function(_$DailySleepRecordImpl) then,
  ) = __$$DailySleepRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double needed, double actual, double deficit});
}

/// @nodoc
class __$$DailySleepRecordImplCopyWithImpl<$Res>
    extends _$DailySleepRecordCopyWithImpl<$Res, _$DailySleepRecordImpl>
    implements _$$DailySleepRecordImplCopyWith<$Res> {
  __$$DailySleepRecordImplCopyWithImpl(
    _$DailySleepRecordImpl _value,
    $Res Function(_$DailySleepRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailySleepRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? needed = null,
    Object? actual = null,
    Object? deficit = null,
  }) {
    return _then(
      _$DailySleepRecordImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        needed: null == needed
            ? _value.needed
            : needed // ignore: cast_nullable_to_non_nullable
                  as double,
        actual: null == actual
            ? _value.actual
            : actual // ignore: cast_nullable_to_non_nullable
                  as double,
        deficit: null == deficit
            ? _value.deficit
            : deficit // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailySleepRecordImpl implements _DailySleepRecord {
  const _$DailySleepRecordImpl({
    required this.date,
    required this.needed,
    required this.actual,
    required this.deficit,
  });

  factory _$DailySleepRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailySleepRecordImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double needed;
  @override
  final double actual;
  @override
  final double deficit;

  @override
  String toString() {
    return 'DailySleepRecord(date: $date, needed: $needed, actual: $actual, deficit: $deficit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySleepRecordImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.needed, needed) || other.needed == needed) &&
            (identical(other.actual, actual) || other.actual == actual) &&
            (identical(other.deficit, deficit) || other.deficit == deficit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, needed, actual, deficit);

  /// Create a copy of DailySleepRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySleepRecordImplCopyWith<_$DailySleepRecordImpl> get copyWith =>
      __$$DailySleepRecordImplCopyWithImpl<_$DailySleepRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailySleepRecordImplToJson(this);
  }
}

abstract class _DailySleepRecord implements DailySleepRecord {
  const factory _DailySleepRecord({
    required final DateTime date,
    required final double needed,
    required final double actual,
    required final double deficit,
  }) = _$DailySleepRecordImpl;

  factory _DailySleepRecord.fromJson(Map<String, dynamic> json) =
      _$DailySleepRecordImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get needed;
  @override
  double get actual;
  @override
  double get deficit;

  /// Create a copy of DailySleepRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySleepRecordImplCopyWith<_$DailySleepRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
