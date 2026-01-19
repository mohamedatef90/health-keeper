// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_brain_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiBrainContext _$AiBrainContextFromJson(Map<String, dynamic> json) {
  return _AiBrainContext.fromJson(json);
}

/// @nodoc
mixin _$AiBrainContext {
  /// Context generation timestamp
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// User profile data
  AiBrainUserContext? get userContext => throw _privateConstructorUsedError;

  /// Today's health metrics
  AiBrainHealthContext? get healthContext => throw _privateConstructorUsedError;

  /// 7-day trends for key metrics
  AiBrainTrendsContext? get trendsContext => throw _privateConstructorUsedError;

  /// Today's nutrition status
  AiBrainNutritionContext? get nutritionContext =>
      throw _privateConstructorUsedError;

  /// Active plans (meal + workout)
  AiBrainPlansContext? get plansContext => throw _privateConstructorUsedError;

  /// Recent chat messages for conversation continuity
  List<AiBrainChatMessage> get recentMessages =>
      throw _privateConstructorUsedError;

  /// Active alerts and nudges
  List<AiBrainAlert> get activeAlerts => throw _privateConstructorUsedError;

  /// Sync timestamps
  AiBrainSyncStatus get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this AiBrainContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainContextCopyWith<AiBrainContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainContextCopyWith<$Res> {
  factory $AiBrainContextCopyWith(
    AiBrainContext value,
    $Res Function(AiBrainContext) then,
  ) = _$AiBrainContextCopyWithImpl<$Res, AiBrainContext>;
  @useResult
  $Res call({
    DateTime generatedAt,
    AiBrainUserContext? userContext,
    AiBrainHealthContext? healthContext,
    AiBrainTrendsContext? trendsContext,
    AiBrainNutritionContext? nutritionContext,
    AiBrainPlansContext? plansContext,
    List<AiBrainChatMessage> recentMessages,
    List<AiBrainAlert> activeAlerts,
    AiBrainSyncStatus syncStatus,
  });

  $AiBrainUserContextCopyWith<$Res>? get userContext;
  $AiBrainHealthContextCopyWith<$Res>? get healthContext;
  $AiBrainTrendsContextCopyWith<$Res>? get trendsContext;
  $AiBrainNutritionContextCopyWith<$Res>? get nutritionContext;
  $AiBrainPlansContextCopyWith<$Res>? get plansContext;
  $AiBrainSyncStatusCopyWith<$Res> get syncStatus;
}

/// @nodoc
class _$AiBrainContextCopyWithImpl<$Res, $Val extends AiBrainContext>
    implements $AiBrainContextCopyWith<$Res> {
  _$AiBrainContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = null,
    Object? userContext = freezed,
    Object? healthContext = freezed,
    Object? trendsContext = freezed,
    Object? nutritionContext = freezed,
    Object? plansContext = freezed,
    Object? recentMessages = null,
    Object? activeAlerts = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _value.copyWith(
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            userContext: freezed == userContext
                ? _value.userContext
                : userContext // ignore: cast_nullable_to_non_nullable
                      as AiBrainUserContext?,
            healthContext: freezed == healthContext
                ? _value.healthContext
                : healthContext // ignore: cast_nullable_to_non_nullable
                      as AiBrainHealthContext?,
            trendsContext: freezed == trendsContext
                ? _value.trendsContext
                : trendsContext // ignore: cast_nullable_to_non_nullable
                      as AiBrainTrendsContext?,
            nutritionContext: freezed == nutritionContext
                ? _value.nutritionContext
                : nutritionContext // ignore: cast_nullable_to_non_nullable
                      as AiBrainNutritionContext?,
            plansContext: freezed == plansContext
                ? _value.plansContext
                : plansContext // ignore: cast_nullable_to_non_nullable
                      as AiBrainPlansContext?,
            recentMessages: null == recentMessages
                ? _value.recentMessages
                : recentMessages // ignore: cast_nullable_to_non_nullable
                      as List<AiBrainChatMessage>,
            activeAlerts: null == activeAlerts
                ? _value.activeAlerts
                : activeAlerts // ignore: cast_nullable_to_non_nullable
                      as List<AiBrainAlert>,
            syncStatus: null == syncStatus
                ? _value.syncStatus
                : syncStatus // ignore: cast_nullable_to_non_nullable
                      as AiBrainSyncStatus,
          )
          as $Val,
    );
  }

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiBrainUserContextCopyWith<$Res>? get userContext {
    if (_value.userContext == null) {
      return null;
    }

    return $AiBrainUserContextCopyWith<$Res>(_value.userContext!, (value) {
      return _then(_value.copyWith(userContext: value) as $Val);
    });
  }

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiBrainHealthContextCopyWith<$Res>? get healthContext {
    if (_value.healthContext == null) {
      return null;
    }

    return $AiBrainHealthContextCopyWith<$Res>(_value.healthContext!, (value) {
      return _then(_value.copyWith(healthContext: value) as $Val);
    });
  }

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiBrainTrendsContextCopyWith<$Res>? get trendsContext {
    if (_value.trendsContext == null) {
      return null;
    }

    return $AiBrainTrendsContextCopyWith<$Res>(_value.trendsContext!, (value) {
      return _then(_value.copyWith(trendsContext: value) as $Val);
    });
  }

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiBrainNutritionContextCopyWith<$Res>? get nutritionContext {
    if (_value.nutritionContext == null) {
      return null;
    }

    return $AiBrainNutritionContextCopyWith<$Res>(_value.nutritionContext!, (
      value,
    ) {
      return _then(_value.copyWith(nutritionContext: value) as $Val);
    });
  }

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiBrainPlansContextCopyWith<$Res>? get plansContext {
    if (_value.plansContext == null) {
      return null;
    }

    return $AiBrainPlansContextCopyWith<$Res>(_value.plansContext!, (value) {
      return _then(_value.copyWith(plansContext: value) as $Val);
    });
  }

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiBrainSyncStatusCopyWith<$Res> get syncStatus {
    return $AiBrainSyncStatusCopyWith<$Res>(_value.syncStatus, (value) {
      return _then(_value.copyWith(syncStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AiBrainContextImplCopyWith<$Res>
    implements $AiBrainContextCopyWith<$Res> {
  factory _$$AiBrainContextImplCopyWith(
    _$AiBrainContextImpl value,
    $Res Function(_$AiBrainContextImpl) then,
  ) = __$$AiBrainContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime generatedAt,
    AiBrainUserContext? userContext,
    AiBrainHealthContext? healthContext,
    AiBrainTrendsContext? trendsContext,
    AiBrainNutritionContext? nutritionContext,
    AiBrainPlansContext? plansContext,
    List<AiBrainChatMessage> recentMessages,
    List<AiBrainAlert> activeAlerts,
    AiBrainSyncStatus syncStatus,
  });

  @override
  $AiBrainUserContextCopyWith<$Res>? get userContext;
  @override
  $AiBrainHealthContextCopyWith<$Res>? get healthContext;
  @override
  $AiBrainTrendsContextCopyWith<$Res>? get trendsContext;
  @override
  $AiBrainNutritionContextCopyWith<$Res>? get nutritionContext;
  @override
  $AiBrainPlansContextCopyWith<$Res>? get plansContext;
  @override
  $AiBrainSyncStatusCopyWith<$Res> get syncStatus;
}

/// @nodoc
class __$$AiBrainContextImplCopyWithImpl<$Res>
    extends _$AiBrainContextCopyWithImpl<$Res, _$AiBrainContextImpl>
    implements _$$AiBrainContextImplCopyWith<$Res> {
  __$$AiBrainContextImplCopyWithImpl(
    _$AiBrainContextImpl _value,
    $Res Function(_$AiBrainContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = null,
    Object? userContext = freezed,
    Object? healthContext = freezed,
    Object? trendsContext = freezed,
    Object? nutritionContext = freezed,
    Object? plansContext = freezed,
    Object? recentMessages = null,
    Object? activeAlerts = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$AiBrainContextImpl(
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        userContext: freezed == userContext
            ? _value.userContext
            : userContext // ignore: cast_nullable_to_non_nullable
                  as AiBrainUserContext?,
        healthContext: freezed == healthContext
            ? _value.healthContext
            : healthContext // ignore: cast_nullable_to_non_nullable
                  as AiBrainHealthContext?,
        trendsContext: freezed == trendsContext
            ? _value.trendsContext
            : trendsContext // ignore: cast_nullable_to_non_nullable
                  as AiBrainTrendsContext?,
        nutritionContext: freezed == nutritionContext
            ? _value.nutritionContext
            : nutritionContext // ignore: cast_nullable_to_non_nullable
                  as AiBrainNutritionContext?,
        plansContext: freezed == plansContext
            ? _value.plansContext
            : plansContext // ignore: cast_nullable_to_non_nullable
                  as AiBrainPlansContext?,
        recentMessages: null == recentMessages
            ? _value._recentMessages
            : recentMessages // ignore: cast_nullable_to_non_nullable
                  as List<AiBrainChatMessage>,
        activeAlerts: null == activeAlerts
            ? _value._activeAlerts
            : activeAlerts // ignore: cast_nullable_to_non_nullable
                  as List<AiBrainAlert>,
        syncStatus: null == syncStatus
            ? _value.syncStatus
            : syncStatus // ignore: cast_nullable_to_non_nullable
                  as AiBrainSyncStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainContextImpl extends _AiBrainContext {
  const _$AiBrainContextImpl({
    required this.generatedAt,
    this.userContext,
    this.healthContext,
    this.trendsContext,
    this.nutritionContext,
    this.plansContext,
    final List<AiBrainChatMessage> recentMessages = const [],
    final List<AiBrainAlert> activeAlerts = const [],
    required this.syncStatus,
  }) : _recentMessages = recentMessages,
       _activeAlerts = activeAlerts,
       super._();

  factory _$AiBrainContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainContextImplFromJson(json);

  /// Context generation timestamp
  @override
  final DateTime generatedAt;

  /// User profile data
  @override
  final AiBrainUserContext? userContext;

  /// Today's health metrics
  @override
  final AiBrainHealthContext? healthContext;

  /// 7-day trends for key metrics
  @override
  final AiBrainTrendsContext? trendsContext;

  /// Today's nutrition status
  @override
  final AiBrainNutritionContext? nutritionContext;

  /// Active plans (meal + workout)
  @override
  final AiBrainPlansContext? plansContext;

  /// Recent chat messages for conversation continuity
  final List<AiBrainChatMessage> _recentMessages;

  /// Recent chat messages for conversation continuity
  @override
  @JsonKey()
  List<AiBrainChatMessage> get recentMessages {
    if (_recentMessages is EqualUnmodifiableListView) return _recentMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentMessages);
  }

  /// Active alerts and nudges
  final List<AiBrainAlert> _activeAlerts;

  /// Active alerts and nudges
  @override
  @JsonKey()
  List<AiBrainAlert> get activeAlerts {
    if (_activeAlerts is EqualUnmodifiableListView) return _activeAlerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeAlerts);
  }

  /// Sync timestamps
  @override
  final AiBrainSyncStatus syncStatus;

  @override
  String toString() {
    return 'AiBrainContext(generatedAt: $generatedAt, userContext: $userContext, healthContext: $healthContext, trendsContext: $trendsContext, nutritionContext: $nutritionContext, plansContext: $plansContext, recentMessages: $recentMessages, activeAlerts: $activeAlerts, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainContextImpl &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.userContext, userContext) ||
                other.userContext == userContext) &&
            (identical(other.healthContext, healthContext) ||
                other.healthContext == healthContext) &&
            (identical(other.trendsContext, trendsContext) ||
                other.trendsContext == trendsContext) &&
            (identical(other.nutritionContext, nutritionContext) ||
                other.nutritionContext == nutritionContext) &&
            (identical(other.plansContext, plansContext) ||
                other.plansContext == plansContext) &&
            const DeepCollectionEquality().equals(
              other._recentMessages,
              _recentMessages,
            ) &&
            const DeepCollectionEquality().equals(
              other._activeAlerts,
              _activeAlerts,
            ) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    generatedAt,
    userContext,
    healthContext,
    trendsContext,
    nutritionContext,
    plansContext,
    const DeepCollectionEquality().hash(_recentMessages),
    const DeepCollectionEquality().hash(_activeAlerts),
    syncStatus,
  );

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainContextImplCopyWith<_$AiBrainContextImpl> get copyWith =>
      __$$AiBrainContextImplCopyWithImpl<_$AiBrainContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainContextImplToJson(this);
  }
}

abstract class _AiBrainContext extends AiBrainContext {
  const factory _AiBrainContext({
    required final DateTime generatedAt,
    final AiBrainUserContext? userContext,
    final AiBrainHealthContext? healthContext,
    final AiBrainTrendsContext? trendsContext,
    final AiBrainNutritionContext? nutritionContext,
    final AiBrainPlansContext? plansContext,
    final List<AiBrainChatMessage> recentMessages,
    final List<AiBrainAlert> activeAlerts,
    required final AiBrainSyncStatus syncStatus,
  }) = _$AiBrainContextImpl;
  const _AiBrainContext._() : super._();

  factory _AiBrainContext.fromJson(Map<String, dynamic> json) =
      _$AiBrainContextImpl.fromJson;

  /// Context generation timestamp
  @override
  DateTime get generatedAt;

  /// User profile data
  @override
  AiBrainUserContext? get userContext;

  /// Today's health metrics
  @override
  AiBrainHealthContext? get healthContext;

  /// 7-day trends for key metrics
  @override
  AiBrainTrendsContext? get trendsContext;

  /// Today's nutrition status
  @override
  AiBrainNutritionContext? get nutritionContext;

  /// Active plans (meal + workout)
  @override
  AiBrainPlansContext? get plansContext;

  /// Recent chat messages for conversation continuity
  @override
  List<AiBrainChatMessage> get recentMessages;

  /// Active alerts and nudges
  @override
  List<AiBrainAlert> get activeAlerts;

  /// Sync timestamps
  @override
  AiBrainSyncStatus get syncStatus;

  /// Create a copy of AiBrainContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainContextImplCopyWith<_$AiBrainContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiBrainUserContext _$AiBrainUserContextFromJson(Map<String, dynamic> json) {
  return _AiBrainUserContext.fromJson(json);
}

/// @nodoc
mixin _$AiBrainUserContext {
  String get id => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;

  /// User goals
  double? get targetWeight => throw _privateConstructorUsedError;
  double? get targetWaist => throw _privateConstructorUsedError;
  int? get targetSteps => throw _privateConstructorUsedError;
  int? get targetCalories => throw _privateConstructorUsedError;
  int? get targetProtein => throw _privateConstructorUsedError;
  double? get targetSleepHours => throw _privateConstructorUsedError;

  /// AI preferences
  String get coachingTone => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  bool get enableAiCoaching => throw _privateConstructorUsedError;

  /// Protocol summary
  int? get eatingWindowStartHour => throw _privateConstructorUsedError;
  int? get eatingWindowStartMinute => throw _privateConstructorUsedError;
  int? get eatingWindowEndHour => throw _privateConstructorUsedError;
  int? get eatingWindowEndMinute => throw _privateConstructorUsedError;
  List<String> get activeConstraints => throw _privateConstructorUsedError;

  /// Serializes this AiBrainUserContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainUserContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainUserContextCopyWith<AiBrainUserContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainUserContextCopyWith<$Res> {
  factory $AiBrainUserContextCopyWith(
    AiBrainUserContext value,
    $Res Function(AiBrainUserContext) then,
  ) = _$AiBrainUserContextCopyWithImpl<$Res, AiBrainUserContext>;
  @useResult
  $Res call({
    String id,
    int? age,
    double? height,
    String? gender,
    String? timezone,
    double? targetWeight,
    double? targetWaist,
    int? targetSteps,
    int? targetCalories,
    int? targetProtein,
    double? targetSleepHours,
    String coachingTone,
    String language,
    bool enableAiCoaching,
    int? eatingWindowStartHour,
    int? eatingWindowStartMinute,
    int? eatingWindowEndHour,
    int? eatingWindowEndMinute,
    List<String> activeConstraints,
  });
}

/// @nodoc
class _$AiBrainUserContextCopyWithImpl<$Res, $Val extends AiBrainUserContext>
    implements $AiBrainUserContextCopyWith<$Res> {
  _$AiBrainUserContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainUserContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? age = freezed,
    Object? height = freezed,
    Object? gender = freezed,
    Object? timezone = freezed,
    Object? targetWeight = freezed,
    Object? targetWaist = freezed,
    Object? targetSteps = freezed,
    Object? targetCalories = freezed,
    Object? targetProtein = freezed,
    Object? targetSleepHours = freezed,
    Object? coachingTone = null,
    Object? language = null,
    Object? enableAiCoaching = null,
    Object? eatingWindowStartHour = freezed,
    Object? eatingWindowStartMinute = freezed,
    Object? eatingWindowEndHour = freezed,
    Object? eatingWindowEndMinute = freezed,
    Object? activeConstraints = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            timezone: freezed == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            coachingTone: null == coachingTone
                ? _value.coachingTone
                : coachingTone // ignore: cast_nullable_to_non_nullable
                      as String,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            enableAiCoaching: null == enableAiCoaching
                ? _value.enableAiCoaching
                : enableAiCoaching // ignore: cast_nullable_to_non_nullable
                      as bool,
            eatingWindowStartHour: freezed == eatingWindowStartHour
                ? _value.eatingWindowStartHour
                : eatingWindowStartHour // ignore: cast_nullable_to_non_nullable
                      as int?,
            eatingWindowStartMinute: freezed == eatingWindowStartMinute
                ? _value.eatingWindowStartMinute
                : eatingWindowStartMinute // ignore: cast_nullable_to_non_nullable
                      as int?,
            eatingWindowEndHour: freezed == eatingWindowEndHour
                ? _value.eatingWindowEndHour
                : eatingWindowEndHour // ignore: cast_nullable_to_non_nullable
                      as int?,
            eatingWindowEndMinute: freezed == eatingWindowEndMinute
                ? _value.eatingWindowEndMinute
                : eatingWindowEndMinute // ignore: cast_nullable_to_non_nullable
                      as int?,
            activeConstraints: null == activeConstraints
                ? _value.activeConstraints
                : activeConstraints // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainUserContextImplCopyWith<$Res>
    implements $AiBrainUserContextCopyWith<$Res> {
  factory _$$AiBrainUserContextImplCopyWith(
    _$AiBrainUserContextImpl value,
    $Res Function(_$AiBrainUserContextImpl) then,
  ) = __$$AiBrainUserContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int? age,
    double? height,
    String? gender,
    String? timezone,
    double? targetWeight,
    double? targetWaist,
    int? targetSteps,
    int? targetCalories,
    int? targetProtein,
    double? targetSleepHours,
    String coachingTone,
    String language,
    bool enableAiCoaching,
    int? eatingWindowStartHour,
    int? eatingWindowStartMinute,
    int? eatingWindowEndHour,
    int? eatingWindowEndMinute,
    List<String> activeConstraints,
  });
}

/// @nodoc
class __$$AiBrainUserContextImplCopyWithImpl<$Res>
    extends _$AiBrainUserContextCopyWithImpl<$Res, _$AiBrainUserContextImpl>
    implements _$$AiBrainUserContextImplCopyWith<$Res> {
  __$$AiBrainUserContextImplCopyWithImpl(
    _$AiBrainUserContextImpl _value,
    $Res Function(_$AiBrainUserContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainUserContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? age = freezed,
    Object? height = freezed,
    Object? gender = freezed,
    Object? timezone = freezed,
    Object? targetWeight = freezed,
    Object? targetWaist = freezed,
    Object? targetSteps = freezed,
    Object? targetCalories = freezed,
    Object? targetProtein = freezed,
    Object? targetSleepHours = freezed,
    Object? coachingTone = null,
    Object? language = null,
    Object? enableAiCoaching = null,
    Object? eatingWindowStartHour = freezed,
    Object? eatingWindowStartMinute = freezed,
    Object? eatingWindowEndHour = freezed,
    Object? eatingWindowEndMinute = freezed,
    Object? activeConstraints = null,
  }) {
    return _then(
      _$AiBrainUserContextImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        timezone: freezed == timezone
            ? _value.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        coachingTone: null == coachingTone
            ? _value.coachingTone
            : coachingTone // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        enableAiCoaching: null == enableAiCoaching
            ? _value.enableAiCoaching
            : enableAiCoaching // ignore: cast_nullable_to_non_nullable
                  as bool,
        eatingWindowStartHour: freezed == eatingWindowStartHour
            ? _value.eatingWindowStartHour
            : eatingWindowStartHour // ignore: cast_nullable_to_non_nullable
                  as int?,
        eatingWindowStartMinute: freezed == eatingWindowStartMinute
            ? _value.eatingWindowStartMinute
            : eatingWindowStartMinute // ignore: cast_nullable_to_non_nullable
                  as int?,
        eatingWindowEndHour: freezed == eatingWindowEndHour
            ? _value.eatingWindowEndHour
            : eatingWindowEndHour // ignore: cast_nullable_to_non_nullable
                  as int?,
        eatingWindowEndMinute: freezed == eatingWindowEndMinute
            ? _value.eatingWindowEndMinute
            : eatingWindowEndMinute // ignore: cast_nullable_to_non_nullable
                  as int?,
        activeConstraints: null == activeConstraints
            ? _value._activeConstraints
            : activeConstraints // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainUserContextImpl implements _AiBrainUserContext {
  const _$AiBrainUserContextImpl({
    required this.id,
    this.age,
    this.height,
    this.gender,
    this.timezone,
    this.targetWeight,
    this.targetWaist,
    this.targetSteps,
    this.targetCalories,
    this.targetProtein,
    this.targetSleepHours,
    this.coachingTone = 'supportive',
    this.language = 'ar',
    this.enableAiCoaching = true,
    this.eatingWindowStartHour,
    this.eatingWindowStartMinute,
    this.eatingWindowEndHour,
    this.eatingWindowEndMinute,
    final List<String> activeConstraints = const [],
  }) : _activeConstraints = activeConstraints;

  factory _$AiBrainUserContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainUserContextImplFromJson(json);

  @override
  final String id;
  @override
  final int? age;
  @override
  final double? height;
  @override
  final String? gender;
  @override
  final String? timezone;

  /// User goals
  @override
  final double? targetWeight;
  @override
  final double? targetWaist;
  @override
  final int? targetSteps;
  @override
  final int? targetCalories;
  @override
  final int? targetProtein;
  @override
  final double? targetSleepHours;

  /// AI preferences
  @override
  @JsonKey()
  final String coachingTone;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final bool enableAiCoaching;

  /// Protocol summary
  @override
  final int? eatingWindowStartHour;
  @override
  final int? eatingWindowStartMinute;
  @override
  final int? eatingWindowEndHour;
  @override
  final int? eatingWindowEndMinute;
  final List<String> _activeConstraints;
  @override
  @JsonKey()
  List<String> get activeConstraints {
    if (_activeConstraints is EqualUnmodifiableListView)
      return _activeConstraints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeConstraints);
  }

  @override
  String toString() {
    return 'AiBrainUserContext(id: $id, age: $age, height: $height, gender: $gender, timezone: $timezone, targetWeight: $targetWeight, targetWaist: $targetWaist, targetSteps: $targetSteps, targetCalories: $targetCalories, targetProtein: $targetProtein, targetSleepHours: $targetSleepHours, coachingTone: $coachingTone, language: $language, enableAiCoaching: $enableAiCoaching, eatingWindowStartHour: $eatingWindowStartHour, eatingWindowStartMinute: $eatingWindowStartMinute, eatingWindowEndHour: $eatingWindowEndHour, eatingWindowEndMinute: $eatingWindowEndMinute, activeConstraints: $activeConstraints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainUserContextImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
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
                other.targetSleepHours == targetSleepHours) &&
            (identical(other.coachingTone, coachingTone) ||
                other.coachingTone == coachingTone) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.enableAiCoaching, enableAiCoaching) ||
                other.enableAiCoaching == enableAiCoaching) &&
            (identical(other.eatingWindowStartHour, eatingWindowStartHour) ||
                other.eatingWindowStartHour == eatingWindowStartHour) &&
            (identical(
                  other.eatingWindowStartMinute,
                  eatingWindowStartMinute,
                ) ||
                other.eatingWindowStartMinute == eatingWindowStartMinute) &&
            (identical(other.eatingWindowEndHour, eatingWindowEndHour) ||
                other.eatingWindowEndHour == eatingWindowEndHour) &&
            (identical(other.eatingWindowEndMinute, eatingWindowEndMinute) ||
                other.eatingWindowEndMinute == eatingWindowEndMinute) &&
            const DeepCollectionEquality().equals(
              other._activeConstraints,
              _activeConstraints,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    age,
    height,
    gender,
    timezone,
    targetWeight,
    targetWaist,
    targetSteps,
    targetCalories,
    targetProtein,
    targetSleepHours,
    coachingTone,
    language,
    enableAiCoaching,
    eatingWindowStartHour,
    eatingWindowStartMinute,
    eatingWindowEndHour,
    eatingWindowEndMinute,
    const DeepCollectionEquality().hash(_activeConstraints),
  ]);

  /// Create a copy of AiBrainUserContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainUserContextImplCopyWith<_$AiBrainUserContextImpl> get copyWith =>
      __$$AiBrainUserContextImplCopyWithImpl<_$AiBrainUserContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainUserContextImplToJson(this);
  }
}

