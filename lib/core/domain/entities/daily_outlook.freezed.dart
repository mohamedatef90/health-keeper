// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_outlook.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyOutlook _$DailyOutlookFromJson(Map<String, dynamic> json) {
  return _DailyOutlook.fromJson(json);
}

/// @nodoc
mixin _$DailyOutlook {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Recovery score for today
  int get recoveryScore => throw _privateConstructorUsedError;

  /// Recovery state (peak, good, moderate, low, rest)
  RecoveryOutlookState get recoveryState => throw _privateConstructorUsedError;

  /// Strain target for today
  StrainTarget get strainTarget => throw _privateConstructorUsedError;

  /// Sleep data from last night
  SleepOutlook get sleepOutlook => throw _privateConstructorUsedError;

  /// Sleep need for tonight
  double get sleepNeedHours => throw _privateConstructorUsedError;

  /// Recommended bedtime for tonight
  DateTime? get recommendedBedtime => throw _privateConstructorUsedError;

  /// Recommended activities for today
  List<RecommendedActivity> get recommendedActivities =>
      throw _privateConstructorUsedError;

  /// Behaviors to track today
  List<String> get behaviorsToTrack => throw _privateConstructorUsedError;

  /// Key insights for the day
  List<OutlookInsight> get insights => throw _privateConstructorUsedError;

  /// AI-generated personalized message
  String? get aiInsight => throw _privateConstructorUsedError;

  /// Arabic AI insight
  String? get aiInsightAr => throw _privateConstructorUsedError;

  /// Whether this is AI-generated or rule-based
  bool get isAiGenerated => throw _privateConstructorUsedError;

  /// Confidence score (0-100)
  int get confidence => throw _privateConstructorUsedError;

  /// Serializes this DailyOutlook to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyOutlook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyOutlookCopyWith<DailyOutlook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyOutlookCopyWith<$Res> {
  factory $DailyOutlookCopyWith(
    DailyOutlook value,
    $Res Function(DailyOutlook) then,
  ) = _$DailyOutlookCopyWithImpl<$Res, DailyOutlook>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime generatedAt,
    int recoveryScore,
    RecoveryOutlookState recoveryState,
    StrainTarget strainTarget,
    SleepOutlook sleepOutlook,
    double sleepNeedHours,
    DateTime? recommendedBedtime,
    List<RecommendedActivity> recommendedActivities,
    List<String> behaviorsToTrack,
    List<OutlookInsight> insights,
    String? aiInsight,
    String? aiInsightAr,
    bool isAiGenerated,
    int confidence,
  });

  $StrainTargetCopyWith<$Res> get strainTarget;
  $SleepOutlookCopyWith<$Res> get sleepOutlook;
}

