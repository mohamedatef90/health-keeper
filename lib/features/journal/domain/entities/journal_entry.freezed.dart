// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JournalEntry _$JournalEntryFromJson(Map<String, dynamic> json) {
  return _JournalEntry.fromJson(json);
}

/// @nodoc
mixin _$JournalEntry {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// List of logged behaviors for this entry
  List<LoggedBehavior> get behaviors => throw _privateConstructorUsedError;

  /// Optional notes for the day
  String? get notes => throw _privateConstructorUsedError;

  /// Overall mood/energy level (1-5)
  int? get moodLevel => throw _privateConstructorUsedError;

  /// Overall stress level (1-5)
  int? get stressLevel => throw _privateConstructorUsedError;

  /// Whether this entry has been reviewed
  bool get isReviewed => throw _privateConstructorUsedError;

  /// Tags for categorization
  List<String> get tags => throw _privateConstructorUsedError;

  /// Serializes this JournalEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalEntryCopyWith<JournalEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntryCopyWith<$Res> {
  factory $JournalEntryCopyWith(
    JournalEntry value,
    $Res Function(JournalEntry) then,
  ) = _$JournalEntryCopyWithImpl<$Res, JournalEntry>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime createdAt,
    DateTime updatedAt,
    List<LoggedBehavior> behaviors,
    String? notes,
    int? moodLevel,
    int? stressLevel,
    bool isReviewed,
    List<String> tags,
  });
}

/// @nodoc
class _$JournalEntryCopyWithImpl<$Res, $Val extends JournalEntry>
    implements $JournalEntryCopyWith<$Res> {
  _$JournalEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? behaviors = null,
    Object? notes = freezed,
    Object? moodLevel = freezed,
    Object? stressLevel = freezed,
    Object? isReviewed = null,
    Object? tags = null,
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
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            behaviors: null == behaviors
                ? _value.behaviors
                : behaviors // ignore: cast_nullable_to_non_nullable
                      as List<LoggedBehavior>,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            moodLevel: freezed == moodLevel
                ? _value.moodLevel
                : moodLevel // ignore: cast_nullable_to_non_nullable
                      as int?,
            stressLevel: freezed == stressLevel
                ? _value.stressLevel
                : stressLevel // ignore: cast_nullable_to_non_nullable
                      as int?,
            isReviewed: null == isReviewed
                ? _value.isReviewed
                : isReviewed // ignore: cast_nullable_to_non_nullable
                      as bool,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JournalEntryImplCopyWith<$Res>
    implements $JournalEntryCopyWith<$Res> {
  factory _$$JournalEntryImplCopyWith(
    _$JournalEntryImpl value,
    $Res Function(_$JournalEntryImpl) then,
  ) = __$$JournalEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime createdAt,
    DateTime updatedAt,
    List<LoggedBehavior> behaviors,
    String? notes,
    int? moodLevel,
    int? stressLevel,
    bool isReviewed,
    List<String> tags,
  });
}

