// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_meal_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WeeklyMealPlan _$WeeklyMealPlanFromJson(Map<String, dynamic> json) {
  return _WeeklyMealPlan.fromJson(json);
}

/// @nodoc
mixin _$WeeklyMealPlan {
  String get id => throw _privateConstructorUsedError;

  /// Start date of the week (Monday)
  DateTime get weekStartDate => throw _privateConstructorUsedError;

  /// When this plan was generated
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Daily meal plans for each day of the week
  DailyMealPlan? get monday => throw _privateConstructorUsedError;
  DailyMealPlan? get tuesday => throw _privateConstructorUsedError;
  DailyMealPlan? get wednesday => throw _privateConstructorUsedError;
  DailyMealPlan? get thursday => throw _privateConstructorUsedError;
  DailyMealPlan? get friday => throw _privateConstructorUsedError;
  DailyMealPlan? get saturday => throw _privateConstructorUsedError;
  DailyMealPlan? get sunday => throw _privateConstructorUsedError;

  /// Weekly calorie target
  int get weeklyCalorieTarget => throw _privateConstructorUsedError;

  /// Weekly protein target in grams
  int get weeklyProteinTarget => throw _privateConstructorUsedError;

  /// Total planned calories for the week
  int get totalCalories => throw _privateConstructorUsedError;

  /// Total planned protein for the week
  int get totalProtein => throw _privateConstructorUsedError;

  /// Total planned carbs for the week
  int get totalCarbs => throw _privateConstructorUsedError;

  /// Total planned fat for the week
  int get totalFat => throw _privateConstructorUsedError;

  /// Recovery score at the time of generation
  int? get recoveryScoreAtGeneration => throw _privateConstructorUsedError;

  /// Strain score at the time of generation
  double? get strainScoreAtGeneration => throw _privateConstructorUsedError;

  /// Is this an AI-generated plan?
  bool get isAiGenerated => throw _privateConstructorUsedError;

  /// AI coaching note about the weekly plan
  String? get coachingNote => throw _privateConstructorUsedError;

  /// Arabic coaching note
  String? get coachingNoteAr => throw _privateConstructorUsedError;

  /// User's approval status
  PlanApprovalStatus get approvalStatus => throw _privateConstructorUsedError;

  /// Linked workout plan ID for interconnection
  String? get linkedWorkoutPlanId => throw _privateConstructorUsedError;

  /// Whether this plan was adjusted based on workout plan
  bool get adjustedForWorkouts => throw _privateConstructorUsedError;

  /// Days with workouts (for highlighting)
  List<int> get workoutDays => throw _privateConstructorUsedError;

  /// Dietary restrictions considered
  List<String> get dietaryRestrictions => throw _privateConstructorUsedError;

  /// Cuisine preferences
  List<String> get cuisinePreferences => throw _privateConstructorUsedError;

  /// Serializes this WeeklyMealPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyMealPlanCopyWith<WeeklyMealPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyMealPlanCopyWith<$Res> {
  factory $WeeklyMealPlanCopyWith(
    WeeklyMealPlan value,
    $Res Function(WeeklyMealPlan) then,
  ) = _$WeeklyMealPlanCopyWithImpl<$Res, WeeklyMealPlan>;
  @useResult
  $Res call({
    String id,
    DateTime weekStartDate,
    DateTime generatedAt,
    DailyMealPlan? monday,
    DailyMealPlan? tuesday,
    DailyMealPlan? wednesday,
    DailyMealPlan? thursday,
    DailyMealPlan? friday,
    DailyMealPlan? saturday,
    DailyMealPlan? sunday,
    int weeklyCalorieTarget,
    int weeklyProteinTarget,
    int totalCalories,
    int totalProtein,
    int totalCarbs,
    int totalFat,
    int? recoveryScoreAtGeneration,
    double? strainScoreAtGeneration,
    bool isAiGenerated,
    String? coachingNote,
    String? coachingNoteAr,
    PlanApprovalStatus approvalStatus,
    String? linkedWorkoutPlanId,
    bool adjustedForWorkouts,
    List<int> workoutDays,
    List<String> dietaryRestrictions,
    List<String> cuisinePreferences,
  });

  $DailyMealPlanCopyWith<$Res>? get monday;
  $DailyMealPlanCopyWith<$Res>? get tuesday;
  $DailyMealPlanCopyWith<$Res>? get wednesday;
  $DailyMealPlanCopyWith<$Res>? get thursday;
  $DailyMealPlanCopyWith<$Res>? get friday;
  $DailyMealPlanCopyWith<$Res>? get saturday;
  $DailyMealPlanCopyWith<$Res>? get sunday;
}

