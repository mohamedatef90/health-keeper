// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Streak _$StreakFromJson(Map<String, dynamic> json) {
  return _Streak.fromJson(json);
}

/// @nodoc
mixin _$Streak {
  String get id => throw _privateConstructorUsedError;
  StreakType get type => throw _privateConstructorUsedError;

  /// Current streak count
  int get currentCount => throw _privateConstructorUsedError;

  /// Longest streak ever
  int get longestEver => throw _privateConstructorUsedError;

  /// Last day the streak was achieved
  DateTime? get lastAchievedAt => throw _privateConstructorUsedError;

  /// When the current streak started
  DateTime? get startedAt => throw _privateConstructorUsedError;

  /// When the streak was broken (if not active)
  DateTime? get brokenAt => throw _privateConstructorUsedError;

  /// Is the streak currently active?
  bool get isActive => throw _privateConstructorUsedError;

  /// Milestone reached (7, 30, 100, etc.)
  int? get currentMilestone => throw _privateConstructorUsedError;

  /// Next milestone
  int? get nextMilestone => throw _privateConstructorUsedError;

  /// Days until next milestone
  int? get daysToNextMilestone => throw _privateConstructorUsedError;

  /// Serializes this Streak to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Streak
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreakCopyWith<Streak> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakCopyWith<$Res> {
  factory $StreakCopyWith(Streak value, $Res Function(Streak) then) =
      _$StreakCopyWithImpl<$Res, Streak>;
  @useResult
  $Res call({
    String id,
    StreakType type,
    int currentCount,
    int longestEver,
    DateTime? lastAchievedAt,
    DateTime? startedAt,
    DateTime? brokenAt,
    bool isActive,
    int? currentMilestone,
    int? nextMilestone,
    int? daysToNextMilestone,
  });
}

/// @nodoc
class _$StreakCopyWithImpl<$Res, $Val extends Streak>
    implements $StreakCopyWith<$Res> {
  _$StreakCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Streak
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? currentCount = null,
    Object? longestEver = null,
    Object? lastAchievedAt = freezed,
    Object? startedAt = freezed,
    Object? brokenAt = freezed,
    Object? isActive = null,
    Object? currentMilestone = freezed,
    Object? nextMilestone = freezed,
    Object? daysToNextMilestone = freezed,
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
                      as StreakType,
            currentCount: null == currentCount
                ? _value.currentCount
                : currentCount // ignore: cast_nullable_to_non_nullable
                      as int,
            longestEver: null == longestEver
                ? _value.longestEver
                : longestEver // ignore: cast_nullable_to_non_nullable
                      as int,
            lastAchievedAt: freezed == lastAchievedAt
                ? _value.lastAchievedAt
                : lastAchievedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            brokenAt: freezed == brokenAt
                ? _value.brokenAt
                : brokenAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            currentMilestone: freezed == currentMilestone
                ? _value.currentMilestone
                : currentMilestone // ignore: cast_nullable_to_non_nullable
                      as int?,
            nextMilestone: freezed == nextMilestone
                ? _value.nextMilestone
                : nextMilestone // ignore: cast_nullable_to_non_nullable
                      as int?,
            daysToNextMilestone: freezed == daysToNextMilestone
                ? _value.daysToNextMilestone
                : daysToNextMilestone // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StreakImplCopyWith<$Res> implements $StreakCopyWith<$Res> {
  factory _$$StreakImplCopyWith(
    _$StreakImpl value,
    $Res Function(_$StreakImpl) then,
  ) = __$$StreakImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    StreakType type,
    int currentCount,
    int longestEver,
    DateTime? lastAchievedAt,
    DateTime? startedAt,
    DateTime? brokenAt,
    bool isActive,
    int? currentMilestone,
    int? nextMilestone,
    int? daysToNextMilestone,
  });
}

