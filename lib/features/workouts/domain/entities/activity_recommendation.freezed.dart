// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ActivityRecommendation _$ActivityRecommendationFromJson(
  Map<String, dynamic> json,
) {
  return _ActivityRecommendation.fromJson(json);
}

/// @nodoc
mixin _$ActivityRecommendation {
  String get id => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// The type of recommendation: rest, light, moderate, intense
  RecommendationType get recommendationType =>
      throw _privateConstructorUsedError;

  /// Primary recommendation text
  String get primaryRecommendation => throw _privateConstructorUsedError;

  /// Alternative activities if user wants options
  List<String> get alternativeActivities => throw _privateConstructorUsedError;

  /// Reasoning behind the recommendation
  String get reasoning => throw _privateConstructorUsedError;

  /// Target strain range for the day (min, max)
  StrainRange get targetStrainRange => throw _privateConstructorUsedError;

  /// Suggested duration in minutes
  int get suggestedDuration => throw _privateConstructorUsedError;

  /// Suggested intensity (1-10)
  int get suggestedIntensity => throw _privateConstructorUsedError;

  /// Warnings or cautions
  List<String> get warnings => throw _privateConstructorUsedError;

  /// Recovery score this recommendation is based on
  double get recoveryScore => throw _privateConstructorUsedError;

  /// Strain score from previous day
  double? get previousDayStrain => throw _privateConstructorUsedError;

  /// Is this an AI-generated recommendation?
  bool get isAiGenerated => throw _privateConstructorUsedError;

  /// AI confidence in this recommendation (0-100)
  int get confidence => throw _privateConstructorUsedError;

  /// Specific exercises or activities suggested
  List<SuggestedActivity> get suggestedActivities =>
      throw _privateConstructorUsedError;

  /// Recovery protocols to follow
  List<RecoveryProtocol> get recoveryProtocols =>
      throw _privateConstructorUsedError;

  /// Serializes this ActivityRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityRecommendationCopyWith<ActivityRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityRecommendationCopyWith<$Res> {
  factory $ActivityRecommendationCopyWith(
    ActivityRecommendation value,
    $Res Function(ActivityRecommendation) then,
  ) = _$ActivityRecommendationCopyWithImpl<$Res, ActivityRecommendation>;
  @useResult
  $Res call({
    String id,
    DateTime generatedAt,
    RecommendationType recommendationType,
    String primaryRecommendation,
    List<String> alternativeActivities,
    String reasoning,
    StrainRange targetStrainRange,
    int suggestedDuration,
    int suggestedIntensity,
    List<String> warnings,
    double recoveryScore,
    double? previousDayStrain,
    bool isAiGenerated,
    int confidence,
    List<SuggestedActivity> suggestedActivities,
    List<RecoveryProtocol> recoveryProtocols,
  });

  $StrainRangeCopyWith<$Res> get targetStrainRange;
}

/// @nodoc
class _$ActivityRecommendationCopyWithImpl<
  $Res,
  $Val extends ActivityRecommendation
