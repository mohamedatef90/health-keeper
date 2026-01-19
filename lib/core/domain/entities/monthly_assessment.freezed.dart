// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_assessment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MonthlyAssessment _$MonthlyAssessmentFromJson(Map<String, dynamic> json) {
  return _MonthlyAssessment.fromJson(json);
}

/// @nodoc
mixin _$MonthlyAssessment {
  String get id => throw _privateConstructorUsedError;
  DateTime get monthStart => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Monthly averages
  MonthlyAverages get averages => throw _privateConstructorUsedError;

  /// Comparison with previous month
  MonthlyComparison? get comparison => throw _privateConstructorUsedError;

  /// Recovery trends
  TrendAnalysis get recoveryTrend => throw _privateConstructorUsedError;

  /// Strain trends
  TrendAnalysis get strainTrend => throw _privateConstructorUsedError;

  /// Sleep trends
  TrendAnalysis get sleepTrend => throw _privateConstructorUsedError;

  /// Top positive behavior correlations
  List<MonthlyBehaviorCorrelation> get positiveCorrelations =>
      throw _privateConstructorUsedError;

  /// Top negative behavior correlations
  List<MonthlyBehaviorCorrelation> get negativeCorrelations =>
      throw _privateConstructorUsedError;

  /// Weekly breakdowns
  List<WeeklyBreakdown> get weeklyBreakdowns =>
      throw _privateConstructorUsedError;

  /// Key insights
  List<MonthlyInsight> get insights => throw _privateConstructorUsedError;

  /// AI-generated summary
  String? get aiSummary => throw _privateConstructorUsedError;

  /// Arabic AI summary
  String? get aiSummaryAr => throw _privateConstructorUsedError;

  /// Best day of the month
  DateTime? get bestDay => throw _privateConstructorUsedError;
  int? get bestDayRecovery => throw _privateConstructorUsedError;

  /// Most challenging day
  DateTime? get worstDay => throw _privateConstructorUsedError;
  int? get worstDayRecovery => throw _privateConstructorUsedError;

  /// Total workout days
  int get workoutDays => throw _privateConstructorUsedError;

  /// Total rest days
  int get restDays => throw _privateConstructorUsedError;

  /// Streak data
  MonthlyStreakData? get streakData => throw _privateConstructorUsedError;

  /// Is AI-generated
  bool get isAiGenerated => throw _privateConstructorUsedError;

  /// Data completeness percentage
  int get dataCompleteness => throw _privateConstructorUsedError;

  /// Serializes this MonthlyAssessment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyAssessmentCopyWith<MonthlyAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyAssessmentCopyWith<$Res> {
  factory $MonthlyAssessmentCopyWith(
    MonthlyAssessment value,
    $Res Function(MonthlyAssessment) then,
  ) = _$MonthlyAssessmentCopyWithImpl<$Res, MonthlyAssessment>;
  @useResult
  $Res call({
    String id,
    DateTime monthStart,
    DateTime generatedAt,
    MonthlyAverages averages,
    MonthlyComparison? comparison,
    TrendAnalysis recoveryTrend,
    TrendAnalysis strainTrend,
    TrendAnalysis sleepTrend,
    List<MonthlyBehaviorCorrelation> positiveCorrelations,
    List<MonthlyBehaviorCorrelation> negativeCorrelations,
    List<WeeklyBreakdown> weeklyBreakdowns,
    List<MonthlyInsight> insights,
    String? aiSummary,
    String? aiSummaryAr,
    DateTime? bestDay,
    int? bestDayRecovery,
    DateTime? worstDay,
    int? worstDayRecovery,
    int workoutDays,
    int restDays,
    MonthlyStreakData? streakData,
    bool isAiGenerated,
    int dataCompleteness,
  });

  $MonthlyAveragesCopyWith<$Res> get averages;
  $MonthlyComparisonCopyWith<$Res>? get comparison;
  $TrendAnalysisCopyWith<$Res> get recoveryTrend;
  $TrendAnalysisCopyWith<$Res> get strainTrend;
  $TrendAnalysisCopyWith<$Res> get sleepTrend;
  $MonthlyStreakDataCopyWith<$Res>? get streakData;
}