/// @nodoc
class __$$JournalEntryImplCopyWithImpl<$Res>
    extends _$JournalEntryCopyWithImpl<$Res, _$JournalEntryImpl>
    implements _$$JournalEntryImplCopyWith<$Res> {
  __$$JournalEntryImplCopyWithImpl(
    _$JournalEntryImpl _value,
    $Res Function(_$JournalEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? behaviors = null,
    Object? notes = freezed,
    Object? moodLevel = freezed,
    Object? stressLevel = freezed,
    Object? isReviewed = null,
    Object? tags = null,
  }) {
    return _then(
      _$JournalEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        behaviors: null == behaviors
            ? _value._behaviors
            : behaviors // ignore: cast_nullable_to_non_nullable
                  as List<LoggedBehavior>,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        moodLevel: freezed == moodLevel
            ? _value.moodLevel
            : moodLevel // ignore: cast_nullable_to_non_nullable
                  as int?,
        stressLevel: freezed == stressLevel
            ? _value.stressLevel
            : stressLevel // ignore: cast_nullable_to_non_nullable
                  as int?,
        isReviewed: null == isReviewed
            ? _value.isReviewed
            : isReviewed // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalEntryImpl implements _JournalEntry {
  const _$JournalEntryImpl({
    required this.id,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    final List<LoggedBehavior> behaviors = const [],
    this.notes,
    this.moodLevel,
    this.stressLevel,
    this.isReviewed = false,
    final List<String> tags = const [],
  }) : _behaviors = behaviors,
       _tags = tags;

  factory _$JournalEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalEntryImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// List of logged behaviors for this entry
  final List<LoggedBehavior> _behaviors;

  /// List of logged behaviors for this entry
  @override
  @JsonKey()
  List<LoggedBehavior> get behaviors {
    if (_behaviors is EqualUnmodifiableListView) return _behaviors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_behaviors);
  }

  /// Optional notes for the day
  @override
  final String? notes;

  /// Overall mood/energy level (1-5)
  @override
  final int? moodLevel;

  /// Overall stress level (1-5)
  @override
  final int? stressLevel;

  /// Whether this entry has been reviewed
  @override
  @JsonKey()
  final bool isReviewed;

  /// Tags for categorization
  final List<String> _tags;

  /// Tags for categorization
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'JournalEntry(id: $id, date: $date, createdAt: $createdAt, updatedAt: $updatedAt, behaviors: $behaviors, notes: $notes, moodLevel: $moodLevel, stressLevel: $stressLevel, isReviewed: $isReviewed, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(
              other._behaviors,
              _behaviors,
            ) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.moodLevel, moodLevel) ||
                other.moodLevel == moodLevel) &&
            (identical(other.stressLevel, stressLevel) ||
                other.stressLevel == stressLevel) &&
            (identical(other.isReviewed, isReviewed) ||
                other.isReviewed == isReviewed) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_behaviors),
    notes,
    moodLevel,
    stressLevel,
    isReviewed,
    const DeepCollectionEquality().hash(_tags),
  );

  /// Create a copy of JournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalEntryImplCopyWith<_$JournalEntryImpl> get copyWith =>
      __$$JournalEntryImplCopyWithImpl<_$JournalEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalEntryImplToJson(this);
  }
}

abstract class _JournalEntry implements JournalEntry {
  const factory _JournalEntry({
    required final String id,
    required final DateTime date,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final List<LoggedBehavior> behaviors,
    final String? notes,
    final int? moodLevel,
    final int? stressLevel,
    final bool isReviewed,
    final List<String> tags,
  }) = _$JournalEntryImpl;

  factory _JournalEntry.fromJson(Map<String, dynamic> json) =
      _$JournalEntryImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// List of logged behaviors for this entry
  @override
  List<LoggedBehavior> get behaviors;

  /// Optional notes for the day
  @override
  String? get notes;

  /// Overall mood/energy level (1-5)
  @override
  int? get moodLevel;

  /// Overall stress level (1-5)
  @override
  int? get stressLevel;

  /// Whether this entry has been reviewed
  @override
  bool get isReviewed;

  /// Tags for categorization
  @override
  List<String> get tags;

  /// Create a copy of JournalEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalEntryImplCopyWith<_$JournalEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoggedBehavior _$LoggedBehaviorFromJson(Map<String, dynamic> json) {
  return _LoggedBehavior.fromJson(json);
}

/// @nodoc
mixin _$LoggedBehavior {
  String get id => throw _privateConstructorUsedError;

  /// Reference to the behavior definition
  String get behaviorId => throw _privateConstructorUsedError;

  /// Time the behavior was logged
  DateTime get loggedAt => throw _privateConstructorUsedError;

  /// Numeric value (if applicable)
  double? get value => throw _privateConstructorUsedError;

  /// Unit for the value
  String? get unit => throw _privateConstructorUsedError;

  /// Intensity/severity (1-5)
  int? get intensity => throw _privateConstructorUsedError;

  /// Duration in minutes (if applicable)
  int? get durationMinutes => throw _privateConstructorUsedError;

  /// Optional note specific to this log
  String? get note => throw _privateConstructorUsedError;

  /// Custom data as JSON string
  String? get customDataJson => throw _privateConstructorUsedError;

  /// Serializes this LoggedBehavior to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoggedBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoggedBehaviorCopyWith<LoggedBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedBehaviorCopyWith<$Res> {
  factory $LoggedBehaviorCopyWith(
    LoggedBehavior value,
    $Res Function(LoggedBehavior) then,
  ) = _$LoggedBehaviorCopyWithImpl<$Res, LoggedBehavior>;
  @useResult
  $Res call({
    String id,
    String behaviorId,
    DateTime loggedAt,
    double? value,
    String? unit,
    int? intensity,
    int? durationMinutes,
    String? note,
    String? customDataJson,
  });
}