abstract class _AiBrainUserContext implements AiBrainUserContext {
  const factory _AiBrainUserContext({
    required final String id,
    final int? age,
    final double? height,
    final String? gender,
    final String? timezone,
    final double? targetWeight,
    final double? targetWaist,
    final int? targetSteps,
    final int? targetCalories,
    final int? targetProtein,
    final double? targetSleepHours,
    final String coachingTone,
    final String language,
    final bool enableAiCoaching,
    final int? eatingWindowStartHour,
    final int? eatingWindowStartMinute,
    final int? eatingWindowEndHour,
    final int? eatingWindowEndMinute,
    final List<String> activeConstraints,
  }) = _$AiBrainUserContextImpl;

  factory _AiBrainUserContext.fromJson(Map<String, dynamic> json) =
      _$AiBrainUserContextImpl.fromJson;

  @override
  String get id;
  @override
  int? get age;
  @override
  double? get height;
  @override
  String? get gender;
  @override
  String? get timezone;

  /// User goals
  @override
  double? get targetWeight;
  @override
  double? get targetWaist;
  @override
  int? get targetSteps;
  @override
  int? get targetCalories;
  @override
  int? get targetProtein;
  @override
  double? get targetSleepHours;

  /// AI preferences
  @override
  String get coachingTone;
  @override
  String get language;
  @override
  bool get enableAiCoaching;

  /// Protocol summary
  @override
  int? get eatingWindowStartHour;
  @override
  int? get eatingWindowStartMinute;
  @override
  int? get eatingWindowEndHour;
  @override
  int? get eatingWindowEndMinute;
  @override
  List<String> get activeConstraints;

  /// Create a copy of AiBrainUserContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainUserContextImplCopyWith<_$AiBrainUserContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiBrainHealthContext _$AiBrainHealthContextFromJson(Map<String, dynamic> json) {
  return _AiBrainHealthContext.fromJson(json);
}

/// @nodoc
mixin _$AiBrainHealthContext {
  /// Recovery score (0-100)
  int get recoveryScore => throw _privateConstructorUsedError;
  String get recoveryState => throw _privateConstructorUsedError;

  /// Strain score (0-21)
  double get strainScore => throw _privateConstructorUsedError;

  /// Sleep data
  double? get sleepDuration => throw _privateConstructorUsedError;
  int? get sleepQuality => throw _privateConstructorUsedError;

  /// Heart rate data
  int? get hrv => throw _privateConstructorUsedError;
  int? get restingHR => throw _privateConstructorUsedError;
  int? get hrvBaseline => throw _privateConstructorUsedError;
  int? get rhrBaseline => throw _privateConstructorUsedError;

  /// Activity data
  int get steps => throw _privateConstructorUsedError;
  int get activeEnergy => throw _privateConstructorUsedError;

  /// Subjective data
  int? get moodEnergy => throw _privateConstructorUsedError;
  int? get stress => throw _privateConstructorUsedError;
  int? get hunger => throw _privateConstructorUsedError;

  /// Current weight
  double? get weight => throw _privateConstructorUsedError;

  /// Data freshness
  DateTime? get lastHealthKitSync => throw _privateConstructorUsedError;

  /// Serializes this AiBrainHealthContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainHealthContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainHealthContextCopyWith<AiBrainHealthContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainHealthContextCopyWith<$Res> {
  factory $AiBrainHealthContextCopyWith(
    AiBrainHealthContext value,
    $Res Function(AiBrainHealthContext) then,
  ) = _$AiBrainHealthContextCopyWithImpl<$Res, AiBrainHealthContext>;
  @useResult
  $Res call({
    int recoveryScore,
    String recoveryState,
    double strainScore,
    double? sleepDuration,
    int? sleepQuality,
    int? hrv,
    int? restingHR,
    int? hrvBaseline,
    int? rhrBaseline,
    int steps,
    int activeEnergy,
    int? moodEnergy,
    int? stress,
    int? hunger,
    double? weight,
    DateTime? lastHealthKitSync,
  });
}

/// @nodoc
class _$AiBrainHealthContextCopyWithImpl<
  $Res,
  $Val extends AiBrainHealthContext
