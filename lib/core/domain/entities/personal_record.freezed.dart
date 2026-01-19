// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PersonalRecord _$PersonalRecordFromJson(Map<String, dynamic> json) {
  return _PersonalRecord.fromJson(json);
}

/// @nodoc
mixin _$PersonalRecord {
  String get id => throw _privateConstructorUsedError;
  RecordCategory get category => throw _privateConstructorUsedError;
  RecordMetric get metric => throw _privateConstructorUsedError;

  /// Current best value
  double get value => throw _privateConstructorUsedError;

  /// Formatted value for display
  String? get formattedValue => throw _privateConstructorUsedError;

  /// When this record was achieved
  DateTime get achievedAt => throw _privateConstructorUsedError;

  /// Previous record value (if any)
  double? get previousValue => throw _privateConstructorUsedError;

  /// Previous record date
  DateTime? get previousAchievedAt => throw _privateConstructorUsedError;

  /// Is this the all-time best?
  bool get isAllTime => throw _privateConstructorUsedError;

  /// Times this record has been broken
  int get timesImproved => throw _privateConstructorUsedError;

  /// Additional context (e.g., workout type)
  String? get context => throw _privateConstructorUsedError;

  /// Serializes this PersonalRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalRecordCopyWith<PersonalRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalRecordCopyWith<$Res> {
  factory $PersonalRecordCopyWith(
    PersonalRecord value,
    $Res Function(PersonalRecord) then,
  ) = _$PersonalRecordCopyWithImpl<$Res, PersonalRecord>;
  @useResult
  $Res call({
    String id,
    RecordCategory category,
    RecordMetric metric,
    double value,
    String? formattedValue,
    DateTime achievedAt,
    double? previousValue,
    DateTime? previousAchievedAt,
    bool isAllTime,
    int timesImproved,
    String? context,
  });
}

/// @nodoc
class _$PersonalRecordCopyWithImpl<$Res, $Val extends PersonalRecord>
    implements $PersonalRecordCopyWith<$Res> {
  _$PersonalRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? metric = null,
    Object? value = null,
    Object? formattedValue = freezed,
    Object? achievedAt = null,
    Object? previousValue = freezed,
    Object? previousAchievedAt = freezed,
    Object? isAllTime = null,
    Object? timesImproved = null,
    Object? context = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as RecordCategory,
            metric: null == metric
                ? _value.metric
                : metric // ignore: cast_nullable_to_non_nullable
                      as RecordMetric,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
            formattedValue: freezed == formattedValue
                ? _value.formattedValue
                : formattedValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            achievedAt: null == achievedAt
                ? _value.achievedAt
                : achievedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            previousValue: freezed == previousValue
                ? _value.previousValue
                : previousValue // ignore: cast_nullable_to_non_nullable
                      as double?,
            previousAchievedAt: freezed == previousAchievedAt
                ? _value.previousAchievedAt
                : previousAchievedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isAllTime: null == isAllTime
                ? _value.isAllTime
                : isAllTime // ignore: cast_nullable_to_non_nullable
                      as bool,
            timesImproved: null == timesImproved
                ? _value.timesImproved
                : timesImproved // ignore: cast_nullable_to_non_nullable
                      as int,
            context: freezed == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PersonalRecordImplCopyWith<$Res>
    implements $PersonalRecordCopyWith<$Res> {
  factory _$$PersonalRecordImplCopyWith(
    _$PersonalRecordImpl value,
    $Res Function(_$PersonalRecordImpl) then,
  ) = __$$PersonalRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    RecordCategory category,
    RecordMetric metric,
    double value,
    String? formattedValue,
    DateTime achievedAt,
    double? previousValue,
    DateTime? previousAchievedAt,
    bool isAllTime,
    int timesImproved,
    String? context,
  });
}