/// @nodoc
class __$$StreakImplCopyWithImpl<$Res>
    extends _$StreakCopyWithImpl<$Res, _$StreakImpl>
    implements _$$StreakImplCopyWith<$Res> {
  __$$StreakImplCopyWithImpl(
    _$StreakImpl _value,
    $Res Function(_$StreakImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Streak
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? currentCount = null,
    Object? longestEver = null,
    Object? lastAchievedAt = freezed,
    Object? startedAt = freezed,
    Object? brokenAt = freezed,
    Object? isActive = null,
    Object? currentMilestone = freezed,
    Object? nextMilestone = freezed,
    Object? daysToNextMilestone = freezed,
  }) {
    return _then(
      _$StreakImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as StreakType,
        currentCount: null == currentCount
            ? _value.currentCount
            : currentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        longestEver: null == longestEver
            ? _value.longestEver
            : longestEver // ignore: cast_nullable_to_non_nullable
                  as int,
        lastAchievedAt: freezed == lastAchievedAt
            ? _value.lastAchievedAt
            : lastAchievedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        brokenAt: freezed == brokenAt
            ? _value.brokenAt
            : brokenAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        currentMilestone: freezed == currentMilestone
            ? _value.currentMilestone
            : currentMilestone // ignore: cast_nullable_to_non_nullable
                  as int?,
        nextMilestone: freezed == nextMilestone
            ? _value.nextMilestone
            : nextMilestone // ignore: cast_nullable_to_non_nullable
                  as int?,
        daysToNextMilestone: freezed == daysToNextMilestone
            ? _value.daysToNextMilestone
            : daysToNextMilestone // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakImpl extends _Streak {
  const _$StreakImpl({
    required this.id,
    required this.type,
    required this.currentCount,
    required this.longestEver,
    this.lastAchievedAt,
    this.startedAt,
    this.brokenAt,
    required this.isActive,
    this.currentMilestone,
    this.nextMilestone,
    this.daysToNextMilestone,
  }) : super._();

  factory _$StreakImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakImplFromJson(json);

  @override
  final String id;
  @override
  final StreakType type;

  /// Current streak count
  @override
  final int currentCount;

  /// Longest streak ever
  @override
  final int longestEver;

  /// Last day the streak was achieved
  @override
  final DateTime? lastAchievedAt;

  /// When the current streak started
  @override
  final DateTime? startedAt;

  /// When the streak was broken (if not active)
  @override
  final DateTime? brokenAt;

  /// Is the streak currently active?
  @override
  final bool isActive;

  /// Milestone reached (7, 30, 100, etc.)
  @override
  final int? currentMilestone;

  /// Next milestone
  @override
  final int? nextMilestone;

  /// Days until next milestone
  @override
  final int? daysToNextMilestone;

  @override
  String toString() {
    return 'Streak(id: $id, type: $type, currentCount: $currentCount, longestEver: $longestEver, lastAchievedAt: $lastAchievedAt, startedAt: $startedAt, brokenAt: $brokenAt, isActive: $isActive, currentMilestone: $currentMilestone, nextMilestone: $nextMilestone, daysToNextMilestone: $daysToNextMilestone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currentCount, currentCount) ||
                other.currentCount == currentCount) &&
            (identical(other.longestEver, longestEver) ||
                other.longestEver == longestEver) &&
            (identical(other.lastAchievedAt, lastAchievedAt) ||
                other.lastAchievedAt == lastAchievedAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.brokenAt, brokenAt) ||
                other.brokenAt == brokenAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.currentMilestone, currentMilestone) ||
                other.currentMilestone == currentMilestone) &&
            (identical(other.nextMilestone, nextMilestone) ||
                other.nextMilestone == nextMilestone) &&
            (identical(other.daysToNextMilestone, daysToNextMilestone) ||
                other.daysToNextMilestone == daysToNextMilestone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    currentCount,
    longestEver,
    lastAchievedAt,
    startedAt,
    brokenAt,
    isActive,
    currentMilestone,
    nextMilestone,
    daysToNextMilestone,
  );

  /// Create a copy of Streak
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakImplCopyWith<_$StreakImpl> get copyWith =>
      __$$StreakImplCopyWithImpl<_$StreakImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakImplToJson(this);
  }
}