>
    implements $AiBrainHealthContextCopyWith<$Res> {
  _$AiBrainHealthContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainHealthContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recoveryScore = null,
    Object? recoveryState = null,
    Object? strainScore = null,
    Object? sleepDuration = freezed,
    Object? sleepQuality = freezed,
    Object? hrv = freezed,
    Object? restingHR = freezed,
    Object? hrvBaseline = freezed,
    Object? rhrBaseline = freezed,
    Object? steps = null,
    Object? activeEnergy = null,
    Object? moodEnergy = freezed,
    Object? stress = freezed,
    Object? hunger = freezed,
    Object? weight = freezed,
    Object? lastHealthKitSync = freezed,
  }) {
    return _then(
      _value.copyWith(
            recoveryScore: null == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int,
            recoveryState: null == recoveryState
                ? _value.recoveryState
                : recoveryState // ignore: cast_nullable_to_non_nullable
                      as String,
            strainScore: null == strainScore
                ? _value.strainScore
                : strainScore // ignore: cast_nullable_to_non_nullable
                      as double,
            sleepDuration: freezed == sleepDuration
                ? _value.sleepDuration
                : sleepDuration // ignore: cast_nullable_to_non_nullable
                      as double?,
            sleepQuality: freezed == sleepQuality
                ? _value.sleepQuality
                : sleepQuality // ignore: cast_nullable_to_non_nullable
                      as int?,
            hrv: freezed == hrv
                ? _value.hrv
                : hrv // ignore: cast_nullable_to_non_nullable
                      as int?,
            restingHR: freezed == restingHR
                ? _value.restingHR
                : restingHR // ignore: cast_nullable_to_non_nullable
                      as int?,
            hrvBaseline: freezed == hrvBaseline
                ? _value.hrvBaseline
                : hrvBaseline // ignore: cast_nullable_to_non_nullable
                      as int?,
            rhrBaseline: freezed == rhrBaseline
                ? _value.rhrBaseline
                : rhrBaseline // ignore: cast_nullable_to_non_nullable
                      as int?,
            steps: null == steps
                ? _value.steps
                : steps // ignore: cast_nullable_to_non_nullable
                      as int,
            activeEnergy: null == activeEnergy
                ? _value.activeEnergy
                : activeEnergy // ignore: cast_nullable_to_non_nullable
                      as int,
            moodEnergy: freezed == moodEnergy
                ? _value.moodEnergy
                : moodEnergy // ignore: cast_nullable_to_non_nullable
                      as int?,
            stress: freezed == stress
                ? _value.stress
                : stress // ignore: cast_nullable_to_non_nullable
                      as int?,
            hunger: freezed == hunger
                ? _value.hunger
                : hunger // ignore: cast_nullable_to_non_nullable
                      as int?,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double?,
            lastHealthKitSync: freezed == lastHealthKitSync
                ? _value.lastHealthKitSync
                : lastHealthKitSync // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainHealthContextImplCopyWith<$Res>
    implements $AiBrainHealthContextCopyWith<$Res> {
  factory _$$AiBrainHealthContextImplCopyWith(
    _$AiBrainHealthContextImpl value,
    $Res Function(_$AiBrainHealthContextImpl) then,
  ) = __$$AiBrainHealthContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int recoveryScore,
    String recoveryState,
    double strainScore,
    double? sleepDuration,
    int? sleepQuality,
    int? hrv,
    int? restingHR,
    int? hrvBaseline,
    int? rhrBaseline,
    int steps,
    int activeEnergy,
    int? moodEnergy,
    int? stress,
    int? hunger,
    double? weight,
    DateTime? lastHealthKitSync,
  });
}

/// @nodoc
class __$$AiBrainHealthContextImplCopyWithImpl<$Res>
    extends _$AiBrainHealthContextCopyWithImpl<$Res, _$AiBrainHealthContextImpl>
    implements _$$AiBrainHealthContextImplCopyWith<$Res> {
  __$$AiBrainHealthContextImplCopyWithImpl(
    _$AiBrainHealthContextImpl _value,
    $Res Function(_$AiBrainHealthContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainHealthContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recoveryScore = null,
    Object? recoveryState = null,
    Object? strainScore = null,
    Object? sleepDuration = freezed,
    Object? sleepQuality = freezed,
    Object? hrv = freezed,
    Object? restingHR = freezed,
    Object? hrvBaseline = freezed,
    Object? rhrBaseline = freezed,
    Object? steps = null,
    Object? activeEnergy = null,
    Object? moodEnergy = freezed,
    Object? stress = freezed,
    Object? hunger = freezed,
    Object? weight = freezed,
    Object? lastHealthKitSync = freezed,
  }) {
    return _then(
      _$AiBrainHealthContextImpl(
        recoveryScore: null == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as int,
        recoveryState: null == recoveryState
            ? _value.recoveryState
            : recoveryState // ignore: cast_nullable_to_non_nullable
                  as String,
        strainScore: null == strainScore
            ? _value.strainScore
            : strainScore // ignore: cast_nullable_to_non_nullable
                  as double,
        sleepDuration: freezed == sleepDuration
            ? _value.sleepDuration
            : sleepDuration // ignore: cast_nullable_to_non_nullable
                  as double?,
        sleepQuality: freezed == sleepQuality
            ? _value.sleepQuality
            : sleepQuality // ignore: cast_nullable_to_non_nullable
                  as int?,
        hrv: freezed == hrv
            ? _value.hrv
            : hrv // ignore: cast_nullable_to_non_nullable
                  as int?,
        restingHR: freezed == restingHR
            ? _value.restingHR
            : restingHR // ignore: cast_nullable_to_non_nullable
                  as int?,
        hrvBaseline: freezed == hrvBaseline
            ? _value.hrvBaseline
            : hrvBaseline // ignore: cast_nullable_to_non_nullable
                  as int?,
        rhrBaseline: freezed == rhrBaseline
            ? _value.rhrBaseline
            : rhrBaseline // ignore: cast_nullable_to_non_nullable
                  as int?,
        steps: null == steps
            ? _value.steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as int,
        activeEnergy: null == activeEnergy
            ? _value.activeEnergy
            : activeEnergy // ignore: cast_nullable_to_non_nullable
                  as int,
        moodEnergy: freezed == moodEnergy
            ? _value.moodEnergy
            : moodEnergy // ignore: cast_nullable_to_non_nullable
                  as int?,
        stress: freezed == stress
            ? _value.stress
            : stress // ignore: cast_nullable_to_non_nullable
                  as int?,
        hunger: freezed == hunger
            ? _value.hunger
            : hunger // ignore: cast_nullable_to_non_nullable
                  as int?,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double?,
        lastHealthKitSync: freezed == lastHealthKitSync
            ? _value.lastHealthKitSync
            : lastHealthKitSync // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainHealthContextImpl implements _AiBrainHealthContext {
  const _$AiBrainHealthContextImpl({
    this.recoveryScore = 50,
    this.recoveryState = 'moderate',
    this.strainScore = 0.0,
    this.sleepDuration,
    this.sleepQuality,
    this.hrv,
    this.restingHR,
    this.hrvBaseline,
    this.rhrBaseline,
    this.steps = 0,
    this.activeEnergy = 0,
    this.moodEnergy,
    this.stress,
    this.hunger,
    this.weight,
    this.lastHealthKitSync,
  });

  factory _$AiBrainHealthContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainHealthContextImplFromJson(json);

  /// Recovery score (0-100)
  @override
  @JsonKey()
  final int recoveryScore;
  @override
  @JsonKey()
  final String recoveryState;

  /// Strain score (0-21)
  @override
  @JsonKey()
  final double strainScore;

  /// Sleep data
  @override
  final double? sleepDuration;
  @override
  final int? sleepQuality;

  /// Heart rate data
  @override
  final int? hrv;
  @override
  final int? restingHR;
  @override
  final int? hrvBaseline;
  @override
  final int? rhrBaseline;

  /// Activity data
  @override
  @JsonKey()
  final int steps;
  @override
  @JsonKey()
  final int activeEnergy;

  /// Subjective data
  @override
  final int? moodEnergy;
  @override
  final int? stress;
  @override
  final int? hunger;

  /// Current weight
  @override
  final double? weight;

  /// Data freshness
  @override
  final DateTime? lastHealthKitSync;

  @override
  String toString() {
    return 'AiBrainHealthContext(recoveryScore: $recoveryScore, recoveryState: $recoveryState, strainScore: $strainScore, sleepDuration: $sleepDuration, sleepQuality: $sleepQuality, hrv: $hrv, restingHR: $restingHR, hrvBaseline: $hrvBaseline, rhrBaseline: $rhrBaseline, steps: $steps, activeEnergy: $activeEnergy, moodEnergy: $moodEnergy, stress: $stress, hunger: $hunger, weight: $weight, lastHealthKitSync: $lastHealthKitSync)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainHealthContextImpl &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.recoveryState, recoveryState) ||
                other.recoveryState == recoveryState) &&
            (identical(other.strainScore, strainScore) ||
                other.strainScore == strainScore) &&
            (identical(other.sleepDuration, sleepDuration) ||
                other.sleepDuration == sleepDuration) &&
            (identical(other.sleepQuality, sleepQuality) ||
                other.sleepQuality == sleepQuality) &&
            (identical(other.hrv, hrv) || other.hrv == hrv) &&
            (identical(other.restingHR, restingHR) ||
                other.restingHR == restingHR) &&
            (identical(other.hrvBaseline, hrvBaseline) ||
                other.hrvBaseline == hrvBaseline) &&
            (identical(other.rhrBaseline, rhrBaseline) ||
                other.rhrBaseline == rhrBaseline) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.activeEnergy, activeEnergy) ||
                other.activeEnergy == activeEnergy) &&
            (identical(other.moodEnergy, moodEnergy) ||
                other.moodEnergy == moodEnergy) &&
            (identical(other.stress, stress) || other.stress == stress) &&
            (identical(other.hunger, hunger) || other.hunger == hunger) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.lastHealthKitSync, lastHealthKitSync) ||
                other.lastHealthKitSync == lastHealthKitSync));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    recoveryScore,
    recoveryState,
    strainScore,
    sleepDuration,
    sleepQuality,
    hrv,
    restingHR,
    hrvBaseline,
    rhrBaseline,
    steps,
    activeEnergy,
    moodEnergy,
    stress,
    hunger,
    weight,
    lastHealthKitSync,
  );

  /// Create a copy of AiBrainHealthContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainHealthContextImplCopyWith<_$AiBrainHealthContextImpl>
  get copyWith =>
      __$$AiBrainHealthContextImplCopyWithImpl<_$AiBrainHealthContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainHealthContextImplToJson(this);
  }
}

abstract class _AiBrainHealthContext implements AiBrainHealthContext {
  const factory _AiBrainHealthContext({
    final int recoveryScore,
    final String recoveryState,
    final double strainScore,
    final double? sleepDuration,
    final int? sleepQuality,
    final int? hrv,
    final int? restingHR,
    final int? hrvBaseline,
    final int? rhrBaseline,
    final int steps,
    final int activeEnergy,
    final int? moodEnergy,
    final int? stress,
    final int? hunger,
    final double? weight,
    final DateTime? lastHealthKitSync,
  }) = _$AiBrainHealthContextImpl;

  factory _AiBrainHealthContext.fromJson(Map<String, dynamic> json) =
      _$AiBrainHealthContextImpl.fromJson;

  /// Recovery score (0-100)
  @override
  int get recoveryScore;
  @override
  String get recoveryState;

  /// Strain score (0-21)
  @override
  double get strainScore;

  /// Sleep data
  @override
  double? get sleepDuration;
  @override
  int? get sleepQuality;

  /// Heart rate data
  @override
  int? get hrv;
  @override
  int? get restingHR;
  @override
  int? get hrvBaseline;
  @override
  int? get rhrBaseline;

  /// Activity data
  @override
  int get steps;
  @override
  int get activeEnergy;

  /// Subjective data
  @override
  int? get moodEnergy;
  @override
  int? get stress;
  @override
  int? get hunger;

  /// Current weight
  @override
  double? get weight;

  /// Data freshness
  @override
  DateTime? get lastHealthKitSync;

  /// Create a copy of AiBrainHealthContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainHealthContextImplCopyWith<_$AiBrainHealthContextImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AiBrainTrendsContext _$AiBrainTrendsContextFromJson(Map<String, dynamic> json) {
  return _AiBrainTrendsContext.fromJson(json);
}

/// @nodoc
mixin _$AiBrainTrendsContext {
  /// Recovery scores for last 7 days
  List<int> get recoveryScores => throw _privateConstructorUsedError;

  /// Strain scores for last 7 days
  List<double> get strainScores => throw _privateConstructorUsedError;

  /// Sleep durations for last 7 days (hours)
  List<double> get sleepDurations => throw _privateConstructorUsedError;

  /// HRV values for last 7 days
  List<int> get hrvValues => throw _privateConstructorUsedError;

  /// RHR values for last 7 days
  List<int> get rhrValues => throw _privateConstructorUsedError;

  /// Steps for last 7 days
  List<int> get stepsValues => throw _privateConstructorUsedError;

  /// Weights for last 7 days (may have gaps)
  List<double?> get weights => throw _privateConstructorUsedError;

  /// Calculated averages
  double? get avgRecovery => throw _privateConstructorUsedError;
  double? get avgStrain => throw _privateConstructorUsedError;
  double? get avgSleep => throw _privateConstructorUsedError;
  double? get avgHrv => throw _privateConstructorUsedError;
  double? get avgRhr => throw _privateConstructorUsedError;

  /// Trend directions
  String get recoveryTrend => throw _privateConstructorUsedError;
  String get strainTrend => throw _privateConstructorUsedError;
  String get sleepTrend => throw _privateConstructorUsedError;

  /// Serializes this AiBrainTrendsContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainTrendsContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainTrendsContextCopyWith<AiBrainTrendsContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainTrendsContextCopyWith<$Res> {
  factory $AiBrainTrendsContextCopyWith(
    AiBrainTrendsContext value,
    $Res Function(AiBrainTrendsContext) then,
  ) = _$AiBrainTrendsContextCopyWithImpl<$Res, AiBrainTrendsContext>;
  @useResult
  $Res call({
    List<int> recoveryScores,
    List<double> strainScores,
    List<double> sleepDurations,
    List<int> hrvValues,
    List<int> rhrValues,
    List<int> stepsValues,
    List<double?> weights,
    double? avgRecovery,
    double? avgStrain,
    double? avgSleep,
    double? avgHrv,
    double? avgRhr,
    String recoveryTrend,
    String strainTrend,
    String sleepTrend,
  });
}

/// @nodoc
class _$AiBrainTrendsContextCopyWithImpl<
  $Res,
  $Val extends AiBrainTrendsContext