/// @nodoc
class _$LoggedBehaviorCopyWithImpl<$Res, $Val extends LoggedBehavior>
    implements $LoggedBehaviorCopyWith<$Res> {
  _$LoggedBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoggedBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? behaviorId = null,
    Object? loggedAt = null,
    Object? value = freezed,
    Object? unit = freezed,
    Object? intensity = freezed,
    Object? durationMinutes = freezed,
    Object? note = freezed,
    Object? customDataJson = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            behaviorId: null == behaviorId
                ? _value.behaviorId
                : behaviorId // ignore: cast_nullable_to_non_nullable
                      as String,
            loggedAt: null == loggedAt
                ? _value.loggedAt
                : loggedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            value: freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double?,
            unit: freezed == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String?,
            intensity: freezed == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                      as int?,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            customDataJson: freezed == customDataJson
                ? _value.customDataJson
                : customDataJson // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoggedBehaviorImplCopyWith<$Res>
    implements $LoggedBehaviorCopyWith<$Res> {
  factory _$$LoggedBehaviorImplCopyWith(
    _$LoggedBehaviorImpl value,
    $Res Function(_$LoggedBehaviorImpl) then,
  ) = __$$LoggedBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String behaviorId,
    DateTime loggedAt,
    double? value,
    String? unit,
    int? intensity,
    int? durationMinutes,
    String? note,
    String? customDataJson,
  });
}

/// @nodoc
class __$$LoggedBehaviorImplCopyWithImpl<$Res>
    extends _$LoggedBehaviorCopyWithImpl<$Res, _$LoggedBehaviorImpl>
    implements _$$LoggedBehaviorImplCopyWith<$Res> {
  __$$LoggedBehaviorImplCopyWithImpl(
    _$LoggedBehaviorImpl _value,
    $Res Function(_$LoggedBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoggedBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? behaviorId = null,
    Object? loggedAt = null,
    Object? value = freezed,
    Object? unit = freezed,
    Object? intensity = freezed,
    Object? durationMinutes = freezed,
    Object? note = freezed,
    Object? customDataJson = freezed,
  }) {
    return _then(
      _$LoggedBehaviorImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        behaviorId: null == behaviorId
            ? _value.behaviorId
            : behaviorId // ignore: cast_nullable_to_non_nullable
                  as String,
        loggedAt: null == loggedAt
            ? _value.loggedAt
            : loggedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        value: freezed == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double?,
        unit: freezed == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String?,
        intensity: freezed == intensity
            ? _value.intensity
            : intensity // ignore: cast_nullable_to_non_nullable
                  as int?,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        customDataJson: freezed == customDataJson
            ? _value.customDataJson
            : customDataJson // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoggedBehaviorImpl implements _LoggedBehavior {
  const _$LoggedBehaviorImpl({
    required this.id,
    required this.behaviorId,
    required this.loggedAt,
    this.value,
    this.unit,
    this.intensity,
    this.durationMinutes,
    this.note,
    this.customDataJson,
  });

  factory _$LoggedBehaviorImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoggedBehaviorImplFromJson(json);

  @override
  final String id;

  /// Reference to the behavior definition
  @override
  final String behaviorId;

  /// Time the behavior was logged
  @override
  final DateTime loggedAt;

  /// Numeric value (if applicable)
  @override
  final double? value;

  /// Unit for the value
  @override
  final String? unit;

  /// Intensity/severity (1-5)
  @override
  final int? intensity;

  /// Duration in minutes (if applicable)
  @override
  final int? durationMinutes;

  /// Optional note specific to this log
  @override
  final String? note;

  /// Custom data as JSON string
  @override
  final String? customDataJson;

  @override
  String toString() {
    return 'LoggedBehavior(id: $id, behaviorId: $behaviorId, loggedAt: $loggedAt, value: $value, unit: $unit, intensity: $intensity, durationMinutes: $durationMinutes, note: $note, customDataJson: $customDataJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedBehaviorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.behaviorId, behaviorId) ||
                other.behaviorId == behaviorId) &&
            (identical(other.loggedAt, loggedAt) ||
                other.loggedAt == loggedAt) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.customDataJson, customDataJson) ||
                other.customDataJson == customDataJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    behaviorId,
    loggedAt,
    value,
    unit,
    intensity,
    durationMinutes,
    note,
    customDataJson,
  );

  /// Create a copy of LoggedBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedBehaviorImplCopyWith<_$LoggedBehaviorImpl> get copyWith =>
      __$$LoggedBehaviorImplCopyWithImpl<_$LoggedBehaviorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LoggedBehaviorImplToJson(this);
  }
}

