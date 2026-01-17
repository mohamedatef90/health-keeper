// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_prediction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HealthPrediction _$HealthPredictionFromJson(Map<String, dynamic> json) {
  return _HealthPrediction.fromJson(json);
}

/// @nodoc
mixin _$HealthPrediction {
  String get id => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  HealthStatus get overallStatus => throw _privateConstructorUsedError;
  int get overallScore => throw _privateConstructorUsedError; // 0-100
  int get confidence => throw _privateConstructorUsedError; // 0-100
  IllnessRisk get illnessRisk => throw _privateConstructorUsedError;
  OvertrainingRisk get overtrainingRisk => throw _privateConstructorUsedError;
  SleepDebtAssessment get sleepDebt => throw _privateConstructorUsedError;
  List<RiskFactor> get riskFactors => throw _privateConstructorUsedError;
  List<HealthRecommendation> get recommendations =>
      throw _privateConstructorUsedError;
  List<String> get positiveIndicators => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get disclaimer => throw _privateConstructorUsedError;

  /// Serializes this HealthPrediction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthPredictionCopyWith<HealthPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthPredictionCopyWith<$Res> {
  factory $HealthPredictionCopyWith(
    HealthPrediction value,
    $Res Function(HealthPrediction) then,
  ) = _$HealthPredictionCopyWithImpl<$Res, HealthPrediction>;
  @useResult
  $Res call({
    String id,
    DateTime generatedAt,
    HealthStatus overallStatus,
    int overallScore,
    int confidence,
    IllnessRisk illnessRisk,
    OvertrainingRisk overtrainingRisk,
    SleepDebtAssessment sleepDebt,
    List<RiskFactor> riskFactors,
    List<HealthRecommendation> recommendations,
    List<String> positiveIndicators,
    String summary,
    String disclaimer,
  });

  $IllnessRiskCopyWith<$Res> get illnessRisk;
  $OvertrainingRiskCopyWith<$Res> get overtrainingRisk;
  $SleepDebtAssessmentCopyWith<$Res> get sleepDebt;
}

/// @nodoc
class _$HealthPredictionCopyWithImpl<$Res, $Val extends HealthPrediction>
    implements $HealthPredictionCopyWith<$Res> {
  _$HealthPredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? generatedAt = null,
    Object? overallStatus = null,
    Object? overallScore = null,
    Object? confidence = null,
    Object? illnessRisk = null,
    Object? overtrainingRisk = null,
    Object? sleepDebt = null,
    Object? riskFactors = null,
    Object? recommendations = null,
    Object? positiveIndicators = null,
    Object? summary = null,
    Object? disclaimer = null,
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
            overallStatus: null == overallStatus
                ? _value.overallStatus
                : overallStatus // ignore: cast_nullable_to_non_nullable
                      as HealthStatus,
            overallScore: null == overallScore
                ? _value.overallScore
                : overallScore // ignore: cast_nullable_to_non_nullable
                      as int,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            illnessRisk: null == illnessRisk
                ? _value.illnessRisk
                : illnessRisk // ignore: cast_nullable_to_non_nullable
                      as IllnessRisk,
            overtrainingRisk: null == overtrainingRisk
                ? _value.overtrainingRisk
                : overtrainingRisk // ignore: cast_nullable_to_non_nullable
                      as OvertrainingRisk,
            sleepDebt: null == sleepDebt
                ? _value.sleepDebt
                : sleepDebt // ignore: cast_nullable_to_non_nullable
                      as SleepDebtAssessment,
            riskFactors: null == riskFactors
                ? _value.riskFactors
                : riskFactors // ignore: cast_nullable_to_non_nullable
                      as List<RiskFactor>,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<HealthRecommendation>,
            positiveIndicators: null == positiveIndicators
                ? _value.positiveIndicators
                : positiveIndicators // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
            disclaimer: null == disclaimer
                ? _value.disclaimer
                : disclaimer // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of HealthPrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IllnessRiskCopyWith<$Res> get illnessRisk {
    return $IllnessRiskCopyWith<$Res>(_value.illnessRisk, (value) {
      return _then(_value.copyWith(illnessRisk: value) as $Val);
    });
  }

  /// Create a copy of HealthPrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OvertrainingRiskCopyWith<$Res> get overtrainingRisk {
    return $OvertrainingRiskCopyWith<$Res>(_value.overtrainingRisk, (value) {
      return _then(_value.copyWith(overtrainingRisk: value) as $Val);
    });
  }

  /// Create a copy of HealthPrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepDebtAssessmentCopyWith<$Res> get sleepDebt {
    return $SleepDebtAssessmentCopyWith<$Res>(_value.sleepDebt, (value) {
      return _then(_value.copyWith(sleepDebt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HealthPredictionImplCopyWith<$Res>
    implements $HealthPredictionCopyWith<$Res> {
  factory _$$HealthPredictionImplCopyWith(
    _$HealthPredictionImpl value,
    $Res Function(_$HealthPredictionImpl) then,
  ) = __$$HealthPredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime generatedAt,
    HealthStatus overallStatus,
    int overallScore,
    int confidence,
    IllnessRisk illnessRisk,
    OvertrainingRisk overtrainingRisk,
    SleepDebtAssessment sleepDebt,
    List<RiskFactor> riskFactors,
    List<HealthRecommendation> recommendations,
    List<String> positiveIndicators,
    String summary,
    String disclaimer,
  });

  @override
  $IllnessRiskCopyWith<$Res> get illnessRisk;
  @override
  $OvertrainingRiskCopyWith<$Res> get overtrainingRisk;
  @override
  $SleepDebtAssessmentCopyWith<$Res> get sleepDebt;
}

/// @nodoc
class __$$HealthPredictionImplCopyWithImpl<$Res>
    extends _$HealthPredictionCopyWithImpl<$Res, _$HealthPredictionImpl>
    implements _$$HealthPredictionImplCopyWith<$Res> {
  __$$HealthPredictionImplCopyWithImpl(
    _$HealthPredictionImpl _value,
    $Res Function(_$HealthPredictionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? generatedAt = null,
    Object? overallStatus = null,
    Object? overallScore = null,
    Object? confidence = null,
    Object? illnessRisk = null,
    Object? overtrainingRisk = null,
    Object? sleepDebt = null,
    Object? riskFactors = null,
    Object? recommendations = null,
    Object? positiveIndicators = null,
    Object? summary = null,
    Object? disclaimer = null,
  }) {
    return _then(
      _$HealthPredictionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        overallStatus: null == overallStatus
            ? _value.overallStatus
            : overallStatus // ignore: cast_nullable_to_non_nullable
                  as HealthStatus,
        overallScore: null == overallScore
            ? _value.overallScore
            : overallScore // ignore: cast_nullable_to_non_nullable
                  as int,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        illnessRisk: null == illnessRisk
            ? _value.illnessRisk
            : illnessRisk // ignore: cast_nullable_to_non_nullable
                  as IllnessRisk,
        overtrainingRisk: null == overtrainingRisk
            ? _value.overtrainingRisk
            : overtrainingRisk // ignore: cast_nullable_to_non_nullable
                  as OvertrainingRisk,
        sleepDebt: null == sleepDebt
            ? _value.sleepDebt
            : sleepDebt // ignore: cast_nullable_to_non_nullable
                  as SleepDebtAssessment,
        riskFactors: null == riskFactors
            ? _value._riskFactors
            : riskFactors // ignore: cast_nullable_to_non_nullable
                  as List<RiskFactor>,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<HealthRecommendation>,
        positiveIndicators: null == positiveIndicators
            ? _value._positiveIndicators
            : positiveIndicators // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
        disclaimer: null == disclaimer
            ? _value.disclaimer
            : disclaimer // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthPredictionImpl implements _HealthPrediction {
  const _$HealthPredictionImpl({
    required this.id,
    required this.generatedAt,
    required this.overallStatus,
    required this.overallScore,
    required this.confidence,
    required this.illnessRisk,
    required this.overtrainingRisk,
    required this.sleepDebt,
    final List<RiskFactor> riskFactors = const [],
    final List<HealthRecommendation> recommendations = const [],
    final List<String> positiveIndicators = const [],
    required this.summary,
    required this.disclaimer,
  }) : _riskFactors = riskFactors,
       _recommendations = recommendations,
       _positiveIndicators = positiveIndicators;

  factory _$HealthPredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthPredictionImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime generatedAt;
  @override
  final HealthStatus overallStatus;
  @override
  final int overallScore;
  // 0-100
  @override
  final int confidence;
  // 0-100
  @override
  final IllnessRisk illnessRisk;
  @override
  final OvertrainingRisk overtrainingRisk;
  @override
  final SleepDebtAssessment sleepDebt;
  final List<RiskFactor> _riskFactors;
  @override
  @JsonKey()
  List<RiskFactor> get riskFactors {
    if (_riskFactors is EqualUnmodifiableListView) return _riskFactors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_riskFactors);
  }

  final List<HealthRecommendation> _recommendations;
  @override
  @JsonKey()
  List<HealthRecommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  final List<String> _positiveIndicators;
  @override
  @JsonKey()
  List<String> get positiveIndicators {
    if (_positiveIndicators is EqualUnmodifiableListView)
      return _positiveIndicators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positiveIndicators);
  }

  @override
  final String summary;
  @override
  final String disclaimer;

  @override
  String toString() {
    return 'HealthPrediction(id: $id, generatedAt: $generatedAt, overallStatus: $overallStatus, overallScore: $overallScore, confidence: $confidence, illnessRisk: $illnessRisk, overtrainingRisk: $overtrainingRisk, sleepDebt: $sleepDebt, riskFactors: $riskFactors, recommendations: $recommendations, positiveIndicators: $positiveIndicators, summary: $summary, disclaimer: $disclaimer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthPredictionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.overallStatus, overallStatus) ||
                other.overallStatus == overallStatus) &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.illnessRisk, illnessRisk) ||
                other.illnessRisk == illnessRisk) &&
            (identical(other.overtrainingRisk, overtrainingRisk) ||
                other.overtrainingRisk == overtrainingRisk) &&
            (identical(other.sleepDebt, sleepDebt) ||
                other.sleepDebt == sleepDebt) &&
            const DeepCollectionEquality().equals(
              other._riskFactors,
              _riskFactors,
            ) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            const DeepCollectionEquality().equals(
              other._positiveIndicators,
              _positiveIndicators,
            ) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.disclaimer, disclaimer) ||
                other.disclaimer == disclaimer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    generatedAt,
    overallStatus,
    overallScore,
    confidence,
    illnessRisk,
    overtrainingRisk,
    sleepDebt,
    const DeepCollectionEquality().hash(_riskFactors),
    const DeepCollectionEquality().hash(_recommendations),
    const DeepCollectionEquality().hash(_positiveIndicators),
    summary,
    disclaimer,
  );

  /// Create a copy of HealthPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthPredictionImplCopyWith<_$HealthPredictionImpl> get copyWith =>
      __$$HealthPredictionImplCopyWithImpl<_$HealthPredictionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthPredictionImplToJson(this);
  }
}

abstract class _HealthPrediction implements HealthPrediction {
  const factory _HealthPrediction({
    required final String id,
    required final DateTime generatedAt,
    required final HealthStatus overallStatus,
    required final int overallScore,
    required final int confidence,
    required final IllnessRisk illnessRisk,
    required final OvertrainingRisk overtrainingRisk,
    required final SleepDebtAssessment sleepDebt,
    final List<RiskFactor> riskFactors,
    final List<HealthRecommendation> recommendations,
    final List<String> positiveIndicators,
    required final String summary,
    required final String disclaimer,
  }) = _$HealthPredictionImpl;

  factory _HealthPrediction.fromJson(Map<String, dynamic> json) =
      _$HealthPredictionImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get generatedAt;
  @override
  HealthStatus get overallStatus;
  @override
  int get overallScore; // 0-100
  @override
  int get confidence; // 0-100
  @override
  IllnessRisk get illnessRisk;
  @override
  OvertrainingRisk get overtrainingRisk;
  @override
  SleepDebtAssessment get sleepDebt;
  @override
  List<RiskFactor> get riskFactors;
  @override
  List<HealthRecommendation> get recommendations;
  @override
  List<String> get positiveIndicators;
  @override
  String get summary;
  @override
  String get disclaimer;

  /// Create a copy of HealthPrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthPredictionImplCopyWith<_$HealthPredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IllnessRisk _$IllnessRiskFromJson(Map<String, dynamic> json) {
  return _IllnessRisk.fromJson(json);
}

/// @nodoc
mixin _$IllnessRisk {
  int get probability => throw _privateConstructorUsedError; // 0-100
  IllnessRiskLevel get riskLevel => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError; // 0-100
  List<ContributingFactor> get contributingFactors =>
      throw _privateConstructorUsedError;
  List<PreventiveAction> get preventiveActions =>
      throw _privateConstructorUsedError;
  List<String> get symptoms => throw _privateConstructorUsedError;
  String? get timeframe =>
      throw _privateConstructorUsedError; // e.g., "next 24-48 hours"
  String get explanation => throw _privateConstructorUsedError;
  bool get shouldConsultDoctor => throw _privateConstructorUsedError;

  /// Serializes this IllnessRisk to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IllnessRisk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IllnessRiskCopyWith<IllnessRisk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IllnessRiskCopyWith<$Res> {
  factory $IllnessRiskCopyWith(
    IllnessRisk value,
    $Res Function(IllnessRisk) then,
  ) = _$IllnessRiskCopyWithImpl<$Res, IllnessRisk>;
  @useResult
  $Res call({
    int probability,
    IllnessRiskLevel riskLevel,
    int confidence,
    List<ContributingFactor> contributingFactors,
    List<PreventiveAction> preventiveActions,
    List<String> symptoms,
    String? timeframe,
    String explanation,
    bool shouldConsultDoctor,
  });
}

/// @nodoc
class _$IllnessRiskCopyWithImpl<$Res, $Val extends IllnessRisk>
    implements $IllnessRiskCopyWith<$Res> {
  _$IllnessRiskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IllnessRisk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? probability = null,
    Object? riskLevel = null,
    Object? confidence = null,
    Object? contributingFactors = null,
    Object? preventiveActions = null,
    Object? symptoms = null,
    Object? timeframe = freezed,
    Object? explanation = null,
    Object? shouldConsultDoctor = null,
  }) {
    return _then(
      _value.copyWith(
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as int,
            riskLevel: null == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as IllnessRiskLevel,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            contributingFactors: null == contributingFactors
                ? _value.contributingFactors
                : contributingFactors // ignore: cast_nullable_to_non_nullable
                      as List<ContributingFactor>,
            preventiveActions: null == preventiveActions
                ? _value.preventiveActions
                : preventiveActions // ignore: cast_nullable_to_non_nullable
                      as List<PreventiveAction>,
            symptoms: null == symptoms
                ? _value.symptoms
                : symptoms // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            timeframe: freezed == timeframe
                ? _value.timeframe
                : timeframe // ignore: cast_nullable_to_non_nullable
                      as String?,
            explanation: null == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String,
            shouldConsultDoctor: null == shouldConsultDoctor
                ? _value.shouldConsultDoctor
                : shouldConsultDoctor // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IllnessRiskImplCopyWith<$Res>
    implements $IllnessRiskCopyWith<$Res> {
  factory _$$IllnessRiskImplCopyWith(
    _$IllnessRiskImpl value,
    $Res Function(_$IllnessRiskImpl) then,
  ) = __$$IllnessRiskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int probability,
    IllnessRiskLevel riskLevel,
    int confidence,
    List<ContributingFactor> contributingFactors,
    List<PreventiveAction> preventiveActions,
    List<String> symptoms,
    String? timeframe,
    String explanation,
    bool shouldConsultDoctor,
  });
}

/// @nodoc
class __$$IllnessRiskImplCopyWithImpl<$Res>
    extends _$IllnessRiskCopyWithImpl<$Res, _$IllnessRiskImpl>
    implements _$$IllnessRiskImplCopyWith<$Res> {
  __$$IllnessRiskImplCopyWithImpl(
    _$IllnessRiskImpl _value,
    $Res Function(_$IllnessRiskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IllnessRisk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? probability = null,
    Object? riskLevel = null,
    Object? confidence = null,
    Object? contributingFactors = null,
    Object? preventiveActions = null,
    Object? symptoms = null,
    Object? timeframe = freezed,
    Object? explanation = null,
    Object? shouldConsultDoctor = null,
  }) {
    return _then(
      _$IllnessRiskImpl(
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as int,
        riskLevel: null == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as IllnessRiskLevel,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        contributingFactors: null == contributingFactors
            ? _value._contributingFactors
            : contributingFactors // ignore: cast_nullable_to_non_nullable
                  as List<ContributingFactor>,
        preventiveActions: null == preventiveActions
            ? _value._preventiveActions
            : preventiveActions // ignore: cast_nullable_to_non_nullable
                  as List<PreventiveAction>,
        symptoms: null == symptoms
            ? _value._symptoms
            : symptoms // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        timeframe: freezed == timeframe
            ? _value.timeframe
            : timeframe // ignore: cast_nullable_to_non_nullable
                  as String?,
        explanation: null == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String,
        shouldConsultDoctor: null == shouldConsultDoctor
            ? _value.shouldConsultDoctor
            : shouldConsultDoctor // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IllnessRiskImpl implements _IllnessRisk {
  const _$IllnessRiskImpl({
    required this.probability,
    required this.riskLevel,
    required this.confidence,
    final List<ContributingFactor> contributingFactors = const [],
    final List<PreventiveAction> preventiveActions = const [],
    final List<String> symptoms = const [],
    this.timeframe,
    required this.explanation,
    required this.shouldConsultDoctor,
  }) : _contributingFactors = contributingFactors,
       _preventiveActions = preventiveActions,
       _symptoms = symptoms;

  factory _$IllnessRiskImpl.fromJson(Map<String, dynamic> json) =>
      _$$IllnessRiskImplFromJson(json);

  @override
  final int probability;
  // 0-100
  @override
  final IllnessRiskLevel riskLevel;
  @override
  final int confidence;
  // 0-100
  final List<ContributingFactor> _contributingFactors;
  // 0-100
  @override
  @JsonKey()
  List<ContributingFactor> get contributingFactors {
    if (_contributingFactors is EqualUnmodifiableListView)
      return _contributingFactors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contributingFactors);
  }

  final List<PreventiveAction> _preventiveActions;
  @override
  @JsonKey()
  List<PreventiveAction> get preventiveActions {
    if (_preventiveActions is EqualUnmodifiableListView)
      return _preventiveActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preventiveActions);
  }

  final List<String> _symptoms;
  @override
  @JsonKey()
  List<String> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  @override
  final String? timeframe;
  // e.g., "next 24-48 hours"
  @override
  final String explanation;
  @override
  final bool shouldConsultDoctor;

  @override
  String toString() {
    return 'IllnessRisk(probability: $probability, riskLevel: $riskLevel, confidence: $confidence, contributingFactors: $contributingFactors, preventiveActions: $preventiveActions, symptoms: $symptoms, timeframe: $timeframe, explanation: $explanation, shouldConsultDoctor: $shouldConsultDoctor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IllnessRiskImpl &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(
              other._contributingFactors,
              _contributingFactors,
            ) &&
            const DeepCollectionEquality().equals(
              other._preventiveActions,
              _preventiveActions,
            ) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms) &&
            (identical(other.timeframe, timeframe) ||
                other.timeframe == timeframe) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.shouldConsultDoctor, shouldConsultDoctor) ||
                other.shouldConsultDoctor == shouldConsultDoctor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    probability,
    riskLevel,
    confidence,
    const DeepCollectionEquality().hash(_contributingFactors),
    const DeepCollectionEquality().hash(_preventiveActions),
    const DeepCollectionEquality().hash(_symptoms),
    timeframe,
    explanation,
    shouldConsultDoctor,
  );

  /// Create a copy of IllnessRisk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IllnessRiskImplCopyWith<_$IllnessRiskImpl> get copyWith =>
      __$$IllnessRiskImplCopyWithImpl<_$IllnessRiskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IllnessRiskImplToJson(this);
  }
}

