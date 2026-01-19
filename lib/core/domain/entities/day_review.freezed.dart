// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DayReview _$DayReviewFromJson(Map<String, dynamic> json) {
  return _DayReview.fromJson(json);
}

/// @nodoc
mixin _$DayReview {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Strain performance
  StrainReview get strainReview => throw _privateConstructorUsedError;

  /// Sleep review from last night (context)
  SleepReview get sleepReview => throw _privateConstructorUsedError;

  /// Nutrition review
  NutritionReview? get nutritionReview => throw _privateConstructorUsedError;

  /// Predicted recovery for tomorrow
  RecoveryPrediction get recoveryPrediction =>
      throw _privateConstructorUsedError;

  /// Top behavior impacts
  List<DayBehaviorImpact> get behaviorImpacts =>
      throw _privateConstructorUsedError;

  /// What went well
  List<String> get whatWentWell => throw _privateConstructorUsedError;

  /// Arabic what went well
  List<String> get whatWentWellAr => throw _privateConstructorUsedError;

  /// Areas to improve
  List<String> get areasToImprove => throw _privateConstructorUsedError;

  /// Arabic areas to improve
  List<String> get areasToImproveAr => throw _privateConstructorUsedError;

  /// Sleep recommendation for tonight
  double get sleepRecommendationHours => throw _privateConstructorUsedError;

  /// Recommended bedtime
  DateTime? get recommendedBedtime => throw _privateConstructorUsedError;

  /// AI-generated summary
  String? get aiSummary => throw _privateConstructorUsedError;

  /// Arabic AI summary
  String? get aiSummaryAr => throw _privateConstructorUsedError;

  /// Overall day score (0-100)
  int get overallScore => throw _privateConstructorUsedError;

  /// Whether this is AI-generated
  bool get isAiGenerated => throw _privateConstructorUsedError;

  /// Confidence score (0-100)
  int get confidence => throw _privateConstructorUsedError;

  /// Serializes this DayReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DayReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayReviewCopyWith<DayReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayReviewCopyWith<$Res> {
  factory $DayReviewCopyWith(DayReview value, $Res Function(DayReview) then) =
      _$DayReviewCopyWithImpl<$Res, DayReview>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime generatedAt,
    StrainReview strainReview,
    SleepReview sleepReview,
    NutritionReview? nutritionReview,
    RecoveryPrediction recoveryPrediction,
    List<DayBehaviorImpact> behaviorImpacts,
    List<String> whatWentWell,
    List<String> whatWentWellAr,
    List<String> areasToImprove,
    List<String> areasToImproveAr,
    double sleepRecommendationHours,
    DateTime? recommendedBedtime,
    String? aiSummary,
    String? aiSummaryAr,
    int overallScore,
    bool isAiGenerated,
    int confidence,
  });

  $StrainReviewCopyWith<$Res> get strainReview;
  $SleepReviewCopyWith<$Res> get sleepReview;
  $NutritionReviewCopyWith<$Res>? get nutritionReview;
  $RecoveryPredictionCopyWith<$Res> get recoveryPrediction;
}