/// @nodoc
class __$$PersonalRecordImplCopyWithImpl<$Res>
    extends _$PersonalRecordCopyWithImpl<$Res, _$PersonalRecordImpl>
    implements _$$PersonalRecordImplCopyWith<$Res> {
  __$$PersonalRecordImplCopyWithImpl(
    _$PersonalRecordImpl _value,
    $Res Function(_$PersonalRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PersonalRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? metric = null,
    Object? value = null,
    Object? formattedValue = freezed,
    Object? achievedAt = null,
    Object? previousValue = freezed,
    Object? previousAchievedAt = freezed,
    Object? isAllTime = null,
    Object? timesImproved = null,
    Object? context = freezed,
  }) {
    return _then(
      _$PersonalRecordImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as RecordCategory,
        metric: null == metric
            ? _value.metric
            : metric // ignore: cast_nullable_to_non_nullable
                  as RecordMetric,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
        formattedValue: freezed == formattedValue
            ? _value.formattedValue
            : formattedValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        achievedAt: null == achievedAt
            ? _value.achievedAt
            : achievedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        previousValue: freezed == previousValue
            ? _value.previousValue
            : previousValue // ignore: cast_nullable_to_non_nullable
                  as double?,
        previousAchievedAt: freezed == previousAchievedAt
            ? _value.previousAchievedAt
            : previousAchievedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isAllTime: null == isAllTime
            ? _value.isAllTime
            : isAllTime // ignore: cast_nullable_to_non_nullable
                  as bool,
        timesImproved: null == timesImproved
            ? _value.timesImproved
            : timesImproved // ignore: cast_nullable_to_non_nullable
                  as int,
        context: freezed == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalRecordImpl extends _PersonalRecord {
  const _$PersonalRecordImpl({
    required this.id,
    required this.category,
    required this.metric,
    required this.value,
    this.formattedValue,
    required this.achievedAt,
    this.previousValue,
    this.previousAchievedAt,
    this.isAllTime = true,
    this.timesImproved = 0,
    this.context,
  }) : super._();

  factory _$PersonalRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalRecordImplFromJson(json);

  @override
  final String id;
  @override
  final RecordCategory category;
  @override
  final RecordMetric metric;

  /// Current best value
  @override
  final double value;

  /// Formatted value for display
  @override
  final String? formattedValue;

  /// When this record was achieved
  @override
  final DateTime achievedAt;

  /// Previous record value (if any)
  @override
  final double? previousValue;

  /// Previous record date
  @override
  final DateTime? previousAchievedAt;

  /// Is this the all-time best?
  @override
  @JsonKey()
  final bool isAllTime;

  /// Times this record has been broken
  @override
  @JsonKey()
  final int timesImproved;

  /// Additional context (e.g., workout type)
  @override
  final String? context;

  @override
  String toString() {
    return 'PersonalRecord(id: $id, category: $category, metric: $metric, value: $value, formattedValue: $formattedValue, achievedAt: $achievedAt, previousValue: $previousValue, previousAchievedAt: $previousAchievedAt, isAllTime: $isAllTime, timesImproved: $timesImproved, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.metric, metric) || other.metric == metric) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.formattedValue, formattedValue) ||
                other.formattedValue == formattedValue) &&
            (identical(other.achievedAt, achievedAt) ||
                other.achievedAt == achievedAt) &&
            (identical(other.previousValue, previousValue) ||
                other.previousValue == previousValue) &&
            (identical(other.previousAchievedAt, previousAchievedAt) ||
                other.previousAchievedAt == previousAchievedAt) &&
            (identical(other.isAllTime, isAllTime) ||
                other.isAllTime == isAllTime) &&
            (identical(other.timesImproved, timesImproved) ||
                other.timesImproved == timesImproved) &&
            (identical(other.context, context) || other.context == context));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    category,
    metric,
    value,
    formattedValue,
    achievedAt,
    previousValue,
    previousAchievedAt,
    isAllTime,
    timesImproved,
    context,
  );

  /// Create a copy of PersonalRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalRecordImplCopyWith<_$PersonalRecordImpl> get copyWith =>
      __$$PersonalRecordImplCopyWithImpl<_$PersonalRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalRecordImplToJson(this);
  }
}