abstract class _IllnessRisk implements IllnessRisk {
  const factory _IllnessRisk({
    required final int probability,
    required final IllnessRiskLevel riskLevel,
    required final int confidence,
    final List<ContributingFactor> contributingFactors,
    final List<PreventiveAction> preventiveActions,
    final List<String> symptoms,
    final String? timeframe,
    required final String explanation,
    required final bool shouldConsultDoctor,
  }) = _$IllnessRiskImpl;

  factory _IllnessRisk.fromJson(Map<String, dynamic> json) =
      _$IllnessRiskImpl.fromJson;

  @override
  int get probability; // 0-100
  @override
  IllnessRiskLevel get riskLevel;
  @override
  int get confidence; // 0-100
  @override
  List<ContributingFactor> get contributingFactors;
  @override
  List<PreventiveAction> get preventiveActions;
  @override
  List<String> get symptoms;
  @override
  String? get timeframe; // e.g., "next 24-48 hours"
  @override
  String get explanation;
  @override
  bool get shouldConsultDoctor;

  /// Create a copy of IllnessRisk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IllnessRiskImplCopyWith<_$IllnessRiskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContributingFactor _$ContributingFactorFromJson(Map<String, dynamic> json) {
  return _ContributingFactor.fromJson(json);
}

/// @nodoc
mixin _$ContributingFactor {
  String get factor => throw _privateConstructorUsedError;
  String get observation =>
      throw _privateConstructorUsedError; // What was observed
  String get normalRange =>
      throw _privateConstructorUsedError; // What is considered normal
  int get impactScore =>
      throw _privateConstructorUsedError; // 0-100, how much this contributes to risk
  FactorTrend get trend => throw _privateConstructorUsedError;

  /// Serializes this ContributingFactor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContributingFactor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContributingFactorCopyWith<ContributingFactor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributingFactorCopyWith<$Res> {
  factory $ContributingFactorCopyWith(
    ContributingFactor value,
    $Res Function(ContributingFactor) then,
  ) = _$ContributingFactorCopyWithImpl<$Res, ContributingFactor>;
  @useResult
  $Res call({
    String factor,
    String observation,
    String normalRange,
    int impactScore,
    FactorTrend trend,
  });
}