/// @nodoc
class _$DayReviewCopyWithImpl<$Res, $Val extends DayReview>
    implements $DayReviewCopyWith<$Res> {
  _$DayReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? generatedAt = null,
    Object? strainReview = null,
    Object? sleepReview = null,
    Object? nutritionReview = freezed,
    Object? recoveryPrediction = null,
    Object? behaviorImpacts = null,
    Object? whatWentWell = null,
    Object? whatWentWellAr = null,
    Object? areasToImprove = null,
    Object? areasToImproveAr = null,
    Object? sleepRecommendationHours = null,
    Object? recommendedBedtime = freezed,
    Object? aiSummary = freezed,
    Object? aiSummaryAr = freezed,
    Object? overallScore = null,
    Object? isAiGenerated = null,
    Object? confidence = null,
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
            strainReview: null == strainReview
                ? _value.strainReview
                : strainReview // ignore: cast_nullable_to_non_nullable
                      as StrainReview,
            sleepReview: null == sleepReview
                ? _value.sleepReview
                : sleepReview // ignore: cast_nullable_to_non_nullable
                      as SleepReview,
            nutritionReview: freezed == nutritionReview
                ? _value.nutritionReview
                : nutritionReview // ignore: cast_nullable_to_non_nullable
                      as NutritionReview?,
            recoveryPrediction: null == recoveryPrediction
                ? _value.recoveryPrediction
                : recoveryPrediction // ignore: cast_nullable_to_non_nullable
                      as RecoveryPrediction,
            behaviorImpacts: null == behaviorImpacts
                ? _value.behaviorImpacts
                : behaviorImpacts // ignore: cast_nullable_to_non_nullable
                      as List<DayBehaviorImpact>,
            whatWentWell: null == whatWentWell
                ? _value.whatWentWell
                : whatWentWell // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            whatWentWellAr: null == whatWentWellAr
                ? _value.whatWentWellAr
                : whatWentWellAr // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            areasToImprove: null == areasToImprove
                ? _value.areasToImprove
                : areasToImprove // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            areasToImproveAr: null == areasToImproveAr
                ? _value.areasToImproveAr
                : areasToImproveAr // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            sleepRecommendationHours: null == sleepRecommendationHours
                ? _value.sleepRecommendationHours
                : sleepRecommendationHours // ignore: cast_nullable_to_non_nullable
                      as double,
            recommendedBedtime: freezed == recommendedBedtime
                ? _value.recommendedBedtime
                : recommendedBedtime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            aiSummary: freezed == aiSummary
                ? _value.aiSummary
                : aiSummary // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiSummaryAr: freezed == aiSummaryAr
                ? _value.aiSummaryAr
                : aiSummaryAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            overallScore: null == overallScore
                ? _value.overallScore
                : overallScore // ignore: cast_nullable_to_non_nullable
                      as int,
            isAiGenerated: null == isAiGenerated
                ? _value.isAiGenerated
                : isAiGenerated // ignore: cast_nullable_to_non_nullable
                      as bool,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of DayReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StrainReviewCopyWith<$Res> get strainReview {
    return $StrainReviewCopyWith<$Res>(_value.strainReview, (value) {
      return _then(_value.copyWith(strainReview: value) as $Val);
    });
  }

  /// Create a copy of DayReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepReviewCopyWith<$Res> get sleepReview {
    return $SleepReviewCopyWith<$Res>(_value.sleepReview, (value) {
      return _then(_value.copyWith(sleepReview: value) as $Val);
    });
  }

  /// Create a copy of DayReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionReviewCopyWith<$Res>? get nutritionReview {
    if (_value.nutritionReview == null) {
      return null;
    }

    return $NutritionReviewCopyWith<$Res>(_value.nutritionReview!, (value) {
      return _then(_value.copyWith(nutritionReview: value) as $Val);
    });
  }

  /// Create a copy of DayReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecoveryPredictionCopyWith<$Res> get recoveryPrediction {
    return $RecoveryPredictionCopyWith<$Res>(_value.recoveryPrediction, (
      value,
    ) {
      return _then(_value.copyWith(recoveryPrediction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DayReviewImplCopyWith<$Res>
    implements $DayReviewCopyWith<$Res> {
  factory _$$DayReviewImplCopyWith(
    _$DayReviewImpl value,
    $Res Function(_$DayReviewImpl) then,
  ) = __$$DayReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime generatedAt,
    StrainReview strainReview,
    SleepReview sleepReview,
    NutritionReview? nutritionReview,
    RecoveryPrediction recoveryPrediction,
    List<DayBehaviorImpact> behaviorImpacts,
    List<String> whatWentWell,
    List<String> whatWentWellAr,
    List<String> areasToImprove,
    List<String> areasToImproveAr,
    double sleepRecommendationHours,
    DateTime? recommendedBedtime,
    String? aiSummary,
    String? aiSummaryAr,
    int overallScore,
    bool isAiGenerated,
    int confidence,
  });

  @override
  $StrainReviewCopyWith<$Res> get strainReview;
  @override
  $SleepReviewCopyWith<$Res> get sleepReview;
  @override
  $NutritionReviewCopyWith<$Res>? get nutritionReview;
  @override
  $RecoveryPredictionCopyWith<$Res> get recoveryPrediction;
}

/// @nodoc
class __$$DayReviewImplCopyWithImpl<$Res>
    extends _$DayReviewCopyWithImpl<$Res, _$DayReviewImpl>
    implements _$$DayReviewImplCopyWith<$Res> {
  __$$DayReviewImplCopyWithImpl(
    _$DayReviewImpl _value,
    $Res Function(_$DayReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? generatedAt = null,
    Object? strainReview = null,
    Object? sleepReview = null,
    Object? nutritionReview = freezed,
    Object? recoveryPrediction = null,
    Object? behaviorImpacts = null,
    Object? whatWentWell = null,
    Object? whatWentWellAr = null,
    Object? areasToImprove = null,
    Object? areasToImproveAr = null,
    Object? sleepRecommendationHours = null,
    Object? recommendedBedtime = freezed,
    Object? aiSummary = freezed,
    Object? aiSummaryAr = freezed,
    Object? overallScore = null,
    Object? isAiGenerated = null,
    Object? confidence = null,
  }) {
    return _then(
      _$DayReviewImpl(
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
        strainReview: null == strainReview
            ? _value.strainReview
            : strainReview // ignore: cast_nullable_to_non_nullable
                  as StrainReview,
        sleepReview: null == sleepReview
            ? _value.sleepReview
            : sleepReview // ignore: cast_nullable_to_non_nullable
                  as SleepReview,
        nutritionReview: freezed == nutritionReview
            ? _value.nutritionReview
            : nutritionReview // ignore: cast_nullable_to_non_nullable
                  as NutritionReview?,
        recoveryPrediction: null == recoveryPrediction
            ? _value.recoveryPrediction
            : recoveryPrediction // ignore: cast_nullable_to_non_nullable
                  as RecoveryPrediction,
        behaviorImpacts: null == behaviorImpacts
            ? _value._behaviorImpacts
            : behaviorImpacts // ignore: cast_nullable_to_non_nullable
                  as List<DayBehaviorImpact>,
        whatWentWell: null == whatWentWell
            ? _value._whatWentWell
            : whatWentWell // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        whatWentWellAr: null == whatWentWellAr
            ? _value._whatWentWellAr
            : whatWentWellAr // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        areasToImprove: null == areasToImprove
            ? _value._areasToImprove
            : areasToImprove // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        areasToImproveAr: null == areasToImproveAr
            ? _value._areasToImproveAr
            : areasToImproveAr // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        sleepRecommendationHours: null == sleepRecommendationHours
            ? _value.sleepRecommendationHours
            : sleepRecommendationHours // ignore: cast_nullable_to_non_nullable
                  as double,
        recommendedBedtime: freezed == recommendedBedtime
            ? _value.recommendedBedtime
            : recommendedBedtime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        aiSummary: freezed == aiSummary
            ? _value.aiSummary
            : aiSummary // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiSummaryAr: freezed == aiSummaryAr
            ? _value.aiSummaryAr
            : aiSummaryAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        overallScore: null == overallScore
            ? _value.overallScore
            : overallScore // ignore: cast_nullable_to_non_nullable
                  as int,
        isAiGenerated: null == isAiGenerated
            ? _value.isAiGenerated
            : isAiGenerated // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$DayReviewImpl extends _DayReview {
  const _$DayReviewImpl({
    required this.id,
    required this.date,
    required this.generatedAt,
    required this.strainReview,
    required this.sleepReview,
    this.nutritionReview,
    required this.recoveryPrediction,
    final List<DayBehaviorImpact> behaviorImpacts = const [],
    final List<String> whatWentWell = const [],
    final List<String> whatWentWellAr = const [],
    final List<String> areasToImprove = const [],
    final List<String> areasToImproveAr = const [],
    required this.sleepRecommendationHours,
    this.recommendedBedtime,
    this.aiSummary,
    this.aiSummaryAr,
    required this.overallScore,
    this.isAiGenerated = false,
    this.confidence = 70,
  }) : _behaviorImpacts = behaviorImpacts,
       _whatWentWell = whatWentWell,
       _whatWentWellAr = whatWentWellAr,
       _areasToImprove = areasToImprove,
       _areasToImproveAr = areasToImproveAr,
       super._();

  factory _$DayReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayReviewImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime generatedAt;

  /// Strain performance
  @override
  final StrainReview strainReview;

  /// Sleep review from last night (context)
  @override
  final SleepReview sleepReview;

  /// Nutrition review
  @override
  final NutritionReview? nutritionReview;

  /// Predicted recovery for tomorrow
  @override
  final RecoveryPrediction recoveryPrediction;

  /// Top behavior impacts
  final List<DayBehaviorImpact> _behaviorImpacts;

  /// Top behavior impacts
  @override
  @JsonKey()
  List<DayBehaviorImpact> get behaviorImpacts {
    if (_behaviorImpacts is EqualUnmodifiableListView) return _behaviorImpacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_behaviorImpacts);
  }

  /// What went well
  final List<String> _whatWentWell;

  /// What went well
  @override
  @JsonKey()
  List<String> get whatWentWell {
    if (_whatWentWell is EqualUnmodifiableListView) return _whatWentWell;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whatWentWell);
  }

  /// Arabic what went well
  final List<String> _whatWentWellAr;

  /// Arabic what went well
  @override
  @JsonKey()
  List<String> get whatWentWellAr {
    if (_whatWentWellAr is EqualUnmodifiableListView) return _whatWentWellAr;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whatWentWellAr);
  }

  /// Areas to improve
  final List<String> _areasToImprove;

  /// Areas to improve
  @override
  @JsonKey()
  List<String> get areasToImprove {
    if (_areasToImprove is EqualUnmodifiableListView) return _areasToImprove;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_areasToImprove);
  }

  /// Arabic areas to improve
  final List<String> _areasToImproveAr;

  /// Arabic areas to improve
  @override
  @JsonKey()
  List<String> get areasToImproveAr {
    if (_areasToImproveAr is EqualUnmodifiableListView)
      return _areasToImproveAr;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_areasToImproveAr);
  }

  /// Sleep recommendation for tonight
  @override
  final double sleepRecommendationHours;

  /// Recommended bedtime
  @override
  final DateTime? recommendedBedtime;

  /// AI-generated summary
  @override
  final String? aiSummary;

  /// Arabic AI summary
  @override
  final String? aiSummaryAr;

  /// Overall day score (0-100)
  @override
  final int overallScore;

  /// Whether this is AI-generated
  @override
  @JsonKey()
  final bool isAiGenerated;

  /// Confidence score (0-100)
  @override
  @JsonKey()
  final int confidence;

  @override
  String toString() {
    return 'DayReview(id: $id, date: $date, generatedAt: $generatedAt, strainReview: $strainReview, sleepReview: $sleepReview, nutritionReview: $nutritionReview, recoveryPrediction: $recoveryPrediction, behaviorImpacts: $behaviorImpacts, whatWentWell: $whatWentWell, whatWentWellAr: $whatWentWellAr, areasToImprove: $areasToImprove, areasToImproveAr: $areasToImproveAr, sleepRecommendationHours: $sleepRecommendationHours, recommendedBedtime: $recommendedBedtime, aiSummary: $aiSummary, aiSummaryAr: $aiSummaryAr, overallScore: $overallScore, isAiGenerated: $isAiGenerated, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.strainReview, strainReview) ||
                other.strainReview == strainReview) &&
            (identical(other.sleepReview, sleepReview) ||
                other.sleepReview == sleepReview) &&
            (identical(other.nutritionReview, nutritionReview) ||
                other.nutritionReview == nutritionReview) &&
            (identical(other.recoveryPrediction, recoveryPrediction) ||
                other.recoveryPrediction == recoveryPrediction) &&
            const DeepCollectionEquality().equals(
              other._behaviorImpacts,
              _behaviorImpacts,
            ) &&
            const DeepCollectionEquality().equals(
              other._whatWentWell,
              _whatWentWell,
            ) &&
            const DeepCollectionEquality().equals(
              other._whatWentWellAr,
              _whatWentWellAr,
            ) &&
            const DeepCollectionEquality().equals(
              other._areasToImprove,
              _areasToImprove,
            ) &&
            const DeepCollectionEquality().equals(
              other._areasToImproveAr,
              _areasToImproveAr,
            ) &&
            (identical(
                  other.sleepRecommendationHours,
                  sleepRecommendationHours,
                ) ||
                other.sleepRecommendationHours == sleepRecommendationHours) &&
            (identical(other.recommendedBedtime, recommendedBedtime) ||
                other.recommendedBedtime == recommendedBedtime) &&
            (identical(other.aiSummary, aiSummary) ||
                other.aiSummary == aiSummary) &&
            (identical(other.aiSummaryAr, aiSummaryAr) ||
                other.aiSummaryAr == aiSummaryAr) &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.isAiGenerated, isAiGenerated) ||
                other.isAiGenerated == isAiGenerated) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    date,
    generatedAt,
    strainReview,
    sleepReview,
    nutritionReview,
    recoveryPrediction,
    const DeepCollectionEquality().hash(_behaviorImpacts),
    const DeepCollectionEquality().hash(_whatWentWell),
    const DeepCollectionEquality().hash(_whatWentWellAr),
    const DeepCollectionEquality().hash(_areasToImprove),
    const DeepCollectionEquality().hash(_areasToImproveAr),
    sleepRecommendationHours,
    recommendedBedtime,
    aiSummary,
    aiSummaryAr,
    overallScore,
    isAiGenerated,
    confidence,
  ]);

  /// Create a copy of DayReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayReviewImplCopyWith<_$DayReviewImpl> get copyWith =>
      __$$DayReviewImplCopyWithImpl<_$DayReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayReviewImplToJson(this);
  }
}