abstract class _Streak extends Streak {
  const factory _Streak({
    required final String id,
    required final StreakType type,
    required final int currentCount,
    required final int longestEver,
    final DateTime? lastAchievedAt,
    final DateTime? startedAt,
    final DateTime? brokenAt,
    required final bool isActive,
    final int? currentMilestone,
    final int? nextMilestone,
    final int? daysToNextMilestone,
  }) = _$StreakImpl;
  const _Streak._() : super._();

  factory _Streak.fromJson(Map<String, dynamic> json) = _$StreakImpl.fromJson;

  @override
  String get id;
  @override
  StreakType get type;

  /// Current streak count
  @override
  int get currentCount;

  /// Longest streak ever
  @override
  int get longestEver;

  /// Last day the streak was achieved
  @override
  DateTime? get lastAchievedAt;

  /// When the current streak started
  @override
  DateTime? get startedAt;

  /// When the streak was broken (if not active)
  @override
  DateTime? get brokenAt;

  /// Is the streak currently active?
  @override
  bool get isActive;

  /// Milestone reached (7, 30, 100, etc.)
  @override
  int? get currentMilestone;

  /// Next milestone
  @override
  int? get nextMilestone;

  /// Days until next milestone
  @override
  int? get daysToNextMilestone;

  /// Create a copy of Streak
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreakImplCopyWith<_$StreakImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StreakCollection _$StreakCollectionFromJson(Map<String, dynamic> json) {
  return _StreakCollection.fromJson(json);
}

/// @nodoc
mixin _$StreakCollection {
  String get userId => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  List<Streak> get streaks => throw _privateConstructorUsedError;

  /// Serializes this StreakCollection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StreakCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreakCollectionCopyWith<StreakCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakCollectionCopyWith<$Res> {
  factory $StreakCollectionCopyWith(
    StreakCollection value,
    $Res Function(StreakCollection) then,
  ) = _$StreakCollectionCopyWithImpl<$Res, StreakCollection>;
  @useResult
  $Res call({String userId, DateTime lastUpdated, List<Streak> streaks});
}

/// @nodoc
class _$StreakCollectionCopyWithImpl<$Res, $Val extends StreakCollection>
    implements $StreakCollectionCopyWith<$Res> {
  _$StreakCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreakCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? lastUpdated = null,
    Object? streaks = null,
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
            streaks: null == streaks
                ? _value.streaks
                : streaks // ignore: cast_nullable_to_non_nullable
                      as List<Streak>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StreakCollectionImplCopyWith<$Res>
    implements $StreakCollectionCopyWith<$Res> {
  factory _$$StreakCollectionImplCopyWith(
    _$StreakCollectionImpl value,
    $Res Function(_$StreakCollectionImpl) then,
  ) = __$$StreakCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, DateTime lastUpdated, List<Streak> streaks});
}

