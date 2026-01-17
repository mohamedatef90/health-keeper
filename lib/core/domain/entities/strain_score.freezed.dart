// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strain_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StrainScore _$StrainScoreFromJson(Map<String, dynamic> json) {
  return _StrainScore.fromJson(json);
}

/// @nodoc
mixin _$StrainScore {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Overall strain score (0-21)
  double get score => throw _privateConstructorUsedError;

  /// Maximum heart rate used for zone calculations
  int get maxHeartRate => throw _privateConstructorUsedError;

  /// Time spent in each HR zone in minutes
  HRZoneData get zoneData => throw _privateConstructorUsedError;

  /// Total active minutes across all zones
  int get totalActiveMinutes => throw _privateConstructorUsedError;

  /// Peak heart rate recorded
  int? get peakHeartRate => throw _privateConstructorUsedError;

  /// Average heart rate during activity
  int? get averageHeartRate => throw _privateConstructorUsedError;

  /// Number of workouts contributing to strain
  int get workoutCount => throw _privateConstructorUsedError;

  /// Calories burned
  int? get caloriesBurned => throw _privateConstructorUsedError;

  /// Source of the data
  StrainDataSource get dataSource => throw _privateConstructorUsedError;

  /// Serializes this StrainScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrainScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrainScoreCopyWith<StrainScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrainScoreCopyWith<$Res> {
  factory $StrainScoreCopyWith(
    StrainScore value,
    $Res Function(StrainScore) then,
  ) = _$StrainScoreCopyWithImpl<$Res, StrainScore>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime calculatedAt,
    double score,
    int maxHeartRate,
    HRZoneData zoneData,
    int totalActiveMinutes,
    int? peakHeartRate,
    int? averageHeartRate,
    int workoutCount,
    int? caloriesBurned,
    StrainDataSource dataSource,
  });

  $HRZoneDataCopyWith<$Res> get zoneData;
}

