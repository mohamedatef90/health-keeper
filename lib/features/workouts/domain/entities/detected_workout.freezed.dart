// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detected_workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DetectedWorkout _$DetectedWorkoutFromJson(Map<String, dynamic> json) {
  return _DetectedWorkout.fromJson(json);
}

/// @nodoc
mixin _$DetectedWorkout {
  String get id => throw _privateConstructorUsedError;

  /// When the workout started
  DateTime get startTime => throw _privateConstructorUsedError;

  /// When the workout ended
  DateTime get endTime => throw _privateConstructorUsedError;

  /// Duration in minutes
  int get durationMinutes => throw _privateConstructorUsedError;

  /// Average heart rate during the workout
  double get averageHeartRate => throw _privateConstructorUsedError;

  /// Maximum heart rate recorded
  double get maxHeartRate => throw _privateConstructorUsedError;

  /// Minimum heart rate during workout
  double? get minHeartRate => throw _privateConstructorUsedError;

  /// Heart rate samples during workout
  List<HeartRateSample> get heartRateSamples =>
      throw _privateConstructorUsedError;

  /// Estimated calories burned
  int get estimatedCalories => throw _privateConstructorUsedError;

  /// Detected intensity level
  WorkoutIntensity get intensity => throw _privateConstructorUsedError;

  /// Suggested workout type based on pattern analysis
  String get suggestedType => throw _privateConstructorUsedError;

  /// AI confidence in the workout detection (0-100)
  double get confidence => throw _privateConstructorUsedError;

  /// Step count during workout (if available)
  int? get steps => throw _privateConstructorUsedError;

  /// Active energy burned (HealthKit)
  int? get activeEnergy => throw _privateConstructorUsedError;

  /// Distance covered (if applicable, in meters)
  double? get distanceMeters => throw _privateConstructorUsedError;

  /// Elevation gain (if applicable, in meters)
  double? get elevationGain => throw _privateConstructorUsedError;

  /// Heart rate zones distribution
  HeartRateZones? get heartRateZones => throw _privateConstructorUsedError;

  /// Detection source
  DetectionSource get source => throw _privateConstructorUsedError;

  /// Has this workout been confirmed by the user?
  bool get isConfirmed => throw _privateConstructorUsedError;

  /// Has the user dismissed this detection?
  bool get isDismissed => throw _privateConstructorUsedError;

  /// Notes from AI analysis
  String? get analysisNotes => throw _privateConstructorUsedError;

  /// Serializes this DetectedWorkout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectedWorkout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectedWorkoutCopyWith<DetectedWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectedWorkoutCopyWith<$Res> {
  factory $DetectedWorkoutCopyWith(
    DetectedWorkout value,
    $Res Function(DetectedWorkout) then,
  ) = _$DetectedWorkoutCopyWithImpl<$Res, DetectedWorkout>;
  @useResult
  $Res call({
    String id,
    DateTime startTime,
    DateTime endTime,
    int durationMinutes,
    double averageHeartRate,
    double maxHeartRate,
    double? minHeartRate,
    List<HeartRateSample> heartRateSamples,
    int estimatedCalories,
    WorkoutIntensity intensity,
    String suggestedType,
    double confidence,
    int? steps,
    int? activeEnergy,
    double? distanceMeters,
    double? elevationGain,
    HeartRateZones? heartRateZones,
    DetectionSource source,
    bool isConfirmed,
    bool isDismissed,
    String? analysisNotes,
  });

  $HeartRateZonesCopyWith<$Res>? get heartRateZones;
}

