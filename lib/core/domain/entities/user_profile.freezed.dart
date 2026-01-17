// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError; // in cm
  int? get age => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  UserGoals get goals => throw _privateConstructorUsedError;
  AiPreferences get aiPreferences => throw _privateConstructorUsedError;
  bool get hasCompletedOnboarding => throw _privateConstructorUsedError;
  bool get hasGrantedHealthKitPermission => throw _privateConstructorUsedError;
  bool get hasGrantedAiConsent => throw _privateConstructorUsedError;
  bool get hasGrantedPhotoConsent => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) then,
  ) = _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({
    String id,
    DateTime createdAt,
    DateTime updatedAt,
    double? height,
    int? age,
    Gender? gender,
    String timezone,
    UserGoals goals,
    AiPreferences aiPreferences,
    bool hasCompletedOnboarding,
    bool hasGrantedHealthKitPermission,
    bool hasGrantedAiConsent,
    bool hasGrantedPhotoConsent,
  });

  $UserGoalsCopyWith<$Res> get goals;
  $AiPreferencesCopyWith<$Res> get aiPreferences;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? height = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? timezone = null,
    Object? goals = null,
    Object? aiPreferences = null,
    Object? hasCompletedOnboarding = null,
    Object? hasGrantedHealthKitPermission = null,
    Object? hasGrantedAiConsent = null,
    Object? hasGrantedPhotoConsent = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as Gender?,
            timezone: null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                      as String,
            goals: null == goals
                ? _value.goals
                : goals // ignore: cast_nullable_to_non_nullable
                      as UserGoals,
            aiPreferences: null == aiPreferences
                ? _value.aiPreferences
                : aiPreferences // ignore: cast_nullable_to_non_nullable
                      as AiPreferences,
            hasCompletedOnboarding: null == hasCompletedOnboarding
                ? _value.hasCompletedOnboarding
                : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasGrantedHealthKitPermission: null == hasGrantedHealthKitPermission
                ? _value.hasGrantedHealthKitPermission
                : hasGrantedHealthKitPermission // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasGrantedAiConsent: null == hasGrantedAiConsent
                ? _value.hasGrantedAiConsent
                : hasGrantedAiConsent // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasGrantedPhotoConsent: null == hasGrantedPhotoConsent
                ? _value.hasGrantedPhotoConsent
                : hasGrantedPhotoConsent // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserGoalsCopyWith<$Res> get goals {
    return $UserGoalsCopyWith<$Res>(_value.goals, (value) {
      return _then(_value.copyWith(goals: value) as $Val);
    });
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiPreferencesCopyWith<$Res> get aiPreferences {
    return $AiPreferencesCopyWith<$Res>(_value.aiPreferences, (value) {
      return _then(_value.copyWith(aiPreferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
    _$UserProfileImpl value,
    $Res Function(_$UserProfileImpl) then,
  ) = __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime createdAt,
    DateTime updatedAt,
    double? height,
    int? age,
    Gender? gender,
    String timezone,
    UserGoals goals,
    AiPreferences aiPreferences,
    bool hasCompletedOnboarding,
    bool hasGrantedHealthKitPermission,
    bool hasGrantedAiConsent,
    bool hasGrantedPhotoConsent,
  });

  @override
  $UserGoalsCopyWith<$Res> get goals;
  @override
  $AiPreferencesCopyWith<$Res> get aiPreferences;
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
    _$UserProfileImpl _value,
    $Res Function(_$UserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? height = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? timezone = null,
    Object? goals = null,
    Object? aiPreferences = null,
    Object? hasCompletedOnboarding = null,
    Object? hasGrantedHealthKitPermission = null,
    Object? hasGrantedAiConsent = null,
    Object? hasGrantedPhotoConsent = null,
  }) {
    return _then(
      _$UserProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as Gender?,
        timezone: null == timezone
            ? _value.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        goals: null == goals
            ? _value.goals
            : goals // ignore: cast_nullable_to_non_nullable
                  as UserGoals,
        aiPreferences: null == aiPreferences
            ? _value.aiPreferences
            : aiPreferences // ignore: cast_nullable_to_non_nullable
                  as AiPreferences,
        hasCompletedOnboarding: null == hasCompletedOnboarding
            ? _value.hasCompletedOnboarding
            : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasGrantedHealthKitPermission: null == hasGrantedHealthKitPermission
            ? _value.hasGrantedHealthKitPermission
            : hasGrantedHealthKitPermission // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasGrantedAiConsent: null == hasGrantedAiConsent
            ? _value.hasGrantedAiConsent
            : hasGrantedAiConsent // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasGrantedPhotoConsent: null == hasGrantedPhotoConsent
            ? _value.hasGrantedPhotoConsent
            : hasGrantedPhotoConsent // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.height,
    this.age,
    this.gender,
    required this.timezone,
    required this.goals,
    required this.aiPreferences,
    this.hasCompletedOnboarding = false,
    this.hasGrantedHealthKitPermission = false,
    this.hasGrantedAiConsent = false,
    this.hasGrantedPhotoConsent = false,
  });

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final double? height;
  // in cm
  @override
  final int? age;
  @override
  final Gender? gender;
  @override
  final String timezone;
  @override
  final UserGoals goals;
  @override
  final AiPreferences aiPreferences;
  @override
  @JsonKey()
  final bool hasCompletedOnboarding;
  @override
  @JsonKey()
  final bool hasGrantedHealthKitPermission;
  @override
  @JsonKey()
  final bool hasGrantedAiConsent;
  @override
  @JsonKey()
  final bool hasGrantedPhotoConsent;

  @override
  String toString() {
    return 'UserProfile(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, height: $height, age: $age, gender: $gender, timezone: $timezone, goals: $goals, aiPreferences: $aiPreferences, hasCompletedOnboarding: $hasCompletedOnboarding, hasGrantedHealthKitPermission: $hasGrantedHealthKitPermission, hasGrantedAiConsent: $hasGrantedAiConsent, hasGrantedPhotoConsent: $hasGrantedPhotoConsent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.goals, goals) || other.goals == goals) &&
            (identical(other.aiPreferences, aiPreferences) ||
                other.aiPreferences == aiPreferences) &&
            (identical(other.hasCompletedOnboarding, hasCompletedOnboarding) ||
                other.hasCompletedOnboarding == hasCompletedOnboarding) &&
            (identical(
                  other.hasGrantedHealthKitPermission,
                  hasGrantedHealthKitPermission,
                ) ||
                other.hasGrantedHealthKitPermission ==
                    hasGrantedHealthKitPermission) &&
            (identical(other.hasGrantedAiConsent, hasGrantedAiConsent) ||
                other.hasGrantedAiConsent == hasGrantedAiConsent) &&
            (identical(other.hasGrantedPhotoConsent, hasGrantedPhotoConsent) ||
                other.hasGrantedPhotoConsent == hasGrantedPhotoConsent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    height,
    age,
    gender,
    timezone,
    goals,
    aiPreferences,
    hasCompletedOnboarding,
    hasGrantedHealthKitPermission,
    hasGrantedAiConsent,
    hasGrantedPhotoConsent,
  );

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile({
    required final String id,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final double? height,
    final int? age,
    final Gender? gender,
    required final String timezone,
    required final UserGoals goals,
    required final AiPreferences aiPreferences,
    final bool hasCompletedOnboarding,
    final bool hasGrantedHealthKitPermission,
    final bool hasGrantedAiConsent,
    final bool hasGrantedPhotoConsent,
  }) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  double? get height; // in cm
  @override
  int? get age;
  @override
  Gender? get gender;
  @override
  String get timezone;
  @override
  UserGoals get goals;
  @override
  AiPreferences get aiPreferences;
  @override
  bool get hasCompletedOnboarding;
  @override
  bool get hasGrantedHealthKitPermission;
  @override
  bool get hasGrantedAiConsent;
  @override
  bool get hasGrantedPhotoConsent;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserGoals _$UserGoalsFromJson(Map<String, dynamic> json) {
  return _UserGoals.fromJson(json);
}

/// @nodoc
mixin _$UserGoals {
  double? get targetWeight => throw _privateConstructorUsedError; // in kg
  double? get targetWaist => throw _privateConstructorUsedError; // in cm
  int? get targetSteps => throw _privateConstructorUsedError;
  int? get targetCalories => throw _privateConstructorUsedError;
  int? get targetProtein => throw _privateConstructorUsedError; // in grams
  double? get targetSleepHours => throw _privateConstructorUsedError;

  /// Serializes this UserGoals to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserGoals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserGoalsCopyWith<UserGoals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGoalsCopyWith<$Res> {
  factory $UserGoalsCopyWith(UserGoals value, $Res Function(UserGoals) then) =
      _$UserGoalsCopyWithImpl<$Res, UserGoals>;
  @useResult
  $Res call({
    double? targetWeight,
    double? targetWaist,
    int? targetSteps,
    int? targetCalories,
    int? targetProtein,
    double? targetSleepHours,
  });
}

/// @nodoc
class _$UserGoalsCopyWithImpl<$Res, $Val extends UserGoals>
    implements $UserGoalsCopyWith<$Res> {
  _$UserGoalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserGoals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetWeight = freezed,
    Object? targetWaist = freezed,
    Object? targetSteps = freezed,
    Object? targetCalories = freezed,
    Object? targetProtein = freezed,
    Object? targetSleepHours = freezed,
  }) {
    return _then(
      _value.copyWith(
            targetWeight: freezed == targetWeight
                ? _value.targetWeight
                : targetWeight // ignore: cast_nullable_to_non_nullable
                      as double?,
            targetWaist: freezed == targetWaist
                ? _value.targetWaist
                : targetWaist // ignore: cast_nullable_to_non_nullable
                      as double?,
            targetSteps: freezed == targetSteps
                ? _value.targetSteps
                : targetSteps // ignore: cast_nullable_to_non_nullable
                      as int?,
            targetCalories: freezed == targetCalories
                ? _value.targetCalories
                : targetCalories // ignore: cast_nullable_to_non_nullable
                      as int?,
            targetProtein: freezed == targetProtein
                ? _value.targetProtein
                : targetProtein // ignore: cast_nullable_to_non_nullable
                      as int?,
            targetSleepHours: freezed == targetSleepHours
                ? _value.targetSleepHours
                : targetSleepHours // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserGoalsImplCopyWith<$Res>
    implements $UserGoalsCopyWith<$Res> {
  factory _$$UserGoalsImplCopyWith(
    _$UserGoalsImpl value,
    $Res Function(_$UserGoalsImpl) then,
  ) = __$$UserGoalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? targetWeight,
    double? targetWaist,
    int? targetSteps,
    int? targetCalories,
    int? targetProtein,
    double? targetSleepHours,
  });
}

/// @nodoc
class __$$UserGoalsImplCopyWithImpl<$Res>
    extends _$UserGoalsCopyWithImpl<$Res, _$UserGoalsImpl>
    implements _$$UserGoalsImplCopyWith<$Res> {
  __$$UserGoalsImplCopyWithImpl(
    _$UserGoalsImpl _value,
    $Res Function(_$UserGoalsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserGoals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetWeight = freezed,
    Object? targetWaist = freezed,
    Object? targetSteps = freezed,
    Object? targetCalories = freezed,
    Object? targetProtein = freezed,
    Object? targetSleepHours = freezed,
  }) {
    return _then(
      _$UserGoalsImpl(
        targetWeight: freezed == targetWeight
            ? _value.targetWeight
            : targetWeight // ignore: cast_nullable_to_non_nullable
                  as double?,
        targetWaist: freezed == targetWaist
            ? _value.targetWaist
            : targetWaist // ignore: cast_nullable_to_non_nullable
                  as double?,
        targetSteps: freezed == targetSteps
            ? _value.targetSteps
            : targetSteps // ignore: cast_nullable_to_non_nullable
                  as int?,
        targetCalories: freezed == targetCalories
            ? _value.targetCalories
            : targetCalories // ignore: cast_nullable_to_non_nullable
                  as int?,
        targetProtein: freezed == targetProtein
            ? _value.targetProtein
            : targetProtein // ignore: cast_nullable_to_non_nullable
                  as int?,
        targetSleepHours: freezed == targetSleepHours
            ? _value.targetSleepHours
            : targetSleepHours // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserGoalsImpl implements _UserGoals {
  const _$UserGoalsImpl({
    this.targetWeight,
    this.targetWaist,
    this.targetSteps,
    this.targetCalories,
    this.targetProtein,
    this.targetSleepHours,
  });

  factory _$UserGoalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGoalsImplFromJson(json);

  @override
  final double? targetWeight;
  // in kg
  @override
  final double? targetWaist;
  // in cm
  @override
  final int? targetSteps;
  @override
  final int? targetCalories;
  @override
  final int? targetProtein;
  // in grams
  @override
  final double? targetSleepHours;

  @override
  String toString() {
    return 'UserGoals(targetWeight: $targetWeight, targetWaist: $targetWaist, targetSteps: $targetSteps, targetCalories: $targetCalories, targetProtein: $targetProtein, targetSleepHours: $targetSleepHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGoalsImpl &&
            (identical(other.targetWeight, targetWeight) ||
                other.targetWeight == targetWeight) &&
            (identical(other.targetWaist, targetWaist) ||
                other.targetWaist == targetWaist) &&
            (identical(other.targetSteps, targetSteps) ||
                other.targetSteps == targetSteps) &&
            (identical(other.targetCalories, targetCalories) ||
                other.targetCalories == targetCalories) &&
            (identical(other.targetProtein, targetProtein) ||
                other.targetProtein == targetProtein) &&
            (identical(other.targetSleepHours, targetSleepHours) ||
                other.targetSleepHours == targetSleepHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    targetWeight,
    targetWaist,
    targetSteps,
    targetCalories,
    targetProtein,
    targetSleepHours,
  );

  /// Create a copy of UserGoals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGoalsImplCopyWith<_$UserGoalsImpl> get copyWith =>
      __$$UserGoalsImplCopyWithImpl<_$UserGoalsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGoalsImplToJson(this);
  }
}

abstract class _UserGoals implements UserGoals {
  const factory _UserGoals({
    final double? targetWeight,
    final double? targetWaist,
    final int? targetSteps,
    final int? targetCalories,
    final int? targetProtein,
    final double? targetSleepHours,
  }) = _$UserGoalsImpl;

  factory _UserGoals.fromJson(Map<String, dynamic> json) =
      _$UserGoalsImpl.fromJson;

  @override
  double? get targetWeight; // in kg
  @override
  double? get targetWaist; // in cm
  @override
  int? get targetSteps;
  @override
  int? get targetCalories;
  @override
  int? get targetProtein; // in grams
  @override
  double? get targetSleepHours;

  /// Create a copy of UserGoals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserGoalsImplCopyWith<_$UserGoalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiPreferences _$AiPreferencesFromJson(Map<String, dynamic> json) {
  return _AiPreferences.fromJson(json);
}

/// @nodoc
mixin _$AiPreferences {
  CoachingTone get coachingTone => throw _privateConstructorUsedError;
  AppLanguage get language => throw _privateConstructorUsedError;
  bool get enableDailyBrief => throw _privateConstructorUsedError;
  bool get enableFoodRecognition => throw _privateConstructorUsedError;
  bool get enableWorkoutRecommendations => throw _privateConstructorUsedError;

  /// Serializes this AiPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiPreferencesCopyWith<AiPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiPreferencesCopyWith<$Res> {
  factory $AiPreferencesCopyWith(
    AiPreferences value,
    $Res Function(AiPreferences) then,
  ) = _$AiPreferencesCopyWithImpl<$Res, AiPreferences>;
  @useResult
  $Res call({
    CoachingTone coachingTone,
    AppLanguage language,
    bool enableDailyBrief,
    bool enableFoodRecognition,
    bool enableWorkoutRecommendations,
  });
}

/// @nodoc
class _$AiPreferencesCopyWithImpl<$Res, $Val extends AiPreferences>
    implements $AiPreferencesCopyWith<$Res> {
  _$AiPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coachingTone = null,
    Object? language = null,
    Object? enableDailyBrief = null,
    Object? enableFoodRecognition = null,
    Object? enableWorkoutRecommendations = null,
  }) {
    return _then(
      _value.copyWith(
            coachingTone: null == coachingTone
                ? _value.coachingTone
                : coachingTone // ignore: cast_nullable_to_non_nullable
                      as CoachingTone,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as AppLanguage,
            enableDailyBrief: null == enableDailyBrief
                ? _value.enableDailyBrief
                : enableDailyBrief // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableFoodRecognition: null == enableFoodRecognition
                ? _value.enableFoodRecognition
                : enableFoodRecognition // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableWorkoutRecommendations: null == enableWorkoutRecommendations
                ? _value.enableWorkoutRecommendations
                : enableWorkoutRecommendations // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiPreferencesImplCopyWith<$Res>
    implements $AiPreferencesCopyWith<$Res> {
  factory _$$AiPreferencesImplCopyWith(
    _$AiPreferencesImpl value,
    $Res Function(_$AiPreferencesImpl) then,
  ) = __$$AiPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CoachingTone coachingTone,
    AppLanguage language,
    bool enableDailyBrief,
    bool enableFoodRecognition,
    bool enableWorkoutRecommendations,
  });
}

/// @nodoc
class __$$AiPreferencesImplCopyWithImpl<$Res>
    extends _$AiPreferencesCopyWithImpl<$Res, _$AiPreferencesImpl>
    implements _$$AiPreferencesImplCopyWith<$Res> {
  __$$AiPreferencesImplCopyWithImpl(
    _$AiPreferencesImpl _value,
    $Res Function(_$AiPreferencesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coachingTone = null,
    Object? language = null,
    Object? enableDailyBrief = null,
    Object? enableFoodRecognition = null,
    Object? enableWorkoutRecommendations = null,
  }) {
    return _then(
      _$AiPreferencesImpl(
        coachingTone: null == coachingTone
            ? _value.coachingTone
            : coachingTone // ignore: cast_nullable_to_non_nullable
                  as CoachingTone,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as AppLanguage,
        enableDailyBrief: null == enableDailyBrief
            ? _value.enableDailyBrief
            : enableDailyBrief // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableFoodRecognition: null == enableFoodRecognition
            ? _value.enableFoodRecognition
            : enableFoodRecognition // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableWorkoutRecommendations: null == enableWorkoutRecommendations
            ? _value.enableWorkoutRecommendations
            : enableWorkoutRecommendations // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiPreferencesImpl implements _AiPreferences {
  const _$AiPreferencesImpl({
    this.coachingTone = CoachingTone.supportive,
    this.language = AppLanguage.arabic,
    this.enableDailyBrief = true,
    this.enableFoodRecognition = true,
    this.enableWorkoutRecommendations = true,
  });

  factory _$AiPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final CoachingTone coachingTone;
  @override
  @JsonKey()
  final AppLanguage language;
  @override
  @JsonKey()
  final bool enableDailyBrief;
  @override
  @JsonKey()
  final bool enableFoodRecognition;
  @override
  @JsonKey()
  final bool enableWorkoutRecommendations;

  @override
  String toString() {
    return 'AiPreferences(coachingTone: $coachingTone, language: $language, enableDailyBrief: $enableDailyBrief, enableFoodRecognition: $enableFoodRecognition, enableWorkoutRecommendations: $enableWorkoutRecommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiPreferencesImpl &&
            (identical(other.coachingTone, coachingTone) ||
                other.coachingTone == coachingTone) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.enableDailyBrief, enableDailyBrief) ||
                other.enableDailyBrief == enableDailyBrief) &&
            (identical(other.enableFoodRecognition, enableFoodRecognition) ||
                other.enableFoodRecognition == enableFoodRecognition) &&
            (identical(
                  other.enableWorkoutRecommendations,
                  enableWorkoutRecommendations,
                ) ||
                other.enableWorkoutRecommendations ==
                    enableWorkoutRecommendations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    coachingTone,
    language,
    enableDailyBrief,
    enableFoodRecognition,
    enableWorkoutRecommendations,
  );

  /// Create a copy of AiPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiPreferencesImplCopyWith<_$AiPreferencesImpl> get copyWith =>
      __$$AiPreferencesImplCopyWithImpl<_$AiPreferencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiPreferencesImplToJson(this);
  }
}

abstract class _AiPreferences implements AiPreferences {
  const factory _AiPreferences({
    final CoachingTone coachingTone,
    final AppLanguage language,
    final bool enableDailyBrief,
    final bool enableFoodRecognition,
    final bool enableWorkoutRecommendations,
  }) = _$AiPreferencesImpl;

  factory _AiPreferences.fromJson(Map<String, dynamic> json) =
      _$AiPreferencesImpl.fromJson;

  @override
  CoachingTone get coachingTone;
  @override
  AppLanguage get language;
  @override
  bool get enableDailyBrief;
  @override
  bool get enableFoodRecognition;
  @override
  bool get enableWorkoutRecommendations;

  /// Create a copy of AiPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiPreferencesImplCopyWith<_$AiPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