/// @nodoc
class _$WeeklyMealPlanCopyWithImpl<$Res, $Val extends WeeklyMealPlan>
    implements $WeeklyMealPlanCopyWith<$Res> {
  _$WeeklyMealPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekStartDate = null,
    Object? generatedAt = null,
    Object? monday = freezed,
    Object? tuesday = freezed,
    Object? wednesday = freezed,
    Object? thursday = freezed,
    Object? friday = freezed,
    Object? saturday = freezed,
    Object? sunday = freezed,
    Object? weeklyCalorieTarget = null,
    Object? weeklyProteinTarget = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? recoveryScoreAtGeneration = freezed,
    Object? strainScoreAtGeneration = freezed,
    Object? isAiGenerated = null,
    Object? coachingNote = freezed,
    Object? coachingNoteAr = freezed,
    Object? approvalStatus = null,
    Object? linkedWorkoutPlanId = freezed,
    Object? adjustedForWorkouts = null,
    Object? workoutDays = null,
    Object? dietaryRestrictions = null,
    Object? cuisinePreferences = null,
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
            monday: freezed == monday
                ? _value.monday
                : monday // ignore: cast_nullable_to_non_nullable
                      as DailyMealPlan?,
            tuesday: freezed == tuesday
                ? _value.tuesday
                : tuesday // ignore: cast_nullable_to_non_nullable
                      as DailyMealPlan?,
            wednesday: freezed == wednesday
                ? _value.wednesday
                : wednesday // ignore: cast_nullable_to_non_nullable
                      as DailyMealPlan?,
            thursday: freezed == thursday
                ? _value.thursday
                : thursday // ignore: cast_nullable_to_non_nullable
                      as DailyMealPlan?,
            friday: freezed == friday
                ? _value.friday
                : friday // ignore: cast_nullable_to_non_nullable
                      as DailyMealPlan?,
            saturday: freezed == saturday
                ? _value.saturday
                : saturday // ignore: cast_nullable_to_non_nullable
                      as DailyMealPlan?,
            sunday: freezed == sunday
                ? _value.sunday
                : sunday // ignore: cast_nullable_to_non_nullable
                      as DailyMealPlan?,
            weeklyCalorieTarget: null == weeklyCalorieTarget
                ? _value.weeklyCalorieTarget
                : weeklyCalorieTarget // ignore: cast_nullable_to_non_nullable
                      as int,
            weeklyProteinTarget: null == weeklyProteinTarget
                ? _value.weeklyProteinTarget
                : weeklyProteinTarget // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCalories: null == totalCalories
                ? _value.totalCalories
                : totalCalories // ignore: cast_nullable_to_non_nullable
                      as int,
            totalProtein: null == totalProtein
                ? _value.totalProtein
                : totalProtein // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCarbs: null == totalCarbs
                ? _value.totalCarbs
                : totalCarbs // ignore: cast_nullable_to_non_nullable
                      as int,
            totalFat: null == totalFat
                ? _value.totalFat
                : totalFat // ignore: cast_nullable_to_non_nullable
                      as int,
            recoveryScoreAtGeneration: freezed == recoveryScoreAtGeneration
                ? _value.recoveryScoreAtGeneration
                : recoveryScoreAtGeneration // ignore: cast_nullable_to_non_nullable
                      as int?,
            strainScoreAtGeneration: freezed == strainScoreAtGeneration
                ? _value.strainScoreAtGeneration
                : strainScoreAtGeneration // ignore: cast_nullable_to_non_nullable
                      as double?,
            isAiGenerated: null == isAiGenerated
                ? _value.isAiGenerated
                : isAiGenerated // ignore: cast_nullable_to_non_nullable
                      as bool,
            coachingNote: freezed == coachingNote
                ? _value.coachingNote
                : coachingNote // ignore: cast_nullable_to_non_nullable
                      as String?,
            coachingNoteAr: freezed == coachingNoteAr
                ? _value.coachingNoteAr
                : coachingNoteAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvalStatus: null == approvalStatus
                ? _value.approvalStatus
                : approvalStatus // ignore: cast_nullable_to_non_nullable
                      as PlanApprovalStatus,
            linkedWorkoutPlanId: freezed == linkedWorkoutPlanId
                ? _value.linkedWorkoutPlanId
                : linkedWorkoutPlanId // ignore: cast_nullable_to_non_nullable
                      as String?,
            adjustedForWorkouts: null == adjustedForWorkouts
                ? _value.adjustedForWorkouts
                : adjustedForWorkouts // ignore: cast_nullable_to_non_nullable
                      as bool,
            workoutDays: null == workoutDays
                ? _value.workoutDays
                : workoutDays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            dietaryRestrictions: null == dietaryRestrictions
                ? _value.dietaryRestrictions
                : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            cuisinePreferences: null == cuisinePreferences
                ? _value.cuisinePreferences
                : cuisinePreferences // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyMealPlanCopyWith<$Res>? get monday {
    if (_value.monday == null) {
      return null;
    }

    return $DailyMealPlanCopyWith<$Res>(_value.monday!, (value) {
      return _then(_value.copyWith(monday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyMealPlanCopyWith<$Res>? get tuesday {
    if (_value.tuesday == null) {
      return null;
    }

    return $DailyMealPlanCopyWith<$Res>(_value.tuesday!, (value) {
      return _then(_value.copyWith(tuesday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyMealPlanCopyWith<$Res>? get wednesday {
    if (_value.wednesday == null) {
      return null;
    }

    return $DailyMealPlanCopyWith<$Res>(_value.wednesday!, (value) {
      return _then(_value.copyWith(wednesday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyMealPlanCopyWith<$Res>? get thursday {
    if (_value.thursday == null) {
      return null;
    }

    return $DailyMealPlanCopyWith<$Res>(_value.thursday!, (value) {
      return _then(_value.copyWith(thursday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyMealPlanCopyWith<$Res>? get friday {
    if (_value.friday == null) {
      return null;
    }

    return $DailyMealPlanCopyWith<$Res>(_value.friday!, (value) {
      return _then(_value.copyWith(friday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyMealPlanCopyWith<$Res>? get saturday {
    if (_value.saturday == null) {
      return null;
    }

    return $DailyMealPlanCopyWith<$Res>(_value.saturday!, (value) {
      return _then(_value.copyWith(saturday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyMealPlanCopyWith<$Res>? get sunday {
    if (_value.sunday == null) {
      return null;
    }

    return $DailyMealPlanCopyWith<$Res>(_value.sunday!, (value) {
      return _then(_value.copyWith(sunday: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeeklyMealPlanImplCopyWith<$Res>
    implements $WeeklyMealPlanCopyWith<$Res> {
  factory _$$WeeklyMealPlanImplCopyWith(
    _$WeeklyMealPlanImpl value,
    $Res Function(_$WeeklyMealPlanImpl) then,
  ) = __$$WeeklyMealPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime weekStartDate,
    DateTime generatedAt,
    DailyMealPlan? monday,
    DailyMealPlan? tuesday,
    DailyMealPlan? wednesday,
    DailyMealPlan? thursday,
    DailyMealPlan? friday,
    DailyMealPlan? saturday,
    DailyMealPlan? sunday,
    int weeklyCalorieTarget,
    int weeklyProteinTarget,
    int totalCalories,
    int totalProtein,
    int totalCarbs,
    int totalFat,
    int? recoveryScoreAtGeneration,
    double? strainScoreAtGeneration,
    bool isAiGenerated,
    String? coachingNote,
    String? coachingNoteAr,
    PlanApprovalStatus approvalStatus,
    String? linkedWorkoutPlanId,
    bool adjustedForWorkouts,
    List<int> workoutDays,
    List<String> dietaryRestrictions,
    List<String> cuisinePreferences,
  });

  @override
  $DailyMealPlanCopyWith<$Res>? get monday;
  @override
  $DailyMealPlanCopyWith<$Res>? get tuesday;
  @override
  $DailyMealPlanCopyWith<$Res>? get wednesday;
  @override
  $DailyMealPlanCopyWith<$Res>? get thursday;
  @override
  $DailyMealPlanCopyWith<$Res>? get friday;
  @override
  $DailyMealPlanCopyWith<$Res>? get saturday;
  @override
  $DailyMealPlanCopyWith<$Res>? get sunday;
}

/// @nodoc
class __$$WeeklyMealPlanImplCopyWithImpl<$Res>
    extends _$WeeklyMealPlanCopyWithImpl<$Res, _$WeeklyMealPlanImpl>
    implements _$$WeeklyMealPlanImplCopyWith<$Res> {
  __$$WeeklyMealPlanImplCopyWithImpl(
    _$WeeklyMealPlanImpl _value,
    $Res Function(_$WeeklyMealPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekStartDate = null,
    Object? generatedAt = null,
    Object? monday = freezed,
    Object? tuesday = freezed,
    Object? wednesday = freezed,
    Object? thursday = freezed,
    Object? friday = freezed,
    Object? saturday = freezed,
    Object? sunday = freezed,
    Object? weeklyCalorieTarget = null,
    Object? weeklyProteinTarget = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? recoveryScoreAtGeneration = freezed,
    Object? strainScoreAtGeneration = freezed,
    Object? isAiGenerated = null,
    Object? coachingNote = freezed,
    Object? coachingNoteAr = freezed,
    Object? approvalStatus = null,
    Object? linkedWorkoutPlanId = freezed,
    Object? adjustedForWorkouts = null,
    Object? workoutDays = null,
    Object? dietaryRestrictions = null,
    Object? cuisinePreferences = null,
  }) {
    return _then(
      _$WeeklyMealPlanImpl(
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
        monday: freezed == monday
            ? _value.monday
            : monday // ignore: cast_nullable_to_non_nullable
                  as DailyMealPlan?,
        tuesday: freezed == tuesday
            ? _value.tuesday
            : tuesday // ignore: cast_nullable_to_non_nullable
                  as DailyMealPlan?,
        wednesday: freezed == wednesday
            ? _value.wednesday
            : wednesday // ignore: cast_nullable_to_non_nullable
                  as DailyMealPlan?,
        thursday: freezed == thursday
            ? _value.thursday
            : thursday // ignore: cast_nullable_to_non_nullable
                  as DailyMealPlan?,
        friday: freezed == friday
            ? _value.friday
            : friday // ignore: cast_nullable_to_non_nullable
                  as DailyMealPlan?,
        saturday: freezed == saturday
            ? _value.saturday
            : saturday // ignore: cast_nullable_to_non_nullable
                  as DailyMealPlan?,
        sunday: freezed == sunday
            ? _value.sunday
            : sunday // ignore: cast_nullable_to_non_nullable
                  as DailyMealPlan?,
        weeklyCalorieTarget: null == weeklyCalorieTarget
            ? _value.weeklyCalorieTarget
            : weeklyCalorieTarget // ignore: cast_nullable_to_non_nullable
                  as int,
        weeklyProteinTarget: null == weeklyProteinTarget
            ? _value.weeklyProteinTarget
            : weeklyProteinTarget // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCalories: null == totalCalories
            ? _value.totalCalories
            : totalCalories // ignore: cast_nullable_to_non_nullable
                  as int,
        totalProtein: null == totalProtein
            ? _value.totalProtein
            : totalProtein // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCarbs: null == totalCarbs
            ? _value.totalCarbs
            : totalCarbs // ignore: cast_nullable_to_non_nullable
                  as int,
        totalFat: null == totalFat
            ? _value.totalFat
            : totalFat // ignore: cast_nullable_to_non_nullable
                  as int,
        recoveryScoreAtGeneration: freezed == recoveryScoreAtGeneration
            ? _value.recoveryScoreAtGeneration
            : recoveryScoreAtGeneration // ignore: cast_nullable_to_non_nullable
                  as int?,
        strainScoreAtGeneration: freezed == strainScoreAtGeneration
            ? _value.strainScoreAtGeneration
            : strainScoreAtGeneration // ignore: cast_nullable_to_non_nullable
                  as double?,
        isAiGenerated: null == isAiGenerated
            ? _value.isAiGenerated
            : isAiGenerated // ignore: cast_nullable_to_non_nullable
                  as bool,
        coachingNote: freezed == coachingNote
            ? _value.coachingNote
            : coachingNote // ignore: cast_nullable_to_non_nullable
                  as String?,
        coachingNoteAr: freezed == coachingNoteAr
            ? _value.coachingNoteAr
            : coachingNoteAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvalStatus: null == approvalStatus
            ? _value.approvalStatus
            : approvalStatus // ignore: cast_nullable_to_non_nullable
                  as PlanApprovalStatus,
        linkedWorkoutPlanId: freezed == linkedWorkoutPlanId
            ? _value.linkedWorkoutPlanId
            : linkedWorkoutPlanId // ignore: cast_nullable_to_non_nullable
                  as String?,
        adjustedForWorkouts: null == adjustedForWorkouts
            ? _value.adjustedForWorkouts
            : adjustedForWorkouts // ignore: cast_nullable_to_non_nullable
                  as bool,
        workoutDays: null == workoutDays
            ? _value._workoutDays
            : workoutDays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        dietaryRestrictions: null == dietaryRestrictions
            ? _value._dietaryRestrictions
            : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        cuisinePreferences: null == cuisinePreferences
            ? _value._cuisinePreferences
            : cuisinePreferences // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyMealPlanImpl extends _WeeklyMealPlan {
  const _$WeeklyMealPlanImpl({
    required this.id,
    required this.weekStartDate,
    required this.generatedAt,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.weeklyCalorieTarget = 14000,
    this.weeklyProteinTarget = 840,
    this.totalCalories = 0,
    this.totalProtein = 0,
    this.totalCarbs = 0,
    this.totalFat = 0,
    this.recoveryScoreAtGeneration,
    this.strainScoreAtGeneration,
    this.isAiGenerated = true,
    this.coachingNote,
    this.coachingNoteAr,
    this.approvalStatus = PlanApprovalStatus.pending,
    this.linkedWorkoutPlanId,
    this.adjustedForWorkouts = false,
    final List<int> workoutDays = const [],
    final List<String> dietaryRestrictions = const [],
    final List<String> cuisinePreferences = const ['egyptian'],
  }) : _workoutDays = workoutDays,
       _dietaryRestrictions = dietaryRestrictions,
       _cuisinePreferences = cuisinePreferences,
       super._();

  factory _$WeeklyMealPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyMealPlanImplFromJson(json);

  @override
  final String id;

  /// Start date of the week (Monday)
  @override
  final DateTime weekStartDate;

  /// When this plan was generated
  @override
  final DateTime generatedAt;

  /// Daily meal plans for each day of the week
  @override
  final DailyMealPlan? monday;
  @override
  final DailyMealPlan? tuesday;
  @override
  final DailyMealPlan? wednesday;
  @override
  final DailyMealPlan? thursday;
  @override
  final DailyMealPlan? friday;
  @override
  final DailyMealPlan? saturday;
  @override
  final DailyMealPlan? sunday;

  /// Weekly calorie target
  @override
  @JsonKey()
  final int weeklyCalorieTarget;

  /// Weekly protein target in grams
  @override
  @JsonKey()
  final int weeklyProteinTarget;

  /// Total planned calories for the week
  @override
  @JsonKey()
  final int totalCalories;

  /// Total planned protein for the week
  @override
  @JsonKey()
  final int totalProtein;

  /// Total planned carbs for the week
  @override
  @JsonKey()
  final int totalCarbs;

  /// Total planned fat for the week
  @override
  @JsonKey()
  final int totalFat;

  /// Recovery score at the time of generation
  @override
  final int? recoveryScoreAtGeneration;

  /// Strain score at the time of generation
  @override
  final double? strainScoreAtGeneration;

  /// Is this an AI-generated plan?
  @override
  @JsonKey()
  final bool isAiGenerated;

  /// AI coaching note about the weekly plan
  @override
  final String? coachingNote;

  /// Arabic coaching note
  @override
  final String? coachingNoteAr;

  /// User's approval status
  @override
  @JsonKey()
  final PlanApprovalStatus approvalStatus;

  /// Linked workout plan ID for interconnection
  @override
  final String? linkedWorkoutPlanId;

  /// Whether this plan was adjusted based on workout plan
  @override
  @JsonKey()
  final bool adjustedForWorkouts;

  /// Days with workouts (for highlighting)
  final List<int> _workoutDays;

  /// Days with workouts (for highlighting)
  @override
  @JsonKey()
  List<int> get workoutDays {
    if (_workoutDays is EqualUnmodifiableListView) return _workoutDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workoutDays);
  }

  /// Dietary restrictions considered
  final List<String> _dietaryRestrictions;

  /// Dietary restrictions considered
  @override
  @JsonKey()
  List<String> get dietaryRestrictions {
    if (_dietaryRestrictions is EqualUnmodifiableListView)
      return _dietaryRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryRestrictions);
  }

  /// Cuisine preferences
  final List<String> _cuisinePreferences;

  /// Cuisine preferences
  @override
  @JsonKey()
  List<String> get cuisinePreferences {
    if (_cuisinePreferences is EqualUnmodifiableListView)
      return _cuisinePreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cuisinePreferences);
  }

  @override
  String toString() {
    return 'WeeklyMealPlan(id: $id, weekStartDate: $weekStartDate, generatedAt: $generatedAt, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday, weeklyCalorieTarget: $weeklyCalorieTarget, weeklyProteinTarget: $weeklyProteinTarget, totalCalories: $totalCalories, totalProtein: $totalProtein, totalCarbs: $totalCarbs, totalFat: $totalFat, recoveryScoreAtGeneration: $recoveryScoreAtGeneration, strainScoreAtGeneration: $strainScoreAtGeneration, isAiGenerated: $isAiGenerated, coachingNote: $coachingNote, coachingNoteAr: $coachingNoteAr, approvalStatus: $approvalStatus, linkedWorkoutPlanId: $linkedWorkoutPlanId, adjustedForWorkouts: $adjustedForWorkouts, workoutDays: $workoutDays, dietaryRestrictions: $dietaryRestrictions, cuisinePreferences: $cuisinePreferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyMealPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.monday, monday) || other.monday == monday) &&
            (identical(other.tuesday, tuesday) || other.tuesday == tuesday) &&
            (identical(other.wednesday, wednesday) ||
                other.wednesday == wednesday) &&
            (identical(other.thursday, thursday) ||
                other.thursday == thursday) &&
            (identical(other.friday, friday) || other.friday == friday) &&
            (identical(other.saturday, saturday) ||
                other.saturday == saturday) &&
            (identical(other.sunday, sunday) || other.sunday == sunday) &&
            (identical(other.weeklyCalorieTarget, weeklyCalorieTarget) ||
                other.weeklyCalorieTarget == weeklyCalorieTarget) &&
            (identical(other.weeklyProteinTarget, weeklyProteinTarget) ||
                other.weeklyProteinTarget == weeklyProteinTarget) &&
            (identical(other.totalCalories, totalCalories) ||
                other.totalCalories == totalCalories) &&
            (identical(other.totalProtein, totalProtein) ||
                other.totalProtein == totalProtein) &&
            (identical(other.totalCarbs, totalCarbs) ||
                other.totalCarbs == totalCarbs) &&
            (identical(other.totalFat, totalFat) ||
                other.totalFat == totalFat) &&
            (identical(
                  other.recoveryScoreAtGeneration,
                  recoveryScoreAtGeneration,
                ) ||
                other.recoveryScoreAtGeneration == recoveryScoreAtGeneration) &&
            (identical(
                  other.strainScoreAtGeneration,
                  strainScoreAtGeneration,
                ) ||
                other.strainScoreAtGeneration == strainScoreAtGeneration) &&
            (identical(other.isAiGenerated, isAiGenerated) ||
                other.isAiGenerated == isAiGenerated) &&
            (identical(other.coachingNote, coachingNote) ||
                other.coachingNote == coachingNote) &&
            (identical(other.coachingNoteAr, coachingNoteAr) ||
                other.coachingNoteAr == coachingNoteAr) &&
            (identical(other.approvalStatus, approvalStatus) ||
                other.approvalStatus == approvalStatus) &&
            (identical(other.linkedWorkoutPlanId, linkedWorkoutPlanId) ||
                other.linkedWorkoutPlanId == linkedWorkoutPlanId) &&
            (identical(other.adjustedForWorkouts, adjustedForWorkouts) ||
                other.adjustedForWorkouts == adjustedForWorkouts) &&
            const DeepCollectionEquality().equals(
              other._workoutDays,
              _workoutDays,
            ) &&
            const DeepCollectionEquality().equals(
              other._dietaryRestrictions,
              _dietaryRestrictions,
            ) &&
            const DeepCollectionEquality().equals(
              other._cuisinePreferences,
              _cuisinePreferences,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    weekStartDate,
    generatedAt,
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
    weeklyCalorieTarget,
    weeklyProteinTarget,
    totalCalories,
    totalProtein,
    totalCarbs,
    totalFat,
    recoveryScoreAtGeneration,
    strainScoreAtGeneration,
    isAiGenerated,
    coachingNote,
    coachingNoteAr,
    approvalStatus,
    linkedWorkoutPlanId,
    adjustedForWorkouts,
    const DeepCollectionEquality().hash(_workoutDays),
    const DeepCollectionEquality().hash(_dietaryRestrictions),
    const DeepCollectionEquality().hash(_cuisinePreferences),
  ]);

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyMealPlanImplCopyWith<_$WeeklyMealPlanImpl> get copyWith =>
      __$$WeeklyMealPlanImplCopyWithImpl<_$WeeklyMealPlanImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyMealPlanImplToJson(this);
  }
}

abstract class _WeeklyMealPlan extends WeeklyMealPlan {
  const factory _WeeklyMealPlan({
    required final String id,
    required final DateTime weekStartDate,
    required final DateTime generatedAt,
    final DailyMealPlan? monday,
    final DailyMealPlan? tuesday,
    final DailyMealPlan? wednesday,
    final DailyMealPlan? thursday,
    final DailyMealPlan? friday,
    final DailyMealPlan? saturday,
    final DailyMealPlan? sunday,
    final int weeklyCalorieTarget,
    final int weeklyProteinTarget,
    final int totalCalories,
    final int totalProtein,
    final int totalCarbs,
    final int totalFat,
    final int? recoveryScoreAtGeneration,
    final double? strainScoreAtGeneration,
    final bool isAiGenerated,
    final String? coachingNote,
    final String? coachingNoteAr,
    final PlanApprovalStatus approvalStatus,
    final String? linkedWorkoutPlanId,
    final bool adjustedForWorkouts,
    final List<int> workoutDays,
    final List<String> dietaryRestrictions,
    final List<String> cuisinePreferences,
  }) = _$WeeklyMealPlanImpl;
  const _WeeklyMealPlan._() : super._();

  factory _WeeklyMealPlan.fromJson(Map<String, dynamic> json) =
      _$WeeklyMealPlanImpl.fromJson;

  @override
  String get id;

  /// Start date of the week (Monday)
  @override
  DateTime get weekStartDate;

  /// When this plan was generated
  @override
  DateTime get generatedAt;

  /// Daily meal plans for each day of the week
  @override
  DailyMealPlan? get monday;
  @override
  DailyMealPlan? get tuesday;
  @override
  DailyMealPlan? get wednesday;
  @override
  DailyMealPlan? get thursday;
  @override
  DailyMealPlan? get friday;
  @override
  DailyMealPlan? get saturday;
  @override
  DailyMealPlan? get sunday;

  /// Weekly calorie target
  @override
  int get weeklyCalorieTarget;

  /// Weekly protein target in grams
  @override
  int get weeklyProteinTarget;

  /// Total planned calories for the week
  @override
  int get totalCalories;

  /// Total planned protein for the week
  @override
  int get totalProtein;

  /// Total planned carbs for the week
  @override
  int get totalCarbs;

  /// Total planned fat for the week
  @override
  int get totalFat;

  /// Recovery score at the time of generation
  @override
  int? get recoveryScoreAtGeneration;

  /// Strain score at the time of generation
  @override
  double? get strainScoreAtGeneration;

  /// Is this an AI-generated plan?
  @override
  bool get isAiGenerated;

  /// AI coaching note about the weekly plan
  @override
  String? get coachingNote;

  /// Arabic coaching note
  @override
  String? get coachingNoteAr;

  /// User's approval status
  @override
  PlanApprovalStatus get approvalStatus;

  /// Linked workout plan ID for interconnection
  @override
  String? get linkedWorkoutPlanId;

  /// Whether this plan was adjusted based on workout plan
  @override
  bool get adjustedForWorkouts;

  /// Days with workouts (for highlighting)
  @override
  List<int> get workoutDays;

  /// Dietary restrictions considered
  @override
  List<String> get dietaryRestrictions;

  /// Cuisine preferences
  @override
  List<String> get cuisinePreferences;

  /// Create a copy of WeeklyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyMealPlanImplCopyWith<_$WeeklyMealPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyMealPlanContext _$WeeklyMealPlanContextFromJson(
  Map<String, dynamic> json,
) {
  return _WeeklyMealPlanContext.fromJson(json);
}

/// @nodoc
mixin _$WeeklyMealPlanContext {
  /// Week start date
  DateTime get weekStartDate => throw _privateConstructorUsedError;

  /// Daily calorie target (base)
  int get dailyCalorieTarget => throw _privateConstructorUsedError;

  /// Daily protein target (base)
  int get dailyProteinTarget => throw _privateConstructorUsedError;

  /// User's dietary restrictions
  List<String> get dietaryRestrictions => throw _privateConstructorUsedError;

  /// Prefer Egyptian/local cuisine
  bool get preferEgyptian => throw _privateConstructorUsedError;

  /// Eating window start time
  String? get eatingWindowStart => throw _privateConstructorUsedError;

  /// Eating window end time
  String? get eatingWindowEnd => throw _privateConstructorUsedError;

  /// Recovery score
  int? get recoveryScore => throw _privateConstructorUsedError;

  /// Strain score
  double? get strainScore => throw _privateConstructorUsedError;

  /// Current workout plan (for coordination)
  WeeklyWorkoutSummary? get workoutPlan => throw _privateConstructorUsedError;

  /// Days with planned workouts (0 = Monday)
  List<int> get workoutDays => throw _privateConstructorUsedError;

  /// Extra calories to add on workout days
  int get workoutDayCalorieBonus => throw _privateConstructorUsedError;

  /// Extra protein to add on strength training days
  int get strengthDayProteinBonus => throw _privateConstructorUsedError;

  /// User's preference for high protein
  bool get preferHighProtein => throw _privateConstructorUsedError;

  /// User's preference for vegetarian
  bool get preferVegetarian => throw _privateConstructorUsedError;

  /// User's preference for low carb
  bool get preferLowCarb => throw _privateConstructorUsedError;

  /// Language preference: 'ar' or 'en'
  String get language => throw _privateConstructorUsedError;

  /// Serializes this WeeklyMealPlanContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyMealPlanContextCopyWith<WeeklyMealPlanContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyMealPlanContextCopyWith<$Res> {
  factory $WeeklyMealPlanContextCopyWith(
    WeeklyMealPlanContext value,
    $Res Function(WeeklyMealPlanContext) then,
  ) = _$WeeklyMealPlanContextCopyWithImpl<$Res, WeeklyMealPlanContext>;
  @useResult
  $Res call({
    DateTime weekStartDate,
    int dailyCalorieTarget,
    int dailyProteinTarget,
    List<String> dietaryRestrictions,
    bool preferEgyptian,
    String? eatingWindowStart,
    String? eatingWindowEnd,
    int? recoveryScore,
    double? strainScore,
    WeeklyWorkoutSummary? workoutPlan,
    List<int> workoutDays,
    int workoutDayCalorieBonus,
    int strengthDayProteinBonus,
    bool preferHighProtein,
    bool preferVegetarian,
    bool preferLowCarb,
    String language,
  });

  $WeeklyWorkoutSummaryCopyWith<$Res>? get workoutPlan;
}

/// @nodoc
class _$WeeklyMealPlanContextCopyWithImpl<
  $Res,
  $Val extends WeeklyMealPlanContext
>
    implements $WeeklyMealPlanContextCopyWith<$Res> {
  _$WeeklyMealPlanContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStartDate = null,
    Object? dailyCalorieTarget = null,
    Object? dailyProteinTarget = null,
    Object? dietaryRestrictions = null,
    Object? preferEgyptian = null,
    Object? eatingWindowStart = freezed,
    Object? eatingWindowEnd = freezed,
    Object? recoveryScore = freezed,
    Object? strainScore = freezed,
    Object? workoutPlan = freezed,
    Object? workoutDays = null,
    Object? workoutDayCalorieBonus = null,
    Object? strengthDayProteinBonus = null,
    Object? preferHighProtein = null,
    Object? preferVegetarian = null,
    Object? preferLowCarb = null,
    Object? language = null,
  }) {
    return _then(
      _value.copyWith(
            weekStartDate: null == weekStartDate
                ? _value.weekStartDate
                : weekStartDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            dailyCalorieTarget: null == dailyCalorieTarget
                ? _value.dailyCalorieTarget
                : dailyCalorieTarget // ignore: cast_nullable_to_non_nullable
                      as int,
            dailyProteinTarget: null == dailyProteinTarget
                ? _value.dailyProteinTarget
                : dailyProteinTarget // ignore: cast_nullable_to_non_nullable
                      as int,
            dietaryRestrictions: null == dietaryRestrictions
                ? _value.dietaryRestrictions
                : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            preferEgyptian: null == preferEgyptian
                ? _value.preferEgyptian
                : preferEgyptian // ignore: cast_nullable_to_non_nullable
                      as bool,
            eatingWindowStart: freezed == eatingWindowStart
                ? _value.eatingWindowStart
                : eatingWindowStart // ignore: cast_nullable_to_non_nullable
                      as String?,
            eatingWindowEnd: freezed == eatingWindowEnd
                ? _value.eatingWindowEnd
                : eatingWindowEnd // ignore: cast_nullable_to_non_nullable
                      as String?,
            recoveryScore: freezed == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            strainScore: freezed == strainScore
                ? _value.strainScore
                : strainScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            workoutPlan: freezed == workoutPlan
                ? _value.workoutPlan
                : workoutPlan // ignore: cast_nullable_to_non_nullable
                      as WeeklyWorkoutSummary?,
            workoutDays: null == workoutDays
                ? _value.workoutDays
                : workoutDays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            workoutDayCalorieBonus: null == workoutDayCalorieBonus
                ? _value.workoutDayCalorieBonus
                : workoutDayCalorieBonus // ignore: cast_nullable_to_non_nullable
                      as int,
            strengthDayProteinBonus: null == strengthDayProteinBonus
                ? _value.strengthDayProteinBonus
                : strengthDayProteinBonus // ignore: cast_nullable_to_non_nullable
                      as int,
            preferHighProtein: null == preferHighProtein
                ? _value.preferHighProtein
                : preferHighProtein // ignore: cast_nullable_to_non_nullable
                      as bool,
            preferVegetarian: null == preferVegetarian
                ? _value.preferVegetarian
                : preferVegetarian // ignore: cast_nullable_to_non_nullable
                      as bool,
            preferLowCarb: null == preferLowCarb
                ? _value.preferLowCarb
                : preferLowCarb // ignore: cast_nullable_to_non_nullable
                      as bool,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of WeeklyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeeklyWorkoutSummaryCopyWith<$Res>? get workoutPlan {
    if (_value.workoutPlan == null) {
      return null;
    }

    return $WeeklyWorkoutSummaryCopyWith<$Res>(_value.workoutPlan!, (value) {
      return _then(_value.copyWith(workoutPlan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeeklyMealPlanContextImplCopyWith<$Res>
    implements $WeeklyMealPlanContextCopyWith<$Res> {
  factory _$$WeeklyMealPlanContextImplCopyWith(
    _$WeeklyMealPlanContextImpl value,
    $Res Function(_$WeeklyMealPlanContextImpl) then,
  ) = __$$WeeklyMealPlanContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime weekStartDate,
    int dailyCalorieTarget,
    int dailyProteinTarget,
    List<String> dietaryRestrictions,
    bool preferEgyptian,
    String? eatingWindowStart,
    String? eatingWindowEnd,
    int? recoveryScore,
    double? strainScore,
    WeeklyWorkoutSummary? workoutPlan,
    List<int> workoutDays,
    int workoutDayCalorieBonus,
    int strengthDayProteinBonus,
    bool preferHighProtein,
    bool preferVegetarian,
    bool preferLowCarb,
    String language,
  });

  @override
  $WeeklyWorkoutSummaryCopyWith<$Res>? get workoutPlan;
}

/// @nodoc
class __$$WeeklyMealPlanContextImplCopyWithImpl<$Res>
    extends
        _$WeeklyMealPlanContextCopyWithImpl<$Res, _$WeeklyMealPlanContextImpl>
    implements _$$WeeklyMealPlanContextImplCopyWith<$Res> {
  __$$WeeklyMealPlanContextImplCopyWithImpl(
    _$WeeklyMealPlanContextImpl _value,
    $Res Function(_$WeeklyMealPlanContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStartDate = null,
    Object? dailyCalorieTarget = null,
    Object? dailyProteinTarget = null,
    Object? dietaryRestrictions = null,
    Object? preferEgyptian = null,
    Object? eatingWindowStart = freezed,
    Object? eatingWindowEnd = freezed,
    Object? recoveryScore = freezed,
    Object? strainScore = freezed,
    Object? workoutPlan = freezed,
    Object? workoutDays = null,
    Object? workoutDayCalorieBonus = null,
    Object? strengthDayProteinBonus = null,
    Object? preferHighProtein = null,
    Object? preferVegetarian = null,
    Object? preferLowCarb = null,
    Object? language = null,
  }) {
    return _then(
      _$WeeklyMealPlanContextImpl(
        weekStartDate: null == weekStartDate
            ? _value.weekStartDate
            : weekStartDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        dailyCalorieTarget: null == dailyCalorieTarget
            ? _value.dailyCalorieTarget
            : dailyCalorieTarget // ignore: cast_nullable_to_non_nullable
                  as int,
        dailyProteinTarget: null == dailyProteinTarget
            ? _value.dailyProteinTarget
            : dailyProteinTarget // ignore: cast_nullable_to_non_nullable
                  as int,
        dietaryRestrictions: null == dietaryRestrictions
            ? _value._dietaryRestrictions
            : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        preferEgyptian: null == preferEgyptian
            ? _value.preferEgyptian
            : preferEgyptian // ignore: cast_nullable_to_non_nullable
                  as bool,
        eatingWindowStart: freezed == eatingWindowStart
            ? _value.eatingWindowStart
            : eatingWindowStart // ignore: cast_nullable_to_non_nullable
                  as String?,
        eatingWindowEnd: freezed == eatingWindowEnd
            ? _value.eatingWindowEnd
            : eatingWindowEnd // ignore: cast_nullable_to_non_nullable
                  as String?,
        recoveryScore: freezed == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        strainScore: freezed == strainScore
            ? _value.strainScore
            : strainScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        workoutPlan: freezed == workoutPlan
            ? _value.workoutPlan
            : workoutPlan // ignore: cast_nullable_to_non_nullable
                  as WeeklyWorkoutSummary?,
        workoutDays: null == workoutDays
            ? _value._workoutDays
            : workoutDays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        workoutDayCalorieBonus: null == workoutDayCalorieBonus
            ? _value.workoutDayCalorieBonus
            : workoutDayCalorieBonus // ignore: cast_nullable_to_non_nullable
                  as int,
        strengthDayProteinBonus: null == strengthDayProteinBonus
            ? _value.strengthDayProteinBonus
            : strengthDayProteinBonus // ignore: cast_nullable_to_non_nullable
                  as int,
        preferHighProtein: null == preferHighProtein
            ? _value.preferHighProtein
            : preferHighProtein // ignore: cast_nullable_to_non_nullable
                  as bool,
        preferVegetarian: null == preferVegetarian
            ? _value.preferVegetarian
            : preferVegetarian // ignore: cast_nullable_to_non_nullable
                  as bool,
        preferLowCarb: null == preferLowCarb
            ? _value.preferLowCarb
            : preferLowCarb // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$WeeklyMealPlanContextImpl implements _WeeklyMealPlanContext {
  const _$WeeklyMealPlanContextImpl({
    required this.weekStartDate,
    required this.dailyCalorieTarget,
    required this.dailyProteinTarget,
    final List<String> dietaryRestrictions = const [],
    this.preferEgyptian = true,
    this.eatingWindowStart,
    this.eatingWindowEnd,
    this.recoveryScore,
    this.strainScore,
    this.workoutPlan,
    final List<int> workoutDays = const [],
    this.workoutDayCalorieBonus = 250,
    this.strengthDayProteinBonus = 20,
    this.preferHighProtein = false,
    this.preferVegetarian = false,
    this.preferLowCarb = false,
    this.language = 'ar',
  }) : _dietaryRestrictions = dietaryRestrictions,
       _workoutDays = workoutDays;

  factory _$WeeklyMealPlanContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyMealPlanContextImplFromJson(json);

  /// Week start date
  @override
  final DateTime weekStartDate;

  /// Daily calorie target (base)
  @override
  final int dailyCalorieTarget;

  /// Daily protein target (base)
  @override
  final int dailyProteinTarget;

  /// User's dietary restrictions
  final List<String> _dietaryRestrictions;

  /// User's dietary restrictions
  @override
  @JsonKey()
  List<String> get dietaryRestrictions {
    if (_dietaryRestrictions is EqualUnmodifiableListView)
      return _dietaryRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryRestrictions);
  }

  /// Prefer Egyptian/local cuisine
  @override
  @JsonKey()
  final bool preferEgyptian;

  /// Eating window start time
  @override
  final String? eatingWindowStart;

  /// Eating window end time
  @override
  final String? eatingWindowEnd;

  /// Recovery score
  @override
  final int? recoveryScore;

  /// Strain score
  @override
  final double? strainScore;

  /// Current workout plan (for coordination)
  @override
  final WeeklyWorkoutSummary? workoutPlan;

  /// Days with planned workouts (0 = Monday)
  final List<int> _workoutDays;

  /// Days with planned workouts (0 = Monday)
  @override
  @JsonKey()
  List<int> get workoutDays {
    if (_workoutDays is EqualUnmodifiableListView) return _workoutDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workoutDays);
  }

  /// Extra calories to add on workout days
  @override
  @JsonKey()
  final int workoutDayCalorieBonus;

  /// Extra protein to add on strength training days
  @override
  @JsonKey()
  final int strengthDayProteinBonus;

  /// User's preference for high protein
  @override
  @JsonKey()
  final bool preferHighProtein;

  /// User's preference for vegetarian
  @override
  @JsonKey()
  final bool preferVegetarian;

  /// User's preference for low carb
  @override
  @JsonKey()
  final bool preferLowCarb;

  /// Language preference: 'ar' or 'en'
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'WeeklyMealPlanContext(weekStartDate: $weekStartDate, dailyCalorieTarget: $dailyCalorieTarget, dailyProteinTarget: $dailyProteinTarget, dietaryRestrictions: $dietaryRestrictions, preferEgyptian: $preferEgyptian, eatingWindowStart: $eatingWindowStart, eatingWindowEnd: $eatingWindowEnd, recoveryScore: $recoveryScore, strainScore: $strainScore, workoutPlan: $workoutPlan, workoutDays: $workoutDays, workoutDayCalorieBonus: $workoutDayCalorieBonus, strengthDayProteinBonus: $strengthDayProteinBonus, preferHighProtein: $preferHighProtein, preferVegetarian: $preferVegetarian, preferLowCarb: $preferLowCarb, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyMealPlanContextImpl &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            (identical(other.dailyCalorieTarget, dailyCalorieTarget) ||
                other.dailyCalorieTarget == dailyCalorieTarget) &&
            (identical(other.dailyProteinTarget, dailyProteinTarget) ||
                other.dailyProteinTarget == dailyProteinTarget) &&
            const DeepCollectionEquality().equals(
              other._dietaryRestrictions,
              _dietaryRestrictions,
            ) &&
            (identical(other.preferEgyptian, preferEgyptian) ||
                other.preferEgyptian == preferEgyptian) &&
            (identical(other.eatingWindowStart, eatingWindowStart) ||
                other.eatingWindowStart == eatingWindowStart) &&
            (identical(other.eatingWindowEnd, eatingWindowEnd) ||
                other.eatingWindowEnd == eatingWindowEnd) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.strainScore, strainScore) ||
                other.strainScore == strainScore) &&
            (identical(other.workoutPlan, workoutPlan) ||
                other.workoutPlan == workoutPlan) &&
            const DeepCollectionEquality().equals(
              other._workoutDays,
              _workoutDays,
            ) &&
            (identical(other.workoutDayCalorieBonus, workoutDayCalorieBonus) ||
                other.workoutDayCalorieBonus == workoutDayCalorieBonus) &&
            (identical(
                  other.strengthDayProteinBonus,
                  strengthDayProteinBonus,
                ) ||
                other.strengthDayProteinBonus == strengthDayProteinBonus) &&
            (identical(other.preferHighProtein, preferHighProtein) ||
                other.preferHighProtein == preferHighProtein) &&
            (identical(other.preferVegetarian, preferVegetarian) ||
                other.preferVegetarian == preferVegetarian) &&
            (identical(other.preferLowCarb, preferLowCarb) ||
                other.preferLowCarb == preferLowCarb) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    weekStartDate,
    dailyCalorieTarget,
    dailyProteinTarget,
    const DeepCollectionEquality().hash(_dietaryRestrictions),
    preferEgyptian,
    eatingWindowStart,
    eatingWindowEnd,
    recoveryScore,
    strainScore,
    workoutPlan,
    const DeepCollectionEquality().hash(_workoutDays),
    workoutDayCalorieBonus,
    strengthDayProteinBonus,
    preferHighProtein,
    preferVegetarian,
    preferLowCarb,
    language,
  );

  /// Create a copy of WeeklyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyMealPlanContextImplCopyWith<_$WeeklyMealPlanContextImpl>
  get copyWith =>
      __$$WeeklyMealPlanContextImplCopyWithImpl<_$WeeklyMealPlanContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyMealPlanContextImplToJson(this);
  }
}

abstract class _WeeklyMealPlanContext implements WeeklyMealPlanContext {
  const factory _WeeklyMealPlanContext({
    required final DateTime weekStartDate,
    required final int dailyCalorieTarget,
    required final int dailyProteinTarget,
    final List<String> dietaryRestrictions,
    final bool preferEgyptian,
    final String? eatingWindowStart,
    final String? eatingWindowEnd,
    final int? recoveryScore,
    final double? strainScore,
    final WeeklyWorkoutSummary? workoutPlan,
    final List<int> workoutDays,
    final int workoutDayCalorieBonus,
    final int strengthDayProteinBonus,
    final bool preferHighProtein,
    final bool preferVegetarian,
    final bool preferLowCarb,
    final String language,
  }) = _$WeeklyMealPlanContextImpl;

  factory _WeeklyMealPlanContext.fromJson(Map<String, dynamic> json) =
      _$WeeklyMealPlanContextImpl.fromJson;

  /// Week start date
  @override
  DateTime get weekStartDate;

  /// Daily calorie target (base)
  @override
  int get dailyCalorieTarget;

  /// Daily protein target (base)
  @override
  int get dailyProteinTarget;

  /// User's dietary restrictions
  @override
  List<String> get dietaryRestrictions;

  /// Prefer Egyptian/local cuisine
  @override
  bool get preferEgyptian;

  /// Eating window start time
  @override
  String? get eatingWindowStart;

  /// Eating window end time
  @override
  String? get eatingWindowEnd;

  /// Recovery score
  @override
  int? get recoveryScore;

  /// Strain score
  @override
  double? get strainScore;

  /// Current workout plan (for coordination)
  @override
  WeeklyWorkoutSummary? get workoutPlan;

  /// Days with planned workouts (0 = Monday)
  @override
  List<int> get workoutDays;

  /// Extra calories to add on workout days
  @override
  int get workoutDayCalorieBonus;

  /// Extra protein to add on strength training days
  @override
  int get strengthDayProteinBonus;

  /// User's preference for high protein
  @override
  bool get preferHighProtein;

  /// User's preference for vegetarian
  @override
  bool get preferVegetarian;

  /// User's preference for low carb
  @override
  bool get preferLowCarb;

  /// Language preference: 'ar' or 'en'
  @override
  String get language;

  /// Create a copy of WeeklyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyMealPlanContextImplCopyWith<_$WeeklyMealPlanContextImpl>
  get copyWith => throw _privateConstructorUsedError;
}

WeeklyWorkoutSummary _$WeeklyWorkoutSummaryFromJson(Map<String, dynamic> json) {
  return _WeeklyWorkoutSummary.fromJson(json);
}

/// @nodoc
mixin _$WeeklyWorkoutSummary {
  /// Workout plan ID
  String get planId => throw _privateConstructorUsedError;

  /// Days with workouts (0 = Monday)
  List<int> get workoutDays => throw _privateConstructorUsedError;

  /// Days with strength training
  List<int> get strengthDays => throw _privateConstructorUsedError;

  /// Days with cardio
  List<int> get cardioDays => throw _privateConstructorUsedError;

  /// Estimated weekly calorie burn
  int get estimatedWeeklyCalorieBurn => throw _privateConstructorUsedError;

  /// Workout descriptions by day
  Map<int, String> get workoutDescriptions =>
      throw _privateConstructorUsedError;

  /// Serializes this WeeklyWorkoutSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyWorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyWorkoutSummaryCopyWith<WeeklyWorkoutSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyWorkoutSummaryCopyWith<$Res> {
  factory $WeeklyWorkoutSummaryCopyWith(
    WeeklyWorkoutSummary value,
    $Res Function(WeeklyWorkoutSummary) then,
  ) = _$WeeklyWorkoutSummaryCopyWithImpl<$Res, WeeklyWorkoutSummary>;
  @useResult
  $Res call({
    String planId,
    List<int> workoutDays,
    List<int> strengthDays,
    List<int> cardioDays,
    int estimatedWeeklyCalorieBurn,
    Map<int, String> workoutDescriptions,
  });
}

/// @nodoc
class _$WeeklyWorkoutSummaryCopyWithImpl<
  $Res,
  $Val extends WeeklyWorkoutSummary
>
    implements $WeeklyWorkoutSummaryCopyWith<$Res> {
  _$WeeklyWorkoutSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyWorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? workoutDays = null,
    Object? strengthDays = null,
    Object? cardioDays = null,
    Object? estimatedWeeklyCalorieBurn = null,
    Object? workoutDescriptions = null,
  }) {
    return _then(
      _value.copyWith(
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as String,
            workoutDays: null == workoutDays
                ? _value.workoutDays
                : workoutDays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            strengthDays: null == strengthDays
                ? _value.strengthDays
                : strengthDays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            cardioDays: null == cardioDays
                ? _value.cardioDays
                : cardioDays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            estimatedWeeklyCalorieBurn: null == estimatedWeeklyCalorieBurn
                ? _value.estimatedWeeklyCalorieBurn
                : estimatedWeeklyCalorieBurn // ignore: cast_nullable_to_non_nullable
                      as int,
            workoutDescriptions: null == workoutDescriptions
                ? _value.workoutDescriptions
                : workoutDescriptions // ignore: cast_nullable_to_non_nullable
                      as Map<int, String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeeklyWorkoutSummaryImplCopyWith<$Res>
    implements $WeeklyWorkoutSummaryCopyWith<$Res> {
  factory _$$WeeklyWorkoutSummaryImplCopyWith(
    _$WeeklyWorkoutSummaryImpl value,
    $Res Function(_$WeeklyWorkoutSummaryImpl) then,
  ) = __$$WeeklyWorkoutSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String planId,
    List<int> workoutDays,
    List<int> strengthDays,
    List<int> cardioDays,
    int estimatedWeeklyCalorieBurn,
    Map<int, String> workoutDescriptions,
  });
}

/// @nodoc
class __$$WeeklyWorkoutSummaryImplCopyWithImpl<$Res>
    extends _$WeeklyWorkoutSummaryCopyWithImpl<$Res, _$WeeklyWorkoutSummaryImpl>
    implements _$$WeeklyWorkoutSummaryImplCopyWith<$Res> {
  __$$WeeklyWorkoutSummaryImplCopyWithImpl(
    _$WeeklyWorkoutSummaryImpl _value,
    $Res Function(_$WeeklyWorkoutSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyWorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? workoutDays = null,
    Object? strengthDays = null,
    Object? cardioDays = null,
    Object? estimatedWeeklyCalorieBurn = null,
    Object? workoutDescriptions = null,
  }) {
    return _then(
      _$WeeklyWorkoutSummaryImpl(
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as String,
        workoutDays: null == workoutDays
            ? _value._workoutDays
            : workoutDays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        strengthDays: null == strengthDays
            ? _value._strengthDays
            : strengthDays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        cardioDays: null == cardioDays
            ? _value._cardioDays
            : cardioDays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        estimatedWeeklyCalorieBurn: null == estimatedWeeklyCalorieBurn
            ? _value.estimatedWeeklyCalorieBurn
            : estimatedWeeklyCalorieBurn // ignore: cast_nullable_to_non_nullable
                  as int,
        workoutDescriptions: null == workoutDescriptions
            ? _value._workoutDescriptions
            : workoutDescriptions // ignore: cast_nullable_to_non_nullable
                  as Map<int, String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyWorkoutSummaryImpl implements _WeeklyWorkoutSummary {
  const _$WeeklyWorkoutSummaryImpl({
    required this.planId,
    final List<int> workoutDays = const [],
    final List<int> strengthDays = const [],
    final List<int> cardioDays = const [],
    this.estimatedWeeklyCalorieBurn = 0,
    final Map<int, String> workoutDescriptions = const {},
  }) : _workoutDays = workoutDays,
       _strengthDays = strengthDays,
       _cardioDays = cardioDays,
       _workoutDescriptions = workoutDescriptions;

  factory _$WeeklyWorkoutSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyWorkoutSummaryImplFromJson(json);

  /// Workout plan ID
  @override
  final String planId;

  /// Days with workouts (0 = Monday)
  final List<int> _workoutDays;

  /// Days with workouts (0 = Monday)
  @override
  @JsonKey()
  List<int> get workoutDays {
    if (_workoutDays is EqualUnmodifiableListView) return _workoutDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workoutDays);
  }

  /// Days with strength training
  final List<int> _strengthDays;

  /// Days with strength training
  @override
  @JsonKey()
  List<int> get strengthDays {
    if (_strengthDays is EqualUnmodifiableListView) return _strengthDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengthDays);
  }

  /// Days with cardio
  final List<int> _cardioDays;

  /// Days with cardio
  @override
  @JsonKey()
  List<int> get cardioDays {
    if (_cardioDays is EqualUnmodifiableListView) return _cardioDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardioDays);
  }

  /// Estimated weekly calorie burn
  @override
  @JsonKey()
  final int estimatedWeeklyCalorieBurn;

  /// Workout descriptions by day
  final Map<int, String> _workoutDescriptions;

  /// Workout descriptions by day
  @override
  @JsonKey()
  Map<int, String> get workoutDescriptions {
    if (_workoutDescriptions is EqualUnmodifiableMapView)
      return _workoutDescriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_workoutDescriptions);
  }

  @override
  String toString() {
    return 'WeeklyWorkoutSummary(planId: $planId, workoutDays: $workoutDays, strengthDays: $strengthDays, cardioDays: $cardioDays, estimatedWeeklyCalorieBurn: $estimatedWeeklyCalorieBurn, workoutDescriptions: $workoutDescriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyWorkoutSummaryImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            const DeepCollectionEquality().equals(
              other._workoutDays,
              _workoutDays,
            ) &&
            const DeepCollectionEquality().equals(
              other._strengthDays,
              _strengthDays,
            ) &&
            const DeepCollectionEquality().equals(
              other._cardioDays,
              _cardioDays,
            ) &&
            (identical(
                  other.estimatedWeeklyCalorieBurn,
                  estimatedWeeklyCalorieBurn,
                ) ||
                other.estimatedWeeklyCalorieBurn ==
                    estimatedWeeklyCalorieBurn) &&
            const DeepCollectionEquality().equals(
              other._workoutDescriptions,
              _workoutDescriptions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    planId,
    const DeepCollectionEquality().hash(_workoutDays),
    const DeepCollectionEquality().hash(_strengthDays),
    const DeepCollectionEquality().hash(_cardioDays),
    estimatedWeeklyCalorieBurn,
    const DeepCollectionEquality().hash(_workoutDescriptions),
  );

  /// Create a copy of WeeklyWorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyWorkoutSummaryImplCopyWith<_$WeeklyWorkoutSummaryImpl>
  get copyWith =>
      __$$WeeklyWorkoutSummaryImplCopyWithImpl<_$WeeklyWorkoutSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyWorkoutSummaryImplToJson(this);
  }
}

abstract class _WeeklyWorkoutSummary implements WeeklyWorkoutSummary {
  const factory _WeeklyWorkoutSummary({
    required final String planId,
    final List<int> workoutDays,
    final List<int> strengthDays,
    final List<int> cardioDays,
    final int estimatedWeeklyCalorieBurn,
    final Map<int, String> workoutDescriptions,
  }) = _$WeeklyWorkoutSummaryImpl;

  factory _WeeklyWorkoutSummary.fromJson(Map<String, dynamic> json) =
      _$WeeklyWorkoutSummaryImpl.fromJson;

  /// Workout plan ID
  @override
  String get planId;

  /// Days with workouts (0 = Monday)
  @override
  List<int> get workoutDays;

  /// Days with strength training
  @override
  List<int> get strengthDays;

  /// Days with cardio
  @override
  List<int> get cardioDays;

  /// Estimated weekly calorie burn
  @override
  int get estimatedWeeklyCalorieBurn;

  /// Workout descriptions by day
  @override
  Map<int, String> get workoutDescriptions;

  /// Create a copy of WeeklyWorkoutSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyWorkoutSummaryImplCopyWith<_$WeeklyWorkoutSummaryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MealPlanChange _$MealPlanChangeFromJson(Map<String, dynamic> json) {
  return _MealPlanChange.fromJson(json);
}

/// @nodoc
mixin _$MealPlanChange {
  String get id => throw _privateConstructorUsedError;

  /// Day index affected (0 = Monday)
  int get dayIndex => throw _privateConstructorUsedError;

  /// Type of change
  MealPlanChangeType get changeType => throw _privateConstructorUsedError;

  /// Description in English
  String get description => throw _privateConstructorUsedError;

  /// Description in Arabic
  String get descriptionAr => throw _privateConstructorUsedError;

  /// What triggered this change
  String get trigger => throw _privateConstructorUsedError;

  /// Proposed new calorie target
  int? get proposedCalories => throw _privateConstructorUsedError;

  /// Proposed new protein target
  int? get proposedProtein => throw _privateConstructorUsedError;

  /// Original calorie target
  int? get originalCalories => throw _privateConstructorUsedError;

  /// Original protein target
  int? get originalProtein => throw _privateConstructorUsedError;

  /// Whether this change is approved
  bool get isApproved => throw _privateConstructorUsedError;

  /// Whether this change is rejected
  bool get isRejected => throw _privateConstructorUsedError;

  /// Serializes this MealPlanChange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealPlanChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealPlanChangeCopyWith<MealPlanChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPlanChangeCopyWith<$Res> {
  factory $MealPlanChangeCopyWith(
    MealPlanChange value,
    $Res Function(MealPlanChange) then,
  ) = _$MealPlanChangeCopyWithImpl<$Res, MealPlanChange>;
  @useResult
  $Res call({
    String id,
    int dayIndex,
    MealPlanChangeType changeType,
    String description,
    String descriptionAr,
    String trigger,
    int? proposedCalories,
    int? proposedProtein,
    int? originalCalories,
    int? originalProtein,
    bool isApproved,
    bool isRejected,
  });
}

/// @nodoc
class _$MealPlanChangeCopyWithImpl<$Res, $Val extends MealPlanChange>
    implements $MealPlanChangeCopyWith<$Res> {
  _$MealPlanChangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealPlanChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dayIndex = null,
    Object? changeType = null,
    Object? description = null,
    Object? descriptionAr = null,
    Object? trigger = null,
    Object? proposedCalories = freezed,
    Object? proposedProtein = freezed,
    Object? originalCalories = freezed,
    Object? originalProtein = freezed,
    Object? isApproved = null,
    Object? isRejected = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            dayIndex: null == dayIndex
                ? _value.dayIndex
                : dayIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            changeType: null == changeType
                ? _value.changeType
                : changeType // ignore: cast_nullable_to_non_nullable
                      as MealPlanChangeType,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionAr: null == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String,
            trigger: null == trigger
                ? _value.trigger
                : trigger // ignore: cast_nullable_to_non_nullable
                      as String,
            proposedCalories: freezed == proposedCalories
                ? _value.proposedCalories
                : proposedCalories // ignore: cast_nullable_to_non_nullable
                      as int?,
            proposedProtein: freezed == proposedProtein
                ? _value.proposedProtein
                : proposedProtein // ignore: cast_nullable_to_non_nullable
                      as int?,
            originalCalories: freezed == originalCalories
                ? _value.originalCalories
                : originalCalories // ignore: cast_nullable_to_non_nullable
                      as int?,
            originalProtein: freezed == originalProtein
                ? _value.originalProtein
                : originalProtein // ignore: cast_nullable_to_non_nullable
                      as int?,
            isApproved: null == isApproved
                ? _value.isApproved
                : isApproved // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRejected: null == isRejected
                ? _value.isRejected
                : isRejected // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MealPlanChangeImplCopyWith<$Res>
    implements $MealPlanChangeCopyWith<$Res> {
  factory _$$MealPlanChangeImplCopyWith(
    _$MealPlanChangeImpl value,
    $Res Function(_$MealPlanChangeImpl) then,
  ) = __$$MealPlanChangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int dayIndex,
    MealPlanChangeType changeType,
    String description,
    String descriptionAr,
    String trigger,
    int? proposedCalories,
    int? proposedProtein,
    int? originalCalories,
    int? originalProtein,
    bool isApproved,
    bool isRejected,
  });
}

/// @nodoc
class __$$MealPlanChangeImplCopyWithImpl<$Res>
    extends _$MealPlanChangeCopyWithImpl<$Res, _$MealPlanChangeImpl>
    implements _$$MealPlanChangeImplCopyWith<$Res> {
  __$$MealPlanChangeImplCopyWithImpl(
    _$MealPlanChangeImpl _value,
    $Res Function(_$MealPlanChangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealPlanChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dayIndex = null,
    Object? changeType = null,
    Object? description = null,
    Object? descriptionAr = null,
    Object? trigger = null,
    Object? proposedCalories = freezed,
    Object? proposedProtein = freezed,
    Object? originalCalories = freezed,
    Object? originalProtein = freezed,
    Object? isApproved = null,
    Object? isRejected = null,
  }) {
    return _then(
      _$MealPlanChangeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        dayIndex: null == dayIndex
            ? _value.dayIndex
            : dayIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        changeType: null == changeType
            ? _value.changeType
            : changeType // ignore: cast_nullable_to_non_nullable
                  as MealPlanChangeType,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: null == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String,
        trigger: null == trigger
            ? _value.trigger
            : trigger // ignore: cast_nullable_to_non_nullable
                  as String,
        proposedCalories: freezed == proposedCalories
            ? _value.proposedCalories
            : proposedCalories // ignore: cast_nullable_to_non_nullable
                  as int?,
        proposedProtein: freezed == proposedProtein
            ? _value.proposedProtein
            : proposedProtein // ignore: cast_nullable_to_non_nullable
                  as int?,
        originalCalories: freezed == originalCalories
            ? _value.originalCalories
            : originalCalories // ignore: cast_nullable_to_non_nullable
                  as int?,
        originalProtein: freezed == originalProtein
            ? _value.originalProtein
            : originalProtein // ignore: cast_nullable_to_non_nullable
                  as int?,
        isApproved: null == isApproved
            ? _value.isApproved
            : isApproved // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRejected: null == isRejected
            ? _value.isRejected
            : isRejected // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MealPlanChangeImpl implements _MealPlanChange {
  const _$MealPlanChangeImpl({
    required this.id,
    required this.dayIndex,
    required this.changeType,
    required this.description,
    required this.descriptionAr,
    required this.trigger,
    this.proposedCalories,
    this.proposedProtein,
    this.originalCalories,
    this.originalProtein,
    this.isApproved = false,
    this.isRejected = false,
  });

  factory _$MealPlanChangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealPlanChangeImplFromJson(json);

  @override
  final String id;

  /// Day index affected (0 = Monday)
  @override
  final int dayIndex;

  /// Type of change
  @override
  final MealPlanChangeType changeType;

  /// Description in English
  @override
  final String description;

  /// Description in Arabic
  @override
  final String descriptionAr;

  /// What triggered this change
  @override
  final String trigger;

  /// Proposed new calorie target
  @override
  final int? proposedCalories;

  /// Proposed new protein target
  @override
  final int? proposedProtein;

  /// Original calorie target
  @override
  final int? originalCalories;

  /// Original protein target
  @override
  final int? originalProtein;

  /// Whether this change is approved
  @override
  @JsonKey()
  final bool isApproved;

  /// Whether this change is rejected
  @override
  @JsonKey()
  final bool isRejected;

  @override
  String toString() {
    return 'MealPlanChange(id: $id, dayIndex: $dayIndex, changeType: $changeType, description: $description, descriptionAr: $descriptionAr, trigger: $trigger, proposedCalories: $proposedCalories, proposedProtein: $proposedProtein, originalCalories: $originalCalories, originalProtein: $originalProtein, isApproved: $isApproved, isRejected: $isRejected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlanChangeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dayIndex, dayIndex) ||
                other.dayIndex == dayIndex) &&
            (identical(other.changeType, changeType) ||
                other.changeType == changeType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.proposedCalories, proposedCalories) ||
                other.proposedCalories == proposedCalories) &&
            (identical(other.proposedProtein, proposedProtein) ||
                other.proposedProtein == proposedProtein) &&
            (identical(other.originalCalories, originalCalories) ||
                other.originalCalories == originalCalories) &&
            (identical(other.originalProtein, originalProtein) ||
                other.originalProtein == originalProtein) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.isRejected, isRejected) ||
                other.isRejected == isRejected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    dayIndex,
    changeType,
    description,
    descriptionAr,
    trigger,
    proposedCalories,
    proposedProtein,
    originalCalories,
    originalProtein,
    isApproved,
    isRejected,
  );

  /// Create a copy of MealPlanChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealPlanChangeImplCopyWith<_$MealPlanChangeImpl> get copyWith =>
      __$$MealPlanChangeImplCopyWithImpl<_$MealPlanChangeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MealPlanChangeImplToJson(this);
  }
}

abstract class _MealPlanChange implements MealPlanChange {
  const factory _MealPlanChange({
    required final String id,
    required final int dayIndex,
    required final MealPlanChangeType changeType,
    required final String description,
    required final String descriptionAr,
    required final String trigger,
    final int? proposedCalories,
    final int? proposedProtein,
    final int? originalCalories,
    final int? originalProtein,
    final bool isApproved,
    final bool isRejected,
  }) = _$MealPlanChangeImpl;

  factory _MealPlanChange.fromJson(Map<String, dynamic> json) =
      _$MealPlanChangeImpl.fromJson;

  @override
  String get id;

  /// Day index affected (0 = Monday)
  @override
  int get dayIndex;

  /// Type of change
  @override
  MealPlanChangeType get changeType;

  /// Description in English
  @override
  String get description;

  /// Description in Arabic
  @override
  String get descriptionAr;

  /// What triggered this change
  @override
  String get trigger;

  /// Proposed new calorie target
  @override
  int? get proposedCalories;

  /// Proposed new protein target
  @override
  int? get proposedProtein;

  /// Original calorie target
  @override
  int? get originalCalories;

  /// Original protein target
  @override
  int? get originalProtein;

  /// Whether this change is approved
  @override
  bool get isApproved;

  /// Whether this change is rejected
  @override
  bool get isRejected;

  /// Create a copy of MealPlanChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealPlanChangeImplCopyWith<_$MealPlanChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