/// @nodoc
class _$DetectedWorkoutCopyWithImpl<$Res, $Val extends DetectedWorkout>
    implements $DetectedWorkoutCopyWith<$Res> {
  _$DetectedWorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectedWorkout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? durationMinutes = null,
    Object? averageHeartRate = null,
    Object? maxHeartRate = null,
    Object? minHeartRate = freezed,
    Object? heartRateSamples = null,
    Object? estimatedCalories = null,
    Object? intensity = null,
    Object? suggestedType = null,
    Object? confidence = null,
    Object? steps = freezed,
    Object? activeEnergy = freezed,
    Object? distanceMeters = freezed,
    Object? elevationGain = freezed,
    Object? heartRateZones = freezed,
    Object? source = null,
    Object? isConfirmed = null,
    Object? isDismissed = null,
    Object? analysisNotes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            durationMinutes: null == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            averageHeartRate: null == averageHeartRate
                ? _value.averageHeartRate
                : averageHeartRate // ignore: cast_nullable_to_non_nullable
                      as double,
            maxHeartRate: null == maxHeartRate
                ? _value.maxHeartRate
                : maxHeartRate // ignore: cast_nullable_to_non_nullable
                      as double,
            minHeartRate: freezed == minHeartRate
                ? _value.minHeartRate
                : minHeartRate // ignore: cast_nullable_to_non_nullable
                      as double?,
            heartRateSamples: null == heartRateSamples
                ? _value.heartRateSamples
                : heartRateSamples // ignore: cast_nullable_to_non_nullable
                      as List<HeartRateSample>,
            estimatedCalories: null == estimatedCalories
                ? _value.estimatedCalories
                : estimatedCalories // ignore: cast_nullable_to_non_nullable
                      as int,
            intensity: null == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                      as WorkoutIntensity,
            suggestedType: null == suggestedType
                ? _value.suggestedType
                : suggestedType // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            steps: freezed == steps
                ? _value.steps
                : steps // ignore: cast_nullable_to_non_nullable
                      as int?,
            activeEnergy: freezed == activeEnergy
                ? _value.activeEnergy
                : activeEnergy // ignore: cast_nullable_to_non_nullable
                      as int?,
            distanceMeters: freezed == distanceMeters
                ? _value.distanceMeters
                : distanceMeters // ignore: cast_nullable_to_non_nullable
                      as double?,
            elevationGain: freezed == elevationGain
                ? _value.elevationGain
                : elevationGain // ignore: cast_nullable_to_non_nullable
                      as double?,
            heartRateZones: freezed == heartRateZones
                ? _value.heartRateZones
                : heartRateZones // ignore: cast_nullable_to_non_nullable
                      as HeartRateZones?,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as DetectionSource,
            isConfirmed: null == isConfirmed
                ? _value.isConfirmed
                : isConfirmed // ignore: cast_nullable_to_non_nullable
                      as bool,
            isDismissed: null == isDismissed
                ? _value.isDismissed
                : isDismissed // ignore: cast_nullable_to_non_nullable
                      as bool,
            analysisNotes: freezed == analysisNotes
                ? _value.analysisNotes
                : analysisNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of DetectedWorkout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HeartRateZonesCopyWith<$Res>? get heartRateZones {
    if (_value.heartRateZones == null) {
      return null;
    }

    return $HeartRateZonesCopyWith<$Res>(_value.heartRateZones!, (value) {
      return _then(_value.copyWith(heartRateZones: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetectedWorkoutImplCopyWith<$Res>
    implements $DetectedWorkoutCopyWith<$Res> {
  factory _$$DetectedWorkoutImplCopyWith(
    _$DetectedWorkoutImpl value,
    $Res Function(_$DetectedWorkoutImpl) then,
  ) = __$$DetectedWorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime startTime,
    DateTime endTime,
    int durationMinutes,
    double averageHeartRate,
    double maxHeartRate,
    double? minHeartRate,
    List<HeartRateSample> heartRateSamples,
    int estimatedCalories,
    WorkoutIntensity intensity,
    String suggestedType,
    double confidence,
    int? steps,
    int? activeEnergy,
    double? distanceMeters,
    double? elevationGain,
    HeartRateZones? heartRateZones,
    DetectionSource source,
    bool isConfirmed,
    bool isDismissed,
    String? analysisNotes,
  });

  @override
  $HeartRateZonesCopyWith<$Res>? get heartRateZones;
}

/// @nodoc
class __$$DetectedWorkoutImplCopyWithImpl<$Res>
    extends _$DetectedWorkoutCopyWithImpl<$Res, _$DetectedWorkoutImpl>
    implements _$$DetectedWorkoutImplCopyWith<$Res> {
  __$$DetectedWorkoutImplCopyWithImpl(
    _$DetectedWorkoutImpl _value,
    $Res Function(_$DetectedWorkoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetectedWorkout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? durationMinutes = null,
    Object? averageHeartRate = null,
    Object? maxHeartRate = null,
    Object? minHeartRate = freezed,
    Object? heartRateSamples = null,
    Object? estimatedCalories = null,
    Object? intensity = null,
    Object? suggestedType = null,
    Object? confidence = null,
    Object? steps = freezed,
    Object? activeEnergy = freezed,
    Object? distanceMeters = freezed,
    Object? elevationGain = freezed,
    Object? heartRateZones = freezed,
    Object? source = null,
    Object? isConfirmed = null,
    Object? isDismissed = null,
    Object? analysisNotes = freezed,
  }) {
    return _then(
      _$DetectedWorkoutImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        durationMinutes: null == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        averageHeartRate: null == averageHeartRate
            ? _value.averageHeartRate
            : averageHeartRate // ignore: cast_nullable_to_non_nullable
                  as double,
        maxHeartRate: null == maxHeartRate
            ? _value.maxHeartRate
            : maxHeartRate // ignore: cast_nullable_to_non_nullable
                  as double,
        minHeartRate: freezed == minHeartRate
            ? _value.minHeartRate
            : minHeartRate // ignore: cast_nullable_to_non_nullable
                  as double?,
        heartRateSamples: null == heartRateSamples
            ? _value._heartRateSamples
            : heartRateSamples // ignore: cast_nullable_to_non_nullable
                  as List<HeartRateSample>,
        estimatedCalories: null == estimatedCalories
            ? _value.estimatedCalories
            : estimatedCalories // ignore: cast_nullable_to_non_nullable
                  as int,
        intensity: null == intensity
            ? _value.intensity
            : intensity // ignore: cast_nullable_to_non_nullable
                  as WorkoutIntensity,
        suggestedType: null == suggestedType
            ? _value.suggestedType
            : suggestedType // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        steps: freezed == steps
            ? _value.steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as int?,
        activeEnergy: freezed == activeEnergy
            ? _value.activeEnergy
            : activeEnergy // ignore: cast_nullable_to_non_nullable
                  as int?,
        distanceMeters: freezed == distanceMeters
            ? _value.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double?,
        elevationGain: freezed == elevationGain
            ? _value.elevationGain
            : elevationGain // ignore: cast_nullable_to_non_nullable
                  as double?,
        heartRateZones: freezed == heartRateZones
            ? _value.heartRateZones
            : heartRateZones // ignore: cast_nullable_to_non_nullable
                  as HeartRateZones?,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as DetectionSource,
        isConfirmed: null == isConfirmed
            ? _value.isConfirmed
            : isConfirmed // ignore: cast_nullable_to_non_nullable
                  as bool,
        isDismissed: null == isDismissed
            ? _value.isDismissed
            : isDismissed // ignore: cast_nullable_to_non_nullable
                  as bool,
        analysisNotes: freezed == analysisNotes
            ? _value.analysisNotes
            : analysisNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectedWorkoutImpl implements _DetectedWorkout {
  const _$DetectedWorkoutImpl({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.durationMinutes,
    required this.averageHeartRate,
    required this.maxHeartRate,
    this.minHeartRate,
    final List<HeartRateSample> heartRateSamples = const [],
    required this.estimatedCalories,
    required this.intensity,
    required this.suggestedType,
    required this.confidence,
    this.steps,
    this.activeEnergy,
    this.distanceMeters,
    this.elevationGain,
    this.heartRateZones,
    this.source = DetectionSource.healthkit,
    this.isConfirmed = false,
    this.isDismissed = false,
    this.analysisNotes,
  }) : _heartRateSamples = heartRateSamples;

  factory _$DetectedWorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectedWorkoutImplFromJson(json);

  @override
  final String id;

  /// When the workout started
  @override
  final DateTime startTime;

  /// When the workout ended
  @override
  final DateTime endTime;

  /// Duration in minutes
  @override
  final int durationMinutes;

  /// Average heart rate during the workout
  @override
  final double averageHeartRate;

  /// Maximum heart rate recorded
  @override
  final double maxHeartRate;

  /// Minimum heart rate during workout
  @override
  final double? minHeartRate;

  /// Heart rate samples during workout
  final List<HeartRateSample> _heartRateSamples;

  /// Heart rate samples during workout
  @override
  @JsonKey()
  List<HeartRateSample> get heartRateSamples {
    if (_heartRateSamples is EqualUnmodifiableListView)
      return _heartRateSamples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_heartRateSamples);
  }

  /// Estimated calories burned
  @override
  final int estimatedCalories;

  /// Detected intensity level
  @override
  final WorkoutIntensity intensity;

  /// Suggested workout type based on pattern analysis
  @override
  final String suggestedType;

  /// AI confidence in the workout detection (0-100)
  @override
  final double confidence;

  /// Step count during workout (if available)
  @override
  final int? steps;

  /// Active energy burned (HealthKit)
  @override
  final int? activeEnergy;

  /// Distance covered (if applicable, in meters)
  @override
  final double? distanceMeters;

  /// Elevation gain (if applicable, in meters)
  @override
  final double? elevationGain;

  /// Heart rate zones distribution
  @override
  final HeartRateZones? heartRateZones;

  /// Detection source
  @override
  @JsonKey()
  final DetectionSource source;

  /// Has this workout been confirmed by the user?
  @override
  @JsonKey()
  final bool isConfirmed;

  /// Has the user dismissed this detection?
  @override
  @JsonKey()
  final bool isDismissed;

  /// Notes from AI analysis
  @override
  final String? analysisNotes;

  @override
  String toString() {
    return 'DetectedWorkout(id: $id, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, averageHeartRate: $averageHeartRate, maxHeartRate: $maxHeartRate, minHeartRate: $minHeartRate, heartRateSamples: $heartRateSamples, estimatedCalories: $estimatedCalories, intensity: $intensity, suggestedType: $suggestedType, confidence: $confidence, steps: $steps, activeEnergy: $activeEnergy, distanceMeters: $distanceMeters, elevationGain: $elevationGain, heartRateZones: $heartRateZones, source: $source, isConfirmed: $isConfirmed, isDismissed: $isDismissed, analysisNotes: $analysisNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectedWorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.averageHeartRate, averageHeartRate) ||
                other.averageHeartRate == averageHeartRate) &&
            (identical(other.maxHeartRate, maxHeartRate) ||
                other.maxHeartRate == maxHeartRate) &&
            (identical(other.minHeartRate, minHeartRate) ||
                other.minHeartRate == minHeartRate) &&
            const DeepCollectionEquality().equals(
              other._heartRateSamples,
              _heartRateSamples,
            ) &&
            (identical(other.estimatedCalories, estimatedCalories) ||
                other.estimatedCalories == estimatedCalories) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.suggestedType, suggestedType) ||
                other.suggestedType == suggestedType) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.activeEnergy, activeEnergy) ||
                other.activeEnergy == activeEnergy) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            (identical(other.elevationGain, elevationGain) ||
                other.elevationGain == elevationGain) &&
            (identical(other.heartRateZones, heartRateZones) ||
                other.heartRateZones == heartRateZones) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed) &&
            (identical(other.isDismissed, isDismissed) ||
                other.isDismissed == isDismissed) &&
            (identical(other.analysisNotes, analysisNotes) ||
                other.analysisNotes == analysisNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    startTime,
    endTime,
    durationMinutes,
    averageHeartRate,
    maxHeartRate,
    minHeartRate,
    const DeepCollectionEquality().hash(_heartRateSamples),
    estimatedCalories,
    intensity,
    suggestedType,
    confidence,
    steps,
    activeEnergy,
    distanceMeters,
    elevationGain,
    heartRateZones,
    source,
    isConfirmed,
    isDismissed,
    analysisNotes,
  ]);

  /// Create a copy of DetectedWorkout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectedWorkoutImplCopyWith<_$DetectedWorkoutImpl> get copyWith =>
      __$$DetectedWorkoutImplCopyWithImpl<_$DetectedWorkoutImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectedWorkoutImplToJson(this);
  }
}

