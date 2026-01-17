// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recovery_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecoveryMetrics _$RecoveryMetricsFromJson(Map<String, dynamic> json) {
  return _RecoveryMetrics.fromJson(json);
}

/// @nodoc
mixin _$RecoveryMetrics {
  String get id => throw _privateConstructorUsedError;
  String get dailyLogId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get fetchedAt => throw _privateConstructorUsedError;
  double? get sleepDuration => throw _privateConstructorUsedError; // in hours
  int? get sleepQuality =>
      throw _privateConstructorUsedError; // 1-100 if available
  int? get hrv =>
      throw _privateConstructorUsedError; // Heart Rate Variability in ms
  int? get restingHR =>
      throw _privateConstructorUsedError; // Resting Heart Rate in bpm
  int? get steps => throw _privateConstructorUsedError;
  int? get activeEnergy => throw _privateConstructorUsedError; // in kcal
  int? get workoutsCount => throw _privateConstructorUsedError;
  DataSource get dataSource => throw _privateConstructorUsedError;

  /// Serializes this RecoveryMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecoveryMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecoveryMetricsCopyWith<RecoveryMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveryMetricsCopyWith<$Res> {
  factory $RecoveryMetricsCopyWith(
    RecoveryMetrics value,
    $Res Function(RecoveryMetrics) then,
  ) = _$RecoveryMetricsCopyWithImpl<$Res, RecoveryMetrics>;
  @useResult
  $Res call({
    String id,
    String dailyLogId,
    DateTime date,
    DateTime fetchedAt,
    double? sleepDuration,
    int? sleepQuality,
    int? hrv,
    int? restingHR,
    int? steps,
    int? activeEnergy,
    int? workoutsCount,
    DataSource dataSource,
  });
}

/// @nodoc
class _$RecoveryMetricsCopyWithImpl<$Res, $Val extends RecoveryMetrics>
    implements $RecoveryMetricsCopyWith<$Res> {
  _$RecoveryMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecoveryMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dailyLogId = null,
    Object? date = null,
    Object? fetchedAt = null,
    Object? sleepDuration = freezed,
    Object? sleepQuality = freezed,
    Object? hrv = freezed,
    Object? restingHR = freezed,
    Object? steps = freezed,
    Object? activeEnergy = freezed,
    Object? workoutsCount = freezed,
    Object? dataSource = null,
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
            fetchedAt: null == fetchedAt
                ? _value.fetchedAt
                : fetchedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            sleepDuration: freezed == sleepDuration
                ? _value.sleepDuration
                : sleepDuration // ignore: cast_nullable_to_non_nullable
                      as double?,
            sleepQuality: freezed == sleepQuality
                ? _value.sleepQuality
                : sleepQuality // ignore: cast_nullable_to_non_nullable
                      as int?,
            hrv: freezed == hrv
                ? _value.hrv
                : hrv // ignore: cast_nullable_to_non_nullable
                      as int?,
            restingHR: freezed == restingHR
                ? _value.restingHR
                : restingHR // ignore: cast_nullable_to_non_nullable
                      as int?,
            steps: freezed == steps
                ? _value.steps
                : steps // ignore: cast_nullable_to_non_nullable
                      as int?,
            activeEnergy: freezed == activeEnergy
                ? _value.activeEnergy
                : activeEnergy // ignore: cast_nullable_to_non_nullable
                      as int?,
            workoutsCount: freezed == workoutsCount
                ? _value.workoutsCount
                : workoutsCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            dataSource: null == dataSource
                ? _value.dataSource
                : dataSource // ignore: cast_nullable_to_non_nullable
                      as DataSource,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecoveryMetricsImplCopyWith<$Res>
    implements $RecoveryMetricsCopyWith<$Res> {
  factory _$$RecoveryMetricsImplCopyWith(
    _$RecoveryMetricsImpl value,
    $Res Function(_$RecoveryMetricsImpl) then,
  ) = __$$RecoveryMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String dailyLogId,
    DateTime date,
    DateTime fetchedAt,
    double? sleepDuration,
    int? sleepQuality,
    int? hrv,
    int? restingHR,
    int? steps,
    int? activeEnergy,
    int? workoutsCount,
    DataSource dataSource,
  });
}