/// @nodoc
class _$ContributingFactorCopyWithImpl<$Res, $Val extends ContributingFactor>
    implements $ContributingFactorCopyWith<$Res> {
  _$ContributingFactorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContributingFactor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? factor = null,
    Object? observation = null,
    Object? normalRange = null,
    Object? impactScore = null,
    Object? trend = null,
  }) {
    return _then(
      _value.copyWith(
            factor: null == factor
                ? _value.factor
                : factor // ignore: cast_nullable_to_non_nullable
                      as String,
            observation: null == observation
                ? _value.observation
                : observation // ignore: cast_nullable_to_non_nullable
                      as String,
            normalRange: null == normalRange
                ? _value.normalRange
                : normalRange // ignore: cast_nullable_to_non_nullable
                      as String,
            impactScore: null == impactScore
                ? _value.impactScore
                : impactScore // ignore: cast_nullable_to_non_nullable
                      as int,
            trend: null == trend
                ? _value.trend
                : trend // ignore: cast_nullable_to_non_nullable
                      as FactorTrend,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContributingFactorImplCopyWith<$Res>
    implements $ContributingFactorCopyWith<$Res> {
  factory _$$ContributingFactorImplCopyWith(
    _$ContributingFactorImpl value,
    $Res Function(_$ContributingFactorImpl) then,
  ) = __$$ContributingFactorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String factor,
    String observation,
    String normalRange,
    int impactScore,
    FactorTrend trend,
  });
}

/// @nodoc
class __$$ContributingFactorImplCopyWithImpl<$Res>
    extends _$ContributingFactorCopyWithImpl<$Res, _$ContributingFactorImpl>
    implements _$$ContributingFactorImplCopyWith<$Res> {
  __$$ContributingFactorImplCopyWithImpl(
    _$ContributingFactorImpl _value,
    $Res Function(_$ContributingFactorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContributingFactor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? factor = null,
    Object? observation = null,
    Object? normalRange = null,
    Object? impactScore = null,
    Object? trend = null,
  }) {
    return _then(
      _$ContributingFactorImpl(
        factor: null == factor
            ? _value.factor
            : factor // ignore: cast_nullable_to_non_nullable
                  as String,
        observation: null == observation
            ? _value.observation
            : observation // ignore: cast_nullable_to_non_nullable
                  as String,
        normalRange: null == normalRange
            ? _value.normalRange
            : normalRange // ignore: cast_nullable_to_non_nullable
                  as String,
        impactScore: null == impactScore
            ? _value.impactScore
            : impactScore // ignore: cast_nullable_to_non_nullable
                  as int,
        trend: null == trend
            ? _value.trend
            : trend // ignore: cast_nullable_to_non_nullable
                  as FactorTrend,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContributingFactorImpl implements _ContributingFactor {
  const _$ContributingFactorImpl({
    required this.factor,
    required this.observation,
    required this.normalRange,
    required this.impactScore,
    required this.trend,
  });

  factory _$ContributingFactorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContributingFactorImplFromJson(json);

  @override
  final String factor;
  @override
  final String observation;
  // What was observed
  @override
  final String normalRange;
  // What is considered normal
  @override
  final int impactScore;
  // 0-100, how much this contributes to risk
  @override
  final FactorTrend trend;

  @override
  String toString() {
    return 'ContributingFactor(factor: $factor, observation: $observation, normalRange: $normalRange, impactScore: $impactScore, trend: $trend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributingFactorImpl &&
            (identical(other.factor, factor) || other.factor == factor) &&
            (identical(other.observation, observation) ||
                other.observation == observation) &&
            (identical(other.normalRange, normalRange) ||
                other.normalRange == normalRange) &&
            (identical(other.impactScore, impactScore) ||
                other.impactScore == impactScore) &&
            (identical(other.trend, trend) || other.trend == trend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    factor,
    observation,
    normalRange,
    impactScore,
    trend,
  );

  /// Create a copy of ContributingFactor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributingFactorImplCopyWith<_$ContributingFactorImpl> get copyWith =>
      __$$ContributingFactorImplCopyWithImpl<_$ContributingFactorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ContributingFactorImplToJson(this);
  }
}

abstract class _ContributingFactor implements ContributingFactor {
  const factory _ContributingFactor({
    required final String factor,
    required final String observation,
    required final String normalRange,
    required final int impactScore,
    required final FactorTrend trend,
  }) = _$ContributingFactorImpl;

  factory _ContributingFactor.fromJson(Map<String, dynamic> json) =
      _$ContributingFactorImpl.fromJson;

  @override
  String get factor;
  @override
  String get observation; // What was observed
  @override
  String get normalRange; // What is considered normal
  @override
  int get impactScore; // 0-100, how much this contributes to risk
  @override
  FactorTrend get trend;

  /// Create a copy of ContributingFactor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContributingFactorImplCopyWith<_$ContributingFactorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreventiveAction _$PreventiveActionFromJson(Map<String, dynamic> json) {
  return _PreventiveAction.fromJson(json);
}

/// @nodoc
mixin _$PreventiveAction {
  String get action => throw _privateConstructorUsedError;
  String get rationale => throw _privateConstructorUsedError;
  ActionPriority get priority => throw _privateConstructorUsedError;
  ActionCategory get category => throw _privateConstructorUsedError;

  /// Serializes this PreventiveAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreventiveAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreventiveActionCopyWith<PreventiveAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreventiveActionCopyWith<$Res> {
  factory $PreventiveActionCopyWith(
    PreventiveAction value,
    $Res Function(PreventiveAction) then,
  ) = _$PreventiveActionCopyWithImpl<$Res, PreventiveAction>;
  @useResult
  $Res call({
    String action,
    String rationale,
    ActionPriority priority,
    ActionCategory category,
  });
}

/// @nodoc
class _$PreventiveActionCopyWithImpl<$Res, $Val extends PreventiveAction>
    implements $PreventiveActionCopyWith<$Res> {
  _$PreventiveActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreventiveAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? rationale = null,
    Object? priority = null,
    Object? category = null,
  }) {
    return _then(
      _value.copyWith(
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            rationale: null == rationale
                ? _value.rationale
                : rationale // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as ActionPriority,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as ActionCategory,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PreventiveActionImplCopyWith<$Res>
    implements $PreventiveActionCopyWith<$Res> {
  factory _$$PreventiveActionImplCopyWith(
    _$PreventiveActionImpl value,
    $Res Function(_$PreventiveActionImpl) then,
  ) = __$$PreventiveActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String action,
    String rationale,
    ActionPriority priority,
    ActionCategory category,
  });
}

/// @nodoc
class __$$PreventiveActionImplCopyWithImpl<$Res>
    extends _$PreventiveActionCopyWithImpl<$Res, _$PreventiveActionImpl>
    implements _$$PreventiveActionImplCopyWith<$Res> {
  __$$PreventiveActionImplCopyWithImpl(
    _$PreventiveActionImpl _value,
    $Res Function(_$PreventiveActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreventiveAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? rationale = null,
    Object? priority = null,
    Object? category = null,
  }) {
    return _then(
      _$PreventiveActionImpl(
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        rationale: null == rationale
            ? _value.rationale
            : rationale // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as ActionPriority,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as ActionCategory,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreventiveActionImpl implements _PreventiveAction {
  const _$PreventiveActionImpl({
    required this.action,
    required this.rationale,
    required this.priority,
    required this.category,
  });

  factory _$PreventiveActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreventiveActionImplFromJson(json);

  @override
  final String action;
  @override
  final String rationale;
  @override
  final ActionPriority priority;
  @override
  final ActionCategory category;

  @override
  String toString() {
    return 'PreventiveAction(action: $action, rationale: $rationale, priority: $priority, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreventiveActionImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.rationale, rationale) ||
                other.rationale == rationale) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, action, rationale, priority, category);

  /// Create a copy of PreventiveAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreventiveActionImplCopyWith<_$PreventiveActionImpl> get copyWith =>
      __$$PreventiveActionImplCopyWithImpl<_$PreventiveActionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PreventiveActionImplToJson(this);
  }
}

abstract class _PreventiveAction implements PreventiveAction {
  const factory _PreventiveAction({
    required final String action,
    required final String rationale,
    required final ActionPriority priority,
    required final ActionCategory category,
  }) = _$PreventiveActionImpl;

  factory _PreventiveAction.fromJson(Map<String, dynamic> json) =
      _$PreventiveActionImpl.fromJson;

  @override
  String get action;
  @override
  String get rationale;
  @override
  ActionPriority get priority;
  @override
  ActionCategory get category;

  /// Create a copy of PreventiveAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreventiveActionImplCopyWith<_$PreventiveActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OvertrainingRisk _$OvertrainingRiskFromJson(Map<String, dynamic> json) {
  return _OvertrainingRisk.fromJson(json);
}

/// @nodoc
mixin _$OvertrainingRisk {
  int get riskScore => throw _privateConstructorUsedError; // 0-100
  OvertrainingLevel get riskLevel => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError; // 0-100
  StrainTrend get strainTrend => throw _privateConstructorUsedError;
  RecoveryTrend get recoveryTrend => throw _privateConstructorUsedError;
  double get strainRecoveryBalance =>
      throw _privateConstructorUsedError; // Ratio, <1 means under-recovered
  List<String> get warningSignals => throw _privateConstructorUsedError;
  List<String> get recommendations => throw _privateConstructorUsedError;
  int get daysToRecovery =>
      throw _privateConstructorUsedError; // Estimated days needed to recover
  String get explanation => throw _privateConstructorUsedError;

  /// Serializes this OvertrainingRisk to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OvertrainingRisk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OvertrainingRiskCopyWith<OvertrainingRisk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertrainingRiskCopyWith<$Res> {
  factory $OvertrainingRiskCopyWith(
    OvertrainingRisk value,
    $Res Function(OvertrainingRisk) then,
  ) = _$OvertrainingRiskCopyWithImpl<$Res, OvertrainingRisk>;
  @useResult
  $Res call({
    int riskScore,
    OvertrainingLevel riskLevel,
    int confidence,
    StrainTrend strainTrend,
    RecoveryTrend recoveryTrend,
    double strainRecoveryBalance,
    List<String> warningSignals,
    List<String> recommendations,
    int daysToRecovery,
    String explanation,
  });

  $StrainTrendCopyWith<$Res> get strainTrend;
  $RecoveryTrendCopyWith<$Res> get recoveryTrend;
}

/// @nodoc
class _$OvertrainingRiskCopyWithImpl<$Res, $Val extends OvertrainingRisk>
    implements $OvertrainingRiskCopyWith<$Res> {
  _$OvertrainingRiskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OvertrainingRisk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskScore = null,
    Object? riskLevel = null,
    Object? confidence = null,
    Object? strainTrend = null,
    Object? recoveryTrend = null,
    Object? strainRecoveryBalance = null,
    Object? warningSignals = null,
    Object? recommendations = null,
    Object? daysToRecovery = null,
    Object? explanation = null,
  }) {
    return _then(
      _value.copyWith(
            riskScore: null == riskScore
                ? _value.riskScore
                : riskScore // ignore: cast_nullable_to_non_nullable
                      as int,
            riskLevel: null == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as OvertrainingLevel,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            strainTrend: null == strainTrend
                ? _value.strainTrend
                : strainTrend // ignore: cast_nullable_to_non_nullable
                      as StrainTrend,
            recoveryTrend: null == recoveryTrend
                ? _value.recoveryTrend
                : recoveryTrend // ignore: cast_nullable_to_non_nullable
                      as RecoveryTrend,
            strainRecoveryBalance: null == strainRecoveryBalance
                ? _value.strainRecoveryBalance
                : strainRecoveryBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            warningSignals: null == warningSignals
                ? _value.warningSignals
                : warningSignals // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            daysToRecovery: null == daysToRecovery
                ? _value.daysToRecovery
                : daysToRecovery // ignore: cast_nullable_to_non_nullable
                      as int,
            explanation: null == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of OvertrainingRisk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StrainTrendCopyWith<$Res> get strainTrend {
    return $StrainTrendCopyWith<$Res>(_value.strainTrend, (value) {
      return _then(_value.copyWith(strainTrend: value) as $Val);
    });
  }

  /// Create a copy of OvertrainingRisk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecoveryTrendCopyWith<$Res> get recoveryTrend {
    return $RecoveryTrendCopyWith<$Res>(_value.recoveryTrend, (value) {
      return _then(_value.copyWith(recoveryTrend: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OvertrainingRiskImplCopyWith<$Res>
    implements $OvertrainingRiskCopyWith<$Res> {
  factory _$$OvertrainingRiskImplCopyWith(
    _$OvertrainingRiskImpl value,
    $Res Function(_$OvertrainingRiskImpl) then,
  ) = __$$OvertrainingRiskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int riskScore,
    OvertrainingLevel riskLevel,
    int confidence,
    StrainTrend strainTrend,
    RecoveryTrend recoveryTrend,
    double strainRecoveryBalance,
    List<String> warningSignals,
    List<String> recommendations,
    int daysToRecovery,
    String explanation,
  });

  @override
  $StrainTrendCopyWith<$Res> get strainTrend;
  @override
  $RecoveryTrendCopyWith<$Res> get recoveryTrend;
}

/// @nodoc
class __$$OvertrainingRiskImplCopyWithImpl<$Res>
    extends _$OvertrainingRiskCopyWithImpl<$Res, _$OvertrainingRiskImpl>
    implements _$$OvertrainingRiskImplCopyWith<$Res> {
  __$$OvertrainingRiskImplCopyWithImpl(
    _$OvertrainingRiskImpl _value,
    $Res Function(_$OvertrainingRiskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OvertrainingRisk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskScore = null,
    Object? riskLevel = null,
    Object? confidence = null,
    Object? strainTrend = null,
    Object? recoveryTrend = null,
    Object? strainRecoveryBalance = null,
    Object? warningSignals = null,
    Object? recommendations = null,
    Object? daysToRecovery = null,
    Object? explanation = null,
  }) {
    return _then(
      _$OvertrainingRiskImpl(
        riskScore: null == riskScore
            ? _value.riskScore
            : riskScore // ignore: cast_nullable_to_non_nullable
                  as int,
        riskLevel: null == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as OvertrainingLevel,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        strainTrend: null == strainTrend
            ? _value.strainTrend
            : strainTrend // ignore: cast_nullable_to_non_nullable
                  as StrainTrend,
        recoveryTrend: null == recoveryTrend
            ? _value.recoveryTrend
            : recoveryTrend // ignore: cast_nullable_to_non_nullable
                  as RecoveryTrend,
        strainRecoveryBalance: null == strainRecoveryBalance
            ? _value.strainRecoveryBalance
            : strainRecoveryBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        warningSignals: null == warningSignals
            ? _value._warningSignals
            : warningSignals // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        daysToRecovery: null == daysToRecovery
            ? _value.daysToRecovery
            : daysToRecovery // ignore: cast_nullable_to_non_nullable
                  as int,
        explanation: null == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OvertrainingRiskImpl implements _OvertrainingRisk {
  const _$OvertrainingRiskImpl({
    required this.riskScore,
    required this.riskLevel,
    required this.confidence,
    required this.strainTrend,
    required this.recoveryTrend,
    required this.strainRecoveryBalance,
    final List<String> warningSignals = const [],
    final List<String> recommendations = const [],
    required this.daysToRecovery,
    required this.explanation,
  }) : _warningSignals = warningSignals,
       _recommendations = recommendations;

  factory _$OvertrainingRiskImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertrainingRiskImplFromJson(json);

  @override
  final int riskScore;
  // 0-100
  @override
  final OvertrainingLevel riskLevel;
  @override
  final int confidence;
  // 0-100
  @override
  final StrainTrend strainTrend;
  @override
  final RecoveryTrend recoveryTrend;
  @override
  final double strainRecoveryBalance;
  // Ratio, <1 means under-recovered
  final List<String> _warningSignals;
  // Ratio, <1 means under-recovered
  @override
  @JsonKey()
  List<String> get warningSignals {
    if (_warningSignals is EqualUnmodifiableListView) return _warningSignals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warningSignals);
  }

  final List<String> _recommendations;
  @override
  @JsonKey()
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  final int daysToRecovery;
  // Estimated days needed to recover
  @override
  final String explanation;

  @override
  String toString() {
    return 'OvertrainingRisk(riskScore: $riskScore, riskLevel: $riskLevel, confidence: $confidence, strainTrend: $strainTrend, recoveryTrend: $recoveryTrend, strainRecoveryBalance: $strainRecoveryBalance, warningSignals: $warningSignals, recommendations: $recommendations, daysToRecovery: $daysToRecovery, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertrainingRiskImpl &&
            (identical(other.riskScore, riskScore) ||
                other.riskScore == riskScore) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.strainTrend, strainTrend) ||
                other.strainTrend == strainTrend) &&
            (identical(other.recoveryTrend, recoveryTrend) ||
                other.recoveryTrend == recoveryTrend) &&
            (identical(other.strainRecoveryBalance, strainRecoveryBalance) ||
                other.strainRecoveryBalance == strainRecoveryBalance) &&
            const DeepCollectionEquality().equals(
              other._warningSignals,
              _warningSignals,
            ) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.daysToRecovery, daysToRecovery) ||
                other.daysToRecovery == daysToRecovery) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    riskScore,
    riskLevel,
    confidence,
    strainTrend,
    recoveryTrend,
    strainRecoveryBalance,
    const DeepCollectionEquality().hash(_warningSignals),
    const DeepCollectionEquality().hash(_recommendations),
    daysToRecovery,
    explanation,
  );

  /// Create a copy of OvertrainingRisk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OvertrainingRiskImplCopyWith<_$OvertrainingRiskImpl> get copyWith =>
      __$$OvertrainingRiskImplCopyWithImpl<_$OvertrainingRiskImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertrainingRiskImplToJson(this);
  }
}

abstract class _OvertrainingRisk implements OvertrainingRisk {
  const factory _OvertrainingRisk({
    required final int riskScore,
    required final OvertrainingLevel riskLevel,
    required final int confidence,
    required final StrainTrend strainTrend,
    required final RecoveryTrend recoveryTrend,
    required final double strainRecoveryBalance,
    final List<String> warningSignals,
    final List<String> recommendations,
    required final int daysToRecovery,
    required final String explanation,
  }) = _$OvertrainingRiskImpl;

  factory _OvertrainingRisk.fromJson(Map<String, dynamic> json) =
      _$OvertrainingRiskImpl.fromJson;

  @override
  int get riskScore; // 0-100
  @override
  OvertrainingLevel get riskLevel;
  @override
  int get confidence; // 0-100
  @override
  StrainTrend get strainTrend;
  @override
  RecoveryTrend get recoveryTrend;
  @override
  double get strainRecoveryBalance; // Ratio, <1 means under-recovered
  @override
  List<String> get warningSignals;
  @override
  List<String> get recommendations;
  @override
  int get daysToRecovery; // Estimated days needed to recover
  @override
  String get explanation;

  /// Create a copy of OvertrainingRisk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OvertrainingRiskImplCopyWith<_$OvertrainingRiskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StrainTrend _$StrainTrendFromJson(Map<String, dynamic> json) {
  return _StrainTrend.fromJson(json);
}

/// @nodoc
mixin _$StrainTrend {
  FactorTrend get trend => throw _privateConstructorUsedError;
  double get averageLast7Days => throw _privateConstructorUsedError;
  double get averageLast30Days => throw _privateConstructorUsedError;
  double get peakLast7Days => throw _privateConstructorUsedError;

  /// Serializes this StrainTrend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrainTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrainTrendCopyWith<StrainTrend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrainTrendCopyWith<$Res> {
  factory $StrainTrendCopyWith(
    StrainTrend value,
    $Res Function(StrainTrend) then,
  ) = _$StrainTrendCopyWithImpl<$Res, StrainTrend>;
  @useResult
  $Res call({
    FactorTrend trend,
    double averageLast7Days,
    double averageLast30Days,
    double peakLast7Days,
  });
}

/// @nodoc
class _$StrainTrendCopyWithImpl<$Res, $Val extends StrainTrend>
    implements $StrainTrendCopyWith<$Res> {
  _$StrainTrendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrainTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trend = null,
    Object? averageLast7Days = null,
    Object? averageLast30Days = null,
    Object? peakLast7Days = null,
  }) {
    return _then(
      _value.copyWith(
            trend: null == trend
                ? _value.trend
                : trend // ignore: cast_nullable_to_non_nullable
                      as FactorTrend,
            averageLast7Days: null == averageLast7Days
                ? _value.averageLast7Days
                : averageLast7Days // ignore: cast_nullable_to_non_nullable
                      as double,
            averageLast30Days: null == averageLast30Days
                ? _value.averageLast30Days
                : averageLast30Days // ignore: cast_nullable_to_non_nullable
                      as double,
            peakLast7Days: null == peakLast7Days
                ? _value.peakLast7Days
                : peakLast7Days // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StrainTrendImplCopyWith<$Res>
    implements $StrainTrendCopyWith<$Res> {
  factory _$$StrainTrendImplCopyWith(
    _$StrainTrendImpl value,
    $Res Function(_$StrainTrendImpl) then,
  ) = __$$StrainTrendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FactorTrend trend,
    double averageLast7Days,
    double averageLast30Days,
    double peakLast7Days,
  });
}

/// @nodoc
class __$$StrainTrendImplCopyWithImpl<$Res>
    extends _$StrainTrendCopyWithImpl<$Res, _$StrainTrendImpl>
    implements _$$StrainTrendImplCopyWith<$Res> {
  __$$StrainTrendImplCopyWithImpl(
    _$StrainTrendImpl _value,
    $Res Function(_$StrainTrendImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StrainTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trend = null,
    Object? averageLast7Days = null,
    Object? averageLast30Days = null,
    Object? peakLast7Days = null,
  }) {
    return _then(
      _$StrainTrendImpl(
        trend: null == trend
            ? _value.trend
            : trend // ignore: cast_nullable_to_non_nullable
                  as FactorTrend,
        averageLast7Days: null == averageLast7Days
            ? _value.averageLast7Days
            : averageLast7Days // ignore: cast_nullable_to_non_nullable
                  as double,
        averageLast30Days: null == averageLast30Days
            ? _value.averageLast30Days
            : averageLast30Days // ignore: cast_nullable_to_non_nullable
                  as double,
        peakLast7Days: null == peakLast7Days
            ? _value.peakLast7Days
            : peakLast7Days // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StrainTrendImpl implements _StrainTrend {
  const _$StrainTrendImpl({
    required this.trend,
    required this.averageLast7Days,
    required this.averageLast30Days,
    required this.peakLast7Days,
  });

  factory _$StrainTrendImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrainTrendImplFromJson(json);

  @override
  final FactorTrend trend;
  @override
  final double averageLast7Days;
  @override
  final double averageLast30Days;
  @override
  final double peakLast7Days;

  @override
  String toString() {
    return 'StrainTrend(trend: $trend, averageLast7Days: $averageLast7Days, averageLast30Days: $averageLast30Days, peakLast7Days: $peakLast7Days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrainTrendImpl &&
            (identical(other.trend, trend) || other.trend == trend) &&
            (identical(other.averageLast7Days, averageLast7Days) ||
                other.averageLast7Days == averageLast7Days) &&
            (identical(other.averageLast30Days, averageLast30Days) ||
                other.averageLast30Days == averageLast30Days) &&
            (identical(other.peakLast7Days, peakLast7Days) ||
                other.peakLast7Days == peakLast7Days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    trend,
    averageLast7Days,
    averageLast30Days,
    peakLast7Days,
  );

  /// Create a copy of StrainTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrainTrendImplCopyWith<_$StrainTrendImpl> get copyWith =>
      __$$StrainTrendImplCopyWithImpl<_$StrainTrendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrainTrendImplToJson(this);
  }
}

abstract class _StrainTrend implements StrainTrend {
  const factory _StrainTrend({
    required final FactorTrend trend,
    required final double averageLast7Days,
    required final double averageLast30Days,
    required final double peakLast7Days,
  }) = _$StrainTrendImpl;

  factory _StrainTrend.fromJson(Map<String, dynamic> json) =
      _$StrainTrendImpl.fromJson;

  @override
  FactorTrend get trend;
  @override
  double get averageLast7Days;
  @override
  double get averageLast30Days;
  @override
  double get peakLast7Days;

  /// Create a copy of StrainTrend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrainTrendImplCopyWith<_$StrainTrendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecoveryTrend _$RecoveryTrendFromJson(Map<String, dynamic> json) {
  return _RecoveryTrend.fromJson(json);
}

/// @nodoc
mixin _$RecoveryTrend {
  FactorTrend get trend => throw _privateConstructorUsedError;
  double get averageLast7Days => throw _privateConstructorUsedError;
  double get averageLast30Days => throw _privateConstructorUsedError;
  double get lowestLast7Days => throw _privateConstructorUsedError;

  /// Serializes this RecoveryTrend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecoveryTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecoveryTrendCopyWith<RecoveryTrend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveryTrendCopyWith<$Res> {
  factory $RecoveryTrendCopyWith(
    RecoveryTrend value,
    $Res Function(RecoveryTrend) then,
  ) = _$RecoveryTrendCopyWithImpl<$Res, RecoveryTrend>;
  @useResult
  $Res call({
    FactorTrend trend,
    double averageLast7Days,
    double averageLast30Days,
    double lowestLast7Days,
  });
}

/// @nodoc
class _$RecoveryTrendCopyWithImpl<$Res, $Val extends RecoveryTrend>
    implements $RecoveryTrendCopyWith<$Res> {
  _$RecoveryTrendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecoveryTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trend = null,
    Object? averageLast7Days = null,
    Object? averageLast30Days = null,
    Object? lowestLast7Days = null,
  }) {
    return _then(
      _value.copyWith(
            trend: null == trend
                ? _value.trend
                : trend // ignore: cast_nullable_to_non_nullable
                      as FactorTrend,
            averageLast7Days: null == averageLast7Days
                ? _value.averageLast7Days
                : averageLast7Days // ignore: cast_nullable_to_non_nullable
                      as double,
            averageLast30Days: null == averageLast30Days
                ? _value.averageLast30Days
                : averageLast30Days // ignore: cast_nullable_to_non_nullable
                      as double,
            lowestLast7Days: null == lowestLast7Days
                ? _value.lowestLast7Days
                : lowestLast7Days // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecoveryTrendImplCopyWith<$Res>
    implements $RecoveryTrendCopyWith<$Res> {
  factory _$$RecoveryTrendImplCopyWith(
    _$RecoveryTrendImpl value,
    $Res Function(_$RecoveryTrendImpl) then,
  ) = __$$RecoveryTrendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FactorTrend trend,
    double averageLast7Days,
    double averageLast30Days,
    double lowestLast7Days,
  });
}

/// @nodoc
class __$$RecoveryTrendImplCopyWithImpl<$Res>
    extends _$RecoveryTrendCopyWithImpl<$Res, _$RecoveryTrendImpl>
    implements _$$RecoveryTrendImplCopyWith<$Res> {
  __$$RecoveryTrendImplCopyWithImpl(
    _$RecoveryTrendImpl _value,
    $Res Function(_$RecoveryTrendImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecoveryTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trend = null,
    Object? averageLast7Days = null,
    Object? averageLast30Days = null,
    Object? lowestLast7Days = null,
  }) {
    return _then(
      _$RecoveryTrendImpl(
        trend: null == trend
            ? _value.trend
            : trend // ignore: cast_nullable_to_non_nullable
                  as FactorTrend,
        averageLast7Days: null == averageLast7Days
            ? _value.averageLast7Days
            : averageLast7Days // ignore: cast_nullable_to_non_nullable
                  as double,
        averageLast30Days: null == averageLast30Days
            ? _value.averageLast30Days
            : averageLast30Days // ignore: cast_nullable_to_non_nullable
                  as double,
        lowestLast7Days: null == lowestLast7Days
            ? _value.lowestLast7Days
            : lowestLast7Days // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecoveryTrendImpl implements _RecoveryTrend {
  const _$RecoveryTrendImpl({
    required this.trend,
    required this.averageLast7Days,
    required this.averageLast30Days,
    required this.lowestLast7Days,
  });

  factory _$RecoveryTrendImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecoveryTrendImplFromJson(json);

  @override
  final FactorTrend trend;
  @override
  final double averageLast7Days;
  @override
  final double averageLast30Days;
  @override
  final double lowestLast7Days;

  @override
  String toString() {
    return 'RecoveryTrend(trend: $trend, averageLast7Days: $averageLast7Days, averageLast30Days: $averageLast30Days, lowestLast7Days: $lowestLast7Days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecoveryTrendImpl &&
            (identical(other.trend, trend) || other.trend == trend) &&
            (identical(other.averageLast7Days, averageLast7Days) ||
                other.averageLast7Days == averageLast7Days) &&
            (identical(other.averageLast30Days, averageLast30Days) ||
                other.averageLast30Days == averageLast30Days) &&
            (identical(other.lowestLast7Days, lowestLast7Days) ||
                other.lowestLast7Days == lowestLast7Days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    trend,
    averageLast7Days,
    averageLast30Days,
    lowestLast7Days,
  );

  /// Create a copy of RecoveryTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecoveryTrendImplCopyWith<_$RecoveryTrendImpl> get copyWith =>
      __$$RecoveryTrendImplCopyWithImpl<_$RecoveryTrendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecoveryTrendImplToJson(this);
  }
}

abstract class _RecoveryTrend implements RecoveryTrend {
  const factory _RecoveryTrend({
    required final FactorTrend trend,
    required final double averageLast7Days,
    required final double averageLast30Days,
    required final double lowestLast7Days,
  }) = _$RecoveryTrendImpl;

  factory _RecoveryTrend.fromJson(Map<String, dynamic> json) =
      _$RecoveryTrendImpl.fromJson;

  @override
  FactorTrend get trend;
  @override
  double get averageLast7Days;
  @override
  double get averageLast30Days;
  @override
  double get lowestLast7Days;

  /// Create a copy of RecoveryTrend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecoveryTrendImplCopyWith<_$RecoveryTrendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SleepDebtAssessment _$SleepDebtAssessmentFromJson(Map<String, dynamic> json) {
  return _SleepDebtAssessment.fromJson(json);
}

/// @nodoc
mixin _$SleepDebtAssessment {
  double get accumulatedDebtHours =>
      throw _privateConstructorUsedError; // Total sleep debt in hours
  double get averageSleepLast7Days => throw _privateConstructorUsedError;
  double get targetSleepHours => throw _privateConstructorUsedError;
  double get deficitPerNight => throw _privateConstructorUsedError;
  SleepDebtLevel get level => throw _privateConstructorUsedError;
  int get daysToRecover =>
      throw _privateConstructorUsedError; // Days of good sleep needed
  List<String> get impacts =>
      throw _privateConstructorUsedError; // How sleep debt is affecting health
  List<String> get recommendations => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;

  /// Serializes this SleepDebtAssessment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepDebtAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepDebtAssessmentCopyWith<SleepDebtAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepDebtAssessmentCopyWith<$Res> {
  factory $SleepDebtAssessmentCopyWith(
    SleepDebtAssessment value,
    $Res Function(SleepDebtAssessment) then,
  ) = _$SleepDebtAssessmentCopyWithImpl<$Res, SleepDebtAssessment>;
  @useResult
  $Res call({
    double accumulatedDebtHours,
    double averageSleepLast7Days,
    double targetSleepHours,
    double deficitPerNight,
    SleepDebtLevel level,
    int daysToRecover,
    List<String> impacts,
    List<String> recommendations,
    String explanation,
  });
}

/// @nodoc
class _$SleepDebtAssessmentCopyWithImpl<$Res, $Val extends SleepDebtAssessment>
    implements $SleepDebtAssessmentCopyWith<$Res> {
  _$SleepDebtAssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepDebtAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accumulatedDebtHours = null,
    Object? averageSleepLast7Days = null,
    Object? targetSleepHours = null,
    Object? deficitPerNight = null,
    Object? level = null,
    Object? daysToRecover = null,
    Object? impacts = null,
    Object? recommendations = null,
    Object? explanation = null,
  }) {
    return _then(
      _value.copyWith(
            accumulatedDebtHours: null == accumulatedDebtHours
                ? _value.accumulatedDebtHours
                : accumulatedDebtHours // ignore: cast_nullable_to_non_nullable
                      as double,
            averageSleepLast7Days: null == averageSleepLast7Days
                ? _value.averageSleepLast7Days
                : averageSleepLast7Days // ignore: cast_nullable_to_non_nullable
                      as double,
            targetSleepHours: null == targetSleepHours
                ? _value.targetSleepHours
                : targetSleepHours // ignore: cast_nullable_to_non_nullable
                      as double,
            deficitPerNight: null == deficitPerNight
                ? _value.deficitPerNight
                : deficitPerNight // ignore: cast_nullable_to_non_nullable
                      as double,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as SleepDebtLevel,
            daysToRecover: null == daysToRecover
                ? _value.daysToRecover
                : daysToRecover // ignore: cast_nullable_to_non_nullable
                      as int,
            impacts: null == impacts
                ? _value.impacts
                : impacts // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            explanation: null == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SleepDebtAssessmentImplCopyWith<$Res>
    implements $SleepDebtAssessmentCopyWith<$Res> {
  factory _$$SleepDebtAssessmentImplCopyWith(
    _$SleepDebtAssessmentImpl value,
    $Res Function(_$SleepDebtAssessmentImpl) then,
  ) = __$$SleepDebtAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double accumulatedDebtHours,
    double averageSleepLast7Days,
    double targetSleepHours,
    double deficitPerNight,
    SleepDebtLevel level,
    int daysToRecover,
    List<String> impacts,
    List<String> recommendations,
    String explanation,
  });
}

/// @nodoc
class __$$SleepDebtAssessmentImplCopyWithImpl<$Res>
    extends _$SleepDebtAssessmentCopyWithImpl<$Res, _$SleepDebtAssessmentImpl>
    implements _$$SleepDebtAssessmentImplCopyWith<$Res> {
  __$$SleepDebtAssessmentImplCopyWithImpl(
    _$SleepDebtAssessmentImpl _value,
    $Res Function(_$SleepDebtAssessmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SleepDebtAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accumulatedDebtHours = null,
    Object? averageSleepLast7Days = null,
    Object? targetSleepHours = null,
    Object? deficitPerNight = null,
    Object? level = null,
    Object? daysToRecover = null,
    Object? impacts = null,
    Object? recommendations = null,
    Object? explanation = null,
  }) {
    return _then(
      _$SleepDebtAssessmentImpl(
        accumulatedDebtHours: null == accumulatedDebtHours
            ? _value.accumulatedDebtHours
            : accumulatedDebtHours // ignore: cast_nullable_to_non_nullable
                  as double,
        averageSleepLast7Days: null == averageSleepLast7Days
            ? _value.averageSleepLast7Days
            : averageSleepLast7Days // ignore: cast_nullable_to_non_nullable
                  as double,
        targetSleepHours: null == targetSleepHours
            ? _value.targetSleepHours
            : targetSleepHours // ignore: cast_nullable_to_non_nullable
                  as double,
        deficitPerNight: null == deficitPerNight
            ? _value.deficitPerNight
            : deficitPerNight // ignore: cast_nullable_to_non_nullable
                  as double,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as SleepDebtLevel,
        daysToRecover: null == daysToRecover
            ? _value.daysToRecover
            : daysToRecover // ignore: cast_nullable_to_non_nullable
                  as int,
        impacts: null == impacts
            ? _value._impacts
            : impacts // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        explanation: null == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepDebtAssessmentImpl implements _SleepDebtAssessment {
  const _$SleepDebtAssessmentImpl({
    required this.accumulatedDebtHours,
    required this.averageSleepLast7Days,
    required this.targetSleepHours,
    required this.deficitPerNight,
    required this.level,
    required this.daysToRecover,
    final List<String> impacts = const [],
    final List<String> recommendations = const [],
    required this.explanation,
  }) : _impacts = impacts,
       _recommendations = recommendations;

  factory _$SleepDebtAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepDebtAssessmentImplFromJson(json);

  @override
  final double accumulatedDebtHours;
  // Total sleep debt in hours
  @override
  final double averageSleepLast7Days;
  @override
  final double targetSleepHours;
  @override
  final double deficitPerNight;
  @override
  final SleepDebtLevel level;
  @override
  final int daysToRecover;
  // Days of good sleep needed
  final List<String> _impacts;
  // Days of good sleep needed
  @override
  @JsonKey()
  List<String> get impacts {
    if (_impacts is EqualUnmodifiableListView) return _impacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_impacts);
  }

  // How sleep debt is affecting health
  final List<String> _recommendations;
  // How sleep debt is affecting health
  @override
  @JsonKey()
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  final String explanation;

  @override
  String toString() {
    return 'SleepDebtAssessment(accumulatedDebtHours: $accumulatedDebtHours, averageSleepLast7Days: $averageSleepLast7Days, targetSleepHours: $targetSleepHours, deficitPerNight: $deficitPerNight, level: $level, daysToRecover: $daysToRecover, impacts: $impacts, recommendations: $recommendations, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepDebtAssessmentImpl &&
            (identical(other.accumulatedDebtHours, accumulatedDebtHours) ||
                other.accumulatedDebtHours == accumulatedDebtHours) &&
            (identical(other.averageSleepLast7Days, averageSleepLast7Days) ||
                other.averageSleepLast7Days == averageSleepLast7Days) &&
            (identical(other.targetSleepHours, targetSleepHours) ||
                other.targetSleepHours == targetSleepHours) &&
            (identical(other.deficitPerNight, deficitPerNight) ||
                other.deficitPerNight == deficitPerNight) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.daysToRecover, daysToRecover) ||
                other.daysToRecover == daysToRecover) &&
            const DeepCollectionEquality().equals(other._impacts, _impacts) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accumulatedDebtHours,
    averageSleepLast7Days,
    targetSleepHours,
    deficitPerNight,
    level,
    daysToRecover,
    const DeepCollectionEquality().hash(_impacts),
    const DeepCollectionEquality().hash(_recommendations),
    explanation,
  );

  /// Create a copy of SleepDebtAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepDebtAssessmentImplCopyWith<_$SleepDebtAssessmentImpl> get copyWith =>
      __$$SleepDebtAssessmentImplCopyWithImpl<_$SleepDebtAssessmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepDebtAssessmentImplToJson(this);
  }
}

abstract class _SleepDebtAssessment implements SleepDebtAssessment {
  const factory _SleepDebtAssessment({
    required final double accumulatedDebtHours,
    required final double averageSleepLast7Days,
    required final double targetSleepHours,
    required final double deficitPerNight,
    required final SleepDebtLevel level,
    required final int daysToRecover,
    final List<String> impacts,
    final List<String> recommendations,
    required final String explanation,
  }) = _$SleepDebtAssessmentImpl;

  factory _SleepDebtAssessment.fromJson(Map<String, dynamic> json) =
      _$SleepDebtAssessmentImpl.fromJson;

  @override
  double get accumulatedDebtHours; // Total sleep debt in hours
  @override
  double get averageSleepLast7Days;
  @override
  double get targetSleepHours;
  @override
  double get deficitPerNight;
  @override
  SleepDebtLevel get level;
  @override
  int get daysToRecover; // Days of good sleep needed
  @override
  List<String> get impacts; // How sleep debt is affecting health
  @override
  List<String> get recommendations;
  @override
  String get explanation;

  /// Create a copy of SleepDebtAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepDebtAssessmentImplCopyWith<_$SleepDebtAssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiskFactor _$RiskFactorFromJson(Map<String, dynamic> json) {
  return _RiskFactor.fromJson(json);
}

/// @nodoc
mixin _$RiskFactor {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get severity => throw _privateConstructorUsedError; // 0-100
  RiskCategory get category => throw _privateConstructorUsedError;
  bool get isActionable => throw _privateConstructorUsedError;
  String? get suggestedAction => throw _privateConstructorUsedError;

  /// Serializes this RiskFactor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RiskFactor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RiskFactorCopyWith<RiskFactor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskFactorCopyWith<$Res> {
  factory $RiskFactorCopyWith(
    RiskFactor value,
    $Res Function(RiskFactor) then,
  ) = _$RiskFactorCopyWithImpl<$Res, RiskFactor>;
  @useResult
  $Res call({
    String name,
    String description,
    int severity,
    RiskCategory category,
    bool isActionable,
    String? suggestedAction,
  });
}

/// @nodoc
class _$RiskFactorCopyWithImpl<$Res, $Val extends RiskFactor>
    implements $RiskFactorCopyWith<$Res> {
  _$RiskFactorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RiskFactor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? severity = null,
    Object? category = null,
    Object? isActionable = null,
    Object? suggestedAction = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as int,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as RiskCategory,
            isActionable: null == isActionable
                ? _value.isActionable
                : isActionable // ignore: cast_nullable_to_non_nullable
                      as bool,
            suggestedAction: freezed == suggestedAction
                ? _value.suggestedAction
                : suggestedAction // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RiskFactorImplCopyWith<$Res>
    implements $RiskFactorCopyWith<$Res> {
  factory _$$RiskFactorImplCopyWith(
    _$RiskFactorImpl value,
    $Res Function(_$RiskFactorImpl) then,
  ) = __$$RiskFactorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String description,
    int severity,
    RiskCategory category,
    bool isActionable,
    String? suggestedAction,
  });
}

/// @nodoc
class __$$RiskFactorImplCopyWithImpl<$Res>
    extends _$RiskFactorCopyWithImpl<$Res, _$RiskFactorImpl>
    implements _$$RiskFactorImplCopyWith<$Res> {
  __$$RiskFactorImplCopyWithImpl(
    _$RiskFactorImpl _value,
    $Res Function(_$RiskFactorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RiskFactor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? severity = null,
    Object? category = null,
    Object? isActionable = null,
    Object? suggestedAction = freezed,
  }) {
    return _then(
      _$RiskFactorImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as int,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as RiskCategory,
        isActionable: null == isActionable
            ? _value.isActionable
            : isActionable // ignore: cast_nullable_to_non_nullable
                  as bool,
        suggestedAction: freezed == suggestedAction
            ? _value.suggestedAction
            : suggestedAction // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskFactorImpl implements _RiskFactor {
  const _$RiskFactorImpl({
    required this.name,
    required this.description,
    required this.severity,
    required this.category,
    required this.isActionable,
    this.suggestedAction,
  });

  factory _$RiskFactorImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskFactorImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final int severity;
  // 0-100
  @override
  final RiskCategory category;
  @override
  final bool isActionable;
  @override
  final String? suggestedAction;

  @override
  String toString() {
    return 'RiskFactor(name: $name, description: $description, severity: $severity, category: $category, isActionable: $isActionable, suggestedAction: $suggestedAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskFactorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isActionable, isActionable) ||
                other.isActionable == isActionable) &&
            (identical(other.suggestedAction, suggestedAction) ||
                other.suggestedAction == suggestedAction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    severity,
    category,
    isActionable,
    suggestedAction,
  );

  /// Create a copy of RiskFactor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskFactorImplCopyWith<_$RiskFactorImpl> get copyWith =>
      __$$RiskFactorImplCopyWithImpl<_$RiskFactorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskFactorImplToJson(this);
  }
}

abstract class _RiskFactor implements RiskFactor {
  const factory _RiskFactor({
    required final String name,
    required final String description,
    required final int severity,
    required final RiskCategory category,
    required final bool isActionable,
    final String? suggestedAction,
  }) = _$RiskFactorImpl;

  factory _RiskFactor.fromJson(Map<String, dynamic> json) =
      _$RiskFactorImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  int get severity; // 0-100
  @override
  RiskCategory get category;
  @override
  bool get isActionable;
  @override
  String? get suggestedAction;

  /// Create a copy of RiskFactor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RiskFactorImplCopyWith<_$RiskFactorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthRecommendation _$HealthRecommendationFromJson(Map<String, dynamic> json) {
  return _HealthRecommendation.fromJson(json);
}

/// @nodoc
mixin _$HealthRecommendation {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ActionCategory get category => throw _privateConstructorUsedError;
  ActionPriority get priority => throw _privateConstructorUsedError;
  String get rationale => throw _privateConstructorUsedError;
  String? get duration =>
      throw _privateConstructorUsedError; // e.g., "for the next 3 days"
  bool get requiresProfessional => throw _privateConstructorUsedError;

  /// Serializes this HealthRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthRecommendationCopyWith<HealthRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthRecommendationCopyWith<$Res> {
  factory $HealthRecommendationCopyWith(
    HealthRecommendation value,
    $Res Function(HealthRecommendation) then,
  ) = _$HealthRecommendationCopyWithImpl<$Res, HealthRecommendation>;
  @useResult
  $Res call({
    String title,
    String description,
    ActionCategory category,
    ActionPriority priority,
    String rationale,
    String? duration,
    bool requiresProfessional,
  });
}

/// @nodoc
class _$HealthRecommendationCopyWithImpl<
  $Res,
  $Val extends HealthRecommendation
>
    implements $HealthRecommendationCopyWith<$Res> {
  _$HealthRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? rationale = null,
    Object? duration = freezed,
    Object? requiresProfessional = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as ActionCategory,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as ActionPriority,
            rationale: null == rationale
                ? _value.rationale
                : rationale // ignore: cast_nullable_to_non_nullable
                      as String,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String?,
            requiresProfessional: null == requiresProfessional
                ? _value.requiresProfessional
                : requiresProfessional // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthRecommendationImplCopyWith<$Res>
    implements $HealthRecommendationCopyWith<$Res> {
  factory _$$HealthRecommendationImplCopyWith(
    _$HealthRecommendationImpl value,
    $Res Function(_$HealthRecommendationImpl) then,
  ) = __$$HealthRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    ActionCategory category,
    ActionPriority priority,
    String rationale,
    String? duration,
    bool requiresProfessional,
  });
}

/// @nodoc
class __$$HealthRecommendationImplCopyWithImpl<$Res>
    extends _$HealthRecommendationCopyWithImpl<$Res, _$HealthRecommendationImpl>
    implements _$$HealthRecommendationImplCopyWith<$Res> {
  __$$HealthRecommendationImplCopyWithImpl(
    _$HealthRecommendationImpl _value,
    $Res Function(_$HealthRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? rationale = null,
    Object? duration = freezed,
    Object? requiresProfessional = null,
  }) {
    return _then(
      _$HealthRecommendationImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as ActionCategory,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as ActionPriority,
        rationale: null == rationale
            ? _value.rationale
            : rationale // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String?,
        requiresProfessional: null == requiresProfessional
            ? _value.requiresProfessional
            : requiresProfessional // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthRecommendationImpl implements _HealthRecommendation {
  const _$HealthRecommendationImpl({
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.rationale,
    this.duration,
    this.requiresProfessional = false,
  });

  factory _$HealthRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthRecommendationImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final ActionCategory category;
  @override
  final ActionPriority priority;
  @override
  final String rationale;
  @override
  final String? duration;
  // e.g., "for the next 3 days"
  @override
  @JsonKey()
  final bool requiresProfessional;

  @override
  String toString() {
    return 'HealthRecommendation(title: $title, description: $description, category: $category, priority: $priority, rationale: $rationale, duration: $duration, requiresProfessional: $requiresProfessional)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthRecommendationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.rationale, rationale) ||
                other.rationale == rationale) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.requiresProfessional, requiresProfessional) ||
                other.requiresProfessional == requiresProfessional));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    category,
    priority,
    rationale,
    duration,
    requiresProfessional,
  );

  /// Create a copy of HealthRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthRecommendationImplCopyWith<_$HealthRecommendationImpl>
  get copyWith =>
      __$$HealthRecommendationImplCopyWithImpl<_$HealthRecommendationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthRecommendationImplToJson(this);
  }
}

abstract class _HealthRecommendation implements HealthRecommendation {
  const factory _HealthRecommendation({
    required final String title,
    required final String description,
    required final ActionCategory category,
    required final ActionPriority priority,
    required final String rationale,
    final String? duration,
    final bool requiresProfessional,
  }) = _$HealthRecommendationImpl;

  factory _HealthRecommendation.fromJson(Map<String, dynamic> json) =
      _$HealthRecommendationImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  ActionCategory get category;
  @override
  ActionPriority get priority;
  @override
  String get rationale;
  @override
  String? get duration; // e.g., "for the next 3 days"
  @override
  bool get requiresProfessional;

  /// Create a copy of HealthRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthRecommendationImplCopyWith<_$HealthRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BehaviorCorrelation _$BehaviorCorrelationFromJson(Map<String, dynamic> json) {
  return _BehaviorCorrelation.fromJson(json);
}

/// @nodoc
mixin _$BehaviorCorrelation {
  String get behavior =>
      throw _privateConstructorUsedError; // The behavior being analyzed
  BehaviorImpact get impactOnRecovery =>
      throw _privateConstructorUsedError; // Positive, negative, neutral
  double get correlationStrength =>
      throw _privateConstructorUsedError; // -1.0 to 1.0
  int get confidence => throw _privateConstructorUsedError; // 0-100
  int get occurrences =>
      throw _privateConstructorUsedError; // How many times this behavior was tracked
  double get averageRecoveryWith =>
      throw _privateConstructorUsedError; // Average recovery score when behavior present
  double get averageRecoveryWithout =>
      throw _privateConstructorUsedError; // Average recovery score when behavior absent
  String get explanation => throw _privateConstructorUsedError;
  List<String> get insights => throw _privateConstructorUsedError;

  /// Serializes this BehaviorCorrelation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BehaviorCorrelation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BehaviorCorrelationCopyWith<BehaviorCorrelation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BehaviorCorrelationCopyWith<$Res> {
  factory $BehaviorCorrelationCopyWith(
    BehaviorCorrelation value,
    $Res Function(BehaviorCorrelation) then,
  ) = _$BehaviorCorrelationCopyWithImpl<$Res, BehaviorCorrelation>;
  @useResult
  $Res call({
    String behavior,
    BehaviorImpact impactOnRecovery,
    double correlationStrength,
    int confidence,
    int occurrences,
    double averageRecoveryWith,
    double averageRecoveryWithout,
    String explanation,
    List<String> insights,
  });
}

/// @nodoc
class _$BehaviorCorrelationCopyWithImpl<$Res, $Val extends BehaviorCorrelation>
    implements $BehaviorCorrelationCopyWith<$Res> {
  _$BehaviorCorrelationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BehaviorCorrelation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? behavior = null,
    Object? impactOnRecovery = null,
    Object? correlationStrength = null,
    Object? confidence = null,
    Object? occurrences = null,
    Object? averageRecoveryWith = null,
    Object? averageRecoveryWithout = null,
    Object? explanation = null,
    Object? insights = null,
  }) {
    return _then(
      _value.copyWith(
            behavior: null == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as String,
            impactOnRecovery: null == impactOnRecovery
                ? _value.impactOnRecovery
                : impactOnRecovery // ignore: cast_nullable_to_non_nullable
                      as BehaviorImpact,
            correlationStrength: null == correlationStrength
                ? _value.correlationStrength
                : correlationStrength // ignore: cast_nullable_to_non_nullable
                      as double,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            occurrences: null == occurrences
                ? _value.occurrences
                : occurrences // ignore: cast_nullable_to_non_nullable
                      as int,
            averageRecoveryWith: null == averageRecoveryWith
                ? _value.averageRecoveryWith
                : averageRecoveryWith // ignore: cast_nullable_to_non_nullable
                      as double,
            averageRecoveryWithout: null == averageRecoveryWithout
                ? _value.averageRecoveryWithout
                : averageRecoveryWithout // ignore: cast_nullable_to_non_nullable
                      as double,
            explanation: null == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String,
            insights: null == insights
                ? _value.insights
                : insights // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BehaviorCorrelationImplCopyWith<$Res>
    implements $BehaviorCorrelationCopyWith<$Res> {
  factory _$$BehaviorCorrelationImplCopyWith(
    _$BehaviorCorrelationImpl value,
    $Res Function(_$BehaviorCorrelationImpl) then,
  ) = __$$BehaviorCorrelationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String behavior,
    BehaviorImpact impactOnRecovery,
    double correlationStrength,
    int confidence,
    int occurrences,
    double averageRecoveryWith,
    double averageRecoveryWithout,
    String explanation,
    List<String> insights,
  });
}

/// @nodoc
class __$$BehaviorCorrelationImplCopyWithImpl<$Res>
    extends _$BehaviorCorrelationCopyWithImpl<$Res, _$BehaviorCorrelationImpl>
    implements _$$BehaviorCorrelationImplCopyWith<$Res> {
  __$$BehaviorCorrelationImplCopyWithImpl(
    _$BehaviorCorrelationImpl _value,
    $Res Function(_$BehaviorCorrelationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BehaviorCorrelation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? behavior = null,
    Object? impactOnRecovery = null,
    Object? correlationStrength = null,
    Object? confidence = null,
    Object? occurrences = null,
    Object? averageRecoveryWith = null,
    Object? averageRecoveryWithout = null,
    Object? explanation = null,
    Object? insights = null,
  }) {
    return _then(
      _$BehaviorCorrelationImpl(
        behavior: null == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as String,
        impactOnRecovery: null == impactOnRecovery
            ? _value.impactOnRecovery
            : impactOnRecovery // ignore: cast_nullable_to_non_nullable
                  as BehaviorImpact,
        correlationStrength: null == correlationStrength
            ? _value.correlationStrength
            : correlationStrength // ignore: cast_nullable_to_non_nullable
                  as double,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        occurrences: null == occurrences
            ? _value.occurrences
            : occurrences // ignore: cast_nullable_to_non_nullable
                  as int,
        averageRecoveryWith: null == averageRecoveryWith
            ? _value.averageRecoveryWith
            : averageRecoveryWith // ignore: cast_nullable_to_non_nullable
                  as double,
        averageRecoveryWithout: null == averageRecoveryWithout
            ? _value.averageRecoveryWithout
            : averageRecoveryWithout // ignore: cast_nullable_to_non_nullable
                  as double,
        explanation: null == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String,
        insights: null == insights
            ? _value._insights
            : insights // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BehaviorCorrelationImpl implements _BehaviorCorrelation {
  const _$BehaviorCorrelationImpl({
    required this.behavior,
    required this.impactOnRecovery,
    required this.correlationStrength,
    required this.confidence,
    required this.occurrences,
    required this.averageRecoveryWith,
    required this.averageRecoveryWithout,
    required this.explanation,
    final List<String> insights = const [],
  }) : _insights = insights;

  factory _$BehaviorCorrelationImpl.fromJson(Map<String, dynamic> json) =>
      _$$BehaviorCorrelationImplFromJson(json);

  @override
  final String behavior;
  // The behavior being analyzed
  @override
  final BehaviorImpact impactOnRecovery;
  // Positive, negative, neutral
  @override
  final double correlationStrength;
  // -1.0 to 1.0
  @override
  final int confidence;
  // 0-100
  @override
  final int occurrences;
  // How many times this behavior was tracked
  @override
  final double averageRecoveryWith;
  // Average recovery score when behavior present
  @override
  final double averageRecoveryWithout;
  // Average recovery score when behavior absent
  @override
  final String explanation;
  final List<String> _insights;
  @override
  @JsonKey()
  List<String> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  @override
  String toString() {
    return 'BehaviorCorrelation(behavior: $behavior, impactOnRecovery: $impactOnRecovery, correlationStrength: $correlationStrength, confidence: $confidence, occurrences: $occurrences, averageRecoveryWith: $averageRecoveryWith, averageRecoveryWithout: $averageRecoveryWithout, explanation: $explanation, insights: $insights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BehaviorCorrelationImpl &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            (identical(other.impactOnRecovery, impactOnRecovery) ||
                other.impactOnRecovery == impactOnRecovery) &&
            (identical(other.correlationStrength, correlationStrength) ||
                other.correlationStrength == correlationStrength) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.occurrences, occurrences) ||
                other.occurrences == occurrences) &&
            (identical(other.averageRecoveryWith, averageRecoveryWith) ||
                other.averageRecoveryWith == averageRecoveryWith) &&
            (identical(other.averageRecoveryWithout, averageRecoveryWithout) ||
                other.averageRecoveryWithout == averageRecoveryWithout) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            const DeepCollectionEquality().equals(other._insights, _insights));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    behavior,
    impactOnRecovery,
    correlationStrength,
    confidence,
    occurrences,
    averageRecoveryWith,
    averageRecoveryWithout,
    explanation,
    const DeepCollectionEquality().hash(_insights),
  );

  /// Create a copy of BehaviorCorrelation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BehaviorCorrelationImplCopyWith<_$BehaviorCorrelationImpl> get copyWith =>
      __$$BehaviorCorrelationImplCopyWithImpl<_$BehaviorCorrelationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BehaviorCorrelationImplToJson(this);
  }
}

abstract class _BehaviorCorrelation implements BehaviorCorrelation {
  const factory _BehaviorCorrelation({
    required final String behavior,
    required final BehaviorImpact impactOnRecovery,
    required final double correlationStrength,
    required final int confidence,
    required final int occurrences,
    required final double averageRecoveryWith,
    required final double averageRecoveryWithout,
    required final String explanation,
    final List<String> insights,
  }) = _$BehaviorCorrelationImpl;

  factory _BehaviorCorrelation.fromJson(Map<String, dynamic> json) =
      _$BehaviorCorrelationImpl.fromJson;

  @override
  String get behavior; // The behavior being analyzed
  @override
  BehaviorImpact get impactOnRecovery; // Positive, negative, neutral
  @override
  double get correlationStrength; // -1.0 to 1.0
  @override
  int get confidence; // 0-100
  @override
  int get occurrences; // How many times this behavior was tracked
  @override
  double get averageRecoveryWith; // Average recovery score when behavior present
  @override
  double get averageRecoveryWithout; // Average recovery score when behavior absent
  @override
  String get explanation;
  @override
  List<String> get insights;

  /// Create a copy of BehaviorCorrelation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BehaviorCorrelationImplCopyWith<_$BehaviorCorrelationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthContext _$HealthContextFromJson(Map<String, dynamic> json) {
  return _HealthContext.fromJson(json);
}

/// @nodoc
mixin _$HealthContext {
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError; // HRV data
  int? get currentHrv => throw _privateConstructorUsedError;
  int? get baselineHrv => throw _privateConstructorUsedError;
  List<int> get hrvLast7Days =>
      throw _privateConstructorUsedError; // Heart rate data
  int? get currentRhr => throw _privateConstructorUsedError;
  int? get baselineRhr => throw _privateConstructorUsedError;
  List<int> get rhrLast7Days =>
      throw _privateConstructorUsedError; // Sleep data
  double? get lastNightSleep => throw _privateConstructorUsedError;
  int? get sleepQuality => throw _privateConstructorUsedError;
  List<double> get sleepLast7Days => throw _privateConstructorUsedError;
  List<int> get sleepQualityLast7Days =>
      throw _privateConstructorUsedError; // Respiratory data
  double? get respiratoryRate => throw _privateConstructorUsedError;
  List<double> get respiratoryRateLast7Days =>
      throw _privateConstructorUsedError; // SpO2 data
  double? get spo2 => throw _privateConstructorUsedError;
  List<double> get spo2Last7Days =>
      throw _privateConstructorUsedError; // Strain and recovery
  double? get strainScore => throw _privateConstructorUsedError; // 0-21
  int? get recoveryScore => throw _privateConstructorUsedError; // 0-100
  List<double> get strainLast7Days => throw _privateConstructorUsedError;
  List<int> get recoveryLast7Days =>
      throw _privateConstructorUsedError; // Symptoms and behaviors
  List<String> get currentSymptoms => throw _privateConstructorUsedError;
  List<String> get recentBehaviors =>
      throw _privateConstructorUsedError; // Additional context
  int? get moodEnergy => throw _privateConstructorUsedError; // 1-5
  int? get stressLevel => throw _privateConstructorUsedError;

  /// Serializes this HealthContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthContextCopyWith<HealthContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthContextCopyWith<$Res> {
  factory $HealthContextCopyWith(
    HealthContext value,
    $Res Function(HealthContext) then,
  ) = _$HealthContextCopyWithImpl<$Res, HealthContext>;
  @useResult
  $Res call({
    String userId,
    DateTime date,
    int? currentHrv,
    int? baselineHrv,
    List<int> hrvLast7Days,
    int? currentRhr,
    int? baselineRhr,
    List<int> rhrLast7Days,
    double? lastNightSleep,
    int? sleepQuality,
    List<double> sleepLast7Days,
    List<int> sleepQualityLast7Days,
    double? respiratoryRate,
    List<double> respiratoryRateLast7Days,
    double? spo2,
    List<double> spo2Last7Days,
    double? strainScore,
    int? recoveryScore,
    List<double> strainLast7Days,
    List<int> recoveryLast7Days,
    List<String> currentSymptoms,
    List<String> recentBehaviors,
    int? moodEnergy,
    int? stressLevel,
  });
}

/// @nodoc
class _$HealthContextCopyWithImpl<$Res, $Val extends HealthContext>
    implements $HealthContextCopyWith<$Res> {
  _$HealthContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? date = null,
    Object? currentHrv = freezed,
    Object? baselineHrv = freezed,
    Object? hrvLast7Days = null,
    Object? currentRhr = freezed,
    Object? baselineRhr = freezed,
    Object? rhrLast7Days = null,
    Object? lastNightSleep = freezed,
    Object? sleepQuality = freezed,
    Object? sleepLast7Days = null,
    Object? sleepQualityLast7Days = null,
    Object? respiratoryRate = freezed,
    Object? respiratoryRateLast7Days = null,
    Object? spo2 = freezed,
    Object? spo2Last7Days = null,
    Object? strainScore = freezed,
    Object? recoveryScore = freezed,
    Object? strainLast7Days = null,
    Object? recoveryLast7Days = null,
    Object? currentSymptoms = null,
    Object? recentBehaviors = null,
    Object? moodEnergy = freezed,
    Object? stressLevel = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            currentHrv: freezed == currentHrv
                ? _value.currentHrv
                : currentHrv // ignore: cast_nullable_to_non_nullable
                      as int?,
            baselineHrv: freezed == baselineHrv
                ? _value.baselineHrv
                : baselineHrv // ignore: cast_nullable_to_non_nullable
                      as int?,
            hrvLast7Days: null == hrvLast7Days
                ? _value.hrvLast7Days
                : hrvLast7Days // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            currentRhr: freezed == currentRhr
                ? _value.currentRhr
                : currentRhr // ignore: cast_nullable_to_non_nullable
                      as int?,
            baselineRhr: freezed == baselineRhr
                ? _value.baselineRhr
                : baselineRhr // ignore: cast_nullable_to_non_nullable
                      as int?,
            rhrLast7Days: null == rhrLast7Days
                ? _value.rhrLast7Days
                : rhrLast7Days // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            lastNightSleep: freezed == lastNightSleep
                ? _value.lastNightSleep
                : lastNightSleep // ignore: cast_nullable_to_non_nullable
                      as double?,
            sleepQuality: freezed == sleepQuality
                ? _value.sleepQuality
                : sleepQuality // ignore: cast_nullable_to_non_nullable
                      as int?,
            sleepLast7Days: null == sleepLast7Days
                ? _value.sleepLast7Days
                : sleepLast7Days // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            sleepQualityLast7Days: null == sleepQualityLast7Days
                ? _value.sleepQualityLast7Days
                : sleepQualityLast7Days // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            respiratoryRate: freezed == respiratoryRate
                ? _value.respiratoryRate
                : respiratoryRate // ignore: cast_nullable_to_non_nullable
                      as double?,
            respiratoryRateLast7Days: null == respiratoryRateLast7Days
                ? _value.respiratoryRateLast7Days
                : respiratoryRateLast7Days // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            spo2: freezed == spo2
                ? _value.spo2
                : spo2 // ignore: cast_nullable_to_non_nullable
                      as double?,
            spo2Last7Days: null == spo2Last7Days
                ? _value.spo2Last7Days
                : spo2Last7Days // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            strainScore: freezed == strainScore
                ? _value.strainScore
                : strainScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            recoveryScore: freezed == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            strainLast7Days: null == strainLast7Days
                ? _value.strainLast7Days
                : strainLast7Days // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            recoveryLast7Days: null == recoveryLast7Days
                ? _value.recoveryLast7Days
                : recoveryLast7Days // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            currentSymptoms: null == currentSymptoms
                ? _value.currentSymptoms
                : currentSymptoms // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            recentBehaviors: null == recentBehaviors
                ? _value.recentBehaviors
                : recentBehaviors // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            moodEnergy: freezed == moodEnergy
                ? _value.moodEnergy
                : moodEnergy // ignore: cast_nullable_to_non_nullable
                      as int?,
            stressLevel: freezed == stressLevel
                ? _value.stressLevel
                : stressLevel // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthContextImplCopyWith<$Res>
    implements $HealthContextCopyWith<$Res> {
  factory _$$HealthContextImplCopyWith(
    _$HealthContextImpl value,
    $Res Function(_$HealthContextImpl) then,
  ) = __$$HealthContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    DateTime date,
    int? currentHrv,
    int? baselineHrv,
    List<int> hrvLast7Days,
    int? currentRhr,
    int? baselineRhr,
    List<int> rhrLast7Days,
    double? lastNightSleep,
    int? sleepQuality,
    List<double> sleepLast7Days,
    List<int> sleepQualityLast7Days,
    double? respiratoryRate,
    List<double> respiratoryRateLast7Days,
    double? spo2,
    List<double> spo2Last7Days,
    double? strainScore,
    int? recoveryScore,
    List<double> strainLast7Days,
    List<int> recoveryLast7Days,
    List<String> currentSymptoms,
    List<String> recentBehaviors,
    int? moodEnergy,
    int? stressLevel,
  });
}

/// @nodoc
class __$$HealthContextImplCopyWithImpl<$Res>
    extends _$HealthContextCopyWithImpl<$Res, _$HealthContextImpl>
    implements _$$HealthContextImplCopyWith<$Res> {
  __$$HealthContextImplCopyWithImpl(
    _$HealthContextImpl _value,
    $Res Function(_$HealthContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? date = null,
    Object? currentHrv = freezed,
    Object? baselineHrv = freezed,
    Object? hrvLast7Days = null,
    Object? currentRhr = freezed,
    Object? baselineRhr = freezed,
    Object? rhrLast7Days = null,
    Object? lastNightSleep = freezed,
    Object? sleepQuality = freezed,
    Object? sleepLast7Days = null,
    Object? sleepQualityLast7Days = null,
    Object? respiratoryRate = freezed,
    Object? respiratoryRateLast7Days = null,
    Object? spo2 = freezed,
    Object? spo2Last7Days = null,
    Object? strainScore = freezed,
    Object? recoveryScore = freezed,
    Object? strainLast7Days = null,
    Object? recoveryLast7Days = null,
    Object? currentSymptoms = null,
    Object? recentBehaviors = null,
    Object? moodEnergy = freezed,
    Object? stressLevel = freezed,
  }) {
    return _then(
      _$HealthContextImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        currentHrv: freezed == currentHrv
            ? _value.currentHrv
            : currentHrv // ignore: cast_nullable_to_non_nullable
                  as int?,
        baselineHrv: freezed == baselineHrv
            ? _value.baselineHrv
            : baselineHrv // ignore: cast_nullable_to_non_nullable
                  as int?,
        hrvLast7Days: null == hrvLast7Days
            ? _value._hrvLast7Days
            : hrvLast7Days // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        currentRhr: freezed == currentRhr
            ? _value.currentRhr
            : currentRhr // ignore: cast_nullable_to_non_nullable
                  as int?,
        baselineRhr: freezed == baselineRhr
            ? _value.baselineRhr
            : baselineRhr // ignore: cast_nullable_to_non_nullable
                  as int?,
        rhrLast7Days: null == rhrLast7Days
            ? _value._rhrLast7Days
            : rhrLast7Days // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        lastNightSleep: freezed == lastNightSleep
            ? _value.lastNightSleep
            : lastNightSleep // ignore: cast_nullable_to_non_nullable
                  as double?,
        sleepQuality: freezed == sleepQuality
            ? _value.sleepQuality
            : sleepQuality // ignore: cast_nullable_to_non_nullable
                  as int?,
        sleepLast7Days: null == sleepLast7Days
            ? _value._sleepLast7Days
            : sleepLast7Days // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        sleepQualityLast7Days: null == sleepQualityLast7Days
            ? _value._sleepQualityLast7Days
            : sleepQualityLast7Days // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        respiratoryRate: freezed == respiratoryRate
            ? _value.respiratoryRate
            : respiratoryRate // ignore: cast_nullable_to_non_nullable
                  as double?,
        respiratoryRateLast7Days: null == respiratoryRateLast7Days
            ? _value._respiratoryRateLast7Days
            : respiratoryRateLast7Days // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        spo2: freezed == spo2
            ? _value.spo2
            : spo2 // ignore: cast_nullable_to_non_nullable
                  as double?,
        spo2Last7Days: null == spo2Last7Days
            ? _value._spo2Last7Days
            : spo2Last7Days // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        strainScore: freezed == strainScore
            ? _value.strainScore
            : strainScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        recoveryScore: freezed == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        strainLast7Days: null == strainLast7Days
            ? _value._strainLast7Days
            : strainLast7Days // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        recoveryLast7Days: null == recoveryLast7Days
            ? _value._recoveryLast7Days
            : recoveryLast7Days // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        currentSymptoms: null == currentSymptoms
            ? _value._currentSymptoms
            : currentSymptoms // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        recentBehaviors: null == recentBehaviors
            ? _value._recentBehaviors
            : recentBehaviors // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        moodEnergy: freezed == moodEnergy
            ? _value.moodEnergy
            : moodEnergy // ignore: cast_nullable_to_non_nullable
                  as int?,
        stressLevel: freezed == stressLevel
            ? _value.stressLevel
            : stressLevel // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthContextImpl implements _HealthContext {
  const _$HealthContextImpl({
    required this.userId,
    required this.date,
    this.currentHrv,
    this.baselineHrv,
    final List<int> hrvLast7Days = const [],
    this.currentRhr,
    this.baselineRhr,
    final List<int> rhrLast7Days = const [],
    this.lastNightSleep,
    this.sleepQuality,
    final List<double> sleepLast7Days = const [],
    final List<int> sleepQualityLast7Days = const [],
    this.respiratoryRate,
    final List<double> respiratoryRateLast7Days = const [],
    this.spo2,
    final List<double> spo2Last7Days = const [],
    this.strainScore,
    this.recoveryScore,
    final List<double> strainLast7Days = const [],
    final List<int> recoveryLast7Days = const [],
    final List<String> currentSymptoms = const [],
    final List<String> recentBehaviors = const [],
    this.moodEnergy,
    this.stressLevel,
  }) : _hrvLast7Days = hrvLast7Days,
       _rhrLast7Days = rhrLast7Days,
       _sleepLast7Days = sleepLast7Days,
       _sleepQualityLast7Days = sleepQualityLast7Days,
       _respiratoryRateLast7Days = respiratoryRateLast7Days,
       _spo2Last7Days = spo2Last7Days,
       _strainLast7Days = strainLast7Days,
       _recoveryLast7Days = recoveryLast7Days,
       _currentSymptoms = currentSymptoms,
       _recentBehaviors = recentBehaviors;

  factory _$HealthContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthContextImplFromJson(json);

  @override
  final String userId;
  @override
  final DateTime date;
  // HRV data
  @override
  final int? currentHrv;
  @override
  final int? baselineHrv;
  final List<int> _hrvLast7Days;
  @override
  @JsonKey()
  List<int> get hrvLast7Days {
    if (_hrvLast7Days is EqualUnmodifiableListView) return _hrvLast7Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hrvLast7Days);
  }

  // Heart rate data
  @override
  final int? currentRhr;
  @override
  final int? baselineRhr;
  final List<int> _rhrLast7Days;
  @override
  @JsonKey()
  List<int> get rhrLast7Days {
    if (_rhrLast7Days is EqualUnmodifiableListView) return _rhrLast7Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rhrLast7Days);
  }

  // Sleep data
  @override
  final double? lastNightSleep;
  @override
  final int? sleepQuality;
  final List<double> _sleepLast7Days;
  @override
  @JsonKey()
  List<double> get sleepLast7Days {
    if (_sleepLast7Days is EqualUnmodifiableListView) return _sleepLast7Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sleepLast7Days);
  }

  final List<int> _sleepQualityLast7Days;
  @override
  @JsonKey()
  List<int> get sleepQualityLast7Days {
    if (_sleepQualityLast7Days is EqualUnmodifiableListView)
      return _sleepQualityLast7Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sleepQualityLast7Days);
  }

  // Respiratory data
  @override
  final double? respiratoryRate;
  final List<double> _respiratoryRateLast7Days;
  @override
  @JsonKey()
  List<double> get respiratoryRateLast7Days {
    if (_respiratoryRateLast7Days is EqualUnmodifiableListView)
      return _respiratoryRateLast7Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_respiratoryRateLast7Days);
  }

  // SpO2 data
  @override
  final double? spo2;
  final List<double> _spo2Last7Days;
  @override
  @JsonKey()
  List<double> get spo2Last7Days {
    if (_spo2Last7Days is EqualUnmodifiableListView) return _spo2Last7Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spo2Last7Days);
  }

  // Strain and recovery
  @override
  final double? strainScore;
  // 0-21
  @override
  final int? recoveryScore;
  // 0-100
  final List<double> _strainLast7Days;
  // 0-100
  @override
  @JsonKey()
  List<double> get strainLast7Days {
    if (_strainLast7Days is EqualUnmodifiableListView) return _strainLast7Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strainLast7Days);
  }

  final List<int> _recoveryLast7Days;
  @override
  @JsonKey()
  List<int> get recoveryLast7Days {
    if (_recoveryLast7Days is EqualUnmodifiableListView)
      return _recoveryLast7Days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recoveryLast7Days);
  }

  // Symptoms and behaviors
  final List<String> _currentSymptoms;
  // Symptoms and behaviors
  @override
  @JsonKey()
  List<String> get currentSymptoms {
    if (_currentSymptoms is EqualUnmodifiableListView) return _currentSymptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentSymptoms);
  }

  final List<String> _recentBehaviors;
  @override
  @JsonKey()
  List<String> get recentBehaviors {
    if (_recentBehaviors is EqualUnmodifiableListView) return _recentBehaviors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentBehaviors);
  }

  // Additional context
  @override
  final int? moodEnergy;
  // 1-5
  @override
  final int? stressLevel;

  @override
  String toString() {
    return 'HealthContext(userId: $userId, date: $date, currentHrv: $currentHrv, baselineHrv: $baselineHrv, hrvLast7Days: $hrvLast7Days, currentRhr: $currentRhr, baselineRhr: $baselineRhr, rhrLast7Days: $rhrLast7Days, lastNightSleep: $lastNightSleep, sleepQuality: $sleepQuality, sleepLast7Days: $sleepLast7Days, sleepQualityLast7Days: $sleepQualityLast7Days, respiratoryRate: $respiratoryRate, respiratoryRateLast7Days: $respiratoryRateLast7Days, spo2: $spo2, spo2Last7Days: $spo2Last7Days, strainScore: $strainScore, recoveryScore: $recoveryScore, strainLast7Days: $strainLast7Days, recoveryLast7Days: $recoveryLast7Days, currentSymptoms: $currentSymptoms, recentBehaviors: $recentBehaviors, moodEnergy: $moodEnergy, stressLevel: $stressLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthContextImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.currentHrv, currentHrv) ||
                other.currentHrv == currentHrv) &&
            (identical(other.baselineHrv, baselineHrv) ||
                other.baselineHrv == baselineHrv) &&
            const DeepCollectionEquality().equals(
              other._hrvLast7Days,
              _hrvLast7Days,
            ) &&
            (identical(other.currentRhr, currentRhr) ||
                other.currentRhr == currentRhr) &&
            (identical(other.baselineRhr, baselineRhr) ||
                other.baselineRhr == baselineRhr) &&
            const DeepCollectionEquality().equals(
              other._rhrLast7Days,
              _rhrLast7Days,
            ) &&
            (identical(other.lastNightSleep, lastNightSleep) ||
                other.lastNightSleep == lastNightSleep) &&
            (identical(other.sleepQuality, sleepQuality) ||
                other.sleepQuality == sleepQuality) &&
            const DeepCollectionEquality().equals(
              other._sleepLast7Days,
              _sleepLast7Days,
            ) &&
            const DeepCollectionEquality().equals(
              other._sleepQualityLast7Days,
              _sleepQualityLast7Days,
            ) &&
            (identical(other.respiratoryRate, respiratoryRate) ||
                other.respiratoryRate == respiratoryRate) &&
            const DeepCollectionEquality().equals(
              other._respiratoryRateLast7Days,
              _respiratoryRateLast7Days,
            ) &&
            (identical(other.spo2, spo2) || other.spo2 == spo2) &&
            const DeepCollectionEquality().equals(
              other._spo2Last7Days,
              _spo2Last7Days,
            ) &&
            (identical(other.strainScore, strainScore) ||
                other.strainScore == strainScore) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            const DeepCollectionEquality().equals(
              other._strainLast7Days,
              _strainLast7Days,
            ) &&
            const DeepCollectionEquality().equals(
              other._recoveryLast7Days,
              _recoveryLast7Days,
            ) &&
            const DeepCollectionEquality().equals(
              other._currentSymptoms,
              _currentSymptoms,
            ) &&
            const DeepCollectionEquality().equals(
              other._recentBehaviors,
              _recentBehaviors,
            ) &&
            (identical(other.moodEnergy, moodEnergy) ||
                other.moodEnergy == moodEnergy) &&
            (identical(other.stressLevel, stressLevel) ||
                other.stressLevel == stressLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    userId,
    date,
    currentHrv,
    baselineHrv,
    const DeepCollectionEquality().hash(_hrvLast7Days),
    currentRhr,
    baselineRhr,
    const DeepCollectionEquality().hash(_rhrLast7Days),
    lastNightSleep,
    sleepQuality,
    const DeepCollectionEquality().hash(_sleepLast7Days),
    const DeepCollectionEquality().hash(_sleepQualityLast7Days),
    respiratoryRate,
    const DeepCollectionEquality().hash(_respiratoryRateLast7Days),
    spo2,
    const DeepCollectionEquality().hash(_spo2Last7Days),
    strainScore,
    recoveryScore,
    const DeepCollectionEquality().hash(_strainLast7Days),
    const DeepCollectionEquality().hash(_recoveryLast7Days),
    const DeepCollectionEquality().hash(_currentSymptoms),
    const DeepCollectionEquality().hash(_recentBehaviors),
    moodEnergy,
    stressLevel,
  ]);

  /// Create a copy of HealthContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthContextImplCopyWith<_$HealthContextImpl> get copyWith =>
      __$$HealthContextImplCopyWithImpl<_$HealthContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthContextImplToJson(this);
  }
}

