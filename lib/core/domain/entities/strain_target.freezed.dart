// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strain_target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StrainTarget _$StrainTargetFromJson(Map<String, dynamic> json) {
  return _StrainTarget.fromJson(json);
}

/// @nodoc
mixin _$StrainTarget {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Recovery score used to calculate target
  int get recoveryScore => throw _privateConstructorUsedError;

  /// Minimum recommended strain for the day
  double get minStrain => throw _privateConstructorUsedError;

  /// Maximum recommended strain for the day
  double get maxStrain => throw _privateConstructorUsedError;

  /// Optimal strain target (middle of range)
  double get optimalStrain => throw _privateConstructorUsedError;

  /// Current strain achieved so far
  double get currentStrain => throw _privateConstructorUsedError;

  /// Whether target has been met
  bool get targetMet => throw _privateConstructorUsedError;

  /// Suggested workout intensity (1-5)
  StrainIntensity get suggestedIntensity => throw _privateConstructorUsedError;

  /// Recommendation message
  String get recommendation => throw _privateConstructorUsedError;

  /// Arabic recommendation message
  String get recommendationAr => throw _privateConstructorUsedError;

  /// Detailed guidance
  String? get guidance => throw _privateConstructorUsedError;

  /// Arabic detailed guidance
  String? get guidanceAr => throw _privateConstructorUsedError;

  /// Serializes this StrainTarget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrainTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrainTargetCopyWith<StrainTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrainTargetCopyWith<$Res> {
  factory $StrainTargetCopyWith(
    StrainTarget value,
    $Res Function(StrainTarget) then,
  ) = _$StrainTargetCopyWithImpl<$Res, StrainTarget>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime calculatedAt,
    int recoveryScore,
    double minStrain,
    double maxStrain,
    double optimalStrain,
    double currentStrain,
    bool targetMet,
    StrainIntensity suggestedIntensity,
    String recommendation,
    String recommendationAr,
    String? guidance,
    String? guidanceAr,
  });
}

/// @nodoc
class _$StrainTargetCopyWithImpl<$Res, $Val extends StrainTarget>
    implements $StrainTargetCopyWith<$Res> {
  _$StrainTargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrainTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? calculatedAt = null,
    Object? recoveryScore = null,
    Object? minStrain = null,
    Object? maxStrain = null,
    Object? optimalStrain = null,
    Object? currentStrain = null,
    Object? targetMet = null,
    Object? suggestedIntensity = null,
    Object? recommendation = null,
    Object? recommendationAr = null,
    Object? guidance = freezed,
    Object? guidanceAr = freezed,
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
            recoveryScore: null == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int,
            minStrain: null == minStrain
                ? _value.minStrain
                : minStrain // ignore: cast_nullable_to_non_nullable
                      as double,
            maxStrain: null == maxStrain
                ? _value.maxStrain
                : maxStrain // ignore: cast_nullable_to_non_nullable
                      as double,
            optimalStrain: null == optimalStrain
                ? _value.optimalStrain
                : optimalStrain // ignore: cast_nullable_to_non_nullable
                      as double,
            currentStrain: null == currentStrain
                ? _value.currentStrain
                : currentStrain // ignore: cast_nullable_to_non_nullable
                      as double,
            targetMet: null == targetMet
                ? _value.targetMet
                : targetMet // ignore: cast_nullable_to_non_nullable
                      as bool,
            suggestedIntensity: null == suggestedIntensity
                ? _value.suggestedIntensity
                : suggestedIntensity // ignore: cast_nullable_to_non_nullable
                      as StrainIntensity,
            recommendation: null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as String,
            recommendationAr: null == recommendationAr
                ? _value.recommendationAr
                : recommendationAr // ignore: cast_nullable_to_non_nullable
                      as String,
            guidance: freezed == guidance
                ? _value.guidance
                : guidance // ignore: cast_nullable_to_non_nullable
                      as String?,
            guidanceAr: freezed == guidanceAr
                ? _value.guidanceAr
                : guidanceAr // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StrainTargetImplCopyWith<$Res>
    implements $StrainTargetCopyWith<$Res> {
  factory _$$StrainTargetImplCopyWith(
    _$StrainTargetImpl value,
    $Res Function(_$StrainTargetImpl) then,
  ) = __$$StrainTargetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime calculatedAt,
    int recoveryScore,
    double minStrain,
    double maxStrain,
    double optimalStrain,
    double currentStrain,
    bool targetMet,
    StrainIntensity suggestedIntensity,
    String recommendation,
    String recommendationAr,
    String? guidance,
    String? guidanceAr,
  });
}