>
    implements $ActivityRecommendationCopyWith<$Res> {
  _$ActivityRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? generatedAt = null,
    Object? recommendationType = null,
    Object? primaryRecommendation = null,
    Object? alternativeActivities = null,
    Object? reasoning = null,
    Object? targetStrainRange = null,
    Object? suggestedDuration = null,
    Object? suggestedIntensity = null,
    Object? warnings = null,
    Object? recoveryScore = null,
    Object? previousDayStrain = freezed,
    Object? isAiGenerated = null,
    Object? confidence = null,
    Object? suggestedActivities = null,
    Object? recoveryProtocols = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            recommendationType: null == recommendationType
                ? _value.recommendationType
                : recommendationType // ignore: cast_nullable_to_non_nullable
                      as RecommendationType,
            primaryRecommendation: null == primaryRecommendation
                ? _value.primaryRecommendation
                : primaryRecommendation // ignore: cast_nullable_to_non_nullable
                      as String,
            alternativeActivities: null == alternativeActivities
                ? _value.alternativeActivities
                : alternativeActivities // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            reasoning: null == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String,
            targetStrainRange: null == targetStrainRange
                ? _value.targetStrainRange
                : targetStrainRange // ignore: cast_nullable_to_non_nullable
                      as StrainRange,
            suggestedDuration: null == suggestedDuration
                ? _value.suggestedDuration
                : suggestedDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            suggestedIntensity: null == suggestedIntensity
                ? _value.suggestedIntensity
                : suggestedIntensity // ignore: cast_nullable_to_non_nullable
                      as int,
            warnings: null == warnings
                ? _value.warnings
                : warnings // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            recoveryScore: null == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as double,
            previousDayStrain: freezed == previousDayStrain
                ? _value.previousDayStrain
                : previousDayStrain // ignore: cast_nullable_to_non_nullable
                      as double?,
            isAiGenerated: null == isAiGenerated
                ? _value.isAiGenerated
                : isAiGenerated // ignore: cast_nullable_to_non_nullable
                      as bool,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            suggestedActivities: null == suggestedActivities
                ? _value.suggestedActivities
                : suggestedActivities // ignore: cast_nullable_to_non_nullable
                      as List<SuggestedActivity>,
            recoveryProtocols: null == recoveryProtocols
                ? _value.recoveryProtocols
                : recoveryProtocols // ignore: cast_nullable_to_non_nullable
                      as List<RecoveryProtocol>,
          )
          as $Val,
    );
  }

  /// Create a copy of ActivityRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StrainRangeCopyWith<$Res> get targetStrainRange {
    return $StrainRangeCopyWith<$Res>(_value.targetStrainRange, (value) {
      return _then(_value.copyWith(targetStrainRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityRecommendationImplCopyWith<$Res>
    implements $ActivityRecommendationCopyWith<$Res> {
  factory _$$ActivityRecommendationImplCopyWith(
    _$ActivityRecommendationImpl value,
    $Res Function(_$ActivityRecommendationImpl) then,
  ) = __$$ActivityRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime generatedAt,
    RecommendationType recommendationType,
    String primaryRecommendation,
    List<String> alternativeActivities,
    String reasoning,
    StrainRange targetStrainRange,
    int suggestedDuration,
    int suggestedIntensity,
    List<String> warnings,
    double recoveryScore,
    double? previousDayStrain,
    bool isAiGenerated,
    int confidence,
    List<SuggestedActivity> suggestedActivities,
    List<RecoveryProtocol> recoveryProtocols,
  });

  @override
  $StrainRangeCopyWith<$Res> get targetStrainRange;
}

/// @nodoc
class __$$ActivityRecommendationImplCopyWithImpl<$Res>
    extends
        _$ActivityRecommendationCopyWithImpl<$Res, _$ActivityRecommendationImpl>
    implements _$$ActivityRecommendationImplCopyWith<$Res> {
  __$$ActivityRecommendationImplCopyWithImpl(
    _$ActivityRecommendationImpl _value,
    $Res Function(_$ActivityRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ActivityRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? generatedAt = null,
    Object? recommendationType = null,
    Object? primaryRecommendation = null,
    Object? alternativeActivities = null,
    Object? reasoning = null,
    Object? targetStrainRange = null,
    Object? suggestedDuration = null,
    Object? suggestedIntensity = null,
    Object? warnings = null,
    Object? recoveryScore = null,
    Object? previousDayStrain = freezed,
    Object? isAiGenerated = null,
    Object? confidence = null,
    Object? suggestedActivities = null,
    Object? recoveryProtocols = null,
  }) {
    return _then(
      _$ActivityRecommendationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        recommendationType: null == recommendationType
            ? _value.recommendationType
            : recommendationType // ignore: cast_nullable_to_non_nullable
                  as RecommendationType,
        primaryRecommendation: null == primaryRecommendation
            ? _value.primaryRecommendation
            : primaryRecommendation // ignore: cast_nullable_to_non_nullable
                  as String,
        alternativeActivities: null == alternativeActivities
            ? _value._alternativeActivities
            : alternativeActivities // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        reasoning: null == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String,
        targetStrainRange: null == targetStrainRange
            ? _value.targetStrainRange
            : targetStrainRange // ignore: cast_nullable_to_non_nullable
                  as StrainRange,
        suggestedDuration: null == suggestedDuration
            ? _value.suggestedDuration
            : suggestedDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        suggestedIntensity: null == suggestedIntensity
            ? _value.suggestedIntensity
            : suggestedIntensity // ignore: cast_nullable_to_non_nullable
                  as int,
        warnings: null == warnings
            ? _value._warnings
            : warnings // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        recoveryScore: null == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as double,
        previousDayStrain: freezed == previousDayStrain
            ? _value.previousDayStrain
            : previousDayStrain // ignore: cast_nullable_to_non_nullable
                  as double?,
        isAiGenerated: null == isAiGenerated
            ? _value.isAiGenerated
            : isAiGenerated // ignore: cast_nullable_to_non_nullable
                  as bool,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        suggestedActivities: null == suggestedActivities
            ? _value._suggestedActivities
            : suggestedActivities // ignore: cast_nullable_to_non_nullable
                  as List<SuggestedActivity>,
        recoveryProtocols: null == recoveryProtocols
            ? _value._recoveryProtocols
            : recoveryProtocols // ignore: cast_nullable_to_non_nullable
                  as List<RecoveryProtocol>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityRecommendationImpl implements _ActivityRecommendation {
  const _$ActivityRecommendationImpl({
    required this.id,
    required this.generatedAt,
    required this.recommendationType,
    required this.primaryRecommendation,
    final List<String> alternativeActivities = const [],
    required this.reasoning,
    required this.targetStrainRange,
    required this.suggestedDuration,
    required this.suggestedIntensity,
    final List<String> warnings = const [],
    required this.recoveryScore,
    this.previousDayStrain,
    this.isAiGenerated = true,
    this.confidence = 70,
    final List<SuggestedActivity> suggestedActivities = const [],
    final List<RecoveryProtocol> recoveryProtocols = const [],
  }) : _alternativeActivities = alternativeActivities,
       _warnings = warnings,
       _suggestedActivities = suggestedActivities,
       _recoveryProtocols = recoveryProtocols;

  factory _$ActivityRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityRecommendationImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime generatedAt;

  /// The type of recommendation: rest, light, moderate, intense
  @override
  final RecommendationType recommendationType;

  /// Primary recommendation text
  @override
  final String primaryRecommendation;

  /// Alternative activities if user wants options
  final List<String> _alternativeActivities;

  /// Alternative activities if user wants options
  @override
  @JsonKey()
  List<String> get alternativeActivities {
    if (_alternativeActivities is EqualUnmodifiableListView)
      return _alternativeActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alternativeActivities);
  }

  /// Reasoning behind the recommendation
  @override
  final String reasoning;

  /// Target strain range for the day (min, max)
  @override
  final StrainRange targetStrainRange;

  /// Suggested duration in minutes
  @override
  final int suggestedDuration;

  /// Suggested intensity (1-10)
  @override
  final int suggestedIntensity;

  /// Warnings or cautions
  final List<String> _warnings;

  /// Warnings or cautions
  @override
  @JsonKey()
  List<String> get warnings {
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warnings);
  }

  /// Recovery score this recommendation is based on
  @override
  final double recoveryScore;

  /// Strain score from previous day
  @override
  final double? previousDayStrain;

  /// Is this an AI-generated recommendation?
  @override
  @JsonKey()
  final bool isAiGenerated;

  /// AI confidence in this recommendation (0-100)
  @override
  @JsonKey()
  final int confidence;

  /// Specific exercises or activities suggested
  final List<SuggestedActivity> _suggestedActivities;

  /// Specific exercises or activities suggested
  @override
  @JsonKey()
  List<SuggestedActivity> get suggestedActivities {
    if (_suggestedActivities is EqualUnmodifiableListView)
      return _suggestedActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedActivities);
  }

  /// Recovery protocols to follow
  final List<RecoveryProtocol> _recoveryProtocols;

  /// Recovery protocols to follow
  @override
  @JsonKey()
  List<RecoveryProtocol> get recoveryProtocols {
    if (_recoveryProtocols is EqualUnmodifiableListView)
      return _recoveryProtocols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recoveryProtocols);
  }

  @override
  String toString() {
    return 'ActivityRecommendation(id: $id, generatedAt: $generatedAt, recommendationType: $recommendationType, primaryRecommendation: $primaryRecommendation, alternativeActivities: $alternativeActivities, reasoning: $reasoning, targetStrainRange: $targetStrainRange, suggestedDuration: $suggestedDuration, suggestedIntensity: $suggestedIntensity, warnings: $warnings, recoveryScore: $recoveryScore, previousDayStrain: $previousDayStrain, isAiGenerated: $isAiGenerated, confidence: $confidence, suggestedActivities: $suggestedActivities, recoveryProtocols: $recoveryProtocols)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityRecommendationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.recommendationType, recommendationType) ||
                other.recommendationType == recommendationType) &&
            (identical(other.primaryRecommendation, primaryRecommendation) ||
                other.primaryRecommendation == primaryRecommendation) &&
            const DeepCollectionEquality().equals(
              other._alternativeActivities,
              _alternativeActivities,
            ) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.targetStrainRange, targetStrainRange) ||
                other.targetStrainRange == targetStrainRange) &&
            (identical(other.suggestedDuration, suggestedDuration) ||
                other.suggestedDuration == suggestedDuration) &&
            (identical(other.suggestedIntensity, suggestedIntensity) ||
                other.suggestedIntensity == suggestedIntensity) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.previousDayStrain, previousDayStrain) ||
                other.previousDayStrain == previousDayStrain) &&
            (identical(other.isAiGenerated, isAiGenerated) ||
                other.isAiGenerated == isAiGenerated) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(
              other._suggestedActivities,
              _suggestedActivities,
            ) &&
            const DeepCollectionEquality().equals(
              other._recoveryProtocols,
              _recoveryProtocols,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    generatedAt,
    recommendationType,
    primaryRecommendation,
    const DeepCollectionEquality().hash(_alternativeActivities),
    reasoning,
    targetStrainRange,
    suggestedDuration,
    suggestedIntensity,
    const DeepCollectionEquality().hash(_warnings),
    recoveryScore,
    previousDayStrain,
    isAiGenerated,
    confidence,
    const DeepCollectionEquality().hash(_suggestedActivities),
    const DeepCollectionEquality().hash(_recoveryProtocols),
  );

  /// Create a copy of ActivityRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityRecommendationImplCopyWith<_$ActivityRecommendationImpl>
  get copyWith =>
      __$$ActivityRecommendationImplCopyWithImpl<_$ActivityRecommendationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityRecommendationImplToJson(this);
  }
}

