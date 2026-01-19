// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_autonomy_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserAutonomySettings _$UserAutonomySettingsFromJson(Map<String, dynamic> json) {
  return _UserAutonomySettings.fromJson(json);
}

/// @nodoc
mixin _$UserAutonomySettings {
  String get id => throw _privateConstructorUsedError;

  /// Overall autonomy level
  AutoApplyLevel get autoApplyLevel => throw _privateConstructorUsedError;

  /// Notification frequency preference
  NotificationFrequency get notificationFrequency =>
      throw _privateConstructorUsedError; // ==========================================
  // Specific auto-apply permissions
  // ==========================================
  /// Can AI auto-adjust daily calorie targets?
  bool get canAutoAdjustCalories => throw _privateConstructorUsedError;

  /// Can AI auto-adjust protein targets?
  bool get canAutoAdjustProtein => throw _privateConstructorUsedError;

  /// Can AI automatically add rest days? (conservative by default)
  bool get canAutoAddRestDay => throw _privateConstructorUsedError;

  /// Can AI automatically remove/skip workouts? (conservative by default)
  bool get canAutoRemoveWorkout => throw _privateConstructorUsedError;

  /// Can AI auto-adjust workout intensity?
  bool get canAutoAdjustIntensity => throw _privateConstructorUsedError;

  /// Can AI auto-adjust meal timing?
  bool get canAutoAdjustMealTiming => throw _privateConstructorUsedError;

  /// Can AI auto-send proactive notifications?
  bool get canAutoSendNotifications =>
      throw _privateConstructorUsedError; // ==========================================
  // Quiet hours configuration
  // ==========================================
  /// Whether quiet hours are enabled
  bool get quietHoursEnabled => throw _privateConstructorUsedError;

  /// Quiet hours start (24-hour format, e.g., 22 for 10pm)
  int get quietHoursStart => throw _privateConstructorUsedError;

  /// Quiet hours end (24-hour format, e.g., 7 for 7am)
  int get quietHoursEnd =>
      throw _privateConstructorUsedError; // ==========================================
  // AI behavior preferences
  // ==========================================
  /// Preferred language for AI responses
  String get aiLanguage => throw _privateConstructorUsedError;

  /// Coaching tone preference
  String get coachingTone => throw _privateConstructorUsedError;

  /// Show AI reasoning in responses
  bool get showAiReasoning => throw _privateConstructorUsedError;

  /// Enable experimental AI features
  bool get enableExperimentalFeatures =>
      throw _privateConstructorUsedError; // ==========================================
  // Thresholds for auto-adjustments
  // ==========================================
  /// Minimum recovery score to allow intensity increase (0-100)
  int get minRecoveryForIntensityIncrease => throw _privateConstructorUsedError;

  /// Maximum calorie adjustment per day (absolute value)
  int get maxCalorieAdjustmentPerDay => throw _privateConstructorUsedError;

  /// Maximum protein adjustment per day (grams)
  int get maxProteinAdjustmentPerDay => throw _privateConstructorUsedError;

  /// Days of low recovery before suggesting rest day
  int get lowRecoveryDaysBeforeRestSuggestion =>
      throw _privateConstructorUsedError; // ==========================================
  // Timestamps
  // ==========================================
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserAutonomySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAutonomySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAutonomySettingsCopyWith<UserAutonomySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAutonomySettingsCopyWith<$Res> {
  factory $UserAutonomySettingsCopyWith(
    UserAutonomySettings value,
    $Res Function(UserAutonomySettings) then,
  ) = _$UserAutonomySettingsCopyWithImpl<$Res, UserAutonomySettings>;
  @useResult
  $Res call({
    String id,
    AutoApplyLevel autoApplyLevel,
    NotificationFrequency notificationFrequency,
    bool canAutoAdjustCalories,
    bool canAutoAdjustProtein,
    bool canAutoAddRestDay,
    bool canAutoRemoveWorkout,
    bool canAutoAdjustIntensity,
    bool canAutoAdjustMealTiming,
    bool canAutoSendNotifications,
    bool quietHoursEnabled,
    int quietHoursStart,
    int quietHoursEnd,
    String aiLanguage,
    String coachingTone,
    bool showAiReasoning,
    bool enableExperimentalFeatures,
    int minRecoveryForIntensityIncrease,
    int maxCalorieAdjustmentPerDay,
    int maxProteinAdjustmentPerDay,
    int lowRecoveryDaysBeforeRestSuggestion,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$UserAutonomySettingsCopyWithImpl<
  $Res,
  $Val extends UserAutonomySettings
>
    implements $UserAutonomySettingsCopyWith<$Res> {
  _$UserAutonomySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAutonomySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? autoApplyLevel = null,
    Object? notificationFrequency = null,
    Object? canAutoAdjustCalories = null,
    Object? canAutoAdjustProtein = null,
    Object? canAutoAddRestDay = null,
    Object? canAutoRemoveWorkout = null,
    Object? canAutoAdjustIntensity = null,
    Object? canAutoAdjustMealTiming = null,
    Object? canAutoSendNotifications = null,
    Object? quietHoursEnabled = null,
    Object? quietHoursStart = null,
    Object? quietHoursEnd = null,
    Object? aiLanguage = null,
    Object? coachingTone = null,
    Object? showAiReasoning = null,
    Object? enableExperimentalFeatures = null,
    Object? minRecoveryForIntensityIncrease = null,
    Object? maxCalorieAdjustmentPerDay = null,
    Object? maxProteinAdjustmentPerDay = null,
    Object? lowRecoveryDaysBeforeRestSuggestion = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            autoApplyLevel: null == autoApplyLevel
                ? _value.autoApplyLevel
                : autoApplyLevel // ignore: cast_nullable_to_non_nullable
                      as AutoApplyLevel,
            notificationFrequency: null == notificationFrequency
                ? _value.notificationFrequency
                : notificationFrequency // ignore: cast_nullable_to_non_nullable
                      as NotificationFrequency,
            canAutoAdjustCalories: null == canAutoAdjustCalories
                ? _value.canAutoAdjustCalories
                : canAutoAdjustCalories // ignore: cast_nullable_to_non_nullable
                      as bool,
            canAutoAdjustProtein: null == canAutoAdjustProtein
                ? _value.canAutoAdjustProtein
                : canAutoAdjustProtein // ignore: cast_nullable_to_non_nullable
                      as bool,
            canAutoAddRestDay: null == canAutoAddRestDay
                ? _value.canAutoAddRestDay
                : canAutoAddRestDay // ignore: cast_nullable_to_non_nullable
                      as bool,
            canAutoRemoveWorkout: null == canAutoRemoveWorkout
                ? _value.canAutoRemoveWorkout
                : canAutoRemoveWorkout // ignore: cast_nullable_to_non_nullable
                      as bool,
            canAutoAdjustIntensity: null == canAutoAdjustIntensity
                ? _value.canAutoAdjustIntensity
                : canAutoAdjustIntensity // ignore: cast_nullable_to_non_nullable
                      as bool,
            canAutoAdjustMealTiming: null == canAutoAdjustMealTiming
                ? _value.canAutoAdjustMealTiming
                : canAutoAdjustMealTiming // ignore: cast_nullable_to_non_nullable
                      as bool,
            canAutoSendNotifications: null == canAutoSendNotifications
                ? _value.canAutoSendNotifications
                : canAutoSendNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            quietHoursEnabled: null == quietHoursEnabled
                ? _value.quietHoursEnabled
                : quietHoursEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            quietHoursStart: null == quietHoursStart
                ? _value.quietHoursStart
                : quietHoursStart // ignore: cast_nullable_to_non_nullable
                      as int,
            quietHoursEnd: null == quietHoursEnd
                ? _value.quietHoursEnd
                : quietHoursEnd // ignore: cast_nullable_to_non_nullable
                      as int,
            aiLanguage: null == aiLanguage
                ? _value.aiLanguage
                : aiLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            coachingTone: null == coachingTone
                ? _value.coachingTone
                : coachingTone // ignore: cast_nullable_to_non_nullable
                      as String,
            showAiReasoning: null == showAiReasoning
                ? _value.showAiReasoning
                : showAiReasoning // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableExperimentalFeatures: null == enableExperimentalFeatures
                ? _value.enableExperimentalFeatures
                : enableExperimentalFeatures // ignore: cast_nullable_to_non_nullable
                      as bool,
            minRecoveryForIntensityIncrease:
                null == minRecoveryForIntensityIncrease
                ? _value.minRecoveryForIntensityIncrease
                : minRecoveryForIntensityIncrease // ignore: cast_nullable_to_non_nullable
                      as int,
            maxCalorieAdjustmentPerDay: null == maxCalorieAdjustmentPerDay
                ? _value.maxCalorieAdjustmentPerDay
                : maxCalorieAdjustmentPerDay // ignore: cast_nullable_to_non_nullable
                      as int,
            maxProteinAdjustmentPerDay: null == maxProteinAdjustmentPerDay
                ? _value.maxProteinAdjustmentPerDay
                : maxProteinAdjustmentPerDay // ignore: cast_nullable_to_non_nullable
                      as int,
            lowRecoveryDaysBeforeRestSuggestion:
                null == lowRecoveryDaysBeforeRestSuggestion
                ? _value.lowRecoveryDaysBeforeRestSuggestion
                : lowRecoveryDaysBeforeRestSuggestion // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserAutonomySettingsImplCopyWith<$Res>
    implements $UserAutonomySettingsCopyWith<$Res> {
  factory _$$UserAutonomySettingsImplCopyWith(
    _$UserAutonomySettingsImpl value,
    $Res Function(_$UserAutonomySettingsImpl) then,
  ) = __$$UserAutonomySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    AutoApplyLevel autoApplyLevel,
    NotificationFrequency notificationFrequency,
    bool canAutoAdjustCalories,
    bool canAutoAdjustProtein,
    bool canAutoAddRestDay,
    bool canAutoRemoveWorkout,
    bool canAutoAdjustIntensity,
    bool canAutoAdjustMealTiming,
    bool canAutoSendNotifications,
    bool quietHoursEnabled,
    int quietHoursStart,
    int quietHoursEnd,
    String aiLanguage,
    String coachingTone,
    bool showAiReasoning,
    bool enableExperimentalFeatures,
    int minRecoveryForIntensityIncrease,
    int maxCalorieAdjustmentPerDay,
    int maxProteinAdjustmentPerDay,
    int lowRecoveryDaysBeforeRestSuggestion,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$UserAutonomySettingsImplCopyWithImpl<$Res>
    extends _$UserAutonomySettingsCopyWithImpl<$Res, _$UserAutonomySettingsImpl>
    implements _$$UserAutonomySettingsImplCopyWith<$Res> {
  __$$UserAutonomySettingsImplCopyWithImpl(
    _$UserAutonomySettingsImpl _value,
    $Res Function(_$UserAutonomySettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserAutonomySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? autoApplyLevel = null,
    Object? notificationFrequency = null,
    Object? canAutoAdjustCalories = null,
    Object? canAutoAdjustProtein = null,
    Object? canAutoAddRestDay = null,
    Object? canAutoRemoveWorkout = null,
    Object? canAutoAdjustIntensity = null,
    Object? canAutoAdjustMealTiming = null,
    Object? canAutoSendNotifications = null,
    Object? quietHoursEnabled = null,
    Object? quietHoursStart = null,
    Object? quietHoursEnd = null,
    Object? aiLanguage = null,
    Object? coachingTone = null,
    Object? showAiReasoning = null,
    Object? enableExperimentalFeatures = null,
    Object? minRecoveryForIntensityIncrease = null,
    Object? maxCalorieAdjustmentPerDay = null,
    Object? maxProteinAdjustmentPerDay = null,
    Object? lowRecoveryDaysBeforeRestSuggestion = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$UserAutonomySettingsImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        autoApplyLevel: null == autoApplyLevel
            ? _value.autoApplyLevel
            : autoApplyLevel // ignore: cast_nullable_to_non_nullable
                  as AutoApplyLevel,
        notificationFrequency: null == notificationFrequency
            ? _value.notificationFrequency
            : notificationFrequency // ignore: cast_nullable_to_non_nullable
                  as NotificationFrequency,
        canAutoAdjustCalories: null == canAutoAdjustCalories
            ? _value.canAutoAdjustCalories
            : canAutoAdjustCalories // ignore: cast_nullable_to_non_nullable
                  as bool,
        canAutoAdjustProtein: null == canAutoAdjustProtein
            ? _value.canAutoAdjustProtein
            : canAutoAdjustProtein // ignore: cast_nullable_to_non_nullable
                  as bool,
        canAutoAddRestDay: null == canAutoAddRestDay
            ? _value.canAutoAddRestDay
            : canAutoAddRestDay // ignore: cast_nullable_to_non_nullable
                  as bool,
        canAutoRemoveWorkout: null == canAutoRemoveWorkout
            ? _value.canAutoRemoveWorkout
            : canAutoRemoveWorkout // ignore: cast_nullable_to_non_nullable
                  as bool,
        canAutoAdjustIntensity: null == canAutoAdjustIntensity
            ? _value.canAutoAdjustIntensity
            : canAutoAdjustIntensity // ignore: cast_nullable_to_non_nullable
                  as bool,
        canAutoAdjustMealTiming: null == canAutoAdjustMealTiming
            ? _value.canAutoAdjustMealTiming
            : canAutoAdjustMealTiming // ignore: cast_nullable_to_non_nullable
                  as bool,
        canAutoSendNotifications: null == canAutoSendNotifications
            ? _value.canAutoSendNotifications
            : canAutoSendNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        quietHoursEnabled: null == quietHoursEnabled
            ? _value.quietHoursEnabled
            : quietHoursEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        quietHoursStart: null == quietHoursStart
            ? _value.quietHoursStart
            : quietHoursStart // ignore: cast_nullable_to_non_nullable
                  as int,
        quietHoursEnd: null == quietHoursEnd
            ? _value.quietHoursEnd
            : quietHoursEnd // ignore: cast_nullable_to_non_nullable
                  as int,
        aiLanguage: null == aiLanguage
            ? _value.aiLanguage
            : aiLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        coachingTone: null == coachingTone
            ? _value.coachingTone
            : coachingTone // ignore: cast_nullable_to_non_nullable
                  as String,
        showAiReasoning: null == showAiReasoning
            ? _value.showAiReasoning
            : showAiReasoning // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableExperimentalFeatures: null == enableExperimentalFeatures
            ? _value.enableExperimentalFeatures
            : enableExperimentalFeatures // ignore: cast_nullable_to_non_nullable
                  as bool,
        minRecoveryForIntensityIncrease: null == minRecoveryForIntensityIncrease
            ? _value.minRecoveryForIntensityIncrease
            : minRecoveryForIntensityIncrease // ignore: cast_nullable_to_non_nullable
                  as int,
        maxCalorieAdjustmentPerDay: null == maxCalorieAdjustmentPerDay
            ? _value.maxCalorieAdjustmentPerDay
            : maxCalorieAdjustmentPerDay // ignore: cast_nullable_to_non_nullable
                  as int,
        maxProteinAdjustmentPerDay: null == maxProteinAdjustmentPerDay
            ? _value.maxProteinAdjustmentPerDay
            : maxProteinAdjustmentPerDay // ignore: cast_nullable_to_non_nullable
                  as int,
        lowRecoveryDaysBeforeRestSuggestion:
            null == lowRecoveryDaysBeforeRestSuggestion
            ? _value.lowRecoveryDaysBeforeRestSuggestion
            : lowRecoveryDaysBeforeRestSuggestion // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAutonomySettingsImpl extends _UserAutonomySettings {
  const _$UserAutonomySettingsImpl({
    required this.id,
    this.autoApplyLevel = AutoApplyLevel.moderate,
    this.notificationFrequency = NotificationFrequency.normal,
    this.canAutoAdjustCalories = true,
    this.canAutoAdjustProtein = true,
    this.canAutoAddRestDay = false,
    this.canAutoRemoveWorkout = false,
    this.canAutoAdjustIntensity = true,
    this.canAutoAdjustMealTiming = true,
    this.canAutoSendNotifications = true,
    this.quietHoursEnabled = true,
    this.quietHoursStart = 22,
    this.quietHoursEnd = 7,
    this.aiLanguage = 'ar',
    this.coachingTone = 'supportive',
    this.showAiReasoning = false,
    this.enableExperimentalFeatures = false,
    this.minRecoveryForIntensityIncrease = 60,
    this.maxCalorieAdjustmentPerDay = 300,
    this.maxProteinAdjustmentPerDay = 30,
    this.lowRecoveryDaysBeforeRestSuggestion = 2,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  factory _$UserAutonomySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAutonomySettingsImplFromJson(json);

  @override
  final String id;

  /// Overall autonomy level
  @override
  @JsonKey()
  final AutoApplyLevel autoApplyLevel;

  /// Notification frequency preference
  @override
  @JsonKey()
  final NotificationFrequency notificationFrequency;
  // ==========================================
  // Specific auto-apply permissions
  // ==========================================
  /// Can AI auto-adjust daily calorie targets?
  @override
  @JsonKey()
  final bool canAutoAdjustCalories;

  /// Can AI auto-adjust protein targets?
  @override
  @JsonKey()
  final bool canAutoAdjustProtein;

  /// Can AI automatically add rest days? (conservative by default)
  @override
  @JsonKey()
  final bool canAutoAddRestDay;

  /// Can AI automatically remove/skip workouts? (conservative by default)
  @override
  @JsonKey()
  final bool canAutoRemoveWorkout;

  /// Can AI auto-adjust workout intensity?
  @override
  @JsonKey()
  final bool canAutoAdjustIntensity;

  /// Can AI auto-adjust meal timing?
  @override
  @JsonKey()
  final bool canAutoAdjustMealTiming;

  /// Can AI auto-send proactive notifications?
  @override
  @JsonKey()
  final bool canAutoSendNotifications;
  // ==========================================
  // Quiet hours configuration
  // ==========================================
  /// Whether quiet hours are enabled
  @override
  @JsonKey()
  final bool quietHoursEnabled;

  /// Quiet hours start (24-hour format, e.g., 22 for 10pm)
  @override
  @JsonKey()
  final int quietHoursStart;

  /// Quiet hours end (24-hour format, e.g., 7 for 7am)
  @override
  @JsonKey()
  final int quietHoursEnd;
  // ==========================================
  // AI behavior preferences
  // ==========================================
  /// Preferred language for AI responses
  @override
  @JsonKey()
  final String aiLanguage;

  /// Coaching tone preference
  @override
  @JsonKey()
  final String coachingTone;

  /// Show AI reasoning in responses
  @override
  @JsonKey()
  final bool showAiReasoning;

  /// Enable experimental AI features
  @override
  @JsonKey()
  final bool enableExperimentalFeatures;
  // ==========================================
  // Thresholds for auto-adjustments
  // ==========================================
  /// Minimum recovery score to allow intensity increase (0-100)
  @override
  @JsonKey()
  final int minRecoveryForIntensityIncrease;

  /// Maximum calorie adjustment per day (absolute value)
  @override
  @JsonKey()
  final int maxCalorieAdjustmentPerDay;

  /// Maximum protein adjustment per day (grams)
  @override
  @JsonKey()
  final int maxProteinAdjustmentPerDay;

  /// Days of low recovery before suggesting rest day
  @override
  @JsonKey()
  final int lowRecoveryDaysBeforeRestSuggestion;
  // ==========================================
  // Timestamps
  // ==========================================
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserAutonomySettings(id: $id, autoApplyLevel: $autoApplyLevel, notificationFrequency: $notificationFrequency, canAutoAdjustCalories: $canAutoAdjustCalories, canAutoAdjustProtein: $canAutoAdjustProtein, canAutoAddRestDay: $canAutoAddRestDay, canAutoRemoveWorkout: $canAutoRemoveWorkout, canAutoAdjustIntensity: $canAutoAdjustIntensity, canAutoAdjustMealTiming: $canAutoAdjustMealTiming, canAutoSendNotifications: $canAutoSendNotifications, quietHoursEnabled: $quietHoursEnabled, quietHoursStart: $quietHoursStart, quietHoursEnd: $quietHoursEnd, aiLanguage: $aiLanguage, coachingTone: $coachingTone, showAiReasoning: $showAiReasoning, enableExperimentalFeatures: $enableExperimentalFeatures, minRecoveryForIntensityIncrease: $minRecoveryForIntensityIncrease, maxCalorieAdjustmentPerDay: $maxCalorieAdjustmentPerDay, maxProteinAdjustmentPerDay: $maxProteinAdjustmentPerDay, lowRecoveryDaysBeforeRestSuggestion: $lowRecoveryDaysBeforeRestSuggestion, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAutonomySettingsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.autoApplyLevel, autoApplyLevel) ||
                other.autoApplyLevel == autoApplyLevel) &&
            (identical(other.notificationFrequency, notificationFrequency) ||
                other.notificationFrequency == notificationFrequency) &&
            (identical(other.canAutoAdjustCalories, canAutoAdjustCalories) ||
                other.canAutoAdjustCalories == canAutoAdjustCalories) &&
            (identical(other.canAutoAdjustProtein, canAutoAdjustProtein) ||
                other.canAutoAdjustProtein == canAutoAdjustProtein) &&
            (identical(other.canAutoAddRestDay, canAutoAddRestDay) ||
                other.canAutoAddRestDay == canAutoAddRestDay) &&
            (identical(other.canAutoRemoveWorkout, canAutoRemoveWorkout) ||
                other.canAutoRemoveWorkout == canAutoRemoveWorkout) &&
            (identical(other.canAutoAdjustIntensity, canAutoAdjustIntensity) ||
                other.canAutoAdjustIntensity == canAutoAdjustIntensity) &&
            (identical(
                  other.canAutoAdjustMealTiming,
                  canAutoAdjustMealTiming,
                ) ||
                other.canAutoAdjustMealTiming == canAutoAdjustMealTiming) &&
            (identical(
                  other.canAutoSendNotifications,
                  canAutoSendNotifications,
                ) ||
                other.canAutoSendNotifications == canAutoSendNotifications) &&
            (identical(other.quietHoursEnabled, quietHoursEnabled) ||
                other.quietHoursEnabled == quietHoursEnabled) &&
            (identical(other.quietHoursStart, quietHoursStart) ||
                other.quietHoursStart == quietHoursStart) &&
            (identical(other.quietHoursEnd, quietHoursEnd) ||
                other.quietHoursEnd == quietHoursEnd) &&
            (identical(other.aiLanguage, aiLanguage) ||
                other.aiLanguage == aiLanguage) &&
            (identical(other.coachingTone, coachingTone) ||
                other.coachingTone == coachingTone) &&
            (identical(other.showAiReasoning, showAiReasoning) ||
                other.showAiReasoning == showAiReasoning) &&
            (identical(
                  other.enableExperimentalFeatures,
                  enableExperimentalFeatures,
                ) ||
                other.enableExperimentalFeatures ==
                    enableExperimentalFeatures) &&
            (identical(
                  other.minRecoveryForIntensityIncrease,
                  minRecoveryForIntensityIncrease,
                ) ||
                other.minRecoveryForIntensityIncrease ==
                    minRecoveryForIntensityIncrease) &&
            (identical(
                  other.maxCalorieAdjustmentPerDay,
                  maxCalorieAdjustmentPerDay,
                ) ||
                other.maxCalorieAdjustmentPerDay ==
                    maxCalorieAdjustmentPerDay) &&
            (identical(
                  other.maxProteinAdjustmentPerDay,
                  maxProteinAdjustmentPerDay,
                ) ||
                other.maxProteinAdjustmentPerDay ==
                    maxProteinAdjustmentPerDay) &&
            (identical(
                  other.lowRecoveryDaysBeforeRestSuggestion,
                  lowRecoveryDaysBeforeRestSuggestion,
                ) ||
                other.lowRecoveryDaysBeforeRestSuggestion ==
                    lowRecoveryDaysBeforeRestSuggestion) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    autoApplyLevel,
    notificationFrequency,
    canAutoAdjustCalories,
    canAutoAdjustProtein,
    canAutoAddRestDay,
    canAutoRemoveWorkout,
    canAutoAdjustIntensity,
    canAutoAdjustMealTiming,
    canAutoSendNotifications,
    quietHoursEnabled,
    quietHoursStart,
    quietHoursEnd,
    aiLanguage,
    coachingTone,
    showAiReasoning,
    enableExperimentalFeatures,
    minRecoveryForIntensityIncrease,
    maxCalorieAdjustmentPerDay,
    maxProteinAdjustmentPerDay,
    lowRecoveryDaysBeforeRestSuggestion,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of UserAutonomySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAutonomySettingsImplCopyWith<_$UserAutonomySettingsImpl>
  get copyWith =>
      __$$UserAutonomySettingsImplCopyWithImpl<_$UserAutonomySettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAutonomySettingsImplToJson(this);
  }
}

abstract class _UserAutonomySettings extends UserAutonomySettings {
  const factory _UserAutonomySettings({
    required final String id,
    final AutoApplyLevel autoApplyLevel,
    final NotificationFrequency notificationFrequency,
    final bool canAutoAdjustCalories,
    final bool canAutoAdjustProtein,
    final bool canAutoAddRestDay,
    final bool canAutoRemoveWorkout,
    final bool canAutoAdjustIntensity,
    final bool canAutoAdjustMealTiming,
    final bool canAutoSendNotifications,
    final bool quietHoursEnabled,
    final int quietHoursStart,
    final int quietHoursEnd,
    final String aiLanguage,
    final String coachingTone,
    final bool showAiReasoning,
    final bool enableExperimentalFeatures,
    final int minRecoveryForIntensityIncrease,
    final int maxCalorieAdjustmentPerDay,
    final int maxProteinAdjustmentPerDay,
    final int lowRecoveryDaysBeforeRestSuggestion,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$UserAutonomySettingsImpl;
  const _UserAutonomySettings._() : super._();

  factory _UserAutonomySettings.fromJson(Map<String, dynamic> json) =
      _$UserAutonomySettingsImpl.fromJson;

  @override
  String get id;

  /// Overall autonomy level
  @override
  AutoApplyLevel get autoApplyLevel;

  /// Notification frequency preference
  @override
  NotificationFrequency get notificationFrequency; // ==========================================
  // Specific auto-apply permissions
  // ==========================================
  /// Can AI auto-adjust daily calorie targets?
  @override
  bool get canAutoAdjustCalories;

  /// Can AI auto-adjust protein targets?
  @override
  bool get canAutoAdjustProtein;

  /// Can AI automatically add rest days? (conservative by default)
  @override
  bool get canAutoAddRestDay;

  /// Can AI automatically remove/skip workouts? (conservative by default)
  @override
  bool get canAutoRemoveWorkout;

  /// Can AI auto-adjust workout intensity?
  @override
  bool get canAutoAdjustIntensity;

  /// Can AI auto-adjust meal timing?
  @override
  bool get canAutoAdjustMealTiming;

  /// Can AI auto-send proactive notifications?
  @override
  bool get canAutoSendNotifications; // ==========================================
  // Quiet hours configuration
  // ==========================================
  /// Whether quiet hours are enabled
  @override
  bool get quietHoursEnabled;

  /// Quiet hours start (24-hour format, e.g., 22 for 10pm)
  @override
  int get quietHoursStart;

  /// Quiet hours end (24-hour format, e.g., 7 for 7am)
  @override
  int get quietHoursEnd; // ==========================================
  // AI behavior preferences
  // ==========================================
  /// Preferred language for AI responses
  @override
  String get aiLanguage;

  /// Coaching tone preference
  @override
  String get coachingTone;

  /// Show AI reasoning in responses
  @override
  bool get showAiReasoning;

  /// Enable experimental AI features
  @override
  bool get enableExperimentalFeatures; // ==========================================
  // Thresholds for auto-adjustments
  // ==========================================
  /// Minimum recovery score to allow intensity increase (0-100)
  @override
  int get minRecoveryForIntensityIncrease;

  /// Maximum calorie adjustment per day (absolute value)
  @override
  int get maxCalorieAdjustmentPerDay;

  /// Maximum protein adjustment per day (grams)
  @override
  int get maxProteinAdjustmentPerDay;

  /// Days of low recovery before suggesting rest day
  @override
  int get lowRecoveryDaysBeforeRestSuggestion; // ==========================================
  // Timestamps
  // ==========================================
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UserAutonomySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAutonomySettingsImplCopyWith<_$UserAutonomySettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}