/// @nodoc
class _$StrainScoreCopyWithImpl<$Res, $Val extends StrainScore>
    implements $StrainScoreCopyWith<$Res> {
  _$StrainScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrainScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? calculatedAt = null,
    Object? score = null,
    Object? maxHeartRate = null,
    Object? zoneData = null,
    Object? totalActiveMinutes = null,
    Object? peakHeartRate = freezed,
    Object? averageHeartRate = freezed,
    Object? workoutCount = null,
    Object? caloriesBurned = freezed,
    Object? dataSource = null,
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
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as double,
            maxHeartRate: null == maxHeartRate
                ? _value.maxHeartRate
                : maxHeartRate // ignore: cast_nullable_to_non_nullable
                      as int,
            zoneData: null == zoneData
                ? _value.zoneData
                : zoneData // ignore: cast_nullable_to_non_nullable
                      as HRZoneData,
            totalActiveMinutes: null == totalActiveMinutes
                ? _value.totalActiveMinutes
                : totalActiveMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            peakHeartRate: freezed == peakHeartRate
                ? _value.peakHeartRate
                : peakHeartRate // ignore: cast_nullable_to_non_nullable
                      as int?,
            averageHeartRate: freezed == averageHeartRate
                ? _value.averageHeartRate
                : averageHeartRate // ignore: cast_nullable_to_non_nullable
                      as int?,
            workoutCount: null == workoutCount
                ? _value.workoutCount
                : workoutCount // ignore: cast_nullable_to_non_nullable
                      as int,
            caloriesBurned: freezed == caloriesBurned
                ? _value.caloriesBurned
                : caloriesBurned // ignore: cast_nullable_to_non_nullable
                      as int?,
            dataSource: null == dataSource
                ? _value.dataSource
                : dataSource // ignore: cast_nullable_to_non_nullable
                      as StrainDataSource,
          )
          as $Val,
    );
  }

  /// Create a copy of StrainScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HRZoneDataCopyWith<$Res> get zoneData {
    return $HRZoneDataCopyWith<$Res>(_value.zoneData, (value) {
      return _then(_value.copyWith(zoneData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StrainScoreImplCopyWith<$Res>
    implements $StrainScoreCopyWith<$Res> {
  factory _$$StrainScoreImplCopyWith(
    _$StrainScoreImpl value,
    $Res Function(_$StrainScoreImpl) then,
  ) = __$$StrainScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime calculatedAt,
    double score,
    int maxHeartRate,
    HRZoneData zoneData,
    int totalActiveMinutes,
    int? peakHeartRate,
    int? averageHeartRate,
    int workoutCount,
    int? caloriesBurned,
    StrainDataSource dataSource,
  });

  @override
  $HRZoneDataCopyWith<$Res> get zoneData;
}

/// @nodoc
class __$$StrainScoreImplCopyWithImpl<$Res>
    extends _$StrainScoreCopyWithImpl<$Res, _$StrainScoreImpl>
    implements _$$StrainScoreImplCopyWith<$Res> {
  __$$StrainScoreImplCopyWithImpl(
    _$StrainScoreImpl _value,
    $Res Function(_$StrainScoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StrainScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? calculatedAt = null,
    Object? score = null,
    Object? maxHeartRate = null,
    Object? zoneData = null,
    Object? totalActiveMinutes = null,
    Object? peakHeartRate = freezed,
    Object? averageHeartRate = freezed,
    Object? workoutCount = null,
    Object? caloriesBurned = freezed,
    Object? dataSource = null,
  }) {
    return _then(
      _$StrainScoreImpl(
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
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as double,
        maxHeartRate: null == maxHeartRate
            ? _value.maxHeartRate
            : maxHeartRate // ignore: cast_nullable_to_non_nullable
                  as int,
        zoneData: null == zoneData
            ? _value.zoneData
            : zoneData // ignore: cast_nullable_to_non_nullable
                  as HRZoneData,
        totalActiveMinutes: null == totalActiveMinutes
            ? _value.totalActiveMinutes
            : totalActiveMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        peakHeartRate: freezed == peakHeartRate
            ? _value.peakHeartRate
            : peakHeartRate // ignore: cast_nullable_to_non_nullable
                  as int?,
        averageHeartRate: freezed == averageHeartRate
            ? _value.averageHeartRate
            : averageHeartRate // ignore: cast_nullable_to_non_nullable
                  as int?,
        workoutCount: null == workoutCount
            ? _value.workoutCount
            : workoutCount // ignore: cast_nullable_to_non_nullable
                  as int,
        caloriesBurned: freezed == caloriesBurned
            ? _value.caloriesBurned
            : caloriesBurned // ignore: cast_nullable_to_non_nullable
                  as int?,
        dataSource: null == dataSource
            ? _value.dataSource
            : dataSource // ignore: cast_nullable_to_non_nullable
                  as StrainDataSource,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StrainScoreImpl implements _StrainScore {
  const _$StrainScoreImpl({
    required this.id,
    required this.date,
    required this.calculatedAt,
    required this.score,
    required this.maxHeartRate,
    required this.zoneData,
    required this.totalActiveMinutes,
    this.peakHeartRate,
    this.averageHeartRate,
    this.workoutCount = 0,
    this.caloriesBurned,
    required this.dataSource,
  });

  factory _$StrainScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrainScoreImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime calculatedAt;

  /// Overall strain score (0-21)
  @override
  final double score;

  /// Maximum heart rate used for zone calculations
  @override
  final int maxHeartRate;

  /// Time spent in each HR zone in minutes
  @override
  final HRZoneData zoneData;

  /// Total active minutes across all zones
  @override
  final int totalActiveMinutes;

  /// Peak heart rate recorded
  @override
  final int? peakHeartRate;

  /// Average heart rate during activity
  @override
  final int? averageHeartRate;

  /// Number of workouts contributing to strain
  @override
  @JsonKey()
  final int workoutCount;

  /// Calories burned
  @override
  final int? caloriesBurned;

  /// Source of the data
  @override
  final StrainDataSource dataSource;

  @override
  String toString() {
    return 'StrainScore(id: $id, date: $date, calculatedAt: $calculatedAt, score: $score, maxHeartRate: $maxHeartRate, zoneData: $zoneData, totalActiveMinutes: $totalActiveMinutes, peakHeartRate: $peakHeartRate, averageHeartRate: $averageHeartRate, workoutCount: $workoutCount, caloriesBurned: $caloriesBurned, dataSource: $dataSource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrainScoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.maxHeartRate, maxHeartRate) ||
                other.maxHeartRate == maxHeartRate) &&
            (identical(other.zoneData, zoneData) ||
                other.zoneData == zoneData) &&
            (identical(other.totalActiveMinutes, totalActiveMinutes) ||
                other.totalActiveMinutes == totalActiveMinutes) &&
            (identical(other.peakHeartRate, peakHeartRate) ||
                other.peakHeartRate == peakHeartRate) &&
            (identical(other.averageHeartRate, averageHeartRate) ||
                other.averageHeartRate == averageHeartRate) &&
            (identical(other.workoutCount, workoutCount) ||
                other.workoutCount == workoutCount) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    calculatedAt,
    score,
    maxHeartRate,
    zoneData,
    totalActiveMinutes,
    peakHeartRate,
    averageHeartRate,
    workoutCount,
    caloriesBurned,
    dataSource,
  );

  /// Create a copy of StrainScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrainScoreImplCopyWith<_$StrainScoreImpl> get copyWith =>
      __$$StrainScoreImplCopyWithImpl<_$StrainScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrainScoreImplToJson(this);
  }
}

abstract class _StrainScore implements StrainScore {
  const factory _StrainScore({
    required final String id,
    required final DateTime date,
    required final DateTime calculatedAt,
    required final double score,
    required final int maxHeartRate,
    required final HRZoneData zoneData,
    required final int totalActiveMinutes,
    final int? peakHeartRate,
    final int? averageHeartRate,
    final int workoutCount,
    final int? caloriesBurned,
    required final StrainDataSource dataSource,
  }) = _$StrainScoreImpl;

  factory _StrainScore.fromJson(Map<String, dynamic> json) =
      _$StrainScoreImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get calculatedAt;

  /// Overall strain score (0-21)
  @override
  double get score;

  /// Maximum heart rate used for zone calculations
  @override
  int get maxHeartRate;

  /// Time spent in each HR zone in minutes
  @override
  HRZoneData get zoneData;

  /// Total active minutes across all zones
  @override
  int get totalActiveMinutes;

  /// Peak heart rate recorded
  @override
  int? get peakHeartRate;

  /// Average heart rate during activity
  @override
  int? get averageHeartRate;

  /// Number of workouts contributing to strain
  @override
  int get workoutCount;

  /// Calories burned
  @override
  int? get caloriesBurned;

  /// Source of the data
  @override
  StrainDataSource get dataSource;

  /// Create a copy of StrainScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrainScoreImplCopyWith<_$StrainScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HRZoneData _$HRZoneDataFromJson(Map<String, dynamic> json) {
  return _HRZoneData.fromJson(json);
}

/// @nodoc
mixin _$HRZoneData {
  /// Zone 1: 50-60% max HR (recovery zone)
  int get zone1Minutes => throw _privateConstructorUsedError;

  /// Zone 2: 60-70% max HR (fat burn zone)
  int get zone2Minutes => throw _privateConstructorUsedError;

  /// Zone 3: 70-80% max HR (aerobic zone)
  int get zone3Minutes => throw _privateConstructorUsedError;

  /// Zone 4: 80-90% max HR (threshold zone)
  int get zone4Minutes => throw _privateConstructorUsedError;

  /// Zone 5: 90-100% max HR (anaerobic zone)
  int get zone5Minutes => throw _privateConstructorUsedError;

  /// Serializes this HRZoneData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HRZoneData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HRZoneDataCopyWith<HRZoneData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HRZoneDataCopyWith<$Res> {
  factory $HRZoneDataCopyWith(
    HRZoneData value,
    $Res Function(HRZoneData) then,
  ) = _$HRZoneDataCopyWithImpl<$Res, HRZoneData>;
  @useResult
  $Res call({
    int zone1Minutes,
    int zone2Minutes,
    int zone3Minutes,
    int zone4Minutes,
    int zone5Minutes,
  });
}

/// @nodoc
class _$HRZoneDataCopyWithImpl<$Res, $Val extends HRZoneData>
    implements $HRZoneDataCopyWith<$Res> {
  _$HRZoneDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HRZoneData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zone1Minutes = null,
    Object? zone2Minutes = null,
    Object? zone3Minutes = null,
    Object? zone4Minutes = null,
    Object? zone5Minutes = null,
  }) {
    return _then(
      _value.copyWith(
            zone1Minutes: null == zone1Minutes
                ? _value.zone1Minutes
                : zone1Minutes // ignore: cast_nullable_to_non_nullable
                      as int,
            zone2Minutes: null == zone2Minutes
                ? _value.zone2Minutes
                : zone2Minutes // ignore: cast_nullable_to_non_nullable
                      as int,
            zone3Minutes: null == zone3Minutes
                ? _value.zone3Minutes
                : zone3Minutes // ignore: cast_nullable_to_non_nullable
                      as int,
            zone4Minutes: null == zone4Minutes
                ? _value.zone4Minutes
                : zone4Minutes // ignore: cast_nullable_to_non_nullable
                      as int,
            zone5Minutes: null == zone5Minutes
                ? _value.zone5Minutes
                : zone5Minutes // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HRZoneDataImplCopyWith<$Res>
    implements $HRZoneDataCopyWith<$Res> {
  factory _$$HRZoneDataImplCopyWith(
    _$HRZoneDataImpl value,
    $Res Function(_$HRZoneDataImpl) then,
  ) = __$$HRZoneDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int zone1Minutes,
    int zone2Minutes,
    int zone3Minutes,
    int zone4Minutes,
    int zone5Minutes,
  });
}

/// @nodoc
class __$$HRZoneDataImplCopyWithImpl<$Res>
    extends _$HRZoneDataCopyWithImpl<$Res, _$HRZoneDataImpl>
    implements _$$HRZoneDataImplCopyWith<$Res> {
  __$$HRZoneDataImplCopyWithImpl(
    _$HRZoneDataImpl _value,
    $Res Function(_$HRZoneDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HRZoneData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zone1Minutes = null,
    Object? zone2Minutes = null,
    Object? zone3Minutes = null,
    Object? zone4Minutes = null,
    Object? zone5Minutes = null,
  }) {
    return _then(
      _$HRZoneDataImpl(
        zone1Minutes: null == zone1Minutes
            ? _value.zone1Minutes
            : zone1Minutes // ignore: cast_nullable_to_non_nullable
                  as int,
        zone2Minutes: null == zone2Minutes
            ? _value.zone2Minutes
            : zone2Minutes // ignore: cast_nullable_to_non_nullable
                  as int,
        zone3Minutes: null == zone3Minutes
            ? _value.zone3Minutes
            : zone3Minutes // ignore: cast_nullable_to_non_nullable
                  as int,
        zone4Minutes: null == zone4Minutes
            ? _value.zone4Minutes
            : zone4Minutes // ignore: cast_nullable_to_non_nullable
                  as int,
        zone5Minutes: null == zone5Minutes
            ? _value.zone5Minutes
            : zone5Minutes // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HRZoneDataImpl implements _HRZoneData {
  const _$HRZoneDataImpl({
    this.zone1Minutes = 0,
    this.zone2Minutes = 0,
    this.zone3Minutes = 0,
    this.zone4Minutes = 0,
    this.zone5Minutes = 0,
  });

  factory _$HRZoneDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HRZoneDataImplFromJson(json);

  /// Zone 1: 50-60% max HR (recovery zone)
  @override
  @JsonKey()
  final int zone1Minutes;

  /// Zone 2: 60-70% max HR (fat burn zone)
  @override
  @JsonKey()
  final int zone2Minutes;

  /// Zone 3: 70-80% max HR (aerobic zone)
  @override
  @JsonKey()
  final int zone3Minutes;

  /// Zone 4: 80-90% max HR (threshold zone)
  @override
  @JsonKey()
  final int zone4Minutes;

  /// Zone 5: 90-100% max HR (anaerobic zone)
  @override
  @JsonKey()
  final int zone5Minutes;

  @override
  String toString() {
    return 'HRZoneData(zone1Minutes: $zone1Minutes, zone2Minutes: $zone2Minutes, zone3Minutes: $zone3Minutes, zone4Minutes: $zone4Minutes, zone5Minutes: $zone5Minutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HRZoneDataImpl &&
            (identical(other.zone1Minutes, zone1Minutes) ||
                other.zone1Minutes == zone1Minutes) &&
            (identical(other.zone2Minutes, zone2Minutes) ||
                other.zone2Minutes == zone2Minutes) &&
            (identical(other.zone3Minutes, zone3Minutes) ||
                other.zone3Minutes == zone3Minutes) &&
            (identical(other.zone4Minutes, zone4Minutes) ||
                other.zone4Minutes == zone4Minutes) &&
            (identical(other.zone5Minutes, zone5Minutes) ||
                other.zone5Minutes == zone5Minutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    zone1Minutes,
    zone2Minutes,
    zone3Minutes,
    zone4Minutes,
    zone5Minutes,
  );

  /// Create a copy of HRZoneData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HRZoneDataImplCopyWith<_$HRZoneDataImpl> get copyWith =>
      __$$HRZoneDataImplCopyWithImpl<_$HRZoneDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HRZoneDataImplToJson(this);
  }
}

abstract class _HRZoneData implements HRZoneData {
  const factory _HRZoneData({
    final int zone1Minutes,
    final int zone2Minutes,
    final int zone3Minutes,
    final int zone4Minutes,
    final int zone5Minutes,
  }) = _$HRZoneDataImpl;

  factory _HRZoneData.fromJson(Map<String, dynamic> json) =
      _$HRZoneDataImpl.fromJson;

  /// Zone 1: 50-60% max HR (recovery zone)
  @override
  int get zone1Minutes;

  /// Zone 2: 60-70% max HR (fat burn zone)
  @override
  int get zone2Minutes;

  /// Zone 3: 70-80% max HR (aerobic zone)
  @override
  int get zone3Minutes;

  /// Zone 4: 80-90% max HR (threshold zone)
  @override
  int get zone4Minutes;

  /// Zone 5: 90-100% max HR (anaerobic zone)
  @override
  int get zone5Minutes;

  /// Create a copy of HRZoneData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HRZoneDataImplCopyWith<_$HRZoneDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