abstract class _ActivityRecommendation implements ActivityRecommendation {
  const factory _ActivityRecommendation({
    required final String id,
    required final DateTime generatedAt,
    required final RecommendationType recommendationType,
    required final String primaryRecommendation,
    final List<String> alternativeActivities,
    required final String reasoning,
    required final StrainRange targetStrainRange,
    required final int suggestedDuration,
    required final int suggestedIntensity,
    final List<String> warnings,
    required final double recoveryScore,
    final double? previousDayStrain,
    final bool isAiGenerated,
    final int confidence,
    final List<SuggestedActivity> suggestedActivities,
    final List<RecoveryProtocol> recoveryProtocols,
  }) = _$ActivityRecommendationImpl;

  factory _ActivityRecommendation.fromJson(Map<String, dynamic> json) =
      _$ActivityRecommendationImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get generatedAt;

  /// The type of recommendation: rest, light, moderate, intense
  @override
  RecommendationType get recommendationType;

  /// Primary recommendation text
  @override
  String get primaryRecommendation;

  /// Alternative activities if user wants options
  @override
  List<String> get alternativeActivities;

  /// Reasoning behind the recommendation
  @override
  String get reasoning;

  /// Target strain range for the day (min, max)
  @override
  StrainRange get targetStrainRange;

  /// Suggested duration in minutes
  @override
  int get suggestedDuration;

  /// Suggested intensity (1-10)
  @override
  int get suggestedIntensity;

  /// Warnings or cautions
  @override
  List<String> get warnings;

  /// Recovery score this recommendation is based on
  @override
  double get recoveryScore;

  /// Strain score from previous day
  @override
  double? get previousDayStrain;

  /// Is this an AI-generated recommendation?
  @override
  bool get isAiGenerated;

  /// AI confidence in this recommendation (0-100)
  @override
  int get confidence;

  /// Specific exercises or activities suggested
  @override
  List<SuggestedActivity> get suggestedActivities;

  /// Recovery protocols to follow
  @override
  List<RecoveryProtocol> get recoveryProtocols;