abstract class _HealthContext implements HealthContext {
  const factory _HealthContext({
    required final String userId,
    required final DateTime date,
    final int? currentHrv,
    final int? baselineHrv,
    final List<int> hrvLast7Days,
    final int? currentRhr,
    final int? baselineRhr,
    final List<int> rhrLast7Days,
    final double? lastNightSleep,
    final int? sleepQuality,
    final List<double> sleepLast7Days,
    final List<int> sleepQualityLast7Days,
    final double? respiratoryRate,
    final List<double> respiratoryRateLast7Days,
    final double? spo2,
    final List<double> spo2Last7Days,
    final double? strainScore,
    final int? recoveryScore,
    final List<double> strainLast7Days,
    final List<int> recoveryLast7Days,
    final List<String> currentSymptoms,
    final List<String> recentBehaviors,
    final int? moodEnergy,
    final int? stressLevel,
  }) = _$HealthContextImpl;

  factory _HealthContext.fromJson(Map<String, dynamic> json) =
      _$HealthContextImpl.fromJson;

  @override
  String get userId;
  @override
  DateTime get date; // HRV data
  @override
  int? get currentHrv;
  @override
  int? get baselineHrv;
  @override
  List<int> get hrvLast7Days; // Heart rate data
  @override
  int? get currentRhr;
  @override
  int? get baselineRhr;
  @override
  List<int> get rhrLast7Days; // Sleep data
  @override
  double? get lastNightSleep;
  @override
  int? get sleepQuality;
  @override
  List<double> get sleepLast7Days;
  @override
  List<int> get sleepQualityLast7Days; // Respiratory data
  @override
  double? get respiratoryRate;
  @override
  List<double> get respiratoryRateLast7Days; // SpO2 data
  @override
  double? get spo2;
  @override
  List<double> get spo2Last7Days; // Strain and recovery
  @override
  double? get strainScore; // 0-21
  @override
  int? get recoveryScore; // 0-100
  @override
  List<double> get strainLast7Days;
  @override
  List<int> get recoveryLast7Days; // Symptoms and behaviors
  @override
  List<String> get currentSymptoms;
  @override
  List<String> get recentBehaviors; // Additional context
  @override
  int? get moodEnergy; // 1-5
  @override
  int? get stressLevel;