/// @nodoc
class __$$StrainTargetImplCopyWithImpl<$Res>
    extends _$StrainTargetCopyWithImpl<$Res, _$StrainTargetImpl>
    implements _$$StrainTargetImplCopyWith<$Res> {
  __$$StrainTargetImplCopyWithImpl(
    _$StrainTargetImpl _value,
    $Res Function(_$StrainTargetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StrainTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? calculatedAt = null,
    Object? recoveryScore = null,
    Object? minStrain = null,
    Object? maxStrain = null,
    Object? optimalStrain = null,
    Object? currentStrain = null,
    Object? targetMet = null,
    Object? suggestedIntensity = null,
    Object? recommendation = null,
    Object? recommendationAr = null,
    Object? guidance = freezed,
    Object? guidanceAr = freezed,
  }) {
    return _then(
      _$StrainTargetImpl(
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
        recoveryScore: null == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as int,
        minStrain: null == minStrain
            ? _value.minStrain
            : minStrain // ignore: cast_nullable_to_non_nullable
                  as double,
        maxStrain: null == maxStrain
            ? _value.maxStrain
            : maxStrain // ignore: cast_nullable_to_non_nullable
                  as double,
        optimalStrain: null == optimalStrain
            ? _value.optimalStrain
            : optimalStrain // ignore: cast_nullable_to_non_nullable
                  as double,
        currentStrain: null == currentStrain
            ? _value.currentStrain
            : currentStrain // ignore: cast_nullable_to_non_nullable
                  as double,
        targetMet: null == targetMet
            ? _value.targetMet
            : targetMet // ignore: cast_nullable_to_non_nullable
                  as bool,
        suggestedIntensity: null == suggestedIntensity
            ? _value.suggestedIntensity
            : suggestedIntensity // ignore: cast_nullable_to_non_nullable
                  as StrainIntensity,
        recommendation: null == recommendation
            ? _value.recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as String,
        recommendationAr: null == recommendationAr
            ? _value.recommendationAr
            : recommendationAr // ignore: cast_nullable_to_non_nullable
                  as String,
        guidance: freezed == guidance
            ? _value.guidance
            : guidance // ignore: cast_nullable_to_non_nullable
                  as String?,
        guidanceAr: freezed == guidanceAr
            ? _value.guidanceAr
            : guidanceAr // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StrainTargetImpl extends _StrainTarget {
  const _$StrainTargetImpl({
    required this.id,
    required this.date,
    required this.calculatedAt,
    required this.recoveryScore,
    required this.minStrain,
    required this.maxStrain,
    required this.optimalStrain,
    this.currentStrain = 0.0,
    this.targetMet = false,
    required this.suggestedIntensity,
    required this.recommendation,
    required this.recommendationAr,
    this.guidance,
    this.guidanceAr,
  }) : super._();

  factory _$StrainTargetImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrainTargetImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime calculatedAt;

  /// Recovery score used to calculate target
  @override
  final int recoveryScore;

  /// Minimum recommended strain for the day
  @override
  final double minStrain;

  /// Maximum recommended strain for the day
  @override
  final double maxStrain;

  /// Optimal strain target (middle of range)
  @override
  final double optimalStrain;

  /// Current strain achieved so far
  @override
  @JsonKey()
  final double currentStrain;

  /// Whether target has been met
  @override
  @JsonKey()
  final bool targetMet;

  /// Suggested workout intensity (1-5)
  @override
  final StrainIntensity suggestedIntensity;

  /// Recommendation message
  @override
  final String recommendation;

  /// Arabic recommendation message
  @override
  final String recommendationAr;

  /// Detailed guidance
  @override
  final String? guidance;

  /// Arabic detailed guidance
  @override
  final String? guidanceAr;

  @override
  String toString() {
    return 'StrainTarget(id: $id, date: $date, calculatedAt: $calculatedAt, recoveryScore: $recoveryScore, minStrain: $minStrain, maxStrain: $maxStrain, optimalStrain: $optimalStrain, currentStrain: $currentStrain, targetMet: $targetMet, suggestedIntensity: $suggestedIntensity, recommendation: $recommendation, recommendationAr: $recommendationAr, guidance: $guidance, guidanceAr: $guidanceAr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrainTargetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.minStrain, minStrain) ||
                other.minStrain == minStrain) &&
            (identical(other.maxStrain, maxStrain) ||
                other.maxStrain == maxStrain) &&
            (identical(other.optimalStrain, optimalStrain) ||
                other.optimalStrain == optimalStrain) &&
            (identical(other.currentStrain, currentStrain) ||
                other.currentStrain == currentStrain) &&
            (identical(other.targetMet, targetMet) ||
                other.targetMet == targetMet) &&
            (identical(other.suggestedIntensity, suggestedIntensity) ||
                other.suggestedIntensity == suggestedIntensity) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.recommendationAr, recommendationAr) ||
                other.recommendationAr == recommendationAr) &&
            (identical(other.guidance, guidance) ||
                other.guidance == guidance) &&
            (identical(other.guidanceAr, guidanceAr) ||
                other.guidanceAr == guidanceAr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    calculatedAt,
    recoveryScore,
    minStrain,
    maxStrain,
    optimalStrain,
    currentStrain,
    targetMet,
    suggestedIntensity,
    recommendation,
    recommendationAr,
    guidance,
    guidanceAr,
  );

  /// Create a copy of StrainTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrainTargetImplCopyWith<_$StrainTargetImpl> get copyWith =>
      __$$StrainTargetImplCopyWithImpl<_$StrainTargetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrainTargetImplToJson(this);
  }
}