abstract class _DayReview extends DayReview {
  const factory _DayReview({
    required final String id,
    required final DateTime date,
    required final DateTime generatedAt,
    required final StrainReview strainReview,
    required final SleepReview sleepReview,
    final NutritionReview? nutritionReview,
    required final RecoveryPrediction recoveryPrediction,
    final List<DayBehaviorImpact> behaviorImpacts,
    final List<String> whatWentWell,
    final List<String> whatWentWellAr,
    final List<String> areasToImprove,
    final List<String> areasToImproveAr,
    required final double sleepRecommendationHours,
    final DateTime? recommendedBedtime,
    final String? aiSummary,
    final String? aiSummaryAr,
    required final int overallScore,
    final bool isAiGenerated,
    final int confidence,
  }) = _$DayReviewImpl;
  const _DayReview._() : super._();

  factory _DayReview.fromJson(Map<String, dynamic> json) =
      _$DayReviewImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get generatedAt;

  /// Strain performance
  @override
  StrainReview get strainReview;

  /// Sleep review from last night (context)
  @override
  SleepReview get sleepReview;

  /// Nutrition review
  @override
  NutritionReview? get nutritionReview;

  /// Predicted recovery for tomorrow
  @override
  RecoveryPrediction get recoveryPrediction;

  /// Top behavior impacts
  @override
  List<DayBehaviorImpact> get behaviorImpacts;

  /// What went well
  @override
  List<String> get whatWentWell;

  /// Arabic what went well
  @override
  List<String> get whatWentWellAr;

  /// Areas to improve
  @override
  List<String> get areasToImprove;

  /// Arabic areas to improve
  @override
  List<String> get areasToImproveAr;

  /// Sleep recommendation for tonight
  @override
  double get sleepRecommendationHours;

  /// Recommended bedtime
  @override
  DateTime? get recommendedBedtime;

  /// AI-generated summary
  @override
  String? get aiSummary;

  /// Arabic AI summary
  @override
  String? get aiSummaryAr;

  /// Overall day score (0-100)
  @override
  int get overallScore;

  /// Whether this is AI-generated
  @override
  bool get isAiGenerated;

  /// Confidence score (0-100)
  @override
  int get confidence;

  /// Create a copy of DayReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayReviewImplCopyWith<_$DayReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StrainReview _$StrainReviewFromJson(Map<String, dynamic> json) {
  return _StrainReview.fromJson(json);
}

/// @nodoc
mixin _$StrainReview {
  /// Strain achieved today
  double get strainAchieved => throw _privateConstructorUsedError;

  /// Target strain for today
  double get strainTarget => throw _privateConstructorUsedError;

  /// Was target met?
  bool get targetMet => throw _privateConstructorUsedError;

  /// Was strain in optimal range?
  bool get wasOptimal => throw _privateConstructorUsedError;

  /// Strain breakdown by activity
  List<StrainContribution> get contributions =>
      throw _privateConstructorUsedError;

  /// Total active minutes
  int get totalActiveMinutes => throw _privateConstructorUsedError;

  /// Calories burned
  int? get caloriesBurned => throw _privateConstructorUsedError;

  /// Serializes this StrainReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrainReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrainReviewCopyWith<StrainReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrainReviewCopyWith<$Res> {
  factory $StrainReviewCopyWith(
    StrainReview value,
    $Res Function(StrainReview) then,
  ) = _$StrainReviewCopyWithImpl<$Res, StrainReview>;
  @useResult
  $Res call({
    double strainAchieved,
    double strainTarget,
    bool targetMet,
    bool wasOptimal,
    List<StrainContribution> contributions,
    int totalActiveMinutes,
    int? caloriesBurned,
  });
}