abstract class _LoggedBehavior implements LoggedBehavior {
  const factory _LoggedBehavior({
    required final String id,
    required final String behaviorId,
    required final DateTime loggedAt,
    final double? value,
    final String? unit,
    final int? intensity,
    final int? durationMinutes,
    final String? note,
    final String? customDataJson,
  }) = _$LoggedBehaviorImpl;

  factory _LoggedBehavior.fromJson(Map<String, dynamic> json) =
      _$LoggedBehaviorImpl.fromJson;

  @override
  String get id;

  /// Reference to the behavior definition
  @override
  String get behaviorId;

  /// Time the behavior was logged
  @override
  DateTime get loggedAt;

  /// Numeric value (if applicable)
  @override
  double? get value;

  /// Unit for the value
  @override
  String? get unit;

  /// Intensity/severity (1-5)
  @override
  int? get intensity;

  /// Duration in minutes (if applicable)
  @override
  int? get durationMinutes;

  /// Optional note specific to this log
  @override
  String? get note;

  /// Custom data as JSON string
  @override
  String? get customDataJson;

  /// Create a copy of LoggedBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoggedBehaviorImplCopyWith<_$LoggedBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JournalEntrySummary _$JournalEntrySummaryFromJson(Map<String, dynamic> json) {
  return _JournalEntrySummary.fromJson(json);
}

/// @nodoc
mixin _$JournalEntrySummary {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get behaviorsCount => throw _privateConstructorUsedError;
  List<String> get topCategories => throw _privateConstructorUsedError;
  int? get moodLevel => throw _privateConstructorUsedError;
  int? get stressLevel => throw _privateConstructorUsedError;

  /// Serializes this JournalEntrySummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalEntrySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalEntrySummaryCopyWith<JournalEntrySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntrySummaryCopyWith<$Res> {
  factory $JournalEntrySummaryCopyWith(
    JournalEntrySummary value,
    $Res Function(JournalEntrySummary) then,
  ) = _$JournalEntrySummaryCopyWithImpl<$Res, JournalEntrySummary>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    int behaviorsCount,
    List<String> topCategories,
    int? moodLevel,
    int? stressLevel,
  });
}

/// @nodoc
class _$JournalEntrySummaryCopyWithImpl<$Res, $Val extends JournalEntrySummary>
    implements $JournalEntrySummaryCopyWith<$Res> {
  _$JournalEntrySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalEntrySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? behaviorsCount = null,
    Object? topCategories = null,
    Object? moodLevel = freezed,
    Object? stressLevel = freezed,
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
            behaviorsCount: null == behaviorsCount
                ? _value.behaviorsCount
                : behaviorsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            topCategories: null == topCategories
                ? _value.topCategories
                : topCategories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            moodLevel: freezed == moodLevel
                ? _value.moodLevel
                : moodLevel // ignore: cast_nullable_to_non_nullable
                      as int?,
            stressLevel: freezed == stressLevel
                ? _value.stressLevel
                : stressLevel // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JournalEntrySummaryImplCopyWith<$Res>
    implements $JournalEntrySummaryCopyWith<$Res> {
  factory _$$JournalEntrySummaryImplCopyWith(
    _$JournalEntrySummaryImpl value,
    $Res Function(_$JournalEntrySummaryImpl) then,
  ) = __$$JournalEntrySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    int behaviorsCount,
    List<String> topCategories,
    int? moodLevel,
    int? stressLevel,
  });
}