abstract class _StrainTarget extends StrainTarget {
  const factory _StrainTarget({
    required final String id,
    required final DateTime date,
    required final DateTime calculatedAt,
    required final int recoveryScore,
    required final double minStrain,
    required final double maxStrain,
    required final double optimalStrain,
    final double currentStrain,
    final bool targetMet,
    required final StrainIntensity suggestedIntensity,
    required final String recommendation,
    required final String recommendationAr,
    final String? guidance,
    final String? guidanceAr,
  }) = _$StrainTargetImpl;
  const _StrainTarget._() : super._();

  factory _StrainTarget.fromJson(Map<String, dynamic> json) =
      _$StrainTargetImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get calculatedAt;

  /// Recovery score used to calculate target
  @override
  int get recoveryScore;

  /// Minimum recommended strain for the day
  @override
  double get minStrain;

  /// Maximum recommended strain for the day
  @override
  double get maxStrain;

  /// Optimal strain target (middle of range)
  @override
  double get optimalStrain;

  /// Current strain achieved so far
  @override
  double get currentStrain;

  /// Whether target has been met
  @override
  bool get targetMet;

  /// Suggested workout intensity (1-5)
  @override
  StrainIntensity get suggestedIntensity;

  /// Recommendation message
  @override
  String get recommendation;

  /// Arabic recommendation message
  @override
  String get recommendationAr;

  /// Detailed guidance
  @override
  String? get guidance;

  /// Arabic detailed guidance
  @override
  String? get guidanceAr;

  /// Create a copy of StrainTarget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrainTargetImplCopyWith<_$StrainTargetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