/// @nodoc
class __$$RecoveryMetricsImplCopyWithImpl<$Res>
    extends _$RecoveryMetricsCopyWithImpl<$Res, _$RecoveryMetricsImpl>
    implements _$$RecoveryMetricsImplCopyWith<$Res> {
  __$$RecoveryMetricsImplCopyWithImpl(
    _$RecoveryMetricsImpl _value,
    $Res Function(_$RecoveryMetricsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecoveryMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dailyLogId = null,
    Object? date = null,
    Object? fetchedAt = null,
    Object? sleepDuration = freezed,
    Object? sleepQuality = freezed,
    Object? hrv = freezed,
    Object? restingHR = freezed,
    Object? steps = freezed,
    Object? activeEnergy = freezed,
    Object? workoutsCount = freezed,
    Object? dataSource = null,
  }) {
    return _then(
      _$RecoveryMetricsImpl(
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
        fetchedAt: null == fetchedAt
            ? _value.fetchedAt
            : fetchedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        sleepDuration: freezed == sleepDuration
            ? _value.sleepDuration
            : sleepDuration // ignore: cast_nullable_to_non_nullable
                  as double?,
        sleepQuality: freezed == sleepQuality
            ? _value.sleepQuality
            : sleepQuality // ignore: cast_nullable_to_non_nullable
                  as int?,
        hrv: freezed == hrv
            ? _value.hrv
            : hrv // ignore: cast_nullable_to_non_nullable
                  as int?,
        restingHR: freezed == restingHR
            ? _value.restingHR
            : restingHR // ignore: cast_nullable_to_non_nullable
                  as int?,
        steps: freezed == steps
            ? _value.steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as int?,
        activeEnergy: freezed == activeEnergy
            ? _value.activeEnergy
            : activeEnergy // ignore: cast_nullable_to_non_nullable
                  as int?,
        workoutsCount: freezed == workoutsCount
            ? _value.workoutsCount
            : workoutsCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        dataSource: null == dataSource
            ? _value.dataSource
            : dataSource // ignore: cast_nullable_to_non_nullable
                  as DataSource,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecoveryMetricsImpl implements _RecoveryMetrics {
  const _$RecoveryMetricsImpl({
    required this.id,
    required this.dailyLogId,
    required this.date,
    required this.fetchedAt,
    this.sleepDuration,
    this.sleepQuality,
    this.hrv,
    this.restingHR,
    this.steps,
    this.activeEnergy,
    this.workoutsCount,
    required this.dataSource,
  });

  factory _$RecoveryMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecoveryMetricsImplFromJson(json);

  @override
  final String id;
  @override
  final String dailyLogId;
  @override
  final DateTime date;
  @override
  final DateTime fetchedAt;
  @override
  final double? sleepDuration;
  // in hours
  @override
  final int? sleepQuality;
  // 1-100 if available
  @override
  final int? hrv;
  // Heart Rate Variability in ms
  @override
  final int? restingHR;
  // Resting Heart Rate in bpm
  @override
  final int? steps;
  @override
  final int? activeEnergy;
  // in kcal
  @override
  final int? workoutsCount;
  @override
  final DataSource dataSource;

  @override
  String toString() {
    return 'RecoveryMetrics(id: $id, dailyLogId: $dailyLogId, date: $date, fetchedAt: $fetchedAt, sleepDuration: $sleepDuration, sleepQuality: $sleepQuality, hrv: $hrv, restingHR: $restingHR, steps: $steps, activeEnergy: $activeEnergy, workoutsCount: $workoutsCount, dataSource: $dataSource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecoveryMetricsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dailyLogId, dailyLogId) ||
                other.dailyLogId == dailyLogId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fetchedAt, fetchedAt) ||
                other.fetchedAt == fetchedAt) &&
            (identical(other.sleepDuration, sleepDuration) ||
                other.sleepDuration == sleepDuration) &&
            (identical(other.sleepQuality, sleepQuality) ||
                other.sleepQuality == sleepQuality) &&
            (identical(other.hrv, hrv) || other.hrv == hrv) &&
            (identical(other.restingHR, restingHR) ||
                other.restingHR == restingHR) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.activeEnergy, activeEnergy) ||
                other.activeEnergy == activeEnergy) &&
            (identical(other.workoutsCount, workoutsCount) ||
                other.workoutsCount == workoutsCount) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    dailyLogId,
    date,
    fetchedAt,
    sleepDuration,
    sleepQuality,
    hrv,
    restingHR,
    steps,
    activeEnergy,
    workoutsCount,
    dataSource,
  );

  /// Create a copy of RecoveryMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecoveryMetricsImplCopyWith<_$RecoveryMetricsImpl> get copyWith =>
      __$$RecoveryMetricsImplCopyWithImpl<_$RecoveryMetricsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecoveryMetricsImplToJson(this);
  }
}