abstract class _DetectedWorkout implements DetectedWorkout {
  const factory _DetectedWorkout({
    required final String id,
    required final DateTime startTime,
    required final DateTime endTime,
    required final int durationMinutes,
    required final double averageHeartRate,
    required final double maxHeartRate,
    final double? minHeartRate,
    final List<HeartRateSample> heartRateSamples,
    required final int estimatedCalories,
    required final WorkoutIntensity intensity,
    required final String suggestedType,
    required final double confidence,
    final int? steps,
    final int? activeEnergy,
    final double? distanceMeters,
    final double? elevationGain,
    final HeartRateZones? heartRateZones,
    final DetectionSource source,
    final bool isConfirmed,
    final bool isDismissed,
    final String? analysisNotes,
  }) = _$DetectedWorkoutImpl;

  factory _DetectedWorkout.fromJson(Map<String, dynamic> json) =
      _$DetectedWorkoutImpl.fromJson;

  @override
  String get id;

  /// When the workout started
  @override
  DateTime get startTime;

  /// When the workout ended
  @override
  DateTime get endTime;

  /// Duration in minutes
  @override
  int get durationMinutes;

  /// Average heart rate during the workout
  @override
  double get averageHeartRate;

  /// Maximum heart rate recorded
  @override
  double get maxHeartRate;

