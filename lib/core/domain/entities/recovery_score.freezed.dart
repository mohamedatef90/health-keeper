// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recovery_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecoveryScore _$RecoveryScoreFromJson(Map<String, dynamic> json) {
  return _RecoveryScore.fromJson(json);
}

/// @nodoc
mixin _$RecoveryScore {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Overall recovery score (0-100)
  int get score => throw _privateConstructorUsedError;

  /// Component scores used in calculation
  RecoveryComponents get components => throw _privateConstructorUsedError;

  /// 7-day baseline metrics for comparison
  BaselineMetrics get baseline => throw _privateConstructorUsedError;

  /// Individual metric deviations from baseline
  MetricDeviations get deviations => throw _privateConstructorUsedError;

  /// Sleep performance data
  SleepPerformance? get sleepPerformance => throw _privateConstructorUsedError;

  /// Recovery state classification
  RecoveryState get state => throw _privateConstructorUsedError;

  /// Data source
  RecoveryDataSource get dataSource => throw _privateConstructorUsedError;

  /// Serializes this RecoveryScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecoveryScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecoveryScoreCopyWith<RecoveryScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveryScoreCopyWith<$Res> {
  factory $RecoveryScoreCopyWith(
    RecoveryScore value,
    $Res Function(RecoveryScore) then,
  ) = _$RecoveryScoreCopyWithImpl<$Res, RecoveryScore>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime calculatedAt,
    int score,
    RecoveryComponents components,
    BaselineMetrics baseline,
    MetricDeviations deviations,
    SleepPerformance? sleepPerformance,
    RecoveryState state,
    RecoveryDataSource dataSource,
  });

  $RecoveryComponentsCopyWith<$Res> get components;
  $BaselineMetricsCopyWith<$Res> get baseline;
  $MetricDeviationsCopyWith<$Res> get deviations;
  $SleepPerformanceCopyWith<$Res>? get sleepPerformance;
}