abstract class _RecoveryMetrics implements RecoveryMetrics {
  const factory _RecoveryMetrics({
    required final String id,
    required final String dailyLogId,
    required final DateTime date,
    required final DateTime fetchedAt,
    final double? sleepDuration,
    final int? sleepQuality,
    final int? hrv,
    final int? restingHR,
    final int? steps,
    final int? activeEnergy,
    final int? workoutsCount,
    required final DataSource dataSource,
  }) = _$RecoveryMetricsImpl;

  factory _RecoveryMetrics.fromJson(Map<String, dynamic> json) =
      _$RecoveryMetricsImpl.fromJson;

  @override
  String get id;
  @override
  String get dailyLogId;
  @override
  DateTime get date;
  @override
  DateTime get fetchedAt;
  @override
  double? get sleepDuration; // in hours
  @override
  int? get sleepQuality; // 1-100 if available
  @override
  int? get hrv; // Heart Rate Variability in ms
  @override
  int? get restingHR; // Resting Heart Rate in bpm
  @override
  int? get steps;
  @override
  int? get activeEnergy; // in kcal
  @override
  int? get workoutsCount;
  @override
  DataSource get dataSource;

  /// Create a copy of RecoveryMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecoveryMetricsImplCopyWith<_$RecoveryMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyBrief _$DailyBriefFromJson(Map<String, dynamic> json) {
  return _DailyBrief.fromJson(json);
}

/// @nodoc
mixin _$DailyBrief {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  int get recoveryScore => throw _privateConstructorUsedError; // 0-100
  int get readinessScore => throw _privateConstructorUsedError; // 0-100
  List<String> get topActions => throw _privateConstructorUsedError; // max 3
  List<String> get warnings => throw _privateConstructorUsedError; // max 2
  int get suggestedIntensity => throw _privateConstructorUsedError; // 1-5
  String get coachingText => throw _privateConstructorUsedError;
  bool get isAiGenerated => throw _privateConstructorUsedError;
  String? get dailyLogId => throw _privateConstructorUsedError;

  /// Serializes this DailyBrief to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyBrief
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyBriefCopyWith<DailyBrief> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyBriefCopyWith<$Res> {
  factory $DailyBriefCopyWith(
    DailyBrief value,
    $Res Function(DailyBrief) then,
  ) = _$DailyBriefCopyWithImpl<$Res, DailyBrief>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime generatedAt,
    int recoveryScore,
    int readinessScore,
    List<String> topActions,
    List<String> warnings,
    int suggestedIntensity,
    String coachingText,
    bool isAiGenerated,
    String? dailyLogId,
  });
}

/// @nodoc
class _$DailyBriefCopyWithImpl<$Res, $Val extends DailyBrief>
    implements $DailyBriefCopyWith<$Res> {
  _$DailyBriefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyBrief
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? generatedAt = null,
    Object? recoveryScore = null,
    Object? readinessScore = null,
    Object? topActions = null,
    Object? warnings = null,
    Object? suggestedIntensity = null,
    Object? coachingText = null,
    Object? isAiGenerated = null,
    Object? dailyLogId = freezed,
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
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            recoveryScore: null == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int,
            readinessScore: null == readinessScore
                ? _value.readinessScore
                : readinessScore // ignore: cast_nullable_to_non_nullable
                      as int,
            topActions: null == topActions
                ? _value.topActions
                : topActions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            warnings: null == warnings
                ? _value.warnings
                : warnings // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            suggestedIntensity: null == suggestedIntensity
                ? _value.suggestedIntensity
                : suggestedIntensity // ignore: cast_nullable_to_non_nullable
                      as int,
            coachingText: null == coachingText
                ? _value.coachingText
                : coachingText // ignore: cast_nullable_to_non_nullable
                      as String,
            isAiGenerated: null == isAiGenerated
                ? _value.isAiGenerated
                : isAiGenerated // ignore: cast_nullable_to_non_nullable
                      as bool,
            dailyLogId: freezed == dailyLogId
                ? _value.dailyLogId
                : dailyLogId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyBriefImplCopyWith<$Res>
    implements $DailyBriefCopyWith<$Res> {
  factory _$$DailyBriefImplCopyWith(
    _$DailyBriefImpl value,
    $Res Function(_$DailyBriefImpl) then,
  ) = __$$DailyBriefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime generatedAt,
    int recoveryScore,
    int readinessScore,
    List<String> topActions,
    List<String> warnings,
    int suggestedIntensity,
    String coachingText,
    bool isAiGenerated,
    String? dailyLogId,
  });
}