>
    implements $AiBrainTrendsContextCopyWith<$Res> {
  _$AiBrainTrendsContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainTrendsContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recoveryScores = null,
    Object? strainScores = null,
    Object? sleepDurations = null,
    Object? hrvValues = null,
    Object? rhrValues = null,
    Object? stepsValues = null,
    Object? weights = null,
    Object? avgRecovery = freezed,
    Object? avgStrain = freezed,
    Object? avgSleep = freezed,
    Object? avgHrv = freezed,
    Object? avgRhr = freezed,
    Object? recoveryTrend = null,
    Object? strainTrend = null,
    Object? sleepTrend = null,
  }) {
    return _then(
      _value.copyWith(
            recoveryScores: null == recoveryScores
                ? _value.recoveryScores
                : recoveryScores // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            strainScores: null == strainScores
                ? _value.strainScores
                : strainScores // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            sleepDurations: null == sleepDurations
                ? _value.sleepDurations
                : sleepDurations // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            hrvValues: null == hrvValues
                ? _value.hrvValues
                : hrvValues // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            rhrValues: null == rhrValues
                ? _value.rhrValues
                : rhrValues // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            stepsValues: null == stepsValues
                ? _value.stepsValues
                : stepsValues // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            weights: null == weights
                ? _value.weights
                : weights // ignore: cast_nullable_to_non_nullable
                      as List<double?>,
            avgRecovery: freezed == avgRecovery
                ? _value.avgRecovery
                : avgRecovery // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgStrain: freezed == avgStrain
                ? _value.avgStrain
                : avgStrain // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgSleep: freezed == avgSleep
                ? _value.avgSleep
                : avgSleep // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgHrv: freezed == avgHrv
                ? _value.avgHrv
                : avgHrv // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgRhr: freezed == avgRhr
                ? _value.avgRhr
                : avgRhr // ignore: cast_nullable_to_non_nullable
                      as double?,
            recoveryTrend: null == recoveryTrend
                ? _value.recoveryTrend
                : recoveryTrend // ignore: cast_nullable_to_non_nullable
                      as String,
            strainTrend: null == strainTrend
                ? _value.strainTrend
                : strainTrend // ignore: cast_nullable_to_non_nullable
                      as String,
            sleepTrend: null == sleepTrend
                ? _value.sleepTrend
                : sleepTrend // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainTrendsContextImplCopyWith<$Res>
    implements $AiBrainTrendsContextCopyWith<$Res> {
  factory _$$AiBrainTrendsContextImplCopyWith(
    _$AiBrainTrendsContextImpl value,
    $Res Function(_$AiBrainTrendsContextImpl) then,
  ) = __$$AiBrainTrendsContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<int> recoveryScores,
    List<double> strainScores,
    List<double> sleepDurations,
    List<int> hrvValues,
    List<int> rhrValues,
    List<int> stepsValues,
    List<double?> weights,
    double? avgRecovery,
    double? avgStrain,
    double? avgSleep,
    double? avgHrv,
    double? avgRhr,
    String recoveryTrend,
    String strainTrend,
    String sleepTrend,
  });
}

/// @nodoc
class __$$AiBrainTrendsContextImplCopyWithImpl<$Res>
    extends _$AiBrainTrendsContextCopyWithImpl<$Res, _$AiBrainTrendsContextImpl>
    implements _$$AiBrainTrendsContextImplCopyWith<$Res> {
  __$$AiBrainTrendsContextImplCopyWithImpl(
    _$AiBrainTrendsContextImpl _value,
    $Res Function(_$AiBrainTrendsContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainTrendsContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recoveryScores = null,
    Object? strainScores = null,
    Object? sleepDurations = null,
    Object? hrvValues = null,
    Object? rhrValues = null,
    Object? stepsValues = null,
    Object? weights = null,
    Object? avgRecovery = freezed,
    Object? avgStrain = freezed,
    Object? avgSleep = freezed,
    Object? avgHrv = freezed,
    Object? avgRhr = freezed,
    Object? recoveryTrend = null,
    Object? strainTrend = null,
    Object? sleepTrend = null,
  }) {
    return _then(
      _$AiBrainTrendsContextImpl(
        recoveryScores: null == recoveryScores
            ? _value._recoveryScores
            : recoveryScores // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        strainScores: null == strainScores
            ? _value._strainScores
            : strainScores // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        sleepDurations: null == sleepDurations
            ? _value._sleepDurations
            : sleepDurations // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        hrvValues: null == hrvValues
            ? _value._hrvValues
            : hrvValues // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        rhrValues: null == rhrValues
            ? _value._rhrValues
            : rhrValues // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        stepsValues: null == stepsValues
            ? _value._stepsValues
            : stepsValues // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        weights: null == weights
            ? _value._weights
            : weights // ignore: cast_nullable_to_non_nullable
                  as List<double?>,
        avgRecovery: freezed == avgRecovery
            ? _value.avgRecovery
            : avgRecovery // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgStrain: freezed == avgStrain
            ? _value.avgStrain
            : avgStrain // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgSleep: freezed == avgSleep
            ? _value.avgSleep
            : avgSleep // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgHrv: freezed == avgHrv
            ? _value.avgHrv
            : avgHrv // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgRhr: freezed == avgRhr
            ? _value.avgRhr
            : avgRhr // ignore: cast_nullable_to_non_nullable
                  as double?,
        recoveryTrend: null == recoveryTrend
            ? _value.recoveryTrend
            : recoveryTrend // ignore: cast_nullable_to_non_nullable
                  as String,
        strainTrend: null == strainTrend
            ? _value.strainTrend
            : strainTrend // ignore: cast_nullable_to_non_nullable
                  as String,
        sleepTrend: null == sleepTrend
            ? _value.sleepTrend
            : sleepTrend // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainTrendsContextImpl implements _AiBrainTrendsContext {
  const _$AiBrainTrendsContextImpl({
    final List<int> recoveryScores = const [],
    final List<double> strainScores = const [],
    final List<double> sleepDurations = const [],
    final List<int> hrvValues = const [],
    final List<int> rhrValues = const [],
    final List<int> stepsValues = const [],
    final List<double?> weights = const [],
    this.avgRecovery,
    this.avgStrain,
    this.avgSleep,
    this.avgHrv,
    this.avgRhr,
    this.recoveryTrend = 'stable',
    this.strainTrend = 'stable',
    this.sleepTrend = 'stable',
  }) : _recoveryScores = recoveryScores,
       _strainScores = strainScores,
       _sleepDurations = sleepDurations,
       _hrvValues = hrvValues,
       _rhrValues = rhrValues,
       _stepsValues = stepsValues,
       _weights = weights;

  factory _$AiBrainTrendsContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainTrendsContextImplFromJson(json);

  /// Recovery scores for last 7 days
  final List<int> _recoveryScores;

  /// Recovery scores for last 7 days
  @override
  @JsonKey()
  List<int> get recoveryScores {
    if (_recoveryScores is EqualUnmodifiableListView) return _recoveryScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recoveryScores);
  }

  /// Strain scores for last 7 days
  final List<double> _strainScores;

  /// Strain scores for last 7 days
  @override
  @JsonKey()
  List<double> get strainScores {
    if (_strainScores is EqualUnmodifiableListView) return _strainScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strainScores);
  }

  /// Sleep durations for last 7 days (hours)
  final List<double> _sleepDurations;

  /// Sleep durations for last 7 days (hours)
  @override
  @JsonKey()
  List<double> get sleepDurations {
    if (_sleepDurations is EqualUnmodifiableListView) return _sleepDurations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sleepDurations);
  }

  /// HRV values for last 7 days
  final List<int> _hrvValues;

  /// HRV values for last 7 days
  @override
  @JsonKey()
  List<int> get hrvValues {
    if (_hrvValues is EqualUnmodifiableListView) return _hrvValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hrvValues);
  }

  /// RHR values for last 7 days
  final List<int> _rhrValues;

  /// RHR values for last 7 days
  @override
  @JsonKey()
  List<int> get rhrValues {
    if (_rhrValues is EqualUnmodifiableListView) return _rhrValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rhrValues);
  }

  /// Steps for last 7 days
  final List<int> _stepsValues;

  /// Steps for last 7 days
  @override
  @JsonKey()
  List<int> get stepsValues {
    if (_stepsValues is EqualUnmodifiableListView) return _stepsValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stepsValues);
  }

  /// Weights for last 7 days (may have gaps)
  final List<double?> _weights;

  /// Weights for last 7 days (may have gaps)
  @override
  @JsonKey()
  List<double?> get weights {
    if (_weights is EqualUnmodifiableListView) return _weights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weights);
  }

  /// Calculated averages
  @override
  final double? avgRecovery;
  @override
  final double? avgStrain;
  @override
  final double? avgSleep;
  @override
  final double? avgHrv;
  @override
  final double? avgRhr;

  /// Trend directions
  @override
  @JsonKey()
  final String recoveryTrend;
  @override
  @JsonKey()
  final String strainTrend;
  @override
  @JsonKey()
  final String sleepTrend;

  @override
  String toString() {
    return 'AiBrainTrendsContext(recoveryScores: $recoveryScores, strainScores: $strainScores, sleepDurations: $sleepDurations, hrvValues: $hrvValues, rhrValues: $rhrValues, stepsValues: $stepsValues, weights: $weights, avgRecovery: $avgRecovery, avgStrain: $avgStrain, avgSleep: $avgSleep, avgHrv: $avgHrv, avgRhr: $avgRhr, recoveryTrend: $recoveryTrend, strainTrend: $strainTrend, sleepTrend: $sleepTrend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainTrendsContextImpl &&
            const DeepCollectionEquality().equals(
              other._recoveryScores,
              _recoveryScores,
            ) &&
            const DeepCollectionEquality().equals(
              other._strainScores,
              _strainScores,
            ) &&
            const DeepCollectionEquality().equals(
              other._sleepDurations,
              _sleepDurations,
            ) &&
            const DeepCollectionEquality().equals(
              other._hrvValues,
              _hrvValues,
            ) &&
            const DeepCollectionEquality().equals(
              other._rhrValues,
              _rhrValues,
            ) &&
            const DeepCollectionEquality().equals(
              other._stepsValues,
              _stepsValues,
            ) &&
            const DeepCollectionEquality().equals(other._weights, _weights) &&
            (identical(other.avgRecovery, avgRecovery) ||
                other.avgRecovery == avgRecovery) &&
            (identical(other.avgStrain, avgStrain) ||
                other.avgStrain == avgStrain) &&
            (identical(other.avgSleep, avgSleep) ||
                other.avgSleep == avgSleep) &&
            (identical(other.avgHrv, avgHrv) || other.avgHrv == avgHrv) &&
            (identical(other.avgRhr, avgRhr) || other.avgRhr == avgRhr) &&
            (identical(other.recoveryTrend, recoveryTrend) ||
                other.recoveryTrend == recoveryTrend) &&
            (identical(other.strainTrend, strainTrend) ||
                other.strainTrend == strainTrend) &&
            (identical(other.sleepTrend, sleepTrend) ||
                other.sleepTrend == sleepTrend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_recoveryScores),
    const DeepCollectionEquality().hash(_strainScores),
    const DeepCollectionEquality().hash(_sleepDurations),
    const DeepCollectionEquality().hash(_hrvValues),
    const DeepCollectionEquality().hash(_rhrValues),
    const DeepCollectionEquality().hash(_stepsValues),
    const DeepCollectionEquality().hash(_weights),
    avgRecovery,
    avgStrain,
    avgSleep,
    avgHrv,
    avgRhr,
    recoveryTrend,
    strainTrend,
    sleepTrend,
  );

  /// Create a copy of AiBrainTrendsContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainTrendsContextImplCopyWith<_$AiBrainTrendsContextImpl>
  get copyWith =>
      __$$AiBrainTrendsContextImplCopyWithImpl<_$AiBrainTrendsContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainTrendsContextImplToJson(this);
  }
}

abstract class _AiBrainTrendsContext implements AiBrainTrendsContext {
  const factory _AiBrainTrendsContext({
    final List<int> recoveryScores,
    final List<double> strainScores,
    final List<double> sleepDurations,
    final List<int> hrvValues,
    final List<int> rhrValues,
    final List<int> stepsValues,
    final List<double?> weights,
    final double? avgRecovery,
    final double? avgStrain,
    final double? avgSleep,
    final double? avgHrv,
    final double? avgRhr,
    final String recoveryTrend,
    final String strainTrend,
    final String sleepTrend,
  }) = _$AiBrainTrendsContextImpl;

  factory _AiBrainTrendsContext.fromJson(Map<String, dynamic> json) =
      _$AiBrainTrendsContextImpl.fromJson;

  /// Recovery scores for last 7 days
  @override
  List<int> get recoveryScores;

  /// Strain scores for last 7 days
  @override
  List<double> get strainScores;

  /// Sleep durations for last 7 days (hours)
  @override
  List<double> get sleepDurations;

  /// HRV values for last 7 days
  @override
  List<int> get hrvValues;

  /// RHR values for last 7 days
  @override
  List<int> get rhrValues;

  /// Steps for last 7 days
  @override
  List<int> get stepsValues;

  /// Weights for last 7 days (may have gaps)
  @override
  List<double?> get weights;

  /// Calculated averages
  @override
  double? get avgRecovery;
  @override
  double? get avgStrain;
  @override
  double? get avgSleep;
  @override
  double? get avgHrv;
  @override
  double? get avgRhr;

  /// Trend directions
  @override
  String get recoveryTrend;
  @override
  String get strainTrend;
  @override
  String get sleepTrend;

  /// Create a copy of AiBrainTrendsContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainTrendsContextImplCopyWith<_$AiBrainTrendsContextImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AiBrainNutritionContext _$AiBrainNutritionContextFromJson(
  Map<String, dynamic> json,
) {
  return _AiBrainNutritionContext.fromJson(json);
}

/// @nodoc
mixin _$AiBrainNutritionContext {
  /// Today's consumed nutrition
  int get caloriesConsumed => throw _privateConstructorUsedError;
  int get proteinConsumed => throw _privateConstructorUsedError;
  int get carbsConsumed => throw _privateConstructorUsedError;
  int get fatConsumed => throw _privateConstructorUsedError;

  /// Today's targets
  int get caloriesTarget => throw _privateConstructorUsedError;
  int get proteinTarget => throw _privateConstructorUsedError;

  /// Meals logged today
  int get mealsLoggedToday => throw _privateConstructorUsedError;

  /// Is within eating window?
  bool get isInEatingWindow => throw _privateConstructorUsedError;

  /// Time until eating window opens/closes
  int? get minutesUntilWindowChange => throw _privateConstructorUsedError;

  /// Last meal time
  DateTime? get lastMealTime => throw _privateConstructorUsedError;

  /// Serializes this AiBrainNutritionContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainNutritionContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainNutritionContextCopyWith<AiBrainNutritionContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainNutritionContextCopyWith<$Res> {
  factory $AiBrainNutritionContextCopyWith(
    AiBrainNutritionContext value,
    $Res Function(AiBrainNutritionContext) then,
  ) = _$AiBrainNutritionContextCopyWithImpl<$Res, AiBrainNutritionContext>;
  @useResult
  $Res call({
    int caloriesConsumed,
    int proteinConsumed,
    int carbsConsumed,
    int fatConsumed,
    int caloriesTarget,
    int proteinTarget,
    int mealsLoggedToday,
    bool isInEatingWindow,
    int? minutesUntilWindowChange,
    DateTime? lastMealTime,
  });
}

/// @nodoc
class _$AiBrainNutritionContextCopyWithImpl<
  $Res,
  $Val extends AiBrainNutritionContext
>
    implements $AiBrainNutritionContextCopyWith<$Res> {
  _$AiBrainNutritionContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainNutritionContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caloriesConsumed = null,
    Object? proteinConsumed = null,
    Object? carbsConsumed = null,
    Object? fatConsumed = null,
    Object? caloriesTarget = null,
    Object? proteinTarget = null,
    Object? mealsLoggedToday = null,
    Object? isInEatingWindow = null,
    Object? minutesUntilWindowChange = freezed,
    Object? lastMealTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            caloriesConsumed: null == caloriesConsumed
                ? _value.caloriesConsumed
                : caloriesConsumed // ignore: cast_nullable_to_non_nullable
                      as int,
            proteinConsumed: null == proteinConsumed
                ? _value.proteinConsumed
                : proteinConsumed // ignore: cast_nullable_to_non_nullable
                      as int,
            carbsConsumed: null == carbsConsumed
                ? _value.carbsConsumed
                : carbsConsumed // ignore: cast_nullable_to_non_nullable
                      as int,
            fatConsumed: null == fatConsumed
                ? _value.fatConsumed
                : fatConsumed // ignore: cast_nullable_to_non_nullable
                      as int,
            caloriesTarget: null == caloriesTarget
                ? _value.caloriesTarget
                : caloriesTarget // ignore: cast_nullable_to_non_nullable
                      as int,
            proteinTarget: null == proteinTarget
                ? _value.proteinTarget
                : proteinTarget // ignore: cast_nullable_to_non_nullable
                      as int,
            mealsLoggedToday: null == mealsLoggedToday
                ? _value.mealsLoggedToday
                : mealsLoggedToday // ignore: cast_nullable_to_non_nullable
                      as int,
            isInEatingWindow: null == isInEatingWindow
                ? _value.isInEatingWindow
                : isInEatingWindow // ignore: cast_nullable_to_non_nullable
                      as bool,
            minutesUntilWindowChange: freezed == minutesUntilWindowChange
                ? _value.minutesUntilWindowChange
                : minutesUntilWindowChange // ignore: cast_nullable_to_non_nullable
                      as int?,
            lastMealTime: freezed == lastMealTime
                ? _value.lastMealTime
                : lastMealTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainNutritionContextImplCopyWith<$Res>
    implements $AiBrainNutritionContextCopyWith<$Res> {
  factory _$$AiBrainNutritionContextImplCopyWith(
    _$AiBrainNutritionContextImpl value,
    $Res Function(_$AiBrainNutritionContextImpl) then,
  ) = __$$AiBrainNutritionContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int caloriesConsumed,
    int proteinConsumed,
    int carbsConsumed,
    int fatConsumed,
    int caloriesTarget,
    int proteinTarget,
    int mealsLoggedToday,
    bool isInEatingWindow,
    int? minutesUntilWindowChange,
    DateTime? lastMealTime,
  });
}