/// @nodoc
class _$RecoveryScoreCopyWithImpl<$Res, $Val extends RecoveryScore>
    implements $RecoveryScoreCopyWith<$Res> {
  _$RecoveryScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecoveryScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? calculatedAt = null,
    Object? score = null,
    Object? components = null,
    Object? baseline = null,
    Object? deviations = null,
    Object? sleepPerformance = freezed,
    Object? state = null,
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
                      as int,
            components: null == components
                ? _value.components
                : components // ignore: cast_nullable_to_non_nullable
                      as RecoveryComponents,
            baseline: null == baseline
                ? _value.baseline
                : baseline // ignore: cast_nullable_to_non_nullable
                      as BaselineMetrics,
            deviations: null == deviations
                ? _value.deviations
                : deviations // ignore: cast_nullable_to_non_nullable
                      as MetricDeviations,
            sleepPerformance: freezed == sleepPerformance
                ? _value.sleepPerformance
                : sleepPerformance // ignore: cast_nullable_to_non_nullable
                      as SleepPerformance?,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as RecoveryState,
            dataSource: null == dataSource
                ? _value.dataSource
                : dataSource // ignore: cast_nullable_to_non_nullable
                      as RecoveryDataSource,
          )
          as $Val,
    );
  }

  /// Create a copy of RecoveryScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecoveryComponentsCopyWith<$Res> get components {
    return $RecoveryComponentsCopyWith<$Res>(_value.components, (value) {
      return _then(_value.copyWith(components: value) as $Val);
    });
  }

  /// Create a copy of RecoveryScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaselineMetricsCopyWith<$Res> get baseline {
    return $BaselineMetricsCopyWith<$Res>(_value.baseline, (value) {
      return _then(_value.copyWith(baseline: value) as $Val);
    });
  }

  /// Create a copy of RecoveryScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetricDeviationsCopyWith<$Res> get deviations {
    return $MetricDeviationsCopyWith<$Res>(_value.deviations, (value) {
      return _then(_value.copyWith(deviations: value) as $Val);
    });
  }

  /// Create a copy of RecoveryScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepPerformanceCopyWith<$Res>? get sleepPerformance {
    if (_value.sleepPerformance == null) {
      return null;
    }

    return $SleepPerformanceCopyWith<$Res>(_value.sleepPerformance!, (value) {
      return _then(_value.copyWith(sleepPerformance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecoveryScoreImplCopyWith<$Res>
    implements $RecoveryScoreCopyWith<$Res> {
  factory _$$RecoveryScoreImplCopyWith(
    _$RecoveryScoreImpl value,
    $Res Function(_$RecoveryScoreImpl) then,
  ) = __$$RecoveryScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime calculatedAt,
    int score,
    RecoveryComponents components,
    BaselineMetrics baseline,
    MetricDeviations deviations,
    SleepPerformance? sleepPerformance,
    RecoveryState state,
    RecoveryDataSource dataSource,
  });

  @override
  $RecoveryComponentsCopyWith<$Res> get components;
  @override
  $BaselineMetricsCopyWith<$Res> get baseline;
  @override
  $MetricDeviationsCopyWith<$Res> get deviations;
  @override
  $SleepPerformanceCopyWith<$Res>? get sleepPerformance;
}

/// @nodoc
class __$$RecoveryScoreImplCopyWithImpl<$Res>
    extends _$RecoveryScoreCopyWithImpl<$Res, _$RecoveryScoreImpl>
    implements _$$RecoveryScoreImplCopyWith<$Res> {
  __$$RecoveryScoreImplCopyWithImpl(
    _$RecoveryScoreImpl _value,
    $Res Function(_$RecoveryScoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecoveryScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? calculatedAt = null,
    Object? score = null,
    Object? components = null,
    Object? baseline = null,
    Object? deviations = null,
    Object? sleepPerformance = freezed,
    Object? state = null,
    Object? dataSource = null,
  }) {
    return _then(
      _$RecoveryScoreImpl(
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
                  as int,
        components: null == components
            ? _value.components
            : components // ignore: cast_nullable_to_non_nullable
                  as RecoveryComponents,
        baseline: null == baseline
            ? _value.baseline
            : baseline // ignore: cast_nullable_to_non_nullable
                  as BaselineMetrics,
        deviations: null == deviations
            ? _value.deviations
            : deviations // ignore: cast_nullable_to_non_nullable
                  as MetricDeviations,
        sleepPerformance: freezed == sleepPerformance
            ? _value.sleepPerformance
            : sleepPerformance // ignore: cast_nullable_to_non_nullable
                  as SleepPerformance?,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as RecoveryState,
        dataSource: null == dataSource
            ? _value.dataSource
            : dataSource // ignore: cast_nullable_to_non_nullable
                  as RecoveryDataSource,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecoveryScoreImpl implements _RecoveryScore {
  const _$RecoveryScoreImpl({
    required this.id,
    required this.date,
    required this.calculatedAt,
    required this.score,
    required this.components,
    required this.baseline,
    required this.deviations,
    this.sleepPerformance,
    required this.state,
    required this.dataSource,
  });

  factory _$RecoveryScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecoveryScoreImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime calculatedAt;

  /// Overall recovery score (0-100)
  @override
  final int score;

  /// Component scores used in calculation
  @override
  final RecoveryComponents components;

  /// 7-day baseline metrics for comparison
  @override
  final BaselineMetrics baseline;

  /// Individual metric deviations from baseline
  @override
  final MetricDeviations deviations;

  /// Sleep performance data
  @override
  final SleepPerformance? sleepPerformance;

  /// Recovery state classification
  @override
  final RecoveryState state;

  /// Data source
  @override
  final RecoveryDataSource dataSource;

  @override
  String toString() {
    return 'RecoveryScore(id: $id, date: $date, calculatedAt: $calculatedAt, score: $score, components: $components, baseline: $baseline, deviations: $deviations, sleepPerformance: $sleepPerformance, state: $state, dataSource: $dataSource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecoveryScoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.components, components) ||
                other.components == components) &&
            (identical(other.baseline, baseline) ||
                other.baseline == baseline) &&
            (identical(other.deviations, deviations) ||
                other.deviations == deviations) &&
            (identical(other.sleepPerformance, sleepPerformance) ||
                other.sleepPerformance == sleepPerformance) &&
            (identical(other.state, state) || other.state == state) &&
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
    components,
    baseline,
    deviations,
    sleepPerformance,
    state,
    dataSource,
  );

  /// Create a copy of RecoveryScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecoveryScoreImplCopyWith<_$RecoveryScoreImpl> get copyWith =>
      __$$RecoveryScoreImplCopyWithImpl<_$RecoveryScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecoveryScoreImplToJson(this);
  }
}

abstract class _RecoveryScore implements RecoveryScore {
  const factory _RecoveryScore({
    required final String id,
    required final DateTime date,
    required final DateTime calculatedAt,
    required final int score,
    required final RecoveryComponents components,
    required final BaselineMetrics baseline,
    required final MetricDeviations deviations,
    final SleepPerformance? sleepPerformance,
    required final RecoveryState state,
    required final RecoveryDataSource dataSource,
  }) = _$RecoveryScoreImpl;

  factory _RecoveryScore.fromJson(Map<String, dynamic> json) =
      _$RecoveryScoreImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get calculatedAt;

  /// Overall recovery score (0-100)
  @override
  int get score;

  /// Component scores used in calculation
  @override
  RecoveryComponents get components;

  /// 7-day baseline metrics for comparison
  @override
  BaselineMetrics get baseline;

  /// Individual metric deviations from baseline
  @override
  MetricDeviations get deviations;

  /// Sleep performance data
  @override
  SleepPerformance? get sleepPerformance;

  /// Recovery state classification
  @override
  RecoveryState get state;

  /// Data source
  @override
  RecoveryDataSource get dataSource;

  /// Create a copy of RecoveryScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecoveryScoreImplCopyWith<_$RecoveryScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecoveryComponents _$RecoveryComponentsFromJson(Map<String, dynamic> json) {
  return _RecoveryComponents.fromJson(json);
}

/// @nodoc
mixin _$RecoveryComponents {
  /// HRV component score (0-100), weight: 40%
  int get hrvScore => throw _privateConstructorUsedError;

  /// Resting HR component score (0-100), weight: 25%
  int get rhrScore => throw _privateConstructorUsedError;

  /// Sleep performance score (0-100), weight: 25%
  int get sleepScore => throw _privateConstructorUsedError;

  /// Respiratory rate score (0-100), weight: 10%
  int get respiratoryScore => throw _privateConstructorUsedError;

  /// Serializes this RecoveryComponents to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecoveryComponents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecoveryComponentsCopyWith<RecoveryComponents> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveryComponentsCopyWith<$Res> {
  factory $RecoveryComponentsCopyWith(
    RecoveryComponents value,
    $Res Function(RecoveryComponents) then,
  ) = _$RecoveryComponentsCopyWithImpl<$Res, RecoveryComponents>;
  @useResult
  $Res call({int hrvScore, int rhrScore, int sleepScore, int respiratoryScore});
}

/// @nodoc
class _$RecoveryComponentsCopyWithImpl<$Res, $Val extends RecoveryComponents>
    implements $RecoveryComponentsCopyWith<$Res> {
  _$RecoveryComponentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecoveryComponents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hrvScore = null,
    Object? rhrScore = null,
    Object? sleepScore = null,
    Object? respiratoryScore = null,
  }) {
    return _then(
      _value.copyWith(
            hrvScore: null == hrvScore
                ? _value.hrvScore
                : hrvScore // ignore: cast_nullable_to_non_nullable
                      as int,
            rhrScore: null == rhrScore
                ? _value.rhrScore
                : rhrScore // ignore: cast_nullable_to_non_nullable
                      as int,
            sleepScore: null == sleepScore
                ? _value.sleepScore
                : sleepScore // ignore: cast_nullable_to_non_nullable
                      as int,
            respiratoryScore: null == respiratoryScore
                ? _value.respiratoryScore
                : respiratoryScore // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecoveryComponentsImplCopyWith<$Res>
    implements $RecoveryComponentsCopyWith<$Res> {
  factory _$$RecoveryComponentsImplCopyWith(
    _$RecoveryComponentsImpl value,
    $Res Function(_$RecoveryComponentsImpl) then,
  ) = __$$RecoveryComponentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hrvScore, int rhrScore, int sleepScore, int respiratoryScore});
}

/// @nodoc
class __$$RecoveryComponentsImplCopyWithImpl<$Res>
    extends _$RecoveryComponentsCopyWithImpl<$Res, _$RecoveryComponentsImpl>
    implements _$$RecoveryComponentsImplCopyWith<$Res> {
  __$$RecoveryComponentsImplCopyWithImpl(
    _$RecoveryComponentsImpl _value,
    $Res Function(_$RecoveryComponentsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecoveryComponents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hrvScore = null,
    Object? rhrScore = null,
    Object? sleepScore = null,
    Object? respiratoryScore = null,
  }) {
    return _then(
      _$RecoveryComponentsImpl(
        hrvScore: null == hrvScore
            ? _value.hrvScore
            : hrvScore // ignore: cast_nullable_to_non_nullable
                  as int,
        rhrScore: null == rhrScore
            ? _value.rhrScore
            : rhrScore // ignore: cast_nullable_to_non_nullable
                  as int,
        sleepScore: null == sleepScore
            ? _value.sleepScore
            : sleepScore // ignore: cast_nullable_to_non_nullable
                  as int,
        respiratoryScore: null == respiratoryScore
            ? _value.respiratoryScore
            : respiratoryScore // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecoveryComponentsImpl implements _RecoveryComponents {
  const _$RecoveryComponentsImpl({
    required this.hrvScore,
    required this.rhrScore,
    required this.sleepScore,
    required this.respiratoryScore,
  });

  factory _$RecoveryComponentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecoveryComponentsImplFromJson(json);

  /// HRV component score (0-100), weight: 40%
  @override
  final int hrvScore;

  /// Resting HR component score (0-100), weight: 25%
  @override
  final int rhrScore;

  /// Sleep performance score (0-100), weight: 25%
  @override
  final int sleepScore;

  /// Respiratory rate score (0-100), weight: 10%
  @override
  final int respiratoryScore;

  @override
  String toString() {
    return 'RecoveryComponents(hrvScore: $hrvScore, rhrScore: $rhrScore, sleepScore: $sleepScore, respiratoryScore: $respiratoryScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecoveryComponentsImpl &&
            (identical(other.hrvScore, hrvScore) ||
                other.hrvScore == hrvScore) &&
            (identical(other.rhrScore, rhrScore) ||
                other.rhrScore == rhrScore) &&
            (identical(other.sleepScore, sleepScore) ||
                other.sleepScore == sleepScore) &&
            (identical(other.respiratoryScore, respiratoryScore) ||
                other.respiratoryScore == respiratoryScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hrvScore,
    rhrScore,
    sleepScore,
    respiratoryScore,
  );

  /// Create a copy of RecoveryComponents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecoveryComponentsImplCopyWith<_$RecoveryComponentsImpl> get copyWith =>
      __$$RecoveryComponentsImplCopyWithImpl<_$RecoveryComponentsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecoveryComponentsImplToJson(this);
  }
}

abstract class _RecoveryComponents implements RecoveryComponents {
  const factory _RecoveryComponents({
    required final int hrvScore,
    required final int rhrScore,
    required final int sleepScore,
    required final int respiratoryScore,
  }) = _$RecoveryComponentsImpl;

  factory _RecoveryComponents.fromJson(Map<String, dynamic> json) =
      _$RecoveryComponentsImpl.fromJson;

  /// HRV component score (0-100), weight: 40%
  @override
  int get hrvScore;

  /// Resting HR component score (0-100), weight: 25%
  @override
  int get rhrScore;

  /// Sleep performance score (0-100), weight: 25%
  @override
  int get sleepScore;

  /// Respiratory rate score (0-100), weight: 10%
  @override
  int get respiratoryScore;

  /// Create a copy of RecoveryComponents
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecoveryComponentsImplCopyWith<_$RecoveryComponentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BaselineMetrics _$BaselineMetricsFromJson(Map<String, dynamic> json) {
  return _BaselineMetrics.fromJson(json);
}

/// @nodoc
mixin _$BaselineMetrics {
  /// Average HRV over 7 days (in ms)
  double get avgHrv => throw _privateConstructorUsedError;

  /// Standard deviation of HRV
  double get hrvStdDev => throw _privateConstructorUsedError;

  /// Average resting heart rate over 7 days (bpm)
  double get avgRhr => throw _privateConstructorUsedError;

  /// Standard deviation of RHR
  double get rhrStdDev => throw _privateConstructorUsedError;

  /// Average sleep duration over 7 days (hours)
  double get avgSleepDuration => throw _privateConstructorUsedError;

  /// Average respiratory rate (breaths per minute)
  double get avgRespiratoryRate => throw _privateConstructorUsedError;

  /// Standard deviation of respiratory rate
  double get respiratoryRateStdDev => throw _privateConstructorUsedError;

  /// Number of days used for baseline calculation
  int get daysInBaseline => throw _privateConstructorUsedError;

  /// Serializes this BaselineMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaselineMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaselineMetricsCopyWith<BaselineMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaselineMetricsCopyWith<$Res> {
  factory $BaselineMetricsCopyWith(
    BaselineMetrics value,
    $Res Function(BaselineMetrics) then,
  ) = _$BaselineMetricsCopyWithImpl<$Res, BaselineMetrics>;
  @useResult
  $Res call({
    double avgHrv,
    double hrvStdDev,
    double avgRhr,
    double rhrStdDev,
    double avgSleepDuration,
    double avgRespiratoryRate,
    double respiratoryRateStdDev,
    int daysInBaseline,
  });
}

/// @nodoc
class _$BaselineMetricsCopyWithImpl<$Res, $Val extends BaselineMetrics>
    implements $BaselineMetricsCopyWith<$Res> {
  _$BaselineMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaselineMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgHrv = null,
    Object? hrvStdDev = null,
    Object? avgRhr = null,
    Object? rhrStdDev = null,
    Object? avgSleepDuration = null,
    Object? avgRespiratoryRate = null,
    Object? respiratoryRateStdDev = null,
    Object? daysInBaseline = null,
  }) {
    return _then(
      _value.copyWith(
            avgHrv: null == avgHrv
                ? _value.avgHrv
                : avgHrv // ignore: cast_nullable_to_non_nullable
                      as double,
            hrvStdDev: null == hrvStdDev
                ? _value.hrvStdDev
                : hrvStdDev // ignore: cast_nullable_to_non_nullable
                      as double,
            avgRhr: null == avgRhr
                ? _value.avgRhr
                : avgRhr // ignore: cast_nullable_to_non_nullable
                      as double,
            rhrStdDev: null == rhrStdDev
                ? _value.rhrStdDev
                : rhrStdDev // ignore: cast_nullable_to_non_nullable
                      as double,
            avgSleepDuration: null == avgSleepDuration
                ? _value.avgSleepDuration
                : avgSleepDuration // ignore: cast_nullable_to_non_nullable
                      as double,
            avgRespiratoryRate: null == avgRespiratoryRate
                ? _value.avgRespiratoryRate
                : avgRespiratoryRate // ignore: cast_nullable_to_non_nullable
                      as double,
            respiratoryRateStdDev: null == respiratoryRateStdDev
                ? _value.respiratoryRateStdDev
                : respiratoryRateStdDev // ignore: cast_nullable_to_non_nullable
                      as double,
            daysInBaseline: null == daysInBaseline
                ? _value.daysInBaseline
                : daysInBaseline // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BaselineMetricsImplCopyWith<$Res>
    implements $BaselineMetricsCopyWith<$Res> {
  factory _$$BaselineMetricsImplCopyWith(
    _$BaselineMetricsImpl value,
    $Res Function(_$BaselineMetricsImpl) then,
  ) = __$$BaselineMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double avgHrv,
    double hrvStdDev,
    double avgRhr,
    double rhrStdDev,
    double avgSleepDuration,
    double avgRespiratoryRate,
    double respiratoryRateStdDev,
    int daysInBaseline,
  });
}

/// @nodoc
class __$$BaselineMetricsImplCopyWithImpl<$Res>
    extends _$BaselineMetricsCopyWithImpl<$Res, _$BaselineMetricsImpl>
    implements _$$BaselineMetricsImplCopyWith<$Res> {
  __$$BaselineMetricsImplCopyWithImpl(
    _$BaselineMetricsImpl _value,
    $Res Function(_$BaselineMetricsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BaselineMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgHrv = null,
    Object? hrvStdDev = null,
    Object? avgRhr = null,
    Object? rhrStdDev = null,
    Object? avgSleepDuration = null,
    Object? avgRespiratoryRate = null,
    Object? respiratoryRateStdDev = null,
    Object? daysInBaseline = null,
  }) {
    return _then(
      _$BaselineMetricsImpl(
        avgHrv: null == avgHrv
            ? _value.avgHrv
            : avgHrv // ignore: cast_nullable_to_non_nullable
                  as double,
        hrvStdDev: null == hrvStdDev
            ? _value.hrvStdDev
            : hrvStdDev // ignore: cast_nullable_to_non_nullable
                  as double,
        avgRhr: null == avgRhr
            ? _value.avgRhr
            : avgRhr // ignore: cast_nullable_to_non_nullable
                  as double,
        rhrStdDev: null == rhrStdDev
            ? _value.rhrStdDev
            : rhrStdDev // ignore: cast_nullable_to_non_nullable
                  as double,
        avgSleepDuration: null == avgSleepDuration
            ? _value.avgSleepDuration
            : avgSleepDuration // ignore: cast_nullable_to_non_nullable
                  as double,
        avgRespiratoryRate: null == avgRespiratoryRate
            ? _value.avgRespiratoryRate
            : avgRespiratoryRate // ignore: cast_nullable_to_non_nullable
                  as double,
        respiratoryRateStdDev: null == respiratoryRateStdDev
            ? _value.respiratoryRateStdDev
            : respiratoryRateStdDev // ignore: cast_nullable_to_non_nullable
                  as double,
        daysInBaseline: null == daysInBaseline
            ? _value.daysInBaseline
            : daysInBaseline // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BaselineMetricsImpl implements _BaselineMetrics {
  const _$BaselineMetricsImpl({
    required this.avgHrv,
    required this.hrvStdDev,
    required this.avgRhr,
    required this.rhrStdDev,
    required this.avgSleepDuration,
    required this.avgRespiratoryRate,
    required this.respiratoryRateStdDev,
    required this.daysInBaseline,
  });

  factory _$BaselineMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaselineMetricsImplFromJson(json);

  /// Average HRV over 7 days (in ms)
  @override
  final double avgHrv;

  /// Standard deviation of HRV
  @override
  final double hrvStdDev;

  /// Average resting heart rate over 7 days (bpm)
  @override
  final double avgRhr;

  /// Standard deviation of RHR
  @override
  final double rhrStdDev;

  /// Average sleep duration over 7 days (hours)
  @override
  final double avgSleepDuration;

  /// Average respiratory rate (breaths per minute)
  @override
  final double avgRespiratoryRate;

  /// Standard deviation of respiratory rate
  @override
  final double respiratoryRateStdDev;

  /// Number of days used for baseline calculation
  @override
  final int daysInBaseline;

  @override
  String toString() {
    return 'BaselineMetrics(avgHrv: $avgHrv, hrvStdDev: $hrvStdDev, avgRhr: $avgRhr, rhrStdDev: $rhrStdDev, avgSleepDuration: $avgSleepDuration, avgRespiratoryRate: $avgRespiratoryRate, respiratoryRateStdDev: $respiratoryRateStdDev, daysInBaseline: $daysInBaseline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaselineMetricsImpl &&
            (identical(other.avgHrv, avgHrv) || other.avgHrv == avgHrv) &&
            (identical(other.hrvStdDev, hrvStdDev) ||
                other.hrvStdDev == hrvStdDev) &&
            (identical(other.avgRhr, avgRhr) || other.avgRhr == avgRhr) &&
            (identical(other.rhrStdDev, rhrStdDev) ||
                other.rhrStdDev == rhrStdDev) &&
            (identical(other.avgSleepDuration, avgSleepDuration) ||
                other.avgSleepDuration == avgSleepDuration) &&
            (identical(other.avgRespiratoryRate, avgRespiratoryRate) ||
                other.avgRespiratoryRate == avgRespiratoryRate) &&
            (identical(other.respiratoryRateStdDev, respiratoryRateStdDev) ||
                other.respiratoryRateStdDev == respiratoryRateStdDev) &&
            (identical(other.daysInBaseline, daysInBaseline) ||
                other.daysInBaseline == daysInBaseline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    avgHrv,
    hrvStdDev,
    avgRhr,
    rhrStdDev,
    avgSleepDuration,
    avgRespiratoryRate,
    respiratoryRateStdDev,
    daysInBaseline,
  );

  /// Create a copy of BaselineMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaselineMetricsImplCopyWith<_$BaselineMetricsImpl> get copyWith =>
      __$$BaselineMetricsImplCopyWithImpl<_$BaselineMetricsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BaselineMetricsImplToJson(this);
  }
}

abstract class _BaselineMetrics implements BaselineMetrics {
  const factory _BaselineMetrics({
    required final double avgHrv,
    required final double hrvStdDev,
    required final double avgRhr,
    required final double rhrStdDev,
    required final double avgSleepDuration,
    required final double avgRespiratoryRate,
    required final double respiratoryRateStdDev,
    required final int daysInBaseline,
  }) = _$BaselineMetricsImpl;

  factory _BaselineMetrics.fromJson(Map<String, dynamic> json) =
      _$BaselineMetricsImpl.fromJson;

  /// Average HRV over 7 days (in ms)
  @override
  double get avgHrv;

  /// Standard deviation of HRV
  @override
  double get hrvStdDev;

  /// Average resting heart rate over 7 days (bpm)
  @override
  double get avgRhr;

  /// Standard deviation of RHR
  @override
  double get rhrStdDev;

  /// Average sleep duration over 7 days (hours)
  @override
  double get avgSleepDuration;

  /// Average respiratory rate (breaths per minute)
  @override
  double get avgRespiratoryRate;

  /// Standard deviation of respiratory rate
  @override
  double get respiratoryRateStdDev;

  /// Number of days used for baseline calculation
  @override
  int get daysInBaseline;

  /// Create a copy of BaselineMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaselineMetricsImplCopyWith<_$BaselineMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetricDeviations _$MetricDeviationsFromJson(Map<String, dynamic> json) {
  return _MetricDeviations.fromJson(json);
}

/// @nodoc
mixin _$MetricDeviations {
  /// HRV deviation in standard deviations
  /// Positive = above baseline (good)
  double get hrvDeviation => throw _privateConstructorUsedError;

  /// RHR deviation in standard deviations
  /// Negative = below baseline (good, lower RHR is better)
  double get rhrDeviation => throw _privateConstructorUsedError;

  /// Sleep deviation as percentage of needed sleep
  /// 1.0 = exactly meeting sleep need
  double get sleepDeviation => throw _privateConstructorUsedError;

  /// Respiratory rate deviation in standard deviations
  /// Close to 0 is good
  double get respiratoryDeviation => throw _privateConstructorUsedError;

  /// Serializes this MetricDeviations to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetricDeviations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetricDeviationsCopyWith<MetricDeviations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricDeviationsCopyWith<$Res> {
  factory $MetricDeviationsCopyWith(
    MetricDeviations value,
    $Res Function(MetricDeviations) then,
  ) = _$MetricDeviationsCopyWithImpl<$Res, MetricDeviations>;
  @useResult
  $Res call({
    double hrvDeviation,
    double rhrDeviation,
    double sleepDeviation,
    double respiratoryDeviation,
  });
}

/// @nodoc
class _$MetricDeviationsCopyWithImpl<$Res, $Val extends MetricDeviations>
    implements $MetricDeviationsCopyWith<$Res> {
  _$MetricDeviationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetricDeviations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hrvDeviation = null,
    Object? rhrDeviation = null,
    Object? sleepDeviation = null,
    Object? respiratoryDeviation = null,
  }) {
    return _then(
      _value.copyWith(
            hrvDeviation: null == hrvDeviation
                ? _value.hrvDeviation
                : hrvDeviation // ignore: cast_nullable_to_non_nullable
                      as double,
            rhrDeviation: null == rhrDeviation
                ? _value.rhrDeviation
                : rhrDeviation // ignore: cast_nullable_to_non_nullable
                      as double,
            sleepDeviation: null == sleepDeviation
                ? _value.sleepDeviation
                : sleepDeviation // ignore: cast_nullable_to_non_nullable
                      as double,
            respiratoryDeviation: null == respiratoryDeviation
                ? _value.respiratoryDeviation
                : respiratoryDeviation // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MetricDeviationsImplCopyWith<$Res>
    implements $MetricDeviationsCopyWith<$Res> {
  factory _$$MetricDeviationsImplCopyWith(
    _$MetricDeviationsImpl value,
    $Res Function(_$MetricDeviationsImpl) then,
  ) = __$$MetricDeviationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double hrvDeviation,
    double rhrDeviation,
    double sleepDeviation,
    double respiratoryDeviation,
  });
}

/// @nodoc
class __$$MetricDeviationsImplCopyWithImpl<$Res>
    extends _$MetricDeviationsCopyWithImpl<$Res, _$MetricDeviationsImpl>
    implements _$$MetricDeviationsImplCopyWith<$Res> {
  __$$MetricDeviationsImplCopyWithImpl(
    _$MetricDeviationsImpl _value,
    $Res Function(_$MetricDeviationsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetricDeviations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hrvDeviation = null,
    Object? rhrDeviation = null,
    Object? sleepDeviation = null,
    Object? respiratoryDeviation = null,
  }) {
    return _then(
      _$MetricDeviationsImpl(
        hrvDeviation: null == hrvDeviation
            ? _value.hrvDeviation
            : hrvDeviation // ignore: cast_nullable_to_non_nullable
                  as double,
        rhrDeviation: null == rhrDeviation
            ? _value.rhrDeviation
            : rhrDeviation // ignore: cast_nullable_to_non_nullable
                  as double,
        sleepDeviation: null == sleepDeviation
            ? _value.sleepDeviation
            : sleepDeviation // ignore: cast_nullable_to_non_nullable
                  as double,
        respiratoryDeviation: null == respiratoryDeviation
            ? _value.respiratoryDeviation
            : respiratoryDeviation // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetricDeviationsImpl implements _MetricDeviations {
  const _$MetricDeviationsImpl({
    required this.hrvDeviation,
    required this.rhrDeviation,
    required this.sleepDeviation,
    required this.respiratoryDeviation,
  });

  factory _$MetricDeviationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetricDeviationsImplFromJson(json);

  /// HRV deviation in standard deviations
  /// Positive = above baseline (good)
  @override
  final double hrvDeviation;

  /// RHR deviation in standard deviations
  /// Negative = below baseline (good, lower RHR is better)
  @override
  final double rhrDeviation;

  /// Sleep deviation as percentage of needed sleep
  /// 1.0 = exactly meeting sleep need
  @override
  final double sleepDeviation;

  /// Respiratory rate deviation in standard deviations
  /// Close to 0 is good
  @override
  final double respiratoryDeviation;

  @override
  String toString() {
    return 'MetricDeviations(hrvDeviation: $hrvDeviation, rhrDeviation: $rhrDeviation, sleepDeviation: $sleepDeviation, respiratoryDeviation: $respiratoryDeviation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricDeviationsImpl &&
            (identical(other.hrvDeviation, hrvDeviation) ||
                other.hrvDeviation == hrvDeviation) &&
            (identical(other.rhrDeviation, rhrDeviation) ||
                other.rhrDeviation == rhrDeviation) &&
            (identical(other.sleepDeviation, sleepDeviation) ||
                other.sleepDeviation == sleepDeviation) &&
            (identical(other.respiratoryDeviation, respiratoryDeviation) ||
                other.respiratoryDeviation == respiratoryDeviation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hrvDeviation,
    rhrDeviation,
    sleepDeviation,
    respiratoryDeviation,
  );

  /// Create a copy of MetricDeviations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricDeviationsImplCopyWith<_$MetricDeviationsImpl> get copyWith =>
      __$$MetricDeviationsImplCopyWithImpl<_$MetricDeviationsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MetricDeviationsImplToJson(this);
  }
}

abstract class _MetricDeviations implements MetricDeviations {
  const factory _MetricDeviations({
    required final double hrvDeviation,
    required final double rhrDeviation,
    required final double sleepDeviation,
    required final double respiratoryDeviation,
  }) = _$MetricDeviationsImpl;

  factory _MetricDeviations.fromJson(Map<String, dynamic> json) =
      _$MetricDeviationsImpl.fromJson;

  /// HRV deviation in standard deviations
  /// Positive = above baseline (good)
  @override
  double get hrvDeviation;

  /// RHR deviation in standard deviations
  /// Negative = below baseline (good, lower RHR is better)
  @override
  double get rhrDeviation;

  /// Sleep deviation as percentage of needed sleep
  /// 1.0 = exactly meeting sleep need
  @override
  double get sleepDeviation;

  /// Respiratory rate deviation in standard deviations
  /// Close to 0 is good
  @override
  double get respiratoryDeviation;

  /// Create a copy of MetricDeviations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetricDeviationsImplCopyWith<_$MetricDeviationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SleepPerformance _$SleepPerformanceFromJson(Map<String, dynamic> json) {
  return _SleepPerformance.fromJson(json);
}

/// @nodoc
mixin _$SleepPerformance {
  /// Actual sleep duration in hours
  double get actualSleep => throw _privateConstructorUsedError;

  /// Needed sleep in hours (based on strain and recovery)
  double get neededSleep => throw _privateConstructorUsedError;

  /// Sleep efficiency percentage (time asleep / time in bed)
  int? get efficiency => throw _privateConstructorUsedError;

  /// Time spent in different sleep stages (if available)
  SleepStages? get stages => throw _privateConstructorUsedError;

  /// Sleep quality score (0-100)
  int? get qualityScore => throw _privateConstructorUsedError;

  /// Serializes this SleepPerformance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepPerformanceCopyWith<SleepPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepPerformanceCopyWith<$Res> {
  factory $SleepPerformanceCopyWith(
    SleepPerformance value,
    $Res Function(SleepPerformance) then,
  ) = _$SleepPerformanceCopyWithImpl<$Res, SleepPerformance>;
  @useResult
  $Res call({
    double actualSleep,
    double neededSleep,
    int? efficiency,
    SleepStages? stages,
    int? qualityScore,
  });

  $SleepStagesCopyWith<$Res>? get stages;
}

/// @nodoc
class _$SleepPerformanceCopyWithImpl<$Res, $Val extends SleepPerformance>
    implements $SleepPerformanceCopyWith<$Res> {
  _$SleepPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actualSleep = null,
    Object? neededSleep = null,
    Object? efficiency = freezed,
    Object? stages = freezed,
    Object? qualityScore = freezed,
  }) {
    return _then(
      _value.copyWith(
            actualSleep: null == actualSleep
                ? _value.actualSleep
                : actualSleep // ignore: cast_nullable_to_non_nullable
                      as double,
            neededSleep: null == neededSleep
                ? _value.neededSleep
                : neededSleep // ignore: cast_nullable_to_non_nullable
                      as double,
            efficiency: freezed == efficiency
                ? _value.efficiency
                : efficiency // ignore: cast_nullable_to_non_nullable
                      as int?,
            stages: freezed == stages
                ? _value.stages
                : stages // ignore: cast_nullable_to_non_nullable
                      as SleepStages?,
            qualityScore: freezed == qualityScore
                ? _value.qualityScore
                : qualityScore // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of SleepPerformance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepStagesCopyWith<$Res>? get stages {
    if (_value.stages == null) {
      return null;
    }

    return $SleepStagesCopyWith<$Res>(_value.stages!, (value) {
      return _then(_value.copyWith(stages: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SleepPerformanceImplCopyWith<$Res>
    implements $SleepPerformanceCopyWith<$Res> {
  factory _$$SleepPerformanceImplCopyWith(
    _$SleepPerformanceImpl value,
    $Res Function(_$SleepPerformanceImpl) then,
  ) = __$$SleepPerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double actualSleep,
    double neededSleep,
    int? efficiency,
    SleepStages? stages,
    int? qualityScore,
  });

  @override
  $SleepStagesCopyWith<$Res>? get stages;
}

/// @nodoc
class __$$SleepPerformanceImplCopyWithImpl<$Res>
    extends _$SleepPerformanceCopyWithImpl<$Res, _$SleepPerformanceImpl>
    implements _$$SleepPerformanceImplCopyWith<$Res> {
  __$$SleepPerformanceImplCopyWithImpl(
    _$SleepPerformanceImpl _value,
    $Res Function(_$SleepPerformanceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SleepPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actualSleep = null,
    Object? neededSleep = null,
    Object? efficiency = freezed,
    Object? stages = freezed,
    Object? qualityScore = freezed,
  }) {
    return _then(
      _$SleepPerformanceImpl(
        actualSleep: null == actualSleep
            ? _value.actualSleep
            : actualSleep // ignore: cast_nullable_to_non_nullable
                  as double,
        neededSleep: null == neededSleep
            ? _value.neededSleep
            : neededSleep // ignore: cast_nullable_to_non_nullable
                  as double,
        efficiency: freezed == efficiency
            ? _value.efficiency
            : efficiency // ignore: cast_nullable_to_non_nullable
                  as int?,
        stages: freezed == stages
            ? _value.stages
            : stages // ignore: cast_nullable_to_non_nullable
                  as SleepStages?,
        qualityScore: freezed == qualityScore
            ? _value.qualityScore
            : qualityScore // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepPerformanceImpl implements _SleepPerformance {
  const _$SleepPerformanceImpl({
    required this.actualSleep,
    required this.neededSleep,
    this.efficiency,
    this.stages,
    this.qualityScore,
  });

  factory _$SleepPerformanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepPerformanceImplFromJson(json);

  /// Actual sleep duration in hours
  @override
  final double actualSleep;

  /// Needed sleep in hours (based on strain and recovery)
  @override
  final double neededSleep;

  /// Sleep efficiency percentage (time asleep / time in bed)
  @override
  final int? efficiency;

  /// Time spent in different sleep stages (if available)
  @override
  final SleepStages? stages;

  /// Sleep quality score (0-100)
  @override
  final int? qualityScore;

  @override
  String toString() {
    return 'SleepPerformance(actualSleep: $actualSleep, neededSleep: $neededSleep, efficiency: $efficiency, stages: $stages, qualityScore: $qualityScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepPerformanceImpl &&
            (identical(other.actualSleep, actualSleep) ||
                other.actualSleep == actualSleep) &&
            (identical(other.neededSleep, neededSleep) ||
                other.neededSleep == neededSleep) &&
            (identical(other.efficiency, efficiency) ||
                other.efficiency == efficiency) &&
            (identical(other.stages, stages) || other.stages == stages) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    actualSleep,
    neededSleep,
    efficiency,
    stages,
    qualityScore,
  );

  /// Create a copy of SleepPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepPerformanceImplCopyWith<_$SleepPerformanceImpl> get copyWith =>
      __$$SleepPerformanceImplCopyWithImpl<_$SleepPerformanceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepPerformanceImplToJson(this);
  }
}

abstract class _SleepPerformance implements SleepPerformance {
  const factory _SleepPerformance({
    required final double actualSleep,
    required final double neededSleep,
    final int? efficiency,
    final SleepStages? stages,
    final int? qualityScore,
  }) = _$SleepPerformanceImpl;

  factory _SleepPerformance.fromJson(Map<String, dynamic> json) =
      _$SleepPerformanceImpl.fromJson;

  /// Actual sleep duration in hours
  @override
  double get actualSleep;

  /// Needed sleep in hours (based on strain and recovery)
  @override
  double get neededSleep;

  /// Sleep efficiency percentage (time asleep / time in bed)
  @override
  int? get efficiency;

  /// Time spent in different sleep stages (if available)
  @override
  SleepStages? get stages;

  /// Sleep quality score (0-100)
  @override
  int? get qualityScore;

  /// Create a copy of SleepPerformance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepPerformanceImplCopyWith<_$SleepPerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SleepStages _$SleepStagesFromJson(Map<String, dynamic> json) {
  return _SleepStages.fromJson(json);
}

/// @nodoc
mixin _$SleepStages {
  /// Minutes in light sleep
  int get lightMinutes => throw _privateConstructorUsedError;

  /// Minutes in deep sleep (SWS)
  int get deepMinutes => throw _privateConstructorUsedError;

  /// Minutes in REM sleep
  int get remMinutes => throw _privateConstructorUsedError;

  /// Minutes awake during sleep period
  int get awakeMinutes => throw _privateConstructorUsedError;

  /// Serializes this SleepStages to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepStages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepStagesCopyWith<SleepStages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepStagesCopyWith<$Res> {
  factory $SleepStagesCopyWith(
    SleepStages value,
    $Res Function(SleepStages) then,
  ) = _$SleepStagesCopyWithImpl<$Res, SleepStages>;
  @useResult
  $Res call({
    int lightMinutes,
    int deepMinutes,
    int remMinutes,
    int awakeMinutes,
  });
}

/// @nodoc
class _$SleepStagesCopyWithImpl<$Res, $Val extends SleepStages>
    implements $SleepStagesCopyWith<$Res> {
  _$SleepStagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepStages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightMinutes = null,
    Object? deepMinutes = null,
    Object? remMinutes = null,
    Object? awakeMinutes = null,
  }) {
    return _then(
      _value.copyWith(
            lightMinutes: null == lightMinutes
                ? _value.lightMinutes
                : lightMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            deepMinutes: null == deepMinutes
                ? _value.deepMinutes
                : deepMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            remMinutes: null == remMinutes
                ? _value.remMinutes
                : remMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            awakeMinutes: null == awakeMinutes
                ? _value.awakeMinutes
                : awakeMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SleepStagesImplCopyWith<$Res>
    implements $SleepStagesCopyWith<$Res> {
  factory _$$SleepStagesImplCopyWith(
    _$SleepStagesImpl value,
    $Res Function(_$SleepStagesImpl) then,
  ) = __$$SleepStagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int lightMinutes,
    int deepMinutes,
    int remMinutes,
    int awakeMinutes,
  });
}

/// @nodoc
class __$$SleepStagesImplCopyWithImpl<$Res>
    extends _$SleepStagesCopyWithImpl<$Res, _$SleepStagesImpl>
    implements _$$SleepStagesImplCopyWith<$Res> {
  __$$SleepStagesImplCopyWithImpl(
    _$SleepStagesImpl _value,
    $Res Function(_$SleepStagesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SleepStages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightMinutes = null,
    Object? deepMinutes = null,
    Object? remMinutes = null,
    Object? awakeMinutes = null,
  }) {
    return _then(
      _$SleepStagesImpl(
        lightMinutes: null == lightMinutes
            ? _value.lightMinutes
            : lightMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        deepMinutes: null == deepMinutes
            ? _value.deepMinutes
            : deepMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        remMinutes: null == remMinutes
            ? _value.remMinutes
            : remMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        awakeMinutes: null == awakeMinutes
            ? _value.awakeMinutes
            : awakeMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepStagesImpl implements _SleepStages {
  const _$SleepStagesImpl({
    this.lightMinutes = 0,
    this.deepMinutes = 0,
    this.remMinutes = 0,
    this.awakeMinutes = 0,
  });

  factory _$SleepStagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepStagesImplFromJson(json);

  /// Minutes in light sleep
  @override
  @JsonKey()
  final int lightMinutes;

  /// Minutes in deep sleep (SWS)
  @override
  @JsonKey()
  final int deepMinutes;

  /// Minutes in REM sleep
  @override
  @JsonKey()
  final int remMinutes;

  /// Minutes awake during sleep period
  @override
  @JsonKey()
  final int awakeMinutes;

  @override
  String toString() {
    return 'SleepStages(lightMinutes: $lightMinutes, deepMinutes: $deepMinutes, remMinutes: $remMinutes, awakeMinutes: $awakeMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepStagesImpl &&
            (identical(other.lightMinutes, lightMinutes) ||
                other.lightMinutes == lightMinutes) &&
            (identical(other.deepMinutes, deepMinutes) ||
                other.deepMinutes == deepMinutes) &&
            (identical(other.remMinutes, remMinutes) ||
                other.remMinutes == remMinutes) &&
            (identical(other.awakeMinutes, awakeMinutes) ||
                other.awakeMinutes == awakeMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    lightMinutes,
    deepMinutes,
    remMinutes,
    awakeMinutes,
  );

  /// Create a copy of SleepStages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepStagesImplCopyWith<_$SleepStagesImpl> get copyWith =>
      __$$SleepStagesImplCopyWithImpl<_$SleepStagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepStagesImplToJson(this);
  }
}

abstract class _SleepStages implements SleepStages {
  const factory _SleepStages({
    final int lightMinutes,
    final int deepMinutes,
    final int remMinutes,
    final int awakeMinutes,
  }) = _$SleepStagesImpl;

  factory _SleepStages.fromJson(Map<String, dynamic> json) =
      _$SleepStagesImpl.fromJson;

  /// Minutes in light sleep
  @override
  int get lightMinutes;

  /// Minutes in deep sleep (SWS)
  @override
  int get deepMinutes;

  /// Minutes in REM sleep
  @override
  int get remMinutes;

  /// Minutes awake during sleep period
  @override
  int get awakeMinutes;

  /// Create a copy of SleepStages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepStagesImplCopyWith<_$SleepStagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