abstract class _PersonalRecord extends PersonalRecord {
  const factory _PersonalRecord({
    required final String id,
    required final RecordCategory category,
    required final RecordMetric metric,
    required final double value,
    final String? formattedValue,
    required final DateTime achievedAt,
    final double? previousValue,
    final DateTime? previousAchievedAt,
    final bool isAllTime,
    final int timesImproved,
    final String? context,
  }) = _$PersonalRecordImpl;
  const _PersonalRecord._() : super._();

  factory _PersonalRecord.fromJson(Map<String, dynamic> json) =
      _$PersonalRecordImpl.fromJson;

  @override
  String get id;
  @override
  RecordCategory get category;
  @override
  RecordMetric get metric;

  /// Current best value
  @override
  double get value;

  /// Formatted value for display
  @override
  String? get formattedValue;

  /// When this record was achieved
  @override
  DateTime get achievedAt;

  /// Previous record value (if any)
  @override
  double? get previousValue;

  /// Previous record date
  @override
  DateTime? get previousAchievedAt;

  /// Is this the all-time best?
  @override
  bool get isAllTime;

  /// Times this record has been broken
  @override
  int get timesImproved;

  /// Additional context (e.g., workout type)
  @override
  String? get context;

  /// Create a copy of PersonalRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalRecordImplCopyWith<_$PersonalRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalRecordCollection _$PersonalRecordCollectionFromJson(
  Map<String, dynamic> json,
) {
  return _PersonalRecordCollection.fromJson(json);
}

/// @nodoc
mixin _$PersonalRecordCollection {
  String get userId => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  List<PersonalRecord> get records => throw _privateConstructorUsedError;

  /// Serializes this PersonalRecordCollection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalRecordCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalRecordCollectionCopyWith<PersonalRecordCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalRecordCollectionCopyWith<$Res> {
  factory $PersonalRecordCollectionCopyWith(
    PersonalRecordCollection value,
    $Res Function(PersonalRecordCollection) then,
  ) = _$PersonalRecordCollectionCopyWithImpl<$Res, PersonalRecordCollection>;
  @useResult
  $Res call({
    String userId,
    DateTime lastUpdated,
    List<PersonalRecord> records,
  });
}

/// @nodoc
class _$PersonalRecordCollectionCopyWithImpl<
  $Res,
  $Val extends PersonalRecordCollection
>
    implements $PersonalRecordCollectionCopyWith<$Res> {
  _$PersonalRecordCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalRecordCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? lastUpdated = null,
    Object? records = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            lastUpdated: null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            records: null == records
                ? _value.records
                : records // ignore: cast_nullable_to_non_nullable
                      as List<PersonalRecord>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PersonalRecordCollectionImplCopyWith<$Res>
    implements $PersonalRecordCollectionCopyWith<$Res> {
  factory _$$PersonalRecordCollectionImplCopyWith(
    _$PersonalRecordCollectionImpl value,
    $Res Function(_$PersonalRecordCollectionImpl) then,
  ) = __$$PersonalRecordCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    DateTime lastUpdated,
    List<PersonalRecord> records,
  });
}

