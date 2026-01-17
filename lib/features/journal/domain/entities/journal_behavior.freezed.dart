// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_behavior.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JournalBehavior _$JournalBehaviorFromJson(Map<String, dynamic> json) {
  return _JournalBehavior.fromJson(json);
}

/// @nodoc
mixin _$JournalBehavior {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  BehaviorCategory get category => throw _privateConstructorUsedError;
  BehaviorInputType get inputType => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  double? get minValue => throw _privateConstructorUsedError;
  double? get maxValue => throw _privateConstructorUsedError;
  double? get defaultValue => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isCustom => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Whether this behavior typically has a positive or negative correlation with recovery
  /// true = positive correlation (e.g., meditation improves recovery)
  /// false = negative correlation (e.g., alcohol hurts recovery)
  /// null = neutral or context-dependent
  bool? get isPositiveForRecovery => throw _privateConstructorUsedError;

  /// Serializes this JournalBehavior to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalBehaviorCopyWith<JournalBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalBehaviorCopyWith<$Res> {
  factory $JournalBehaviorCopyWith(
    JournalBehavior value,
    $Res Function(JournalBehavior) then,
  ) = _$JournalBehaviorCopyWithImpl<$Res, JournalBehavior>;
  @useResult
  $Res call({
    String id,
    String name,
    BehaviorCategory category,
    BehaviorInputType inputType,
    String? icon,
    String? unit,
    double? minValue,
    double? maxValue,
    double? defaultValue,
    List<String> options,
    String? description,
    bool isCustom,
    bool isActive,
    bool? isPositiveForRecovery,
  });
}

/// @nodoc
class _$JournalBehaviorCopyWithImpl<$Res, $Val extends JournalBehavior>
    implements $JournalBehaviorCopyWith<$Res> {
  _$JournalBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? inputType = null,
    Object? icon = freezed,
    Object? unit = freezed,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? defaultValue = freezed,
    Object? options = null,
    Object? description = freezed,
    Object? isCustom = null,
    Object? isActive = null,
    Object? isPositiveForRecovery = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as BehaviorCategory,
            inputType: null == inputType
                ? _value.inputType
                : inputType // ignore: cast_nullable_to_non_nullable
                      as BehaviorInputType,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String?,
            unit: freezed == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String?,
            minValue: freezed == minValue
                ? _value.minValue
                : minValue // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxValue: freezed == maxValue
                ? _value.maxValue
                : maxValue // ignore: cast_nullable_to_non_nullable
                      as double?,
            defaultValue: freezed == defaultValue
                ? _value.defaultValue
                : defaultValue // ignore: cast_nullable_to_non_nullable
                      as double?,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            isCustom: null == isCustom
                ? _value.isCustom
                : isCustom // ignore: cast_nullable_to_non_nullable
                      as bool,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isPositiveForRecovery: freezed == isPositiveForRecovery
                ? _value.isPositiveForRecovery
                : isPositiveForRecovery // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JournalBehaviorImplCopyWith<$Res>
    implements $JournalBehaviorCopyWith<$Res> {
  factory _$$JournalBehaviorImplCopyWith(
    _$JournalBehaviorImpl value,
    $Res Function(_$JournalBehaviorImpl) then,
  ) = __$$JournalBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    BehaviorCategory category,
    BehaviorInputType inputType,
    String? icon,
    String? unit,
    double? minValue,
    double? maxValue,
    double? defaultValue,
    List<String> options,
    String? description,
    bool isCustom,
    bool isActive,
    bool? isPositiveForRecovery,
  });
}