  /// Minimum heart rate during workout
  @override
  double? get minHeartRate;

  /// Heart rate samples during workout
  @override
  List<HeartRateSample> get heartRateSamples;

  /// Estimated calories burned
  @override
  int get estimatedCalories;

  /// Detected intensity level
  @override
  WorkoutIntensity get intensity;

  /// Suggested workout type based on pattern analysis
  @override
  String get suggestedType;

  /// AI confidence in the workout detection (0-100)
  @override
  double get confidence;

  /// Step count during workout (if available)
  @override
  int? get steps;

  /// Active energy burned (HealthKit)
  @override
  int? get activeEnergy;

  /// Distance covered (if applicable, in meters)
  @override
  double? get distanceMeters;

  /// Elevation gain (if applicable, in meters)
  @override
  double? get elevationGain;

  /// Heart rate zones distribution
  @override
  HeartRateZones? get heartRateZones;

  /// Detection source
  @override
  DetectionSource get source;

  /// Has this workout been confirmed by the user?
  @override
  bool get isConfirmed;

  /// Has the user dismissed this detection?
  @override
  bool get isDismissed;

  /// Notes from AI analysis
  @override
  String? get analysisNotes;

  /// Create a copy of DetectedWorkout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectedWorkoutImplCopyWith<_$DetectedWorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HeartRateSample _$HeartRateSampleFromJson(Map<String, dynamic> json) {
  return _HeartRateSample.fromJson(json);
}

/// @nodoc
mixin _$HeartRateSample {
  DateTime get timestamp => throw _privateConstructorUsedError;
  int get heartRate => throw _privateConstructorUsedError;

  /// Serializes this HeartRateSample to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HeartRateSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeartRateSampleCopyWith<HeartRateSample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartRateSampleCopyWith<$Res> {
  factory $HeartRateSampleCopyWith(
    HeartRateSample value,
    $Res Function(HeartRateSample) then,
  ) = _$HeartRateSampleCopyWithImpl<$Res, HeartRateSample>;
  @useResult
  $Res call({DateTime timestamp, int heartRate});
}