/// @nodoc
class __$$JournalEntrySummaryImplCopyWithImpl<$Res>
    extends _$JournalEntrySummaryCopyWithImpl<$Res, _$JournalEntrySummaryImpl>
    implements _$$JournalEntrySummaryImplCopyWith<$Res> {
  __$$JournalEntrySummaryImplCopyWithImpl(
    _$JournalEntrySummaryImpl _value,
    $Res Function(_$JournalEntrySummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalEntrySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? behaviorsCount = null,
    Object? topCategories = null,
    Object? moodLevel = freezed,
    Object? stressLevel = freezed,
  }) {
    return _then(
      _$JournalEntrySummaryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        behaviorsCount: null == behaviorsCount
            ? _value.behaviorsCount
            : behaviorsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        topCategories: null == topCategories
            ? _value._topCategories
            : topCategories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        moodLevel: freezed == moodLevel
            ? _value.moodLevel
            : moodLevel // ignore: cast_nullable_to_non_nullable
                  as int?,
        stressLevel: freezed == stressLevel
            ? _value.stressLevel
            : stressLevel // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalEntrySummaryImpl implements _JournalEntrySummary {
  const _$JournalEntrySummaryImpl({
    required this.id,
    required this.date,
    required this.behaviorsCount,
    required final List<String> topCategories,
    this.moodLevel,
    this.stressLevel,
  }) : _topCategories = topCategories;

  factory _$JournalEntrySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalEntrySummaryImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final int behaviorsCount;
  final List<String> _topCategories;
  @override
  List<String> get topCategories {
    if (_topCategories is EqualUnmodifiableListView) return _topCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topCategories);
  }

  @override
  final int? moodLevel;
  @override
  final int? stressLevel;

  @override
  String toString() {
    return 'JournalEntrySummary(id: $id, date: $date, behaviorsCount: $behaviorsCount, topCategories: $topCategories, moodLevel: $moodLevel, stressLevel: $stressLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalEntrySummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.behaviorsCount, behaviorsCount) ||
                other.behaviorsCount == behaviorsCount) &&
            const DeepCollectionEquality().equals(
              other._topCategories,
              _topCategories,
            ) &&
            (identical(other.moodLevel, moodLevel) ||
                other.moodLevel == moodLevel) &&
            (identical(other.stressLevel, stressLevel) ||
                other.stressLevel == stressLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    behaviorsCount,
    const DeepCollectionEquality().hash(_topCategories),
    moodLevel,
    stressLevel,
  );

  /// Create a copy of JournalEntrySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalEntrySummaryImplCopyWith<_$JournalEntrySummaryImpl> get copyWith =>
      __$$JournalEntrySummaryImplCopyWithImpl<_$JournalEntrySummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalEntrySummaryImplToJson(this);
  }
}

abstract class _JournalEntrySummary implements JournalEntrySummary {
  const factory _JournalEntrySummary({
    required final String id,
    required final DateTime date,
    required final int behaviorsCount,
    required final List<String> topCategories,
    final int? moodLevel,
    final int? stressLevel,
  }) = _$JournalEntrySummaryImpl;

  factory _JournalEntrySummary.fromJson(Map<String, dynamic> json) =
      _$JournalEntrySummaryImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  int get behaviorsCount;
  @override
  List<String> get topCategories;
  @override
  int? get moodLevel;
  @override
  int? get stressLevel;

  /// Create a copy of JournalEntrySummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalEntrySummaryImplCopyWith<_$JournalEntrySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