  /// Create a copy of ActivityRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityRecommendationImplCopyWith<_$ActivityRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

StrainRange _$StrainRangeFromJson(Map<String, dynamic> json) {
  return _StrainRange.fromJson(json);
}

/// @nodoc
mixin _$StrainRange {
  double get min => throw _privateConstructorUsedError;
  double get max => throw _privateConstructorUsedError;

  /// Serializes this StrainRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrainRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrainRangeCopyWith<StrainRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrainRangeCopyWith<$Res> {
  factory $StrainRangeCopyWith(
    StrainRange value,
    $Res Function(StrainRange) then,
  ) = _$StrainRangeCopyWithImpl<$Res, StrainRange>;
  @useResult
  $Res call({double min, double max});
}

/// @nodoc
class _$StrainRangeCopyWithImpl<$Res, $Val extends StrainRange>
    implements $StrainRangeCopyWith<$Res> {
  _$StrainRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrainRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? min = null, Object? max = null}) {
    return _then(
      _value.copyWith(
            min: null == min
                ? _value.min
                : min // ignore: cast_nullable_to_non_nullable
                      as double,
            max: null == max
                ? _value.max
                : max // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StrainRangeImplCopyWith<$Res>
    implements $StrainRangeCopyWith<$Res> {
  factory _$$StrainRangeImplCopyWith(
    _$StrainRangeImpl value,
    $Res Function(_$StrainRangeImpl) then,
  ) = __$$StrainRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double min, double max});
}

/// @nodoc
class __$$StrainRangeImplCopyWithImpl<$Res>
    extends _$StrainRangeCopyWithImpl<$Res, _$StrainRangeImpl>
    implements _$$StrainRangeImplCopyWith<$Res> {
  __$$StrainRangeImplCopyWithImpl(
    _$StrainRangeImpl _value,
    $Res Function(_$StrainRangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StrainRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? min = null, Object? max = null}) {
    return _then(
      _$StrainRangeImpl(
        min: null == min
            ? _value.min
            : min // ignore: cast_nullable_to_non_nullable
                  as double,
        max: null == max
            ? _value.max
            : max // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StrainRangeImpl implements _StrainRange {
  const _$StrainRangeImpl({required this.min, required this.max});

  factory _$StrainRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrainRangeImplFromJson(json);

  @override
  final double min;
  @override
  final double max;

  @override
  String toString() {
    return 'StrainRange(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrainRangeImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  /// Create a copy of StrainRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrainRangeImplCopyWith<_$StrainRangeImpl> get copyWith =>
      __$$StrainRangeImplCopyWithImpl<_$StrainRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrainRangeImplToJson(this);
  }
}

abstract class _StrainRange implements StrainRange {
  const factory _StrainRange({
    required final double min,
    required final double max,
  }) = _$StrainRangeImpl;

  factory _StrainRange.fromJson(Map<String, dynamic> json) =
      _$StrainRangeImpl.fromJson;

  @override
  double get min;
  @override
  double get max;

  /// Create a copy of StrainRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrainRangeImplCopyWith<_$StrainRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SuggestedActivity _$SuggestedActivityFromJson(Map<String, dynamic> json) {
  return _SuggestedActivity.fromJson(json);
}

/// @nodoc
mixin _$SuggestedActivity {
  /// Activity name
  String get name => throw _privateConstructorUsedError;

  /// Activity name in Arabic
  String? get nameAr => throw _privateConstructorUsedError;

  /// Activity type (walking, yoga, strength, etc.)
  String get type => throw _privateConstructorUsedError;

  /// Suggested duration in minutes
  int get duration => throw _privateConstructorUsedError;

  /// Suggested intensity (1-10)
  int get intensity => throw _privateConstructorUsedError;

  /// Brief description
  String? get description => throw _privateConstructorUsedError;

  /// Equipment needed (if any)
  List<String> get equipment => throw _privateConstructorUsedError;

  /// Is this suitable for the current weather/conditions
  bool get weatherAppropriate => throw _privateConstructorUsedError;

  /// Notes for Egyptian context (heat, Ramadan, etc.)
  String? get localContextNote => throw _privateConstructorUsedError;

  /// Serializes this SuggestedActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuggestedActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestedActivityCopyWith<SuggestedActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedActivityCopyWith<$Res> {
  factory $SuggestedActivityCopyWith(
    SuggestedActivity value,
    $Res Function(SuggestedActivity) then,
  ) = _$SuggestedActivityCopyWithImpl<$Res, SuggestedActivity>;
  @useResult
  $Res call({
    String name,
    String? nameAr,
    String type,
    int duration,
    int intensity,
    String? description,
    List<String> equipment,
    bool weatherAppropriate,
    String? localContextNote,
  });
}

/// @nodoc
class _$SuggestedActivityCopyWithImpl<$Res, $Val extends SuggestedActivity>
    implements $SuggestedActivityCopyWith<$Res> {
  _$SuggestedActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuggestedActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameAr = freezed,
    Object? type = null,
    Object? duration = null,
    Object? intensity = null,
    Object? description = freezed,
    Object? equipment = null,
    Object? weatherAppropriate = null,
    Object? localContextNote = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            nameAr: freezed == nameAr
                ? _value.nameAr
                : nameAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
            intensity: null == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                      as int,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            equipment: null == equipment
                ? _value.equipment
                : equipment // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            weatherAppropriate: null == weatherAppropriate
                ? _value.weatherAppropriate
                : weatherAppropriate // ignore: cast_nullable_to_non_nullable
                      as bool,
            localContextNote: freezed == localContextNote
                ? _value.localContextNote
                : localContextNote // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SuggestedActivityImplCopyWith<$Res>
    implements $SuggestedActivityCopyWith<$Res> {
  factory _$$SuggestedActivityImplCopyWith(
    _$SuggestedActivityImpl value,
    $Res Function(_$SuggestedActivityImpl) then,
  ) = __$$SuggestedActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String? nameAr,
    String type,
    int duration,
    int intensity,
    String? description,
    List<String> equipment,
    bool weatherAppropriate,
    String? localContextNote,
  });
}

/// @nodoc
class __$$SuggestedActivityImplCopyWithImpl<$Res>
    extends _$SuggestedActivityCopyWithImpl<$Res, _$SuggestedActivityImpl>
    implements _$$SuggestedActivityImplCopyWith<$Res> {
  __$$SuggestedActivityImplCopyWithImpl(
    _$SuggestedActivityImpl _value,
    $Res Function(_$SuggestedActivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SuggestedActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameAr = freezed,
    Object? type = null,
    Object? duration = null,
    Object? intensity = null,
    Object? description = freezed,
    Object? equipment = null,
    Object? weatherAppropriate = null,
    Object? localContextNote = freezed,
  }) {
    return _then(
      _$SuggestedActivityImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAr: freezed == nameAr
            ? _value.nameAr
            : nameAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        intensity: null == intensity
            ? _value.intensity
            : intensity // ignore: cast_nullable_to_non_nullable
                  as int,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        equipment: null == equipment
            ? _value._equipment
            : equipment // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        weatherAppropriate: null == weatherAppropriate
            ? _value.weatherAppropriate
            : weatherAppropriate // ignore: cast_nullable_to_non_nullable
                  as bool,
        localContextNote: freezed == localContextNote
            ? _value.localContextNote
            : localContextNote // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestedActivityImpl implements _SuggestedActivity {
  const _$SuggestedActivityImpl({
    required this.name,
    this.nameAr,
    required this.type,
    required this.duration,
    required this.intensity,
    this.description,
    final List<String> equipment = const [],
    this.weatherAppropriate = true,
    this.localContextNote,
  }) : _equipment = equipment;

  factory _$SuggestedActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestedActivityImplFromJson(json);

  /// Activity name
  @override
  final String name;

  /// Activity name in Arabic
  @override
  final String? nameAr;

  /// Activity type (walking, yoga, strength, etc.)
  @override
  final String type;

  /// Suggested duration in minutes
  @override
  final int duration;

  /// Suggested intensity (1-10)
  @override
  final int intensity;

  /// Brief description
  @override
  final String? description;

  /// Equipment needed (if any)
  final List<String> _equipment;

  /// Equipment needed (if any)
  @override
  @JsonKey()
  List<String> get equipment {
    if (_equipment is EqualUnmodifiableListView) return _equipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipment);
  }

  /// Is this suitable for the current weather/conditions
  @override
  @JsonKey()
  final bool weatherAppropriate;

  /// Notes for Egyptian context (heat, Ramadan, etc.)
  @override
  final String? localContextNote;

  @override
  String toString() {
    return 'SuggestedActivity(name: $name, nameAr: $nameAr, type: $type, duration: $duration, intensity: $intensity, description: $description, equipment: $equipment, weatherAppropriate: $weatherAppropriate, localContextNote: $localContextNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestedActivityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._equipment,
              _equipment,
            ) &&
            (identical(other.weatherAppropriate, weatherAppropriate) ||
                other.weatherAppropriate == weatherAppropriate) &&
            (identical(other.localContextNote, localContextNote) ||
                other.localContextNote == localContextNote));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    nameAr,
    type,
    duration,
    intensity,
    description,
    const DeepCollectionEquality().hash(_equipment),
    weatherAppropriate,
    localContextNote,
  );

  /// Create a copy of SuggestedActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestedActivityImplCopyWith<_$SuggestedActivityImpl> get copyWith =>
      __$$SuggestedActivityImplCopyWithImpl<_$SuggestedActivityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestedActivityImplToJson(this);
  }
}

abstract class _SuggestedActivity implements SuggestedActivity {
  const factory _SuggestedActivity({
    required final String name,
    final String? nameAr,
    required final String type,
    required final int duration,
    required final int intensity,
    final String? description,
    final List<String> equipment,
    final bool weatherAppropriate,
    final String? localContextNote,
  }) = _$SuggestedActivityImpl;

  factory _SuggestedActivity.fromJson(Map<String, dynamic> json) =
      _$SuggestedActivityImpl.fromJson;

  /// Activity name
  @override
  String get name;

  /// Activity name in Arabic
  @override
  String? get nameAr;

  /// Activity type (walking, yoga, strength, etc.)
  @override
  String get type;

  /// Suggested duration in minutes
  @override
  int get duration;

  /// Suggested intensity (1-10)
  @override
  int get intensity;

  /// Brief description
  @override
  String? get description;

  /// Equipment needed (if any)
  @override
  List<String> get equipment;

  /// Is this suitable for the current weather/conditions
  @override
  bool get weatherAppropriate;

  /// Notes for Egyptian context (heat, Ramadan, etc.)
  @override
  String? get localContextNote;

  /// Create a copy of SuggestedActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestedActivityImplCopyWith<_$SuggestedActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecoveryProtocol _$RecoveryProtocolFromJson(Map<String, dynamic> json) {
  return _RecoveryProtocol.fromJson(json);
}

/// @nodoc
mixin _$RecoveryProtocol {
  /// Protocol name
  String get name => throw _privateConstructorUsedError;

  /// Protocol name in Arabic
  String? get nameAr => throw _privateConstructorUsedError;

  /// Protocol category
  RecoveryCategory get category => throw _privateConstructorUsedError;

  /// When to do this
  String get timing => throw _privateConstructorUsedError;

  /// Duration in minutes
  int? get duration => throw _privateConstructorUsedError;

  /// Brief description
  String? get description => throw _privateConstructorUsedError;

  /// Priority level
  RecoveryPriority get priority => throw _privateConstructorUsedError;

  /// Serializes this RecoveryProtocol to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecoveryProtocol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecoveryProtocolCopyWith<RecoveryProtocol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveryProtocolCopyWith<$Res> {
  factory $RecoveryProtocolCopyWith(
    RecoveryProtocol value,
    $Res Function(RecoveryProtocol) then,
  ) = _$RecoveryProtocolCopyWithImpl<$Res, RecoveryProtocol>;
  @useResult
  $Res call({
    String name,
    String? nameAr,
    RecoveryCategory category,
    String timing,
    int? duration,
    String? description,
    RecoveryPriority priority,
  });
}

/// @nodoc
class _$RecoveryProtocolCopyWithImpl<$Res, $Val extends RecoveryProtocol>
    implements $RecoveryProtocolCopyWith<$Res> {
  _$RecoveryProtocolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecoveryProtocol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameAr = freezed,
    Object? category = null,
    Object? timing = null,
    Object? duration = freezed,
    Object? description = freezed,
    Object? priority = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            nameAr: freezed == nameAr
                ? _value.nameAr
                : nameAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as RecoveryCategory,
            timing: null == timing
                ? _value.timing
                : timing // ignore: cast_nullable_to_non_nullable
                      as String,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as RecoveryPriority,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecoveryProtocolImplCopyWith<$Res>
    implements $RecoveryProtocolCopyWith<$Res> {
  factory _$$RecoveryProtocolImplCopyWith(
    _$RecoveryProtocolImpl value,
    $Res Function(_$RecoveryProtocolImpl) then,
  ) = __$$RecoveryProtocolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String? nameAr,
    RecoveryCategory category,
    String timing,
    int? duration,
    String? description,
    RecoveryPriority priority,
  });
}

