// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_workout_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WeeklyWorkoutPlan _$WeeklyWorkoutPlanFromJson(Map<String, dynamic> json) {
  return _WeeklyWorkoutPlan.fromJson(json);
}

/// @nodoc
mixin _$WeeklyWorkoutPlan {
  String get id => throw _privateConstructorUsedError;

  /// Start date of the week (Monday)
  DateTime get weekStartDate => throw _privateConstructorUsedError;

  /// When this plan was generated
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Daily workout plans for each day of the week
  AiDailyWorkout? get monday => throw _privateConstructorUsedError;
  AiDailyWorkout? get tuesday => throw _privateConstructorUsedError;
  AiDailyWorkout? get wednesday => throw _privateConstructorUsedError;
  AiDailyWorkout? get thursday => throw _privateConstructorUsedError;
  AiDailyWorkout? get friday => throw _privateConstructorUsedError;
  AiDailyWorkout? get saturday => throw _privateConstructorUsedError;
  AiDailyWorkout? get sunday => throw _privateConstructorUsedError;

  /// Total estimated calories burned for the week
  int get totalEstimatedCaloriesBurn => throw _privateConstructorUsedError;

  /// Total workout minutes for the week
  int get totalWorkoutMinutes => throw _privateConstructorUsedError;

  /// Number of workout days (non-rest days)
  int get workoutDaysCount => throw _privateConstructorUsedError;

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

  /// Linked meal plan ID for interconnection
  String? get linkedMealPlanId => throw _privateConstructorUsedError;

  /// Fitness goals this plan targets
  List<String> get fitnessGoals => throw _privateConstructorUsedError;

  /// Equipment required for the workouts
  List<String> get equipmentRequired => throw _privateConstructorUsedError;

  /// Serializes this WeeklyWorkoutPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyWorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyWorkoutPlanCopyWith<WeeklyWorkoutPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyWorkoutPlanCopyWith<$Res> {
  factory $WeeklyWorkoutPlanCopyWith(
    WeeklyWorkoutPlan value,
    $Res Function(WeeklyWorkoutPlan) then,
  ) = _$WeeklyWorkoutPlanCopyWithImpl<$Res, WeeklyWorkoutPlan>;
  @useResult
  $Res call({
    String id,
    DateTime weekStartDate,
    DateTime generatedAt,
    AiDailyWorkout? monday,
    AiDailyWorkout? tuesday,
    AiDailyWorkout? wednesday,
    AiDailyWorkout? thursday,
    AiDailyWorkout? friday,
    AiDailyWorkout? saturday,
    AiDailyWorkout? sunday,
    int totalEstimatedCaloriesBurn,
    int totalWorkoutMinutes,
    int workoutDaysCount,
    int? recoveryScoreAtGeneration,
    double? strainScoreAtGeneration,
    bool isAiGenerated,
    String? coachingNote,
    String? coachingNoteAr,
    PlanApprovalStatus approvalStatus,
    String? linkedMealPlanId,
    List<String> fitnessGoals,
    List<String> equipmentRequired,
  });

  $AiDailyWorkoutCopyWith<$Res>? get monday;
  $AiDailyWorkoutCopyWith<$Res>? get tuesday;
  $AiDailyWorkoutCopyWith<$Res>? get wednesday;
  $AiDailyWorkoutCopyWith<$Res>? get thursday;
  $AiDailyWorkoutCopyWith<$Res>? get friday;
  $AiDailyWorkoutCopyWith<$Res>? get saturday;
  $AiDailyWorkoutCopyWith<$Res>? get sunday;
}

