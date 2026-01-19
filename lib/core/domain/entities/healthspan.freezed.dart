// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'healthspan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Healthspan _$HealthspanFromJson(Map<String, dynamic> json) {
  return _Healthspan.fromJson(json);
}

/// @nodoc
mixin _$Healthspan {
  String get id => throw _privateConstructorUsedError;
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// User's chronological age
  int get chronologicalAge => throw _privateConstructorUsedError;

  /// Calculated biological age
  int get biologicalAge => throw _privateConstructorUsedError;

  /// Age difference (negative = younger)
  int get ageDifference => throw _privateConstructorUsedError;

  /// Individual factor contributions
  HealthspanFactors get factors => throw _privateConstructorUsedError;

  /// Historical trend (last 6 months)
  List<HealthspanHistoryPoint> get history =>
      throw _privateConstructorUsedError;

  /// Recommendations for improvement
  List<HealthspanRecommendation> get recommendations =>
      throw _privateConstructorUsedError;

  /// AI-generated insight
  String? get aiInsight => throw _privateConstructorUsedError;

  /// Arabic AI insight
  String? get aiInsightAr => throw _privateConstructorUsedError;

  /// Confidence score (0-100)
  int get confidence => throw _privateConstructorUsedError;

  /// Data completeness (0-100)
  int get dataCompleteness => throw _privateConstructorUsedError;

  /// Serializes this Healthspan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Healthspan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthspanCopyWith<Healthspan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthspanCopyWith<$Res> {
  factory $HealthspanCopyWith(
    Healthspan value,
    $Res Function(Healthspan) then,
  ) = _$HealthspanCopyWithImpl<$Res, Healthspan>;
  @useResult
  $Res call({
    String id,
    DateTime calculatedAt,
    int chronologicalAge,
    int biologicalAge,
    int ageDifference,
    HealthspanFactors factors,
    List<HealthspanHistoryPoint> history,
    List<HealthspanRecommendation> recommendations,
    String? aiInsight,
    String? aiInsightAr,
    int confidence,
    int dataCompleteness,
  });

  $HealthspanFactorsCopyWith<$Res> get factors;
}