/// @nodoc
class _$HeartRateSampleCopyWithImpl<$Res, $Val extends HeartRateSample>
    implements $HeartRateSampleCopyWith<$Res> {
  _$HeartRateSampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeartRateSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? timestamp = null, Object? heartRate = null}) {
    return _then(
      _value.copyWith(
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            heartRate: null == heartRate
                ? _value.heartRate
                : heartRate // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HeartRateSampleImplCopyWith<$Res>
    implements $HeartRateSampleCopyWith<$Res> {
  factory _$$HeartRateSampleImplCopyWith(
    _$HeartRateSampleImpl value,
    $Res Function(_$HeartRateSampleImpl) then,
  ) = __$$HeartRateSampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timestamp, int heartRate});
}

/// @nodoc
class __$$HeartRateSampleImplCopyWithImpl<$Res>
    extends _$HeartRateSampleCopyWithImpl<$Res, _$HeartRateSampleImpl>
    implements _$$HeartRateSampleImplCopyWith<$Res> {
  __$$HeartRateSampleImplCopyWithImpl(
    _$HeartRateSampleImpl _value,
    $Res Function(_$HeartRateSampleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? timestamp = null, Object? heartRate = null}) {
    return _then(
      _$HeartRateSampleImpl(
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        heartRate: null == heartRate
            ? _value.heartRate
            : heartRate // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HeartRateSampleImpl implements _HeartRateSample {
  const _$HeartRateSampleImpl({
    required this.timestamp,
    required this.heartRate,
  });

  factory _$HeartRateSampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeartRateSampleImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final int heartRate;

  @override
  String toString() {
    return 'HeartRateSample(timestamp: $timestamp, heartRate: $heartRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateSampleImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, heartRate);

  /// Create a copy of HeartRateSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateSampleImplCopyWith<_$HeartRateSampleImpl> get copyWith =>
      __$$HeartRateSampleImplCopyWithImpl<_$HeartRateSampleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HeartRateSampleImplToJson(this);
  }
}

abstract class _HeartRateSample implements HeartRateSample {
  const factory _HeartRateSample({
    required final DateTime timestamp,
    required final int heartRate,
  }) = _$HeartRateSampleImpl;

  factory _HeartRateSample.fromJson(Map<String, dynamic> json) =
      _$HeartRateSampleImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  int get heartRate;

  /// Create a copy of HeartRateSample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateSampleImplCopyWith<_$HeartRateSampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StepSample _$StepSampleFromJson(Map<String, dynamic> json) {
  return _StepSample.fromJson(json);
}

/// @nodoc
mixin _$StepSample {
  DateTime get timestamp => throw _privateConstructorUsedError;
  int get steps => throw _privateConstructorUsedError;

  /// Serializes this StepSample to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StepSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StepSampleCopyWith<StepSample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepSampleCopyWith<$Res> {
  factory $StepSampleCopyWith(
    StepSample value,
    $Res Function(StepSample) then,
  ) = _$StepSampleCopyWithImpl<$Res, StepSample>;
  @useResult
  $Res call({DateTime timestamp, int steps});
}

/// @nodoc
class _$StepSampleCopyWithImpl<$Res, $Val extends StepSample>
    implements $StepSampleCopyWith<$Res> {
  _$StepSampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StepSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? timestamp = null, Object? steps = null}) {
    return _then(
      _value.copyWith(
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            steps: null == steps
                ? _value.steps
                : steps // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StepSampleImplCopyWith<$Res>
    implements $StepSampleCopyWith<$Res> {
  factory _$$StepSampleImplCopyWith(
    _$StepSampleImpl value,
    $Res Function(_$StepSampleImpl) then,
  ) = __$$StepSampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timestamp, int steps});
}

/// @nodoc
class __$$StepSampleImplCopyWithImpl<$Res>
    extends _$StepSampleCopyWithImpl<$Res, _$StepSampleImpl>
    implements _$$StepSampleImplCopyWith<$Res> {
  __$$StepSampleImplCopyWithImpl(
    _$StepSampleImpl _value,
    $Res Function(_$StepSampleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StepSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? timestamp = null, Object? steps = null}) {
    return _then(
      _$StepSampleImpl(
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        steps: null == steps
            ? _value.steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StepSampleImpl implements _StepSample {
  const _$StepSampleImpl({required this.timestamp, required this.steps});

  factory _$StepSampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepSampleImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final int steps;

  @override
  String toString() {
    return 'StepSample(timestamp: $timestamp, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepSampleImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.steps, steps) || other.steps == steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, steps);

  /// Create a copy of StepSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepSampleImplCopyWith<_$StepSampleImpl> get copyWith =>
      __$$StepSampleImplCopyWithImpl<_$StepSampleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepSampleImplToJson(this);
  }
}

abstract class _StepSample implements StepSample {
  const factory _StepSample({
    required final DateTime timestamp,
    required final int steps,
  }) = _$StepSampleImpl;

  factory _StepSample.fromJson(Map<String, dynamic> json) =
      _$StepSampleImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  int get steps;

  /// Create a copy of StepSample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepSampleImplCopyWith<_$StepSampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HeartRateZones _$HeartRateZonesFromJson(Map<String, dynamic> json) {
  return _HeartRateZones.fromJson(json);
}

/// @nodoc
mixin _$HeartRateZones {
  /// Minutes in Zone 1 (50-60% max HR)
  int get zone1Minutes => throw _privateConstructorUsedError;

  /// Minutes in Zone 2 (60-70% max HR)
  int get zone2Minutes => throw _privateConstructorUsedError;

  /// Minutes in Zone 3 (70-80% max HR)
  int get zone3Minutes => throw _privateConstructorUsedError;

  /// Minutes in Zone 4 (80-90% max HR)
  int get zone4Minutes => throw _privateConstructorUsedError;

  /// Minutes in Zone 5 (90-100% max HR)
  int get zone5Minutes => throw _privateConstructorUsedError;

  /// Serializes this HeartRateZones to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HeartRateZones
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeartRateZonesCopyWith<HeartRateZones> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartRateZonesCopyWith<$Res> {
  factory $HeartRateZonesCopyWith(
    HeartRateZones value,
    $Res Function(HeartRateZones) then,
  ) = _$HeartRateZonesCopyWithImpl<$Res, HeartRateZones>;
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
class _$HeartRateZonesCopyWithImpl<$Res, $Val extends HeartRateZones>
    implements $HeartRateZonesCopyWith<$Res> {
  _$HeartRateZonesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeartRateZones
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
abstract class _$$HeartRateZonesImplCopyWith<$Res>
    implements $HeartRateZonesCopyWith<$Res> {
  factory _$$HeartRateZonesImplCopyWith(
    _$HeartRateZonesImpl value,
    $Res Function(_$HeartRateZonesImpl) then,
  ) = __$$HeartRateZonesImplCopyWithImpl<$Res>;
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
class __$$HeartRateZonesImplCopyWithImpl<$Res>
    extends _$HeartRateZonesCopyWithImpl<$Res, _$HeartRateZonesImpl>
    implements _$$HeartRateZonesImplCopyWith<$Res> {
  __$$HeartRateZonesImplCopyWithImpl(
    _$HeartRateZonesImpl _value,
    $Res Function(_$HeartRateZonesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeartRateZones
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
      _$HeartRateZonesImpl(
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
class _$HeartRateZonesImpl implements _HeartRateZones {
  const _$HeartRateZonesImpl({
    this.zone1Minutes = 0,
    this.zone2Minutes = 0,
    this.zone3Minutes = 0,
    this.zone4Minutes = 0,
    this.zone5Minutes = 0,
  });

  factory _$HeartRateZonesImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeartRateZonesImplFromJson(json);

  /// Minutes in Zone 1 (50-60% max HR)
  @override
  @JsonKey()
  final int zone1Minutes;

  /// Minutes in Zone 2 (60-70% max HR)
  @override
  @JsonKey()
  final int zone2Minutes;

  /// Minutes in Zone 3 (70-80% max HR)
  @override
  @JsonKey()
  final int zone3Minutes;

  /// Minutes in Zone 4 (80-90% max HR)
  @override
  @JsonKey()
  final int zone4Minutes;

  /// Minutes in Zone 5 (90-100% max HR)
  @override
  @JsonKey()
  final int zone5Minutes;

  @override
  String toString() {
    return 'HeartRateZones(zone1Minutes: $zone1Minutes, zone2Minutes: $zone2Minutes, zone3Minutes: $zone3Minutes, zone4Minutes: $zone4Minutes, zone5Minutes: $zone5Minutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRateZonesImpl &&
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

  /// Create a copy of HeartRateZones
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRateZonesImplCopyWith<_$HeartRateZonesImpl> get copyWith =>
      __$$HeartRateZonesImplCopyWithImpl<_$HeartRateZonesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HeartRateZonesImplToJson(this);
  }
}

abstract class _HeartRateZones implements HeartRateZones {
  const factory _HeartRateZones({
    final int zone1Minutes,
    final int zone2Minutes,
    final int zone3Minutes,
    final int zone4Minutes,
    final int zone5Minutes,
  }) = _$HeartRateZonesImpl;

  factory _HeartRateZones.fromJson(Map<String, dynamic> json) =
      _$HeartRateZonesImpl.fromJson;

  /// Minutes in Zone 1 (50-60% max HR)
  @override
  int get zone1Minutes;

  /// Minutes in Zone 2 (60-70% max HR)
  @override
  int get zone2Minutes;

  /// Minutes in Zone 3 (70-80% max HR)
  @override
  int get zone3Minutes;

  /// Minutes in Zone 4 (80-90% max HR)
  @override
  int get zone4Minutes;

  /// Minutes in Zone 5 (90-100% max HR)
  @override
  int get zone5Minutes;

  /// Create a copy of HeartRateZones
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeartRateZonesImplCopyWith<_$HeartRateZonesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutClassification _$WorkoutClassificationFromJson(
  Map<String, dynamic> json,
) {
  return _WorkoutClassification.fromJson(json);
}

/// @nodoc
mixin _$WorkoutClassification {
  /// Primary workout type classification
  String get primaryType => throw _privateConstructorUsedError;

  /// Confidence in primary classification (0-100)
  double get confidence => throw _privateConstructorUsedError;

  /// Alternative classifications with confidence
  List<ClassificationAlternative> get alternatives =>
      throw _privateConstructorUsedError;

  /// Reasoning for the classification
  String? get reasoning => throw _privateConstructorUsedError;

  /// Was AI used for classification?
  bool get isAiClassified => throw _privateConstructorUsedError;

  /// Serializes this WorkoutClassification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutClassification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutClassificationCopyWith<WorkoutClassification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutClassificationCopyWith<$Res> {
  factory $WorkoutClassificationCopyWith(
    WorkoutClassification value,
    $Res Function(WorkoutClassification) then,
  ) = _$WorkoutClassificationCopyWithImpl<$Res, WorkoutClassification>;
  @useResult
  $Res call({
    String primaryType,
    double confidence,
    List<ClassificationAlternative> alternatives,
    String? reasoning,
    bool isAiClassified,
  });
}

/// @nodoc
class _$WorkoutClassificationCopyWithImpl<
  $Res,
  $Val extends WorkoutClassification
>
    implements $WorkoutClassificationCopyWith<$Res> {
  _$WorkoutClassificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutClassification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryType = null,
    Object? confidence = null,
    Object? alternatives = null,
    Object? reasoning = freezed,
    Object? isAiClassified = null,
  }) {
    return _then(
      _value.copyWith(
            primaryType: null == primaryType
                ? _value.primaryType
                : primaryType // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            alternatives: null == alternatives
                ? _value.alternatives
                : alternatives // ignore: cast_nullable_to_non_nullable
                      as List<ClassificationAlternative>,
            reasoning: freezed == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String?,
            isAiClassified: null == isAiClassified
                ? _value.isAiClassified
                : isAiClassified // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutClassificationImplCopyWith<$Res>
    implements $WorkoutClassificationCopyWith<$Res> {
  factory _$$WorkoutClassificationImplCopyWith(
    _$WorkoutClassificationImpl value,
    $Res Function(_$WorkoutClassificationImpl) then,
  ) = __$$WorkoutClassificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String primaryType,
    double confidence,
    List<ClassificationAlternative> alternatives,
    String? reasoning,
    bool isAiClassified,
  });
}

/// @nodoc
class __$$WorkoutClassificationImplCopyWithImpl<$Res>
    extends
        _$WorkoutClassificationCopyWithImpl<$Res, _$WorkoutClassificationImpl>
    implements _$$WorkoutClassificationImplCopyWith<$Res> {
  __$$WorkoutClassificationImplCopyWithImpl(
    _$WorkoutClassificationImpl _value,
    $Res Function(_$WorkoutClassificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutClassification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryType = null,
    Object? confidence = null,
    Object? alternatives = null,
    Object? reasoning = freezed,
    Object? isAiClassified = null,
  }) {
    return _then(
      _$WorkoutClassificationImpl(
        primaryType: null == primaryType
            ? _value.primaryType
            : primaryType // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        alternatives: null == alternatives
            ? _value._alternatives
            : alternatives // ignore: cast_nullable_to_non_nullable
                  as List<ClassificationAlternative>,
        reasoning: freezed == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String?,
        isAiClassified: null == isAiClassified
            ? _value.isAiClassified
            : isAiClassified // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutClassificationImpl implements _WorkoutClassification {
  const _$WorkoutClassificationImpl({
    required this.primaryType,
    required this.confidence,
    final List<ClassificationAlternative> alternatives = const [],
    this.reasoning,
    this.isAiClassified = false,
  }) : _alternatives = alternatives;

  factory _$WorkoutClassificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutClassificationImplFromJson(json);

  /// Primary workout type classification
  @override
  final String primaryType;

  /// Confidence in primary classification (0-100)
  @override
  final double confidence;

  /// Alternative classifications with confidence
  final List<ClassificationAlternative> _alternatives;

  /// Alternative classifications with confidence
  @override
  @JsonKey()
  List<ClassificationAlternative> get alternatives {
    if (_alternatives is EqualUnmodifiableListView) return _alternatives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alternatives);
  }

  /// Reasoning for the classification
  @override
  final String? reasoning;

  /// Was AI used for classification?
  @override
  @JsonKey()
  final bool isAiClassified;

  @override
  String toString() {
    return 'WorkoutClassification(primaryType: $primaryType, confidence: $confidence, alternatives: $alternatives, reasoning: $reasoning, isAiClassified: $isAiClassified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutClassificationImpl &&
            (identical(other.primaryType, primaryType) ||
                other.primaryType == primaryType) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(
              other._alternatives,
              _alternatives,
            ) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.isAiClassified, isAiClassified) ||
                other.isAiClassified == isAiClassified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    primaryType,
    confidence,
    const DeepCollectionEquality().hash(_alternatives),
    reasoning,
    isAiClassified,
  );

  /// Create a copy of WorkoutClassification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutClassificationImplCopyWith<_$WorkoutClassificationImpl>
  get copyWith =>
      __$$WorkoutClassificationImplCopyWithImpl<_$WorkoutClassificationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutClassificationImplToJson(this);
  }
}

abstract class _WorkoutClassification implements WorkoutClassification {
  const factory _WorkoutClassification({
    required final String primaryType,
    required final double confidence,
    final List<ClassificationAlternative> alternatives,
    final String? reasoning,
    final bool isAiClassified,
  }) = _$WorkoutClassificationImpl;

  factory _WorkoutClassification.fromJson(Map<String, dynamic> json) =
      _$WorkoutClassificationImpl.fromJson;

  /// Primary workout type classification
  @override
  String get primaryType;

  /// Confidence in primary classification (0-100)
  @override
  double get confidence;

  /// Alternative classifications with confidence
  @override
  List<ClassificationAlternative> get alternatives;

  /// Reasoning for the classification
  @override
  String? get reasoning;

  /// Was AI used for classification?
  @override
  bool get isAiClassified;

  /// Create a copy of WorkoutClassification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutClassificationImplCopyWith<_$WorkoutClassificationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ClassificationAlternative _$ClassificationAlternativeFromJson(
  Map<String, dynamic> json,
) {
  return _ClassificationAlternative.fromJson(json);
}

/// @nodoc
mixin _$ClassificationAlternative {
  String get type => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  /// Serializes this ClassificationAlternative to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassificationAlternative
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassificationAlternativeCopyWith<ClassificationAlternative> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassificationAlternativeCopyWith<$Res> {
  factory $ClassificationAlternativeCopyWith(
    ClassificationAlternative value,
    $Res Function(ClassificationAlternative) then,
  ) = _$ClassificationAlternativeCopyWithImpl<$Res, ClassificationAlternative>;
  @useResult
  $Res call({String type, double confidence});
}

/// @nodoc
class _$ClassificationAlternativeCopyWithImpl<
  $Res,
  $Val extends ClassificationAlternative
>
    implements $ClassificationAlternativeCopyWith<$Res> {
  _$ClassificationAlternativeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassificationAlternative
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? confidence = null}) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClassificationAlternativeImplCopyWith<$Res>
    implements $ClassificationAlternativeCopyWith<$Res> {
  factory _$$ClassificationAlternativeImplCopyWith(
    _$ClassificationAlternativeImpl value,
    $Res Function(_$ClassificationAlternativeImpl) then,
  ) = __$$ClassificationAlternativeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, double confidence});
}

/// @nodoc
class __$$ClassificationAlternativeImplCopyWithImpl<$Res>
    extends
        _$ClassificationAlternativeCopyWithImpl<
          $Res,
          _$ClassificationAlternativeImpl
        >
    implements _$$ClassificationAlternativeImplCopyWith<$Res> {
  __$$ClassificationAlternativeImplCopyWithImpl(
    _$ClassificationAlternativeImpl _value,
    $Res Function(_$ClassificationAlternativeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClassificationAlternative
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? confidence = null}) {
    return _then(
      _$ClassificationAlternativeImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassificationAlternativeImpl implements _ClassificationAlternative {
  const _$ClassificationAlternativeImpl({
    required this.type,
    required this.confidence,
  });

  factory _$ClassificationAlternativeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassificationAlternativeImplFromJson(json);

  @override
  final String type;
  @override
  final double confidence;

  @override
  String toString() {
    return 'ClassificationAlternative(type: $type, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassificationAlternativeImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, confidence);

  /// Create a copy of ClassificationAlternative
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassificationAlternativeImplCopyWith<_$ClassificationAlternativeImpl>
  get copyWith =>
      __$$ClassificationAlternativeImplCopyWithImpl<
        _$ClassificationAlternativeImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassificationAlternativeImplToJson(this);
  }
}

abstract class _ClassificationAlternative implements ClassificationAlternative {
  const factory _ClassificationAlternative({
    required final String type,
    required final double confidence,
  }) = _$ClassificationAlternativeImpl;

  factory _ClassificationAlternative.fromJson(Map<String, dynamic> json) =
      _$ClassificationAlternativeImpl.fromJson;

  @override
  String get type;
  @override
  double get confidence;

  /// Create a copy of ClassificationAlternative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassificationAlternativeImplCopyWith<_$ClassificationAlternativeImpl>
  get copyWith => throw _privateConstructorUsedError;
}