/// @nodoc
class _$MonthlyAssessmentCopyWithImpl<$Res, $Val extends MonthlyAssessment>
    implements $MonthlyAssessmentCopyWith<$Res> {
  _$MonthlyAssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? monthStart = null,
    Object? generatedAt = null,
    Object? averages = null,
    Object? comparison = freezed,
    Object? recoveryTrend = null,
    Object? strainTrend = null,
    Object? sleepTrend = null,
    Object? positiveCorrelations = null,
    Object? negativeCorrelations = null,
    Object? weeklyBreakdowns = null,
    Object? insights = null,
    Object? aiSummary = freezed,
    Object? aiSummaryAr = freezed,
    Object? bestDay = freezed,
    Object? bestDayRecovery = freezed,
    Object? worstDay = freezed,
    Object? worstDayRecovery = freezed,
    Object? workoutDays = null,
    Object? restDays = null,
    Object? streakData = freezed,
    Object? isAiGenerated = null,
    Object? dataCompleteness = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            monthStart: null == monthStart
                ? _value.monthStart
                : monthStart // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            averages: null == averages
                ? _value.averages
                : averages // ignore: cast_nullable_to_non_nullable
                      as MonthlyAverages,
            comparison: freezed == comparison
                ? _value.comparison
                : comparison // ignore: cast_nullable_to_non_nullable
                      as MonthlyComparison?,
            recoveryTrend: null == recoveryTrend
                ? _value.recoveryTrend
                : recoveryTrend // ignore: cast_nullable_to_non_nullable
                      as TrendAnalysis,
            strainTrend: null == strainTrend
                ? _value.strainTrend
                : strainTrend // ignore: cast_nullable_to_non_nullable
                      as TrendAnalysis,
            sleepTrend: null == sleepTrend
                ? _value.sleepTrend
                : sleepTrend // ignore: cast_nullable_to_non_nullable
                      as TrendAnalysis,
            positiveCorrelations: null == positiveCorrelations
                ? _value.positiveCorrelations
                : positiveCorrelations // ignore: cast_nullable_to_non_nullable
                      as List<MonthlyBehaviorCorrelation>,
            negativeCorrelations: null == negativeCorrelations
                ? _value.negativeCorrelations
                : negativeCorrelations // ignore: cast_nullable_to_non_nullable
                      as List<MonthlyBehaviorCorrelation>,
            weeklyBreakdowns: null == weeklyBreakdowns
                ? _value.weeklyBreakdowns
                : weeklyBreakdowns // ignore: cast_nullable_to_non_nullable
                      as List<WeeklyBreakdown>,
            insights: null == insights
                ? _value.insights
                : insights // ignore: cast_nullable_to_non_nullable
                      as List<MonthlyInsight>,
            aiSummary: freezed == aiSummary
                ? _value.aiSummary
                : aiSummary // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiSummaryAr: freezed == aiSummaryAr
                ? _value.aiSummaryAr
                : aiSummaryAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            bestDay: freezed == bestDay
                ? _value.bestDay
                : bestDay // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            bestDayRecovery: freezed == bestDayRecovery
                ? _value.bestDayRecovery
                : bestDayRecovery // ignore: cast_nullable_to_non_nullable
                      as int?,
            worstDay: freezed == worstDay
                ? _value.worstDay
                : worstDay // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            worstDayRecovery: freezed == worstDayRecovery
                ? _value.worstDayRecovery
                : worstDayRecovery // ignore: cast_nullable_to_non_nullable
                      as int?,
            workoutDays: null == workoutDays
                ? _value.workoutDays
                : workoutDays // ignore: cast_nullable_to_non_nullable
                      as int,
            restDays: null == restDays
                ? _value.restDays
                : restDays // ignore: cast_nullable_to_non_nullable
                      as int,
            streakData: freezed == streakData
                ? _value.streakData
                : streakData // ignore: cast_nullable_to_non_nullable
                      as MonthlyStreakData?,
            isAiGenerated: null == isAiGenerated
                ? _value.isAiGenerated
                : isAiGenerated // ignore: cast_nullable_to_non_nullable
                      as bool,
            dataCompleteness: null == dataCompleteness
                ? _value.dataCompleteness
                : dataCompleteness // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonthlyAveragesCopyWith<$Res> get averages {
    return $MonthlyAveragesCopyWith<$Res>(_value.averages, (value) {
      return _then(_value.copyWith(averages: value) as $Val);
    });
  }

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonthlyComparisonCopyWith<$Res>? get comparison {
    if (_value.comparison == null) {
      return null;
    }

    return $MonthlyComparisonCopyWith<$Res>(_value.comparison!, (value) {
      return _then(_value.copyWith(comparison: value) as $Val);
    });
  }

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrendAnalysisCopyWith<$Res> get recoveryTrend {
    return $TrendAnalysisCopyWith<$Res>(_value.recoveryTrend, (value) {
      return _then(_value.copyWith(recoveryTrend: value) as $Val);
    });
  }

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrendAnalysisCopyWith<$Res> get strainTrend {
    return $TrendAnalysisCopyWith<$Res>(_value.strainTrend, (value) {
      return _then(_value.copyWith(strainTrend: value) as $Val);
    });
  }

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrendAnalysisCopyWith<$Res> get sleepTrend {
    return $TrendAnalysisCopyWith<$Res>(_value.sleepTrend, (value) {
      return _then(_value.copyWith(sleepTrend: value) as $Val);
    });
  }

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonthlyStreakDataCopyWith<$Res>? get streakData {
    if (_value.streakData == null) {
      return null;
    }

    return $MonthlyStreakDataCopyWith<$Res>(_value.streakData!, (value) {
      return _then(_value.copyWith(streakData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonthlyAssessmentImplCopyWith<$Res>
    implements $MonthlyAssessmentCopyWith<$Res> {
  factory _$$MonthlyAssessmentImplCopyWith(
    _$MonthlyAssessmentImpl value,
    $Res Function(_$MonthlyAssessmentImpl) then,
  ) = __$$MonthlyAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime monthStart,
    DateTime generatedAt,
    MonthlyAverages averages,
    MonthlyComparison? comparison,
    TrendAnalysis recoveryTrend,
    TrendAnalysis strainTrend,
    TrendAnalysis sleepTrend,
    List<MonthlyBehaviorCorrelation> positiveCorrelations,
    List<MonthlyBehaviorCorrelation> negativeCorrelations,
    List<WeeklyBreakdown> weeklyBreakdowns,
    List<MonthlyInsight> insights,
    String? aiSummary,
    String? aiSummaryAr,
    DateTime? bestDay,
    int? bestDayRecovery,
    DateTime? worstDay,
    int? worstDayRecovery,
    int workoutDays,
    int restDays,
    MonthlyStreakData? streakData,
    bool isAiGenerated,
    int dataCompleteness,
  });

  @override
  $MonthlyAveragesCopyWith<$Res> get averages;
  @override
  $MonthlyComparisonCopyWith<$Res>? get comparison;
  @override
  $TrendAnalysisCopyWith<$Res> get recoveryTrend;
  @override
  $TrendAnalysisCopyWith<$Res> get strainTrend;
  @override
  $TrendAnalysisCopyWith<$Res> get sleepTrend;
  @override
  $MonthlyStreakDataCopyWith<$Res>? get streakData;
}

/// @nodoc
class __$$MonthlyAssessmentImplCopyWithImpl<$Res>
    extends _$MonthlyAssessmentCopyWithImpl<$Res, _$MonthlyAssessmentImpl>
    implements _$$MonthlyAssessmentImplCopyWith<$Res> {
  __$$MonthlyAssessmentImplCopyWithImpl(
    _$MonthlyAssessmentImpl _value,
    $Res Function(_$MonthlyAssessmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? monthStart = null,
    Object? generatedAt = null,
    Object? averages = null,
    Object? comparison = freezed,
    Object? recoveryTrend = null,
    Object? strainTrend = null,
    Object? sleepTrend = null,
    Object? positiveCorrelations = null,
    Object? negativeCorrelations = null,
    Object? weeklyBreakdowns = null,
    Object? insights = null,
    Object? aiSummary = freezed,
    Object? aiSummaryAr = freezed,
    Object? bestDay = freezed,
    Object? bestDayRecovery = freezed,
    Object? worstDay = freezed,
    Object? worstDayRecovery = freezed,
    Object? workoutDays = null,
    Object? restDays = null,
    Object? streakData = freezed,
    Object? isAiGenerated = null,
    Object? dataCompleteness = null,
  }) {
    return _then(
      _$MonthlyAssessmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        monthStart: null == monthStart
            ? _value.monthStart
            : monthStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        averages: null == averages
            ? _value.averages
            : averages // ignore: cast_nullable_to_non_nullable
                  as MonthlyAverages,
        comparison: freezed == comparison
            ? _value.comparison
            : comparison // ignore: cast_nullable_to_non_nullable
                  as MonthlyComparison?,
        recoveryTrend: null == recoveryTrend
            ? _value.recoveryTrend
            : recoveryTrend // ignore: cast_nullable_to_non_nullable
                  as TrendAnalysis,
        strainTrend: null == strainTrend
            ? _value.strainTrend
            : strainTrend // ignore: cast_nullable_to_non_nullable
                  as TrendAnalysis,
        sleepTrend: null == sleepTrend
            ? _value.sleepTrend
            : sleepTrend // ignore: cast_nullable_to_non_nullable
                  as TrendAnalysis,
        positiveCorrelations: null == positiveCorrelations
            ? _value._positiveCorrelations
            : positiveCorrelations // ignore: cast_nullable_to_non_nullable
                  as List<MonthlyBehaviorCorrelation>,
        negativeCorrelations: null == negativeCorrelations
            ? _value._negativeCorrelations
            : negativeCorrelations // ignore: cast_nullable_to_non_nullable
                  as List<MonthlyBehaviorCorrelation>,
        weeklyBreakdowns: null == weeklyBreakdowns
            ? _value._weeklyBreakdowns
            : weeklyBreakdowns // ignore: cast_nullable_to_non_nullable
                  as List<WeeklyBreakdown>,
        insights: null == insights
            ? _value._insights
            : insights // ignore: cast_nullable_to_non_nullable
                  as List<MonthlyInsight>,
        aiSummary: freezed == aiSummary
            ? _value.aiSummary
            : aiSummary // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiSummaryAr: freezed == aiSummaryAr
            ? _value.aiSummaryAr
            : aiSummaryAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        bestDay: freezed == bestDay
            ? _value.bestDay
            : bestDay // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        bestDayRecovery: freezed == bestDayRecovery
            ? _value.bestDayRecovery
            : bestDayRecovery // ignore: cast_nullable_to_non_nullable
                  as int?,
        worstDay: freezed == worstDay
            ? _value.worstDay
            : worstDay // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        worstDayRecovery: freezed == worstDayRecovery
            ? _value.worstDayRecovery
            : worstDayRecovery // ignore: cast_nullable_to_non_nullable
                  as int?,
        workoutDays: null == workoutDays
            ? _value.workoutDays
            : workoutDays // ignore: cast_nullable_to_non_nullable
                  as int,
        restDays: null == restDays
            ? _value.restDays
            : restDays // ignore: cast_nullable_to_non_nullable
                  as int,
        streakData: freezed == streakData
            ? _value.streakData
            : streakData // ignore: cast_nullable_to_non_nullable
                  as MonthlyStreakData?,
        isAiGenerated: null == isAiGenerated
            ? _value.isAiGenerated
            : isAiGenerated // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$MonthlyAssessmentImpl extends _MonthlyAssessment {
  const _$MonthlyAssessmentImpl({
    required this.id,
    required this.monthStart,
    required this.generatedAt,
    required this.averages,
    this.comparison,
    required this.recoveryTrend,
    required this.strainTrend,
    required this.sleepTrend,
    final List<MonthlyBehaviorCorrelation> positiveCorrelations = const [],
    final List<MonthlyBehaviorCorrelation> negativeCorrelations = const [],
    final List<WeeklyBreakdown> weeklyBreakdowns = const [],
    final List<MonthlyInsight> insights = const [],
    this.aiSummary,
    this.aiSummaryAr,
    this.bestDay,
    this.bestDayRecovery,
    this.worstDay,
    this.worstDayRecovery,
    required this.workoutDays,
    required this.restDays,
    this.streakData,
    this.isAiGenerated = false,
    this.dataCompleteness = 0,
  }) : _positiveCorrelations = positiveCorrelations,
       _negativeCorrelations = negativeCorrelations,
       _weeklyBreakdowns = weeklyBreakdowns,
       _insights = insights,
       super._();

  factory _$MonthlyAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyAssessmentImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime monthStart;
  @override
  final DateTime generatedAt;

  /// Monthly averages
  @override
  final MonthlyAverages averages;

  /// Comparison with previous month
  @override
  final MonthlyComparison? comparison;

  /// Recovery trends
  @override
  final TrendAnalysis recoveryTrend;

  /// Strain trends
  @override
  final TrendAnalysis strainTrend;

  /// Sleep trends
  @override
  final TrendAnalysis sleepTrend;

  /// Top positive behavior correlations
  final List<MonthlyBehaviorCorrelation> _positiveCorrelations;

  /// Top positive behavior correlations
  @override
  @JsonKey()
  List<MonthlyBehaviorCorrelation> get positiveCorrelations {
    if (_positiveCorrelations is EqualUnmodifiableListView)
      return _positiveCorrelations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positiveCorrelations);
  }

  /// Top negative behavior correlations
  final List<MonthlyBehaviorCorrelation> _negativeCorrelations;

  /// Top negative behavior correlations
  @override
  @JsonKey()
  List<MonthlyBehaviorCorrelation> get negativeCorrelations {
    if (_negativeCorrelations is EqualUnmodifiableListView)
      return _negativeCorrelations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_negativeCorrelations);
  }

  /// Weekly breakdowns
  final List<WeeklyBreakdown> _weeklyBreakdowns;

  /// Weekly breakdowns
  @override
  @JsonKey()
  List<WeeklyBreakdown> get weeklyBreakdowns {
    if (_weeklyBreakdowns is EqualUnmodifiableListView)
      return _weeklyBreakdowns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyBreakdowns);
  }

  /// Key insights
  final List<MonthlyInsight> _insights;

  /// Key insights
  @override
  @JsonKey()
  List<MonthlyInsight> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  /// AI-generated summary
  @override
  final String? aiSummary;

  /// Arabic AI summary
  @override
  final String? aiSummaryAr;

  /// Best day of the month
  @override
  final DateTime? bestDay;
  @override
  final int? bestDayRecovery;

  /// Most challenging day
  @override
  final DateTime? worstDay;
  @override
  final int? worstDayRecovery;

  /// Total workout days
  @override
  final int workoutDays;

  /// Total rest days
  @override
  final int restDays;

  /// Streak data
  @override
  final MonthlyStreakData? streakData;

  /// Is AI-generated
  @override
  @JsonKey()
  final bool isAiGenerated;

  /// Data completeness percentage
  @override
  @JsonKey()
  final int dataCompleteness;

  @override
  String toString() {
    return 'MonthlyAssessment(id: $id, monthStart: $monthStart, generatedAt: $generatedAt, averages: $averages, comparison: $comparison, recoveryTrend: $recoveryTrend, strainTrend: $strainTrend, sleepTrend: $sleepTrend, positiveCorrelations: $positiveCorrelations, negativeCorrelations: $negativeCorrelations, weeklyBreakdowns: $weeklyBreakdowns, insights: $insights, aiSummary: $aiSummary, aiSummaryAr: $aiSummaryAr, bestDay: $bestDay, bestDayRecovery: $bestDayRecovery, worstDay: $worstDay, worstDayRecovery: $worstDayRecovery, workoutDays: $workoutDays, restDays: $restDays, streakData: $streakData, isAiGenerated: $isAiGenerated, dataCompleteness: $dataCompleteness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyAssessmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.monthStart, monthStart) ||
                other.monthStart == monthStart) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.averages, averages) ||
                other.averages == averages) &&
            (identical(other.comparison, comparison) ||
                other.comparison == comparison) &&
            (identical(other.recoveryTrend, recoveryTrend) ||
                other.recoveryTrend == recoveryTrend) &&
            (identical(other.strainTrend, strainTrend) ||
                other.strainTrend == strainTrend) &&
            (identical(other.sleepTrend, sleepTrend) ||
                other.sleepTrend == sleepTrend) &&
            const DeepCollectionEquality().equals(
              other._positiveCorrelations,
              _positiveCorrelations,
            ) &&
            const DeepCollectionEquality().equals(
              other._negativeCorrelations,
              _negativeCorrelations,
            ) &&
            const DeepCollectionEquality().equals(
              other._weeklyBreakdowns,
              _weeklyBreakdowns,
            ) &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            (identical(other.aiSummary, aiSummary) ||
                other.aiSummary == aiSummary) &&
            (identical(other.aiSummaryAr, aiSummaryAr) ||
                other.aiSummaryAr == aiSummaryAr) &&
            (identical(other.bestDay, bestDay) || other.bestDay == bestDay) &&
            (identical(other.bestDayRecovery, bestDayRecovery) ||
                other.bestDayRecovery == bestDayRecovery) &&
            (identical(other.worstDay, worstDay) ||
                other.worstDay == worstDay) &&
            (identical(other.worstDayRecovery, worstDayRecovery) ||
                other.worstDayRecovery == worstDayRecovery) &&
            (identical(other.workoutDays, workoutDays) ||
                other.workoutDays == workoutDays) &&
            (identical(other.restDays, restDays) ||
                other.restDays == restDays) &&
            (identical(other.streakData, streakData) ||
                other.streakData == streakData) &&
            (identical(other.isAiGenerated, isAiGenerated) ||
                other.isAiGenerated == isAiGenerated) &&
            (identical(other.dataCompleteness, dataCompleteness) ||
                other.dataCompleteness == dataCompleteness));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    monthStart,
    generatedAt,
    averages,
    comparison,
    recoveryTrend,
    strainTrend,
    sleepTrend,
    const DeepCollectionEquality().hash(_positiveCorrelations),
    const DeepCollectionEquality().hash(_negativeCorrelations),
    const DeepCollectionEquality().hash(_weeklyBreakdowns),
    const DeepCollectionEquality().hash(_insights),
    aiSummary,
    aiSummaryAr,
    bestDay,
    bestDayRecovery,
    worstDay,
    worstDayRecovery,
    workoutDays,
    restDays,
    streakData,
    isAiGenerated,
    dataCompleteness,
  ]);

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyAssessmentImplCopyWith<_$MonthlyAssessmentImpl> get copyWith =>
      __$$MonthlyAssessmentImplCopyWithImpl<_$MonthlyAssessmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyAssessmentImplToJson(this);
  }
}