/// @nodoc
class _$StrainReviewCopyWithImpl<$Res, $Val extends StrainReview>
    implements $StrainReviewCopyWith<$Res> {
  _$StrainReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrainReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strainAchieved = null,
    Object? strainTarget = null,
    Object? targetMet = null,
    Object? wasOptimal = null,
    Object? contributions = null,
    Object? totalActiveMinutes = null,
    Object? caloriesBurned = freezed,
  }) {
    return _then(
      _value.copyWith(
            strainAchieved: null == strainAchieved
                ? _value.strainAchieved
                : strainAchieved // ignore: cast_nullable_to_non_nullable
                      as double,
            strainTarget: null == strainTarget
                ? _value.strainTarget
                : strainTarget // ignore: cast_nullable_to_non_nullable
                      as double,
            targetMet: null == targetMet
                ? _value.targetMet
                : targetMet // ignore: cast_nullable_to_non_nullable
                      as bool,
            wasOptimal: null == wasOptimal
                ? _value.wasOptimal
                : wasOptimal // ignore: cast_nullable_to_non_nullable
                      as bool,
            contributions: null == contributions
                ? _value.contributions
                : contributions // ignore: cast_nullable_to_non_nullable
                      as List<StrainContribution>,
            totalActiveMinutes: null == totalActiveMinutes
                ? _value.totalActiveMinutes
                : totalActiveMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$StrainReviewImplCopyWith<$Res>
    implements $StrainReviewCopyWith<$Res> {
  factory _$$StrainReviewImplCopyWith(
    _$StrainReviewImpl value,
    $Res Function(_$StrainReviewImpl) then,
  ) = __$$StrainReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double strainAchieved,
    double strainTarget,
    bool targetMet,
    bool wasOptimal,
    List<StrainContribution> contributions,
    int totalActiveMinutes,
    int? caloriesBurned,
  });
}

/// @nodoc
class __$$StrainReviewImplCopyWithImpl<$Res>
    extends _$StrainReviewCopyWithImpl<$Res, _$StrainReviewImpl>
    implements _$$StrainReviewImplCopyWith<$Res> {
  __$$StrainReviewImplCopyWithImpl(
    _$StrainReviewImpl _value,
    $Res Function(_$StrainReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StrainReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strainAchieved = null,
    Object? strainTarget = null,
    Object? targetMet = null,
    Object? wasOptimal = null,
    Object? contributions = null,
    Object? totalActiveMinutes = null,
    Object? caloriesBurned = freezed,
  }) {
    return _then(
      _$StrainReviewImpl(
        strainAchieved: null == strainAchieved
            ? _value.strainAchieved
            : strainAchieved // ignore: cast_nullable_to_non_nullable
                  as double,
        strainTarget: null == strainTarget
            ? _value.strainTarget
            : strainTarget // ignore: cast_nullable_to_non_nullable
                  as double,
        targetMet: null == targetMet
            ? _value.targetMet
            : targetMet // ignore: cast_nullable_to_non_nullable
                  as bool,
        wasOptimal: null == wasOptimal
            ? _value.wasOptimal
            : wasOptimal // ignore: cast_nullable_to_non_nullable
                  as bool,
        contributions: null == contributions
            ? _value._contributions
            : contributions // ignore: cast_nullable_to_non_nullable
                  as List<StrainContribution>,
        totalActiveMinutes: null == totalActiveMinutes
            ? _value.totalActiveMinutes
            : totalActiveMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$StrainReviewImpl extends _StrainReview {
  const _$StrainReviewImpl({
    required this.strainAchieved,
    required this.strainTarget,
    required this.targetMet,
    required this.wasOptimal,
    final List<StrainContribution> contributions = const [],
    required this.totalActiveMinutes,
    this.caloriesBurned,
  }) : _contributions = contributions,
       super._();

  factory _$StrainReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrainReviewImplFromJson(json);

  /// Strain achieved today
  @override
  final double strainAchieved;

  /// Target strain for today
  @override
  final double strainTarget;

  /// Was target met?
  @override
  final bool targetMet;

  /// Was strain in optimal range?
  @override
  final bool wasOptimal;

  /// Strain breakdown by activity
  final List<StrainContribution> _contributions;

  /// Strain breakdown by activity
  @override
  @JsonKey()
  List<StrainContribution> get contributions {
    if (_contributions is EqualUnmodifiableListView) return _contributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contributions);
  }

  /// Total active minutes
  @override
  final int totalActiveMinutes;

  /// Calories burned
  @override
  final int? caloriesBurned;

  @override
  String toString() {
    return 'StrainReview(strainAchieved: $strainAchieved, strainTarget: $strainTarget, targetMet: $targetMet, wasOptimal: $wasOptimal, contributions: $contributions, totalActiveMinutes: $totalActiveMinutes, caloriesBurned: $caloriesBurned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrainReviewImpl &&
            (identical(other.strainAchieved, strainAchieved) ||
                other.strainAchieved == strainAchieved) &&
            (identical(other.strainTarget, strainTarget) ||
                other.strainTarget == strainTarget) &&
            (identical(other.targetMet, targetMet) ||
                other.targetMet == targetMet) &&
            (identical(other.wasOptimal, wasOptimal) ||
                other.wasOptimal == wasOptimal) &&
            const DeepCollectionEquality().equals(
              other._contributions,
              _contributions,
            ) &&
            (identical(other.totalActiveMinutes, totalActiveMinutes) ||
                other.totalActiveMinutes == totalActiveMinutes) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    strainAchieved,
    strainTarget,
    targetMet,
    wasOptimal,
    const DeepCollectionEquality().hash(_contributions),
    totalActiveMinutes,
    caloriesBurned,
  );

  /// Create a copy of StrainReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrainReviewImplCopyWith<_$StrainReviewImpl> get copyWith =>
      __$$StrainReviewImplCopyWithImpl<_$StrainReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrainReviewImplToJson(this);
  }
}

abstract class _StrainReview extends StrainReview {
  const factory _StrainReview({
    required final double strainAchieved,
    required final double strainTarget,
    required final bool targetMet,
    required final bool wasOptimal,
    final List<StrainContribution> contributions,
    required final int totalActiveMinutes,
    final int? caloriesBurned,
  }) = _$StrainReviewImpl;
  const _StrainReview._() : super._();

  factory _StrainReview.fromJson(Map<String, dynamic> json) =
      _$StrainReviewImpl.fromJson;

  /// Strain achieved today
  @override
  double get strainAchieved;

  /// Target strain for today
  @override
  double get strainTarget;

  /// Was target met?
  @override
  bool get targetMet;

  /// Was strain in optimal range?
  @override
  bool get wasOptimal;

  /// Strain breakdown by activity
  @override
  List<StrainContribution> get contributions;

  /// Total active minutes
  @override
  int get totalActiveMinutes;

  /// Calories burned
  @override
  int? get caloriesBurned;

  /// Create a copy of StrainReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrainReviewImplCopyWith<_$StrainReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StrainContribution _$StrainContributionFromJson(Map<String, dynamic> json) {
  return _StrainContribution.fromJson(json);
}

/// @nodoc
mixin _$StrainContribution {
  String get activityType => throw _privateConstructorUsedError;
  String get activityName => throw _privateConstructorUsedError;
  double get strain => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;

  /// Serializes this StrainContribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrainContribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrainContributionCopyWith<StrainContribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrainContributionCopyWith<$Res> {
  factory $StrainContributionCopyWith(
    StrainContribution value,
    $Res Function(StrainContribution) then,
  ) = _$StrainContributionCopyWithImpl<$Res, StrainContribution>;
  @useResult
  $Res call({
    String activityType,
    String activityName,
    double strain,
    int durationMinutes,
    DateTime? startTime,
  });
}

/// @nodoc
class _$StrainContributionCopyWithImpl<$Res, $Val extends StrainContribution>
    implements $StrainContributionCopyWith<$Res> {
  _$StrainContributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrainContribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityType = null,
    Object? activityName = null,
    Object? strain = null,
    Object? durationMinutes = null,
    Object? startTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            activityType: null == activityType
                ? _value.activityType
                : activityType // ignore: cast_nullable_to_non_nullable
                      as String,
            activityName: null == activityName
                ? _value.activityName
                : activityName // ignore: cast_nullable_to_non_nullable
                      as String,
            strain: null == strain
                ? _value.strain
                : strain // ignore: cast_nullable_to_non_nullable
                      as double,
            durationMinutes: null == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            startTime: freezed == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StrainContributionImplCopyWith<$Res>
    implements $StrainContributionCopyWith<$Res> {
  factory _$$StrainContributionImplCopyWith(
    _$StrainContributionImpl value,
    $Res Function(_$StrainContributionImpl) then,
  ) = __$$StrainContributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String activityType,
    String activityName,
    double strain,
    int durationMinutes,
    DateTime? startTime,
  });
}

/// @nodoc
class __$$StrainContributionImplCopyWithImpl<$Res>
    extends _$StrainContributionCopyWithImpl<$Res, _$StrainContributionImpl>
    implements _$$StrainContributionImplCopyWith<$Res> {
  __$$StrainContributionImplCopyWithImpl(
    _$StrainContributionImpl _value,
    $Res Function(_$StrainContributionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StrainContribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityType = null,
    Object? activityName = null,
    Object? strain = null,
    Object? durationMinutes = null,
    Object? startTime = freezed,
  }) {
    return _then(
      _$StrainContributionImpl(
        activityType: null == activityType
            ? _value.activityType
            : activityType // ignore: cast_nullable_to_non_nullable
                  as String,
        activityName: null == activityName
            ? _value.activityName
            : activityName // ignore: cast_nullable_to_non_nullable
                  as String,
        strain: null == strain
            ? _value.strain
            : strain // ignore: cast_nullable_to_non_nullable
                  as double,
        durationMinutes: null == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        startTime: freezed == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StrainContributionImpl implements _StrainContribution {
  const _$StrainContributionImpl({
    required this.activityType,
    required this.activityName,
    required this.strain,
    required this.durationMinutes,
    this.startTime,
  });

  factory _$StrainContributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrainContributionImplFromJson(json);

  @override
  final String activityType;
  @override
  final String activityName;
  @override
  final double strain;
  @override
  final int durationMinutes;
  @override
  final DateTime? startTime;

  @override
  String toString() {
    return 'StrainContribution(activityType: $activityType, activityName: $activityName, strain: $strain, durationMinutes: $durationMinutes, startTime: $startTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrainContributionImpl &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType) &&
            (identical(other.activityName, activityName) ||
                other.activityName == activityName) &&
            (identical(other.strain, strain) || other.strain == strain) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    activityType,
    activityName,
    strain,
    durationMinutes,
    startTime,
  );

  /// Create a copy of StrainContribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrainContributionImplCopyWith<_$StrainContributionImpl> get copyWith =>
      __$$StrainContributionImplCopyWithImpl<_$StrainContributionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StrainContributionImplToJson(this);
  }
}

abstract class _StrainContribution implements StrainContribution {
  const factory _StrainContribution({
    required final String activityType,
    required final String activityName,
    required final double strain,
    required final int durationMinutes,
    final DateTime? startTime,
  }) = _$StrainContributionImpl;

  factory _StrainContribution.fromJson(Map<String, dynamic> json) =
      _$StrainContributionImpl.fromJson;

  @override
  String get activityType;
  @override
  String get activityName;
  @override
  double get strain;
  @override
  int get durationMinutes;
  @override
  DateTime? get startTime;

  /// Create a copy of StrainContribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrainContributionImplCopyWith<_$StrainContributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SleepReview _$SleepReviewFromJson(Map<String, dynamic> json) {
  return _SleepReview.fromJson(json);
}

/// @nodoc
mixin _$SleepReview {
  /// Hours slept
  double get hoursSlept => throw _privateConstructorUsedError;

  /// Hours needed
  double get hoursNeeded => throw _privateConstructorUsedError;

  /// Sleep quality (0-100)
  int? get qualityScore => throw _privateConstructorUsedError;

  /// Sleep efficiency
  int? get efficiency => throw _privateConstructorUsedError;

  /// Time in bed
  double? get timeInBed => throw _privateConstructorUsedError;

  /// Sleep stages if available
  SleepStagesReview? get stages => throw _privateConstructorUsedError;

  /// Serializes this SleepReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepReviewCopyWith<SleepReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepReviewCopyWith<$Res> {
  factory $SleepReviewCopyWith(
    SleepReview value,
    $Res Function(SleepReview) then,
  ) = _$SleepReviewCopyWithImpl<$Res, SleepReview>;
  @useResult
  $Res call({
    double hoursSlept,
    double hoursNeeded,
    int? qualityScore,
    int? efficiency,
    double? timeInBed,
    SleepStagesReview? stages,
  });

  $SleepStagesReviewCopyWith<$Res>? get stages;
}

/// @nodoc
class _$SleepReviewCopyWithImpl<$Res, $Val extends SleepReview>
    implements $SleepReviewCopyWith<$Res> {
  _$SleepReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hoursSlept = null,
    Object? hoursNeeded = null,
    Object? qualityScore = freezed,
    Object? efficiency = freezed,
    Object? timeInBed = freezed,
    Object? stages = freezed,
  }) {
    return _then(
      _value.copyWith(
            hoursSlept: null == hoursSlept
                ? _value.hoursSlept
                : hoursSlept // ignore: cast_nullable_to_non_nullable
                      as double,
            hoursNeeded: null == hoursNeeded
                ? _value.hoursNeeded
                : hoursNeeded // ignore: cast_nullable_to_non_nullable
                      as double,
            qualityScore: freezed == qualityScore
                ? _value.qualityScore
                : qualityScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            efficiency: freezed == efficiency
                ? _value.efficiency
                : efficiency // ignore: cast_nullable_to_non_nullable
                      as int?,
            timeInBed: freezed == timeInBed
                ? _value.timeInBed
                : timeInBed // ignore: cast_nullable_to_non_nullable
                      as double?,
            stages: freezed == stages
                ? _value.stages
                : stages // ignore: cast_nullable_to_non_nullable
                      as SleepStagesReview?,
          )
          as $Val,
    );
  }

  /// Create a copy of SleepReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepStagesReviewCopyWith<$Res>? get stages {
    if (_value.stages == null) {
      return null;
    }

    return $SleepStagesReviewCopyWith<$Res>(_value.stages!, (value) {
      return _then(_value.copyWith(stages: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SleepReviewImplCopyWith<$Res>
    implements $SleepReviewCopyWith<$Res> {
  factory _$$SleepReviewImplCopyWith(
    _$SleepReviewImpl value,
    $Res Function(_$SleepReviewImpl) then,
  ) = __$$SleepReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double hoursSlept,
    double hoursNeeded,
    int? qualityScore,
    int? efficiency,
    double? timeInBed,
    SleepStagesReview? stages,
  });

  @override
  $SleepStagesReviewCopyWith<$Res>? get stages;
}

/// @nodoc
class __$$SleepReviewImplCopyWithImpl<$Res>
    extends _$SleepReviewCopyWithImpl<$Res, _$SleepReviewImpl>
    implements _$$SleepReviewImplCopyWith<$Res> {
  __$$SleepReviewImplCopyWithImpl(
    _$SleepReviewImpl _value,
    $Res Function(_$SleepReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SleepReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hoursSlept = null,
    Object? hoursNeeded = null,
    Object? qualityScore = freezed,
    Object? efficiency = freezed,
    Object? timeInBed = freezed,
    Object? stages = freezed,
  }) {
    return _then(
      _$SleepReviewImpl(
        hoursSlept: null == hoursSlept
            ? _value.hoursSlept
            : hoursSlept // ignore: cast_nullable_to_non_nullable
                  as double,
        hoursNeeded: null == hoursNeeded
            ? _value.hoursNeeded
            : hoursNeeded // ignore: cast_nullable_to_non_nullable
                  as double,
        qualityScore: freezed == qualityScore
            ? _value.qualityScore
            : qualityScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        efficiency: freezed == efficiency
            ? _value.efficiency
            : efficiency // ignore: cast_nullable_to_non_nullable
                  as int?,
        timeInBed: freezed == timeInBed
            ? _value.timeInBed
            : timeInBed // ignore: cast_nullable_to_non_nullable
                  as double?,
        stages: freezed == stages
            ? _value.stages
            : stages // ignore: cast_nullable_to_non_nullable
                  as SleepStagesReview?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepReviewImpl extends _SleepReview {
  const _$SleepReviewImpl({
    required this.hoursSlept,
    required this.hoursNeeded,
    this.qualityScore,
    this.efficiency,
    this.timeInBed,
    this.stages,
  }) : super._();

  factory _$SleepReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepReviewImplFromJson(json);

  /// Hours slept
  @override
  final double hoursSlept;

  /// Hours needed
  @override
  final double hoursNeeded;

  /// Sleep quality (0-100)
  @override
  final int? qualityScore;

  /// Sleep efficiency
  @override
  final int? efficiency;

  /// Time in bed
  @override
  final double? timeInBed;

  /// Sleep stages if available
  @override
  final SleepStagesReview? stages;

  @override
  String toString() {
    return 'SleepReview(hoursSlept: $hoursSlept, hoursNeeded: $hoursNeeded, qualityScore: $qualityScore, efficiency: $efficiency, timeInBed: $timeInBed, stages: $stages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepReviewImpl &&
            (identical(other.hoursSlept, hoursSlept) ||
                other.hoursSlept == hoursSlept) &&
            (identical(other.hoursNeeded, hoursNeeded) ||
                other.hoursNeeded == hoursNeeded) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore) &&
            (identical(other.efficiency, efficiency) ||
                other.efficiency == efficiency) &&
            (identical(other.timeInBed, timeInBed) ||
                other.timeInBed == timeInBed) &&
            (identical(other.stages, stages) || other.stages == stages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hoursSlept,
    hoursNeeded,
    qualityScore,
    efficiency,
    timeInBed,
    stages,
  );

  /// Create a copy of SleepReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepReviewImplCopyWith<_$SleepReviewImpl> get copyWith =>
      __$$SleepReviewImplCopyWithImpl<_$SleepReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepReviewImplToJson(this);
  }
}

abstract class _SleepReview extends SleepReview {
  const factory _SleepReview({
    required final double hoursSlept,
    required final double hoursNeeded,
    final int? qualityScore,
    final int? efficiency,
    final double? timeInBed,
    final SleepStagesReview? stages,
  }) = _$SleepReviewImpl;
  const _SleepReview._() : super._();

  factory _SleepReview.fromJson(Map<String, dynamic> json) =
      _$SleepReviewImpl.fromJson;

  /// Hours slept
  @override
  double get hoursSlept;

  /// Hours needed
  @override
  double get hoursNeeded;

  /// Sleep quality (0-100)
  @override
  int? get qualityScore;

  /// Sleep efficiency
  @override
  int? get efficiency;

  /// Time in bed
  @override
  double? get timeInBed;

  /// Sleep stages if available
  @override
  SleepStagesReview? get stages;

  /// Create a copy of SleepReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepReviewImplCopyWith<_$SleepReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SleepStagesReview _$SleepStagesReviewFromJson(Map<String, dynamic> json) {
  return _SleepStagesReview.fromJson(json);
}

/// @nodoc
mixin _$SleepStagesReview {
  int get lightMinutes => throw _privateConstructorUsedError;
  int get deepMinutes => throw _privateConstructorUsedError;
  int get remMinutes => throw _privateConstructorUsedError;
  int get awakeMinutes => throw _privateConstructorUsedError;

  /// Serializes this SleepStagesReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepStagesReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepStagesReviewCopyWith<SleepStagesReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepStagesReviewCopyWith<$Res> {
  factory $SleepStagesReviewCopyWith(
    SleepStagesReview value,
    $Res Function(SleepStagesReview) then,
  ) = _$SleepStagesReviewCopyWithImpl<$Res, SleepStagesReview>;
  @useResult
  $Res call({
    int lightMinutes,
    int deepMinutes,
    int remMinutes,
    int awakeMinutes,
  });
}

/// @nodoc
class _$SleepStagesReviewCopyWithImpl<$Res, $Val extends SleepStagesReview>
    implements $SleepStagesReviewCopyWith<$Res> {
  _$SleepStagesReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepStagesReview
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
abstract class _$$SleepStagesReviewImplCopyWith<$Res>
    implements $SleepStagesReviewCopyWith<$Res> {
  factory _$$SleepStagesReviewImplCopyWith(
    _$SleepStagesReviewImpl value,
    $Res Function(_$SleepStagesReviewImpl) then,
  ) = __$$SleepStagesReviewImplCopyWithImpl<$Res>;
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
class __$$SleepStagesReviewImplCopyWithImpl<$Res>
    extends _$SleepStagesReviewCopyWithImpl<$Res, _$SleepStagesReviewImpl>
    implements _$$SleepStagesReviewImplCopyWith<$Res> {
  __$$SleepStagesReviewImplCopyWithImpl(
    _$SleepStagesReviewImpl _value,
    $Res Function(_$SleepStagesReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SleepStagesReview
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
      _$SleepStagesReviewImpl(
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
class _$SleepStagesReviewImpl implements _SleepStagesReview {
  const _$SleepStagesReviewImpl({
    this.lightMinutes = 0,
    this.deepMinutes = 0,
    this.remMinutes = 0,
    this.awakeMinutes = 0,
  });

  factory _$SleepStagesReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepStagesReviewImplFromJson(json);

  @override
  @JsonKey()
  final int lightMinutes;
  @override
  @JsonKey()
  final int deepMinutes;
  @override
  @JsonKey()
  final int remMinutes;
  @override
  @JsonKey()
  final int awakeMinutes;

  @override
  String toString() {
    return 'SleepStagesReview(lightMinutes: $lightMinutes, deepMinutes: $deepMinutes, remMinutes: $remMinutes, awakeMinutes: $awakeMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepStagesReviewImpl &&
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

  /// Create a copy of SleepStagesReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepStagesReviewImplCopyWith<_$SleepStagesReviewImpl> get copyWith =>
      __$$SleepStagesReviewImplCopyWithImpl<_$SleepStagesReviewImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepStagesReviewImplToJson(this);
  }
}

abstract class _SleepStagesReview implements SleepStagesReview {
  const factory _SleepStagesReview({
    final int lightMinutes,
    final int deepMinutes,
    final int remMinutes,
    final int awakeMinutes,
  }) = _$SleepStagesReviewImpl;

  factory _SleepStagesReview.fromJson(Map<String, dynamic> json) =
      _$SleepStagesReviewImpl.fromJson;

  @override
  int get lightMinutes;
  @override
  int get deepMinutes;
  @override
  int get remMinutes;
  @override
  int get awakeMinutes;

  /// Create a copy of SleepStagesReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepStagesReviewImplCopyWith<_$SleepStagesReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NutritionReview _$NutritionReviewFromJson(Map<String, dynamic> json) {
  return _NutritionReview.fromJson(json);
}

/// @nodoc
mixin _$NutritionReview {
  /// Calories consumed
  int get caloriesConsumed => throw _privateConstructorUsedError;

  /// Calories target
  int get caloriesTarget => throw _privateConstructorUsedError;

  /// Protein consumed (grams)
  int get proteinConsumed => throw _privateConstructorUsedError;

  /// Protein target (grams)
  int get proteinTarget => throw _privateConstructorUsedError;

  /// Meals logged
  int get mealsLogged => throw _privateConstructorUsedError;

  /// Was in eating window?
  bool get wasInEatingWindow => throw _privateConstructorUsedError;

  /// Serializes this NutritionReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionReviewCopyWith<NutritionReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionReviewCopyWith<$Res> {
  factory $NutritionReviewCopyWith(
    NutritionReview value,
    $Res Function(NutritionReview) then,
  ) = _$NutritionReviewCopyWithImpl<$Res, NutritionReview>;
  @useResult
  $Res call({
    int caloriesConsumed,
    int caloriesTarget,
    int proteinConsumed,
    int proteinTarget,
    int mealsLogged,
    bool wasInEatingWindow,
  });
}

/// @nodoc
class _$NutritionReviewCopyWithImpl<$Res, $Val extends NutritionReview>
    implements $NutritionReviewCopyWith<$Res> {
  _$NutritionReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caloriesConsumed = null,
    Object? caloriesTarget = null,
    Object? proteinConsumed = null,
    Object? proteinTarget = null,
    Object? mealsLogged = null,
    Object? wasInEatingWindow = null,
  }) {
    return _then(
      _value.copyWith(
            caloriesConsumed: null == caloriesConsumed
                ? _value.caloriesConsumed
                : caloriesConsumed // ignore: cast_nullable_to_non_nullable
                      as int,
            caloriesTarget: null == caloriesTarget
                ? _value.caloriesTarget
                : caloriesTarget // ignore: cast_nullable_to_non_nullable
                      as int,
            proteinConsumed: null == proteinConsumed
                ? _value.proteinConsumed
                : proteinConsumed // ignore: cast_nullable_to_non_nullable
                      as int,
            proteinTarget: null == proteinTarget
                ? _value.proteinTarget
                : proteinTarget // ignore: cast_nullable_to_non_nullable
                      as int,
            mealsLogged: null == mealsLogged
                ? _value.mealsLogged
                : mealsLogged // ignore: cast_nullable_to_non_nullable
                      as int,
            wasInEatingWindow: null == wasInEatingWindow
                ? _value.wasInEatingWindow
                : wasInEatingWindow // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NutritionReviewImplCopyWith<$Res>
    implements $NutritionReviewCopyWith<$Res> {
  factory _$$NutritionReviewImplCopyWith(
    _$NutritionReviewImpl value,
    $Res Function(_$NutritionReviewImpl) then,
  ) = __$$NutritionReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int caloriesConsumed,
    int caloriesTarget,
    int proteinConsumed,
    int proteinTarget,
    int mealsLogged,
    bool wasInEatingWindow,
  });
}

/// @nodoc
class __$$NutritionReviewImplCopyWithImpl<$Res>
    extends _$NutritionReviewCopyWithImpl<$Res, _$NutritionReviewImpl>
    implements _$$NutritionReviewImplCopyWith<$Res> {
  __$$NutritionReviewImplCopyWithImpl(
    _$NutritionReviewImpl _value,
    $Res Function(_$NutritionReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NutritionReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caloriesConsumed = null,
    Object? caloriesTarget = null,
    Object? proteinConsumed = null,
    Object? proteinTarget = null,
    Object? mealsLogged = null,
    Object? wasInEatingWindow = null,
  }) {
    return _then(
      _$NutritionReviewImpl(
        caloriesConsumed: null == caloriesConsumed
            ? _value.caloriesConsumed
            : caloriesConsumed // ignore: cast_nullable_to_non_nullable
                  as int,
        caloriesTarget: null == caloriesTarget
            ? _value.caloriesTarget
            : caloriesTarget // ignore: cast_nullable_to_non_nullable
                  as int,
        proteinConsumed: null == proteinConsumed
            ? _value.proteinConsumed
            : proteinConsumed // ignore: cast_nullable_to_non_nullable
                  as int,
        proteinTarget: null == proteinTarget
            ? _value.proteinTarget
            : proteinTarget // ignore: cast_nullable_to_non_nullable
                  as int,
        mealsLogged: null == mealsLogged
            ? _value.mealsLogged
            : mealsLogged // ignore: cast_nullable_to_non_nullable
                  as int,
        wasInEatingWindow: null == wasInEatingWindow
            ? _value.wasInEatingWindow
            : wasInEatingWindow // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionReviewImpl extends _NutritionReview {
  const _$NutritionReviewImpl({
    required this.caloriesConsumed,
    required this.caloriesTarget,
    required this.proteinConsumed,
    required this.proteinTarget,
    required this.mealsLogged,
    this.wasInEatingWindow = true,
  }) : super._();

  factory _$NutritionReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionReviewImplFromJson(json);

  /// Calories consumed
  @override
  final int caloriesConsumed;

  /// Calories target
  @override
  final int caloriesTarget;

  /// Protein consumed (grams)
  @override
  final int proteinConsumed;

  /// Protein target (grams)
  @override
  final int proteinTarget;

  /// Meals logged
  @override
  final int mealsLogged;

  /// Was in eating window?
  @override
  @JsonKey()
  final bool wasInEatingWindow;

  @override
  String toString() {
    return 'NutritionReview(caloriesConsumed: $caloriesConsumed, caloriesTarget: $caloriesTarget, proteinConsumed: $proteinConsumed, proteinTarget: $proteinTarget, mealsLogged: $mealsLogged, wasInEatingWindow: $wasInEatingWindow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionReviewImpl &&
            (identical(other.caloriesConsumed, caloriesConsumed) ||
                other.caloriesConsumed == caloriesConsumed) &&
            (identical(other.caloriesTarget, caloriesTarget) ||
                other.caloriesTarget == caloriesTarget) &&
            (identical(other.proteinConsumed, proteinConsumed) ||
                other.proteinConsumed == proteinConsumed) &&
            (identical(other.proteinTarget, proteinTarget) ||
                other.proteinTarget == proteinTarget) &&
            (identical(other.mealsLogged, mealsLogged) ||
                other.mealsLogged == mealsLogged) &&
            (identical(other.wasInEatingWindow, wasInEatingWindow) ||
                other.wasInEatingWindow == wasInEatingWindow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    caloriesConsumed,
    caloriesTarget,
    proteinConsumed,
    proteinTarget,
    mealsLogged,
    wasInEatingWindow,
  );

  /// Create a copy of NutritionReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionReviewImplCopyWith<_$NutritionReviewImpl> get copyWith =>
      __$$NutritionReviewImplCopyWithImpl<_$NutritionReviewImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionReviewImplToJson(this);
  }
}

abstract class _NutritionReview extends NutritionReview {
  const factory _NutritionReview({
    required final int caloriesConsumed,
    required final int caloriesTarget,
    required final int proteinConsumed,
    required final int proteinTarget,
    required final int mealsLogged,
    final bool wasInEatingWindow,
  }) = _$NutritionReviewImpl;
  const _NutritionReview._() : super._();

  factory _NutritionReview.fromJson(Map<String, dynamic> json) =
      _$NutritionReviewImpl.fromJson;

  /// Calories consumed
  @override
  int get caloriesConsumed;

  /// Calories target
  @override
  int get caloriesTarget;

  /// Protein consumed (grams)
  @override
  int get proteinConsumed;

  /// Protein target (grams)
  @override
  int get proteinTarget;

  /// Meals logged
  @override
  int get mealsLogged;

  /// Was in eating window?
  @override
  bool get wasInEatingWindow;

  /// Create a copy of NutritionReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionReviewImplCopyWith<_$NutritionReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecoveryPrediction _$RecoveryPredictionFromJson(Map<String, dynamic> json) {
  return _RecoveryPrediction.fromJson(json);
}

/// @nodoc
mixin _$RecoveryPrediction {
  /// Predicted score (0-100)
  int get predictedScore => throw _privateConstructorUsedError;

  /// Confidence range (e.g., 70-80)
  int get rangeMin => throw _privateConstructorUsedError;
  int get rangeMax => throw _privateConstructorUsedError;

  /// Factors influencing prediction
  List<PredictionFactor> get factors => throw _privateConstructorUsedError;

  /// Prediction confidence
  int get confidence => throw _privateConstructorUsedError;

  /// Serializes this RecoveryPrediction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecoveryPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecoveryPredictionCopyWith<RecoveryPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveryPredictionCopyWith<$Res> {
  factory $RecoveryPredictionCopyWith(
    RecoveryPrediction value,
    $Res Function(RecoveryPrediction) then,
  ) = _$RecoveryPredictionCopyWithImpl<$Res, RecoveryPrediction>;
  @useResult
  $Res call({
    int predictedScore,
    int rangeMin,
    int rangeMax,
    List<PredictionFactor> factors,
    int confidence,
  });
}

/// @nodoc
class _$RecoveryPredictionCopyWithImpl<$Res, $Val extends RecoveryPrediction>
    implements $RecoveryPredictionCopyWith<$Res> {
  _$RecoveryPredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecoveryPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictedScore = null,
    Object? rangeMin = null,
    Object? rangeMax = null,
    Object? factors = null,
    Object? confidence = null,
  }) {
    return _then(
      _value.copyWith(
            predictedScore: null == predictedScore
                ? _value.predictedScore
                : predictedScore // ignore: cast_nullable_to_non_nullable
                      as int,
            rangeMin: null == rangeMin
                ? _value.rangeMin
                : rangeMin // ignore: cast_nullable_to_non_nullable
                      as int,
            rangeMax: null == rangeMax
                ? _value.rangeMax
                : rangeMax // ignore: cast_nullable_to_non_nullable
                      as int,
            factors: null == factors
                ? _value.factors
                : factors // ignore: cast_nullable_to_non_nullable
                      as List<PredictionFactor>,
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
abstract class _$$RecoveryPredictionImplCopyWith<$Res>
    implements $RecoveryPredictionCopyWith<$Res> {
  factory _$$RecoveryPredictionImplCopyWith(
    _$RecoveryPredictionImpl value,
    $Res Function(_$RecoveryPredictionImpl) then,
  ) = __$$RecoveryPredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int predictedScore,
    int rangeMin,
    int rangeMax,
    List<PredictionFactor> factors,
    int confidence,
  });
}

/// @nodoc
class __$$RecoveryPredictionImplCopyWithImpl<$Res>
    extends _$RecoveryPredictionCopyWithImpl<$Res, _$RecoveryPredictionImpl>
    implements _$$RecoveryPredictionImplCopyWith<$Res> {
  __$$RecoveryPredictionImplCopyWithImpl(
    _$RecoveryPredictionImpl _value,
    $Res Function(_$RecoveryPredictionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecoveryPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictedScore = null,
    Object? rangeMin = null,
    Object? rangeMax = null,
    Object? factors = null,
    Object? confidence = null,
  }) {
    return _then(
      _$RecoveryPredictionImpl(
        predictedScore: null == predictedScore
            ? _value.predictedScore
            : predictedScore // ignore: cast_nullable_to_non_nullable
                  as int,
        rangeMin: null == rangeMin
            ? _value.rangeMin
            : rangeMin // ignore: cast_nullable_to_non_nullable
                  as int,
        rangeMax: null == rangeMax
            ? _value.rangeMax
            : rangeMax // ignore: cast_nullable_to_non_nullable
                  as int,
        factors: null == factors
            ? _value._factors
            : factors // ignore: cast_nullable_to_non_nullable
                  as List<PredictionFactor>,
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
class _$RecoveryPredictionImpl extends _RecoveryPrediction {
  const _$RecoveryPredictionImpl({
    required this.predictedScore,
    required this.rangeMin,
    required this.rangeMax,
    final List<PredictionFactor> factors = const [],
    this.confidence = 70,
  }) : _factors = factors,
       super._();

  factory _$RecoveryPredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecoveryPredictionImplFromJson(json);

  /// Predicted score (0-100)
  @override
  final int predictedScore;

  /// Confidence range (e.g., 70-80)
  @override
  final int rangeMin;
  @override
  final int rangeMax;

  /// Factors influencing prediction
  final List<PredictionFactor> _factors;

  /// Factors influencing prediction
  @override
  @JsonKey()
  List<PredictionFactor> get factors {
    if (_factors is EqualUnmodifiableListView) return _factors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_factors);
  }

  /// Prediction confidence
  @override
  @JsonKey()
  final int confidence;

  @override
  String toString() {
    return 'RecoveryPrediction(predictedScore: $predictedScore, rangeMin: $rangeMin, rangeMax: $rangeMax, factors: $factors, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecoveryPredictionImpl &&
            (identical(other.predictedScore, predictedScore) ||
                other.predictedScore == predictedScore) &&
            (identical(other.rangeMin, rangeMin) ||
                other.rangeMin == rangeMin) &&
            (identical(other.rangeMax, rangeMax) ||
                other.rangeMax == rangeMax) &&
            const DeepCollectionEquality().equals(other._factors, _factors) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    predictedScore,
    rangeMin,
    rangeMax,
    const DeepCollectionEquality().hash(_factors),
    confidence,
  );

  /// Create a copy of RecoveryPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecoveryPredictionImplCopyWith<_$RecoveryPredictionImpl> get copyWith =>
      __$$RecoveryPredictionImplCopyWithImpl<_$RecoveryPredictionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecoveryPredictionImplToJson(this);
  }
}

abstract class _RecoveryPrediction extends RecoveryPrediction {
  const factory _RecoveryPrediction({
    required final int predictedScore,
    required final int rangeMin,
    required final int rangeMax,
    final List<PredictionFactor> factors,
    final int confidence,
  }) = _$RecoveryPredictionImpl;
  const _RecoveryPrediction._() : super._();

  factory _RecoveryPrediction.fromJson(Map<String, dynamic> json) =
      _$RecoveryPredictionImpl.fromJson;

  /// Predicted score (0-100)
  @override
  int get predictedScore;

  /// Confidence range (e.g., 70-80)
  @override
  int get rangeMin;
  @override
  int get rangeMax;

  /// Factors influencing prediction
  @override
  List<PredictionFactor> get factors;

  /// Prediction confidence
  @override
  int get confidence;

  /// Create a copy of RecoveryPrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecoveryPredictionImplCopyWith<_$RecoveryPredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PredictionFactor _$PredictionFactorFromJson(Map<String, dynamic> json) {
  return _PredictionFactor.fromJson(json);
}

/// @nodoc
mixin _$PredictionFactor {
  String get name => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;

  /// Impact on recovery (positive or negative points)
  int get impact => throw _privateConstructorUsedError;

  /// Description of impact
  String get description => throw _privateConstructorUsedError;
  String get descriptionAr => throw _privateConstructorUsedError;

  /// Serializes this PredictionFactor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PredictionFactor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredictionFactorCopyWith<PredictionFactor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionFactorCopyWith<$Res> {
  factory $PredictionFactorCopyWith(
    PredictionFactor value,
    $Res Function(PredictionFactor) then,
  ) = _$PredictionFactorCopyWithImpl<$Res, PredictionFactor>;
  @useResult
  $Res call({
    String name,
    String nameAr,
    int impact,
    String description,
    String descriptionAr,
  });
}

/// @nodoc
class _$PredictionFactorCopyWithImpl<$Res, $Val extends PredictionFactor>
    implements $PredictionFactorCopyWith<$Res> {
  _$PredictionFactorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PredictionFactor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameAr = null,
    Object? impact = null,
    Object? description = null,
    Object? descriptionAr = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            nameAr: null == nameAr
                ? _value.nameAr
                : nameAr // ignore: cast_nullable_to_non_nullable
                      as String,
            impact: null == impact
                ? _value.impact
                : impact // ignore: cast_nullable_to_non_nullable
                      as int,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionAr: null == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PredictionFactorImplCopyWith<$Res>
    implements $PredictionFactorCopyWith<$Res> {
  factory _$$PredictionFactorImplCopyWith(
    _$PredictionFactorImpl value,
    $Res Function(_$PredictionFactorImpl) then,
  ) = __$$PredictionFactorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String nameAr,
    int impact,
    String description,
    String descriptionAr,
  });
}

/// @nodoc
class __$$PredictionFactorImplCopyWithImpl<$Res>
    extends _$PredictionFactorCopyWithImpl<$Res, _$PredictionFactorImpl>
    implements _$$PredictionFactorImplCopyWith<$Res> {
  __$$PredictionFactorImplCopyWithImpl(
    _$PredictionFactorImpl _value,
    $Res Function(_$PredictionFactorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PredictionFactor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameAr = null,
    Object? impact = null,
    Object? description = null,
    Object? descriptionAr = null,
  }) {
    return _then(
      _$PredictionFactorImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAr: null == nameAr
            ? _value.nameAr
            : nameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        impact: null == impact
            ? _value.impact
            : impact // ignore: cast_nullable_to_non_nullable
                  as int,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: null == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionFactorImpl implements _PredictionFactor {
  const _$PredictionFactorImpl({
    required this.name,
    required this.nameAr,
    required this.impact,
    required this.description,
    required this.descriptionAr,
  });

  factory _$PredictionFactorImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionFactorImplFromJson(json);

  @override
  final String name;
  @override
  final String nameAr;

  /// Impact on recovery (positive or negative points)
  @override
  final int impact;

  /// Description of impact
  @override
  final String description;
  @override
  final String descriptionAr;

  @override
  String toString() {
    return 'PredictionFactor(name: $name, nameAr: $nameAr, impact: $impact, description: $description, descriptionAr: $descriptionAr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionFactorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.impact, impact) || other.impact == impact) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    nameAr,
    impact,
    description,
    descriptionAr,
  );

  /// Create a copy of PredictionFactor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionFactorImplCopyWith<_$PredictionFactorImpl> get copyWith =>
      __$$PredictionFactorImplCopyWithImpl<_$PredictionFactorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionFactorImplToJson(this);
  }
}

abstract class _PredictionFactor implements PredictionFactor {
  const factory _PredictionFactor({
    required final String name,
    required final String nameAr,
    required final int impact,
    required final String description,
    required final String descriptionAr,
  }) = _$PredictionFactorImpl;

  factory _PredictionFactor.fromJson(Map<String, dynamic> json) =
      _$PredictionFactorImpl.fromJson;

  @override
  String get name;
  @override
  String get nameAr;

  /// Impact on recovery (positive or negative points)
  @override
  int get impact;

  /// Description of impact
  @override
  String get description;
  @override
  String get descriptionAr;

  /// Create a copy of PredictionFactor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredictionFactorImplCopyWith<_$PredictionFactorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DayBehaviorImpact _$DayBehaviorImpactFromJson(Map<String, dynamic> json) {
  return _DayBehaviorImpact.fromJson(json);
}

/// @nodoc
mixin _$DayBehaviorImpact {
  String get behaviorId => throw _privateConstructorUsedError;
  String get behaviorName => throw _privateConstructorUsedError;
  String get behaviorNameAr => throw _privateConstructorUsedError;

  /// Impact on recovery (percentage points)
  double get impactPercent => throw _privateConstructorUsedError;

  /// Is this positive or negative?
  bool get isPositive => throw _privateConstructorUsedError;

  /// Correlation strength (0-1)
  double get correlationStrength => throw _privateConstructorUsedError;

  /// Number of data points
  int get dataPoints => throw _privateConstructorUsedError;

  /// Serializes this DayBehaviorImpact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DayBehaviorImpact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayBehaviorImpactCopyWith<DayBehaviorImpact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayBehaviorImpactCopyWith<$Res> {
  factory $DayBehaviorImpactCopyWith(
    DayBehaviorImpact value,
    $Res Function(DayBehaviorImpact) then,
  ) = _$DayBehaviorImpactCopyWithImpl<$Res, DayBehaviorImpact>;
  @useResult
  $Res call({
    String behaviorId,
    String behaviorName,
    String behaviorNameAr,
    double impactPercent,
    bool isPositive,
    double correlationStrength,
    int dataPoints,
  });
}

/// @nodoc
class _$DayBehaviorImpactCopyWithImpl<$Res, $Val extends DayBehaviorImpact>
    implements $DayBehaviorImpactCopyWith<$Res> {
  _$DayBehaviorImpactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayBehaviorImpact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? behaviorId = null,
    Object? behaviorName = null,
    Object? behaviorNameAr = null,
    Object? impactPercent = null,
    Object? isPositive = null,
    Object? correlationStrength = null,
    Object? dataPoints = null,
  }) {
    return _then(
      _value.copyWith(
            behaviorId: null == behaviorId
                ? _value.behaviorId
                : behaviorId // ignore: cast_nullable_to_non_nullable
                      as String,
            behaviorName: null == behaviorName
                ? _value.behaviorName
                : behaviorName // ignore: cast_nullable_to_non_nullable
                      as String,
            behaviorNameAr: null == behaviorNameAr
                ? _value.behaviorNameAr
                : behaviorNameAr // ignore: cast_nullable_to_non_nullable
                      as String,
            impactPercent: null == impactPercent
                ? _value.impactPercent
                : impactPercent // ignore: cast_nullable_to_non_nullable
                      as double,
            isPositive: null == isPositive
                ? _value.isPositive
                : isPositive // ignore: cast_nullable_to_non_nullable
                      as bool,
            correlationStrength: null == correlationStrength
                ? _value.correlationStrength
                : correlationStrength // ignore: cast_nullable_to_non_nullable
                      as double,
            dataPoints: null == dataPoints
                ? _value.dataPoints
                : dataPoints // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DayBehaviorImpactImplCopyWith<$Res>
    implements $DayBehaviorImpactCopyWith<$Res> {
  factory _$$DayBehaviorImpactImplCopyWith(
    _$DayBehaviorImpactImpl value,
    $Res Function(_$DayBehaviorImpactImpl) then,
  ) = __$$DayBehaviorImpactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String behaviorId,
    String behaviorName,
    String behaviorNameAr,
    double impactPercent,
    bool isPositive,
    double correlationStrength,
    int dataPoints,
  });
}

/// @nodoc
class __$$DayBehaviorImpactImplCopyWithImpl<$Res>
    extends _$DayBehaviorImpactCopyWithImpl<$Res, _$DayBehaviorImpactImpl>
    implements _$$DayBehaviorImpactImplCopyWith<$Res> {
  __$$DayBehaviorImpactImplCopyWithImpl(
    _$DayBehaviorImpactImpl _value,
    $Res Function(_$DayBehaviorImpactImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayBehaviorImpact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? behaviorId = null,
    Object? behaviorName = null,
    Object? behaviorNameAr = null,
    Object? impactPercent = null,
    Object? isPositive = null,
    Object? correlationStrength = null,
    Object? dataPoints = null,
  }) {
    return _then(
      _$DayBehaviorImpactImpl(
        behaviorId: null == behaviorId
            ? _value.behaviorId
            : behaviorId // ignore: cast_nullable_to_non_nullable
                  as String,
        behaviorName: null == behaviorName
            ? _value.behaviorName
            : behaviorName // ignore: cast_nullable_to_non_nullable
                  as String,
        behaviorNameAr: null == behaviorNameAr
            ? _value.behaviorNameAr
            : behaviorNameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        impactPercent: null == impactPercent
            ? _value.impactPercent
            : impactPercent // ignore: cast_nullable_to_non_nullable
                  as double,
        isPositive: null == isPositive
            ? _value.isPositive
            : isPositive // ignore: cast_nullable_to_non_nullable
                  as bool,
        correlationStrength: null == correlationStrength
            ? _value.correlationStrength
            : correlationStrength // ignore: cast_nullable_to_non_nullable
                  as double,
        dataPoints: null == dataPoints
            ? _value.dataPoints
            : dataPoints // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DayBehaviorImpactImpl implements _DayBehaviorImpact {
  const _$DayBehaviorImpactImpl({
    required this.behaviorId,
    required this.behaviorName,
    required this.behaviorNameAr,
    required this.impactPercent,
    required this.isPositive,
    required this.correlationStrength,
    required this.dataPoints,
  });

  factory _$DayBehaviorImpactImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayBehaviorImpactImplFromJson(json);

  @override
  final String behaviorId;
  @override
  final String behaviorName;
  @override
  final String behaviorNameAr;

  /// Impact on recovery (percentage points)
  @override
  final double impactPercent;

  /// Is this positive or negative?
  @override
  final bool isPositive;

  /// Correlation strength (0-1)
  @override
  final double correlationStrength;

  /// Number of data points
  @override
  final int dataPoints;

  @override
  String toString() {
    return 'DayBehaviorImpact(behaviorId: $behaviorId, behaviorName: $behaviorName, behaviorNameAr: $behaviorNameAr, impactPercent: $impactPercent, isPositive: $isPositive, correlationStrength: $correlationStrength, dataPoints: $dataPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayBehaviorImpactImpl &&
            (identical(other.behaviorId, behaviorId) ||
                other.behaviorId == behaviorId) &&
            (identical(other.behaviorName, behaviorName) ||
                other.behaviorName == behaviorName) &&
            (identical(other.behaviorNameAr, behaviorNameAr) ||
                other.behaviorNameAr == behaviorNameAr) &&
            (identical(other.impactPercent, impactPercent) ||
                other.impactPercent == impactPercent) &&
            (identical(other.isPositive, isPositive) ||
                other.isPositive == isPositive) &&
            (identical(other.correlationStrength, correlationStrength) ||
                other.correlationStrength == correlationStrength) &&
            (identical(other.dataPoints, dataPoints) ||
                other.dataPoints == dataPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    behaviorId,
    behaviorName,
    behaviorNameAr,
    impactPercent,
    isPositive,
    correlationStrength,
    dataPoints,
  );

  /// Create a copy of DayBehaviorImpact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayBehaviorImpactImplCopyWith<_$DayBehaviorImpactImpl> get copyWith =>
      __$$DayBehaviorImpactImplCopyWithImpl<_$DayBehaviorImpactImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DayBehaviorImpactImplToJson(this);
  }
}

abstract class _DayBehaviorImpact implements DayBehaviorImpact {
  const factory _DayBehaviorImpact({
    required final String behaviorId,
    required final String behaviorName,
    required final String behaviorNameAr,
    required final double impactPercent,
    required final bool isPositive,
    required final double correlationStrength,
    required final int dataPoints,
  }) = _$DayBehaviorImpactImpl;

  factory _DayBehaviorImpact.fromJson(Map<String, dynamic> json) =
      _$DayBehaviorImpactImpl.fromJson;

  @override
  String get behaviorId;
  @override
  String get behaviorName;
  @override
  String get behaviorNameAr;

  /// Impact on recovery (percentage points)
  @override
  double get impactPercent;

  /// Is this positive or negative?
  @override
  bool get isPositive;

  /// Correlation strength (0-1)
  @override
  double get correlationStrength;

  /// Number of data points
  @override
  int get dataPoints;

  /// Create a copy of DayBehaviorImpact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayBehaviorImpactImplCopyWith<_$DayBehaviorImpactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