/// @nodoc
class __$$StreakCollectionImplCopyWithImpl<$Res>
    extends _$StreakCollectionCopyWithImpl<$Res, _$StreakCollectionImpl>
    implements _$$StreakCollectionImplCopyWith<$Res> {
  __$$StreakCollectionImplCopyWithImpl(
    _$StreakCollectionImpl _value,
    $Res Function(_$StreakCollectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreakCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? lastUpdated = null,
    Object? streaks = null,
  }) {
    return _then(
      _$StreakCollectionImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        streaks: null == streaks
            ? _value._streaks
            : streaks // ignore: cast_nullable_to_non_nullable
                  as List<Streak>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakCollectionImpl extends _StreakCollection {
  const _$StreakCollectionImpl({
    required this.userId,
    required this.lastUpdated,
    final List<Streak> streaks = const [],
  }) : _streaks = streaks,
       super._();

  factory _$StreakCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakCollectionImplFromJson(json);

  @override
  final String userId;
  @override
  final DateTime lastUpdated;
  final List<Streak> _streaks;
  @override
  @JsonKey()
  List<Streak> get streaks {
    if (_streaks is EqualUnmodifiableListView) return _streaks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_streaks);
  }

  @override
  String toString() {
    return 'StreakCollection(userId: $userId, lastUpdated: $lastUpdated, streaks: $streaks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakCollectionImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality().equals(other._streaks, _streaks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    lastUpdated,
    const DeepCollectionEquality().hash(_streaks),
  );

  /// Create a copy of StreakCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakCollectionImplCopyWith<_$StreakCollectionImpl> get copyWith =>
      __$$StreakCollectionImplCopyWithImpl<_$StreakCollectionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakCollectionImplToJson(this);
  }
}

abstract class _StreakCollection extends StreakCollection {
  const factory _StreakCollection({
    required final String userId,
    required final DateTime lastUpdated,
    final List<Streak> streaks,
  }) = _$StreakCollectionImpl;
  const _StreakCollection._() : super._();

  factory _StreakCollection.fromJson(Map<String, dynamic> json) =
      _$StreakCollectionImpl.fromJson;

  @override
  String get userId;
  @override
  DateTime get lastUpdated;
  @override
  List<Streak> get streaks;

  /// Create a copy of StreakCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreakCollectionImplCopyWith<_$StreakCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StreakMilestone _$StreakMilestoneFromJson(Map<String, dynamic> json) {
  return _StreakMilestone.fromJson(json);
}

/// @nodoc
mixin _$StreakMilestone {
  StreakType get streakType => throw _privateConstructorUsedError;
  int get milestone => throw _privateConstructorUsedError;
  DateTime get achievedAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titleAr => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get messageAr => throw _privateConstructorUsedError;
  bool get celebrated => throw _privateConstructorUsedError;

  /// Serializes this StreakMilestone to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StreakMilestone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreakMilestoneCopyWith<StreakMilestone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakMilestoneCopyWith<$Res> {
  factory $StreakMilestoneCopyWith(
    StreakMilestone value,
    $Res Function(StreakMilestone) then,
  ) = _$StreakMilestoneCopyWithImpl<$Res, StreakMilestone>;
  @useResult
  $Res call({
    StreakType streakType,
    int milestone,
    DateTime achievedAt,
    String title,
    String titleAr,
    String message,
    String messageAr,
    bool celebrated,
  });
}

/// @nodoc
class _$StreakMilestoneCopyWithImpl<$Res, $Val extends StreakMilestone>
    implements $StreakMilestoneCopyWith<$Res> {
  _$StreakMilestoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreakMilestone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streakType = null,
    Object? milestone = null,
    Object? achievedAt = null,
    Object? title = null,
    Object? titleAr = null,
    Object? message = null,
    Object? messageAr = null,
    Object? celebrated = null,
  }) {
    return _then(
      _value.copyWith(
            streakType: null == streakType
                ? _value.streakType
                : streakType // ignore: cast_nullable_to_non_nullable
                      as StreakType,
            milestone: null == milestone
                ? _value.milestone
                : milestone // ignore: cast_nullable_to_non_nullable
                      as int,
            achievedAt: null == achievedAt
                ? _value.achievedAt
                : achievedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
            celebrated: null == celebrated
                ? _value.celebrated
                : celebrated // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StreakMilestoneImplCopyWith<$Res>
    implements $StreakMilestoneCopyWith<$Res> {
  factory _$$StreakMilestoneImplCopyWith(
    _$StreakMilestoneImpl value,
    $Res Function(_$StreakMilestoneImpl) then,
  ) = __$$StreakMilestoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    StreakType streakType,
    int milestone,
    DateTime achievedAt,
    String title,
    String titleAr,
    String message,
    String messageAr,
    bool celebrated,
  });
}

/// @nodoc
class __$$StreakMilestoneImplCopyWithImpl<$Res>
    extends _$StreakMilestoneCopyWithImpl<$Res, _$StreakMilestoneImpl>
    implements _$$StreakMilestoneImplCopyWith<$Res> {
  __$$StreakMilestoneImplCopyWithImpl(
    _$StreakMilestoneImpl _value,
    $Res Function(_$StreakMilestoneImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreakMilestone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streakType = null,
    Object? milestone = null,
    Object? achievedAt = null,
    Object? title = null,
    Object? titleAr = null,
    Object? message = null,
    Object? messageAr = null,
    Object? celebrated = null,
  }) {
    return _then(
      _$StreakMilestoneImpl(
        streakType: null == streakType
            ? _value.streakType
            : streakType // ignore: cast_nullable_to_non_nullable
                  as StreakType,
        milestone: null == milestone
            ? _value.milestone
            : milestone // ignore: cast_nullable_to_non_nullable
                  as int,
        achievedAt: null == achievedAt
            ? _value.achievedAt
            : achievedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
        celebrated: null == celebrated
            ? _value.celebrated
            : celebrated // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakMilestoneImpl implements _StreakMilestone {
  const _$StreakMilestoneImpl({
    required this.streakType,
    required this.milestone,
    required this.achievedAt,
    required this.title,
    required this.titleAr,
    required this.message,
    required this.messageAr,
    this.celebrated = false,
  });

  factory _$StreakMilestoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakMilestoneImplFromJson(json);

  @override
  final StreakType streakType;
  @override
  final int milestone;
  @override
  final DateTime achievedAt;
  @override
  final String title;
  @override
  final String titleAr;
  @override
  final String message;
  @override
  final String messageAr;
  @override
  @JsonKey()
  final bool celebrated;

  @override
  String toString() {
    return 'StreakMilestone(streakType: $streakType, milestone: $milestone, achievedAt: $achievedAt, title: $title, titleAr: $titleAr, message: $message, messageAr: $messageAr, celebrated: $celebrated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakMilestoneImpl &&
            (identical(other.streakType, streakType) ||
                other.streakType == streakType) &&
            (identical(other.milestone, milestone) ||
                other.milestone == milestone) &&
            (identical(other.achievedAt, achievedAt) ||
                other.achievedAt == achievedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageAr, messageAr) ||
                other.messageAr == messageAr) &&
            (identical(other.celebrated, celebrated) ||
                other.celebrated == celebrated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    streakType,
    milestone,
    achievedAt,
    title,
    titleAr,
    message,
    messageAr,
    celebrated,
  );

  /// Create a copy of StreakMilestone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakMilestoneImplCopyWith<_$StreakMilestoneImpl> get copyWith =>
      __$$StreakMilestoneImplCopyWithImpl<_$StreakMilestoneImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakMilestoneImplToJson(this);
  }
}

abstract class _StreakMilestone implements StreakMilestone {
  const factory _StreakMilestone({
    required final StreakType streakType,
    required final int milestone,
    required final DateTime achievedAt,
    required final String title,
    required final String titleAr,
    required final String message,
    required final String messageAr,
    final bool celebrated,
  }) = _$StreakMilestoneImpl;

  factory _StreakMilestone.fromJson(Map<String, dynamic> json) =
      _$StreakMilestoneImpl.fromJson;

  @override
  StreakType get streakType;
  @override
  int get milestone;
  @override
  DateTime get achievedAt;
  @override
  String get title;
  @override
  String get titleAr;
  @override
  String get message;
  @override
  String get messageAr;
  @override
  bool get celebrated;

  /// Create a copy of StreakMilestone
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreakMilestoneImplCopyWith<_$StreakMilestoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