  /// Create a copy of HealthContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthContextImplCopyWith<_$HealthContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StrainRecoveryHistory _$StrainRecoveryHistoryFromJson(
  Map<String, dynamic> json,
) {
  return _StrainRecoveryHistory.fromJson(json);
}

/// @nodoc
mixin _$StrainRecoveryHistory {
  String get userId => throw _privateConstructorUsedError;
  List<DailyStrainRecovery> get dailyData => throw _privateConstructorUsedError;
  List<WorkoutSummary> get workouts => throw _privateConstructorUsedError;

  /// Serializes this StrainRecoveryHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrainRecoveryHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrainRecoveryHistoryCopyWith<StrainRecoveryHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrainRecoveryHistoryCopyWith<$Res> {
  factory $StrainRecoveryHistoryCopyWith(
    StrainRecoveryHistory value,
    $Res Function(StrainRecoveryHistory) then,
  ) = _$StrainRecoveryHistoryCopyWithImpl<$Res, StrainRecoveryHistory>;
  @useResult
  $Res call({
    String userId,
    List<DailyStrainRecovery> dailyData,
    List<WorkoutSummary> workouts,
  });
}

/// @nodoc
class _$StrainRecoveryHistoryCopyWithImpl<
  $Res,
  $Val extends StrainRecoveryHistory