/// @nodoc
class _$HealthspanCopyWithImpl<$Res, $Val extends Healthspan>
    implements $HealthspanCopyWith<$Res> {
  _$HealthspanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Healthspan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? calculatedAt = null,
    Object? chronologicalAge = null,
    Object? biologicalAge = null,
    Object? ageDifference = null,
    Object? factors = null,
    Object? history = null,
    Object? recommendations = null,
    Object? aiInsight = freezed,
    Object? aiInsightAr = freezed,
    Object? confidence = null,
    Object? dataCompleteness = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            calculatedAt: null == calculatedAt
                ? _value.calculatedAt
                : calculatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            chronologicalAge: null == chronologicalAge
                ? _value.chronologicalAge
                : chronologicalAge // ignore: cast_nullable_to_non_nullable
                      as int,
            biologicalAge: null == biologicalAge
                ? _value.biologicalAge
                : biologicalAge // ignore: cast_nullable_to_non_nullable
                      as int,
            ageDifference: null == ageDifference
                ? _value.ageDifference
                : ageDifference // ignore: cast_nullable_to_non_nullable
                      as int,
            factors: null == factors
                ? _value.factors
                : factors // ignore: cast_nullable_to_non_nullable
                      as HealthspanFactors,
            history: null == history
                ? _value.history
                : history // ignore: cast_nullable_to_non_nullable
                      as List<HealthspanHistoryPoint>,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<HealthspanRecommendation>,
            aiInsight: freezed == aiInsight
                ? _value.aiInsight
                : aiInsight // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiInsightAr: freezed == aiInsightAr
                ? _value.aiInsightAr
                : aiInsightAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            dataCompleteness: null == dataCompleteness
                ? _value.dataCompleteness
                : dataCompleteness // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of Healthspan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HealthspanFactorsCopyWith<$Res> get factors {
    return $HealthspanFactorsCopyWith<$Res>(_value.factors, (value) {
      return _then(_value.copyWith(factors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HealthspanImplCopyWith<$Res>
    implements $HealthspanCopyWith<$Res> {
  factory _$$HealthspanImplCopyWith(
    _$HealthspanImpl value,
    $Res Function(_$HealthspanImpl) then,
  ) = __$$HealthspanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime calculatedAt,
    int chronologicalAge,
    int biologicalAge,
    int ageDifference,
    HealthspanFactors factors,
    List<HealthspanHistoryPoint> history,
    List<HealthspanRecommendation> recommendations,
    String? aiInsight,
    String? aiInsightAr,
    int confidence,
    int dataCompleteness,
  });

  @override
  $HealthspanFactorsCopyWith<$Res> get factors;
}

/// @nodoc
class __$$HealthspanImplCopyWithImpl<$Res>
    extends _$HealthspanCopyWithImpl<$Res, _$HealthspanImpl>
    implements _$$HealthspanImplCopyWith<$Res> {
  __$$HealthspanImplCopyWithImpl(
    _$HealthspanImpl _value,
    $Res Function(_$HealthspanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Healthspan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? calculatedAt = null,
    Object? chronologicalAge = null,
    Object? biologicalAge = null,
    Object? ageDifference = null,
    Object? factors = null,
    Object? history = null,
    Object? recommendations = null,
    Object? aiInsight = freezed,
    Object? aiInsightAr = freezed,
    Object? confidence = null,
    Object? dataCompleteness = null,
  }) {
    return _then(
      _$HealthspanImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        calculatedAt: null == calculatedAt
            ? _value.calculatedAt
            : calculatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        chronologicalAge: null == chronologicalAge
            ? _value.chronologicalAge
            : chronologicalAge // ignore: cast_nullable_to_non_nullable
                  as int,
        biologicalAge: null == biologicalAge
            ? _value.biologicalAge
            : biologicalAge // ignore: cast_nullable_to_non_nullable
                  as int,
        ageDifference: null == ageDifference
            ? _value.ageDifference
            : ageDifference // ignore: cast_nullable_to_non_nullable
                  as int,
        factors: null == factors
            ? _value.factors
            : factors // ignore: cast_nullable_to_non_nullable
                  as HealthspanFactors,
        history: null == history
            ? _value._history
            : history // ignore: cast_nullable_to_non_nullable
                  as List<HealthspanHistoryPoint>,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<HealthspanRecommendation>,
        aiInsight: freezed == aiInsight
            ? _value.aiInsight
            : aiInsight // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiInsightAr: freezed == aiInsightAr
            ? _value.aiInsightAr
            : aiInsightAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        dataCompleteness: null == dataCompleteness
            ? _value.dataCompleteness
            : dataCompleteness // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthspanImpl extends _Healthspan {
  const _$HealthspanImpl({
    required this.id,
    required this.calculatedAt,
    required this.chronologicalAge,
    required this.biologicalAge,
    required this.ageDifference,
    required this.factors,
    final List<HealthspanHistoryPoint> history = const [],
    final List<HealthspanRecommendation> recommendations = const [],
    this.aiInsight,
    this.aiInsightAr,
    this.confidence = 70,
    this.dataCompleteness = 0,
  }) : _history = history,
       _recommendations = recommendations,
       super._();

  factory _$HealthspanImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthspanImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime calculatedAt;

  /// User's chronological age
  @override
  final int chronologicalAge;

  /// Calculated biological age
  @override
  final int biologicalAge;

  /// Age difference (negative = younger)
  @override
  final int ageDifference;

  /// Individual factor contributions
  @override
  final HealthspanFactors factors;

  /// Historical trend (last 6 months)
  final List<HealthspanHistoryPoint> _history;

  /// Historical trend (last 6 months)
  @override
  @JsonKey()
  List<HealthspanHistoryPoint> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  /// Recommendations for improvement
  final List<HealthspanRecommendation> _recommendations;

  /// Recommendations for improvement
  @override
  @JsonKey()
  List<HealthspanRecommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  /// AI-generated insight
  @override
  final String? aiInsight;

  /// Arabic AI insight
  @override
  final String? aiInsightAr;

  /// Confidence score (0-100)
  @override
  @JsonKey()
  final int confidence;

  /// Data completeness (0-100)
  @override
  @JsonKey()
  final int dataCompleteness;

  @override
  String toString() {
    return 'Healthspan(id: $id, calculatedAt: $calculatedAt, chronologicalAge: $chronologicalAge, biologicalAge: $biologicalAge, ageDifference: $ageDifference, factors: $factors, history: $history, recommendations: $recommendations, aiInsight: $aiInsight, aiInsightAr: $aiInsightAr, confidence: $confidence, dataCompleteness: $dataCompleteness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthspanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt) &&
            (identical(other.chronologicalAge, chronologicalAge) ||
                other.chronologicalAge == chronologicalAge) &&
            (identical(other.biologicalAge, biologicalAge) ||
                other.biologicalAge == biologicalAge) &&
            (identical(other.ageDifference, ageDifference) ||
                other.ageDifference == ageDifference) &&
            (identical(other.factors, factors) || other.factors == factors) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.aiInsight, aiInsight) ||
                other.aiInsight == aiInsight) &&
            (identical(other.aiInsightAr, aiInsightAr) ||
                other.aiInsightAr == aiInsightAr) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.dataCompleteness, dataCompleteness) ||
                other.dataCompleteness == dataCompleteness));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    calculatedAt,
    chronologicalAge,
    biologicalAge,
    ageDifference,
    factors,
    const DeepCollectionEquality().hash(_history),
    const DeepCollectionEquality().hash(_recommendations),
    aiInsight,
    aiInsightAr,
    confidence,
    dataCompleteness,
  );

  /// Create a copy of Healthspan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthspanImplCopyWith<_$HealthspanImpl> get copyWith =>
      __$$HealthspanImplCopyWithImpl<_$HealthspanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthspanImplToJson(this);
  }
}