/// @nodoc
class __$$DailyBriefImplCopyWithImpl<$Res>
    extends _$DailyBriefCopyWithImpl<$Res, _$DailyBriefImpl>
    implements _$$DailyBriefImplCopyWith<$Res> {
  __$$DailyBriefImplCopyWithImpl(
    _$DailyBriefImpl _value,
    $Res Function(_$DailyBriefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyBrief
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? generatedAt = null,
    Object? recoveryScore = null,
    Object? readinessScore = null,
    Object? topActions = null,
    Object? warnings = null,
    Object? suggestedIntensity = null,
    Object? coachingText = null,
    Object? isAiGenerated = null,
    Object? dailyLogId = freezed,
  }) {
    return _then(
      _$DailyBriefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        recoveryScore: null == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as int,
        readinessScore: null == readinessScore
            ? _value.readinessScore
            : readinessScore // ignore: cast_nullable_to_non_nullable
                  as int,
        topActions: null == topActions
            ? _value._topActions
            : topActions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        warnings: null == warnings
            ? _value._warnings
            : warnings // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        suggestedIntensity: null == suggestedIntensity
            ? _value.suggestedIntensity
            : suggestedIntensity // ignore: cast_nullable_to_non_nullable
                  as int,
        coachingText: null == coachingText
            ? _value.coachingText
            : coachingText // ignore: cast_nullable_to_non_nullable
                  as String,
        isAiGenerated: null == isAiGenerated
            ? _value.isAiGenerated
            : isAiGenerated // ignore: cast_nullable_to_non_nullable
                  as bool,
        dailyLogId: freezed == dailyLogId
            ? _value.dailyLogId
            : dailyLogId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyBriefImpl implements _DailyBrief {
  const _$DailyBriefImpl({
    required this.id,
    required this.date,
    required this.generatedAt,
    required this.recoveryScore,
    required this.readinessScore,
    final List<String> topActions = const [],
    final List<String> warnings = const [],
    required this.suggestedIntensity,
    required this.coachingText,
    this.isAiGenerated = true,
    this.dailyLogId,
  }) : _topActions = topActions,
       _warnings = warnings;

  factory _$DailyBriefImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyBriefImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime generatedAt;
  @override
  final int recoveryScore;
  // 0-100
  @override
  final int readinessScore;
  // 0-100
  final List<String> _topActions;
  // 0-100
  @override
  @JsonKey()
  List<String> get topActions {
    if (_topActions is EqualUnmodifiableListView) return _topActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topActions);
  }

  // max 3
  final List<String> _warnings;
  // max 3
  @override
  @JsonKey()
  List<String> get warnings {
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warnings);
  }

  // max 2
  @override
  final int suggestedIntensity;
  // 1-5
  @override
  final String coachingText;
  @override
  @JsonKey()
  final bool isAiGenerated;
  @override
  final String? dailyLogId;

  @override
  String toString() {
    return 'DailyBrief(id: $id, date: $date, generatedAt: $generatedAt, recoveryScore: $recoveryScore, readinessScore: $readinessScore, topActions: $topActions, warnings: $warnings, suggestedIntensity: $suggestedIntensity, coachingText: $coachingText, isAiGenerated: $isAiGenerated, dailyLogId: $dailyLogId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyBriefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.readinessScore, readinessScore) ||
                other.readinessScore == readinessScore) &&
            const DeepCollectionEquality().equals(
              other._topActions,
              _topActions,
            ) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings) &&
            (identical(other.suggestedIntensity, suggestedIntensity) ||
                other.suggestedIntensity == suggestedIntensity) &&
            (identical(other.coachingText, coachingText) ||
                other.coachingText == coachingText) &&
            (identical(other.isAiGenerated, isAiGenerated) ||
                other.isAiGenerated == isAiGenerated) &&
            (identical(other.dailyLogId, dailyLogId) ||
                other.dailyLogId == dailyLogId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    generatedAt,
    recoveryScore,
    readinessScore,
    const DeepCollectionEquality().hash(_topActions),
    const DeepCollectionEquality().hash(_warnings),
    suggestedIntensity,
    coachingText,
    isAiGenerated,
    dailyLogId,
  );

  /// Create a copy of DailyBrief
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyBriefImplCopyWith<_$DailyBriefImpl> get copyWith =>
      __$$DailyBriefImplCopyWithImpl<_$DailyBriefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyBriefImplToJson(this);
  }
}