/// @nodoc
class __$$AiBrainNutritionContextImplCopyWithImpl<$Res>
    extends
        _$AiBrainNutritionContextCopyWithImpl<
          $Res,
          _$AiBrainNutritionContextImpl
        >
    implements _$$AiBrainNutritionContextImplCopyWith<$Res> {
  __$$AiBrainNutritionContextImplCopyWithImpl(
    _$AiBrainNutritionContextImpl _value,
    $Res Function(_$AiBrainNutritionContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainNutritionContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caloriesConsumed = null,
    Object? proteinConsumed = null,
    Object? carbsConsumed = null,
    Object? fatConsumed = null,
    Object? caloriesTarget = null,
    Object? proteinTarget = null,
    Object? mealsLoggedToday = null,
    Object? isInEatingWindow = null,
    Object? minutesUntilWindowChange = freezed,
    Object? lastMealTime = freezed,
  }) {
    return _then(
      _$AiBrainNutritionContextImpl(
        caloriesConsumed: null == caloriesConsumed
            ? _value.caloriesConsumed
            : caloriesConsumed // ignore: cast_nullable_to_non_nullable
                  as int,
        proteinConsumed: null == proteinConsumed
            ? _value.proteinConsumed
            : proteinConsumed // ignore: cast_nullable_to_non_nullable
                  as int,
        carbsConsumed: null == carbsConsumed
            ? _value.carbsConsumed
            : carbsConsumed // ignore: cast_nullable_to_non_nullable
                  as int,
        fatConsumed: null == fatConsumed
            ? _value.fatConsumed
            : fatConsumed // ignore: cast_nullable_to_non_nullable
                  as int,
        caloriesTarget: null == caloriesTarget
            ? _value.caloriesTarget
            : caloriesTarget // ignore: cast_nullable_to_non_nullable
                  as int,
        proteinTarget: null == proteinTarget
            ? _value.proteinTarget
            : proteinTarget // ignore: cast_nullable_to_non_nullable
                  as int,
        mealsLoggedToday: null == mealsLoggedToday
            ? _value.mealsLoggedToday
            : mealsLoggedToday // ignore: cast_nullable_to_non_nullable
                  as int,
        isInEatingWindow: null == isInEatingWindow
            ? _value.isInEatingWindow
            : isInEatingWindow // ignore: cast_nullable_to_non_nullable
                  as bool,
        minutesUntilWindowChange: freezed == minutesUntilWindowChange
            ? _value.minutesUntilWindowChange
            : minutesUntilWindowChange // ignore: cast_nullable_to_non_nullable
                  as int?,
        lastMealTime: freezed == lastMealTime
            ? _value.lastMealTime
            : lastMealTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainNutritionContextImpl extends _AiBrainNutritionContext {
  const _$AiBrainNutritionContextImpl({
    this.caloriesConsumed = 0,
    this.proteinConsumed = 0,
    this.carbsConsumed = 0,
    this.fatConsumed = 0,
    this.caloriesTarget = 2000,
    this.proteinTarget = 120,
    this.mealsLoggedToday = 0,
    this.isInEatingWindow = true,
    this.minutesUntilWindowChange,
    this.lastMealTime,
  }) : super._();

  factory _$AiBrainNutritionContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainNutritionContextImplFromJson(json);

  /// Today's consumed nutrition
  @override
  @JsonKey()
  final int caloriesConsumed;
  @override
  @JsonKey()
  final int proteinConsumed;
  @override
  @JsonKey()
  final int carbsConsumed;
  @override
  @JsonKey()
  final int fatConsumed;

  /// Today's targets
  @override
  @JsonKey()
  final int caloriesTarget;
  @override
  @JsonKey()
  final int proteinTarget;

  /// Meals logged today
  @override
  @JsonKey()
  final int mealsLoggedToday;

  /// Is within eating window?
  @override
  @JsonKey()
  final bool isInEatingWindow;

  /// Time until eating window opens/closes
  @override
  final int? minutesUntilWindowChange;

  /// Last meal time
  @override
  final DateTime? lastMealTime;

  @override
  String toString() {
    return 'AiBrainNutritionContext(caloriesConsumed: $caloriesConsumed, proteinConsumed: $proteinConsumed, carbsConsumed: $carbsConsumed, fatConsumed: $fatConsumed, caloriesTarget: $caloriesTarget, proteinTarget: $proteinTarget, mealsLoggedToday: $mealsLoggedToday, isInEatingWindow: $isInEatingWindow, minutesUntilWindowChange: $minutesUntilWindowChange, lastMealTime: $lastMealTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainNutritionContextImpl &&
            (identical(other.caloriesConsumed, caloriesConsumed) ||
                other.caloriesConsumed == caloriesConsumed) &&
            (identical(other.proteinConsumed, proteinConsumed) ||
                other.proteinConsumed == proteinConsumed) &&
            (identical(other.carbsConsumed, carbsConsumed) ||
                other.carbsConsumed == carbsConsumed) &&
            (identical(other.fatConsumed, fatConsumed) ||
                other.fatConsumed == fatConsumed) &&
            (identical(other.caloriesTarget, caloriesTarget) ||
                other.caloriesTarget == caloriesTarget) &&
            (identical(other.proteinTarget, proteinTarget) ||
                other.proteinTarget == proteinTarget) &&
            (identical(other.mealsLoggedToday, mealsLoggedToday) ||
                other.mealsLoggedToday == mealsLoggedToday) &&
            (identical(other.isInEatingWindow, isInEatingWindow) ||
                other.isInEatingWindow == isInEatingWindow) &&
            (identical(
                  other.minutesUntilWindowChange,
                  minutesUntilWindowChange,
                ) ||
                other.minutesUntilWindowChange == minutesUntilWindowChange) &&
            (identical(other.lastMealTime, lastMealTime) ||
                other.lastMealTime == lastMealTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    caloriesConsumed,
    proteinConsumed,
    carbsConsumed,
    fatConsumed,
    caloriesTarget,
    proteinTarget,
    mealsLoggedToday,
    isInEatingWindow,
    minutesUntilWindowChange,
    lastMealTime,
  );

  /// Create a copy of AiBrainNutritionContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainNutritionContextImplCopyWith<_$AiBrainNutritionContextImpl>
  get copyWith =>
      __$$AiBrainNutritionContextImplCopyWithImpl<
        _$AiBrainNutritionContextImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainNutritionContextImplToJson(this);
  }
}

abstract class _AiBrainNutritionContext extends AiBrainNutritionContext {
  const factory _AiBrainNutritionContext({
    final int caloriesConsumed,
    final int proteinConsumed,
    final int carbsConsumed,
    final int fatConsumed,
    final int caloriesTarget,
    final int proteinTarget,
    final int mealsLoggedToday,
    final bool isInEatingWindow,
    final int? minutesUntilWindowChange,
    final DateTime? lastMealTime,
  }) = _$AiBrainNutritionContextImpl;
  const _AiBrainNutritionContext._() : super._();

  factory _AiBrainNutritionContext.fromJson(Map<String, dynamic> json) =
      _$AiBrainNutritionContextImpl.fromJson;

  /// Today's consumed nutrition
  @override
  int get caloriesConsumed;
  @override
  int get proteinConsumed;
  @override
  int get carbsConsumed;
  @override
  int get fatConsumed;

  /// Today's targets
  @override
  int get caloriesTarget;
  @override
  int get proteinTarget;

  /// Meals logged today
  @override
  int get mealsLoggedToday;

  /// Is within eating window?
  @override
  bool get isInEatingWindow;

  /// Time until eating window opens/closes
  @override
  int? get minutesUntilWindowChange;

  /// Last meal time
  @override
  DateTime? get lastMealTime;

  /// Create a copy of AiBrainNutritionContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainNutritionContextImplCopyWith<_$AiBrainNutritionContextImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AiBrainPlansContext _$AiBrainPlansContextFromJson(Map<String, dynamic> json) {
  return _AiBrainPlansContext.fromJson(json);
}

/// @nodoc
mixin _$AiBrainPlansContext {
  /// Active meal plan summary
  AiBrainMealPlanSummary? get mealPlan => throw _privateConstructorUsedError;

  /// Active workout plan summary
  AiBrainWorkoutPlanSummary? get workoutPlan =>
      throw _privateConstructorUsedError;

  /// Pending changes awaiting approval
  List<AiBrainPendingChange> get pendingChanges =>
      throw _privateConstructorUsedError;

  /// Master plan status
  String? get masterPlanStatus => throw _privateConstructorUsedError;
  String? get masterPlanId => throw _privateConstructorUsedError;

  /// Serializes this AiBrainPlansContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainPlansContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainPlansContextCopyWith<AiBrainPlansContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainPlansContextCopyWith<$Res> {
  factory $AiBrainPlansContextCopyWith(
    AiBrainPlansContext value,
    $Res Function(AiBrainPlansContext) then,
  ) = _$AiBrainPlansContextCopyWithImpl<$Res, AiBrainPlansContext>;
  @useResult
  $Res call({
    AiBrainMealPlanSummary? mealPlan,
    AiBrainWorkoutPlanSummary? workoutPlan,
    List<AiBrainPendingChange> pendingChanges,
    String? masterPlanStatus,
    String? masterPlanId,
  });

  $AiBrainMealPlanSummaryCopyWith<$Res>? get mealPlan;
  $AiBrainWorkoutPlanSummaryCopyWith<$Res>? get workoutPlan;
}

/// @nodoc
class _$AiBrainPlansContextCopyWithImpl<$Res, $Val extends AiBrainPlansContext>
    implements $AiBrainPlansContextCopyWith<$Res> {
  _$AiBrainPlansContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainPlansContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealPlan = freezed,
    Object? workoutPlan = freezed,
    Object? pendingChanges = null,
    Object? masterPlanStatus = freezed,
    Object? masterPlanId = freezed,
  }) {
    return _then(
      _value.copyWith(
            mealPlan: freezed == mealPlan
                ? _value.mealPlan
                : mealPlan // ignore: cast_nullable_to_non_nullable
                      as AiBrainMealPlanSummary?,
            workoutPlan: freezed == workoutPlan
                ? _value.workoutPlan
                : workoutPlan // ignore: cast_nullable_to_non_nullable
                      as AiBrainWorkoutPlanSummary?,
            pendingChanges: null == pendingChanges
                ? _value.pendingChanges
                : pendingChanges // ignore: cast_nullable_to_non_nullable
                      as List<AiBrainPendingChange>,
            masterPlanStatus: freezed == masterPlanStatus
                ? _value.masterPlanStatus
                : masterPlanStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            masterPlanId: freezed == masterPlanId
                ? _value.masterPlanId
                : masterPlanId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of AiBrainPlansContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiBrainMealPlanSummaryCopyWith<$Res>? get mealPlan {
    if (_value.mealPlan == null) {
      return null;
    }

    return $AiBrainMealPlanSummaryCopyWith<$Res>(_value.mealPlan!, (value) {
      return _then(_value.copyWith(mealPlan: value) as $Val);
    });
  }

  /// Create a copy of AiBrainPlansContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiBrainWorkoutPlanSummaryCopyWith<$Res>? get workoutPlan {
    if (_value.workoutPlan == null) {
      return null;
    }

    return $AiBrainWorkoutPlanSummaryCopyWith<$Res>(_value.workoutPlan!, (
      value,
    ) {
      return _then(_value.copyWith(workoutPlan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AiBrainPlansContextImplCopyWith<$Res>
    implements $AiBrainPlansContextCopyWith<$Res> {
  factory _$$AiBrainPlansContextImplCopyWith(
    _$AiBrainPlansContextImpl value,
    $Res Function(_$AiBrainPlansContextImpl) then,
  ) = __$$AiBrainPlansContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AiBrainMealPlanSummary? mealPlan,
    AiBrainWorkoutPlanSummary? workoutPlan,
    List<AiBrainPendingChange> pendingChanges,
    String? masterPlanStatus,
    String? masterPlanId,
  });

  @override
  $AiBrainMealPlanSummaryCopyWith<$Res>? get mealPlan;
  @override
  $AiBrainWorkoutPlanSummaryCopyWith<$Res>? get workoutPlan;
}

/// @nodoc
class __$$AiBrainPlansContextImplCopyWithImpl<$Res>
    extends _$AiBrainPlansContextCopyWithImpl<$Res, _$AiBrainPlansContextImpl>
    implements _$$AiBrainPlansContextImplCopyWith<$Res> {
  __$$AiBrainPlansContextImplCopyWithImpl(
    _$AiBrainPlansContextImpl _value,
    $Res Function(_$AiBrainPlansContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainPlansContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealPlan = freezed,
    Object? workoutPlan = freezed,
    Object? pendingChanges = null,
    Object? masterPlanStatus = freezed,
    Object? masterPlanId = freezed,
  }) {
    return _then(
      _$AiBrainPlansContextImpl(
        mealPlan: freezed == mealPlan
            ? _value.mealPlan
            : mealPlan // ignore: cast_nullable_to_non_nullable
                  as AiBrainMealPlanSummary?,
        workoutPlan: freezed == workoutPlan
            ? _value.workoutPlan
            : workoutPlan // ignore: cast_nullable_to_non_nullable
                  as AiBrainWorkoutPlanSummary?,
        pendingChanges: null == pendingChanges
            ? _value._pendingChanges
            : pendingChanges // ignore: cast_nullable_to_non_nullable
                  as List<AiBrainPendingChange>,
        masterPlanStatus: freezed == masterPlanStatus
            ? _value.masterPlanStatus
            : masterPlanStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        masterPlanId: freezed == masterPlanId
            ? _value.masterPlanId
            : masterPlanId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainPlansContextImpl implements _AiBrainPlansContext {
  const _$AiBrainPlansContextImpl({
    this.mealPlan,
    this.workoutPlan,
    final List<AiBrainPendingChange> pendingChanges = const [],
    this.masterPlanStatus,
    this.masterPlanId,
  }) : _pendingChanges = pendingChanges;

  factory _$AiBrainPlansContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainPlansContextImplFromJson(json);

  /// Active meal plan summary
  @override
  final AiBrainMealPlanSummary? mealPlan;

  /// Active workout plan summary
  @override
  final AiBrainWorkoutPlanSummary? workoutPlan;

  /// Pending changes awaiting approval
  final List<AiBrainPendingChange> _pendingChanges;

  /// Pending changes awaiting approval
  @override
  @JsonKey()
  List<AiBrainPendingChange> get pendingChanges {
    if (_pendingChanges is EqualUnmodifiableListView) return _pendingChanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingChanges);
  }

  /// Master plan status
  @override
  final String? masterPlanStatus;
  @override
  final String? masterPlanId;

  @override
  String toString() {
    return 'AiBrainPlansContext(mealPlan: $mealPlan, workoutPlan: $workoutPlan, pendingChanges: $pendingChanges, masterPlanStatus: $masterPlanStatus, masterPlanId: $masterPlanId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainPlansContextImpl &&
            (identical(other.mealPlan, mealPlan) ||
                other.mealPlan == mealPlan) &&
            (identical(other.workoutPlan, workoutPlan) ||
                other.workoutPlan == workoutPlan) &&
            const DeepCollectionEquality().equals(
              other._pendingChanges,
              _pendingChanges,
            ) &&
            (identical(other.masterPlanStatus, masterPlanStatus) ||
                other.masterPlanStatus == masterPlanStatus) &&
            (identical(other.masterPlanId, masterPlanId) ||
                other.masterPlanId == masterPlanId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mealPlan,
    workoutPlan,
    const DeepCollectionEquality().hash(_pendingChanges),
    masterPlanStatus,
    masterPlanId,
  );

  /// Create a copy of AiBrainPlansContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainPlansContextImplCopyWith<_$AiBrainPlansContextImpl> get copyWith =>
      __$$AiBrainPlansContextImplCopyWithImpl<_$AiBrainPlansContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainPlansContextImplToJson(this);
  }
}

abstract class _AiBrainPlansContext implements AiBrainPlansContext {
  const factory _AiBrainPlansContext({
    final AiBrainMealPlanSummary? mealPlan,
    final AiBrainWorkoutPlanSummary? workoutPlan,
    final List<AiBrainPendingChange> pendingChanges,
    final String? masterPlanStatus,
    final String? masterPlanId,
  }) = _$AiBrainPlansContextImpl;

  factory _AiBrainPlansContext.fromJson(Map<String, dynamic> json) =
      _$AiBrainPlansContextImpl.fromJson;

  /// Active meal plan summary
  @override
  AiBrainMealPlanSummary? get mealPlan;

  /// Active workout plan summary
  @override
  AiBrainWorkoutPlanSummary? get workoutPlan;

  /// Pending changes awaiting approval
  @override
  List<AiBrainPendingChange> get pendingChanges;

  /// Master plan status
  @override
  String? get masterPlanStatus;
  @override
  String? get masterPlanId;

  /// Create a copy of AiBrainPlansContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainPlansContextImplCopyWith<_$AiBrainPlansContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiBrainMealPlanSummary _$AiBrainMealPlanSummaryFromJson(
  Map<String, dynamic> json,
) {
  return _AiBrainMealPlanSummary.fromJson(json);
}

/// @nodoc
mixin _$AiBrainMealPlanSummary {
  String get planId => throw _privateConstructorUsedError;
  DateTime get weekStartDate => throw _privateConstructorUsedError;

  /// Today's plan
  int get todayCaloriesPlanned => throw _privateConstructorUsedError;
  int get todayProteinPlanned => throw _privateConstructorUsedError;
  List<String> get todayMeals => throw _privateConstructorUsedError;

  /// Weekly totals
  int get weeklyCaloriesTotal => throw _privateConstructorUsedError;
  int get weeklyProteinTotal => throw _privateConstructorUsedError;

  /// Plan status
  String get approvalStatus => throw _privateConstructorUsedError;

  /// Serializes this AiBrainMealPlanSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainMealPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainMealPlanSummaryCopyWith<AiBrainMealPlanSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainMealPlanSummaryCopyWith<$Res> {
  factory $AiBrainMealPlanSummaryCopyWith(
    AiBrainMealPlanSummary value,
    $Res Function(AiBrainMealPlanSummary) then,
  ) = _$AiBrainMealPlanSummaryCopyWithImpl<$Res, AiBrainMealPlanSummary>;
  @useResult
  $Res call({
    String planId,
    DateTime weekStartDate,
    int todayCaloriesPlanned,
    int todayProteinPlanned,
    List<String> todayMeals,
    int weeklyCaloriesTotal,
    int weeklyProteinTotal,
    String approvalStatus,
  });
}

/// @nodoc
class _$AiBrainMealPlanSummaryCopyWithImpl<
  $Res,
  $Val extends AiBrainMealPlanSummary
>
    implements $AiBrainMealPlanSummaryCopyWith<$Res> {
  _$AiBrainMealPlanSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainMealPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? weekStartDate = null,
    Object? todayCaloriesPlanned = null,
    Object? todayProteinPlanned = null,
    Object? todayMeals = null,
    Object? weeklyCaloriesTotal = null,
    Object? weeklyProteinTotal = null,
    Object? approvalStatus = null,
  }) {
    return _then(
      _value.copyWith(
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as String,
            weekStartDate: null == weekStartDate
                ? _value.weekStartDate
                : weekStartDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            todayCaloriesPlanned: null == todayCaloriesPlanned
                ? _value.todayCaloriesPlanned
                : todayCaloriesPlanned // ignore: cast_nullable_to_non_nullable
                      as int,
            todayProteinPlanned: null == todayProteinPlanned
                ? _value.todayProteinPlanned
                : todayProteinPlanned // ignore: cast_nullable_to_non_nullable
                      as int,
            todayMeals: null == todayMeals
                ? _value.todayMeals
                : todayMeals // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            weeklyCaloriesTotal: null == weeklyCaloriesTotal
                ? _value.weeklyCaloriesTotal
                : weeklyCaloriesTotal // ignore: cast_nullable_to_non_nullable
                      as int,
            weeklyProteinTotal: null == weeklyProteinTotal
                ? _value.weeklyProteinTotal
                : weeklyProteinTotal // ignore: cast_nullable_to_non_nullable
                      as int,
            approvalStatus: null == approvalStatus
                ? _value.approvalStatus
                : approvalStatus // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainMealPlanSummaryImplCopyWith<$Res>
    implements $AiBrainMealPlanSummaryCopyWith<$Res> {
  factory _$$AiBrainMealPlanSummaryImplCopyWith(
    _$AiBrainMealPlanSummaryImpl value,
    $Res Function(_$AiBrainMealPlanSummaryImpl) then,
  ) = __$$AiBrainMealPlanSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String planId,
    DateTime weekStartDate,
    int todayCaloriesPlanned,
    int todayProteinPlanned,
    List<String> todayMeals,
    int weeklyCaloriesTotal,
    int weeklyProteinTotal,
    String approvalStatus,
  });
}

/// @nodoc
class __$$AiBrainMealPlanSummaryImplCopyWithImpl<$Res>
    extends
        _$AiBrainMealPlanSummaryCopyWithImpl<$Res, _$AiBrainMealPlanSummaryImpl>
    implements _$$AiBrainMealPlanSummaryImplCopyWith<$Res> {
  __$$AiBrainMealPlanSummaryImplCopyWithImpl(
    _$AiBrainMealPlanSummaryImpl _value,
    $Res Function(_$AiBrainMealPlanSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainMealPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? weekStartDate = null,
    Object? todayCaloriesPlanned = null,
    Object? todayProteinPlanned = null,
    Object? todayMeals = null,
    Object? weeklyCaloriesTotal = null,
    Object? weeklyProteinTotal = null,
    Object? approvalStatus = null,
  }) {
    return _then(
      _$AiBrainMealPlanSummaryImpl(
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as String,
        weekStartDate: null == weekStartDate
            ? _value.weekStartDate
            : weekStartDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        todayCaloriesPlanned: null == todayCaloriesPlanned
            ? _value.todayCaloriesPlanned
            : todayCaloriesPlanned // ignore: cast_nullable_to_non_nullable
                  as int,
        todayProteinPlanned: null == todayProteinPlanned
            ? _value.todayProteinPlanned
            : todayProteinPlanned // ignore: cast_nullable_to_non_nullable
                  as int,
        todayMeals: null == todayMeals
            ? _value._todayMeals
            : todayMeals // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        weeklyCaloriesTotal: null == weeklyCaloriesTotal
            ? _value.weeklyCaloriesTotal
            : weeklyCaloriesTotal // ignore: cast_nullable_to_non_nullable
                  as int,
        weeklyProteinTotal: null == weeklyProteinTotal
            ? _value.weeklyProteinTotal
            : weeklyProteinTotal // ignore: cast_nullable_to_non_nullable
                  as int,
        approvalStatus: null == approvalStatus
            ? _value.approvalStatus
            : approvalStatus // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainMealPlanSummaryImpl implements _AiBrainMealPlanSummary {
  const _$AiBrainMealPlanSummaryImpl({
    required this.planId,
    required this.weekStartDate,
    this.todayCaloriesPlanned = 0,
    this.todayProteinPlanned = 0,
    final List<String> todayMeals = const [],
    this.weeklyCaloriesTotal = 0,
    this.weeklyProteinTotal = 0,
    this.approvalStatus = 'pending',
  }) : _todayMeals = todayMeals;

  factory _$AiBrainMealPlanSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainMealPlanSummaryImplFromJson(json);

  @override
  final String planId;
  @override
  final DateTime weekStartDate;

  /// Today's plan
  @override
  @JsonKey()
  final int todayCaloriesPlanned;
  @override
  @JsonKey()
  final int todayProteinPlanned;
  final List<String> _todayMeals;
  @override
  @JsonKey()
  List<String> get todayMeals {
    if (_todayMeals is EqualUnmodifiableListView) return _todayMeals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayMeals);
  }

  /// Weekly totals
  @override
  @JsonKey()
  final int weeklyCaloriesTotal;
  @override
  @JsonKey()
  final int weeklyProteinTotal;

  /// Plan status
  @override
  @JsonKey()
  final String approvalStatus;

  @override
  String toString() {
    return 'AiBrainMealPlanSummary(planId: $planId, weekStartDate: $weekStartDate, todayCaloriesPlanned: $todayCaloriesPlanned, todayProteinPlanned: $todayProteinPlanned, todayMeals: $todayMeals, weeklyCaloriesTotal: $weeklyCaloriesTotal, weeklyProteinTotal: $weeklyProteinTotal, approvalStatus: $approvalStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainMealPlanSummaryImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            (identical(other.todayCaloriesPlanned, todayCaloriesPlanned) ||
                other.todayCaloriesPlanned == todayCaloriesPlanned) &&
            (identical(other.todayProteinPlanned, todayProteinPlanned) ||
                other.todayProteinPlanned == todayProteinPlanned) &&
            const DeepCollectionEquality().equals(
              other._todayMeals,
              _todayMeals,
            ) &&
            (identical(other.weeklyCaloriesTotal, weeklyCaloriesTotal) ||
                other.weeklyCaloriesTotal == weeklyCaloriesTotal) &&
            (identical(other.weeklyProteinTotal, weeklyProteinTotal) ||
                other.weeklyProteinTotal == weeklyProteinTotal) &&
            (identical(other.approvalStatus, approvalStatus) ||
                other.approvalStatus == approvalStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    planId,
    weekStartDate,
    todayCaloriesPlanned,
    todayProteinPlanned,
    const DeepCollectionEquality().hash(_todayMeals),
    weeklyCaloriesTotal,
    weeklyProteinTotal,
    approvalStatus,
  );

  /// Create a copy of AiBrainMealPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainMealPlanSummaryImplCopyWith<_$AiBrainMealPlanSummaryImpl>
  get copyWith =>
      __$$AiBrainMealPlanSummaryImplCopyWithImpl<_$AiBrainMealPlanSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainMealPlanSummaryImplToJson(this);
  }
}

abstract class _AiBrainMealPlanSummary implements AiBrainMealPlanSummary {
  const factory _AiBrainMealPlanSummary({
    required final String planId,
    required final DateTime weekStartDate,
    final int todayCaloriesPlanned,
    final int todayProteinPlanned,
    final List<String> todayMeals,
    final int weeklyCaloriesTotal,
    final int weeklyProteinTotal,
    final String approvalStatus,
  }) = _$AiBrainMealPlanSummaryImpl;

  factory _AiBrainMealPlanSummary.fromJson(Map<String, dynamic> json) =
      _$AiBrainMealPlanSummaryImpl.fromJson;

  @override
  String get planId;
  @override
  DateTime get weekStartDate;

  /// Today's plan
  @override
  int get todayCaloriesPlanned;
  @override
  int get todayProteinPlanned;
  @override
  List<String> get todayMeals;

  /// Weekly totals
  @override
  int get weeklyCaloriesTotal;
  @override
  int get weeklyProteinTotal;

  /// Plan status
  @override
  String get approvalStatus;

  /// Create a copy of AiBrainMealPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainMealPlanSummaryImplCopyWith<_$AiBrainMealPlanSummaryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AiBrainWorkoutPlanSummary _$AiBrainWorkoutPlanSummaryFromJson(
  Map<String, dynamic> json,
) {
  return _AiBrainWorkoutPlanSummary.fromJson(json);
}

/// @nodoc
mixin _$AiBrainWorkoutPlanSummary {
  String get planId => throw _privateConstructorUsedError;
  DateTime get weekStartDate => throw _privateConstructorUsedError;

  /// Today's workout
  String? get todayWorkoutType => throw _privateConstructorUsedError;
  int? get todayWorkoutDuration => throw _privateConstructorUsedError;
  int? get todayWorkoutIntensity => throw _privateConstructorUsedError;
  List<String> get todayExercises => throw _privateConstructorUsedError;
  bool get isTodayRestDay => throw _privateConstructorUsedError;

  /// Weekly summary
  int get workoutDaysCount => throw _privateConstructorUsedError;
  int get totalWorkoutMinutes => throw _privateConstructorUsedError;
  int get estimatedCaloriesBurn => throw _privateConstructorUsedError;

  /// Plan status
  String get approvalStatus => throw _privateConstructorUsedError;

  /// Serializes this AiBrainWorkoutPlanSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainWorkoutPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainWorkoutPlanSummaryCopyWith<AiBrainWorkoutPlanSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainWorkoutPlanSummaryCopyWith<$Res> {
  factory $AiBrainWorkoutPlanSummaryCopyWith(
    AiBrainWorkoutPlanSummary value,
    $Res Function(AiBrainWorkoutPlanSummary) then,
  ) = _$AiBrainWorkoutPlanSummaryCopyWithImpl<$Res, AiBrainWorkoutPlanSummary>;
  @useResult
  $Res call({
    String planId,
    DateTime weekStartDate,
    String? todayWorkoutType,
    int? todayWorkoutDuration,
    int? todayWorkoutIntensity,
    List<String> todayExercises,
    bool isTodayRestDay,
    int workoutDaysCount,
    int totalWorkoutMinutes,
    int estimatedCaloriesBurn,
    String approvalStatus,
  });
}

/// @nodoc
class _$AiBrainWorkoutPlanSummaryCopyWithImpl<
  $Res,
  $Val extends AiBrainWorkoutPlanSummary
>
    implements $AiBrainWorkoutPlanSummaryCopyWith<$Res> {
  _$AiBrainWorkoutPlanSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainWorkoutPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? weekStartDate = null,
    Object? todayWorkoutType = freezed,
    Object? todayWorkoutDuration = freezed,
    Object? todayWorkoutIntensity = freezed,
    Object? todayExercises = null,
    Object? isTodayRestDay = null,
    Object? workoutDaysCount = null,
    Object? totalWorkoutMinutes = null,
    Object? estimatedCaloriesBurn = null,
    Object? approvalStatus = null,
  }) {
    return _then(
      _value.copyWith(
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as String,
            weekStartDate: null == weekStartDate
                ? _value.weekStartDate
                : weekStartDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            todayWorkoutType: freezed == todayWorkoutType
                ? _value.todayWorkoutType
                : todayWorkoutType // ignore: cast_nullable_to_non_nullable
                      as String?,
            todayWorkoutDuration: freezed == todayWorkoutDuration
                ? _value.todayWorkoutDuration
                : todayWorkoutDuration // ignore: cast_nullable_to_non_nullable
                      as int?,
            todayWorkoutIntensity: freezed == todayWorkoutIntensity
                ? _value.todayWorkoutIntensity
                : todayWorkoutIntensity // ignore: cast_nullable_to_non_nullable
                      as int?,
            todayExercises: null == todayExercises
                ? _value.todayExercises
                : todayExercises // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isTodayRestDay: null == isTodayRestDay
                ? _value.isTodayRestDay
                : isTodayRestDay // ignore: cast_nullable_to_non_nullable
                      as bool,
            workoutDaysCount: null == workoutDaysCount
                ? _value.workoutDaysCount
                : workoutDaysCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalWorkoutMinutes: null == totalWorkoutMinutes
                ? _value.totalWorkoutMinutes
                : totalWorkoutMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            estimatedCaloriesBurn: null == estimatedCaloriesBurn
                ? _value.estimatedCaloriesBurn
                : estimatedCaloriesBurn // ignore: cast_nullable_to_non_nullable
                      as int,
            approvalStatus: null == approvalStatus
                ? _value.approvalStatus
                : approvalStatus // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainWorkoutPlanSummaryImplCopyWith<$Res>
    implements $AiBrainWorkoutPlanSummaryCopyWith<$Res> {
  factory _$$AiBrainWorkoutPlanSummaryImplCopyWith(
    _$AiBrainWorkoutPlanSummaryImpl value,
    $Res Function(_$AiBrainWorkoutPlanSummaryImpl) then,
  ) = __$$AiBrainWorkoutPlanSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String planId,
    DateTime weekStartDate,
    String? todayWorkoutType,
    int? todayWorkoutDuration,
    int? todayWorkoutIntensity,
    List<String> todayExercises,
    bool isTodayRestDay,
    int workoutDaysCount,
    int totalWorkoutMinutes,
    int estimatedCaloriesBurn,
    String approvalStatus,
  });
}

/// @nodoc
class __$$AiBrainWorkoutPlanSummaryImplCopyWithImpl<$Res>
    extends
        _$AiBrainWorkoutPlanSummaryCopyWithImpl<
          $Res,
          _$AiBrainWorkoutPlanSummaryImpl
        >
    implements _$$AiBrainWorkoutPlanSummaryImplCopyWith<$Res> {
  __$$AiBrainWorkoutPlanSummaryImplCopyWithImpl(
    _$AiBrainWorkoutPlanSummaryImpl _value,
    $Res Function(_$AiBrainWorkoutPlanSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainWorkoutPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? weekStartDate = null,
    Object? todayWorkoutType = freezed,
    Object? todayWorkoutDuration = freezed,
    Object? todayWorkoutIntensity = freezed,
    Object? todayExercises = null,
    Object? isTodayRestDay = null,
    Object? workoutDaysCount = null,
    Object? totalWorkoutMinutes = null,
    Object? estimatedCaloriesBurn = null,
    Object? approvalStatus = null,
  }) {
    return _then(
      _$AiBrainWorkoutPlanSummaryImpl(
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as String,
        weekStartDate: null == weekStartDate
            ? _value.weekStartDate
            : weekStartDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        todayWorkoutType: freezed == todayWorkoutType
            ? _value.todayWorkoutType
            : todayWorkoutType // ignore: cast_nullable_to_non_nullable
                  as String?,
        todayWorkoutDuration: freezed == todayWorkoutDuration
            ? _value.todayWorkoutDuration
            : todayWorkoutDuration // ignore: cast_nullable_to_non_nullable
                  as int?,
        todayWorkoutIntensity: freezed == todayWorkoutIntensity
            ? _value.todayWorkoutIntensity
            : todayWorkoutIntensity // ignore: cast_nullable_to_non_nullable
                  as int?,
        todayExercises: null == todayExercises
            ? _value._todayExercises
            : todayExercises // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isTodayRestDay: null == isTodayRestDay
            ? _value.isTodayRestDay
            : isTodayRestDay // ignore: cast_nullable_to_non_nullable
                  as bool,
        workoutDaysCount: null == workoutDaysCount
            ? _value.workoutDaysCount
            : workoutDaysCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalWorkoutMinutes: null == totalWorkoutMinutes
            ? _value.totalWorkoutMinutes
            : totalWorkoutMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        estimatedCaloriesBurn: null == estimatedCaloriesBurn
            ? _value.estimatedCaloriesBurn
            : estimatedCaloriesBurn // ignore: cast_nullable_to_non_nullable
                  as int,
        approvalStatus: null == approvalStatus
            ? _value.approvalStatus
            : approvalStatus // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainWorkoutPlanSummaryImpl implements _AiBrainWorkoutPlanSummary {
  const _$AiBrainWorkoutPlanSummaryImpl({
    required this.planId,
    required this.weekStartDate,
    this.todayWorkoutType,
    this.todayWorkoutDuration,
    this.todayWorkoutIntensity,
    final List<String> todayExercises = const [],
    this.isTodayRestDay = false,
    this.workoutDaysCount = 0,
    this.totalWorkoutMinutes = 0,
    this.estimatedCaloriesBurn = 0,
    this.approvalStatus = 'pending',
  }) : _todayExercises = todayExercises;

  factory _$AiBrainWorkoutPlanSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainWorkoutPlanSummaryImplFromJson(json);

  @override
  final String planId;
  @override
  final DateTime weekStartDate;

  /// Today's workout
  @override
  final String? todayWorkoutType;
  @override
  final int? todayWorkoutDuration;
  @override
  final int? todayWorkoutIntensity;
  final List<String> _todayExercises;
  @override
  @JsonKey()
  List<String> get todayExercises {
    if (_todayExercises is EqualUnmodifiableListView) return _todayExercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayExercises);
  }

  @override
  @JsonKey()
  final bool isTodayRestDay;

  /// Weekly summary
  @override
  @JsonKey()
  final int workoutDaysCount;
  @override
  @JsonKey()
  final int totalWorkoutMinutes;
  @override
  @JsonKey()
  final int estimatedCaloriesBurn;

  /// Plan status
  @override
  @JsonKey()
  final String approvalStatus;

  @override
  String toString() {
    return 'AiBrainWorkoutPlanSummary(planId: $planId, weekStartDate: $weekStartDate, todayWorkoutType: $todayWorkoutType, todayWorkoutDuration: $todayWorkoutDuration, todayWorkoutIntensity: $todayWorkoutIntensity, todayExercises: $todayExercises, isTodayRestDay: $isTodayRestDay, workoutDaysCount: $workoutDaysCount, totalWorkoutMinutes: $totalWorkoutMinutes, estimatedCaloriesBurn: $estimatedCaloriesBurn, approvalStatus: $approvalStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainWorkoutPlanSummaryImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            (identical(other.todayWorkoutType, todayWorkoutType) ||
                other.todayWorkoutType == todayWorkoutType) &&
            (identical(other.todayWorkoutDuration, todayWorkoutDuration) ||
                other.todayWorkoutDuration == todayWorkoutDuration) &&
            (identical(other.todayWorkoutIntensity, todayWorkoutIntensity) ||
                other.todayWorkoutIntensity == todayWorkoutIntensity) &&
            const DeepCollectionEquality().equals(
              other._todayExercises,
              _todayExercises,
            ) &&
            (identical(other.isTodayRestDay, isTodayRestDay) ||
                other.isTodayRestDay == isTodayRestDay) &&
            (identical(other.workoutDaysCount, workoutDaysCount) ||
                other.workoutDaysCount == workoutDaysCount) &&
            (identical(other.totalWorkoutMinutes, totalWorkoutMinutes) ||
                other.totalWorkoutMinutes == totalWorkoutMinutes) &&
            (identical(other.estimatedCaloriesBurn, estimatedCaloriesBurn) ||
                other.estimatedCaloriesBurn == estimatedCaloriesBurn) &&
            (identical(other.approvalStatus, approvalStatus) ||
                other.approvalStatus == approvalStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    planId,
    weekStartDate,
    todayWorkoutType,
    todayWorkoutDuration,
    todayWorkoutIntensity,
    const DeepCollectionEquality().hash(_todayExercises),
    isTodayRestDay,
    workoutDaysCount,
    totalWorkoutMinutes,
    estimatedCaloriesBurn,
    approvalStatus,
  );

  /// Create a copy of AiBrainWorkoutPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainWorkoutPlanSummaryImplCopyWith<_$AiBrainWorkoutPlanSummaryImpl>
  get copyWith =>
      __$$AiBrainWorkoutPlanSummaryImplCopyWithImpl<
        _$AiBrainWorkoutPlanSummaryImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainWorkoutPlanSummaryImplToJson(this);
  }
}

abstract class _AiBrainWorkoutPlanSummary implements AiBrainWorkoutPlanSummary {
  const factory _AiBrainWorkoutPlanSummary({
    required final String planId,
    required final DateTime weekStartDate,
    final String? todayWorkoutType,
    final int? todayWorkoutDuration,
    final int? todayWorkoutIntensity,
    final List<String> todayExercises,
    final bool isTodayRestDay,
    final int workoutDaysCount,
    final int totalWorkoutMinutes,
    final int estimatedCaloriesBurn,
    final String approvalStatus,
  }) = _$AiBrainWorkoutPlanSummaryImpl;

  factory _AiBrainWorkoutPlanSummary.fromJson(Map<String, dynamic> json) =
      _$AiBrainWorkoutPlanSummaryImpl.fromJson;

  @override
  String get planId;
  @override
  DateTime get weekStartDate;

  /// Today's workout
  @override
  String? get todayWorkoutType;
  @override
  int? get todayWorkoutDuration;
  @override
  int? get todayWorkoutIntensity;
  @override
  List<String> get todayExercises;
  @override
  bool get isTodayRestDay;

  /// Weekly summary
  @override
  int get workoutDaysCount;
  @override
  int get totalWorkoutMinutes;
  @override
  int get estimatedCaloriesBurn;

  /// Plan status
  @override
  String get approvalStatus;

  /// Create a copy of AiBrainWorkoutPlanSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainWorkoutPlanSummaryImplCopyWith<_$AiBrainWorkoutPlanSummaryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AiBrainPendingChange _$AiBrainPendingChangeFromJson(Map<String, dynamic> json) {
  return _AiBrainPendingChange.fromJson(json);
}

/// @nodoc
mixin _$AiBrainPendingChange {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get descriptionAr => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get impactScore => throw _privateConstructorUsedError;

  /// Serializes this AiBrainPendingChange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainPendingChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainPendingChangeCopyWith<AiBrainPendingChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainPendingChangeCopyWith<$Res> {
  factory $AiBrainPendingChangeCopyWith(
    AiBrainPendingChange value,
    $Res Function(AiBrainPendingChange) then,
  ) = _$AiBrainPendingChangeCopyWithImpl<$Res, AiBrainPendingChange>;
  @useResult
  $Res call({
    String id,
    String type,
    String description,
    String? descriptionAr,
    String source,
    DateTime createdAt,
    int impactScore,
  });
}

/// @nodoc
class _$AiBrainPendingChangeCopyWithImpl<
  $Res,
  $Val extends AiBrainPendingChange
>
    implements $AiBrainPendingChangeCopyWith<$Res> {
  _$AiBrainPendingChangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainPendingChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? description = null,
    Object? descriptionAr = freezed,
    Object? source = null,
    Object? createdAt = null,
    Object? impactScore = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionAr: freezed == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            impactScore: null == impactScore
                ? _value.impactScore
                : impactScore // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainPendingChangeImplCopyWith<$Res>
    implements $AiBrainPendingChangeCopyWith<$Res> {
  factory _$$AiBrainPendingChangeImplCopyWith(
    _$AiBrainPendingChangeImpl value,
    $Res Function(_$AiBrainPendingChangeImpl) then,
  ) = __$$AiBrainPendingChangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String description,
    String? descriptionAr,
    String source,
    DateTime createdAt,
    int impactScore,
  });
}

/// @nodoc
class __$$AiBrainPendingChangeImplCopyWithImpl<$Res>
    extends _$AiBrainPendingChangeCopyWithImpl<$Res, _$AiBrainPendingChangeImpl>
    implements _$$AiBrainPendingChangeImplCopyWith<$Res> {
  __$$AiBrainPendingChangeImplCopyWithImpl(
    _$AiBrainPendingChangeImpl _value,
    $Res Function(_$AiBrainPendingChangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainPendingChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? description = null,
    Object? descriptionAr = freezed,
    Object? source = null,
    Object? createdAt = null,
    Object? impactScore = null,
  }) {
    return _then(
      _$AiBrainPendingChangeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: freezed == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        impactScore: null == impactScore
            ? _value.impactScore
            : impactScore // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainPendingChangeImpl implements _AiBrainPendingChange {
  const _$AiBrainPendingChangeImpl({
    required this.id,
    required this.type,
    required this.description,
    this.descriptionAr,
    required this.source,
    required this.createdAt,
    this.impactScore = 50,
  });

  factory _$AiBrainPendingChangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainPendingChangeImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String description;
  @override
  final String? descriptionAr;
  @override
  final String source;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final int impactScore;

  @override
  String toString() {
    return 'AiBrainPendingChange(id: $id, type: $type, description: $description, descriptionAr: $descriptionAr, source: $source, createdAt: $createdAt, impactScore: $impactScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainPendingChangeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.impactScore, impactScore) ||
                other.impactScore == impactScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    description,
    descriptionAr,
    source,
    createdAt,
    impactScore,
  );

  /// Create a copy of AiBrainPendingChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainPendingChangeImplCopyWith<_$AiBrainPendingChangeImpl>
  get copyWith =>
      __$$AiBrainPendingChangeImplCopyWithImpl<_$AiBrainPendingChangeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainPendingChangeImplToJson(this);
  }
}

abstract class _AiBrainPendingChange implements AiBrainPendingChange {
  const factory _AiBrainPendingChange({
    required final String id,
    required final String type,
    required final String description,
    final String? descriptionAr,
    required final String source,
    required final DateTime createdAt,
    final int impactScore,
  }) = _$AiBrainPendingChangeImpl;

  factory _AiBrainPendingChange.fromJson(Map<String, dynamic> json) =
      _$AiBrainPendingChangeImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get description;
  @override
  String? get descriptionAr;
  @override
  String get source;
  @override
  DateTime get createdAt;
  @override
  int get impactScore;

  /// Create a copy of AiBrainPendingChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainPendingChangeImplCopyWith<_$AiBrainPendingChangeImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AiBrainChatMessage _$AiBrainChatMessageFromJson(Map<String, dynamic> json) {
  return _AiBrainChatMessage.fromJson(json);
}

/// @nodoc
mixin _$AiBrainChatMessage {
  String get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get contextTag => throw _privateConstructorUsedError;

  /// Serializes this AiBrainChatMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainChatMessageCopyWith<AiBrainChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainChatMessageCopyWith<$Res> {
  factory $AiBrainChatMessageCopyWith(
    AiBrainChatMessage value,
    $Res Function(AiBrainChatMessage) then,
  ) = _$AiBrainChatMessageCopyWithImpl<$Res, AiBrainChatMessage>;
  @useResult
  $Res call({
    String role,
    String content,
    DateTime createdAt,
    String? contextTag,
  });
}

/// @nodoc
class _$AiBrainChatMessageCopyWithImpl<$Res, $Val extends AiBrainChatMessage>
    implements $AiBrainChatMessageCopyWith<$Res> {
  _$AiBrainChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
    Object? createdAt = null,
    Object? contextTag = freezed,
  }) {
    return _then(
      _value.copyWith(
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            contextTag: freezed == contextTag
                ? _value.contextTag
                : contextTag // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainChatMessageImplCopyWith<$Res>
    implements $AiBrainChatMessageCopyWith<$Res> {
  factory _$$AiBrainChatMessageImplCopyWith(
    _$AiBrainChatMessageImpl value,
    $Res Function(_$AiBrainChatMessageImpl) then,
  ) = __$$AiBrainChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String role,
    String content,
    DateTime createdAt,
    String? contextTag,
  });
}

/// @nodoc
class __$$AiBrainChatMessageImplCopyWithImpl<$Res>
    extends _$AiBrainChatMessageCopyWithImpl<$Res, _$AiBrainChatMessageImpl>
    implements _$$AiBrainChatMessageImplCopyWith<$Res> {
  __$$AiBrainChatMessageImplCopyWithImpl(
    _$AiBrainChatMessageImpl _value,
    $Res Function(_$AiBrainChatMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
    Object? createdAt = null,
    Object? contextTag = freezed,
  }) {
    return _then(
      _$AiBrainChatMessageImpl(
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        contextTag: freezed == contextTag
            ? _value.contextTag
            : contextTag // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainChatMessageImpl implements _AiBrainChatMessage {
  const _$AiBrainChatMessageImpl({
    required this.role,
    required this.content,
    required this.createdAt,
    this.contextTag,
  });

  factory _$AiBrainChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainChatMessageImplFromJson(json);

  @override
  final String role;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final String? contextTag;

  @override
  String toString() {
    return 'AiBrainChatMessage(role: $role, content: $content, createdAt: $createdAt, contextTag: $contextTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainChatMessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.contextTag, contextTag) ||
                other.contextTag == contextTag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, role, content, createdAt, contextTag);

  /// Create a copy of AiBrainChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainChatMessageImplCopyWith<_$AiBrainChatMessageImpl> get copyWith =>
      __$$AiBrainChatMessageImplCopyWithImpl<_$AiBrainChatMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainChatMessageImplToJson(this);
  }
}

abstract class _AiBrainChatMessage implements AiBrainChatMessage {
  const factory _AiBrainChatMessage({
    required final String role,
    required final String content,
    required final DateTime createdAt,
    final String? contextTag,
  }) = _$AiBrainChatMessageImpl;

  factory _AiBrainChatMessage.fromJson(Map<String, dynamic> json) =
      _$AiBrainChatMessageImpl.fromJson;

  @override
  String get role;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  String? get contextTag;

  /// Create a copy of AiBrainChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainChatMessageImplCopyWith<_$AiBrainChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiBrainAlert _$AiBrainAlertFromJson(Map<String, dynamic> json) {
  return _AiBrainAlert.fromJson(json);
}

/// @nodoc
mixin _$AiBrainAlert {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get titleAr => throw _privateConstructorUsedError;
  String? get messageAr => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isDismissed => throw _privateConstructorUsedError;

  /// Serializes this AiBrainAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainAlertCopyWith<AiBrainAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainAlertCopyWith<$Res> {
  factory $AiBrainAlertCopyWith(
    AiBrainAlert value,
    $Res Function(AiBrainAlert) then,
  ) = _$AiBrainAlertCopyWithImpl<$Res, AiBrainAlert>;
  @useResult
  $Res call({
    String id,
    String type,
    String title,
    String message,
    String? titleAr,
    String? messageAr,
    String priority,
    DateTime createdAt,
    bool isDismissed,
  });
}

/// @nodoc
class _$AiBrainAlertCopyWithImpl<$Res, $Val extends AiBrainAlert>
    implements $AiBrainAlertCopyWith<$Res> {
  _$AiBrainAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? titleAr = freezed,
    Object? messageAr = freezed,
    Object? priority = null,
    Object? createdAt = null,
    Object? isDismissed = null,
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
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            titleAr: freezed == titleAr
                ? _value.titleAr
                : titleAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageAr: freezed == messageAr
                ? _value.messageAr
                : messageAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isDismissed: null == isDismissed
                ? _value.isDismissed
                : isDismissed // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainAlertImplCopyWith<$Res>
    implements $AiBrainAlertCopyWith<$Res> {
  factory _$$AiBrainAlertImplCopyWith(
    _$AiBrainAlertImpl value,
    $Res Function(_$AiBrainAlertImpl) then,
  ) = __$$AiBrainAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String title,
    String message,
    String? titleAr,
    String? messageAr,
    String priority,
    DateTime createdAt,
    bool isDismissed,
  });
}

/// @nodoc
class __$$AiBrainAlertImplCopyWithImpl<$Res>
    extends _$AiBrainAlertCopyWithImpl<$Res, _$AiBrainAlertImpl>
    implements _$$AiBrainAlertImplCopyWith<$Res> {
  __$$AiBrainAlertImplCopyWithImpl(
    _$AiBrainAlertImpl _value,
    $Res Function(_$AiBrainAlertImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? titleAr = freezed,
    Object? messageAr = freezed,
    Object? priority = null,
    Object? createdAt = null,
    Object? isDismissed = null,
  }) {
    return _then(
      _$AiBrainAlertImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        titleAr: freezed == titleAr
            ? _value.titleAr
            : titleAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageAr: freezed == messageAr
            ? _value.messageAr
            : messageAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isDismissed: null == isDismissed
            ? _value.isDismissed
            : isDismissed // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainAlertImpl implements _AiBrainAlert {
  const _$AiBrainAlertImpl({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    this.titleAr,
    this.messageAr,
    required this.priority,
    required this.createdAt,
    this.isDismissed = false,
  });

  factory _$AiBrainAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainAlertImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String title;
  @override
  final String message;
  @override
  final String? titleAr;
  @override
  final String? messageAr;
  @override
  final String priority;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isDismissed;

  @override
  String toString() {
    return 'AiBrainAlert(id: $id, type: $type, title: $title, message: $message, titleAr: $titleAr, messageAr: $messageAr, priority: $priority, createdAt: $createdAt, isDismissed: $isDismissed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr) &&
            (identical(other.messageAr, messageAr) ||
                other.messageAr == messageAr) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isDismissed, isDismissed) ||
                other.isDismissed == isDismissed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    title,
    message,
    titleAr,
    messageAr,
    priority,
    createdAt,
    isDismissed,
  );

  /// Create a copy of AiBrainAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainAlertImplCopyWith<_$AiBrainAlertImpl> get copyWith =>
      __$$AiBrainAlertImplCopyWithImpl<_$AiBrainAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainAlertImplToJson(this);
  }
}

abstract class _AiBrainAlert implements AiBrainAlert {
  const factory _AiBrainAlert({
    required final String id,
    required final String type,
    required final String title,
    required final String message,
    final String? titleAr,
    final String? messageAr,
    required final String priority,
    required final DateTime createdAt,
    final bool isDismissed,
  }) = _$AiBrainAlertImpl;

  factory _AiBrainAlert.fromJson(Map<String, dynamic> json) =
      _$AiBrainAlertImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get title;
  @override
  String get message;
  @override
  String? get titleAr;
  @override
  String? get messageAr;
  @override
  String get priority;
  @override
  DateTime get createdAt;
  @override
  bool get isDismissed;

  /// Create a copy of AiBrainAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainAlertImplCopyWith<_$AiBrainAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiBrainSyncStatus _$AiBrainSyncStatusFromJson(Map<String, dynamic> json) {
  return _AiBrainSyncStatus.fromJson(json);
}

/// @nodoc
mixin _$AiBrainSyncStatus {
  DateTime? get lastHealthKitSync => throw _privateConstructorUsedError;
  DateTime? get lastMealSync => throw _privateConstructorUsedError;
  DateTime? get lastWorkoutSync => throw _privateConstructorUsedError;
  DateTime? get lastPlanSync => throw _privateConstructorUsedError;
  DateTime? get lastChatSync => throw _privateConstructorUsedError;

  /// Serializes this AiBrainSyncStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiBrainSyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiBrainSyncStatusCopyWith<AiBrainSyncStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiBrainSyncStatusCopyWith<$Res> {
  factory $AiBrainSyncStatusCopyWith(
    AiBrainSyncStatus value,
    $Res Function(AiBrainSyncStatus) then,
  ) = _$AiBrainSyncStatusCopyWithImpl<$Res, AiBrainSyncStatus>;
  @useResult
  $Res call({
    DateTime? lastHealthKitSync,
    DateTime? lastMealSync,
    DateTime? lastWorkoutSync,
    DateTime? lastPlanSync,
    DateTime? lastChatSync,
  });
}

/// @nodoc
class _$AiBrainSyncStatusCopyWithImpl<$Res, $Val extends AiBrainSyncStatus>
    implements $AiBrainSyncStatusCopyWith<$Res> {
  _$AiBrainSyncStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiBrainSyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastHealthKitSync = freezed,
    Object? lastMealSync = freezed,
    Object? lastWorkoutSync = freezed,
    Object? lastPlanSync = freezed,
    Object? lastChatSync = freezed,
  }) {
    return _then(
      _value.copyWith(
            lastHealthKitSync: freezed == lastHealthKitSync
                ? _value.lastHealthKitSync
                : lastHealthKitSync // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastMealSync: freezed == lastMealSync
                ? _value.lastMealSync
                : lastMealSync // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastWorkoutSync: freezed == lastWorkoutSync
                ? _value.lastWorkoutSync
                : lastWorkoutSync // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastPlanSync: freezed == lastPlanSync
                ? _value.lastPlanSync
                : lastPlanSync // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastChatSync: freezed == lastChatSync
                ? _value.lastChatSync
                : lastChatSync // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiBrainSyncStatusImplCopyWith<$Res>
    implements $AiBrainSyncStatusCopyWith<$Res> {
  factory _$$AiBrainSyncStatusImplCopyWith(
    _$AiBrainSyncStatusImpl value,
    $Res Function(_$AiBrainSyncStatusImpl) then,
  ) = __$$AiBrainSyncStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime? lastHealthKitSync,
    DateTime? lastMealSync,
    DateTime? lastWorkoutSync,
    DateTime? lastPlanSync,
    DateTime? lastChatSync,
  });
}

/// @nodoc
class __$$AiBrainSyncStatusImplCopyWithImpl<$Res>
    extends _$AiBrainSyncStatusCopyWithImpl<$Res, _$AiBrainSyncStatusImpl>
    implements _$$AiBrainSyncStatusImplCopyWith<$Res> {
  __$$AiBrainSyncStatusImplCopyWithImpl(
    _$AiBrainSyncStatusImpl _value,
    $Res Function(_$AiBrainSyncStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiBrainSyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastHealthKitSync = freezed,
    Object? lastMealSync = freezed,
    Object? lastWorkoutSync = freezed,
    Object? lastPlanSync = freezed,
    Object? lastChatSync = freezed,
  }) {
    return _then(
      _$AiBrainSyncStatusImpl(
        lastHealthKitSync: freezed == lastHealthKitSync
            ? _value.lastHealthKitSync
            : lastHealthKitSync // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastMealSync: freezed == lastMealSync
            ? _value.lastMealSync
            : lastMealSync // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastWorkoutSync: freezed == lastWorkoutSync
            ? _value.lastWorkoutSync
            : lastWorkoutSync // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastPlanSync: freezed == lastPlanSync
            ? _value.lastPlanSync
            : lastPlanSync // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastChatSync: freezed == lastChatSync
            ? _value.lastChatSync
            : lastChatSync // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiBrainSyncStatusImpl implements _AiBrainSyncStatus {
  const _$AiBrainSyncStatusImpl({
    this.lastHealthKitSync,
    this.lastMealSync,
    this.lastWorkoutSync,
    this.lastPlanSync,
    this.lastChatSync,
  });

  factory _$AiBrainSyncStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiBrainSyncStatusImplFromJson(json);

  @override
  final DateTime? lastHealthKitSync;
  @override
  final DateTime? lastMealSync;
  @override
  final DateTime? lastWorkoutSync;
  @override
  final DateTime? lastPlanSync;
  @override
  final DateTime? lastChatSync;

  @override
  String toString() {
    return 'AiBrainSyncStatus(lastHealthKitSync: $lastHealthKitSync, lastMealSync: $lastMealSync, lastWorkoutSync: $lastWorkoutSync, lastPlanSync: $lastPlanSync, lastChatSync: $lastChatSync)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiBrainSyncStatusImpl &&
            (identical(other.lastHealthKitSync, lastHealthKitSync) ||
                other.lastHealthKitSync == lastHealthKitSync) &&
            (identical(other.lastMealSync, lastMealSync) ||
                other.lastMealSync == lastMealSync) &&
            (identical(other.lastWorkoutSync, lastWorkoutSync) ||
                other.lastWorkoutSync == lastWorkoutSync) &&
            (identical(other.lastPlanSync, lastPlanSync) ||
                other.lastPlanSync == lastPlanSync) &&
            (identical(other.lastChatSync, lastChatSync) ||
                other.lastChatSync == lastChatSync));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    lastHealthKitSync,
    lastMealSync,
    lastWorkoutSync,
    lastPlanSync,
    lastChatSync,
  );

  /// Create a copy of AiBrainSyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiBrainSyncStatusImplCopyWith<_$AiBrainSyncStatusImpl> get copyWith =>
      __$$AiBrainSyncStatusImplCopyWithImpl<_$AiBrainSyncStatusImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiBrainSyncStatusImplToJson(this);
  }
}

abstract class _AiBrainSyncStatus implements AiBrainSyncStatus {
  const factory _AiBrainSyncStatus({
    final DateTime? lastHealthKitSync,
    final DateTime? lastMealSync,
    final DateTime? lastWorkoutSync,
    final DateTime? lastPlanSync,
    final DateTime? lastChatSync,
  }) = _$AiBrainSyncStatusImpl;

  factory _AiBrainSyncStatus.fromJson(Map<String, dynamic> json) =
      _$AiBrainSyncStatusImpl.fromJson;

  @override
  DateTime? get lastHealthKitSync;
  @override
  DateTime? get lastMealSync;
  @override
  DateTime? get lastWorkoutSync;
  @override
  DateTime? get lastPlanSync;
  @override
  DateTime? get lastChatSync;

  /// Create a copy of AiBrainSyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiBrainSyncStatusImplCopyWith<_$AiBrainSyncStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