abstract class _Healthspan extends Healthspan {
  const factory _Healthspan({
    required final String id,
    required final DateTime calculatedAt,
    required final int chronologicalAge,
    required final int biologicalAge,
    required final int ageDifference,
    required final HealthspanFactors factors,
    final List<HealthspanHistoryPoint> history,
    final List<HealthspanRecommendation> recommendations,
    final String? aiInsight,
    final String? aiInsightAr,
    final int confidence,
    final int dataCompleteness,
  }) = _$HealthspanImpl;
  const _Healthspan._() : super._();

  factory _Healthspan.fromJson(Map<String, dynamic> json) =
      _$HealthspanImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get calculatedAt;

  /// User's chronological age
  @override
  int get chronologicalAge;

  /// Calculated biological age
  @override
  int get biologicalAge;

  /// Age difference (negative = younger)
  @override
  int get ageDifference;

  /// Individual factor contributions
  @override
  HealthspanFactors get factors;

  /// Historical trend (last 6 months)
  @override
  List<HealthspanHistoryPoint> get history;

  /// Recommendations for improvement
  @override
  List<HealthspanRecommendation> get recommendations;

  /// AI-generated insight
  @override
  String? get aiInsight;

  /// Arabic AI insight
  @override
  String? get aiInsightAr;

  /// Confidence score (0-100)
  @override
  int get confidence;

  /// Data completeness (0-100)
  @override
  int get dataCompleteness;

  /// Create a copy of Healthspan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthspanImplCopyWith<_$HealthspanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthspanFactors _$HealthspanFactorsFromJson(Map<String, dynamic> json) {
  return _HealthspanFactors.fromJson(json);
}

/// @nodoc
mixin _$HealthspanFactors {
  /// HRV adjustment (-5 to +5)
  int get hrvAdjustment => throw _privateConstructorUsedError;

  /// RHR adjustment (-3 to +3)
  int get rhrAdjustment => throw _privateConstructorUsedError;

  /// Sleep adjustment (-2 to +2)
  int get sleepAdjustment => throw _privateConstructorUsedError;

  /// Activity adjustment (-3 to +3)
  int get activityAdjustment => throw _privateConstructorUsedError;

  /// Recovery adjustment (-2 to +2)
  int get recoveryAdjustment => throw _privateConstructorUsedError;

  /// Underlying metrics
  double? get avgHrv => throw _privateConstructorUsedError;
  double? get avgRhr => throw _privateConstructorUsedError;
  double? get avgSleepHours => throw _privateConstructorUsedError;
  double? get avgStrain => throw _privateConstructorUsedError;
  double? get avgRecovery => throw _privateConstructorUsedError;

  /// Serializes this HealthspanFactors to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthspanFactors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthspanFactorsCopyWith<HealthspanFactors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthspanFactorsCopyWith<$Res> {
  factory $HealthspanFactorsCopyWith(
    HealthspanFactors value,
    $Res Function(HealthspanFactors) then,
  ) = _$HealthspanFactorsCopyWithImpl<$Res, HealthspanFactors>;
  @useResult
  $Res call({
    int hrvAdjustment,
    int rhrAdjustment,
    int sleepAdjustment,
    int activityAdjustment,
    int recoveryAdjustment,
    double? avgHrv,
    double? avgRhr,
    double? avgSleepHours,
    double? avgStrain,
    double? avgRecovery,
  });
}