/// @nodoc
class __$$RecoveryProtocolImplCopyWithImpl<$Res>
    extends _$RecoveryProtocolCopyWithImpl<$Res, _$RecoveryProtocolImpl>
    implements _$$RecoveryProtocolImplCopyWith<$Res> {
  __$$RecoveryProtocolImplCopyWithImpl(
    _$RecoveryProtocolImpl _value,
    $Res Function(_$RecoveryProtocolImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecoveryProtocol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameAr = freezed,
    Object? category = null,
    Object? timing = null,
    Object? duration = freezed,
    Object? description = freezed,
    Object? priority = null,
  }) {
    return _then(
      _$RecoveryProtocolImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAr: freezed == nameAr
            ? _value.nameAr
            : nameAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as RecoveryCategory,
        timing: null == timing
            ? _value.timing
            : timing // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as RecoveryPriority,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecoveryProtocolImpl implements _RecoveryProtocol {
  const _$RecoveryProtocolImpl({
    required this.name,
    this.nameAr,
    required this.category,
    required this.timing,
    this.duration,
    this.description,
    this.priority = RecoveryPriority.medium,
  });

  factory _$RecoveryProtocolImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecoveryProtocolImplFromJson(json);

  /// Protocol name
  @override
  final String name;

  /// Protocol name in Arabic
  @override
  final String? nameAr;

  /// Protocol category
  @override
  final RecoveryCategory category;

  /// When to do this
  @override
  final String timing;

  /// Duration in minutes
  @override
  final int? duration;

  /// Brief description
  @override
  final String? description;

  /// Priority level
  @override
  @JsonKey()
  final RecoveryPriority priority;

  @override
  String toString() {
    return 'RecoveryProtocol(name: $name, nameAr: $nameAr, category: $category, timing: $timing, duration: $duration, description: $description, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecoveryProtocolImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.timing, timing) || other.timing == timing) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    nameAr,
    category,
    timing,
    duration,
    description,
    priority,
  );

  /// Create a copy of RecoveryProtocol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecoveryProtocolImplCopyWith<_$RecoveryProtocolImpl> get copyWith =>
      __$$RecoveryProtocolImplCopyWithImpl<_$RecoveryProtocolImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecoveryProtocolImplToJson(this);
  }
}

abstract class _RecoveryProtocol implements RecoveryProtocol {
  const factory _RecoveryProtocol({
    required final String name,
    final String? nameAr,
    required final RecoveryCategory category,
    required final String timing,
    final int? duration,
    final String? description,
    final RecoveryPriority priority,
  }) = _$RecoveryProtocolImpl;

  factory _RecoveryProtocol.fromJson(Map<String, dynamic> json) =
      _$RecoveryProtocolImpl.fromJson;

  /// Protocol name
  @override
  String get name;

  /// Protocol name in Arabic
  @override
  String? get nameAr;

  /// Protocol category
  @override
  RecoveryCategory get category;

  /// When to do this
  @override
  String get timing;

  /// Duration in minutes
  @override
  int? get duration;

  /// Brief description
  @override
  String? get description;

  /// Priority level
  @override
  RecoveryPriority get priority;

  /// Create a copy of RecoveryProtocol
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecoveryProtocolImplCopyWith<_$RecoveryProtocolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivityRecommendationContext _$ActivityRecommendationContextFromJson(
  Map<String, dynamic> json,
) {
  return _ActivityRecommendationContext.fromJson(json);
}

/// @nodoc
mixin _$ActivityRecommendationContext {
  /// Current recovery score (0-100)
  double get recoveryScore => throw _privateConstructorUsedError;

  /// Previous day's strain score (0-21)
  double? get strainScore => throw _privateConstructorUsedError;

  /// Recent workouts (last 7 days)
  List<RecentWorkoutInfo> get recentWorkouts =>
      throw _privateConstructorUsedError;

  /// User's protocol constraints
  List<String> get constraints => throw _privateConstructorUsedError;

  /// User's weekly activity plan
  List<String> get weeklyPlan => throw _privateConstructorUsedError;

  /// Is today a scheduled training day?
  bool get isScheduledTrainingDay => throw _privateConstructorUsedError;

  /// Scheduled workout type (if any)
  String? get scheduledWorkoutType => throw _privateConstructorUsedError;

  /// Current HRV
  int? get currentHrv => throw _privateConstructorUsedError;

  /// Baseline HRV for comparison
  int? get baselineHrv => throw _privateConstructorUsedError;

  /// Current resting heart rate
  int? get currentRhr => throw _privateConstructorUsedError;

  /// Baseline RHR for comparison
  int? get baselineRhr => throw _privateConstructorUsedError;

  /// Sleep hours last night
  double? get sleepHours => throw _privateConstructorUsedError;

  /// Sleep quality (0-100)
  int? get sleepQuality => throw _privateConstructorUsedError;

  /// Current mood/energy (1-5)
  int? get moodEnergy => throw _privateConstructorUsedError;

  /// Current stress level (1-5)
  int? get stressLevel => throw _privateConstructorUsedError;

  /// Is it Ramadan? (affects recommendations)
  bool get isRamadan => throw _privateConstructorUsedError;

  /// Current weather conditions (for outdoor activities)
  String? get weatherCondition => throw _privateConstructorUsedError;

  /// Temperature (affects recommendations in Egypt)
  double? get temperatureCelsius => throw _privateConstructorUsedError;

  /// Language preference
  String get language => throw _privateConstructorUsedError;

  /// Serializes this ActivityRecommendationContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityRecommendationContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityRecommendationContextCopyWith<ActivityRecommendationContext>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityRecommendationContextCopyWith<$Res> {
  factory $ActivityRecommendationContextCopyWith(
    ActivityRecommendationContext value,
    $Res Function(ActivityRecommendationContext) then,
  ) =
      _$ActivityRecommendationContextCopyWithImpl<
        $Res,
        ActivityRecommendationContext
      >;
  @useResult
  $Res call({
    double recoveryScore,
    double? strainScore,
    List<RecentWorkoutInfo> recentWorkouts,
    List<String> constraints,
    List<String> weeklyPlan,
    bool isScheduledTrainingDay,
    String? scheduledWorkoutType,
    int? currentHrv,
    int? baselineHrv,
    int? currentRhr,
    int? baselineRhr,
    double? sleepHours,
    int? sleepQuality,
    int? moodEnergy,
    int? stressLevel,
    bool isRamadan,
    String? weatherCondition,
    double? temperatureCelsius,
    String language,
  });
}

/// @nodoc
class _$ActivityRecommendationContextCopyWithImpl<
  $Res,
  $Val extends ActivityRecommendationContext
>
    implements $ActivityRecommendationContextCopyWith<$Res> {
  _$ActivityRecommendationContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityRecommendationContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recoveryScore = null,
    Object? strainScore = freezed,
    Object? recentWorkouts = null,
    Object? constraints = null,
    Object? weeklyPlan = null,
    Object? isScheduledTrainingDay = null,
    Object? scheduledWorkoutType = freezed,
    Object? currentHrv = freezed,
    Object? baselineHrv = freezed,
    Object? currentRhr = freezed,
    Object? baselineRhr = freezed,
    Object? sleepHours = freezed,
    Object? sleepQuality = freezed,
    Object? moodEnergy = freezed,
    Object? stressLevel = freezed,
    Object? isRamadan = null,
    Object? weatherCondition = freezed,
    Object? temperatureCelsius = freezed,
    Object? language = null,
  }) {
    return _then(
      _value.copyWith(
            recoveryScore: null == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as double,
            strainScore: freezed == strainScore
                ? _value.strainScore
                : strainScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            recentWorkouts: null == recentWorkouts
                ? _value.recentWorkouts
                : recentWorkouts // ignore: cast_nullable_to_non_nullable
                      as List<RecentWorkoutInfo>,
            constraints: null == constraints
                ? _value.constraints
                : constraints // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            weeklyPlan: null == weeklyPlan
                ? _value.weeklyPlan
                : weeklyPlan // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isScheduledTrainingDay: null == isScheduledTrainingDay
                ? _value.isScheduledTrainingDay
                : isScheduledTrainingDay // ignore: cast_nullable_to_non_nullable
                      as bool,
            scheduledWorkoutType: freezed == scheduledWorkoutType
                ? _value.scheduledWorkoutType
                : scheduledWorkoutType // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentHrv: freezed == currentHrv
                ? _value.currentHrv
                : currentHrv // ignore: cast_nullable_to_non_nullable
                      as int?,
            baselineHrv: freezed == baselineHrv
                ? _value.baselineHrv
                : baselineHrv // ignore: cast_nullable_to_non_nullable
                      as int?,
            currentRhr: freezed == currentRhr
                ? _value.currentRhr
                : currentRhr // ignore: cast_nullable_to_non_nullable
                      as int?,
            baselineRhr: freezed == baselineRhr
                ? _value.baselineRhr
                : baselineRhr // ignore: cast_nullable_to_non_nullable
                      as int?,
            sleepHours: freezed == sleepHours
                ? _value.sleepHours
                : sleepHours // ignore: cast_nullable_to_non_nullable
                      as double?,
            sleepQuality: freezed == sleepQuality
                ? _value.sleepQuality
                : sleepQuality // ignore: cast_nullable_to_non_nullable
                      as int?,
            moodEnergy: freezed == moodEnergy
                ? _value.moodEnergy
                : moodEnergy // ignore: cast_nullable_to_non_nullable
                      as int?,
            stressLevel: freezed == stressLevel
                ? _value.stressLevel
                : stressLevel // ignore: cast_nullable_to_non_nullable
                      as int?,
            isRamadan: null == isRamadan
                ? _value.isRamadan
                : isRamadan // ignore: cast_nullable_to_non_nullable
                      as bool,
            weatherCondition: freezed == weatherCondition
                ? _value.weatherCondition
                : weatherCondition // ignore: cast_nullable_to_non_nullable
                      as String?,
            temperatureCelsius: freezed == temperatureCelsius
                ? _value.temperatureCelsius
                : temperatureCelsius // ignore: cast_nullable_to_non_nullable
                      as double?,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ActivityRecommendationContextImplCopyWith<$Res>
    implements $ActivityRecommendationContextCopyWith<$Res> {
  factory _$$ActivityRecommendationContextImplCopyWith(
    _$ActivityRecommendationContextImpl value,
    $Res Function(_$ActivityRecommendationContextImpl) then,
  ) = __$$ActivityRecommendationContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double recoveryScore,
    double? strainScore,
    List<RecentWorkoutInfo> recentWorkouts,
    List<String> constraints,
    List<String> weeklyPlan,
    bool isScheduledTrainingDay,
    String? scheduledWorkoutType,
    int? currentHrv,
    int? baselineHrv,
    int? currentRhr,
    int? baselineRhr,
    double? sleepHours,
    int? sleepQuality,
    int? moodEnergy,
    int? stressLevel,
    bool isRamadan,
    String? weatherCondition,
    double? temperatureCelsius,
    String language,
  });
}

/// @nodoc
class __$$ActivityRecommendationContextImplCopyWithImpl<$Res>
    extends
        _$ActivityRecommendationContextCopyWithImpl<
          $Res,
          _$ActivityRecommendationContextImpl
        >
    implements _$$ActivityRecommendationContextImplCopyWith<$Res> {
  __$$ActivityRecommendationContextImplCopyWithImpl(
    _$ActivityRecommendationContextImpl _value,
    $Res Function(_$ActivityRecommendationContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ActivityRecommendationContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recoveryScore = null,
    Object? strainScore = freezed,
    Object? recentWorkouts = null,
    Object? constraints = null,
    Object? weeklyPlan = null,
    Object? isScheduledTrainingDay = null,
    Object? scheduledWorkoutType = freezed,
    Object? currentHrv = freezed,
    Object? baselineHrv = freezed,
    Object? currentRhr = freezed,
    Object? baselineRhr = freezed,
    Object? sleepHours = freezed,
    Object? sleepQuality = freezed,
    Object? moodEnergy = freezed,
    Object? stressLevel = freezed,
    Object? isRamadan = null,
    Object? weatherCondition = freezed,
    Object? temperatureCelsius = freezed,
    Object? language = null,
  }) {
    return _then(
      _$ActivityRecommendationContextImpl(
        recoveryScore: null == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as double,
        strainScore: freezed == strainScore
            ? _value.strainScore
            : strainScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        recentWorkouts: null == recentWorkouts
            ? _value._recentWorkouts
            : recentWorkouts // ignore: cast_nullable_to_non_nullable
                  as List<RecentWorkoutInfo>,
        constraints: null == constraints
            ? _value._constraints
            : constraints // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        weeklyPlan: null == weeklyPlan
            ? _value._weeklyPlan
            : weeklyPlan // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isScheduledTrainingDay: null == isScheduledTrainingDay
            ? _value.isScheduledTrainingDay
            : isScheduledTrainingDay // ignore: cast_nullable_to_non_nullable
                  as bool,
        scheduledWorkoutType: freezed == scheduledWorkoutType
            ? _value.scheduledWorkoutType
            : scheduledWorkoutType // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentHrv: freezed == currentHrv
            ? _value.currentHrv
            : currentHrv // ignore: cast_nullable_to_non_nullable
                  as int?,
        baselineHrv: freezed == baselineHrv
            ? _value.baselineHrv
            : baselineHrv // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentRhr: freezed == currentRhr
            ? _value.currentRhr
            : currentRhr // ignore: cast_nullable_to_non_nullable
                  as int?,
        baselineRhr: freezed == baselineRhr
            ? _value.baselineRhr
            : baselineRhr // ignore: cast_nullable_to_non_nullable
                  as int?,
        sleepHours: freezed == sleepHours
            ? _value.sleepHours
            : sleepHours // ignore: cast_nullable_to_non_nullable
                  as double?,
        sleepQuality: freezed == sleepQuality
            ? _value.sleepQuality
            : sleepQuality // ignore: cast_nullable_to_non_nullable
                  as int?,
        moodEnergy: freezed == moodEnergy
            ? _value.moodEnergy
            : moodEnergy // ignore: cast_nullable_to_non_nullable
                  as int?,
        stressLevel: freezed == stressLevel
            ? _value.stressLevel
            : stressLevel // ignore: cast_nullable_to_non_nullable
                  as int?,
        isRamadan: null == isRamadan
            ? _value.isRamadan
            : isRamadan // ignore: cast_nullable_to_non_nullable
                  as bool,
        weatherCondition: freezed == weatherCondition
            ? _value.weatherCondition
            : weatherCondition // ignore: cast_nullable_to_non_nullable
                  as String?,
        temperatureCelsius: freezed == temperatureCelsius
            ? _value.temperatureCelsius
            : temperatureCelsius // ignore: cast_nullable_to_non_nullable
                  as double?,
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
class _$ActivityRecommendationContextImpl
    implements _ActivityRecommendationContext {
  const _$ActivityRecommendationContextImpl({
    required this.recoveryScore,
    this.strainScore,
    final List<RecentWorkoutInfo> recentWorkouts = const [],
    final List<String> constraints = const [],
    final List<String> weeklyPlan = const [],
    this.isScheduledTrainingDay = false,
    this.scheduledWorkoutType,
    this.currentHrv,
    this.baselineHrv,
    this.currentRhr,
    this.baselineRhr,
    this.sleepHours,
    this.sleepQuality,
    this.moodEnergy,
    this.stressLevel,
    this.isRamadan = false,
    this.weatherCondition,
    this.temperatureCelsius,
    this.language = 'ar',
  }) : _recentWorkouts = recentWorkouts,
       _constraints = constraints,
       _weeklyPlan = weeklyPlan;

  factory _$ActivityRecommendationContextImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ActivityRecommendationContextImplFromJson(json);

  /// Current recovery score (0-100)
  @override
  final double recoveryScore;

  /// Previous day's strain score (0-21)
  @override
  final double? strainScore;

  /// Recent workouts (last 7 days)
  final List<RecentWorkoutInfo> _recentWorkouts;

  /// Recent workouts (last 7 days)
  @override
  @JsonKey()
  List<RecentWorkoutInfo> get recentWorkouts {
    if (_recentWorkouts is EqualUnmodifiableListView) return _recentWorkouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentWorkouts);
  }

  /// User's protocol constraints
  final List<String> _constraints;

  /// User's protocol constraints
  @override
  @JsonKey()
  List<String> get constraints {
    if (_constraints is EqualUnmodifiableListView) return _constraints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_constraints);
  }

  /// User's weekly activity plan
  final List<String> _weeklyPlan;

  /// User's weekly activity plan
  @override
  @JsonKey()
  List<String> get weeklyPlan {
    if (_weeklyPlan is EqualUnmodifiableListView) return _weeklyPlan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyPlan);
  }

  /// Is today a scheduled training day?
  @override
  @JsonKey()
  final bool isScheduledTrainingDay;

  /// Scheduled workout type (if any)
  @override
  final String? scheduledWorkoutType;

  /// Current HRV
  @override
  final int? currentHrv;

  /// Baseline HRV for comparison
  @override
  final int? baselineHrv;

  /// Current resting heart rate
  @override
  final int? currentRhr;

  /// Baseline RHR for comparison
  @override
  final int? baselineRhr;

  /// Sleep hours last night
  @override
  final double? sleepHours;

  /// Sleep quality (0-100)
  @override
  final int? sleepQuality;

  /// Current mood/energy (1-5)
  @override
  final int? moodEnergy;

  /// Current stress level (1-5)
  @override
  final int? stressLevel;

  /// Is it Ramadan? (affects recommendations)
  @override
  @JsonKey()
  final bool isRamadan;

  /// Current weather conditions (for outdoor activities)
  @override
  final String? weatherCondition;

  /// Temperature (affects recommendations in Egypt)
  @override
  final double? temperatureCelsius;

  /// Language preference
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'ActivityRecommendationContext(recoveryScore: $recoveryScore, strainScore: $strainScore, recentWorkouts: $recentWorkouts, constraints: $constraints, weeklyPlan: $weeklyPlan, isScheduledTrainingDay: $isScheduledTrainingDay, scheduledWorkoutType: $scheduledWorkoutType, currentHrv: $currentHrv, baselineHrv: $baselineHrv, currentRhr: $currentRhr, baselineRhr: $baselineRhr, sleepHours: $sleepHours, sleepQuality: $sleepQuality, moodEnergy: $moodEnergy, stressLevel: $stressLevel, isRamadan: $isRamadan, weatherCondition: $weatherCondition, temperatureCelsius: $temperatureCelsius, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityRecommendationContextImpl &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.strainScore, strainScore) ||
                other.strainScore == strainScore) &&
            const DeepCollectionEquality().equals(
              other._recentWorkouts,
              _recentWorkouts,
            ) &&
            const DeepCollectionEquality().equals(
              other._constraints,
              _constraints,
            ) &&
            const DeepCollectionEquality().equals(
              other._weeklyPlan,
              _weeklyPlan,
            ) &&
            (identical(other.isScheduledTrainingDay, isScheduledTrainingDay) ||
                other.isScheduledTrainingDay == isScheduledTrainingDay) &&
            (identical(other.scheduledWorkoutType, scheduledWorkoutType) ||
                other.scheduledWorkoutType == scheduledWorkoutType) &&
            (identical(other.currentHrv, currentHrv) ||
                other.currentHrv == currentHrv) &&
            (identical(other.baselineHrv, baselineHrv) ||
                other.baselineHrv == baselineHrv) &&
            (identical(other.currentRhr, currentRhr) ||
                other.currentRhr == currentRhr) &&
            (identical(other.baselineRhr, baselineRhr) ||
                other.baselineRhr == baselineRhr) &&
            (identical(other.sleepHours, sleepHours) ||
                other.sleepHours == sleepHours) &&
            (identical(other.sleepQuality, sleepQuality) ||
                other.sleepQuality == sleepQuality) &&
            (identical(other.moodEnergy, moodEnergy) ||
                other.moodEnergy == moodEnergy) &&
            (identical(other.stressLevel, stressLevel) ||
                other.stressLevel == stressLevel) &&
            (identical(other.isRamadan, isRamadan) ||
                other.isRamadan == isRamadan) &&
            (identical(other.weatherCondition, weatherCondition) ||
                other.weatherCondition == weatherCondition) &&
            (identical(other.temperatureCelsius, temperatureCelsius) ||
                other.temperatureCelsius == temperatureCelsius) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    recoveryScore,
    strainScore,
    const DeepCollectionEquality().hash(_recentWorkouts),
    const DeepCollectionEquality().hash(_constraints),
    const DeepCollectionEquality().hash(_weeklyPlan),
    isScheduledTrainingDay,
    scheduledWorkoutType,
    currentHrv,
    baselineHrv,
    currentRhr,
    baselineRhr,
    sleepHours,
    sleepQuality,
    moodEnergy,
    stressLevel,
    isRamadan,
    weatherCondition,
    temperatureCelsius,
    language,
  ]);

  /// Create a copy of ActivityRecommendationContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityRecommendationContextImplCopyWith<
    _$ActivityRecommendationContextImpl
  >
  get copyWith =>
      __$$ActivityRecommendationContextImplCopyWithImpl<
        _$ActivityRecommendationContextImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityRecommendationContextImplToJson(this);
  }
}