>
    implements $StrainRecoveryHistoryCopyWith<$Res> {
  _$StrainRecoveryHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrainRecoveryHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? dailyData = null,
    Object? workouts = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            dailyData: null == dailyData
                ? _value.dailyData
                : dailyData // ignore: cast_nullable_to_non_nullable
                      as List<DailyStrainRecovery>,
            workouts: null == workouts
                ? _value.workouts
                : workouts // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutSummary>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StrainRecoveryHistoryImplCopyWith<$Res>
    implements $StrainRecoveryHistoryCopyWith<$Res> {
  factory _$$StrainRecoveryHistoryImplCopyWith(
    _$StrainRecoveryHistoryImpl value,
    $Res Function(_$StrainRecoveryHistoryImpl) then,
  ) = __$$StrainRecoveryHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    List<DailyStrainRecovery> dailyData,
    List<WorkoutSummary> workouts,
  });
}

/// @nodoc
class __$$StrainRecoveryHistoryImplCopyWithImpl<$Res>
    extends
        _$StrainRecoveryHistoryCopyWithImpl<$Res, _$StrainRecoveryHistoryImpl>
    implements _$$StrainRecoveryHistoryImplCopyWith<$Res> {
  __$$StrainRecoveryHistoryImplCopyWithImpl(
    _$StrainRecoveryHistoryImpl _value,
    $Res Function(_$StrainRecoveryHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StrainRecoveryHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? dailyData = null,
    Object? workouts = null,
  }) {
    return _then(
      _$StrainRecoveryHistoryImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyData: null == dailyData
            ? _value._dailyData
            : dailyData // ignore: cast_nullable_to_non_nullable
                  as List<DailyStrainRecovery>,
        workouts: null == workouts
            ? _value._workouts
            : workouts // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutSummary>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StrainRecoveryHistoryImpl implements _StrainRecoveryHistory {
  const _$StrainRecoveryHistoryImpl({
    required this.userId,
    final List<DailyStrainRecovery> dailyData = const [],
    final List<WorkoutSummary> workouts = const [],
  }) : _dailyData = dailyData,
       _workouts = workouts;

  factory _$StrainRecoveryHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrainRecoveryHistoryImplFromJson(json);

  @override
  final String userId;
  final List<DailyStrainRecovery> _dailyData;
  @override
  @JsonKey()
  List<DailyStrainRecovery> get dailyData {
    if (_dailyData is EqualUnmodifiableListView) return _dailyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyData);
  }

  final List<WorkoutSummary> _workouts;
  @override
  @JsonKey()
  List<WorkoutSummary> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  String toString() {
    return 'StrainRecoveryHistory(userId: $userId, dailyData: $dailyData, workouts: $workouts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrainRecoveryHistoryImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
              other._dailyData,
              _dailyData,
            ) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    const DeepCollectionEquality().hash(_dailyData),
    const DeepCollectionEquality().hash(_workouts),
  );

  /// Create a copy of StrainRecoveryHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrainRecoveryHistoryImplCopyWith<_$StrainRecoveryHistoryImpl>
  get copyWith =>
      __$$StrainRecoveryHistoryImplCopyWithImpl<_$StrainRecoveryHistoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StrainRecoveryHistoryImplToJson(this);
  }
}

abstract class _StrainRecoveryHistory implements StrainRecoveryHistory {
  const factory _StrainRecoveryHistory({
    required final String userId,
    final List<DailyStrainRecovery> dailyData,
    final List<WorkoutSummary> workouts,
  }) = _$StrainRecoveryHistoryImpl;

  factory _StrainRecoveryHistory.fromJson(Map<String, dynamic> json) =
      _$StrainRecoveryHistoryImpl.fromJson;

  @override
  String get userId;
  @override
  List<DailyStrainRecovery> get dailyData;
  @override
  List<WorkoutSummary> get workouts;

  /// Create a copy of StrainRecoveryHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrainRecoveryHistoryImplCopyWith<_$StrainRecoveryHistoryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DailyStrainRecovery _$DailyStrainRecoveryFromJson(Map<String, dynamic> json) {
  return _DailyStrainRecovery.fromJson(json);
}

/// @nodoc
mixin _$DailyStrainRecovery {
  DateTime get date => throw _privateConstructorUsedError;
  double get strainScore => throw _privateConstructorUsedError; // 0-21
  int get recoveryScore => throw _privateConstructorUsedError; // 0-100
  int? get hrv => throw _privateConstructorUsedError;
  int? get rhr => throw _privateConstructorUsedError;
  double? get sleepHours => throw _privateConstructorUsedError;

  /// Serializes this DailyStrainRecovery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyStrainRecovery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyStrainRecoveryCopyWith<DailyStrainRecovery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyStrainRecoveryCopyWith<$Res> {
  factory $DailyStrainRecoveryCopyWith(
    DailyStrainRecovery value,
    $Res Function(DailyStrainRecovery) then,
  ) = _$DailyStrainRecoveryCopyWithImpl<$Res, DailyStrainRecovery>;
  @useResult
  $Res call({
    DateTime date,
    double strainScore,
    int recoveryScore,
    int? hrv,
    int? rhr,
    double? sleepHours,
  });
}

/// @nodoc
class _$DailyStrainRecoveryCopyWithImpl<$Res, $Val extends DailyStrainRecovery>
    implements $DailyStrainRecoveryCopyWith<$Res> {
  _$DailyStrainRecoveryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyStrainRecovery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? strainScore = null,
    Object? recoveryScore = null,
    Object? hrv = freezed,
    Object? rhr = freezed,
    Object? sleepHours = freezed,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            strainScore: null == strainScore
                ? _value.strainScore
                : strainScore // ignore: cast_nullable_to_non_nullable
                      as double,
            recoveryScore: null == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int,
            hrv: freezed == hrv
                ? _value.hrv
                : hrv // ignore: cast_nullable_to_non_nullable
                      as int?,
            rhr: freezed == rhr
                ? _value.rhr
                : rhr // ignore: cast_nullable_to_non_nullable
                      as int?,
            sleepHours: freezed == sleepHours
                ? _value.sleepHours
                : sleepHours // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyStrainRecoveryImplCopyWith<$Res>
    implements $DailyStrainRecoveryCopyWith<$Res> {
  factory _$$DailyStrainRecoveryImplCopyWith(
    _$DailyStrainRecoveryImpl value,
    $Res Function(_$DailyStrainRecoveryImpl) then,
  ) = __$$DailyStrainRecoveryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    double strainScore,
    int recoveryScore,
    int? hrv,
    int? rhr,
    double? sleepHours,
  });
}

/// @nodoc
class __$$DailyStrainRecoveryImplCopyWithImpl<$Res>
    extends _$DailyStrainRecoveryCopyWithImpl<$Res, _$DailyStrainRecoveryImpl>
    implements _$$DailyStrainRecoveryImplCopyWith<$Res> {
  __$$DailyStrainRecoveryImplCopyWithImpl(
    _$DailyStrainRecoveryImpl _value,
    $Res Function(_$DailyStrainRecoveryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyStrainRecovery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? strainScore = null,
    Object? recoveryScore = null,
    Object? hrv = freezed,
    Object? rhr = freezed,
    Object? sleepHours = freezed,
  }) {
    return _then(
      _$DailyStrainRecoveryImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        strainScore: null == strainScore
            ? _value.strainScore
            : strainScore // ignore: cast_nullable_to_non_nullable
                  as double,
        recoveryScore: null == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as int,
        hrv: freezed == hrv
            ? _value.hrv
            : hrv // ignore: cast_nullable_to_non_nullable
                  as int?,
        rhr: freezed == rhr
            ? _value.rhr
            : rhr // ignore: cast_nullable_to_non_nullable
                  as int?,
        sleepHours: freezed == sleepHours
            ? _value.sleepHours
            : sleepHours // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyStrainRecoveryImpl implements _DailyStrainRecovery {
  const _$DailyStrainRecoveryImpl({
    required this.date,
    required this.strainScore,
    required this.recoveryScore,
    this.hrv,
    this.rhr,
    this.sleepHours,
  });

  factory _$DailyStrainRecoveryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyStrainRecoveryImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double strainScore;
  // 0-21
  @override
  final int recoveryScore;
  // 0-100
  @override
  final int? hrv;
  @override
  final int? rhr;
  @override
  final double? sleepHours;

  @override
  String toString() {
    return 'DailyStrainRecovery(date: $date, strainScore: $strainScore, recoveryScore: $recoveryScore, hrv: $hrv, rhr: $rhr, sleepHours: $sleepHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyStrainRecoveryImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.strainScore, strainScore) ||
                other.strainScore == strainScore) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.hrv, hrv) || other.hrv == hrv) &&
            (identical(other.rhr, rhr) || other.rhr == rhr) &&
            (identical(other.sleepHours, sleepHours) ||
                other.sleepHours == sleepHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    strainScore,
    recoveryScore,
    hrv,
    rhr,
    sleepHours,
  );

  /// Create a copy of DailyStrainRecovery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyStrainRecoveryImplCopyWith<_$DailyStrainRecoveryImpl> get copyWith =>
      __$$DailyStrainRecoveryImplCopyWithImpl<_$DailyStrainRecoveryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyStrainRecoveryImplToJson(this);
  }
}

abstract class _DailyStrainRecovery implements DailyStrainRecovery {
  const factory _DailyStrainRecovery({
    required final DateTime date,
    required final double strainScore,
    required final int recoveryScore,
    final int? hrv,
    final int? rhr,
    final double? sleepHours,
  }) = _$DailyStrainRecoveryImpl;

  factory _DailyStrainRecovery.fromJson(Map<String, dynamic> json) =
      _$DailyStrainRecoveryImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get strainScore; // 0-21
  @override
  int get recoveryScore; // 0-100
  @override
  int? get hrv;
  @override
  int? get rhr;
  @override
  double? get sleepHours;