/// @nodoc
class _$DailyOutlookCopyWithImpl<$Res, $Val extends DailyOutlook>
    implements $DailyOutlookCopyWith<$Res> {
  _$DailyOutlookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyOutlook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? generatedAt = null,
    Object? recoveryScore = null,
    Object? recoveryState = null,
    Object? strainTarget = null,
    Object? sleepOutlook = null,
    Object? sleepNeedHours = null,
    Object? recommendedBedtime = freezed,
    Object? recommendedActivities = null,
    Object? behaviorsToTrack = null,
    Object? insights = null,
    Object? aiInsight = freezed,
    Object? aiInsightAr = freezed,
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
            recoveryScore: null == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int,
            recoveryState: null == recoveryState
                ? _value.recoveryState
                : recoveryState // ignore: cast_nullable_to_non_nullable
                      as RecoveryOutlookState,
            strainTarget: null == strainTarget
                ? _value.strainTarget
                : strainTarget // ignore: cast_nullable_to_non_nullable
                      as StrainTarget,
            sleepOutlook: null == sleepOutlook
                ? _value.sleepOutlook
                : sleepOutlook // ignore: cast_nullable_to_non_nullable
                      as SleepOutlook,
            sleepNeedHours: null == sleepNeedHours
                ? _value.sleepNeedHours
                : sleepNeedHours // ignore: cast_nullable_to_non_nullable
                      as double,
            recommendedBedtime: freezed == recommendedBedtime
                ? _value.recommendedBedtime
                : recommendedBedtime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            recommendedActivities: null == recommendedActivities
                ? _value.recommendedActivities
                : recommendedActivities // ignore: cast_nullable_to_non_nullable
                      as List<RecommendedActivity>,
            behaviorsToTrack: null == behaviorsToTrack
                ? _value.behaviorsToTrack
                : behaviorsToTrack // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            insights: null == insights
                ? _value.insights
                : insights // ignore: cast_nullable_to_non_nullable
                      as List<OutlookInsight>,
            aiInsight: freezed == aiInsight
                ? _value.aiInsight
                : aiInsight // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiInsightAr: freezed == aiInsightAr
                ? _value.aiInsightAr
                : aiInsightAr // ignore: cast_nullable_to_non_nullable
                      as String?,
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

  /// Create a copy of DailyOutlook
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StrainTargetCopyWith<$Res> get strainTarget {
    return $StrainTargetCopyWith<$Res>(_value.strainTarget, (value) {
      return _then(_value.copyWith(strainTarget: value) as $Val);
    });
  }

  /// Create a copy of DailyOutlook
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepOutlookCopyWith<$Res> get sleepOutlook {
    return $SleepOutlookCopyWith<$Res>(_value.sleepOutlook, (value) {
      return _then(_value.copyWith(sleepOutlook: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyOutlookImplCopyWith<$Res>
    implements $DailyOutlookCopyWith<$Res> {
  factory _$$DailyOutlookImplCopyWith(
    _$DailyOutlookImpl value,
    $Res Function(_$DailyOutlookImpl) then,
  ) = __$$DailyOutlookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime generatedAt,
    int recoveryScore,
    RecoveryOutlookState recoveryState,
    StrainTarget strainTarget,
    SleepOutlook sleepOutlook,
    double sleepNeedHours,
    DateTime? recommendedBedtime,
    List<RecommendedActivity> recommendedActivities,
    List<String> behaviorsToTrack,
    List<OutlookInsight> insights,
    String? aiInsight,
    String? aiInsightAr,
    bool isAiGenerated,
    int confidence,
  });

  @override
  $StrainTargetCopyWith<$Res> get strainTarget;
  @override
  $SleepOutlookCopyWith<$Res> get sleepOutlook;
}

/// @nodoc
class __$$DailyOutlookImplCopyWithImpl<$Res>
    extends _$DailyOutlookCopyWithImpl<$Res, _$DailyOutlookImpl>
    implements _$$DailyOutlookImplCopyWith<$Res> {
  __$$DailyOutlookImplCopyWithImpl(
    _$DailyOutlookImpl _value,
    $Res Function(_$DailyOutlookImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyOutlook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? generatedAt = null,
    Object? recoveryScore = null,
    Object? recoveryState = null,
    Object? strainTarget = null,
    Object? sleepOutlook = null,
    Object? sleepNeedHours = null,
    Object? recommendedBedtime = freezed,
    Object? recommendedActivities = null,
    Object? behaviorsToTrack = null,
    Object? insights = null,
    Object? aiInsight = freezed,
    Object? aiInsightAr = freezed,
    Object? isAiGenerated = null,
    Object? confidence = null,
  }) {
    return _then(
      _$DailyOutlookImpl(
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
        recoveryState: null == recoveryState
            ? _value.recoveryState
            : recoveryState // ignore: cast_nullable_to_non_nullable
                  as RecoveryOutlookState,
        strainTarget: null == strainTarget
            ? _value.strainTarget
            : strainTarget // ignore: cast_nullable_to_non_nullable
                  as StrainTarget,
        sleepOutlook: null == sleepOutlook
            ? _value.sleepOutlook
            : sleepOutlook // ignore: cast_nullable_to_non_nullable
                  as SleepOutlook,
        sleepNeedHours: null == sleepNeedHours
            ? _value.sleepNeedHours
            : sleepNeedHours // ignore: cast_nullable_to_non_nullable
                  as double,
        recommendedBedtime: freezed == recommendedBedtime
            ? _value.recommendedBedtime
            : recommendedBedtime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        recommendedActivities: null == recommendedActivities
            ? _value._recommendedActivities
            : recommendedActivities // ignore: cast_nullable_to_non_nullable
                  as List<RecommendedActivity>,
        behaviorsToTrack: null == behaviorsToTrack
            ? _value._behaviorsToTrack
            : behaviorsToTrack // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        insights: null == insights
            ? _value._insights
            : insights // ignore: cast_nullable_to_non_nullable
                  as List<OutlookInsight>,
        aiInsight: freezed == aiInsight
            ? _value.aiInsight
            : aiInsight // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiInsightAr: freezed == aiInsightAr
            ? _value.aiInsightAr
            : aiInsightAr // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$DailyOutlookImpl extends _DailyOutlook {
  const _$DailyOutlookImpl({
    required this.id,
    required this.date,
    required this.generatedAt,
    required this.recoveryScore,
    required this.recoveryState,
    required this.strainTarget,
    required this.sleepOutlook,
    required this.sleepNeedHours,
    this.recommendedBedtime,
    final List<RecommendedActivity> recommendedActivities = const [],
    final List<String> behaviorsToTrack = const [],
    final List<OutlookInsight> insights = const [],
    this.aiInsight,
    this.aiInsightAr,
    this.isAiGenerated = false,
    this.confidence = 70,
  }) : _recommendedActivities = recommendedActivities,
       _behaviorsToTrack = behaviorsToTrack,
       _insights = insights,
       super._();

  factory _$DailyOutlookImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyOutlookImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime generatedAt;

  /// Recovery score for today
  @override
  final int recoveryScore;

  /// Recovery state (peak, good, moderate, low, rest)
  @override
  final RecoveryOutlookState recoveryState;

  /// Strain target for today
  @override
  final StrainTarget strainTarget;

  /// Sleep data from last night
  @override
  final SleepOutlook sleepOutlook;

  /// Sleep need for tonight
  @override
  final double sleepNeedHours;

  /// Recommended bedtime for tonight
  @override
  final DateTime? recommendedBedtime;

  /// Recommended activities for today
  final List<RecommendedActivity> _recommendedActivities;

  /// Recommended activities for today
  @override
  @JsonKey()
  List<RecommendedActivity> get recommendedActivities {
    if (_recommendedActivities is EqualUnmodifiableListView)
      return _recommendedActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedActivities);
  }

  /// Behaviors to track today
  final List<String> _behaviorsToTrack;

  /// Behaviors to track today
  @override
  @JsonKey()
  List<String> get behaviorsToTrack {
    if (_behaviorsToTrack is EqualUnmodifiableListView)
      return _behaviorsToTrack;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_behaviorsToTrack);
  }

  /// Key insights for the day
  final List<OutlookInsight> _insights;

  /// Key insights for the day
  @override
  @JsonKey()
  List<OutlookInsight> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  /// AI-generated personalized message
  @override
  final String? aiInsight;

  /// Arabic AI insight
  @override
  final String? aiInsightAr;

  /// Whether this is AI-generated or rule-based
  @override
  @JsonKey()
  final bool isAiGenerated;

  /// Confidence score (0-100)
  @override
  @JsonKey()
  final int confidence;

  @override
  String toString() {
    return 'DailyOutlook(id: $id, date: $date, generatedAt: $generatedAt, recoveryScore: $recoveryScore, recoveryState: $recoveryState, strainTarget: $strainTarget, sleepOutlook: $sleepOutlook, sleepNeedHours: $sleepNeedHours, recommendedBedtime: $recommendedBedtime, recommendedActivities: $recommendedActivities, behaviorsToTrack: $behaviorsToTrack, insights: $insights, aiInsight: $aiInsight, aiInsightAr: $aiInsightAr, isAiGenerated: $isAiGenerated, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyOutlookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.recoveryState, recoveryState) ||
                other.recoveryState == recoveryState) &&
            (identical(other.strainTarget, strainTarget) ||
                other.strainTarget == strainTarget) &&
            (identical(other.sleepOutlook, sleepOutlook) ||
                other.sleepOutlook == sleepOutlook) &&
            (identical(other.sleepNeedHours, sleepNeedHours) ||
                other.sleepNeedHours == sleepNeedHours) &&
            (identical(other.recommendedBedtime, recommendedBedtime) ||
                other.recommendedBedtime == recommendedBedtime) &&
            const DeepCollectionEquality().equals(
              other._recommendedActivities,
              _recommendedActivities,
            ) &&
            const DeepCollectionEquality().equals(
              other._behaviorsToTrack,
              _behaviorsToTrack,
            ) &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            (identical(other.aiInsight, aiInsight) ||
                other.aiInsight == aiInsight) &&
            (identical(other.aiInsightAr, aiInsightAr) ||
                other.aiInsightAr == aiInsightAr) &&
            (identical(other.isAiGenerated, isAiGenerated) ||
                other.isAiGenerated == isAiGenerated) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    generatedAt,
    recoveryScore,
    recoveryState,
    strainTarget,
    sleepOutlook,
    sleepNeedHours,
    recommendedBedtime,
    const DeepCollectionEquality().hash(_recommendedActivities),
    const DeepCollectionEquality().hash(_behaviorsToTrack),
    const DeepCollectionEquality().hash(_insights),
    aiInsight,
    aiInsightAr,
    isAiGenerated,
    confidence,
  );

  /// Create a copy of DailyOutlook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyOutlookImplCopyWith<_$DailyOutlookImpl> get copyWith =>
      __$$DailyOutlookImplCopyWithImpl<_$DailyOutlookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyOutlookImplToJson(this);
  }
}

abstract class _DailyOutlook extends DailyOutlook {
  const factory _DailyOutlook({
    required final String id,
    required final DateTime date,
    required final DateTime generatedAt,
    required final int recoveryScore,
    required final RecoveryOutlookState recoveryState,
    required final StrainTarget strainTarget,
    required final SleepOutlook sleepOutlook,
    required final double sleepNeedHours,
    final DateTime? recommendedBedtime,
    final List<RecommendedActivity> recommendedActivities,
    final List<String> behaviorsToTrack,
    final List<OutlookInsight> insights,
    final String? aiInsight,
    final String? aiInsightAr,
    final bool isAiGenerated,
    final int confidence,
  }) = _$DailyOutlookImpl;
  const _DailyOutlook._() : super._();

  factory _DailyOutlook.fromJson(Map<String, dynamic> json) =
      _$DailyOutlookImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get generatedAt;

  /// Recovery score for today
  @override
  int get recoveryScore;

  /// Recovery state (peak, good, moderate, low, rest)
  @override
  RecoveryOutlookState get recoveryState;

  /// Strain target for today
  @override
  StrainTarget get strainTarget;

  /// Sleep data from last night
  @override
  SleepOutlook get sleepOutlook;

  /// Sleep need for tonight
  @override
  double get sleepNeedHours;

  /// Recommended bedtime for tonight
  @override
  DateTime? get recommendedBedtime;

  /// Recommended activities for today
  @override
  List<RecommendedActivity> get recommendedActivities;

  /// Behaviors to track today
  @override
  List<String> get behaviorsToTrack;

  /// Key insights for the day
  @override
  List<OutlookInsight> get insights;

  /// AI-generated personalized message
  @override
  String? get aiInsight;

  /// Arabic AI insight
  @override
  String? get aiInsightAr;

  /// Whether this is AI-generated or rule-based
  @override
  bool get isAiGenerated;

  /// Confidence score (0-100)
  @override
  int get confidence;

  /// Create a copy of DailyOutlook
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyOutlookImplCopyWith<_$DailyOutlookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SleepOutlook _$SleepOutlookFromJson(Map<String, dynamic> json) {
  return _SleepOutlook.fromJson(json);
}

/// @nodoc
mixin _$SleepOutlook {
  /// Hours of sleep
  double get hoursSlept => throw _privateConstructorUsedError;

  /// Sleep quality score (0-100)
  int? get qualityScore => throw _privateConstructorUsedError;

  /// Hours needed
  double get hoursNeeded => throw _privateConstructorUsedError;

  /// Sleep efficiency percentage
  int? get efficiency => throw _privateConstructorUsedError;

  /// Did meet sleep need?
  bool get metNeed => throw _privateConstructorUsedError;

  /// Serializes this SleepOutlook to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepOutlook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepOutlookCopyWith<SleepOutlook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepOutlookCopyWith<$Res> {
  factory $SleepOutlookCopyWith(
    SleepOutlook value,
    $Res Function(SleepOutlook) then,
  ) = _$SleepOutlookCopyWithImpl<$Res, SleepOutlook>;
  @useResult
  $Res call({
    double hoursSlept,
    int? qualityScore,
    double hoursNeeded,
    int? efficiency,
    bool metNeed,
  });
}

/// @nodoc
class _$SleepOutlookCopyWithImpl<$Res, $Val extends SleepOutlook>
    implements $SleepOutlookCopyWith<$Res> {
  _$SleepOutlookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepOutlook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hoursSlept = null,
    Object? qualityScore = freezed,
    Object? hoursNeeded = null,
    Object? efficiency = freezed,
    Object? metNeed = null,
  }) {
    return _then(
      _value.copyWith(
            hoursSlept: null == hoursSlept
                ? _value.hoursSlept
                : hoursSlept // ignore: cast_nullable_to_non_nullable
                      as double,
            qualityScore: freezed == qualityScore
                ? _value.qualityScore
                : qualityScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            hoursNeeded: null == hoursNeeded
                ? _value.hoursNeeded
                : hoursNeeded // ignore: cast_nullable_to_non_nullable
                      as double,
            efficiency: freezed == efficiency
                ? _value.efficiency
                : efficiency // ignore: cast_nullable_to_non_nullable
                      as int?,
            metNeed: null == metNeed
                ? _value.metNeed
                : metNeed // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SleepOutlookImplCopyWith<$Res>
    implements $SleepOutlookCopyWith<$Res> {
  factory _$$SleepOutlookImplCopyWith(
    _$SleepOutlookImpl value,
    $Res Function(_$SleepOutlookImpl) then,
  ) = __$$SleepOutlookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double hoursSlept,
    int? qualityScore,
    double hoursNeeded,
    int? efficiency,
    bool metNeed,
  });
}

/// @nodoc
class __$$SleepOutlookImplCopyWithImpl<$Res>
    extends _$SleepOutlookCopyWithImpl<$Res, _$SleepOutlookImpl>
    implements _$$SleepOutlookImplCopyWith<$Res> {
  __$$SleepOutlookImplCopyWithImpl(
    _$SleepOutlookImpl _value,
    $Res Function(_$SleepOutlookImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SleepOutlook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hoursSlept = null,
    Object? qualityScore = freezed,
    Object? hoursNeeded = null,
    Object? efficiency = freezed,
    Object? metNeed = null,
  }) {
    return _then(
      _$SleepOutlookImpl(
        hoursSlept: null == hoursSlept
            ? _value.hoursSlept
            : hoursSlept // ignore: cast_nullable_to_non_nullable
                  as double,
        qualityScore: freezed == qualityScore
            ? _value.qualityScore
            : qualityScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        hoursNeeded: null == hoursNeeded
            ? _value.hoursNeeded
            : hoursNeeded // ignore: cast_nullable_to_non_nullable
                  as double,
        efficiency: freezed == efficiency
            ? _value.efficiency
            : efficiency // ignore: cast_nullable_to_non_nullable
                  as int?,
        metNeed: null == metNeed
            ? _value.metNeed
            : metNeed // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepOutlookImpl extends _SleepOutlook {
  const _$SleepOutlookImpl({
    required this.hoursSlept,
    this.qualityScore,
    required this.hoursNeeded,
    this.efficiency,
    required this.metNeed,
  }) : super._();

  factory _$SleepOutlookImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepOutlookImplFromJson(json);

  /// Hours of sleep
  @override
  final double hoursSlept;

  /// Sleep quality score (0-100)
  @override
  final int? qualityScore;

  /// Hours needed
  @override
  final double hoursNeeded;

  /// Sleep efficiency percentage
  @override
  final int? efficiency;

  /// Did meet sleep need?
  @override
  final bool metNeed;

  @override
  String toString() {
    return 'SleepOutlook(hoursSlept: $hoursSlept, qualityScore: $qualityScore, hoursNeeded: $hoursNeeded, efficiency: $efficiency, metNeed: $metNeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepOutlookImpl &&
            (identical(other.hoursSlept, hoursSlept) ||
                other.hoursSlept == hoursSlept) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore) &&
            (identical(other.hoursNeeded, hoursNeeded) ||
                other.hoursNeeded == hoursNeeded) &&
            (identical(other.efficiency, efficiency) ||
                other.efficiency == efficiency) &&
            (identical(other.metNeed, metNeed) || other.metNeed == metNeed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hoursSlept,
    qualityScore,
    hoursNeeded,
    efficiency,
    metNeed,
  );

  /// Create a copy of SleepOutlook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepOutlookImplCopyWith<_$SleepOutlookImpl> get copyWith =>
      __$$SleepOutlookImplCopyWithImpl<_$SleepOutlookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepOutlookImplToJson(this);
  }
}

abstract class _SleepOutlook extends SleepOutlook {
  const factory _SleepOutlook({
    required final double hoursSlept,
    final int? qualityScore,
    required final double hoursNeeded,
    final int? efficiency,
    required final bool metNeed,
  }) = _$SleepOutlookImpl;
  const _SleepOutlook._() : super._();

  factory _SleepOutlook.fromJson(Map<String, dynamic> json) =
      _$SleepOutlookImpl.fromJson;

  /// Hours of sleep
  @override
  double get hoursSlept;

  /// Sleep quality score (0-100)
  @override
  int? get qualityScore;

  /// Hours needed
  @override
  double get hoursNeeded;

  /// Sleep efficiency percentage
  @override
  int? get efficiency;

  /// Did meet sleep need?
  @override
  bool get metNeed;

  /// Create a copy of SleepOutlook
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepOutlookImplCopyWith<_$SleepOutlookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecommendedActivity _$RecommendedActivityFromJson(Map<String, dynamic> json) {
  return _RecommendedActivity.fromJson(json);
}

/// @nodoc
mixin _$RecommendedActivity {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get descriptionAr => throw _privateConstructorUsedError;

  /// Duration in minutes
  int get durationMinutes => throw _privateConstructorUsedError;

  /// Intensity (1-5)
  int get intensity => throw _privateConstructorUsedError;

  /// Expected strain contribution
  double get expectedStrain => throw _privateConstructorUsedError;

  /// Is this the primary recommendation?
  bool get isPrimary => throw _privateConstructorUsedError;

  /// Icon name for UI
  String? get iconName => throw _privateConstructorUsedError;

  /// Serializes this RecommendedActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendedActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendedActivityCopyWith<RecommendedActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendedActivityCopyWith<$Res> {
  factory $RecommendedActivityCopyWith(
    RecommendedActivity value,
    $Res Function(RecommendedActivity) then,
  ) = _$RecommendedActivityCopyWithImpl<$Res, RecommendedActivity>;
  @useResult
  $Res call({
    String id,
    String type,
    String name,
    String nameAr,
    String description,
    String descriptionAr,
    int durationMinutes,
    int intensity,
    double expectedStrain,
    bool isPrimary,
    String? iconName,
  });
}

/// @nodoc
class _$RecommendedActivityCopyWithImpl<$Res, $Val extends RecommendedActivity>
    implements $RecommendedActivityCopyWith<$Res> {
  _$RecommendedActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendedActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? nameAr = null,
    Object? description = null,
    Object? descriptionAr = null,
    Object? durationMinutes = null,
    Object? intensity = null,
    Object? expectedStrain = null,
    Object? isPrimary = null,
    Object? iconName = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            nameAr: null == nameAr
                ? _value.nameAr
                : nameAr // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionAr: null == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String,
            durationMinutes: null == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            intensity: null == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                      as int,
            expectedStrain: null == expectedStrain
                ? _value.expectedStrain
                : expectedStrain // ignore: cast_nullable_to_non_nullable
                      as double,
            isPrimary: null == isPrimary
                ? _value.isPrimary
                : isPrimary // ignore: cast_nullable_to_non_nullable
                      as bool,
            iconName: freezed == iconName
                ? _value.iconName
                : iconName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecommendedActivityImplCopyWith<$Res>
    implements $RecommendedActivityCopyWith<$Res> {
  factory _$$RecommendedActivityImplCopyWith(
    _$RecommendedActivityImpl value,
    $Res Function(_$RecommendedActivityImpl) then,
  ) = __$$RecommendedActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String name,
    String nameAr,
    String description,
    String descriptionAr,
    int durationMinutes,
    int intensity,
    double expectedStrain,
    bool isPrimary,
    String? iconName,
  });
}

/// @nodoc
class __$$RecommendedActivityImplCopyWithImpl<$Res>
    extends _$RecommendedActivityCopyWithImpl<$Res, _$RecommendedActivityImpl>
    implements _$$RecommendedActivityImplCopyWith<$Res> {
  __$$RecommendedActivityImplCopyWithImpl(
    _$RecommendedActivityImpl _value,
    $Res Function(_$RecommendedActivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecommendedActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? nameAr = null,
    Object? description = null,
    Object? descriptionAr = null,
    Object? durationMinutes = null,
    Object? intensity = null,
    Object? expectedStrain = null,
    Object? isPrimary = null,
    Object? iconName = freezed,
  }) {
    return _then(
      _$RecommendedActivityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAr: null == nameAr
            ? _value.nameAr
            : nameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: null == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String,
        durationMinutes: null == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        intensity: null == intensity
            ? _value.intensity
            : intensity // ignore: cast_nullable_to_non_nullable
                  as int,
        expectedStrain: null == expectedStrain
            ? _value.expectedStrain
            : expectedStrain // ignore: cast_nullable_to_non_nullable
                  as double,
        isPrimary: null == isPrimary
            ? _value.isPrimary
            : isPrimary // ignore: cast_nullable_to_non_nullable
                  as bool,
        iconName: freezed == iconName
            ? _value.iconName
            : iconName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendedActivityImpl implements _RecommendedActivity {
  const _$RecommendedActivityImpl({
    required this.id,
    required this.type,
    required this.name,
    required this.nameAr,
    required this.description,
    required this.descriptionAr,
    required this.durationMinutes,
    required this.intensity,
    required this.expectedStrain,
    this.isPrimary = false,
    this.iconName,
  });

  factory _$RecommendedActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendedActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String name;
  @override
  final String nameAr;
  @override
  final String description;
  @override
  final String descriptionAr;

  /// Duration in minutes
  @override
  final int durationMinutes;

  /// Intensity (1-5)
  @override
  final int intensity;

  /// Expected strain contribution
  @override
  final double expectedStrain;

  /// Is this the primary recommendation?
  @override
  @JsonKey()
  final bool isPrimary;

  /// Icon name for UI
  @override
  final String? iconName;

  @override
  String toString() {
    return 'RecommendedActivity(id: $id, type: $type, name: $name, nameAr: $nameAr, description: $description, descriptionAr: $descriptionAr, durationMinutes: $durationMinutes, intensity: $intensity, expectedStrain: $expectedStrain, isPrimary: $isPrimary, iconName: $iconName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendedActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.expectedStrain, expectedStrain) ||
                other.expectedStrain == expectedStrain) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    name,
    nameAr,
    description,
    descriptionAr,
    durationMinutes,
    intensity,
    expectedStrain,
    isPrimary,
    iconName,
  );

  /// Create a copy of RecommendedActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendedActivityImplCopyWith<_$RecommendedActivityImpl> get copyWith =>
      __$$RecommendedActivityImplCopyWithImpl<_$RecommendedActivityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendedActivityImplToJson(this);
  }
}

abstract class _RecommendedActivity implements RecommendedActivity {
  const factory _RecommendedActivity({
    required final String id,
    required final String type,
    required final String name,
    required final String nameAr,
    required final String description,
    required final String descriptionAr,
    required final int durationMinutes,
    required final int intensity,
    required final double expectedStrain,
    final bool isPrimary,
    final String? iconName,
  }) = _$RecommendedActivityImpl;

  factory _RecommendedActivity.fromJson(Map<String, dynamic> json) =
      _$RecommendedActivityImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get name;
  @override
  String get nameAr;
  @override
  String get description;
  @override
  String get descriptionAr;

  /// Duration in minutes
  @override
  int get durationMinutes;

  /// Intensity (1-5)
  @override
  int get intensity;

  /// Expected strain contribution
  @override
  double get expectedStrain;

  /// Is this the primary recommendation?
  @override
  bool get isPrimary;

  /// Icon name for UI
  @override
  String? get iconName;

  /// Create a copy of RecommendedActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendedActivityImplCopyWith<_$RecommendedActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OutlookInsight _$OutlookInsightFromJson(Map<String, dynamic> json) {
  return _OutlookInsight.fromJson(json);
}

/// @nodoc
mixin _$OutlookInsight {
  String get id => throw _privateConstructorUsedError;
  OutlookInsightType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titleAr => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get messageAr => throw _privateConstructorUsedError;

  /// Priority (1 = highest)
  int get priority => throw _privateConstructorUsedError;

  /// Is this actionable?
  bool get isActionable => throw _privateConstructorUsedError;

  /// Action if actionable
  String? get actionType => throw _privateConstructorUsedError;

  /// Serializes this OutlookInsight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutlookInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutlookInsightCopyWith<OutlookInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutlookInsightCopyWith<$Res> {
  factory $OutlookInsightCopyWith(
    OutlookInsight value,
    $Res Function(OutlookInsight) then,
  ) = _$OutlookInsightCopyWithImpl<$Res, OutlookInsight>;
  @useResult
  $Res call({
    String id,
    OutlookInsightType type,
    String title,
    String titleAr,
    String message,
    String messageAr,
    int priority,
    bool isActionable,
    String? actionType,
  });
}

/// @nodoc
class _$OutlookInsightCopyWithImpl<$Res, $Val extends OutlookInsight>
    implements $OutlookInsightCopyWith<$Res> {
  _$OutlookInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutlookInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? titleAr = null,
    Object? message = null,
    Object? messageAr = null,
    Object? priority = null,
    Object? isActionable = null,
    Object? actionType = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as OutlookInsightType,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            titleAr: null == titleAr
                ? _value.titleAr
                : titleAr // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            messageAr: null == messageAr
                ? _value.messageAr
                : messageAr // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as int,
            isActionable: null == isActionable
                ? _value.isActionable
                : isActionable // ignore: cast_nullable_to_non_nullable
                      as bool,
            actionType: freezed == actionType
                ? _value.actionType
                : actionType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OutlookInsightImplCopyWith<$Res>
    implements $OutlookInsightCopyWith<$Res> {
  factory _$$OutlookInsightImplCopyWith(
    _$OutlookInsightImpl value,
    $Res Function(_$OutlookInsightImpl) then,
  ) = __$$OutlookInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    OutlookInsightType type,
    String title,
    String titleAr,
    String message,
    String messageAr,
    int priority,
    bool isActionable,
    String? actionType,
  });
}

/// @nodoc
class __$$OutlookInsightImplCopyWithImpl<$Res>
    extends _$OutlookInsightCopyWithImpl<$Res, _$OutlookInsightImpl>
    implements _$$OutlookInsightImplCopyWith<$Res> {
  __$$OutlookInsightImplCopyWithImpl(
    _$OutlookInsightImpl _value,
    $Res Function(_$OutlookInsightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutlookInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? titleAr = null,
    Object? message = null,
    Object? messageAr = null,
    Object? priority = null,
    Object? isActionable = null,
    Object? actionType = freezed,
  }) {
    return _then(
      _$OutlookInsightImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as OutlookInsightType,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        titleAr: null == titleAr
            ? _value.titleAr
            : titleAr // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        messageAr: null == messageAr
            ? _value.messageAr
            : messageAr // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as int,
        isActionable: null == isActionable
            ? _value.isActionable
            : isActionable // ignore: cast_nullable_to_non_nullable
                  as bool,
        actionType: freezed == actionType
            ? _value.actionType
            : actionType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OutlookInsightImpl implements _OutlookInsight {
  const _$OutlookInsightImpl({
    required this.id,
    required this.type,
    required this.title,
    required this.titleAr,
    required this.message,
    required this.messageAr,
    this.priority = 3,
    this.isActionable = false,
    this.actionType,
  });

  factory _$OutlookInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutlookInsightImplFromJson(json);

  @override
  final String id;
  @override
  final OutlookInsightType type;
  @override
  final String title;
  @override
  final String titleAr;
  @override
  final String message;
  @override
  final String messageAr;

  /// Priority (1 = highest)
  @override
  @JsonKey()
  final int priority;

  /// Is this actionable?
  @override
  @JsonKey()
  final bool isActionable;

  /// Action if actionable
  @override
  final String? actionType;

  @override
  String toString() {
    return 'OutlookInsight(id: $id, type: $type, title: $title, titleAr: $titleAr, message: $message, messageAr: $messageAr, priority: $priority, isActionable: $isActionable, actionType: $actionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutlookInsightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageAr, messageAr) ||
                other.messageAr == messageAr) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.isActionable, isActionable) ||
                other.isActionable == isActionable) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    title,
    titleAr,
    message,
    messageAr,
    priority,
    isActionable,
    actionType,
  );

  /// Create a copy of OutlookInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutlookInsightImplCopyWith<_$OutlookInsightImpl> get copyWith =>
      __$$OutlookInsightImplCopyWithImpl<_$OutlookInsightImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OutlookInsightImplToJson(this);
  }
}

abstract class _OutlookInsight implements OutlookInsight {
  const factory _OutlookInsight({
    required final String id,
    required final OutlookInsightType type,
    required final String title,
    required final String titleAr,
    required final String message,
    required final String messageAr,
    final int priority,
    final bool isActionable,
    final String? actionType,
  }) = _$OutlookInsightImpl;

  factory _OutlookInsight.fromJson(Map<String, dynamic> json) =
      _$OutlookInsightImpl.fromJson;

  @override
  String get id;
  @override
  OutlookInsightType get type;
  @override
  String get title;
  @override
  String get titleAr;
  @override
  String get message;
  @override
  String get messageAr;

  /// Priority (1 = highest)
  @override
  int get priority;

  /// Is this actionable?
  @override
  bool get isActionable;

  /// Action if actionable
  @override
  String? get actionType;

  /// Create a copy of OutlookInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutlookInsightImplCopyWith<_$OutlookInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