abstract class _ActivityRecommendationContext
    implements ActivityRecommendationContext {
  const factory _ActivityRecommendationContext({
    required final double recoveryScore,
    final double? strainScore,
    final List<RecentWorkoutInfo> recentWorkouts,
    final List<String> constraints,
    final List<String> weeklyPlan,
    final bool isScheduledTrainingDay,
    final String? scheduledWorkoutType,
    final int? currentHrv,
    final int? baselineHrv,
    final int? currentRhr,
    final int? baselineRhr,
    final double? sleepHours,
    final int? sleepQuality,
    final int? moodEnergy,
    final int? stressLevel,
    final bool isRamadan,
    final String? weatherCondition,
    final double? temperatureCelsius,
    final String language,
  }) = _$ActivityRecommendationContextImpl;

  factory _ActivityRecommendationContext.fromJson(Map<String, dynamic> json) =
      _$ActivityRecommendationContextImpl.fromJson;

  /// Current recovery score (0-100)
  @override
  double get recoveryScore;

  /// Previous day's strain score (0-21)
  @override
  double? get strainScore;

  /// Recent workouts (last 7 days)
  @override
  List<RecentWorkoutInfo> get recentWorkouts;

  /// User's protocol constraints
  @override
  List<String> get constraints;

  /// User's weekly activity plan
  @override
  List<String> get weeklyPlan;

  /// Is today a scheduled training day?
  @override
  bool get isScheduledTrainingDay;

  /// Scheduled workout type (if any)
  @override
  String? get scheduledWorkoutType;

  /// Current HRV
  @override
  int? get currentHrv;

  /// Baseline HRV for comparison
  @override
  int? get baselineHrv;

  /// Current resting heart rate
  @override
  int? get currentRhr;

  /// Baseline RHR for comparison
  @override
  int? get baselineRhr;

  /// Sleep hours last night
  @override
  double? get sleepHours;

  /// Sleep quality (0-100)
  @override
  int? get sleepQuality;

  /// Current mood/energy (1-5)
  @override
  int? get moodEnergy;

  /// Current stress level (1-5)
  @override
  int? get stressLevel;

  /// Is it Ramadan? (affects recommendations)
  @override
  bool get isRamadan;

  /// Current weather conditions (for outdoor activities)
  @override
  String? get weatherCondition;

  /// Temperature (affects recommendations in Egypt)
  @override
  double? get temperatureCelsius;

  /// Language preference
  @override
  String get language;

  /// Create a copy of ActivityRecommendationContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityRecommendationContextImplCopyWith<
    _$ActivityRecommendationContextImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

RecentWorkoutInfo _$RecentWorkoutInfoFromJson(Map<String, dynamic> json) {
  return _RecentWorkoutInfo.fromJson(json);
}

/// @nodoc
mixin _$RecentWorkoutInfo {
  DateTime get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  int? get intensity => throw _privateConstructorUsedError;
  double? get strainScore => throw _privateConstructorUsedError;

  /// Serializes this RecentWorkoutInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentWorkoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentWorkoutInfoCopyWith<RecentWorkoutInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentWorkoutInfoCopyWith<$Res> {
  factory $RecentWorkoutInfoCopyWith(
    RecentWorkoutInfo value,
    $Res Function(RecentWorkoutInfo) then,
  ) = _$RecentWorkoutInfoCopyWithImpl<$Res, RecentWorkoutInfo>;
  @useResult
  $Res call({
    DateTime date,
    String type,
    int durationMinutes,
    int? intensity,
    double? strainScore,
  });
}

/// @nodoc
class _$RecentWorkoutInfoCopyWithImpl<$Res, $Val extends RecentWorkoutInfo>
    implements $RecentWorkoutInfoCopyWith<$Res> {
  _$RecentWorkoutInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentWorkoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? durationMinutes = null,
    Object? intensity = freezed,
    Object? strainScore = freezed,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            durationMinutes: null == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            intensity: freezed == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                      as int?,
            strainScore: freezed == strainScore
                ? _value.strainScore
                : strainScore // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecentWorkoutInfoImplCopyWith<$Res>
    implements $RecentWorkoutInfoCopyWith<$Res> {
  factory _$$RecentWorkoutInfoImplCopyWith(
    _$RecentWorkoutInfoImpl value,
    $Res Function(_$RecentWorkoutInfoImpl) then,
  ) = __$$RecentWorkoutInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    String type,
    int durationMinutes,
    int? intensity,
    double? strainScore,
  });
}