  /// Create a copy of DailyStrainRecovery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyStrainRecoveryImplCopyWith<_$DailyStrainRecoveryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutSummary _$WorkoutSummaryFromJson(Map<String, dynamic> json) {
  return _WorkoutSummary.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSummary {
  DateTime get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  int get intensity => throw _privateConstructorUsedError; // 1-10
  double? get strainContribution => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSummaryCopyWith<WorkoutSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSummaryCopyWith<$Res> {
  factory $WorkoutSummaryCopyWith(
    WorkoutSummary value,
    $Res Function(WorkoutSummary) then,
  ) = _$WorkoutSummaryCopyWithImpl<$Res, WorkoutSummary>;
  @useResult
  $Res call({
    DateTime date,
    String type,
    int durationMinutes,
    int intensity,
    double? strainContribution,
  });
}

/// @nodoc
class _$WorkoutSummaryCopyWithImpl<$Res, $Val extends WorkoutSummary>
    implements $WorkoutSummaryCopyWith<$Res> {
  _$WorkoutSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? durationMinutes = null,
    Object? intensity = null,
    Object? strainContribution = freezed,
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
            intensity: null == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                      as int,
            strainContribution: freezed == strainContribution
                ? _value.strainContribution
                : strainContribution // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSummaryImplCopyWith<$Res>
    implements $WorkoutSummaryCopyWith<$Res> {
  factory _$$WorkoutSummaryImplCopyWith(
    _$WorkoutSummaryImpl value,
    $Res Function(_$WorkoutSummaryImpl) then,
  ) = __$$WorkoutSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    String type,
    int durationMinutes,
    int intensity,
    double? strainContribution,
  });
}

/// @nodoc
class __$$WorkoutSummaryImplCopyWithImpl<$Res>
    extends _$WorkoutSummaryCopyWithImpl<$Res, _$WorkoutSummaryImpl>
    implements _$$WorkoutSummaryImplCopyWith<$Res> {
  __$$WorkoutSummaryImplCopyWithImpl(
    _$WorkoutSummaryImpl _value,
    $Res Function(_$WorkoutSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? durationMinutes = null,
    Object? intensity = null,
    Object? strainContribution = freezed,
  }) {
    return _then(
      _$WorkoutSummaryImpl(
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
        intensity: null == intensity
            ? _value.intensity
            : intensity // ignore: cast_nullable_to_non_nullable
                  as int,
        strainContribution: freezed == strainContribution
            ? _value.strainContribution
            : strainContribution // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSummaryImpl implements _WorkoutSummary {
  const _$WorkoutSummaryImpl({
    required this.date,
    required this.type,
    required this.durationMinutes,
    required this.intensity,
    this.strainContribution,
  });

  factory _$WorkoutSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSummaryImplFromJson(json);

  @override
  final DateTime date;
  @override
  final String type;
  @override
  final int durationMinutes;
  @override
  final int intensity;
  // 1-10
  @override
  final double? strainContribution;

  @override
  String toString() {
    return 'WorkoutSummary(date: $date, type: $type, durationMinutes: $durationMinutes, intensity: $intensity, strainContribution: $strainContribution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSummaryImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.strainContribution, strainContribution) ||
                other.strainContribution == strainContribution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    type,
    durationMinutes,
    intensity,
    strainContribution,
  );

  /// Create a copy of WorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSummaryImplCopyWith<_$WorkoutSummaryImpl> get copyWith =>
      __$$WorkoutSummaryImplCopyWithImpl<_$WorkoutSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSummaryImplToJson(this);
  }
}

abstract class _WorkoutSummary implements WorkoutSummary {
  const factory _WorkoutSummary({
    required final DateTime date,
    required final String type,
    required final int durationMinutes,
    required final int intensity,
    final double? strainContribution,
  }) = _$WorkoutSummaryImpl;

  factory _WorkoutSummary.fromJson(Map<String, dynamic> json) =
      _$WorkoutSummaryImpl.fromJson;

  @override
  DateTime get date;
  @override
  String get type;
  @override
  int get durationMinutes;
  @override
  int get intensity; // 1-10
  @override
  double? get strainContribution;

  /// Create a copy of WorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSummaryImplCopyWith<_$WorkoutSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JournalHistory _$JournalHistoryFromJson(Map<String, dynamic> json) {
  return _JournalHistory.fromJson(json);
}

/// @nodoc
mixin _$JournalHistory {
  String get userId => throw _privateConstructorUsedError;
  List<DailyJournalEntry> get entries => throw _privateConstructorUsedError;
  List<String> get allTrackedBehaviors => throw _privateConstructorUsedError;

  /// Serializes this JournalHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalHistoryCopyWith<JournalHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalHistoryCopyWith<$Res> {
  factory $JournalHistoryCopyWith(
    JournalHistory value,
    $Res Function(JournalHistory) then,
  ) = _$JournalHistoryCopyWithImpl<$Res, JournalHistory>;
  @useResult
  $Res call({
    String userId,
    List<DailyJournalEntry> entries,
    List<String> allTrackedBehaviors,
  });
}

/// @nodoc
class _$JournalHistoryCopyWithImpl<$Res, $Val extends JournalHistory>
    implements $JournalHistoryCopyWith<$Res> {
  _$JournalHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? entries = null,
    Object? allTrackedBehaviors = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            entries: null == entries
                ? _value.entries
                : entries // ignore: cast_nullable_to_non_nullable
                      as List<DailyJournalEntry>,
            allTrackedBehaviors: null == allTrackedBehaviors
                ? _value.allTrackedBehaviors
                : allTrackedBehaviors // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JournalHistoryImplCopyWith<$Res>
    implements $JournalHistoryCopyWith<$Res> {
  factory _$$JournalHistoryImplCopyWith(
    _$JournalHistoryImpl value,
    $Res Function(_$JournalHistoryImpl) then,
  ) = __$$JournalHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    List<DailyJournalEntry> entries,
    List<String> allTrackedBehaviors,
  });
}

/// @nodoc
class __$$JournalHistoryImplCopyWithImpl<$Res>
    extends _$JournalHistoryCopyWithImpl<$Res, _$JournalHistoryImpl>
    implements _$$JournalHistoryImplCopyWith<$Res> {
  __$$JournalHistoryImplCopyWithImpl(
    _$JournalHistoryImpl _value,
    $Res Function(_$JournalHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? entries = null,
    Object? allTrackedBehaviors = null,
  }) {
    return _then(
      _$JournalHistoryImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        entries: null == entries
            ? _value._entries
            : entries // ignore: cast_nullable_to_non_nullable
                  as List<DailyJournalEntry>,
        allTrackedBehaviors: null == allTrackedBehaviors
            ? _value._allTrackedBehaviors
            : allTrackedBehaviors // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalHistoryImpl implements _JournalHistory {
  const _$JournalHistoryImpl({
    required this.userId,
    final List<DailyJournalEntry> entries = const [],
    final List<String> allTrackedBehaviors = const [],
  }) : _entries = entries,
       _allTrackedBehaviors = allTrackedBehaviors;

  factory _$JournalHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalHistoryImplFromJson(json);

  @override
  final String userId;
  final List<DailyJournalEntry> _entries;
  @override
  @JsonKey()
  List<DailyJournalEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  final List<String> _allTrackedBehaviors;
  @override
  @JsonKey()
  List<String> get allTrackedBehaviors {
    if (_allTrackedBehaviors is EqualUnmodifiableListView)
      return _allTrackedBehaviors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTrackedBehaviors);
  }

  @override
  String toString() {
    return 'JournalHistory(userId: $userId, entries: $entries, allTrackedBehaviors: $allTrackedBehaviors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalHistoryImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            const DeepCollectionEquality().equals(
              other._allTrackedBehaviors,
              _allTrackedBehaviors,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    const DeepCollectionEquality().hash(_entries),
    const DeepCollectionEquality().hash(_allTrackedBehaviors),
  );

  /// Create a copy of JournalHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalHistoryImplCopyWith<_$JournalHistoryImpl> get copyWith =>
      __$$JournalHistoryImplCopyWithImpl<_$JournalHistoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalHistoryImplToJson(this);
  }
}

abstract class _JournalHistory implements JournalHistory {
  const factory _JournalHistory({
    required final String userId,
    final List<DailyJournalEntry> entries,
    final List<String> allTrackedBehaviors,
  }) = _$JournalHistoryImpl;

  factory _JournalHistory.fromJson(Map<String, dynamic> json) =
      _$JournalHistoryImpl.fromJson;

  @override
  String get userId;
  @override
  List<DailyJournalEntry> get entries;
  @override
  List<String> get allTrackedBehaviors;

  /// Create a copy of JournalHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalHistoryImplCopyWith<_$JournalHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyJournalEntry _$DailyJournalEntryFromJson(Map<String, dynamic> json) {
  return _DailyJournalEntry.fromJson(json);
}

/// @nodoc
mixin _$DailyJournalEntry {
  DateTime get date => throw _privateConstructorUsedError;
  int get recoveryScore => throw _privateConstructorUsedError; // 0-100
  List<String> get behaviors =>
      throw _privateConstructorUsedError; // Behaviors logged that day
  int? get moodEnergy => throw _privateConstructorUsedError;
  int? get stress => throw _privateConstructorUsedError;
  double? get sleepHours => throw _privateConstructorUsedError;
  int? get sleepQuality => throw _privateConstructorUsedError;

  /// Serializes this DailyJournalEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyJournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyJournalEntryCopyWith<DailyJournalEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyJournalEntryCopyWith<$Res> {
  factory $DailyJournalEntryCopyWith(
    DailyJournalEntry value,
    $Res Function(DailyJournalEntry) then,
  ) = _$DailyJournalEntryCopyWithImpl<$Res, DailyJournalEntry>;
  @useResult
  $Res call({
    DateTime date,
    int recoveryScore,
    List<String> behaviors,
    int? moodEnergy,
    int? stress,
    double? sleepHours,
    int? sleepQuality,
  });
}

/// @nodoc
class _$DailyJournalEntryCopyWithImpl<$Res, $Val extends DailyJournalEntry>
    implements $DailyJournalEntryCopyWith<$Res> {
  _$DailyJournalEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyJournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? recoveryScore = null,
    Object? behaviors = null,
    Object? moodEnergy = freezed,
    Object? stress = freezed,
    Object? sleepHours = freezed,
    Object? sleepQuality = freezed,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            recoveryScore: null == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int,
            behaviors: null == behaviors
                ? _value.behaviors
                : behaviors // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            moodEnergy: freezed == moodEnergy
                ? _value.moodEnergy
                : moodEnergy // ignore: cast_nullable_to_non_nullable
                      as int?,
            stress: freezed == stress
                ? _value.stress
                : stress // ignore: cast_nullable_to_non_nullable
                      as int?,
            sleepHours: freezed == sleepHours
                ? _value.sleepHours
                : sleepHours // ignore: cast_nullable_to_non_nullable
                      as double?,
            sleepQuality: freezed == sleepQuality
                ? _value.sleepQuality
                : sleepQuality // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyJournalEntryImplCopyWith<$Res>
    implements $DailyJournalEntryCopyWith<$Res> {
  factory _$$DailyJournalEntryImplCopyWith(
    _$DailyJournalEntryImpl value,
    $Res Function(_$DailyJournalEntryImpl) then,
  ) = __$$DailyJournalEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    int recoveryScore,
    List<String> behaviors,
    int? moodEnergy,
    int? stress,
    double? sleepHours,
    int? sleepQuality,
  });
}

/// @nodoc
class __$$DailyJournalEntryImplCopyWithImpl<$Res>
    extends _$DailyJournalEntryCopyWithImpl<$Res, _$DailyJournalEntryImpl>
    implements _$$DailyJournalEntryImplCopyWith<$Res> {
  __$$DailyJournalEntryImplCopyWithImpl(
    _$DailyJournalEntryImpl _value,
    $Res Function(_$DailyJournalEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyJournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? recoveryScore = null,
    Object? behaviors = null,
    Object? moodEnergy = freezed,
    Object? stress = freezed,
    Object? sleepHours = freezed,
    Object? sleepQuality = freezed,
  }) {
    return _then(
      _$DailyJournalEntryImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        recoveryScore: null == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as int,
        behaviors: null == behaviors
            ? _value._behaviors
            : behaviors // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        moodEnergy: freezed == moodEnergy
            ? _value.moodEnergy
            : moodEnergy // ignore: cast_nullable_to_non_nullable
                  as int?,
        stress: freezed == stress
            ? _value.stress
            : stress // ignore: cast_nullable_to_non_nullable
                  as int?,
        sleepHours: freezed == sleepHours
            ? _value.sleepHours
            : sleepHours // ignore: cast_nullable_to_non_nullable
                  as double?,
        sleepQuality: freezed == sleepQuality
            ? _value.sleepQuality
            : sleepQuality // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyJournalEntryImpl implements _DailyJournalEntry {
  const _$DailyJournalEntryImpl({
    required this.date,
    required this.recoveryScore,
    final List<String> behaviors = const [],
    this.moodEnergy,
    this.stress,
    this.sleepHours,
    this.sleepQuality,
  }) : _behaviors = behaviors;

  factory _$DailyJournalEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyJournalEntryImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int recoveryScore;
  // 0-100
  final List<String> _behaviors;
  // 0-100
  @override
  @JsonKey()
  List<String> get behaviors {
    if (_behaviors is EqualUnmodifiableListView) return _behaviors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_behaviors);
  }

  // Behaviors logged that day
  @override
  final int? moodEnergy;
  @override
  final int? stress;
  @override
  final double? sleepHours;
  @override
  final int? sleepQuality;

  @override
  String toString() {
    return 'DailyJournalEntry(date: $date, recoveryScore: $recoveryScore, behaviors: $behaviors, moodEnergy: $moodEnergy, stress: $stress, sleepHours: $sleepHours, sleepQuality: $sleepQuality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyJournalEntryImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            const DeepCollectionEquality().equals(
              other._behaviors,
              _behaviors,
            ) &&
            (identical(other.moodEnergy, moodEnergy) ||
                other.moodEnergy == moodEnergy) &&
            (identical(other.stress, stress) || other.stress == stress) &&
            (identical(other.sleepHours, sleepHours) ||
                other.sleepHours == sleepHours) &&
            (identical(other.sleepQuality, sleepQuality) ||
                other.sleepQuality == sleepQuality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    recoveryScore,
    const DeepCollectionEquality().hash(_behaviors),
    moodEnergy,
    stress,
    sleepHours,
    sleepQuality,
  );

  /// Create a copy of DailyJournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyJournalEntryImplCopyWith<_$DailyJournalEntryImpl> get copyWith =>
      __$$DailyJournalEntryImplCopyWithImpl<_$DailyJournalEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyJournalEntryImplToJson(this);
  }
}

abstract class _DailyJournalEntry implements DailyJournalEntry {
  const factory _DailyJournalEntry({
    required final DateTime date,
    required final int recoveryScore,
    final List<String> behaviors,
    final int? moodEnergy,
    final int? stress,
    final double? sleepHours,
    final int? sleepQuality,
  }) = _$DailyJournalEntryImpl;

  factory _DailyJournalEntry.fromJson(Map<String, dynamic> json) =
      _$DailyJournalEntryImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get recoveryScore; // 0-100
  @override
  List<String> get behaviors; // Behaviors logged that day
  @override
  int? get moodEnergy;
  @override
  int? get stress;
  @override
  double? get sleepHours;
  @override
  int? get sleepQuality;

  /// Create a copy of DailyJournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyJournalEntryImplCopyWith<_$DailyJournalEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProactiveInsight _$ProactiveInsightFromJson(Map<String, dynamic> json) {
  return _ProactiveInsight.fromJson(json);
}

/// @nodoc
mixin _$ProactiveInsight {
  String get id => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  InsightType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ActionPriority get priority => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError; // 0-100
  String? get actionableAdvice => throw _privateConstructorUsedError;
  String? get relatedMetric => throw _privateConstructorUsedError;
  double? get metricChange => throw _privateConstructorUsedError;
  bool get isUrgent => throw _privateConstructorUsedError;

  /// Serializes this ProactiveInsight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProactiveInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProactiveInsightCopyWith<ProactiveInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProactiveInsightCopyWith<$Res> {
  factory $ProactiveInsightCopyWith(
    ProactiveInsight value,
    $Res Function(ProactiveInsight) then,
  ) = _$ProactiveInsightCopyWithImpl<$Res, ProactiveInsight>;
  @useResult
  $Res call({
    String id,
    DateTime generatedAt,
    InsightType type,
    String title,
    String message,
    ActionPriority priority,
    int confidence,
    String? actionableAdvice,
    String? relatedMetric,
    double? metricChange,
    bool isUrgent,
  });
}

/// @nodoc
class _$ProactiveInsightCopyWithImpl<$Res, $Val extends ProactiveInsight>
    implements $ProactiveInsightCopyWith<$Res> {
  _$ProactiveInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProactiveInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? generatedAt = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? priority = null,
    Object? confidence = null,
    Object? actionableAdvice = freezed,
    Object? relatedMetric = freezed,
    Object? metricChange = freezed,
    Object? isUrgent = null,
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as InsightType,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as ActionPriority,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            actionableAdvice: freezed == actionableAdvice
                ? _value.actionableAdvice
                : actionableAdvice // ignore: cast_nullable_to_non_nullable
                      as String?,
            relatedMetric: freezed == relatedMetric
                ? _value.relatedMetric
                : relatedMetric // ignore: cast_nullable_to_non_nullable
                      as String?,
            metricChange: freezed == metricChange
                ? _value.metricChange
                : metricChange // ignore: cast_nullable_to_non_nullable
                      as double?,
            isUrgent: null == isUrgent
                ? _value.isUrgent
                : isUrgent // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProactiveInsightImplCopyWith<$Res>
    implements $ProactiveInsightCopyWith<$Res> {
  factory _$$ProactiveInsightImplCopyWith(
    _$ProactiveInsightImpl value,
    $Res Function(_$ProactiveInsightImpl) then,
  ) = __$$ProactiveInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime generatedAt,
    InsightType type,
    String title,
    String message,
    ActionPriority priority,
    int confidence,
    String? actionableAdvice,
    String? relatedMetric,
    double? metricChange,
    bool isUrgent,
  });
}

/// @nodoc
class __$$ProactiveInsightImplCopyWithImpl<$Res>
    extends _$ProactiveInsightCopyWithImpl<$Res, _$ProactiveInsightImpl>
    implements _$$ProactiveInsightImplCopyWith<$Res> {
  __$$ProactiveInsightImplCopyWithImpl(
    _$ProactiveInsightImpl _value,
    $Res Function(_$ProactiveInsightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProactiveInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? generatedAt = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? priority = null,
    Object? confidence = null,
    Object? actionableAdvice = freezed,
    Object? relatedMetric = freezed,
    Object? metricChange = freezed,
    Object? isUrgent = null,
  }) {
    return _then(
      _$ProactiveInsightImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as InsightType,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as ActionPriority,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        actionableAdvice: freezed == actionableAdvice
            ? _value.actionableAdvice
            : actionableAdvice // ignore: cast_nullable_to_non_nullable
                  as String?,
        relatedMetric: freezed == relatedMetric
            ? _value.relatedMetric
            : relatedMetric // ignore: cast_nullable_to_non_nullable
                  as String?,
        metricChange: freezed == metricChange
            ? _value.metricChange
            : metricChange // ignore: cast_nullable_to_non_nullable
                  as double?,
        isUrgent: null == isUrgent
            ? _value.isUrgent
            : isUrgent // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProactiveInsightImpl implements _ProactiveInsight {
  const _$ProactiveInsightImpl({
    required this.id,
    required this.generatedAt,
    required this.type,
    required this.title,
    required this.message,
    required this.priority,
    required this.confidence,
    this.actionableAdvice,
    this.relatedMetric,
    this.metricChange,
    required this.isUrgent,
  });

  factory _$ProactiveInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProactiveInsightImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime generatedAt;
  @override
  final InsightType type;
  @override
  final String title;
  @override
  final String message;
  @override
  final ActionPriority priority;
  @override
  final int confidence;
  // 0-100
  @override
  final String? actionableAdvice;
  @override
  final String? relatedMetric;
  @override
  final double? metricChange;
  @override
  final bool isUrgent;

  @override
  String toString() {
    return 'ProactiveInsight(id: $id, generatedAt: $generatedAt, type: $type, title: $title, message: $message, priority: $priority, confidence: $confidence, actionableAdvice: $actionableAdvice, relatedMetric: $relatedMetric, metricChange: $metricChange, isUrgent: $isUrgent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProactiveInsightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.actionableAdvice, actionableAdvice) ||
                other.actionableAdvice == actionableAdvice) &&
            (identical(other.relatedMetric, relatedMetric) ||
                other.relatedMetric == relatedMetric) &&
            (identical(other.metricChange, metricChange) ||
                other.metricChange == metricChange) &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    generatedAt,
    type,
    title,
    message,
    priority,
    confidence,
    actionableAdvice,
    relatedMetric,
    metricChange,
    isUrgent,
  );

  /// Create a copy of ProactiveInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProactiveInsightImplCopyWith<_$ProactiveInsightImpl> get copyWith =>
      __$$ProactiveInsightImplCopyWithImpl<_$ProactiveInsightImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProactiveInsightImplToJson(this);
  }
}

abstract class _ProactiveInsight implements ProactiveInsight {
  const factory _ProactiveInsight({
    required final String id,
    required final DateTime generatedAt,
    required final InsightType type,
    required final String title,
    required final String message,
    required final ActionPriority priority,
    required final int confidence,
    final String? actionableAdvice,
    final String? relatedMetric,
    final double? metricChange,
    required final bool isUrgent,
  }) = _$ProactiveInsightImpl;