abstract class _DailyBrief implements DailyBrief {
  const factory _DailyBrief({
    required final String id,
    required final DateTime date,
    required final DateTime generatedAt,
    required final int recoveryScore,
    required final int readinessScore,
    final List<String> topActions,
    final List<String> warnings,
    required final int suggestedIntensity,
    required final String coachingText,
    final bool isAiGenerated,
    final String? dailyLogId,
  }) = _$DailyBriefImpl;

  factory _DailyBrief.fromJson(Map<String, dynamic> json) =
      _$DailyBriefImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get generatedAt;
  @override
  int get recoveryScore; // 0-100
  @override
  int get readinessScore; // 0-100
  @override
  List<String> get topActions; // max 3
  @override
  List<String> get warnings; // max 2
  @override
  int get suggestedIntensity; // 1-5
  @override
  String get coachingText;
  @override
  bool get isAiGenerated;
  @override
  String? get dailyLogId;

  /// Create a copy of DailyBrief
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyBriefImplCopyWith<_$DailyBriefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyReport _$WeeklyReportFromJson(Map<String, dynamic> json) {
  return _WeeklyReport.fromJson(json);
}

/// @nodoc
mixin _$WeeklyReport {
  String get id => throw _privateConstructorUsedError;
  DateTime get weekStartDate => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  List<String> get highlights => throw _privateConstructorUsedError;
  List<String> get concerns => throw _privateConstructorUsedError;
  String get progressAnalysis => throw _privateConstructorUsedError;
  String get nextWeekFocus => throw _privateConstructorUsedError;
  bool get isAiGenerated => throw _privateConstructorUsedError;

  /// Serializes this WeeklyReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyReportCopyWith<WeeklyReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyReportCopyWith<$Res> {
  factory $WeeklyReportCopyWith(
    WeeklyReport value,
    $Res Function(WeeklyReport) then,
  ) = _$WeeklyReportCopyWithImpl<$Res, WeeklyReport>;
  @useResult
  $Res call({
    String id,
    DateTime weekStartDate,
    DateTime generatedAt,
    String summary,
    List<String> highlights,
    List<String> concerns,
    String progressAnalysis,
    String nextWeekFocus,
    bool isAiGenerated,
  });
}

/// @nodoc
class _$WeeklyReportCopyWithImpl<$Res, $Val extends WeeklyReport>
    implements $WeeklyReportCopyWith<$Res> {
  _$WeeklyReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekStartDate = null,
    Object? generatedAt = null,
    Object? summary = null,
    Object? highlights = null,
    Object? concerns = null,
    Object? progressAnalysis = null,
    Object? nextWeekFocus = null,
    Object? isAiGenerated = null,
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
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
            highlights: null == highlights
                ? _value.highlights
                : highlights // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            concerns: null == concerns
                ? _value.concerns
                : concerns // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            progressAnalysis: null == progressAnalysis
                ? _value.progressAnalysis
                : progressAnalysis // ignore: cast_nullable_to_non_nullable
                      as String,
            nextWeekFocus: null == nextWeekFocus
                ? _value.nextWeekFocus
                : nextWeekFocus // ignore: cast_nullable_to_non_nullable
                      as String,
            isAiGenerated: null == isAiGenerated
                ? _value.isAiGenerated
                : isAiGenerated // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeeklyReportImplCopyWith<$Res>
    implements $WeeklyReportCopyWith<$Res> {
  factory _$$WeeklyReportImplCopyWith(
    _$WeeklyReportImpl value,
    $Res Function(_$WeeklyReportImpl) then,
  ) = __$$WeeklyReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime weekStartDate,
    DateTime generatedAt,
    String summary,
    List<String> highlights,
    List<String> concerns,
    String progressAnalysis,
    String nextWeekFocus,
    bool isAiGenerated,
  });
}