/// @nodoc
class __$$RecentWorkoutInfoImplCopyWithImpl<$Res>
    extends _$RecentWorkoutInfoCopyWithImpl<$Res, _$RecentWorkoutInfoImpl>
    implements _$$RecentWorkoutInfoImplCopyWith<$Res> {
  __$$RecentWorkoutInfoImplCopyWithImpl(
    _$RecentWorkoutInfoImpl _value,
    $Res Function(_$RecentWorkoutInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecentWorkoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? durationMinutes = null,
    Object? intensity = freezed,
    Object? strainScore = freezed,
  }) {
    return _then(
      _$RecentWorkoutInfoImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        durationMinutes: null == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        intensity: freezed == intensity
            ? _value.intensity
            : intensity // ignore: cast_nullable_to_non_nullable
                  as int?,
        strainScore: freezed == strainScore
            ? _value.strainScore
            : strainScore // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentWorkoutInfoImpl implements _RecentWorkoutInfo {
  const _$RecentWorkoutInfoImpl({
    required this.date,
    required this.type,
    required this.durationMinutes,
    this.intensity,
    this.strainScore,
  });

  factory _$RecentWorkoutInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentWorkoutInfoImplFromJson(json);

  @override
  final DateTime date;
  @override
  final String type;
  @override
  final int durationMinutes;
  @override
  final int? intensity;
  @override
  final double? strainScore;

  @override
  String toString() {
    return 'RecentWorkoutInfo(date: $date, type: $type, durationMinutes: $durationMinutes, intensity: $intensity, strainScore: $strainScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentWorkoutInfoImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.strainScore, strainScore) ||
                other.strainScore == strainScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    type,
    durationMinutes,
    intensity,
    strainScore,
  );

  /// Create a copy of RecentWorkoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentWorkoutInfoImplCopyWith<_$RecentWorkoutInfoImpl> get copyWith =>
      __$$RecentWorkoutInfoImplCopyWithImpl<_$RecentWorkoutInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentWorkoutInfoImplToJson(this);
  }
}

abstract class _RecentWorkoutInfo implements RecentWorkoutInfo {
  const factory _RecentWorkoutInfo({
    required final DateTime date,
    required final String type,
    required final int durationMinutes,
    final int? intensity,
    final double? strainScore,
  }) = _$RecentWorkoutInfoImpl;

  factory _RecentWorkoutInfo.fromJson(Map<String, dynamic> json) =
      _$RecentWorkoutInfoImpl.fromJson;

  @override
  DateTime get date;
  @override
  String get type;
  @override
  int get durationMinutes;
  @override
  int? get intensity;
  @override
  double? get strainScore;

  /// Create a copy of RecentWorkoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentWorkoutInfoImplCopyWith<_$RecentWorkoutInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