abstract class _MonthlyAssessment extends MonthlyAssessment {
  const factory _MonthlyAssessment({
    required final String id,
    required final DateTime monthStart,
    required final DateTime generatedAt,
    required final MonthlyAverages averages,
    final MonthlyComparison? comparison,
    required final TrendAnalysis recoveryTrend,
    required final TrendAnalysis strainTrend,
    required final TrendAnalysis sleepTrend,
    final List<MonthlyBehaviorCorrelation> positiveCorrelations,
    final List<MonthlyBehaviorCorrelation> negativeCorrelations,
    final List<WeeklyBreakdown> weeklyBreakdowns,
    final List<MonthlyInsight> insights,
    final String? aiSummary,
    final String? aiSummaryAr,
    final DateTime? bestDay,
    final int? bestDayRecovery,
    final DateTime? worstDay,
    final int? worstDayRecovery,
    required final int workoutDays,
    required final int restDays,
    final MonthlyStreakData? streakData,
    final bool isAiGenerated,
    final int dataCompleteness,
  }) = _$MonthlyAssessmentImpl;
  const _MonthlyAssessment._() : super._();

  factory _MonthlyAssessment.fromJson(Map<String, dynamic> json) =
      _$MonthlyAssessmentImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get monthStart;
  @override
  DateTime get generatedAt;

  /// Monthly averages
  @override
  MonthlyAverages get averages;

  /// Comparison with previous month
  @override
  MonthlyComparison? get comparison;

  /// Recovery trends
  @override
  TrendAnalysis get recoveryTrend;

  /// Strain trends
  @override
  TrendAnalysis get strainTrend;

  /// Sleep trends
  @override
  TrendAnalysis get sleepTrend;

  /// Top positive behavior correlations
  @override
  List<MonthlyBehaviorCorrelation> get positiveCorrelations;

  /// Top negative behavior correlations
  @override
  List<MonthlyBehaviorCorrelation> get negativeCorrelations;

  /// Weekly breakdowns
  @override
  List<WeeklyBreakdown> get weeklyBreakdowns;

  /// Key insights
  @override
  List<MonthlyInsight> get insights;

  /// AI-generated summary
  @override
  String? get aiSummary;

  /// Arabic AI summary
  @override
  String? get aiSummaryAr;

  /// Best day of the month
  @override
  DateTime? get bestDay;
  @override
  int? get bestDayRecovery;

  /// Most challenging day
  @override
  DateTime? get worstDay;
  @override
  int? get worstDayRecovery;

  /// Total workout days
  @override
  int get workoutDays;

  /// Total rest days
  @override
  int get restDays;

  /// Streak data
  @override
  MonthlyStreakData? get streakData;

  /// Is AI-generated
  @override
  bool get isAiGenerated;

  /// Data completeness percentage
  @override
  int get dataCompleteness;

  /// Create a copy of MonthlyAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyAssessmentImplCopyWith<_$MonthlyAssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyAverages _$MonthlyAveragesFromJson(Map<String, dynamic> json) {
  return _MonthlyAverages.fromJson(json);
}

/// @nodoc
mixin _$MonthlyAverages {
  /// Average recovery score
  double get avgRecovery => throw _privateConstructorUsedError;

  /// Average strain score
  double get avgStrain => throw _privateConstructorUsedError;

  /// Average sleep hours
  double get avgSleep => throw _privateConstructorUsedError;

  /// Average HRV
  double? get avgHrv => throw _privateConstructorUsedError;

  /// Average RHR
  double? get avgRhr => throw _privateConstructorUsedError;

  /// Average calories consumed
  int? get avgCalories => throw _privateConstructorUsedError;

  /// Average protein consumed
  int? get avgProtein => throw _privateConstructorUsedError;

  /// Average steps
  int? get avgSteps => throw _privateConstructorUsedError;

  /// Serializes this MonthlyAverages to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyAverages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyAveragesCopyWith<MonthlyAverages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyAveragesCopyWith<$Res> {
  factory $MonthlyAveragesCopyWith(
    MonthlyAverages value,
    $Res Function(MonthlyAverages) then,
  ) = _$MonthlyAveragesCopyWithImpl<$Res, MonthlyAverages>;
  @useResult
  $Res call({
    double avgRecovery,
    double avgStrain,
    double avgSleep,
    double? avgHrv,
    double? avgRhr,
    int? avgCalories,
    int? avgProtein,
    int? avgSteps,
  });
}