  factory _ProactiveInsight.fromJson(Map<String, dynamic> json) =
      _$ProactiveInsightImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get generatedAt;
  @override
  InsightType get type;
  @override
  String get title;
  @override
  String get message;
  @override
  ActionPriority get priority;
  @override
  int get confidence; // 0-100
  @override
  String? get actionableAdvice;
  @override
  String? get relatedMetric;
  @override
  double? get metricChange;
  @override
  bool get isUrgent;

  /// Create a copy of ProactiveInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProactiveInsightImplCopyWith<_$ProactiveInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthQAResponse _$HealthQAResponseFromJson(Map<String, dynamic> json) {
  return _HealthQAResponse.fromJson(json);
}

/// @nodoc
mixin _$HealthQAResponse {
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError; // 0-100
  List<String> get relatedTopics => throw _privateConstructorUsedError;
  List<String> get disclaimers => throw _privateConstructorUsedError;
  bool get suggestsConsultingDoctor => throw _privateConstructorUsedError;
  String? get followUpQuestion => throw _privateConstructorUsedError;

  /// Serializes this HealthQAResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthQAResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthQAResponseCopyWith<HealthQAResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthQAResponseCopyWith<$Res> {
  factory $HealthQAResponseCopyWith(
    HealthQAResponse value,
    $Res Function(HealthQAResponse) then,
  ) = _$HealthQAResponseCopyWithImpl<$Res, HealthQAResponse>;
  @useResult
  $Res call({
    String question,
    String answer,
    int confidence,
    List<String> relatedTopics,
    List<String> disclaimers,
    bool suggestsConsultingDoctor,
    String? followUpQuestion,
  });
}

/// @nodoc
class _$HealthQAResponseCopyWithImpl<$Res, $Val extends HealthQAResponse>
    implements $HealthQAResponseCopyWith<$Res> {
  _$HealthQAResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthQAResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
    Object? confidence = null,
    Object? relatedTopics = null,
    Object? disclaimers = null,
    Object? suggestsConsultingDoctor = null,
    Object? followUpQuestion = freezed,
  }) {
    return _then(
      _value.copyWith(
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            answer: null == answer
                ? _value.answer
                : answer // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            relatedTopics: null == relatedTopics
                ? _value.relatedTopics
                : relatedTopics // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            disclaimers: null == disclaimers
                ? _value.disclaimers
                : disclaimers // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            suggestsConsultingDoctor: null == suggestsConsultingDoctor
                ? _value.suggestsConsultingDoctor
                : suggestsConsultingDoctor // ignore: cast_nullable_to_non_nullable
                      as bool,
            followUpQuestion: freezed == followUpQuestion
                ? _value.followUpQuestion
                : followUpQuestion // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthQAResponseImplCopyWith<$Res>
    implements $HealthQAResponseCopyWith<$Res> {
  factory _$$HealthQAResponseImplCopyWith(
    _$HealthQAResponseImpl value,
    $Res Function(_$HealthQAResponseImpl) then,
  ) = __$$HealthQAResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String question,
    String answer,
    int confidence,
    List<String> relatedTopics,
    List<String> disclaimers,
    bool suggestsConsultingDoctor,
    String? followUpQuestion,
  });
}

/// @nodoc
class __$$HealthQAResponseImplCopyWithImpl<$Res>
    extends _$HealthQAResponseCopyWithImpl<$Res, _$HealthQAResponseImpl>
    implements _$$HealthQAResponseImplCopyWith<$Res> {
  __$$HealthQAResponseImplCopyWithImpl(
    _$HealthQAResponseImpl _value,
    $Res Function(_$HealthQAResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthQAResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
    Object? confidence = null,
    Object? relatedTopics = null,
    Object? disclaimers = null,
    Object? suggestsConsultingDoctor = null,
    Object? followUpQuestion = freezed,
  }) {
    return _then(
      _$HealthQAResponseImpl(
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        answer: null == answer
            ? _value.answer
            : answer // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        relatedTopics: null == relatedTopics
            ? _value._relatedTopics
            : relatedTopics // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        disclaimers: null == disclaimers
            ? _value._disclaimers
            : disclaimers // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        suggestsConsultingDoctor: null == suggestsConsultingDoctor
            ? _value.suggestsConsultingDoctor
            : suggestsConsultingDoctor // ignore: cast_nullable_to_non_nullable
                  as bool,
        followUpQuestion: freezed == followUpQuestion
            ? _value.followUpQuestion
            : followUpQuestion // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthQAResponseImpl implements _HealthQAResponse {
  const _$HealthQAResponseImpl({
    required this.question,
    required this.answer,
    required this.confidence,
    final List<String> relatedTopics = const [],
    final List<String> disclaimers = const [],
    this.suggestsConsultingDoctor = false,
    this.followUpQuestion,
  }) : _relatedTopics = relatedTopics,
       _disclaimers = disclaimers;

  factory _$HealthQAResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthQAResponseImplFromJson(json);

  @override
  final String question;
  @override
  final String answer;
  @override
  final int confidence;
  // 0-100
  final List<String> _relatedTopics;
  // 0-100
  @override
  @JsonKey()
  List<String> get relatedTopics {
    if (_relatedTopics is EqualUnmodifiableListView) return _relatedTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedTopics);
  }

  final List<String> _disclaimers;
  @override
  @JsonKey()
  List<String> get disclaimers {
    if (_disclaimers is EqualUnmodifiableListView) return _disclaimers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disclaimers);
  }

  @override
  @JsonKey()
  final bool suggestsConsultingDoctor;
  @override
  final String? followUpQuestion;

  @override
  String toString() {
    return 'HealthQAResponse(question: $question, answer: $answer, confidence: $confidence, relatedTopics: $relatedTopics, disclaimers: $disclaimers, suggestsConsultingDoctor: $suggestsConsultingDoctor, followUpQuestion: $followUpQuestion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthQAResponseImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(
              other._relatedTopics,
              _relatedTopics,
            ) &&
            const DeepCollectionEquality().equals(
              other._disclaimers,
              _disclaimers,
            ) &&
            (identical(
                  other.suggestsConsultingDoctor,
                  suggestsConsultingDoctor,
                ) ||
                other.suggestsConsultingDoctor == suggestsConsultingDoctor) &&
            (identical(other.followUpQuestion, followUpQuestion) ||
                other.followUpQuestion == followUpQuestion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    question,
    answer,
    confidence,
    const DeepCollectionEquality().hash(_relatedTopics),
    const DeepCollectionEquality().hash(_disclaimers),
    suggestsConsultingDoctor,
    followUpQuestion,
  );

  /// Create a copy of HealthQAResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthQAResponseImplCopyWith<_$HealthQAResponseImpl> get copyWith =>
      __$$HealthQAResponseImplCopyWithImpl<_$HealthQAResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthQAResponseImplToJson(this);
  }
}

abstract class _HealthQAResponse implements HealthQAResponse {
  const factory _HealthQAResponse({
    required final String question,
    required final String answer,
    required final int confidence,
    final List<String> relatedTopics,
    final List<String> disclaimers,
    final bool suggestsConsultingDoctor,
    final String? followUpQuestion,
  }) = _$HealthQAResponseImpl;

  factory _HealthQAResponse.fromJson(Map<String, dynamic> json) =
      _$HealthQAResponseImpl.fromJson;

  @override
  String get question;
  @override
  String get answer;
  @override
  int get confidence; // 0-100
  @override
  List<String> get relatedTopics;
  @override
  List<String> get disclaimers;
  @override
  bool get suggestsConsultingDoctor;
  @override
  String? get followUpQuestion;

  /// Create a copy of HealthQAResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthQAResponseImplCopyWith<_$HealthQAResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecoveryFactorsAnalysis _$RecoveryFactorsAnalysisFromJson(
  Map<String, dynamic> json,
) {
  return _RecoveryFactorsAnalysis.fromJson(json);
}

/// @nodoc
mixin _$RecoveryFactorsAnalysis {
  String get userId => throw _privateConstructorUsedError;
  DateTime get analyzedAt => throw _privateConstructorUsedError;
  int get dataPointsAnalyzed => throw _privateConstructorUsedError;
  List<BehaviorCorrelation> get helpfulBehaviors =>
      throw _privateConstructorUsedError;
  List<BehaviorCorrelation> get harmfulBehaviors =>
      throw _privateConstructorUsedError;
  List<BehaviorCorrelation> get neutralBehaviors =>
      throw _privateConstructorUsedError;
  List<String> get keyInsights => throw _privateConstructorUsedError;
  String get personalizedAdvice => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError;

  /// Serializes this RecoveryFactorsAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecoveryFactorsAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecoveryFactorsAnalysisCopyWith<RecoveryFactorsAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveryFactorsAnalysisCopyWith<$Res> {
  factory $RecoveryFactorsAnalysisCopyWith(
    RecoveryFactorsAnalysis value,
    $Res Function(RecoveryFactorsAnalysis) then,
  ) = _$RecoveryFactorsAnalysisCopyWithImpl<$Res, RecoveryFactorsAnalysis>;
  @useResult
  $Res call({
    String userId,
    DateTime analyzedAt,
    int dataPointsAnalyzed,
    List<BehaviorCorrelation> helpfulBehaviors,
    List<BehaviorCorrelation> harmfulBehaviors,
    List<BehaviorCorrelation> neutralBehaviors,
    List<String> keyInsights,
    String personalizedAdvice,
    int confidence,
  });
}

/// @nodoc
class _$RecoveryFactorsAnalysisCopyWithImpl<
  $Res,
  $Val extends RecoveryFactorsAnalysis
>
    implements $RecoveryFactorsAnalysisCopyWith<$Res> {
  _$RecoveryFactorsAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecoveryFactorsAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? analyzedAt = null,
    Object? dataPointsAnalyzed = null,
    Object? helpfulBehaviors = null,
    Object? harmfulBehaviors = null,
    Object? neutralBehaviors = null,
    Object? keyInsights = null,
    Object? personalizedAdvice = null,
    Object? confidence = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            analyzedAt: null == analyzedAt
                ? _value.analyzedAt
                : analyzedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            dataPointsAnalyzed: null == dataPointsAnalyzed
                ? _value.dataPointsAnalyzed
                : dataPointsAnalyzed // ignore: cast_nullable_to_non_nullable
                      as int,
            helpfulBehaviors: null == helpfulBehaviors
                ? _value.helpfulBehaviors
                : helpfulBehaviors // ignore: cast_nullable_to_non_nullable
                      as List<BehaviorCorrelation>,
            harmfulBehaviors: null == harmfulBehaviors
                ? _value.harmfulBehaviors
                : harmfulBehaviors // ignore: cast_nullable_to_non_nullable
                      as List<BehaviorCorrelation>,
            neutralBehaviors: null == neutralBehaviors
                ? _value.neutralBehaviors
                : neutralBehaviors // ignore: cast_nullable_to_non_nullable
                      as List<BehaviorCorrelation>,
            keyInsights: null == keyInsights
                ? _value.keyInsights
                : keyInsights // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            personalizedAdvice: null == personalizedAdvice
                ? _value.personalizedAdvice
                : personalizedAdvice // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecoveryFactorsAnalysisImplCopyWith<$Res>
    implements $RecoveryFactorsAnalysisCopyWith<$Res> {
  factory _$$RecoveryFactorsAnalysisImplCopyWith(
    _$RecoveryFactorsAnalysisImpl value,
    $Res Function(_$RecoveryFactorsAnalysisImpl) then,
  ) = __$$RecoveryFactorsAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    DateTime analyzedAt,
    int dataPointsAnalyzed,
    List<BehaviorCorrelation> helpfulBehaviors,
    List<BehaviorCorrelation> harmfulBehaviors,
    List<BehaviorCorrelation> neutralBehaviors,
    List<String> keyInsights,
    String personalizedAdvice,
    int confidence,
  });
}

/// @nodoc
class __$$RecoveryFactorsAnalysisImplCopyWithImpl<$Res>
    extends
        _$RecoveryFactorsAnalysisCopyWithImpl<
          $Res,
          _$RecoveryFactorsAnalysisImpl
        >
    implements _$$RecoveryFactorsAnalysisImplCopyWith<$Res> {
  __$$RecoveryFactorsAnalysisImplCopyWithImpl(
    _$RecoveryFactorsAnalysisImpl _value,
    $Res Function(_$RecoveryFactorsAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecoveryFactorsAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? analyzedAt = null,
    Object? dataPointsAnalyzed = null,
    Object? helpfulBehaviors = null,
    Object? harmfulBehaviors = null,
    Object? neutralBehaviors = null,
    Object? keyInsights = null,
    Object? personalizedAdvice = null,
    Object? confidence = null,
  }) {
    return _then(
      _$RecoveryFactorsAnalysisImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        analyzedAt: null == analyzedAt
            ? _value.analyzedAt
            : analyzedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        dataPointsAnalyzed: null == dataPointsAnalyzed
            ? _value.dataPointsAnalyzed
            : dataPointsAnalyzed // ignore: cast_nullable_to_non_nullable
                  as int,
        helpfulBehaviors: null == helpfulBehaviors
            ? _value._helpfulBehaviors
            : helpfulBehaviors // ignore: cast_nullable_to_non_nullable
                  as List<BehaviorCorrelation>,
        harmfulBehaviors: null == harmfulBehaviors
            ? _value._harmfulBehaviors
            : harmfulBehaviors // ignore: cast_nullable_to_non_nullable
                  as List<BehaviorCorrelation>,
        neutralBehaviors: null == neutralBehaviors
            ? _value._neutralBehaviors
            : neutralBehaviors // ignore: cast_nullable_to_non_nullable
                  as List<BehaviorCorrelation>,
        keyInsights: null == keyInsights
            ? _value._keyInsights
            : keyInsights // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        personalizedAdvice: null == personalizedAdvice
            ? _value.personalizedAdvice
            : personalizedAdvice // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecoveryFactorsAnalysisImpl implements _RecoveryFactorsAnalysis {
  const _$RecoveryFactorsAnalysisImpl({
    required this.userId,
    required this.analyzedAt,
    required this.dataPointsAnalyzed,
    final List<BehaviorCorrelation> helpfulBehaviors = const [],
    final List<BehaviorCorrelation> harmfulBehaviors = const [],
    final List<BehaviorCorrelation> neutralBehaviors = const [],
    final List<String> keyInsights = const [],
    required this.personalizedAdvice,
    required this.confidence,
  }) : _helpfulBehaviors = helpfulBehaviors,
       _harmfulBehaviors = harmfulBehaviors,
       _neutralBehaviors = neutralBehaviors,
       _keyInsights = keyInsights;

  factory _$RecoveryFactorsAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecoveryFactorsAnalysisImplFromJson(json);

  @override
  final String userId;
  @override
  final DateTime analyzedAt;
  @override
  final int dataPointsAnalyzed;
  final List<BehaviorCorrelation> _helpfulBehaviors;
  @override
  @JsonKey()
  List<BehaviorCorrelation> get helpfulBehaviors {
    if (_helpfulBehaviors is EqualUnmodifiableListView)
      return _helpfulBehaviors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_helpfulBehaviors);
  }

  final List<BehaviorCorrelation> _harmfulBehaviors;
  @override
  @JsonKey()
  List<BehaviorCorrelation> get harmfulBehaviors {
    if (_harmfulBehaviors is EqualUnmodifiableListView)
      return _harmfulBehaviors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_harmfulBehaviors);
  }

  final List<BehaviorCorrelation> _neutralBehaviors;
  @override
  @JsonKey()
  List<BehaviorCorrelation> get neutralBehaviors {
    if (_neutralBehaviors is EqualUnmodifiableListView)
      return _neutralBehaviors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_neutralBehaviors);
  }

  final List<String> _keyInsights;
  @override
  @JsonKey()
  List<String> get keyInsights {
    if (_keyInsights is EqualUnmodifiableListView) return _keyInsights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyInsights);
  }

  @override
  final String personalizedAdvice;
  @override
  final int confidence;

  @override
  String toString() {
    return 'RecoveryFactorsAnalysis(userId: $userId, analyzedAt: $analyzedAt, dataPointsAnalyzed: $dataPointsAnalyzed, helpfulBehaviors: $helpfulBehaviors, harmfulBehaviors: $harmfulBehaviors, neutralBehaviors: $neutralBehaviors, keyInsights: $keyInsights, personalizedAdvice: $personalizedAdvice, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecoveryFactorsAnalysisImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.analyzedAt, analyzedAt) ||
                other.analyzedAt == analyzedAt) &&
            (identical(other.dataPointsAnalyzed, dataPointsAnalyzed) ||
                other.dataPointsAnalyzed == dataPointsAnalyzed) &&
            const DeepCollectionEquality().equals(
              other._helpfulBehaviors,
              _helpfulBehaviors,
            ) &&
            const DeepCollectionEquality().equals(
              other._harmfulBehaviors,
              _harmfulBehaviors,
            ) &&
            const DeepCollectionEquality().equals(
              other._neutralBehaviors,
              _neutralBehaviors,
            ) &&
            const DeepCollectionEquality().equals(
              other._keyInsights,
              _keyInsights,
            ) &&
            (identical(other.personalizedAdvice, personalizedAdvice) ||
                other.personalizedAdvice == personalizedAdvice) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    analyzedAt,
    dataPointsAnalyzed,
    const DeepCollectionEquality().hash(_helpfulBehaviors),
    const DeepCollectionEquality().hash(_harmfulBehaviors),
    const DeepCollectionEquality().hash(_neutralBehaviors),
    const DeepCollectionEquality().hash(_keyInsights),
    personalizedAdvice,
    confidence,
  );

  /// Create a copy of RecoveryFactorsAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecoveryFactorsAnalysisImplCopyWith<_$RecoveryFactorsAnalysisImpl>
  get copyWith =>
      __$$RecoveryFactorsAnalysisImplCopyWithImpl<
        _$RecoveryFactorsAnalysisImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecoveryFactorsAnalysisImplToJson(this);
  }
}

abstract class _RecoveryFactorsAnalysis implements RecoveryFactorsAnalysis {
  const factory _RecoveryFactorsAnalysis({
    required final String userId,
    required final DateTime analyzedAt,
    required final int dataPointsAnalyzed,
    final List<BehaviorCorrelation> helpfulBehaviors,
    final List<BehaviorCorrelation> harmfulBehaviors,
    final List<BehaviorCorrelation> neutralBehaviors,
    final List<String> keyInsights,
    required final String personalizedAdvice,
    required final int confidence,
  }) = _$RecoveryFactorsAnalysisImpl;

  factory _RecoveryFactorsAnalysis.fromJson(Map<String, dynamic> json) =
      _$RecoveryFactorsAnalysisImpl.fromJson;

  @override
  String get userId;
  @override
  DateTime get analyzedAt;
  @override
  int get dataPointsAnalyzed;
  @override
  List<BehaviorCorrelation> get helpfulBehaviors;
  @override
  List<BehaviorCorrelation> get harmfulBehaviors;
  @override
  List<BehaviorCorrelation> get neutralBehaviors;
  @override
  List<String> get keyInsights;
  @override
  String get personalizedAdvice;
  @override
  int get confidence;

  /// Create a copy of RecoveryFactorsAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecoveryFactorsAnalysisImplCopyWith<_$RecoveryFactorsAnalysisImpl>
  get copyWith => throw _privateConstructorUsedError;
}