/// @nodoc
class _$WeeklyWorkoutPlanCopyWithImpl<$Res, $Val extends WeeklyWorkoutPlan>
    implements $WeeklyWorkoutPlanCopyWith<$Res> {
  _$WeeklyWorkoutPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyWorkoutPlan
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
    Object? totalEstimatedCaloriesBurn = null,
    Object? totalWorkoutMinutes = null,
    Object? workoutDaysCount = null,
    Object? recoveryScoreAtGeneration = freezed,
    Object? strainScoreAtGeneration = freezed,
    Object? isAiGenerated = null,
    Object? coachingNote = freezed,
    Object? coachingNoteAr = freezed,
    Object? approvalStatus = null,
    Object? linkedMealPlanId = freezed,
    Object? fitnessGoals = null,
    Object? equipmentRequired = null,
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
                      as AiDailyWorkout?,
            tuesday: freezed == tuesday
                ? _value.tuesday
                : tuesday // ignore: cast_nullable_to_non_nullable
                      as AiDailyWorkout?,
            wednesday: freezed == wednesday
                ? _value.wednesday
                : wednesday // ignore: cast_nullable_to_non_nullable
                      as AiDailyWorkout?,
            thursday: freezed == thursday
                ? _value.thursday
                : thursday // ignore: cast_nullable_to_non_nullable
                      as AiDailyWorkout?,
            friday: freezed == friday
                ? _value.friday
                : friday // ignore: cast_nullable_to_non_nullable
                      as AiDailyWorkout?,
            saturday: freezed == saturday
                ? _value.saturday
                : saturday // ignore: cast_nullable_to_non_nullable
                      as AiDailyWorkout?,
            sunday: freezed == sunday
                ? _value.sunday
                : sunday // ignore: cast_nullable_to_non_nullable
                      as AiDailyWorkout?,
            totalEstimatedCaloriesBurn: null == totalEstimatedCaloriesBurn
                ? _value.totalEstimatedCaloriesBurn
                : totalEstimatedCaloriesBurn // ignore: cast_nullable_to_non_nullable
                      as int,
            totalWorkoutMinutes: null == totalWorkoutMinutes
                ? _value.totalWorkoutMinutes
                : totalWorkoutMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            workoutDaysCount: null == workoutDaysCount
                ? _value.workoutDaysCount
                : workoutDaysCount // ignore: cast_nullable_to_non_nullable
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
            linkedMealPlanId: freezed == linkedMealPlanId
                ? _value.linkedMealPlanId
                : linkedMealPlanId // ignore: cast_nullable_to_non_nullable
                      as String?,
            fitnessGoals: null == fitnessGoals
                ? _value.fitnessGoals
                : fitnessGoals // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            equipmentRequired: null == equipmentRequired
                ? _value.equipmentRequired
                : equipmentRequired // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of WeeklyWorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiDailyWorkoutCopyWith<$Res>? get monday {
    if (_value.monday == null) {
      return null;
    }

    return $AiDailyWorkoutCopyWith<$Res>(_value.monday!, (value) {
      return _then(_value.copyWith(monday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyWorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiDailyWorkoutCopyWith<$Res>? get tuesday {
    if (_value.tuesday == null) {
      return null;
    }

    return $AiDailyWorkoutCopyWith<$Res>(_value.tuesday!, (value) {
      return _then(_value.copyWith(tuesday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyWorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiDailyWorkoutCopyWith<$Res>? get wednesday {
    if (_value.wednesday == null) {
      return null;
    }

    return $AiDailyWorkoutCopyWith<$Res>(_value.wednesday!, (value) {
      return _then(_value.copyWith(wednesday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyWorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiDailyWorkoutCopyWith<$Res>? get thursday {
    if (_value.thursday == null) {
      return null;
    }

    return $AiDailyWorkoutCopyWith<$Res>(_value.thursday!, (value) {
      return _then(_value.copyWith(thursday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyWorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiDailyWorkoutCopyWith<$Res>? get friday {
    if (_value.friday == null) {
      return null;
    }

    return $AiDailyWorkoutCopyWith<$Res>(_value.friday!, (value) {
      return _then(_value.copyWith(friday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyWorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiDailyWorkoutCopyWith<$Res>? get saturday {
    if (_value.saturday == null) {
      return null;
    }

    return $AiDailyWorkoutCopyWith<$Res>(_value.saturday!, (value) {
      return _then(_value.copyWith(saturday: value) as $Val);
    });
  }

  /// Create a copy of WeeklyWorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiDailyWorkoutCopyWith<$Res>? get sunday {
    if (_value.sunday == null) {
      return null;
    }

    return $AiDailyWorkoutCopyWith<$Res>(_value.sunday!, (value) {
      return _then(_value.copyWith(sunday: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeeklyWorkoutPlanImplCopyWith<$Res>
    implements $WeeklyWorkoutPlanCopyWith<$Res> {
  factory _$$WeeklyWorkoutPlanImplCopyWith(
    _$WeeklyWorkoutPlanImpl value,
    $Res Function(_$WeeklyWorkoutPlanImpl) then,
  ) = __$$WeeklyWorkoutPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime weekStartDate,
    DateTime generatedAt,
    AiDailyWorkout? monday,
    AiDailyWorkout? tuesday,
    AiDailyWorkout? wednesday,
    AiDailyWorkout? thursday,
    AiDailyWorkout? friday,
    AiDailyWorkout? saturday,
    AiDailyWorkout? sunday,
    int totalEstimatedCaloriesBurn,
    int totalWorkoutMinutes,
    int workoutDaysCount,
    int? recoveryScoreAtGeneration,
    double? strainScoreAtGeneration,
    bool isAiGenerated,
    String? coachingNote,
    String? coachingNoteAr,
    PlanApprovalStatus approvalStatus,
    String? linkedMealPlanId,
    List<String> fitnessGoals,
    List<String> equipmentRequired,
  });

  @override
  $AiDailyWorkoutCopyWith<$Res>? get monday;
  @override
  $AiDailyWorkoutCopyWith<$Res>? get tuesday;
  @override
  $AiDailyWorkoutCopyWith<$Res>? get wednesday;
  @override
  $AiDailyWorkoutCopyWith<$Res>? get thursday;
  @override
  $AiDailyWorkoutCopyWith<$Res>? get friday;
  @override
  $AiDailyWorkoutCopyWith<$Res>? get saturday;
  @override
  $AiDailyWorkoutCopyWith<$Res>? get sunday;
}

/// @nodoc
class __$$WeeklyWorkoutPlanImplCopyWithImpl<$Res>
    extends _$WeeklyWorkoutPlanCopyWithImpl<$Res, _$WeeklyWorkoutPlanImpl>
    implements _$$WeeklyWorkoutPlanImplCopyWith<$Res> {
  __$$WeeklyWorkoutPlanImplCopyWithImpl(
    _$WeeklyWorkoutPlanImpl _value,
    $Res Function(_$WeeklyWorkoutPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyWorkoutPlan
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
    Object? totalEstimatedCaloriesBurn = null,
    Object? totalWorkoutMinutes = null,
    Object? workoutDaysCount = null,
    Object? recoveryScoreAtGeneration = freezed,
    Object? strainScoreAtGeneration = freezed,
    Object? isAiGenerated = null,
    Object? coachingNote = freezed,
    Object? coachingNoteAr = freezed,
    Object? approvalStatus = null,
    Object? linkedMealPlanId = freezed,
    Object? fitnessGoals = null,
    Object? equipmentRequired = null,
  }) {
    return _then(
      _$WeeklyWorkoutPlanImpl(
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
                  as AiDailyWorkout?,
        tuesday: freezed == tuesday
            ? _value.tuesday
            : tuesday // ignore: cast_nullable_to_non_nullable
                  as AiDailyWorkout?,
        wednesday: freezed == wednesday
            ? _value.wednesday
            : wednesday // ignore: cast_nullable_to_non_nullable
                  as AiDailyWorkout?,
        thursday: freezed == thursday
            ? _value.thursday
            : thursday // ignore: cast_nullable_to_non_nullable
                  as AiDailyWorkout?,
        friday: freezed == friday
            ? _value.friday
            : friday // ignore: cast_nullable_to_non_nullable
                  as AiDailyWorkout?,
        saturday: freezed == saturday
            ? _value.saturday
            : saturday // ignore: cast_nullable_to_non_nullable
                  as AiDailyWorkout?,
        sunday: freezed == sunday
            ? _value.sunday
            : sunday // ignore: cast_nullable_to_non_nullable
                  as AiDailyWorkout?,
        totalEstimatedCaloriesBurn: null == totalEstimatedCaloriesBurn
            ? _value.totalEstimatedCaloriesBurn
            : totalEstimatedCaloriesBurn // ignore: cast_nullable_to_non_nullable
                  as int,
        totalWorkoutMinutes: null == totalWorkoutMinutes
            ? _value.totalWorkoutMinutes
            : totalWorkoutMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        workoutDaysCount: null == workoutDaysCount
            ? _value.workoutDaysCount
            : workoutDaysCount // ignore: cast_nullable_to_non_nullable
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
        linkedMealPlanId: freezed == linkedMealPlanId
            ? _value.linkedMealPlanId
            : linkedMealPlanId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fitnessGoals: null == fitnessGoals
            ? _value._fitnessGoals
            : fitnessGoals // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        equipmentRequired: null == equipmentRequired
            ? _value._equipmentRequired
            : equipmentRequired // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyWorkoutPlanImpl extends _WeeklyWorkoutPlan {
  const _$WeeklyWorkoutPlanImpl({
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
    this.totalEstimatedCaloriesBurn = 0,
    this.totalWorkoutMinutes = 0,
    this.workoutDaysCount = 0,
    this.recoveryScoreAtGeneration,
    this.strainScoreAtGeneration,
    this.isAiGenerated = true,
    this.coachingNote,
    this.coachingNoteAr,
    this.approvalStatus = PlanApprovalStatus.pending,
    this.linkedMealPlanId,
    final List<String> fitnessGoals = const [],
    final List<String> equipmentRequired = const [],
  }) : _fitnessGoals = fitnessGoals,
       _equipmentRequired = equipmentRequired,
       super._();

  factory _$WeeklyWorkoutPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyWorkoutPlanImplFromJson(json);

  @override
  final String id;

  /// Start date of the week (Monday)
  @override
  final DateTime weekStartDate;

  /// When this plan was generated
  @override
  final DateTime generatedAt;

  /// Daily workout plans for each day of the week
  @override
  final AiDailyWorkout? monday;
  @override
  final AiDailyWorkout? tuesday;
  @override
  final AiDailyWorkout? wednesday;
  @override
  final AiDailyWorkout? thursday;
  @override
  final AiDailyWorkout? friday;
  @override
  final AiDailyWorkout? saturday;
  @override
  final AiDailyWorkout? sunday;

  /// Total estimated calories burned for the week
  @override
  @JsonKey()
  final int totalEstimatedCaloriesBurn;

  /// Total workout minutes for the week
  @override
  @JsonKey()
  final int totalWorkoutMinutes;

  /// Number of workout days (non-rest days)
  @override
  @JsonKey()
  final int workoutDaysCount;

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

  /// Linked meal plan ID for interconnection
  @override
  final String? linkedMealPlanId;

  /// Fitness goals this plan targets
  final List<String> _fitnessGoals;

  /// Fitness goals this plan targets
  @override
  @JsonKey()
  List<String> get fitnessGoals {
    if (_fitnessGoals is EqualUnmodifiableListView) return _fitnessGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fitnessGoals);
  }

  /// Equipment required for the workouts
  final List<String> _equipmentRequired;

  /// Equipment required for the workouts
  @override
  @JsonKey()
  List<String> get equipmentRequired {
    if (_equipmentRequired is EqualUnmodifiableListView)
      return _equipmentRequired;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipmentRequired);
  }

  @override
  String toString() {
    return 'WeeklyWorkoutPlan(id: $id, weekStartDate: $weekStartDate, generatedAt: $generatedAt, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday, totalEstimatedCaloriesBurn: $totalEstimatedCaloriesBurn, totalWorkoutMinutes: $totalWorkoutMinutes, workoutDaysCount: $workoutDaysCount, recoveryScoreAtGeneration: $recoveryScoreAtGeneration, strainScoreAtGeneration: $strainScoreAtGeneration, isAiGenerated: $isAiGenerated, coachingNote: $coachingNote, coachingNoteAr: $coachingNoteAr, approvalStatus: $approvalStatus, linkedMealPlanId: $linkedMealPlanId, fitnessGoals: $fitnessGoals, equipmentRequired: $equipmentRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyWorkoutPlanImpl &&
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
            (identical(
                  other.totalEstimatedCaloriesBurn,
                  totalEstimatedCaloriesBurn,
                ) ||
                other.totalEstimatedCaloriesBurn ==
                    totalEstimatedCaloriesBurn) &&
            (identical(other.totalWorkoutMinutes, totalWorkoutMinutes) ||
                other.totalWorkoutMinutes == totalWorkoutMinutes) &&
            (identical(other.workoutDaysCount, workoutDaysCount) ||
                other.workoutDaysCount == workoutDaysCount) &&
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
            (identical(other.linkedMealPlanId, linkedMealPlanId) ||
                other.linkedMealPlanId == linkedMealPlanId) &&
            const DeepCollectionEquality().equals(
              other._fitnessGoals,
              _fitnessGoals,
            ) &&
            const DeepCollectionEquality().equals(
              other._equipmentRequired,
              _equipmentRequired,
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
    totalEstimatedCaloriesBurn,
    totalWorkoutMinutes,
    workoutDaysCount,
    recoveryScoreAtGeneration,
    strainScoreAtGeneration,
    isAiGenerated,
    coachingNote,
    coachingNoteAr,
    approvalStatus,
    linkedMealPlanId,
    const DeepCollectionEquality().hash(_fitnessGoals),
    const DeepCollectionEquality().hash(_equipmentRequired),
  ]);

  /// Create a copy of WeeklyWorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyWorkoutPlanImplCopyWith<_$WeeklyWorkoutPlanImpl> get copyWith =>
      __$$WeeklyWorkoutPlanImplCopyWithImpl<_$WeeklyWorkoutPlanImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyWorkoutPlanImplToJson(this);
  }
}

abstract class _WeeklyWorkoutPlan extends WeeklyWorkoutPlan {
  const factory _WeeklyWorkoutPlan({
    required final String id,
    required final DateTime weekStartDate,
    required final DateTime generatedAt,
    final AiDailyWorkout? monday,
    final AiDailyWorkout? tuesday,
    final AiDailyWorkout? wednesday,
    final AiDailyWorkout? thursday,
    final AiDailyWorkout? friday,
    final AiDailyWorkout? saturday,
    final AiDailyWorkout? sunday,
    final int totalEstimatedCaloriesBurn,
    final int totalWorkoutMinutes,
    final int workoutDaysCount,
    final int? recoveryScoreAtGeneration,
    final double? strainScoreAtGeneration,
    final bool isAiGenerated,
    final String? coachingNote,
    final String? coachingNoteAr,
    final PlanApprovalStatus approvalStatus,
    final String? linkedMealPlanId,
    final List<String> fitnessGoals,
    final List<String> equipmentRequired,
  }) = _$WeeklyWorkoutPlanImpl;
  const _WeeklyWorkoutPlan._() : super._();

  factory _WeeklyWorkoutPlan.fromJson(Map<String, dynamic> json) =
      _$WeeklyWorkoutPlanImpl.fromJson;

  @override
  String get id;

  /// Start date of the week (Monday)
  @override
  DateTime get weekStartDate;

  /// When this plan was generated
  @override
  DateTime get generatedAt;

  /// Daily workout plans for each day of the week
  @override
  AiDailyWorkout? get monday;
  @override
  AiDailyWorkout? get tuesday;
  @override
  AiDailyWorkout? get wednesday;
  @override
  AiDailyWorkout? get thursday;
  @override
  AiDailyWorkout? get friday;
  @override
  AiDailyWorkout? get saturday;
  @override
  AiDailyWorkout? get sunday;

  /// Total estimated calories burned for the week
  @override
  int get totalEstimatedCaloriesBurn;

  /// Total workout minutes for the week
  @override
  int get totalWorkoutMinutes;

  /// Number of workout days (non-rest days)
  @override
  int get workoutDaysCount;

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

  /// Linked meal plan ID for interconnection
  @override
  String? get linkedMealPlanId;

  /// Fitness goals this plan targets
  @override
  List<String> get fitnessGoals;

  /// Equipment required for the workouts
  @override
  List<String> get equipmentRequired;

  /// Create a copy of WeeklyWorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyWorkoutPlanImplCopyWith<_$WeeklyWorkoutPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiDailyWorkout _$AiDailyWorkoutFromJson(Map<String, dynamic> json) {
  return _AiDailyWorkout.fromJson(json);
}

/// @nodoc
mixin _$AiDailyWorkout {
  /// Reference to workout template ID (if using a template)
  String? get workoutTemplateId => throw _privateConstructorUsedError;

  /// Name of the workout
  String get workoutName => throw _privateConstructorUsedError;

  /// Arabic name
  String? get workoutNameAr => throw _privateConstructorUsedError;

  /// Category: strength, cardio, hiit, flexibility, recovery
  String get category => throw _privateConstructorUsedError;

  /// Estimated duration in minutes
  int get estimatedMinutes => throw _privateConstructorUsedError;

  /// Estimated calories burned
  int get estimatedCaloriesBurn => throw _privateConstructorUsedError;

  /// Suggested intensity (1-5)
  int get suggestedIntensity => throw _privateConstructorUsedError;

  /// Best time of day to do this workout
  String? get timeOfDay => throw _privateConstructorUsedError;

  /// Arabic time of day
  String? get timeOfDayAr => throw _privateConstructorUsedError;

  /// Target muscle groups
  List<String> get targetMuscleGroups => throw _privateConstructorUsedError;

  /// Equipment needed
  List<String> get equipment => throw _privateConstructorUsedError;

  /// Whether this is a rest day
  bool get isRestDay => throw _privateConstructorUsedError;

  /// Brief description of the workout
  String? get description => throw _privateConstructorUsedError;

  /// Arabic description
  String? get descriptionAr => throw _privateConstructorUsedError;

  /// Notes from the AI
  String? get notes => throw _privateConstructorUsedError;

  /// List of exercises for this workout (NEW)
  List<AiWorkoutExercise> get exercises => throw _privateConstructorUsedError;

  /// Warmup exercises (optional)
  List<AiWorkoutExercise> get warmup => throw _privateConstructorUsedError;

  /// Cooldown exercises (optional)
  List<AiWorkoutExercise> get cooldown => throw _privateConstructorUsedError;

  /// Serializes this AiDailyWorkout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiDailyWorkout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiDailyWorkoutCopyWith<AiDailyWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiDailyWorkoutCopyWith<$Res> {
  factory $AiDailyWorkoutCopyWith(
    AiDailyWorkout value,
    $Res Function(AiDailyWorkout) then,
  ) = _$AiDailyWorkoutCopyWithImpl<$Res, AiDailyWorkout>;
  @useResult
  $Res call({
    String? workoutTemplateId,
    String workoutName,
    String? workoutNameAr,
    String category,
    int estimatedMinutes,
    int estimatedCaloriesBurn,
    int suggestedIntensity,
    String? timeOfDay,
    String? timeOfDayAr,
    List<String> targetMuscleGroups,
    List<String> equipment,
    bool isRestDay,
    String? description,
    String? descriptionAr,
    String? notes,
    List<AiWorkoutExercise> exercises,
    List<AiWorkoutExercise> warmup,
    List<AiWorkoutExercise> cooldown,
  });
}

/// @nodoc
class _$AiDailyWorkoutCopyWithImpl<$Res, $Val extends AiDailyWorkout>
    implements $AiDailyWorkoutCopyWith<$Res> {
  _$AiDailyWorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiDailyWorkout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutTemplateId = freezed,
    Object? workoutName = null,
    Object? workoutNameAr = freezed,
    Object? category = null,
    Object? estimatedMinutes = null,
    Object? estimatedCaloriesBurn = null,
    Object? suggestedIntensity = null,
    Object? timeOfDay = freezed,
    Object? timeOfDayAr = freezed,
    Object? targetMuscleGroups = null,
    Object? equipment = null,
    Object? isRestDay = null,
    Object? description = freezed,
    Object? descriptionAr = freezed,
    Object? notes = freezed,
    Object? exercises = null,
    Object? warmup = null,
    Object? cooldown = null,
  }) {
    return _then(
      _value.copyWith(
            workoutTemplateId: freezed == workoutTemplateId
                ? _value.workoutTemplateId
                : workoutTemplateId // ignore: cast_nullable_to_non_nullable
                      as String?,
            workoutName: null == workoutName
                ? _value.workoutName
                : workoutName // ignore: cast_nullable_to_non_nullable
                      as String,
            workoutNameAr: freezed == workoutNameAr
                ? _value.workoutNameAr
                : workoutNameAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            estimatedMinutes: null == estimatedMinutes
                ? _value.estimatedMinutes
                : estimatedMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            estimatedCaloriesBurn: null == estimatedCaloriesBurn
                ? _value.estimatedCaloriesBurn
                : estimatedCaloriesBurn // ignore: cast_nullable_to_non_nullable
                      as int,
            suggestedIntensity: null == suggestedIntensity
                ? _value.suggestedIntensity
                : suggestedIntensity // ignore: cast_nullable_to_non_nullable
                      as int,
            timeOfDay: freezed == timeOfDay
                ? _value.timeOfDay
                : timeOfDay // ignore: cast_nullable_to_non_nullable
                      as String?,
            timeOfDayAr: freezed == timeOfDayAr
                ? _value.timeOfDayAr
                : timeOfDayAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            targetMuscleGroups: null == targetMuscleGroups
                ? _value.targetMuscleGroups
                : targetMuscleGroups // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            equipment: null == equipment
                ? _value.equipment
                : equipment // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isRestDay: null == isRestDay
                ? _value.isRestDay
                : isRestDay // ignore: cast_nullable_to_non_nullable
                      as bool,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            descriptionAr: freezed == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<AiWorkoutExercise>,
            warmup: null == warmup
                ? _value.warmup
                : warmup // ignore: cast_nullable_to_non_nullable
                      as List<AiWorkoutExercise>,
            cooldown: null == cooldown
                ? _value.cooldown
                : cooldown // ignore: cast_nullable_to_non_nullable
                      as List<AiWorkoutExercise>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiDailyWorkoutImplCopyWith<$Res>
    implements $AiDailyWorkoutCopyWith<$Res> {
  factory _$$AiDailyWorkoutImplCopyWith(
    _$AiDailyWorkoutImpl value,
    $Res Function(_$AiDailyWorkoutImpl) then,
  ) = __$$AiDailyWorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? workoutTemplateId,
    String workoutName,
    String? workoutNameAr,
    String category,
    int estimatedMinutes,
    int estimatedCaloriesBurn,
    int suggestedIntensity,
    String? timeOfDay,
    String? timeOfDayAr,
    List<String> targetMuscleGroups,
    List<String> equipment,
    bool isRestDay,
    String? description,
    String? descriptionAr,
    String? notes,
    List<AiWorkoutExercise> exercises,
    List<AiWorkoutExercise> warmup,
    List<AiWorkoutExercise> cooldown,
  });
}

/// @nodoc
class __$$AiDailyWorkoutImplCopyWithImpl<$Res>
    extends _$AiDailyWorkoutCopyWithImpl<$Res, _$AiDailyWorkoutImpl>
    implements _$$AiDailyWorkoutImplCopyWith<$Res> {
  __$$AiDailyWorkoutImplCopyWithImpl(
    _$AiDailyWorkoutImpl _value,
    $Res Function(_$AiDailyWorkoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiDailyWorkout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutTemplateId = freezed,
    Object? workoutName = null,
    Object? workoutNameAr = freezed,
    Object? category = null,
    Object? estimatedMinutes = null,
    Object? estimatedCaloriesBurn = null,
    Object? suggestedIntensity = null,
    Object? timeOfDay = freezed,
    Object? timeOfDayAr = freezed,
    Object? targetMuscleGroups = null,
    Object? equipment = null,
    Object? isRestDay = null,
    Object? description = freezed,
    Object? descriptionAr = freezed,
    Object? notes = freezed,
    Object? exercises = null,
    Object? warmup = null,
    Object? cooldown = null,
  }) {
    return _then(
      _$AiDailyWorkoutImpl(
        workoutTemplateId: freezed == workoutTemplateId
            ? _value.workoutTemplateId
            : workoutTemplateId // ignore: cast_nullable_to_non_nullable
                  as String?,
        workoutName: null == workoutName
            ? _value.workoutName
            : workoutName // ignore: cast_nullable_to_non_nullable
                  as String,
        workoutNameAr: freezed == workoutNameAr
            ? _value.workoutNameAr
            : workoutNameAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        estimatedMinutes: null == estimatedMinutes
            ? _value.estimatedMinutes
            : estimatedMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        estimatedCaloriesBurn: null == estimatedCaloriesBurn
            ? _value.estimatedCaloriesBurn
            : estimatedCaloriesBurn // ignore: cast_nullable_to_non_nullable
                  as int,
        suggestedIntensity: null == suggestedIntensity
            ? _value.suggestedIntensity
            : suggestedIntensity // ignore: cast_nullable_to_non_nullable
                  as int,
        timeOfDay: freezed == timeOfDay
            ? _value.timeOfDay
            : timeOfDay // ignore: cast_nullable_to_non_nullable
                  as String?,
        timeOfDayAr: freezed == timeOfDayAr
            ? _value.timeOfDayAr
            : timeOfDayAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        targetMuscleGroups: null == targetMuscleGroups
            ? _value._targetMuscleGroups
            : targetMuscleGroups // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        equipment: null == equipment
            ? _value._equipment
            : equipment // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isRestDay: null == isRestDay
            ? _value.isRestDay
            : isRestDay // ignore: cast_nullable_to_non_nullable
                  as bool,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        descriptionAr: freezed == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<AiWorkoutExercise>,
        warmup: null == warmup
            ? _value._warmup
            : warmup // ignore: cast_nullable_to_non_nullable
                  as List<AiWorkoutExercise>,
        cooldown: null == cooldown
            ? _value._cooldown
            : cooldown // ignore: cast_nullable_to_non_nullable
                  as List<AiWorkoutExercise>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiDailyWorkoutImpl extends _AiDailyWorkout {
  const _$AiDailyWorkoutImpl({
    this.workoutTemplateId,
    required this.workoutName,
    this.workoutNameAr,
    required this.category,
    required this.estimatedMinutes,
    required this.estimatedCaloriesBurn,
    this.suggestedIntensity = 3,
    this.timeOfDay,
    this.timeOfDayAr,
    final List<String> targetMuscleGroups = const [],
    final List<String> equipment = const [],
    this.isRestDay = false,
    this.description,
    this.descriptionAr,
    this.notes,
    final List<AiWorkoutExercise> exercises = const [],
    final List<AiWorkoutExercise> warmup = const [],
    final List<AiWorkoutExercise> cooldown = const [],
  }) : _targetMuscleGroups = targetMuscleGroups,
       _equipment = equipment,
       _exercises = exercises,
       _warmup = warmup,
       _cooldown = cooldown,
       super._();

  factory _$AiDailyWorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiDailyWorkoutImplFromJson(json);

  /// Reference to workout template ID (if using a template)
  @override
  final String? workoutTemplateId;

  /// Name of the workout
  @override
  final String workoutName;

  /// Arabic name
  @override
  final String? workoutNameAr;

  /// Category: strength, cardio, hiit, flexibility, recovery
  @override
  final String category;

  /// Estimated duration in minutes
  @override
  final int estimatedMinutes;

  /// Estimated calories burned
  @override
  final int estimatedCaloriesBurn;

  /// Suggested intensity (1-5)
  @override
  @JsonKey()
  final int suggestedIntensity;

  /// Best time of day to do this workout
  @override
  final String? timeOfDay;

  /// Arabic time of day
  @override
  final String? timeOfDayAr;

  /// Target muscle groups
  final List<String> _targetMuscleGroups;

  /// Target muscle groups
  @override
  @JsonKey()
  List<String> get targetMuscleGroups {
    if (_targetMuscleGroups is EqualUnmodifiableListView)
      return _targetMuscleGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetMuscleGroups);
  }

  /// Equipment needed
  final List<String> _equipment;

  /// Equipment needed
  @override
  @JsonKey()
  List<String> get equipment {
    if (_equipment is EqualUnmodifiableListView) return _equipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipment);
  }

  /// Whether this is a rest day
  @override
  @JsonKey()
  final bool isRestDay;

  /// Brief description of the workout
  @override
  final String? description;

  /// Arabic description
  @override
  final String? descriptionAr;

  /// Notes from the AI
  @override
  final String? notes;

  /// List of exercises for this workout (NEW)
  final List<AiWorkoutExercise> _exercises;

  /// List of exercises for this workout (NEW)
  @override
  @JsonKey()
  List<AiWorkoutExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  /// Warmup exercises (optional)
  final List<AiWorkoutExercise> _warmup;

  /// Warmup exercises (optional)
  @override
  @JsonKey()
  List<AiWorkoutExercise> get warmup {
    if (_warmup is EqualUnmodifiableListView) return _warmup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warmup);
  }

  /// Cooldown exercises (optional)
  final List<AiWorkoutExercise> _cooldown;

  /// Cooldown exercises (optional)
  @override
  @JsonKey()
  List<AiWorkoutExercise> get cooldown {
    if (_cooldown is EqualUnmodifiableListView) return _cooldown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cooldown);
  }

  @override
  String toString() {
    return 'AiDailyWorkout(workoutTemplateId: $workoutTemplateId, workoutName: $workoutName, workoutNameAr: $workoutNameAr, category: $category, estimatedMinutes: $estimatedMinutes, estimatedCaloriesBurn: $estimatedCaloriesBurn, suggestedIntensity: $suggestedIntensity, timeOfDay: $timeOfDay, timeOfDayAr: $timeOfDayAr, targetMuscleGroups: $targetMuscleGroups, equipment: $equipment, isRestDay: $isRestDay, description: $description, descriptionAr: $descriptionAr, notes: $notes, exercises: $exercises, warmup: $warmup, cooldown: $cooldown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiDailyWorkoutImpl &&
            (identical(other.workoutTemplateId, workoutTemplateId) ||
                other.workoutTemplateId == workoutTemplateId) &&
            (identical(other.workoutName, workoutName) ||
                other.workoutName == workoutName) &&
            (identical(other.workoutNameAr, workoutNameAr) ||
                other.workoutNameAr == workoutNameAr) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes) &&
            (identical(other.estimatedCaloriesBurn, estimatedCaloriesBurn) ||
                other.estimatedCaloriesBurn == estimatedCaloriesBurn) &&
            (identical(other.suggestedIntensity, suggestedIntensity) ||
                other.suggestedIntensity == suggestedIntensity) &&
            (identical(other.timeOfDay, timeOfDay) ||
                other.timeOfDay == timeOfDay) &&
            (identical(other.timeOfDayAr, timeOfDayAr) ||
                other.timeOfDayAr == timeOfDayAr) &&
            const DeepCollectionEquality().equals(
              other._targetMuscleGroups,
              _targetMuscleGroups,
            ) &&
            const DeepCollectionEquality().equals(
              other._equipment,
              _equipment,
            ) &&
            (identical(other.isRestDay, isRestDay) ||
                other.isRestDay == isRestDay) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            const DeepCollectionEquality().equals(other._warmup, _warmup) &&
            const DeepCollectionEquality().equals(other._cooldown, _cooldown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    workoutTemplateId,
    workoutName,
    workoutNameAr,
    category,
    estimatedMinutes,
    estimatedCaloriesBurn,
    suggestedIntensity,
    timeOfDay,
    timeOfDayAr,
    const DeepCollectionEquality().hash(_targetMuscleGroups),
    const DeepCollectionEquality().hash(_equipment),
    isRestDay,
    description,
    descriptionAr,
    notes,
    const DeepCollectionEquality().hash(_exercises),
    const DeepCollectionEquality().hash(_warmup),
    const DeepCollectionEquality().hash(_cooldown),
  );

  /// Create a copy of AiDailyWorkout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiDailyWorkoutImplCopyWith<_$AiDailyWorkoutImpl> get copyWith =>
      __$$AiDailyWorkoutImplCopyWithImpl<_$AiDailyWorkoutImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiDailyWorkoutImplToJson(this);
  }
}

abstract class _AiDailyWorkout extends AiDailyWorkout {
  const factory _AiDailyWorkout({
    final String? workoutTemplateId,
    required final String workoutName,
    final String? workoutNameAr,
    required final String category,
    required final int estimatedMinutes,
    required final int estimatedCaloriesBurn,
    final int suggestedIntensity,
    final String? timeOfDay,
    final String? timeOfDayAr,
    final List<String> targetMuscleGroups,
    final List<String> equipment,
    final bool isRestDay,
    final String? description,
    final String? descriptionAr,
    final String? notes,
    final List<AiWorkoutExercise> exercises,
    final List<AiWorkoutExercise> warmup,
    final List<AiWorkoutExercise> cooldown,
  }) = _$AiDailyWorkoutImpl;
  const _AiDailyWorkout._() : super._();

  factory _AiDailyWorkout.fromJson(Map<String, dynamic> json) =
      _$AiDailyWorkoutImpl.fromJson;

  /// Reference to workout template ID (if using a template)
  @override
  String? get workoutTemplateId;

  /// Name of the workout
  @override
  String get workoutName;

  /// Arabic name
  @override
  String? get workoutNameAr;

  /// Category: strength, cardio, hiit, flexibility, recovery
  @override
  String get category;

  /// Estimated duration in minutes
  @override
  int get estimatedMinutes;

  /// Estimated calories burned
  @override
  int get estimatedCaloriesBurn;

  /// Suggested intensity (1-5)
  @override
  int get suggestedIntensity;

  /// Best time of day to do this workout
  @override
  String? get timeOfDay;

  /// Arabic time of day
  @override
  String? get timeOfDayAr;

  /// Target muscle groups
  @override
  List<String> get targetMuscleGroups;

  /// Equipment needed
  @override
  List<String> get equipment;

  /// Whether this is a rest day
  @override
  bool get isRestDay;

  /// Brief description of the workout
  @override
  String? get description;

  /// Arabic description
  @override
  String? get descriptionAr;

  /// Notes from the AI
  @override
  String? get notes;

  /// List of exercises for this workout (NEW)
  @override
  List<AiWorkoutExercise> get exercises;

  /// Warmup exercises (optional)
  @override
  List<AiWorkoutExercise> get warmup;

  /// Cooldown exercises (optional)
  @override
  List<AiWorkoutExercise> get cooldown;

  /// Create a copy of AiDailyWorkout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiDailyWorkoutImplCopyWith<_$AiDailyWorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiWorkoutExercise _$AiWorkoutExerciseFromJson(Map<String, dynamic> json) {
  return _AiWorkoutExercise.fromJson(json);
}

/// @nodoc
mixin _$AiWorkoutExercise {
  /// Exercise ID from the library (if matched)
  String? get exerciseId => throw _privateConstructorUsedError;

  /// Exercise name
  String get name => throw _privateConstructorUsedError;

  /// Arabic name
  String? get nameAr => throw _privateConstructorUsedError;

  /// Target muscle group
  String? get muscleGroup => throw _privateConstructorUsedError;

  /// Number of sets
  int get sets => throw _privateConstructorUsedError;

  /// Target reps (for strength exercises)
  int? get reps => throw _privateConstructorUsedError;

  /// Target duration in seconds (for timed exercises)
  int? get durationSeconds => throw _privateConstructorUsedError;

  /// Rest between sets in seconds
  int get restSeconds => throw _privateConstructorUsedError;

  /// Suggested weight (for strength exercises)
  String? get suggestedWeight => throw _privateConstructorUsedError;

  /// Arabic weight suggestion
  String? get suggestedWeightAr => throw _privateConstructorUsedError;

  /// Brief instruction
  String? get instruction => throw _privateConstructorUsedError;

  /// Arabic instruction
  String? get instructionAr => throw _privateConstructorUsedError;

  /// Order in the workout
  int get order => throw _privateConstructorUsedError;

  /// Is this a superset with the next exercise?
  bool get isSupersetWithNext => throw _privateConstructorUsedError;

  /// Equipment needed
  String? get equipment => throw _privateConstructorUsedError;

  /// Serializes this AiWorkoutExercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiWorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiWorkoutExerciseCopyWith<AiWorkoutExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiWorkoutExerciseCopyWith<$Res> {
  factory $AiWorkoutExerciseCopyWith(
    AiWorkoutExercise value,
    $Res Function(AiWorkoutExercise) then,
  ) = _$AiWorkoutExerciseCopyWithImpl<$Res, AiWorkoutExercise>;
  @useResult
  $Res call({
    String? exerciseId,
    String name,
    String? nameAr,
    String? muscleGroup,
    int sets,
    int? reps,
    int? durationSeconds,
    int restSeconds,
    String? suggestedWeight,
    String? suggestedWeightAr,
    String? instruction,
    String? instructionAr,
    int order,
    bool isSupersetWithNext,
    String? equipment,
  });
}

/// @nodoc
class _$AiWorkoutExerciseCopyWithImpl<$Res, $Val extends AiWorkoutExercise>
    implements $AiWorkoutExerciseCopyWith<$Res> {
  _$AiWorkoutExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiWorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = freezed,
    Object? name = null,
    Object? nameAr = freezed,
    Object? muscleGroup = freezed,
    Object? sets = null,
    Object? reps = freezed,
    Object? durationSeconds = freezed,
    Object? restSeconds = null,
    Object? suggestedWeight = freezed,
    Object? suggestedWeightAr = freezed,
    Object? instruction = freezed,
    Object? instructionAr = freezed,
    Object? order = null,
    Object? isSupersetWithNext = null,
    Object? equipment = freezed,
  }) {
    return _then(
      _value.copyWith(
            exerciseId: freezed == exerciseId
                ? _value.exerciseId
                : exerciseId // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            nameAr: freezed == nameAr
                ? _value.nameAr
                : nameAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            muscleGroup: freezed == muscleGroup
                ? _value.muscleGroup
                : muscleGroup // ignore: cast_nullable_to_non_nullable
                      as String?,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as int,
            reps: freezed == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as int?,
            durationSeconds: freezed == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            restSeconds: null == restSeconds
                ? _value.restSeconds
                : restSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            suggestedWeight: freezed == suggestedWeight
                ? _value.suggestedWeight
                : suggestedWeight // ignore: cast_nullable_to_non_nullable
                      as String?,
            suggestedWeightAr: freezed == suggestedWeightAr
                ? _value.suggestedWeightAr
                : suggestedWeightAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            instruction: freezed == instruction
                ? _value.instruction
                : instruction // ignore: cast_nullable_to_non_nullable
                      as String?,
            instructionAr: freezed == instructionAr
                ? _value.instructionAr
                : instructionAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as int,
            isSupersetWithNext: null == isSupersetWithNext
                ? _value.isSupersetWithNext
                : isSupersetWithNext // ignore: cast_nullable_to_non_nullable
                      as bool,
            equipment: freezed == equipment
                ? _value.equipment
                : equipment // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiWorkoutExerciseImplCopyWith<$Res>
    implements $AiWorkoutExerciseCopyWith<$Res> {
  factory _$$AiWorkoutExerciseImplCopyWith(
    _$AiWorkoutExerciseImpl value,
    $Res Function(_$AiWorkoutExerciseImpl) then,
  ) = __$$AiWorkoutExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? exerciseId,
    String name,
    String? nameAr,
    String? muscleGroup,
    int sets,
    int? reps,
    int? durationSeconds,
    int restSeconds,
    String? suggestedWeight,
    String? suggestedWeightAr,
    String? instruction,
    String? instructionAr,
    int order,
    bool isSupersetWithNext,
    String? equipment,
  });
}

/// @nodoc
class __$$AiWorkoutExerciseImplCopyWithImpl<$Res>
    extends _$AiWorkoutExerciseCopyWithImpl<$Res, _$AiWorkoutExerciseImpl>
    implements _$$AiWorkoutExerciseImplCopyWith<$Res> {
  __$$AiWorkoutExerciseImplCopyWithImpl(
    _$AiWorkoutExerciseImpl _value,
    $Res Function(_$AiWorkoutExerciseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiWorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = freezed,
    Object? name = null,
    Object? nameAr = freezed,
    Object? muscleGroup = freezed,
    Object? sets = null,
    Object? reps = freezed,
    Object? durationSeconds = freezed,
    Object? restSeconds = null,
    Object? suggestedWeight = freezed,
    Object? suggestedWeightAr = freezed,
    Object? instruction = freezed,
    Object? instructionAr = freezed,
    Object? order = null,
    Object? isSupersetWithNext = null,
    Object? equipment = freezed,
  }) {
    return _then(
      _$AiWorkoutExerciseImpl(
        exerciseId: freezed == exerciseId
            ? _value.exerciseId
            : exerciseId // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAr: freezed == nameAr
            ? _value.nameAr
            : nameAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        muscleGroup: freezed == muscleGroup
            ? _value.muscleGroup
            : muscleGroup // ignore: cast_nullable_to_non_nullable
                  as String?,
        sets: null == sets
            ? _value.sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: freezed == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int?,
        durationSeconds: freezed == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        restSeconds: null == restSeconds
            ? _value.restSeconds
            : restSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        suggestedWeight: freezed == suggestedWeight
            ? _value.suggestedWeight
            : suggestedWeight // ignore: cast_nullable_to_non_nullable
                  as String?,
        suggestedWeightAr: freezed == suggestedWeightAr
            ? _value.suggestedWeightAr
            : suggestedWeightAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        instruction: freezed == instruction
            ? _value.instruction
            : instruction // ignore: cast_nullable_to_non_nullable
                  as String?,
        instructionAr: freezed == instructionAr
            ? _value.instructionAr
            : instructionAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as int,
        isSupersetWithNext: null == isSupersetWithNext
            ? _value.isSupersetWithNext
            : isSupersetWithNext // ignore: cast_nullable_to_non_nullable
                  as bool,
        equipment: freezed == equipment
            ? _value.equipment
            : equipment // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiWorkoutExerciseImpl extends _AiWorkoutExercise {
  const _$AiWorkoutExerciseImpl({
    this.exerciseId,
    required this.name,
    this.nameAr,
    this.muscleGroup,
    required this.sets,
    this.reps,
    this.durationSeconds,
    this.restSeconds = 60,
    this.suggestedWeight,
    this.suggestedWeightAr,
    this.instruction,
    this.instructionAr,
    this.order = 0,
    this.isSupersetWithNext = false,
    this.equipment,
  }) : super._();

  factory _$AiWorkoutExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiWorkoutExerciseImplFromJson(json);

  /// Exercise ID from the library (if matched)
  @override
  final String? exerciseId;

  /// Exercise name
  @override
  final String name;

  /// Arabic name
  @override
  final String? nameAr;

  /// Target muscle group
  @override
  final String? muscleGroup;

  /// Number of sets
  @override
  final int sets;

  /// Target reps (for strength exercises)
  @override
  final int? reps;

  /// Target duration in seconds (for timed exercises)
  @override
  final int? durationSeconds;

  /// Rest between sets in seconds
  @override
  @JsonKey()
  final int restSeconds;

  /// Suggested weight (for strength exercises)
  @override
  final String? suggestedWeight;

  /// Arabic weight suggestion
  @override
  final String? suggestedWeightAr;

  /// Brief instruction
  @override
  final String? instruction;

  /// Arabic instruction
  @override
  final String? instructionAr;

  /// Order in the workout
  @override
  @JsonKey()
  final int order;

  /// Is this a superset with the next exercise?
  @override
  @JsonKey()
  final bool isSupersetWithNext;

  /// Equipment needed
  @override
  final String? equipment;

  @override
  String toString() {
    return 'AiWorkoutExercise(exerciseId: $exerciseId, name: $name, nameAr: $nameAr, muscleGroup: $muscleGroup, sets: $sets, reps: $reps, durationSeconds: $durationSeconds, restSeconds: $restSeconds, suggestedWeight: $suggestedWeight, suggestedWeightAr: $suggestedWeightAr, instruction: $instruction, instructionAr: $instructionAr, order: $order, isSupersetWithNext: $isSupersetWithNext, equipment: $equipment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiWorkoutExerciseImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.muscleGroup, muscleGroup) ||
                other.muscleGroup == muscleGroup) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds) &&
            (identical(other.suggestedWeight, suggestedWeight) ||
                other.suggestedWeight == suggestedWeight) &&
            (identical(other.suggestedWeightAr, suggestedWeightAr) ||
                other.suggestedWeightAr == suggestedWeightAr) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.instructionAr, instructionAr) ||
                other.instructionAr == instructionAr) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isSupersetWithNext, isSupersetWithNext) ||
                other.isSupersetWithNext == isSupersetWithNext) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    exerciseId,
    name,
    nameAr,
    muscleGroup,
    sets,
    reps,
    durationSeconds,
    restSeconds,
    suggestedWeight,
    suggestedWeightAr,
    instruction,
    instructionAr,
    order,
    isSupersetWithNext,
    equipment,
  );

  /// Create a copy of AiWorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiWorkoutExerciseImplCopyWith<_$AiWorkoutExerciseImpl> get copyWith =>
      __$$AiWorkoutExerciseImplCopyWithImpl<_$AiWorkoutExerciseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiWorkoutExerciseImplToJson(this);
  }
}

abstract class _AiWorkoutExercise extends AiWorkoutExercise {
  const factory _AiWorkoutExercise({
    final String? exerciseId,
    required final String name,
    final String? nameAr,
    final String? muscleGroup,
    required final int sets,
    final int? reps,
    final int? durationSeconds,
    final int restSeconds,
    final String? suggestedWeight,
    final String? suggestedWeightAr,
    final String? instruction,
    final String? instructionAr,
    final int order,
    final bool isSupersetWithNext,
    final String? equipment,
  }) = _$AiWorkoutExerciseImpl;
  const _AiWorkoutExercise._() : super._();

  factory _AiWorkoutExercise.fromJson(Map<String, dynamic> json) =
      _$AiWorkoutExerciseImpl.fromJson;

  /// Exercise ID from the library (if matched)
  @override
  String? get exerciseId;

  /// Exercise name
  @override
  String get name;

  /// Arabic name
  @override
  String? get nameAr;

  /// Target muscle group
  @override
  String? get muscleGroup;

  /// Number of sets
  @override
  int get sets;

  /// Target reps (for strength exercises)
  @override
  int? get reps;

  /// Target duration in seconds (for timed exercises)
  @override
  int? get durationSeconds;

  /// Rest between sets in seconds
  @override
  int get restSeconds;

  /// Suggested weight (for strength exercises)
  @override
  String? get suggestedWeight;

  /// Arabic weight suggestion
  @override
  String? get suggestedWeightAr;

  /// Brief instruction
  @override
  String? get instruction;

  /// Arabic instruction
  @override
  String? get instructionAr;

  /// Order in the workout
  @override
  int get order;

  /// Is this a superset with the next exercise?
  @override
  bool get isSupersetWithNext;

  /// Equipment needed
  @override
  String? get equipment;

  /// Create a copy of AiWorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiWorkoutExerciseImplCopyWith<_$AiWorkoutExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyWorkoutPlanContext _$WeeklyWorkoutPlanContextFromJson(
  Map<String, dynamic> json,
) {
  return _WeeklyWorkoutPlanContext.fromJson(json);
}

/// @nodoc
mixin _$WeeklyWorkoutPlanContext {
  /// Week start date
  DateTime get weekStartDate => throw _privateConstructorUsedError;

  /// Recovery score
  int? get recoveryScore => throw _privateConstructorUsedError;

  /// Strain score
  double? get strainScore => throw _privateConstructorUsedError;

  /// Number of workout days desired (3-6)
  int get targetWorkoutDays => throw _privateConstructorUsedError;

  /// Fitness goals
  List<String> get fitnessGoals => throw _privateConstructorUsedError;

  /// Available equipment
  List<String> get availableEquipment => throw _privateConstructorUsedError;

  /// Constraints (injuries, time limits, etc.)
  List<String> get constraints => throw _privateConstructorUsedError;

  /// Preferred workout types
  List<String> get preferredWorkoutTypes => throw _privateConstructorUsedError;

  /// Current meal plan (for coordination)
  MealPlanSummary? get mealPlan => throw _privateConstructorUsedError;

  /// Language preference: 'ar' or 'en'
  String get language => throw _privateConstructorUsedError;

  /// Serializes this WeeklyWorkoutPlanContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyWorkoutPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyWorkoutPlanContextCopyWith<WeeklyWorkoutPlanContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyWorkoutPlanContextCopyWith<$Res> {
  factory $WeeklyWorkoutPlanContextCopyWith(
    WeeklyWorkoutPlanContext value,
    $Res Function(WeeklyWorkoutPlanContext) then,
  ) = _$WeeklyWorkoutPlanContextCopyWithImpl<$Res, WeeklyWorkoutPlanContext>;
  @useResult
  $Res call({
    DateTime weekStartDate,
    int? recoveryScore,
    double? strainScore,
    int targetWorkoutDays,
    List<String> fitnessGoals,
    List<String> availableEquipment,
    List<String> constraints,
    List<String> preferredWorkoutTypes,
    MealPlanSummary? mealPlan,
    String language,
  });

  $MealPlanSummaryCopyWith<$Res>? get mealPlan;
}

/// @nodoc
class _$WeeklyWorkoutPlanContextCopyWithImpl<
  $Res,
  $Val extends WeeklyWorkoutPlanContext
>
    implements $WeeklyWorkoutPlanContextCopyWith<$Res> {
  _$WeeklyWorkoutPlanContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyWorkoutPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStartDate = null,
    Object? recoveryScore = freezed,
    Object? strainScore = freezed,
    Object? targetWorkoutDays = null,
    Object? fitnessGoals = null,
    Object? availableEquipment = null,
    Object? constraints = null,
    Object? preferredWorkoutTypes = null,
    Object? mealPlan = freezed,
    Object? language = null,
  }) {
    return _then(
      _value.copyWith(
            weekStartDate: null == weekStartDate
                ? _value.weekStartDate
                : weekStartDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            recoveryScore: freezed == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            strainScore: freezed == strainScore
                ? _value.strainScore
                : strainScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            targetWorkoutDays: null == targetWorkoutDays
                ? _value.targetWorkoutDays
                : targetWorkoutDays // ignore: cast_nullable_to_non_nullable
                      as int,
            fitnessGoals: null == fitnessGoals
                ? _value.fitnessGoals
                : fitnessGoals // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            availableEquipment: null == availableEquipment
                ? _value.availableEquipment
                : availableEquipment // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            constraints: null == constraints
                ? _value.constraints
                : constraints // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            preferredWorkoutTypes: null == preferredWorkoutTypes
                ? _value.preferredWorkoutTypes
                : preferredWorkoutTypes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            mealPlan: freezed == mealPlan
                ? _value.mealPlan
                : mealPlan // ignore: cast_nullable_to_non_nullable
                      as MealPlanSummary?,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of WeeklyWorkoutPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealPlanSummaryCopyWith<$Res>? get mealPlan {
    if (_value.mealPlan == null) {
      return null;
    }

    return $MealPlanSummaryCopyWith<$Res>(_value.mealPlan!, (value) {
      return _then(_value.copyWith(mealPlan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeeklyWorkoutPlanContextImplCopyWith<$Res>
    implements $WeeklyWorkoutPlanContextCopyWith<$Res> {
  factory _$$WeeklyWorkoutPlanContextImplCopyWith(
    _$WeeklyWorkoutPlanContextImpl value,
    $Res Function(_$WeeklyWorkoutPlanContextImpl) then,
  ) = __$$WeeklyWorkoutPlanContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime weekStartDate,
    int? recoveryScore,
    double? strainScore,
    int targetWorkoutDays,
    List<String> fitnessGoals,
    List<String> availableEquipment,
    List<String> constraints,
    List<String> preferredWorkoutTypes,
    MealPlanSummary? mealPlan,
    String language,
  });

  @override
  $MealPlanSummaryCopyWith<$Res>? get mealPlan;
}

/// @nodoc
class __$$WeeklyWorkoutPlanContextImplCopyWithImpl<$Res>
    extends
        _$WeeklyWorkoutPlanContextCopyWithImpl<
          $Res,
          _$WeeklyWorkoutPlanContextImpl
        >
    implements _$$WeeklyWorkoutPlanContextImplCopyWith<$Res> {
  __$$WeeklyWorkoutPlanContextImplCopyWithImpl(
    _$WeeklyWorkoutPlanContextImpl _value,
    $Res Function(_$WeeklyWorkoutPlanContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyWorkoutPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStartDate = null,
    Object? recoveryScore = freezed,
    Object? strainScore = freezed,
    Object? targetWorkoutDays = null,
    Object? fitnessGoals = null,
    Object? availableEquipment = null,
    Object? constraints = null,
    Object? preferredWorkoutTypes = null,
    Object? mealPlan = freezed,
    Object? language = null,
  }) {
    return _then(
      _$WeeklyWorkoutPlanContextImpl(
        weekStartDate: null == weekStartDate
            ? _value.weekStartDate
            : weekStartDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        recoveryScore: freezed == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        strainScore: freezed == strainScore
            ? _value.strainScore
            : strainScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        targetWorkoutDays: null == targetWorkoutDays
            ? _value.targetWorkoutDays
            : targetWorkoutDays // ignore: cast_nullable_to_non_nullable
                  as int,
        fitnessGoals: null == fitnessGoals
            ? _value._fitnessGoals
            : fitnessGoals // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        availableEquipment: null == availableEquipment
            ? _value._availableEquipment
            : availableEquipment // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        constraints: null == constraints
            ? _value._constraints
            : constraints // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        preferredWorkoutTypes: null == preferredWorkoutTypes
            ? _value._preferredWorkoutTypes
            : preferredWorkoutTypes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        mealPlan: freezed == mealPlan
            ? _value.mealPlan
            : mealPlan // ignore: cast_nullable_to_non_nullable
                  as MealPlanSummary?,
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
class _$WeeklyWorkoutPlanContextImpl implements _WeeklyWorkoutPlanContext {
  const _$WeeklyWorkoutPlanContextImpl({
    required this.weekStartDate,
    this.recoveryScore,
    this.strainScore,
    this.targetWorkoutDays = 4,
    final List<String> fitnessGoals = const ['strength', 'fitness'],
    final List<String> availableEquipment = const ['full_gym'],
    final List<String> constraints = const [],
    final List<String> preferredWorkoutTypes = const [],
    this.mealPlan,
    this.language = 'ar',
  }) : _fitnessGoals = fitnessGoals,
       _availableEquipment = availableEquipment,
       _constraints = constraints,
       _preferredWorkoutTypes = preferredWorkoutTypes;

  factory _$WeeklyWorkoutPlanContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyWorkoutPlanContextImplFromJson(json);

  /// Week start date
  @override
  final DateTime weekStartDate;

  /// Recovery score
  @override
  final int? recoveryScore;

  /// Strain score
  @override
  final double? strainScore;

  /// Number of workout days desired (3-6)
  @override
  @JsonKey()
  final int targetWorkoutDays;

  /// Fitness goals
  final List<String> _fitnessGoals;

  /// Fitness goals
  @override
  @JsonKey()
  List<String> get fitnessGoals {
    if (_fitnessGoals is EqualUnmodifiableListView) return _fitnessGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fitnessGoals);
  }

  /// Available equipment
  final List<String> _availableEquipment;

  /// Available equipment
  @override
  @JsonKey()
  List<String> get availableEquipment {
    if (_availableEquipment is EqualUnmodifiableListView)
      return _availableEquipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableEquipment);
  }

  /// Constraints (injuries, time limits, etc.)
  final List<String> _constraints;

  /// Constraints (injuries, time limits, etc.)
  @override
  @JsonKey()
  List<String> get constraints {
    if (_constraints is EqualUnmodifiableListView) return _constraints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_constraints);
  }

  /// Preferred workout types
  final List<String> _preferredWorkoutTypes;

  /// Preferred workout types
  @override
  @JsonKey()
  List<String> get preferredWorkoutTypes {
    if (_preferredWorkoutTypes is EqualUnmodifiableListView)
      return _preferredWorkoutTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredWorkoutTypes);
  }

  /// Current meal plan (for coordination)
  @override
  final MealPlanSummary? mealPlan;

  /// Language preference: 'ar' or 'en'
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'WeeklyWorkoutPlanContext(weekStartDate: $weekStartDate, recoveryScore: $recoveryScore, strainScore: $strainScore, targetWorkoutDays: $targetWorkoutDays, fitnessGoals: $fitnessGoals, availableEquipment: $availableEquipment, constraints: $constraints, preferredWorkoutTypes: $preferredWorkoutTypes, mealPlan: $mealPlan, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyWorkoutPlanContextImpl &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.strainScore, strainScore) ||
                other.strainScore == strainScore) &&
            (identical(other.targetWorkoutDays, targetWorkoutDays) ||
                other.targetWorkoutDays == targetWorkoutDays) &&
            const DeepCollectionEquality().equals(
              other._fitnessGoals,
              _fitnessGoals,
            ) &&
            const DeepCollectionEquality().equals(
              other._availableEquipment,
              _availableEquipment,
            ) &&
            const DeepCollectionEquality().equals(
              other._constraints,
              _constraints,
            ) &&
            const DeepCollectionEquality().equals(
              other._preferredWorkoutTypes,
              _preferredWorkoutTypes,
            ) &&
            (identical(other.mealPlan, mealPlan) ||
                other.mealPlan == mealPlan) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    weekStartDate,
    recoveryScore,
    strainScore,
    targetWorkoutDays,
    const DeepCollectionEquality().hash(_fitnessGoals),
    const DeepCollectionEquality().hash(_availableEquipment),
    const DeepCollectionEquality().hash(_constraints),
    const DeepCollectionEquality().hash(_preferredWorkoutTypes),
    mealPlan,
    language,
  );

  /// Create a copy of WeeklyWorkoutPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyWorkoutPlanContextImplCopyWith<_$WeeklyWorkoutPlanContextImpl>
  get copyWith =>
      __$$WeeklyWorkoutPlanContextImplCopyWithImpl<
        _$WeeklyWorkoutPlanContextImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyWorkoutPlanContextImplToJson(this);
  }
}

abstract class _WeeklyWorkoutPlanContext implements WeeklyWorkoutPlanContext {
  const factory _WeeklyWorkoutPlanContext({
    required final DateTime weekStartDate,
    final int? recoveryScore,
    final double? strainScore,
    final int targetWorkoutDays,
    final List<String> fitnessGoals,
    final List<String> availableEquipment,
    final List<String> constraints,
    final List<String> preferredWorkoutTypes,
    final MealPlanSummary? mealPlan,
    final String language,
  }) = _$WeeklyWorkoutPlanContextImpl;

  factory _WeeklyWorkoutPlanContext.fromJson(Map<String, dynamic> json) =
      _$WeeklyWorkoutPlanContextImpl.fromJson;

  /// Week start date
  @override
  DateTime get weekStartDate;

  /// Recovery score
  @override
  int? get recoveryScore;

  /// Strain score
  @override
  double? get strainScore;

  /// Number of workout days desired (3-6)
  @override
  int get targetWorkoutDays;

  /// Fitness goals
  @override
  List<String> get fitnessGoals;

  /// Available equipment
  @override
  List<String> get availableEquipment;

  /// Constraints (injuries, time limits, etc.)
  @override
  List<String> get constraints;

  /// Preferred workout types
  @override
  List<String> get preferredWorkoutTypes;

  /// Current meal plan (for coordination)
  @override
  MealPlanSummary? get mealPlan;

  /// Language preference: 'ar' or 'en'
  @override
  String get language;

  /// Create a copy of WeeklyWorkoutPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyWorkoutPlanContextImplCopyWith<_$WeeklyWorkoutPlanContextImpl>
  get copyWith => throw _privateConstructorUsedError;
}