/// @nodoc
class _$MonthlyAveragesCopyWithImpl<$Res, $Val extends MonthlyAverages>
    implements $MonthlyAveragesCopyWith<$Res> {
  _$MonthlyAveragesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyAverages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgRecovery = null,
    Object? avgStrain = null,
    Object? avgSleep = null,
    Object? avgHrv = freezed,
    Object? avgRhr = freezed,
    Object? avgCalories = freezed,
    Object? avgProtein = freezed,
    Object? avgSteps = freezed,
  }) {
    return _then(
      _value.copyWith(
            avgRecovery: null == avgRecovery
                ? _value.avgRecovery
                : avgRecovery // ignore: cast_nullable_to_non_nullable
                      as double,
            avgStrain: null == avgStrain
                ? _value.avgStrain
                : avgStrain // ignore: cast_nullable_to_non_nullable
                      as double,
            avgSleep: null == avgSleep
                ? _value.avgSleep
                : avgSleep // ignore: cast_nullable_to_non_nullable
                      as double,
            avgHrv: freezed == avgHrv
                ? _value.avgHrv
                : avgHrv // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgRhr: freezed == avgRhr
                ? _value.avgRhr
                : avgRhr // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgCalories: freezed == avgCalories
                ? _value.avgCalories
                : avgCalories // ignore: cast_nullable_to_non_nullable
                      as int?,
            avgProtein: freezed == avgProtein
                ? _value.avgProtein
                : avgProtein // ignore: cast_nullable_to_non_nullable
                      as int?,
            avgSteps: freezed == avgSteps
                ? _value.avgSteps
                : avgSteps // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlyAveragesImplCopyWith<$Res>
    implements $MonthlyAveragesCopyWith<$Res> {
  factory _$$MonthlyAveragesImplCopyWith(
    _$MonthlyAveragesImpl value,
    $Res Function(_$MonthlyAveragesImpl) then,
  ) = __$$MonthlyAveragesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double avgRecovery,
    double avgStrain,
    double avgSleep,
    double? avgHrv,
    double? avgRhr,
    int? avgCalories,
    int? avgProtein,
    int? avgSteps,
  });
}

/// @nodoc
class __$$MonthlyAveragesImplCopyWithImpl<$Res>
    extends _$MonthlyAveragesCopyWithImpl<$Res, _$MonthlyAveragesImpl>
    implements _$$MonthlyAveragesImplCopyWith<$Res> {
  __$$MonthlyAveragesImplCopyWithImpl(
    _$MonthlyAveragesImpl _value,
    $Res Function(_$MonthlyAveragesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyAverages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgRecovery = null,
    Object? avgStrain = null,
    Object? avgSleep = null,
    Object? avgHrv = freezed,
    Object? avgRhr = freezed,
    Object? avgCalories = freezed,
    Object? avgProtein = freezed,
    Object? avgSteps = freezed,
  }) {
    return _then(
      _$MonthlyAveragesImpl(
        avgRecovery: null == avgRecovery
            ? _value.avgRecovery
            : avgRecovery // ignore: cast_nullable_to_non_nullable
                  as double,
        avgStrain: null == avgStrain
            ? _value.avgStrain
            : avgStrain // ignore: cast_nullable_to_non_nullable
                  as double,
        avgSleep: null == avgSleep
            ? _value.avgSleep
            : avgSleep // ignore: cast_nullable_to_non_nullable
                  as double,
        avgHrv: freezed == avgHrv
            ? _value.avgHrv
            : avgHrv // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgRhr: freezed == avgRhr
            ? _value.avgRhr
            : avgRhr // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgCalories: freezed == avgCalories
            ? _value.avgCalories
            : avgCalories // ignore: cast_nullable_to_non_nullable
                  as int?,
        avgProtein: freezed == avgProtein
            ? _value.avgProtein
            : avgProtein // ignore: cast_nullable_to_non_nullable
                  as int?,
        avgSteps: freezed == avgSteps
            ? _value.avgSteps
            : avgSteps // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyAveragesImpl implements _MonthlyAverages {
  const _$MonthlyAveragesImpl({
    required this.avgRecovery,
    required this.avgStrain,
    required this.avgSleep,
    this.avgHrv,
    this.avgRhr,
    this.avgCalories,
    this.avgProtein,
    this.avgSteps,
  });

  factory _$MonthlyAveragesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyAveragesImplFromJson(json);

  /// Average recovery score
  @override
  final double avgRecovery;

  /// Average strain score
  @override
  final double avgStrain;

  /// Average sleep hours
  @override
  final double avgSleep;

  /// Average HRV
  @override
  final double? avgHrv;

  /// Average RHR
  @override
  final double? avgRhr;

  /// Average calories consumed
  @override
  final int? avgCalories;

  /// Average protein consumed
  @override
  final int? avgProtein;

  /// Average steps
  @override
  final int? avgSteps;

  @override
  String toString() {
    return 'MonthlyAverages(avgRecovery: $avgRecovery, avgStrain: $avgStrain, avgSleep: $avgSleep, avgHrv: $avgHrv, avgRhr: $avgRhr, avgCalories: $avgCalories, avgProtein: $avgProtein, avgSteps: $avgSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyAveragesImpl &&
            (identical(other.avgRecovery, avgRecovery) ||
                other.avgRecovery == avgRecovery) &&
            (identical(other.avgStrain, avgStrain) ||
                other.avgStrain == avgStrain) &&
            (identical(other.avgSleep, avgSleep) ||
                other.avgSleep == avgSleep) &&
            (identical(other.avgHrv, avgHrv) || other.avgHrv == avgHrv) &&
            (identical(other.avgRhr, avgRhr) || other.avgRhr == avgRhr) &&
            (identical(other.avgCalories, avgCalories) ||
                other.avgCalories == avgCalories) &&
            (identical(other.avgProtein, avgProtein) ||
                other.avgProtein == avgProtein) &&
            (identical(other.avgSteps, avgSteps) ||
                other.avgSteps == avgSteps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    avgRecovery,
    avgStrain,
    avgSleep,
    avgHrv,
    avgRhr,
    avgCalories,
    avgProtein,
    avgSteps,
  );

  /// Create a copy of MonthlyAverages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyAveragesImplCopyWith<_$MonthlyAveragesImpl> get copyWith =>
      __$$MonthlyAveragesImplCopyWithImpl<_$MonthlyAveragesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyAveragesImplToJson(this);
  }
}

abstract class _MonthlyAverages implements MonthlyAverages {
  const factory _MonthlyAverages({
    required final double avgRecovery,
    required final double avgStrain,
    required final double avgSleep,
    final double? avgHrv,
    final double? avgRhr,
    final int? avgCalories,
    final int? avgProtein,
    final int? avgSteps,
  }) = _$MonthlyAveragesImpl;

  factory _MonthlyAverages.fromJson(Map<String, dynamic> json) =
      _$MonthlyAveragesImpl.fromJson;

  /// Average recovery score
  @override
  double get avgRecovery;

  /// Average strain score
  @override
  double get avgStrain;

  /// Average sleep hours
  @override
  double get avgSleep;

  /// Average HRV
  @override
  double? get avgHrv;

  /// Average RHR
  @override
  double? get avgRhr;

  /// Average calories consumed
  @override
  int? get avgCalories;

  /// Average protein consumed
  @override
  int? get avgProtein;

  /// Average steps
  @override
  int? get avgSteps;

  /// Create a copy of MonthlyAverages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyAveragesImplCopyWith<_$MonthlyAveragesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyComparison _$MonthlyComparisonFromJson(Map<String, dynamic> json) {
  return _MonthlyComparison.fromJson(json);
}

/// @nodoc
mixin _$MonthlyComparison {
  /// Recovery change (percentage points)
  double get recoveryChange => throw _privateConstructorUsedError;

  /// Strain change
  double get strainChange => throw _privateConstructorUsedError;

  /// Sleep change (hours)
  double get sleepChange => throw _privateConstructorUsedError;

  /// HRV change
  double? get hrvChange => throw _privateConstructorUsedError;

  /// RHR change
  double? get rhrChange => throw _privateConstructorUsedError;

  /// Workout days change
  int? get workoutDaysChange => throw _privateConstructorUsedError;

  /// Serializes this MonthlyComparison to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyComparisonCopyWith<MonthlyComparison> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyComparisonCopyWith<$Res> {
  factory $MonthlyComparisonCopyWith(
    MonthlyComparison value,
    $Res Function(MonthlyComparison) then,
  ) = _$MonthlyComparisonCopyWithImpl<$Res, MonthlyComparison>;
  @useResult
  $Res call({
    double recoveryChange,
    double strainChange,
    double sleepChange,
    double? hrvChange,
    double? rhrChange,
    int? workoutDaysChange,
  });
}

/// @nodoc
class _$MonthlyComparisonCopyWithImpl<$Res, $Val extends MonthlyComparison>
    implements $MonthlyComparisonCopyWith<$Res> {
  _$MonthlyComparisonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recoveryChange = null,
    Object? strainChange = null,
    Object? sleepChange = null,
    Object? hrvChange = freezed,
    Object? rhrChange = freezed,
    Object? workoutDaysChange = freezed,
  }) {
    return _then(
      _value.copyWith(
            recoveryChange: null == recoveryChange
                ? _value.recoveryChange
                : recoveryChange // ignore: cast_nullable_to_non_nullable
                      as double,
            strainChange: null == strainChange
                ? _value.strainChange
                : strainChange // ignore: cast_nullable_to_non_nullable
                      as double,
            sleepChange: null == sleepChange
                ? _value.sleepChange
                : sleepChange // ignore: cast_nullable_to_non_nullable
                      as double,
            hrvChange: freezed == hrvChange
                ? _value.hrvChange
                : hrvChange // ignore: cast_nullable_to_non_nullable
                      as double?,
            rhrChange: freezed == rhrChange
                ? _value.rhrChange
                : rhrChange // ignore: cast_nullable_to_non_nullable
                      as double?,
            workoutDaysChange: freezed == workoutDaysChange
                ? _value.workoutDaysChange
                : workoutDaysChange // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlyComparisonImplCopyWith<$Res>
    implements $MonthlyComparisonCopyWith<$Res> {
  factory _$$MonthlyComparisonImplCopyWith(
    _$MonthlyComparisonImpl value,
    $Res Function(_$MonthlyComparisonImpl) then,
  ) = __$$MonthlyComparisonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double recoveryChange,
    double strainChange,
    double sleepChange,
    double? hrvChange,
    double? rhrChange,
    int? workoutDaysChange,
  });
}

/// @nodoc
class __$$MonthlyComparisonImplCopyWithImpl<$Res>
    extends _$MonthlyComparisonCopyWithImpl<$Res, _$MonthlyComparisonImpl>
    implements _$$MonthlyComparisonImplCopyWith<$Res> {
  __$$MonthlyComparisonImplCopyWithImpl(
    _$MonthlyComparisonImpl _value,
    $Res Function(_$MonthlyComparisonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recoveryChange = null,
    Object? strainChange = null,
    Object? sleepChange = null,
    Object? hrvChange = freezed,
    Object? rhrChange = freezed,
    Object? workoutDaysChange = freezed,
  }) {
    return _then(
      _$MonthlyComparisonImpl(
        recoveryChange: null == recoveryChange
            ? _value.recoveryChange
            : recoveryChange // ignore: cast_nullable_to_non_nullable
                  as double,
        strainChange: null == strainChange
            ? _value.strainChange
            : strainChange // ignore: cast_nullable_to_non_nullable
                  as double,
        sleepChange: null == sleepChange
            ? _value.sleepChange
            : sleepChange // ignore: cast_nullable_to_non_nullable
                  as double,
        hrvChange: freezed == hrvChange
            ? _value.hrvChange
            : hrvChange // ignore: cast_nullable_to_non_nullable
                  as double?,
        rhrChange: freezed == rhrChange
            ? _value.rhrChange
            : rhrChange // ignore: cast_nullable_to_non_nullable
                  as double?,
        workoutDaysChange: freezed == workoutDaysChange
            ? _value.workoutDaysChange
            : workoutDaysChange // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyComparisonImpl extends _MonthlyComparison {
  const _$MonthlyComparisonImpl({
    required this.recoveryChange,
    required this.strainChange,
    required this.sleepChange,
    this.hrvChange,
    this.rhrChange,
    this.workoutDaysChange,
  }) : super._();

  factory _$MonthlyComparisonImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyComparisonImplFromJson(json);

  /// Recovery change (percentage points)
  @override
  final double recoveryChange;

  /// Strain change
  @override
  final double strainChange;

  /// Sleep change (hours)
  @override
  final double sleepChange;

  /// HRV change
  @override
  final double? hrvChange;

  /// RHR change
  @override
  final double? rhrChange;

  /// Workout days change
  @override
  final int? workoutDaysChange;

  @override
  String toString() {
    return 'MonthlyComparison(recoveryChange: $recoveryChange, strainChange: $strainChange, sleepChange: $sleepChange, hrvChange: $hrvChange, rhrChange: $rhrChange, workoutDaysChange: $workoutDaysChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyComparisonImpl &&
            (identical(other.recoveryChange, recoveryChange) ||
                other.recoveryChange == recoveryChange) &&
            (identical(other.strainChange, strainChange) ||
                other.strainChange == strainChange) &&
            (identical(other.sleepChange, sleepChange) ||
                other.sleepChange == sleepChange) &&
            (identical(other.hrvChange, hrvChange) ||
                other.hrvChange == hrvChange) &&
            (identical(other.rhrChange, rhrChange) ||
                other.rhrChange == rhrChange) &&
            (identical(other.workoutDaysChange, workoutDaysChange) ||
                other.workoutDaysChange == workoutDaysChange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    recoveryChange,
    strainChange,
    sleepChange,
    hrvChange,
    rhrChange,
    workoutDaysChange,
  );

  /// Create a copy of MonthlyComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyComparisonImplCopyWith<_$MonthlyComparisonImpl> get copyWith =>
      __$$MonthlyComparisonImplCopyWithImpl<_$MonthlyComparisonImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyComparisonImplToJson(this);
  }
}

abstract class _MonthlyComparison extends MonthlyComparison {
  const factory _MonthlyComparison({
    required final double recoveryChange,
    required final double strainChange,
    required final double sleepChange,
    final double? hrvChange,
    final double? rhrChange,
    final int? workoutDaysChange,
  }) = _$MonthlyComparisonImpl;
  const _MonthlyComparison._() : super._();

  factory _MonthlyComparison.fromJson(Map<String, dynamic> json) =
      _$MonthlyComparisonImpl.fromJson;

  /// Recovery change (percentage points)
  @override
  double get recoveryChange;

  /// Strain change
  @override
  double get strainChange;

  /// Sleep change (hours)
  @override
  double get sleepChange;

  /// HRV change
  @override
  double? get hrvChange;

  /// RHR change
  @override
  double? get rhrChange;

  /// Workout days change
  @override
  int? get workoutDaysChange;

  /// Create a copy of MonthlyComparison
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyComparisonImplCopyWith<_$MonthlyComparisonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrendAnalysis _$TrendAnalysisFromJson(Map<String, dynamic> json) {
  return _TrendAnalysis.fromJson(json);
}

/// @nodoc
mixin _$TrendAnalysis {
  TrendDirection get direction => throw _privateConstructorUsedError;

  /// Percentage change over the month
  double get changePercent => throw _privateConstructorUsedError;

  /// Weekly values for charting
  List<double> get weeklyValues => throw _privateConstructorUsedError;

  /// Is trend statistically significant?
  bool get isSignificant => throw _privateConstructorUsedError;

  /// Serializes this TrendAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrendAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrendAnalysisCopyWith<TrendAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendAnalysisCopyWith<$Res> {
  factory $TrendAnalysisCopyWith(
    TrendAnalysis value,
    $Res Function(TrendAnalysis) then,
  ) = _$TrendAnalysisCopyWithImpl<$Res, TrendAnalysis>;
  @useResult
  $Res call({
    TrendDirection direction,
    double changePercent,
    List<double> weeklyValues,
    bool isSignificant,
  });
}

/// @nodoc
class _$TrendAnalysisCopyWithImpl<$Res, $Val extends TrendAnalysis>
    implements $TrendAnalysisCopyWith<$Res> {
  _$TrendAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrendAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
    Object? changePercent = null,
    Object? weeklyValues = null,
    Object? isSignificant = null,
  }) {
    return _then(
      _value.copyWith(
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as TrendDirection,
            changePercent: null == changePercent
                ? _value.changePercent
                : changePercent // ignore: cast_nullable_to_non_nullable
                      as double,
            weeklyValues: null == weeklyValues
                ? _value.weeklyValues
                : weeklyValues // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            isSignificant: null == isSignificant
                ? _value.isSignificant
                : isSignificant // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrendAnalysisImplCopyWith<$Res>
    implements $TrendAnalysisCopyWith<$Res> {
  factory _$$TrendAnalysisImplCopyWith(
    _$TrendAnalysisImpl value,
    $Res Function(_$TrendAnalysisImpl) then,
  ) = __$$TrendAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TrendDirection direction,
    double changePercent,
    List<double> weeklyValues,
    bool isSignificant,
  });
}

/// @nodoc
class __$$TrendAnalysisImplCopyWithImpl<$Res>
    extends _$TrendAnalysisCopyWithImpl<$Res, _$TrendAnalysisImpl>
    implements _$$TrendAnalysisImplCopyWith<$Res> {
  __$$TrendAnalysisImplCopyWithImpl(
    _$TrendAnalysisImpl _value,
    $Res Function(_$TrendAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TrendAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
    Object? changePercent = null,
    Object? weeklyValues = null,
    Object? isSignificant = null,
  }) {
    return _then(
      _$TrendAnalysisImpl(
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as TrendDirection,
        changePercent: null == changePercent
            ? _value.changePercent
            : changePercent // ignore: cast_nullable_to_non_nullable
                  as double,
        weeklyValues: null == weeklyValues
            ? _value._weeklyValues
            : weeklyValues // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        isSignificant: null == isSignificant
            ? _value.isSignificant
            : isSignificant // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TrendAnalysisImpl implements _TrendAnalysis {
  const _$TrendAnalysisImpl({
    required this.direction,
    required this.changePercent,
    final List<double> weeklyValues = const [],
    this.isSignificant = false,
  }) : _weeklyValues = weeklyValues;

  factory _$TrendAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrendAnalysisImplFromJson(json);

  @override
  final TrendDirection direction;

  /// Percentage change over the month
  @override
  final double changePercent;

  /// Weekly values for charting
  final List<double> _weeklyValues;

  /// Weekly values for charting
  @override
  @JsonKey()
  List<double> get weeklyValues {
    if (_weeklyValues is EqualUnmodifiableListView) return _weeklyValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyValues);
  }

  /// Is trend statistically significant?
  @override
  @JsonKey()
  final bool isSignificant;

  @override
  String toString() {
    return 'TrendAnalysis(direction: $direction, changePercent: $changePercent, weeklyValues: $weeklyValues, isSignificant: $isSignificant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendAnalysisImpl &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.changePercent, changePercent) ||
                other.changePercent == changePercent) &&
            const DeepCollectionEquality().equals(
              other._weeklyValues,
              _weeklyValues,
            ) &&
            (identical(other.isSignificant, isSignificant) ||
                other.isSignificant == isSignificant));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    direction,
    changePercent,
    const DeepCollectionEquality().hash(_weeklyValues),
    isSignificant,
  );

  /// Create a copy of TrendAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendAnalysisImplCopyWith<_$TrendAnalysisImpl> get copyWith =>
      __$$TrendAnalysisImplCopyWithImpl<_$TrendAnalysisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrendAnalysisImplToJson(this);
  }
}

abstract class _TrendAnalysis implements TrendAnalysis {
  const factory _TrendAnalysis({
    required final TrendDirection direction,
    required final double changePercent,
    final List<double> weeklyValues,
    final bool isSignificant,
  }) = _$TrendAnalysisImpl;

  factory _TrendAnalysis.fromJson(Map<String, dynamic> json) =
      _$TrendAnalysisImpl.fromJson;

  @override
  TrendDirection get direction;

  /// Percentage change over the month
  @override
  double get changePercent;

  /// Weekly values for charting
  @override
  List<double> get weeklyValues;

  /// Is trend statistically significant?
  @override
  bool get isSignificant;

  /// Create a copy of TrendAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrendAnalysisImplCopyWith<_$TrendAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyBehaviorCorrelation _$MonthlyBehaviorCorrelationFromJson(
  Map<String, dynamic> json,
) {
  return _MonthlyBehaviorCorrelation.fromJson(json);
}

/// @nodoc
mixin _$MonthlyBehaviorCorrelation {
  String get behaviorId => throw _privateConstructorUsedError;
  String get behaviorName => throw _privateConstructorUsedError;
  String get behaviorNameAr => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  /// Correlation coefficient (-1 to 1)
  double get correlation => throw _privateConstructorUsedError;

  /// Average recovery impact (percentage points)
  double get avgImpact => throw _privateConstructorUsedError;

  /// Number of times behavior was logged
  int get occurrences => throw _privateConstructorUsedError;

  /// Is statistically significant (p < 0.05)?
  bool get isSignificant => throw _privateConstructorUsedError;

  /// Confidence level
  int get confidence => throw _privateConstructorUsedError;

  /// Serializes this MonthlyBehaviorCorrelation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyBehaviorCorrelation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyBehaviorCorrelationCopyWith<MonthlyBehaviorCorrelation>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyBehaviorCorrelationCopyWith<$Res> {
  factory $MonthlyBehaviorCorrelationCopyWith(
    MonthlyBehaviorCorrelation value,
    $Res Function(MonthlyBehaviorCorrelation) then,
  ) =
      _$MonthlyBehaviorCorrelationCopyWithImpl<
        $Res,
        MonthlyBehaviorCorrelation
      >;
  @useResult
  $Res call({
    String behaviorId,
    String behaviorName,
    String behaviorNameAr,
    String category,
    double correlation,
    double avgImpact,
    int occurrences,
    bool isSignificant,
    int confidence,
  });
}

/// @nodoc
class _$MonthlyBehaviorCorrelationCopyWithImpl<
  $Res,
  $Val extends MonthlyBehaviorCorrelation
>
    implements $MonthlyBehaviorCorrelationCopyWith<$Res> {
  _$MonthlyBehaviorCorrelationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyBehaviorCorrelation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? behaviorId = null,
    Object? behaviorName = null,
    Object? behaviorNameAr = null,
    Object? category = null,
    Object? correlation = null,
    Object? avgImpact = null,
    Object? occurrences = null,
    Object? isSignificant = null,
    Object? confidence = null,
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
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            correlation: null == correlation
                ? _value.correlation
                : correlation // ignore: cast_nullable_to_non_nullable
                      as double,
            avgImpact: null == avgImpact
                ? _value.avgImpact
                : avgImpact // ignore: cast_nullable_to_non_nullable
                      as double,
            occurrences: null == occurrences
                ? _value.occurrences
                : occurrences // ignore: cast_nullable_to_non_nullable
                      as int,
            isSignificant: null == isSignificant
                ? _value.isSignificant
                : isSignificant // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$MonthlyBehaviorCorrelationImplCopyWith<$Res>
    implements $MonthlyBehaviorCorrelationCopyWith<$Res> {
  factory _$$MonthlyBehaviorCorrelationImplCopyWith(
    _$MonthlyBehaviorCorrelationImpl value,
    $Res Function(_$MonthlyBehaviorCorrelationImpl) then,
  ) = __$$MonthlyBehaviorCorrelationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String behaviorId,
    String behaviorName,
    String behaviorNameAr,
    String category,
    double correlation,
    double avgImpact,
    int occurrences,
    bool isSignificant,
    int confidence,
  });
}

/// @nodoc
class __$$MonthlyBehaviorCorrelationImplCopyWithImpl<$Res>
    extends
        _$MonthlyBehaviorCorrelationCopyWithImpl<
          $Res,
          _$MonthlyBehaviorCorrelationImpl
        >
    implements _$$MonthlyBehaviorCorrelationImplCopyWith<$Res> {
  __$$MonthlyBehaviorCorrelationImplCopyWithImpl(
    _$MonthlyBehaviorCorrelationImpl _value,
    $Res Function(_$MonthlyBehaviorCorrelationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyBehaviorCorrelation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? behaviorId = null,
    Object? behaviorName = null,
    Object? behaviorNameAr = null,
    Object? category = null,
    Object? correlation = null,
    Object? avgImpact = null,
    Object? occurrences = null,
    Object? isSignificant = null,
    Object? confidence = null,
  }) {
    return _then(
      _$MonthlyBehaviorCorrelationImpl(
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
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        correlation: null == correlation
            ? _value.correlation
            : correlation // ignore: cast_nullable_to_non_nullable
                  as double,
        avgImpact: null == avgImpact
            ? _value.avgImpact
            : avgImpact // ignore: cast_nullable_to_non_nullable
                  as double,
        occurrences: null == occurrences
            ? _value.occurrences
            : occurrences // ignore: cast_nullable_to_non_nullable
                  as int,
        isSignificant: null == isSignificant
            ? _value.isSignificant
            : isSignificant // ignore: cast_nullable_to_non_nullable
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
class _$MonthlyBehaviorCorrelationImpl extends _MonthlyBehaviorCorrelation {
  const _$MonthlyBehaviorCorrelationImpl({
    required this.behaviorId,
    required this.behaviorName,
    required this.behaviorNameAr,
    required this.category,
    required this.correlation,
    required this.avgImpact,
    required this.occurrences,
    this.isSignificant = false,
    this.confidence = 70,
  }) : super._();

  factory _$MonthlyBehaviorCorrelationImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$MonthlyBehaviorCorrelationImplFromJson(json);

  @override
  final String behaviorId;
  @override
  final String behaviorName;
  @override
  final String behaviorNameAr;
  @override
  final String category;

  /// Correlation coefficient (-1 to 1)
  @override
  final double correlation;

  /// Average recovery impact (percentage points)
  @override
  final double avgImpact;

  /// Number of times behavior was logged
  @override
  final int occurrences;

  /// Is statistically significant (p < 0.05)?
  @override
  @JsonKey()
  final bool isSignificant;

  /// Confidence level
  @override
  @JsonKey()
  final int confidence;

  @override
  String toString() {
    return 'MonthlyBehaviorCorrelation(behaviorId: $behaviorId, behaviorName: $behaviorName, behaviorNameAr: $behaviorNameAr, category: $category, correlation: $correlation, avgImpact: $avgImpact, occurrences: $occurrences, isSignificant: $isSignificant, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyBehaviorCorrelationImpl &&
            (identical(other.behaviorId, behaviorId) ||
                other.behaviorId == behaviorId) &&
            (identical(other.behaviorName, behaviorName) ||
                other.behaviorName == behaviorName) &&
            (identical(other.behaviorNameAr, behaviorNameAr) ||
                other.behaviorNameAr == behaviorNameAr) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.correlation, correlation) ||
                other.correlation == correlation) &&
            (identical(other.avgImpact, avgImpact) ||
                other.avgImpact == avgImpact) &&
            (identical(other.occurrences, occurrences) ||
                other.occurrences == occurrences) &&
            (identical(other.isSignificant, isSignificant) ||
                other.isSignificant == isSignificant) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    behaviorId,
    behaviorName,
    behaviorNameAr,
    category,
    correlation,
    avgImpact,
    occurrences,
    isSignificant,
    confidence,
  );

  /// Create a copy of MonthlyBehaviorCorrelation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyBehaviorCorrelationImplCopyWith<_$MonthlyBehaviorCorrelationImpl>
  get copyWith =>
      __$$MonthlyBehaviorCorrelationImplCopyWithImpl<
        _$MonthlyBehaviorCorrelationImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyBehaviorCorrelationImplToJson(this);
  }
}

abstract class _MonthlyBehaviorCorrelation extends MonthlyBehaviorCorrelation {
  const factory _MonthlyBehaviorCorrelation({
    required final String behaviorId,
    required final String behaviorName,
    required final String behaviorNameAr,
    required final String category,
    required final double correlation,
    required final double avgImpact,
    required final int occurrences,
    final bool isSignificant,
    final int confidence,
  }) = _$MonthlyBehaviorCorrelationImpl;
  const _MonthlyBehaviorCorrelation._() : super._();

  factory _MonthlyBehaviorCorrelation.fromJson(Map<String, dynamic> json) =
      _$MonthlyBehaviorCorrelationImpl.fromJson;

  @override
  String get behaviorId;
  @override
  String get behaviorName;
  @override
  String get behaviorNameAr;
  @override
  String get category;

  /// Correlation coefficient (-1 to 1)
  @override
  double get correlation;

  /// Average recovery impact (percentage points)
  @override
  double get avgImpact;

  /// Number of times behavior was logged
  @override
  int get occurrences;

  /// Is statistically significant (p < 0.05)?
  @override
  bool get isSignificant;

  /// Confidence level
  @override
  int get confidence;

  /// Create a copy of MonthlyBehaviorCorrelation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyBehaviorCorrelationImplCopyWith<_$MonthlyBehaviorCorrelationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

WeeklyBreakdown _$WeeklyBreakdownFromJson(Map<String, dynamic> json) {
  return _WeeklyBreakdown.fromJson(json);
}

/// @nodoc
mixin _$WeeklyBreakdown {
  DateTime get weekStart => throw _privateConstructorUsedError;
  int get weekNumber => throw _privateConstructorUsedError;
  double get avgRecovery => throw _privateConstructorUsedError;
  double get avgStrain => throw _privateConstructorUsedError;
  double get avgSleep => throw _privateConstructorUsedError;
  int get workoutDays => throw _privateConstructorUsedError;
  int get restDays => throw _privateConstructorUsedError;

  /// Serializes this WeeklyBreakdown to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyBreakdownCopyWith<WeeklyBreakdown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyBreakdownCopyWith<$Res> {
  factory $WeeklyBreakdownCopyWith(
    WeeklyBreakdown value,
    $Res Function(WeeklyBreakdown) then,
  ) = _$WeeklyBreakdownCopyWithImpl<$Res, WeeklyBreakdown>;
  @useResult
  $Res call({
    DateTime weekStart,
    int weekNumber,
    double avgRecovery,
    double avgStrain,
    double avgSleep,
    int workoutDays,
    int restDays,
  });
}

/// @nodoc
class _$WeeklyBreakdownCopyWithImpl<$Res, $Val extends WeeklyBreakdown>
    implements $WeeklyBreakdownCopyWith<$Res> {
  _$WeeklyBreakdownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStart = null,
    Object? weekNumber = null,
    Object? avgRecovery = null,
    Object? avgStrain = null,
    Object? avgSleep = null,
    Object? workoutDays = null,
    Object? restDays = null,
  }) {
    return _then(
      _value.copyWith(
            weekStart: null == weekStart
                ? _value.weekStart
                : weekStart // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            weekNumber: null == weekNumber
                ? _value.weekNumber
                : weekNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            avgRecovery: null == avgRecovery
                ? _value.avgRecovery
                : avgRecovery // ignore: cast_nullable_to_non_nullable
                      as double,
            avgStrain: null == avgStrain
                ? _value.avgStrain
                : avgStrain // ignore: cast_nullable_to_non_nullable
                      as double,
            avgSleep: null == avgSleep
                ? _value.avgSleep
                : avgSleep // ignore: cast_nullable_to_non_nullable
                      as double,
            workoutDays: null == workoutDays
                ? _value.workoutDays
                : workoutDays // ignore: cast_nullable_to_non_nullable
                      as int,
            restDays: null == restDays
                ? _value.restDays
                : restDays // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeeklyBreakdownImplCopyWith<$Res>
    implements $WeeklyBreakdownCopyWith<$Res> {
  factory _$$WeeklyBreakdownImplCopyWith(
    _$WeeklyBreakdownImpl value,
    $Res Function(_$WeeklyBreakdownImpl) then,
  ) = __$$WeeklyBreakdownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime weekStart,
    int weekNumber,
    double avgRecovery,
    double avgStrain,
    double avgSleep,
    int workoutDays,
    int restDays,
  });
}

/// @nodoc
class __$$WeeklyBreakdownImplCopyWithImpl<$Res>
    extends _$WeeklyBreakdownCopyWithImpl<$Res, _$WeeklyBreakdownImpl>
    implements _$$WeeklyBreakdownImplCopyWith<$Res> {
  __$$WeeklyBreakdownImplCopyWithImpl(
    _$WeeklyBreakdownImpl _value,
    $Res Function(_$WeeklyBreakdownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStart = null,
    Object? weekNumber = null,
    Object? avgRecovery = null,
    Object? avgStrain = null,
    Object? avgSleep = null,
    Object? workoutDays = null,
    Object? restDays = null,
  }) {
    return _then(
      _$WeeklyBreakdownImpl(
        weekStart: null == weekStart
            ? _value.weekStart
            : weekStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        weekNumber: null == weekNumber
            ? _value.weekNumber
            : weekNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        avgRecovery: null == avgRecovery
            ? _value.avgRecovery
            : avgRecovery // ignore: cast_nullable_to_non_nullable
                  as double,
        avgStrain: null == avgStrain
            ? _value.avgStrain
            : avgStrain // ignore: cast_nullable_to_non_nullable
                  as double,
        avgSleep: null == avgSleep
            ? _value.avgSleep
            : avgSleep // ignore: cast_nullable_to_non_nullable
                  as double,
        workoutDays: null == workoutDays
            ? _value.workoutDays
            : workoutDays // ignore: cast_nullable_to_non_nullable
                  as int,
        restDays: null == restDays
            ? _value.restDays
            : restDays // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyBreakdownImpl implements _WeeklyBreakdown {
  const _$WeeklyBreakdownImpl({
    required this.weekStart,
    required this.weekNumber,
    required this.avgRecovery,
    required this.avgStrain,
    required this.avgSleep,
    required this.workoutDays,
    required this.restDays,
  });

  factory _$WeeklyBreakdownImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyBreakdownImplFromJson(json);

  @override
  final DateTime weekStart;
  @override
  final int weekNumber;
  @override
  final double avgRecovery;
  @override
  final double avgStrain;
  @override
  final double avgSleep;
  @override
  final int workoutDays;
  @override
  final int restDays;

  @override
  String toString() {
    return 'WeeklyBreakdown(weekStart: $weekStart, weekNumber: $weekNumber, avgRecovery: $avgRecovery, avgStrain: $avgStrain, avgSleep: $avgSleep, workoutDays: $workoutDays, restDays: $restDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyBreakdownImpl &&
            (identical(other.weekStart, weekStart) ||
                other.weekStart == weekStart) &&
            (identical(other.weekNumber, weekNumber) ||
                other.weekNumber == weekNumber) &&
            (identical(other.avgRecovery, avgRecovery) ||
                other.avgRecovery == avgRecovery) &&
            (identical(other.avgStrain, avgStrain) ||
                other.avgStrain == avgStrain) &&
            (identical(other.avgSleep, avgSleep) ||
                other.avgSleep == avgSleep) &&
            (identical(other.workoutDays, workoutDays) ||
                other.workoutDays == workoutDays) &&
            (identical(other.restDays, restDays) ||
                other.restDays == restDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    weekStart,
    weekNumber,
    avgRecovery,
    avgStrain,
    avgSleep,
    workoutDays,
    restDays,
  );

  /// Create a copy of WeeklyBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyBreakdownImplCopyWith<_$WeeklyBreakdownImpl> get copyWith =>
      __$$WeeklyBreakdownImplCopyWithImpl<_$WeeklyBreakdownImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyBreakdownImplToJson(this);
  }
}

abstract class _WeeklyBreakdown implements WeeklyBreakdown {
  const factory _WeeklyBreakdown({
    required final DateTime weekStart,
    required final int weekNumber,
    required final double avgRecovery,
    required final double avgStrain,
    required final double avgSleep,
    required final int workoutDays,
    required final int restDays,
  }) = _$WeeklyBreakdownImpl;

  factory _WeeklyBreakdown.fromJson(Map<String, dynamic> json) =
      _$WeeklyBreakdownImpl.fromJson;

  @override
  DateTime get weekStart;
  @override
  int get weekNumber;
  @override
  double get avgRecovery;
  @override
  double get avgStrain;
  @override
  double get avgSleep;
  @override
  int get workoutDays;
  @override
  int get restDays;

  /// Create a copy of WeeklyBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyBreakdownImplCopyWith<_$WeeklyBreakdownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyInsight _$MonthlyInsightFromJson(Map<String, dynamic> json) {
  return _MonthlyInsight.fromJson(json);
}

/// @nodoc
mixin _$MonthlyInsight {
  String get id => throw _privateConstructorUsedError;
  MonthlyInsightType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titleAr => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get messageAr => throw _privateConstructorUsedError;

  /// Priority (1 = highest)
  int get priority => throw _privateConstructorUsedError;

  /// Is actionable?
  bool get isActionable => throw _privateConstructorUsedError;

  /// Suggested action
  String? get actionSuggestion => throw _privateConstructorUsedError;
  String? get actionSuggestionAr => throw _privateConstructorUsedError;

  /// Serializes this MonthlyInsight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyInsightCopyWith<MonthlyInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyInsightCopyWith<$Res> {
  factory $MonthlyInsightCopyWith(
    MonthlyInsight value,
    $Res Function(MonthlyInsight) then,
  ) = _$MonthlyInsightCopyWithImpl<$Res, MonthlyInsight>;
  @useResult
  $Res call({
    String id,
    MonthlyInsightType type,
    String title,
    String titleAr,
    String message,
    String messageAr,
    int priority,
    bool isActionable,
    String? actionSuggestion,
    String? actionSuggestionAr,
  });
}

/// @nodoc
class _$MonthlyInsightCopyWithImpl<$Res, $Val extends MonthlyInsight>
    implements $MonthlyInsightCopyWith<$Res> {
  _$MonthlyInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyInsight
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
    Object? actionSuggestion = freezed,
    Object? actionSuggestionAr = freezed,
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
                      as MonthlyInsightType,
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
            actionSuggestion: freezed == actionSuggestion
                ? _value.actionSuggestion
                : actionSuggestion // ignore: cast_nullable_to_non_nullable
                      as String?,
            actionSuggestionAr: freezed == actionSuggestionAr
                ? _value.actionSuggestionAr
                : actionSuggestionAr // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlyInsightImplCopyWith<$Res>
    implements $MonthlyInsightCopyWith<$Res> {
  factory _$$MonthlyInsightImplCopyWith(
    _$MonthlyInsightImpl value,
    $Res Function(_$MonthlyInsightImpl) then,
  ) = __$$MonthlyInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    MonthlyInsightType type,
    String title,
    String titleAr,
    String message,
    String messageAr,
    int priority,
    bool isActionable,
    String? actionSuggestion,
    String? actionSuggestionAr,
  });
}

/// @nodoc
class __$$MonthlyInsightImplCopyWithImpl<$Res>
    extends _$MonthlyInsightCopyWithImpl<$Res, _$MonthlyInsightImpl>
    implements _$$MonthlyInsightImplCopyWith<$Res> {
  __$$MonthlyInsightImplCopyWithImpl(
    _$MonthlyInsightImpl _value,
    $Res Function(_$MonthlyInsightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyInsight
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
    Object? actionSuggestion = freezed,
    Object? actionSuggestionAr = freezed,
  }) {
    return _then(
      _$MonthlyInsightImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as MonthlyInsightType,
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
        actionSuggestion: freezed == actionSuggestion
            ? _value.actionSuggestion
            : actionSuggestion // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionSuggestionAr: freezed == actionSuggestionAr
            ? _value.actionSuggestionAr
            : actionSuggestionAr // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyInsightImpl implements _MonthlyInsight {
  const _$MonthlyInsightImpl({
    required this.id,
    required this.type,
    required this.title,
    required this.titleAr,
    required this.message,
    required this.messageAr,
    this.priority = 3,
    this.isActionable = false,
    this.actionSuggestion,
    this.actionSuggestionAr,
  });

  factory _$MonthlyInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyInsightImplFromJson(json);

  @override
  final String id;
  @override
  final MonthlyInsightType type;
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

  /// Is actionable?
  @override
  @JsonKey()
  final bool isActionable;

  /// Suggested action
  @override
  final String? actionSuggestion;
  @override
  final String? actionSuggestionAr;

  @override
  String toString() {
    return 'MonthlyInsight(id: $id, type: $type, title: $title, titleAr: $titleAr, message: $message, messageAr: $messageAr, priority: $priority, isActionable: $isActionable, actionSuggestion: $actionSuggestion, actionSuggestionAr: $actionSuggestionAr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyInsightImpl &&
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
            (identical(other.actionSuggestion, actionSuggestion) ||
                other.actionSuggestion == actionSuggestion) &&
            (identical(other.actionSuggestionAr, actionSuggestionAr) ||
                other.actionSuggestionAr == actionSuggestionAr));
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
    actionSuggestion,
    actionSuggestionAr,
  );

  /// Create a copy of MonthlyInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyInsightImplCopyWith<_$MonthlyInsightImpl> get copyWith =>
      __$$MonthlyInsightImplCopyWithImpl<_$MonthlyInsightImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyInsightImplToJson(this);
  }
}

abstract class _MonthlyInsight implements MonthlyInsight {
  const factory _MonthlyInsight({
    required final String id,
    required final MonthlyInsightType type,
    required final String title,
    required final String titleAr,
    required final String message,
    required final String messageAr,
    final int priority,
    final bool isActionable,
    final String? actionSuggestion,
    final String? actionSuggestionAr,
  }) = _$MonthlyInsightImpl;

  factory _MonthlyInsight.fromJson(Map<String, dynamic> json) =
      _$MonthlyInsightImpl.fromJson;

  @override
  String get id;
  @override
  MonthlyInsightType get type;
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

  /// Is actionable?
  @override
  bool get isActionable;

  /// Suggested action
  @override
  String? get actionSuggestion;
  @override
  String? get actionSuggestionAr;

  /// Create a copy of MonthlyInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyInsightImplCopyWith<_$MonthlyInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyStreakData _$MonthlyStreakDataFromJson(Map<String, dynamic> json) {
  return _MonthlyStreakData.fromJson(json);
}

/// @nodoc
mixin _$MonthlyStreakData {
  /// Longest recovery streak (70%+)
  int get longestRecoveryStreak => throw _privateConstructorUsedError;

  /// Longest workout streak
  int get longestWorkoutStreak => throw _privateConstructorUsedError;

  /// Longest meal logging streak
  int get longestMealStreak => throw _privateConstructorUsedError;

  /// Days with all metrics logged
  int get completeLogDays => throw _privateConstructorUsedError;

  /// Serializes this MonthlyStreakData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyStreakData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyStreakDataCopyWith<MonthlyStreakData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyStreakDataCopyWith<$Res> {
  factory $MonthlyStreakDataCopyWith(
    MonthlyStreakData value,
    $Res Function(MonthlyStreakData) then,
  ) = _$MonthlyStreakDataCopyWithImpl<$Res, MonthlyStreakData>;
  @useResult
  $Res call({
    int longestRecoveryStreak,
    int longestWorkoutStreak,
    int longestMealStreak,
    int completeLogDays,
  });
}

/// @nodoc
class _$MonthlyStreakDataCopyWithImpl<$Res, $Val extends MonthlyStreakData>
    implements $MonthlyStreakDataCopyWith<$Res> {
  _$MonthlyStreakDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyStreakData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longestRecoveryStreak = null,
    Object? longestWorkoutStreak = null,
    Object? longestMealStreak = null,
    Object? completeLogDays = null,
  }) {
    return _then(
      _value.copyWith(
            longestRecoveryStreak: null == longestRecoveryStreak
                ? _value.longestRecoveryStreak
                : longestRecoveryStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            longestWorkoutStreak: null == longestWorkoutStreak
                ? _value.longestWorkoutStreak
                : longestWorkoutStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            longestMealStreak: null == longestMealStreak
                ? _value.longestMealStreak
                : longestMealStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            completeLogDays: null == completeLogDays
                ? _value.completeLogDays
                : completeLogDays // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlyStreakDataImplCopyWith<$Res>
    implements $MonthlyStreakDataCopyWith<$Res> {
  factory _$$MonthlyStreakDataImplCopyWith(
    _$MonthlyStreakDataImpl value,
    $Res Function(_$MonthlyStreakDataImpl) then,
  ) = __$$MonthlyStreakDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int longestRecoveryStreak,
    int longestWorkoutStreak,
    int longestMealStreak,
    int completeLogDays,
  });
}

/// @nodoc
class __$$MonthlyStreakDataImplCopyWithImpl<$Res>
    extends _$MonthlyStreakDataCopyWithImpl<$Res, _$MonthlyStreakDataImpl>
    implements _$$MonthlyStreakDataImplCopyWith<$Res> {
  __$$MonthlyStreakDataImplCopyWithImpl(
    _$MonthlyStreakDataImpl _value,
    $Res Function(_$MonthlyStreakDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyStreakData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longestRecoveryStreak = null,
    Object? longestWorkoutStreak = null,
    Object? longestMealStreak = null,
    Object? completeLogDays = null,
  }) {
    return _then(
      _$MonthlyStreakDataImpl(
        longestRecoveryStreak: null == longestRecoveryStreak
            ? _value.longestRecoveryStreak
            : longestRecoveryStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        longestWorkoutStreak: null == longestWorkoutStreak
            ? _value.longestWorkoutStreak
            : longestWorkoutStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        longestMealStreak: null == longestMealStreak
            ? _value.longestMealStreak
            : longestMealStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        completeLogDays: null == completeLogDays
            ? _value.completeLogDays
            : completeLogDays // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyStreakDataImpl implements _MonthlyStreakData {
  const _$MonthlyStreakDataImpl({
    required this.longestRecoveryStreak,
    required this.longestWorkoutStreak,
    required this.longestMealStreak,
    required this.completeLogDays,
  });

  factory _$MonthlyStreakDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyStreakDataImplFromJson(json);

  /// Longest recovery streak (70%+)
  @override
  final int longestRecoveryStreak;

  /// Longest workout streak
  @override
  final int longestWorkoutStreak;

  /// Longest meal logging streak
  @override
  final int longestMealStreak;

  /// Days with all metrics logged
  @override
  final int completeLogDays;

  @override
  String toString() {
    return 'MonthlyStreakData(longestRecoveryStreak: $longestRecoveryStreak, longestWorkoutStreak: $longestWorkoutStreak, longestMealStreak: $longestMealStreak, completeLogDays: $completeLogDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyStreakDataImpl &&
            (identical(other.longestRecoveryStreak, longestRecoveryStreak) ||
                other.longestRecoveryStreak == longestRecoveryStreak) &&
            (identical(other.longestWorkoutStreak, longestWorkoutStreak) ||
                other.longestWorkoutStreak == longestWorkoutStreak) &&
            (identical(other.longestMealStreak, longestMealStreak) ||
                other.longestMealStreak == longestMealStreak) &&
            (identical(other.completeLogDays, completeLogDays) ||
                other.completeLogDays == completeLogDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    longestRecoveryStreak,
    longestWorkoutStreak,
    longestMealStreak,
    completeLogDays,
  );

  /// Create a copy of MonthlyStreakData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyStreakDataImplCopyWith<_$MonthlyStreakDataImpl> get copyWith =>
      __$$MonthlyStreakDataImplCopyWithImpl<_$MonthlyStreakDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyStreakDataImplToJson(this);
  }
}

abstract class _MonthlyStreakData implements MonthlyStreakData {
  const factory _MonthlyStreakData({
    required final int longestRecoveryStreak,
    required final int longestWorkoutStreak,
    required final int longestMealStreak,
    required final int completeLogDays,
  }) = _$MonthlyStreakDataImpl;

  factory _MonthlyStreakData.fromJson(Map<String, dynamic> json) =
      _$MonthlyStreakDataImpl.fromJson;

  /// Longest recovery streak (70%+)
  @override
  int get longestRecoveryStreak;

  /// Longest workout streak
  @override
  int get longestWorkoutStreak;

  /// Longest meal logging streak
  @override
  int get longestMealStreak;

  /// Days with all metrics logged
  @override
  int get completeLogDays;

  /// Create a copy of MonthlyStreakData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyStreakDataImplCopyWith<_$MonthlyStreakDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