/// @nodoc
class __$$JournalBehaviorImplCopyWithImpl<$Res>
    extends _$JournalBehaviorCopyWithImpl<$Res, _$JournalBehaviorImpl>
    implements _$$JournalBehaviorImplCopyWith<$Res> {
  __$$JournalBehaviorImplCopyWithImpl(
    _$JournalBehaviorImpl _value,
    $Res Function(_$JournalBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? inputType = null,
    Object? icon = freezed,
    Object? unit = freezed,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? defaultValue = freezed,
    Object? options = null,
    Object? description = freezed,
    Object? isCustom = null,
    Object? isActive = null,
    Object? isPositiveForRecovery = freezed,
  }) {
    return _then(
      _$JournalBehaviorImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as BehaviorCategory,
        inputType: null == inputType
            ? _value.inputType
            : inputType // ignore: cast_nullable_to_non_nullable
                  as BehaviorInputType,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String?,
        unit: freezed == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String?,
        minValue: freezed == minValue
            ? _value.minValue
            : minValue // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxValue: freezed == maxValue
            ? _value.maxValue
            : maxValue // ignore: cast_nullable_to_non_nullable
                  as double?,
        defaultValue: freezed == defaultValue
            ? _value.defaultValue
            : defaultValue // ignore: cast_nullable_to_non_nullable
                  as double?,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        isCustom: null == isCustom
            ? _value.isCustom
            : isCustom // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPositiveForRecovery: freezed == isPositiveForRecovery
            ? _value.isPositiveForRecovery
            : isPositiveForRecovery // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalBehaviorImpl implements _JournalBehavior {
  const _$JournalBehaviorImpl({
    required this.id,
    required this.name,
    required this.category,
    required this.inputType,
    this.icon,
    this.unit,
    this.minValue,
    this.maxValue,
    this.defaultValue,
    final List<String> options = const [],
    this.description,
    this.isCustom = false,
    this.isActive = true,
    this.isPositiveForRecovery,
  }) : _options = options;

  factory _$JournalBehaviorImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalBehaviorImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final BehaviorCategory category;
  @override
  final BehaviorInputType inputType;
  @override
  final String? icon;
  @override
  final String? unit;
  @override
  final double? minValue;
  @override
  final double? maxValue;
  @override
  final double? defaultValue;
  final List<String> _options;
  @override
  @JsonKey()
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final String? description;
  @override
  @JsonKey()
  final bool isCustom;
  @override
  @JsonKey()
  final bool isActive;

  /// Whether this behavior typically has a positive or negative correlation with recovery
  /// true = positive correlation (e.g., meditation improves recovery)
  /// false = negative correlation (e.g., alcohol hurts recovery)
  /// null = neutral or context-dependent
  @override
  final bool? isPositiveForRecovery;

  @override
  String toString() {
    return 'JournalBehavior(id: $id, name: $name, category: $category, inputType: $inputType, icon: $icon, unit: $unit, minValue: $minValue, maxValue: $maxValue, defaultValue: $defaultValue, options: $options, description: $description, isCustom: $isCustom, isActive: $isActive, isPositiveForRecovery: $isPositiveForRecovery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalBehaviorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isPositiveForRecovery, isPositiveForRecovery) ||
                other.isPositiveForRecovery == isPositiveForRecovery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    category,
    inputType,
    icon,
    unit,
    minValue,
    maxValue,
    defaultValue,
    const DeepCollectionEquality().hash(_options),
    description,
    isCustom,
    isActive,
    isPositiveForRecovery,
  );

  /// Create a copy of JournalBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalBehaviorImplCopyWith<_$JournalBehaviorImpl> get copyWith =>
      __$$JournalBehaviorImplCopyWithImpl<_$JournalBehaviorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalBehaviorImplToJson(this);
  }
}

abstract class _JournalBehavior implements JournalBehavior {
  const factory _JournalBehavior({
    required final String id,
    required final String name,
    required final BehaviorCategory category,
    required final BehaviorInputType inputType,
    final String? icon,
    final String? unit,
    final double? minValue,
    final double? maxValue,
    final double? defaultValue,
    final List<String> options,
    final String? description,
    final bool isCustom,
    final bool isActive,
    final bool? isPositiveForRecovery,
  }) = _$JournalBehaviorImpl;

  factory _JournalBehavior.fromJson(Map<String, dynamic> json) =
      _$JournalBehaviorImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  BehaviorCategory get category;
  @override
  BehaviorInputType get inputType;
  @override
  String? get icon;
  @override
  String? get unit;
  @override
  double? get minValue;
  @override
  double? get maxValue;
  @override
  double? get defaultValue;
  @override
  List<String> get options;
  @override
  String? get description;
  @override
  bool get isCustom;
  @override
  bool get isActive;

  /// Whether this behavior typically has a positive or negative correlation with recovery
  /// true = positive correlation (e.g., meditation improves recovery)
  /// false = negative correlation (e.g., alcohol hurts recovery)
  /// null = neutral or context-dependent
  @override
  bool? get isPositiveForRecovery;

  /// Create a copy of JournalBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalBehaviorImplCopyWith<_$JournalBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