/// @nodoc
class __$$WeeklyReportImplCopyWithImpl<$Res>
    extends _$WeeklyReportCopyWithImpl<$Res, _$WeeklyReportImpl>
    implements _$$WeeklyReportImplCopyWith<$Res> {
  __$$WeeklyReportImplCopyWithImpl(
    _$WeeklyReportImpl _value,
    $Res Function(_$WeeklyReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekStartDate = null,
    Object? generatedAt = null,
    Object? summary = null,
    Object? highlights = null,
    Object? concerns = null,
    Object? progressAnalysis = null,
    Object? nextWeekFocus = null,
    Object? isAiGenerated = null,
  }) {
    return _then(
      _$WeeklyReportImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        weekStartDate: null == weekStartDate
            ? _value.weekStartDate
            : weekStartDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
        highlights: null == highlights
            ? _value._highlights
            : highlights // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        concerns: null == concerns
            ? _value._concerns
            : concerns // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        progressAnalysis: null == progressAnalysis
            ? _value.progressAnalysis
            : progressAnalysis // ignore: cast_nullable_to_non_nullable
                  as String,
        nextWeekFocus: null == nextWeekFocus
            ? _value.nextWeekFocus
            : nextWeekFocus // ignore: cast_nullable_to_non_nullable
                  as String,
        isAiGenerated: null == isAiGenerated
            ? _value.isAiGenerated
            : isAiGenerated // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyReportImpl implements _WeeklyReport {
  const _$WeeklyReportImpl({
    required this.id,
    required this.weekStartDate,
    required this.generatedAt,
    required this.summary,
    final List<String> highlights = const [],
    final List<String> concerns = const [],
    required this.progressAnalysis,
    required this.nextWeekFocus,
    this.isAiGenerated = true,
  }) : _highlights = highlights,
       _concerns = concerns;

  factory _$WeeklyReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyReportImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime weekStartDate;
  @override
  final DateTime generatedAt;
  @override
  final String summary;
  final List<String> _highlights;
  @override
  @JsonKey()
  List<String> get highlights {
    if (_highlights is EqualUnmodifiableListView) return _highlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlights);
  }

  final List<String> _concerns;
  @override
  @JsonKey()
  List<String> get concerns {
    if (_concerns is EqualUnmodifiableListView) return _concerns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_concerns);
  }

  @override
  final String progressAnalysis;
  @override
  final String nextWeekFocus;
  @override
  @JsonKey()
  final bool isAiGenerated;

  @override
  String toString() {
    return 'WeeklyReport(id: $id, weekStartDate: $weekStartDate, generatedAt: $generatedAt, summary: $summary, highlights: $highlights, concerns: $concerns, progressAnalysis: $progressAnalysis, nextWeekFocus: $nextWeekFocus, isAiGenerated: $isAiGenerated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(
              other._highlights,
              _highlights,
            ) &&
            const DeepCollectionEquality().equals(other._concerns, _concerns) &&
            (identical(other.progressAnalysis, progressAnalysis) ||
                other.progressAnalysis == progressAnalysis) &&
            (identical(other.nextWeekFocus, nextWeekFocus) ||
                other.nextWeekFocus == nextWeekFocus) &&
            (identical(other.isAiGenerated, isAiGenerated) ||
                other.isAiGenerated == isAiGenerated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    weekStartDate,
    generatedAt,
    summary,
    const DeepCollectionEquality().hash(_highlights),
    const DeepCollectionEquality().hash(_concerns),
    progressAnalysis,
    nextWeekFocus,
    isAiGenerated,
  );

  /// Create a copy of WeeklyReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyReportImplCopyWith<_$WeeklyReportImpl> get copyWith =>
      __$$WeeklyReportImplCopyWithImpl<_$WeeklyReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyReportImplToJson(this);
  }
}

abstract class _WeeklyReport implements WeeklyReport {
  const factory _WeeklyReport({
    required final String id,
    required final DateTime weekStartDate,
    required final DateTime generatedAt,
    required final String summary,
    final List<String> highlights,
    final List<String> concerns,
    required final String progressAnalysis,
    required final String nextWeekFocus,
    final bool isAiGenerated,
  }) = _$WeeklyReportImpl;

  factory _WeeklyReport.fromJson(Map<String, dynamic> json) =
      _$WeeklyReportImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get weekStartDate;
  @override
  DateTime get generatedAt;
  @override
  String get summary;
  @override
  List<String> get highlights;
  @override
  List<String> get concerns;
  @override
  String get progressAnalysis;
  @override
  String get nextWeekFocus;
  @override
  bool get isAiGenerated;

  /// Create a copy of WeeklyReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyReportImplCopyWith<_$WeeklyReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