/// @nodoc
class __$$PersonalRecordCollectionImplCopyWithImpl<$Res>
    extends
        _$PersonalRecordCollectionCopyWithImpl<
          $Res,
          _$PersonalRecordCollectionImpl
        >
    implements _$$PersonalRecordCollectionImplCopyWith<$Res> {
  __$$PersonalRecordCollectionImplCopyWithImpl(
    _$PersonalRecordCollectionImpl _value,
    $Res Function(_$PersonalRecordCollectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PersonalRecordCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? lastUpdated = null,
    Object? records = null,
  }) {
    return _then(
      _$PersonalRecordCollectionImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        records: null == records
            ? _value._records
            : records // ignore: cast_nullable_to_non_nullable
                  as List<PersonalRecord>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalRecordCollectionImpl extends _PersonalRecordCollection {
  const _$PersonalRecordCollectionImpl({
    required this.userId,
    required this.lastUpdated,
    final List<PersonalRecord> records = const [],
  }) : _records = records,
       super._();

  factory _$PersonalRecordCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalRecordCollectionImplFromJson(json);

  @override
  final String userId;
  @override
  final DateTime lastUpdated;
  final List<PersonalRecord> _records;
  @override
  @JsonKey()
  List<PersonalRecord> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  String toString() {
    return 'PersonalRecordCollection(userId: $userId, lastUpdated: $lastUpdated, records: $records)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalRecordCollectionImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    lastUpdated,
    const DeepCollectionEquality().hash(_records),
  );

  /// Create a copy of PersonalRecordCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalRecordCollectionImplCopyWith<_$PersonalRecordCollectionImpl>
  get copyWith =>
      __$$PersonalRecordCollectionImplCopyWithImpl<
        _$PersonalRecordCollectionImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalRecordCollectionImplToJson(this);
  }
}

abstract class _PersonalRecordCollection extends PersonalRecordCollection {
  const factory _PersonalRecordCollection({
    required final String userId,
    required final DateTime lastUpdated,
    final List<PersonalRecord> records,
  }) = _$PersonalRecordCollectionImpl;
  const _PersonalRecordCollection._() : super._();

  factory _PersonalRecordCollection.fromJson(Map<String, dynamic> json) =
      _$PersonalRecordCollectionImpl.fromJson;

  @override
  String get userId;
  @override
  DateTime get lastUpdated;
  @override
  List<PersonalRecord> get records;

  /// Create a copy of PersonalRecordCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalRecordCollectionImplCopyWith<_$PersonalRecordCollectionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AllTimeStats _$AllTimeStatsFromJson(Map<String, dynamic> json) {
  return _AllTimeStats.fromJson(json);
}

/// @nodoc
mixin _$AllTimeStats {
  String get userId => throw _privateConstructorUsedError;
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Total days tracked
  int get totalDaysTracked => throw _privateConstructorUsedError;

  /// Total workouts completed
  int get totalWorkouts => throw _privateConstructorUsedError;

  /// Total meals logged
  int get totalMealsLogged => throw _privateConstructorUsedError;

  /// Total calories burned
  int get totalCaloriesBurned => throw _privateConstructorUsedError;

  /// Total steps
  int get totalSteps => throw _privateConstructorUsedError;

  /// Total hours of sleep
  double get totalSleepHours => throw _privateConstructorUsedError;

  /// Average recovery score
  double get avgRecovery => throw _privateConstructorUsedError;

  /// Average strain score
  double get avgStrain => throw _privateConstructorUsedError;

  /// Best week (date + score)
  DateTime? get bestWeekDate => throw _privateConstructorUsedError;
  double? get bestWeekScore => throw _privateConstructorUsedError;

  /// Best month (date + score)
  DateTime? get bestMonthDate => throw _privateConstructorUsedError;
  double? get bestMonthScore => throw _privateConstructorUsedError;

  /// Personal records
  PersonalRecordCollection get records => throw _privateConstructorUsedError;

  /// Serializes this AllTimeStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllTimeStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllTimeStatsCopyWith<AllTimeStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllTimeStatsCopyWith<$Res> {
  factory $AllTimeStatsCopyWith(
    AllTimeStats value,
    $Res Function(AllTimeStats) then,
  ) = _$AllTimeStatsCopyWithImpl<$Res, AllTimeStats>;
  @useResult
  $Res call({
    String userId,
    DateTime calculatedAt,
    int totalDaysTracked,
    int totalWorkouts,
    int totalMealsLogged,
    int totalCaloriesBurned,
    int totalSteps,
    double totalSleepHours,
    double avgRecovery,
    double avgStrain,
    DateTime? bestWeekDate,
    double? bestWeekScore,
    DateTime? bestMonthDate,
    double? bestMonthScore,
    PersonalRecordCollection records,
  });

  $PersonalRecordCollectionCopyWith<$Res> get records;
}

/// @nodoc
class _$AllTimeStatsCopyWithImpl<$Res, $Val extends AllTimeStats>
    implements $AllTimeStatsCopyWith<$Res> {
  _$AllTimeStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllTimeStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? calculatedAt = null,
    Object? totalDaysTracked = null,
    Object? totalWorkouts = null,
    Object? totalMealsLogged = null,
    Object? totalCaloriesBurned = null,
    Object? totalSteps = null,
    Object? totalSleepHours = null,
    Object? avgRecovery = null,
    Object? avgStrain = null,
    Object? bestWeekDate = freezed,
    Object? bestWeekScore = freezed,
    Object? bestMonthDate = freezed,
    Object? bestMonthScore = freezed,
    Object? records = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            calculatedAt: null == calculatedAt
                ? _value.calculatedAt
                : calculatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            totalDaysTracked: null == totalDaysTracked
                ? _value.totalDaysTracked
                : totalDaysTracked // ignore: cast_nullable_to_non_nullable
                      as int,
            totalWorkouts: null == totalWorkouts
                ? _value.totalWorkouts
                : totalWorkouts // ignore: cast_nullable_to_non_nullable
                      as int,
            totalMealsLogged: null == totalMealsLogged
                ? _value.totalMealsLogged
                : totalMealsLogged // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCaloriesBurned: null == totalCaloriesBurned
                ? _value.totalCaloriesBurned
                : totalCaloriesBurned // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSteps: null == totalSteps
                ? _value.totalSteps
                : totalSteps // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSleepHours: null == totalSleepHours
                ? _value.totalSleepHours
                : totalSleepHours // ignore: cast_nullable_to_non_nullable
                      as double,
            avgRecovery: null == avgRecovery
                ? _value.avgRecovery
                : avgRecovery // ignore: cast_nullable_to_non_nullable
                      as double,
            avgStrain: null == avgStrain
                ? _value.avgStrain
                : avgStrain // ignore: cast_nullable_to_non_nullable
                      as double,
            bestWeekDate: freezed == bestWeekDate
                ? _value.bestWeekDate
                : bestWeekDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            bestWeekScore: freezed == bestWeekScore
                ? _value.bestWeekScore
                : bestWeekScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            bestMonthDate: freezed == bestMonthDate
                ? _value.bestMonthDate
                : bestMonthDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            bestMonthScore: freezed == bestMonthScore
                ? _value.bestMonthScore
                : bestMonthScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            records: null == records
                ? _value.records
                : records // ignore: cast_nullable_to_non_nullable
                      as PersonalRecordCollection,
          )
          as $Val,
    );
  }

  /// Create a copy of AllTimeStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalRecordCollectionCopyWith<$Res> get records {
    return $PersonalRecordCollectionCopyWith<$Res>(_value.records, (value) {
      return _then(_value.copyWith(records: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AllTimeStatsImplCopyWith<$Res>
    implements $AllTimeStatsCopyWith<$Res> {
  factory _$$AllTimeStatsImplCopyWith(
    _$AllTimeStatsImpl value,
    $Res Function(_$AllTimeStatsImpl) then,
  ) = __$$AllTimeStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    DateTime calculatedAt,
    int totalDaysTracked,
    int totalWorkouts,
    int totalMealsLogged,
    int totalCaloriesBurned,
    int totalSteps,
    double totalSleepHours,
    double avgRecovery,
    double avgStrain,
    DateTime? bestWeekDate,
    double? bestWeekScore,
    DateTime? bestMonthDate,
    double? bestMonthScore,
    PersonalRecordCollection records,
  });

  @override
  $PersonalRecordCollectionCopyWith<$Res> get records;
}

/// @nodoc
class __$$AllTimeStatsImplCopyWithImpl<$Res>
    extends _$AllTimeStatsCopyWithImpl<$Res, _$AllTimeStatsImpl>
    implements _$$AllTimeStatsImplCopyWith<$Res> {
  __$$AllTimeStatsImplCopyWithImpl(
    _$AllTimeStatsImpl _value,
    $Res Function(_$AllTimeStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AllTimeStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? calculatedAt = null,
    Object? totalDaysTracked = null,
    Object? totalWorkouts = null,
    Object? totalMealsLogged = null,
    Object? totalCaloriesBurned = null,
    Object? totalSteps = null,
    Object? totalSleepHours = null,
    Object? avgRecovery = null,
    Object? avgStrain = null,
    Object? bestWeekDate = freezed,
    Object? bestWeekScore = freezed,
    Object? bestMonthDate = freezed,
    Object? bestMonthScore = freezed,
    Object? records = null,
  }) {
    return _then(
      _$AllTimeStatsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        calculatedAt: null == calculatedAt
            ? _value.calculatedAt
            : calculatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        totalDaysTracked: null == totalDaysTracked
            ? _value.totalDaysTracked
            : totalDaysTracked // ignore: cast_nullable_to_non_nullable
                  as int,
        totalWorkouts: null == totalWorkouts
            ? _value.totalWorkouts
            : totalWorkouts // ignore: cast_nullable_to_non_nullable
                  as int,
        totalMealsLogged: null == totalMealsLogged
            ? _value.totalMealsLogged
            : totalMealsLogged // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCaloriesBurned: null == totalCaloriesBurned
            ? _value.totalCaloriesBurned
            : totalCaloriesBurned // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSteps: null == totalSteps
            ? _value.totalSteps
            : totalSteps // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSleepHours: null == totalSleepHours
            ? _value.totalSleepHours
            : totalSleepHours // ignore: cast_nullable_to_non_nullable
                  as double,
        avgRecovery: null == avgRecovery
            ? _value.avgRecovery
            : avgRecovery // ignore: cast_nullable_to_non_nullable
                  as double,
        avgStrain: null == avgStrain
            ? _value.avgStrain
            : avgStrain // ignore: cast_nullable_to_non_nullable
                  as double,
        bestWeekDate: freezed == bestWeekDate
            ? _value.bestWeekDate
            : bestWeekDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        bestWeekScore: freezed == bestWeekScore
            ? _value.bestWeekScore
            : bestWeekScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        bestMonthDate: freezed == bestMonthDate
            ? _value.bestMonthDate
            : bestMonthDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        bestMonthScore: freezed == bestMonthScore
            ? _value.bestMonthScore
            : bestMonthScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        records: null == records
            ? _value.records
            : records // ignore: cast_nullable_to_non_nullable
                  as PersonalRecordCollection,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AllTimeStatsImpl implements _AllTimeStats {
  const _$AllTimeStatsImpl({
    required this.userId,
    required this.calculatedAt,
    required this.totalDaysTracked,
    required this.totalWorkouts,
    required this.totalMealsLogged,
    required this.totalCaloriesBurned,
    required this.totalSteps,
    required this.totalSleepHours,
    required this.avgRecovery,
    required this.avgStrain,
    this.bestWeekDate,
    this.bestWeekScore,
    this.bestMonthDate,
    this.bestMonthScore,
    required this.records,
  });

  factory _$AllTimeStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllTimeStatsImplFromJson(json);

  @override
  final String userId;
  @override
  final DateTime calculatedAt;

  /// Total days tracked
  @override
  final int totalDaysTracked;

  /// Total workouts completed
  @override
  final int totalWorkouts;

  /// Total meals logged
  @override
  final int totalMealsLogged;

  /// Total calories burned
  @override
  final int totalCaloriesBurned;

  /// Total steps
  @override
  final int totalSteps;

  /// Total hours of sleep
  @override
  final double totalSleepHours;

  /// Average recovery score
  @override
  final double avgRecovery;

  /// Average strain score
  @override
  final double avgStrain;

  /// Best week (date + score)
  @override
  final DateTime? bestWeekDate;
  @override
  final double? bestWeekScore;

  /// Best month (date + score)
  @override
  final DateTime? bestMonthDate;
  @override
  final double? bestMonthScore;

  /// Personal records
  @override
  final PersonalRecordCollection records;

  @override
  String toString() {
    return 'AllTimeStats(userId: $userId, calculatedAt: $calculatedAt, totalDaysTracked: $totalDaysTracked, totalWorkouts: $totalWorkouts, totalMealsLogged: $totalMealsLogged, totalCaloriesBurned: $totalCaloriesBurned, totalSteps: $totalSteps, totalSleepHours: $totalSleepHours, avgRecovery: $avgRecovery, avgStrain: $avgStrain, bestWeekDate: $bestWeekDate, bestWeekScore: $bestWeekScore, bestMonthDate: $bestMonthDate, bestMonthScore: $bestMonthScore, records: $records)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllTimeStatsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt) &&
            (identical(other.totalDaysTracked, totalDaysTracked) ||
                other.totalDaysTracked == totalDaysTracked) &&
            (identical(other.totalWorkouts, totalWorkouts) ||
                other.totalWorkouts == totalWorkouts) &&
            (identical(other.totalMealsLogged, totalMealsLogged) ||
                other.totalMealsLogged == totalMealsLogged) &&
            (identical(other.totalCaloriesBurned, totalCaloriesBurned) ||
                other.totalCaloriesBurned == totalCaloriesBurned) &&
            (identical(other.totalSteps, totalSteps) ||
                other.totalSteps == totalSteps) &&
            (identical(other.totalSleepHours, totalSleepHours) ||
                other.totalSleepHours == totalSleepHours) &&
            (identical(other.avgRecovery, avgRecovery) ||
                other.avgRecovery == avgRecovery) &&
            (identical(other.avgStrain, avgStrain) ||
                other.avgStrain == avgStrain) &&
            (identical(other.bestWeekDate, bestWeekDate) ||
                other.bestWeekDate == bestWeekDate) &&
            (identical(other.bestWeekScore, bestWeekScore) ||
                other.bestWeekScore == bestWeekScore) &&
            (identical(other.bestMonthDate, bestMonthDate) ||
                other.bestMonthDate == bestMonthDate) &&
            (identical(other.bestMonthScore, bestMonthScore) ||
                other.bestMonthScore == bestMonthScore) &&
            (identical(other.records, records) || other.records == records));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    calculatedAt,
    totalDaysTracked,
    totalWorkouts,
    totalMealsLogged,
    totalCaloriesBurned,
    totalSteps,
    totalSleepHours,
    avgRecovery,
    avgStrain,
    bestWeekDate,
    bestWeekScore,
    bestMonthDate,
    bestMonthScore,
    records,
  );

  /// Create a copy of AllTimeStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllTimeStatsImplCopyWith<_$AllTimeStatsImpl> get copyWith =>
      __$$AllTimeStatsImplCopyWithImpl<_$AllTimeStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllTimeStatsImplToJson(this);
  }
}

abstract class _AllTimeStats implements AllTimeStats {
  const factory _AllTimeStats({
    required final String userId,
    required final DateTime calculatedAt,
    required final int totalDaysTracked,
    required final int totalWorkouts,
    required final int totalMealsLogged,
    required final int totalCaloriesBurned,
    required final int totalSteps,
    required final double totalSleepHours,
    required final double avgRecovery,
    required final double avgStrain,
    final DateTime? bestWeekDate,
    final double? bestWeekScore,
    final DateTime? bestMonthDate,
    final double? bestMonthScore,
    required final PersonalRecordCollection records,
  }) = _$AllTimeStatsImpl;

  factory _AllTimeStats.fromJson(Map<String, dynamic> json) =
      _$AllTimeStatsImpl.fromJson;

  @override
  String get userId;
  @override
  DateTime get calculatedAt;

  /// Total days tracked
  @override
  int get totalDaysTracked;

  /// Total workouts completed
  @override
  int get totalWorkouts;

  /// Total meals logged
  @override
  int get totalMealsLogged;

  /// Total calories burned
  @override
  int get totalCaloriesBurned;

  /// Total steps
  @override
  int get totalSteps;

  /// Total hours of sleep
  @override
  double get totalSleepHours;

  /// Average recovery score
  @override
  double get avgRecovery;

  /// Average strain score
  @override
  double get avgStrain;

  /// Best week (date + score)
  @override
  DateTime? get bestWeekDate;
  @override
  double? get bestWeekScore;

  /// Best month (date + score)
  @override
  DateTime? get bestMonthDate;
  @override
  double? get bestMonthScore;

  /// Personal records
  @override
  PersonalRecordCollection get records;

  /// Create a copy of AllTimeStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllTimeStatsImplCopyWith<_$AllTimeStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