/// @nodoc
class _$HealthspanFactorsCopyWithImpl<$Res, $Val extends HealthspanFactors>
    implements $HealthspanFactorsCopyWith<$Res> {
  _$HealthspanFactorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthspanFactors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hrvAdjustment = null,
    Object? rhrAdjustment = null,
    Object? sleepAdjustment = null,
    Object? activityAdjustment = null,
    Object? recoveryAdjustment = null,
    Object? avgHrv = freezed,
    Object? avgRhr = freezed,
    Object? avgSleepHours = freezed,
    Object? avgStrain = freezed,
    Object? avgRecovery = freezed,
  }) {
    return _then(
      _value.copyWith(
            hrvAdjustment: null == hrvAdjustment
                ? _value.hrvAdjustment
                : hrvAdjustment // ignore: cast_nullable_to_non_nullable
                      as int,
            rhrAdjustment: null == rhrAdjustment
                ? _value.rhrAdjustment
                : rhrAdjustment // ignore: cast_nullable_to_non_nullable
                      as int,
            sleepAdjustment: null == sleepAdjustment
                ? _value.sleepAdjustment
                : sleepAdjustment // ignore: cast_nullable_to_non_nullable
                      as int,
            activityAdjustment: null == activityAdjustment
                ? _value.activityAdjustment
                : activityAdjustment // ignore: cast_nullable_to_non_nullable
                      as int,
            recoveryAdjustment: null == recoveryAdjustment
                ? _value.recoveryAdjustment
                : recoveryAdjustment // ignore: cast_nullable_to_non_nullable
                      as int,
            avgHrv: freezed == avgHrv
                ? _value.avgHrv
                : avgHrv // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgRhr: freezed == avgRhr
                ? _value.avgRhr
                : avgRhr // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgSleepHours: freezed == avgSleepHours
                ? _value.avgSleepHours
                : avgSleepHours // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgStrain: freezed == avgStrain
                ? _value.avgStrain
                : avgStrain // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgRecovery: freezed == avgRecovery
                ? _value.avgRecovery
                : avgRecovery // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthspanFactorsImplCopyWith<$Res>
    implements $HealthspanFactorsCopyWith<$Res> {
  factory _$$HealthspanFactorsImplCopyWith(
    _$HealthspanFactorsImpl value,
    $Res Function(_$HealthspanFactorsImpl) then,
  ) = __$$HealthspanFactorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int hrvAdjustment,
    int rhrAdjustment,
    int sleepAdjustment,
    int activityAdjustment,
    int recoveryAdjustment,
    double? avgHrv,
    double? avgRhr,
    double? avgSleepHours,
    double? avgStrain,
    double? avgRecovery,
  });
}

/// @nodoc
class __$$HealthspanFactorsImplCopyWithImpl<$Res>
    extends _$HealthspanFactorsCopyWithImpl<$Res, _$HealthspanFactorsImpl>
    implements _$$HealthspanFactorsImplCopyWith<$Res> {
  __$$HealthspanFactorsImplCopyWithImpl(
    _$HealthspanFactorsImpl _value,
    $Res Function(_$HealthspanFactorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthspanFactors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hrvAdjustment = null,
    Object? rhrAdjustment = null,
    Object? sleepAdjustment = null,
    Object? activityAdjustment = null,
    Object? recoveryAdjustment = null,
    Object? avgHrv = freezed,
    Object? avgRhr = freezed,
    Object? avgSleepHours = freezed,
    Object? avgStrain = freezed,
    Object? avgRecovery = freezed,
  }) {
    return _then(
      _$HealthspanFactorsImpl(
        hrvAdjustment: null == hrvAdjustment
            ? _value.hrvAdjustment
            : hrvAdjustment // ignore: cast_nullable_to_non_nullable
                  as int,
        rhrAdjustment: null == rhrAdjustment
            ? _value.rhrAdjustment
            : rhrAdjustment // ignore: cast_nullable_to_non_nullable
                  as int,
        sleepAdjustment: null == sleepAdjustment
            ? _value.sleepAdjustment
            : sleepAdjustment // ignore: cast_nullable_to_non_nullable
                  as int,
        activityAdjustment: null == activityAdjustment
            ? _value.activityAdjustment
            : activityAdjustment // ignore: cast_nullable_to_non_nullable
                  as int,
        recoveryAdjustment: null == recoveryAdjustment
            ? _value.recoveryAdjustment
            : recoveryAdjustment // ignore: cast_nullable_to_non_nullable
                  as int,
        avgHrv: freezed == avgHrv
            ? _value.avgHrv
            : avgHrv // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgRhr: freezed == avgRhr
            ? _value.avgRhr
            : avgRhr // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgSleepHours: freezed == avgSleepHours
            ? _value.avgSleepHours
            : avgSleepHours // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgStrain: freezed == avgStrain
            ? _value.avgStrain
            : avgStrain // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgRecovery: freezed == avgRecovery
            ? _value.avgRecovery
            : avgRecovery // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthspanFactorsImpl extends _HealthspanFactors {
  const _$HealthspanFactorsImpl({
    required this.hrvAdjustment,
    required this.rhrAdjustment,
    required this.sleepAdjustment,
    required this.activityAdjustment,
    required this.recoveryAdjustment,
    this.avgHrv,
    this.avgRhr,
    this.avgSleepHours,
    this.avgStrain,
    this.avgRecovery,
  }) : super._();

  factory _$HealthspanFactorsImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthspanFactorsImplFromJson(json);

  /// HRV adjustment (-5 to +5)
  @override
  final int hrvAdjustment;

  /// RHR adjustment (-3 to +3)
  @override
  final int rhrAdjustment;

  /// Sleep adjustment (-2 to +2)
  @override
  final int sleepAdjustment;

  /// Activity adjustment (-3 to +3)
  @override
  final int activityAdjustment;

  /// Recovery adjustment (-2 to +2)
  @override
  final int recoveryAdjustment;

  /// Underlying metrics
  @override
  final double? avgHrv;
  @override
  final double? avgRhr;
  @override
  final double? avgSleepHours;
  @override
  final double? avgStrain;
  @override
  final double? avgRecovery;

  @override
  String toString() {
    return 'HealthspanFactors(hrvAdjustment: $hrvAdjustment, rhrAdjustment: $rhrAdjustment, sleepAdjustment: $sleepAdjustment, activityAdjustment: $activityAdjustment, recoveryAdjustment: $recoveryAdjustment, avgHrv: $avgHrv, avgRhr: $avgRhr, avgSleepHours: $avgSleepHours, avgStrain: $avgStrain, avgRecovery: $avgRecovery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthspanFactorsImpl &&
            (identical(other.hrvAdjustment, hrvAdjustment) ||
                other.hrvAdjustment == hrvAdjustment) &&
            (identical(other.rhrAdjustment, rhrAdjustment) ||
                other.rhrAdjustment == rhrAdjustment) &&
            (identical(other.sleepAdjustment, sleepAdjustment) ||
                other.sleepAdjustment == sleepAdjustment) &&
            (identical(other.activityAdjustment, activityAdjustment) ||
                other.activityAdjustment == activityAdjustment) &&
            (identical(other.recoveryAdjustment, recoveryAdjustment) ||
                other.recoveryAdjustment == recoveryAdjustment) &&
            (identical(other.avgHrv, avgHrv) || other.avgHrv == avgHrv) &&
            (identical(other.avgRhr, avgRhr) || other.avgRhr == avgRhr) &&
            (identical(other.avgSleepHours, avgSleepHours) ||
                other.avgSleepHours == avgSleepHours) &&
            (identical(other.avgStrain, avgStrain) ||
                other.avgStrain == avgStrain) &&
            (identical(other.avgRecovery, avgRecovery) ||
                other.avgRecovery == avgRecovery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hrvAdjustment,
    rhrAdjustment,
    sleepAdjustment,
    activityAdjustment,
    recoveryAdjustment,
    avgHrv,
    avgRhr,
    avgSleepHours,
    avgStrain,
    avgRecovery,
  );

  /// Create a copy of HealthspanFactors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthspanFactorsImplCopyWith<_$HealthspanFactorsImpl> get copyWith =>
      __$$HealthspanFactorsImplCopyWithImpl<_$HealthspanFactorsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthspanFactorsImplToJson(this);
  }
}

abstract class _HealthspanFactors extends HealthspanFactors {
  const factory _HealthspanFactors({
    required final int hrvAdjustment,
    required final int rhrAdjustment,
    required final int sleepAdjustment,
    required final int activityAdjustment,
    required final int recoveryAdjustment,
    final double? avgHrv,
    final double? avgRhr,
    final double? avgSleepHours,
    final double? avgStrain,
    final double? avgRecovery,
  }) = _$HealthspanFactorsImpl;
  const _HealthspanFactors._() : super._();

  factory _HealthspanFactors.fromJson(Map<String, dynamic> json) =
      _$HealthspanFactorsImpl.fromJson;

  /// HRV adjustment (-5 to +5)
  @override
  int get hrvAdjustment;

  /// RHR adjustment (-3 to +3)
  @override
  int get rhrAdjustment;

  /// Sleep adjustment (-2 to +2)
  @override
  int get sleepAdjustment;

  /// Activity adjustment (-3 to +3)
  @override
  int get activityAdjustment;

  /// Recovery adjustment (-2 to +2)
  @override
  int get recoveryAdjustment;

  /// Underlying metrics
  @override
  double? get avgHrv;
  @override
  double? get avgRhr;
  @override
  double? get avgSleepHours;
  @override
  double? get avgStrain;
  @override
  double? get avgRecovery;

  /// Create a copy of HealthspanFactors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthspanFactorsImplCopyWith<_$HealthspanFactorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthspanRecommendation _$HealthspanRecommendationFromJson(
  Map<String, dynamic> json,
) {
  return _HealthspanRecommendation.fromJson(json);
}

/// @nodoc
mixin _$HealthspanRecommendation {
  HealthspanArea get area => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titleAr => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get descriptionAr => throw _privateConstructorUsedError;

  /// Potential years improvement
  int get potentialImpact => throw _privateConstructorUsedError;

  /// Priority (1 = highest)
  int get priority => throw _privateConstructorUsedError;

  /// Serializes this HealthspanRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthspanRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthspanRecommendationCopyWith<HealthspanRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthspanRecommendationCopyWith<$Res> {
  factory $HealthspanRecommendationCopyWith(
    HealthspanRecommendation value,
    $Res Function(HealthspanRecommendation) then,
  ) = _$HealthspanRecommendationCopyWithImpl<$Res, HealthspanRecommendation>;
  @useResult
  $Res call({
    HealthspanArea area,
    String title,
    String titleAr,
    String description,
    String descriptionAr,
    int potentialImpact,
    int priority,
  });
}

/// @nodoc
class _$HealthspanRecommendationCopyWithImpl<
  $Res,
  $Val extends HealthspanRecommendation
>
    implements $HealthspanRecommendationCopyWith<$Res> {
  _$HealthspanRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthspanRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? title = null,
    Object? titleAr = null,
    Object? description = null,
    Object? descriptionAr = null,
    Object? potentialImpact = null,
    Object? priority = null,
  }) {
    return _then(
      _value.copyWith(
            area: null == area
                ? _value.area
                : area // ignore: cast_nullable_to_non_nullable
                      as HealthspanArea,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            titleAr: null == titleAr
                ? _value.titleAr
                : titleAr // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionAr: null == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String,
            potentialImpact: null == potentialImpact
                ? _value.potentialImpact
                : potentialImpact // ignore: cast_nullable_to_non_nullable
                      as int,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthspanRecommendationImplCopyWith<$Res>
    implements $HealthspanRecommendationCopyWith<$Res> {
  factory _$$HealthspanRecommendationImplCopyWith(
    _$HealthspanRecommendationImpl value,
    $Res Function(_$HealthspanRecommendationImpl) then,
  ) = __$$HealthspanRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    HealthspanArea area,
    String title,
    String titleAr,
    String description,
    String descriptionAr,
    int potentialImpact,
    int priority,
  });
}

/// @nodoc
class __$$HealthspanRecommendationImplCopyWithImpl<$Res>
    extends
        _$HealthspanRecommendationCopyWithImpl<
          $Res,
          _$HealthspanRecommendationImpl
        >
    implements _$$HealthspanRecommendationImplCopyWith<$Res> {
  __$$HealthspanRecommendationImplCopyWithImpl(
    _$HealthspanRecommendationImpl _value,
    $Res Function(_$HealthspanRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthspanRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? title = null,
    Object? titleAr = null,
    Object? description = null,
    Object? descriptionAr = null,
    Object? potentialImpact = null,
    Object? priority = null,
  }) {
    return _then(
      _$HealthspanRecommendationImpl(
        area: null == area
            ? _value.area
            : area // ignore: cast_nullable_to_non_nullable
                  as HealthspanArea,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        titleAr: null == titleAr
            ? _value.titleAr
            : titleAr // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: null == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String,
        potentialImpact: null == potentialImpact
            ? _value.potentialImpact
            : potentialImpact // ignore: cast_nullable_to_non_nullable
                  as int,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthspanRecommendationImpl implements _HealthspanRecommendation {
  const _$HealthspanRecommendationImpl({
    required this.area,
    required this.title,
    required this.titleAr,
    required this.description,
    required this.descriptionAr,
    required this.potentialImpact,
    this.priority = 2,
  });

  factory _$HealthspanRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthspanRecommendationImplFromJson(json);

  @override
  final HealthspanArea area;
  @override
  final String title;
  @override
  final String titleAr;
  @override
  final String description;
  @override
  final String descriptionAr;

  /// Potential years improvement
  @override
  final int potentialImpact;

  /// Priority (1 = highest)
  @override
  @JsonKey()
  final int priority;

  @override
  String toString() {
    return 'HealthspanRecommendation(area: $area, title: $title, titleAr: $titleAr, description: $description, descriptionAr: $descriptionAr, potentialImpact: $potentialImpact, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthspanRecommendationImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.potentialImpact, potentialImpact) ||
                other.potentialImpact == potentialImpact) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    area,
    title,
    titleAr,
    description,
    descriptionAr,
    potentialImpact,
    priority,
  );

  /// Create a copy of HealthspanRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthspanRecommendationImplCopyWith<_$HealthspanRecommendationImpl>
  get copyWith =>
      __$$HealthspanRecommendationImplCopyWithImpl<
        _$HealthspanRecommendationImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthspanRecommendationImplToJson(this);
  }
}

abstract class _HealthspanRecommendation implements HealthspanRecommendation {
  const factory _HealthspanRecommendation({
    required final HealthspanArea area,
    required final String title,
    required final String titleAr,
    required final String description,
    required final String descriptionAr,
    required final int potentialImpact,
    final int priority,
  }) = _$HealthspanRecommendationImpl;

  factory _HealthspanRecommendation.fromJson(Map<String, dynamic> json) =
      _$HealthspanRecommendationImpl.fromJson;

  @override
  HealthspanArea get area;
  @override
  String get title;
  @override
  String get titleAr;
  @override
  String get description;
  @override
  String get descriptionAr;

  /// Potential years improvement
  @override
  int get potentialImpact;

  /// Priority (1 = highest)
  @override
  int get priority;

  /// Create a copy of HealthspanRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthspanRecommendationImplCopyWith<_$HealthspanRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

HealthspanHistoryPoint _$HealthspanHistoryPointFromJson(
  Map<String, dynamic> json,
) {
  return _HealthspanHistoryPoint.fromJson(json);
}

/// @nodoc
mixin _$HealthspanHistoryPoint {
  DateTime get calculatedAt => throw _privateConstructorUsedError;
  int get biologicalAge => throw _privateConstructorUsedError;
  int get ageDifference => throw _privateConstructorUsedError;

  /// Serializes this HealthspanHistoryPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthspanHistoryPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthspanHistoryPointCopyWith<HealthspanHistoryPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthspanHistoryPointCopyWith<$Res> {
  factory $HealthspanHistoryPointCopyWith(
    HealthspanHistoryPoint value,
    $Res Function(HealthspanHistoryPoint) then,
  ) = _$HealthspanHistoryPointCopyWithImpl<$Res, HealthspanHistoryPoint>;
  @useResult
  $Res call({DateTime calculatedAt, int biologicalAge, int ageDifference});
}

/// @nodoc
class _$HealthspanHistoryPointCopyWithImpl<
  $Res,
  $Val extends HealthspanHistoryPoint
>
    implements $HealthspanHistoryPointCopyWith<$Res> {
  _$HealthspanHistoryPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthspanHistoryPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculatedAt = null,
    Object? biologicalAge = null,
    Object? ageDifference = null,
  }) {
    return _then(
      _value.copyWith(
            calculatedAt: null == calculatedAt
                ? _value.calculatedAt
                : calculatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            biologicalAge: null == biologicalAge
                ? _value.biologicalAge
                : biologicalAge // ignore: cast_nullable_to_non_nullable
                      as int,
            ageDifference: null == ageDifference
                ? _value.ageDifference
                : ageDifference // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthspanHistoryPointImplCopyWith<$Res>
    implements $HealthspanHistoryPointCopyWith<$Res> {
  factory _$$HealthspanHistoryPointImplCopyWith(
    _$HealthspanHistoryPointImpl value,
    $Res Function(_$HealthspanHistoryPointImpl) then,
  ) = __$$HealthspanHistoryPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime calculatedAt, int biologicalAge, int ageDifference});
}

/// @nodoc
class __$$HealthspanHistoryPointImplCopyWithImpl<$Res>
    extends
        _$HealthspanHistoryPointCopyWithImpl<$Res, _$HealthspanHistoryPointImpl>
    implements _$$HealthspanHistoryPointImplCopyWith<$Res> {
  __$$HealthspanHistoryPointImplCopyWithImpl(
    _$HealthspanHistoryPointImpl _value,
    $Res Function(_$HealthspanHistoryPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthspanHistoryPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculatedAt = null,
    Object? biologicalAge = null,
    Object? ageDifference = null,
  }) {
    return _then(
      _$HealthspanHistoryPointImpl(
        calculatedAt: null == calculatedAt
            ? _value.calculatedAt
            : calculatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        biologicalAge: null == biologicalAge
            ? _value.biologicalAge
            : biologicalAge // ignore: cast_nullable_to_non_nullable
                  as int,
        ageDifference: null == ageDifference
            ? _value.ageDifference
            : ageDifference // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthspanHistoryPointImpl implements _HealthspanHistoryPoint {
  const _$HealthspanHistoryPointImpl({
    required this.calculatedAt,
    required this.biologicalAge,
    required this.ageDifference,
  });

  factory _$HealthspanHistoryPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthspanHistoryPointImplFromJson(json);

  @override
  final DateTime calculatedAt;
  @override
  final int biologicalAge;
  @override
  final int ageDifference;

  @override
  String toString() {
    return 'HealthspanHistoryPoint(calculatedAt: $calculatedAt, biologicalAge: $biologicalAge, ageDifference: $ageDifference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthspanHistoryPointImpl &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt) &&
            (identical(other.biologicalAge, biologicalAge) ||
                other.biologicalAge == biologicalAge) &&
            (identical(other.ageDifference, ageDifference) ||
                other.ageDifference == ageDifference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, calculatedAt, biologicalAge, ageDifference);

  /// Create a copy of HealthspanHistoryPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthspanHistoryPointImplCopyWith<_$HealthspanHistoryPointImpl>
  get copyWith =>
      __$$HealthspanHistoryPointImplCopyWithImpl<_$HealthspanHistoryPointImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthspanHistoryPointImplToJson(this);
  }
}

abstract class _HealthspanHistoryPoint implements HealthspanHistoryPoint {
  const factory _HealthspanHistoryPoint({
    required final DateTime calculatedAt,
    required final int biologicalAge,
    required final int ageDifference,
  }) = _$HealthspanHistoryPointImpl;

  factory _HealthspanHistoryPoint.fromJson(Map<String, dynamic> json) =
      _$HealthspanHistoryPointImpl.fromJson;

  @override
  DateTime get calculatedAt;
  @override
  int get biologicalAge;
  @override
  int get ageDifference;

  /// Create a copy of HealthspanHistoryPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthspanHistoryPointImplCopyWith<_$HealthspanHistoryPointImpl>
  get copyWith => throw _privateConstructorUsedError;
}
