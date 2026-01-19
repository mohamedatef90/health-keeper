// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_anomaly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HealthAnomaly _$HealthAnomalyFromJson(Map<String, dynamic> json) {
  return _HealthAnomaly.fromJson(json);
}

/// @nodoc
mixin _$HealthAnomaly {
  String get id => throw _privateConstructorUsedError;
  AnomalyType get type => throw _privateConstructorUsedError;
  AnomalySeverity get severity => throw _privateConstructorUsedError;

  /// Title of the anomaly (English)
  String get title => throw _privateConstructorUsedError;
  String? get titleAr => throw _privateConstructorUsedError;

  /// Description of what was detected (English)
  String get description => throw _privateConstructorUsedError;
  String? get descriptionAr => throw _privateConstructorUsedError;

  /// The metric that triggered this anomaly
  String get metric => throw _privateConstructorUsedError;

  /// Current value of the metric
  double get currentValue => throw _privateConstructorUsedError;

  /// Expected/baseline value
  double get expectedValue => throw _privateConstructorUsedError;

  /// Deviation from expected (as percentage or absolute)
  double get deviation => throw _privateConstructorUsedError;

  /// Unit of measurement
  String? get unit => throw _privateConstructorUsedError;

  /// Recommended actions to address the anomaly
  List<AnomalyAction> get recommendedActions =>
      throw _privateConstructorUsedError;

  /// Related metrics that also show concerning patterns
  List<String> get relatedMetrics => throw _privateConstructorUsedError;

  /// Historical context (how long has this been happening)
  int? get daysActive => throw _privateConstructorUsedError;

  /// Confidence in the anomaly detection (0-100)
  int get confidence => throw _privateConstructorUsedError;

  /// Whether this anomaly has been acknowledged by user
  bool get isAcknowledged => throw _privateConstructorUsedError;

  /// Whether this anomaly has been resolved
  bool get isResolved => throw _privateConstructorUsedError;

  /// Timestamps
  DateTime get detectedAt => throw _privateConstructorUsedError;
  DateTime? get acknowledgedAt => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;

  /// Raw data that led to this detection (for debugging)
  Map<String, dynamic>? get rawData => throw _privateConstructorUsedError;

  /// Serializes this HealthAnomaly to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthAnomaly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthAnomalyCopyWith<HealthAnomaly> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthAnomalyCopyWith<$Res> {
  factory $HealthAnomalyCopyWith(
    HealthAnomaly value,
    $Res Function(HealthAnomaly) then,
  ) = _$HealthAnomalyCopyWithImpl<$Res, HealthAnomaly>;
  @useResult
  $Res call({
    String id,
    AnomalyType type,
    AnomalySeverity severity,
    String title,
    String? titleAr,
    String description,
    String? descriptionAr,
    String metric,
    double currentValue,
    double expectedValue,
    double deviation,
    String? unit,
    List<AnomalyAction> recommendedActions,
    List<String> relatedMetrics,
    int? daysActive,
    int confidence,
    bool isAcknowledged,
    bool isResolved,
    DateTime detectedAt,
    DateTime? acknowledgedAt,
    DateTime? resolvedAt,
    Map<String, dynamic>? rawData,
  });
}

/// @nodoc
class _$HealthAnomalyCopyWithImpl<$Res, $Val extends HealthAnomaly>
    implements $HealthAnomalyCopyWith<$Res> {
  _$HealthAnomalyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthAnomaly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? severity = null,
    Object? title = null,
    Object? titleAr = freezed,
    Object? description = null,
    Object? descriptionAr = freezed,
    Object? metric = null,
    Object? currentValue = null,
    Object? expectedValue = null,
    Object? deviation = null,
    Object? unit = freezed,
    Object? recommendedActions = null,
    Object? relatedMetrics = null,
    Object? daysActive = freezed,
    Object? confidence = null,
    Object? isAcknowledged = null,
    Object? isResolved = null,
    Object? detectedAt = null,
    Object? acknowledgedAt = freezed,
    Object? resolvedAt = freezed,
    Object? rawData = freezed,
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
                      as AnomalyType,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as AnomalySeverity,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            titleAr: freezed == titleAr
                ? _value.titleAr
                : titleAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionAr: freezed == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            metric: null == metric
                ? _value.metric
                : metric // ignore: cast_nullable_to_non_nullable
                      as String,
            currentValue: null == currentValue
                ? _value.currentValue
                : currentValue // ignore: cast_nullable_to_non_nullable
                      as double,
            expectedValue: null == expectedValue
                ? _value.expectedValue
                : expectedValue // ignore: cast_nullable_to_non_nullable
                      as double,
            deviation: null == deviation
                ? _value.deviation
                : deviation // ignore: cast_nullable_to_non_nullable
                      as double,
            unit: freezed == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String?,
            recommendedActions: null == recommendedActions
                ? _value.recommendedActions
                : recommendedActions // ignore: cast_nullable_to_non_nullable
                      as List<AnomalyAction>,
            relatedMetrics: null == relatedMetrics
                ? _value.relatedMetrics
                : relatedMetrics // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            daysActive: freezed == daysActive
                ? _value.daysActive
                : daysActive // ignore: cast_nullable_to_non_nullable
                      as int?,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            isAcknowledged: null == isAcknowledged
                ? _value.isAcknowledged
                : isAcknowledged // ignore: cast_nullable_to_non_nullable
                      as bool,
            isResolved: null == isResolved
                ? _value.isResolved
                : isResolved // ignore: cast_nullable_to_non_nullable
                      as bool,
            detectedAt: null == detectedAt
                ? _value.detectedAt
                : detectedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            acknowledgedAt: freezed == acknowledgedAt
                ? _value.acknowledgedAt
                : acknowledgedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            resolvedAt: freezed == resolvedAt
                ? _value.resolvedAt
                : resolvedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            rawData: freezed == rawData
                ? _value.rawData
                : rawData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthAnomalyImplCopyWith<$Res>
    implements $HealthAnomalyCopyWith<$Res> {
  factory _$$HealthAnomalyImplCopyWith(
    _$HealthAnomalyImpl value,
    $Res Function(_$HealthAnomalyImpl) then,
  ) = __$$HealthAnomalyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    AnomalyType type,
    AnomalySeverity severity,
    String title,
    String? titleAr,
    String description,
    String? descriptionAr,
    String metric,
    double currentValue,
    double expectedValue,
    double deviation,
    String? unit,
    List<AnomalyAction> recommendedActions,
    List<String> relatedMetrics,
    int? daysActive,
    int confidence,
    bool isAcknowledged,
    bool isResolved,
    DateTime detectedAt,
    DateTime? acknowledgedAt,
    DateTime? resolvedAt,
    Map<String, dynamic>? rawData,
  });
}

/// @nodoc
class __$$HealthAnomalyImplCopyWithImpl<$Res>
    extends _$HealthAnomalyCopyWithImpl<$Res, _$HealthAnomalyImpl>
    implements _$$HealthAnomalyImplCopyWith<$Res> {
  __$$HealthAnomalyImplCopyWithImpl(
    _$HealthAnomalyImpl _value,
    $Res Function(_$HealthAnomalyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthAnomaly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? severity = null,
    Object? title = null,
    Object? titleAr = freezed,
    Object? description = null,
    Object? descriptionAr = freezed,
    Object? metric = null,
    Object? currentValue = null,
    Object? expectedValue = null,
    Object? deviation = null,
    Object? unit = freezed,
    Object? recommendedActions = null,
    Object? relatedMetrics = null,
    Object? daysActive = freezed,
    Object? confidence = null,
    Object? isAcknowledged = null,
    Object? isResolved = null,
    Object? detectedAt = null,
    Object? acknowledgedAt = freezed,
    Object? resolvedAt = freezed,
    Object? rawData = freezed,
  }) {
    return _then(
      _$HealthAnomalyImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AnomalyType,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as AnomalySeverity,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        titleAr: freezed == titleAr
            ? _value.titleAr
            : titleAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: freezed == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        metric: null == metric
            ? _value.metric
            : metric // ignore: cast_nullable_to_non_nullable
                  as String,
        currentValue: null == currentValue
            ? _value.currentValue
            : currentValue // ignore: cast_nullable_to_non_nullable
                  as double,
        expectedValue: null == expectedValue
            ? _value.expectedValue
            : expectedValue // ignore: cast_nullable_to_non_nullable
                  as double,
        deviation: null == deviation
            ? _value.deviation
            : deviation // ignore: cast_nullable_to_non_nullable
                  as double,
        unit: freezed == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String?,
        recommendedActions: null == recommendedActions
            ? _value._recommendedActions
            : recommendedActions // ignore: cast_nullable_to_non_nullable
                  as List<AnomalyAction>,
        relatedMetrics: null == relatedMetrics
            ? _value._relatedMetrics
            : relatedMetrics // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        daysActive: freezed == daysActive
            ? _value.daysActive
            : daysActive // ignore: cast_nullable_to_non_nullable
                  as int?,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        isAcknowledged: null == isAcknowledged
            ? _value.isAcknowledged
            : isAcknowledged // ignore: cast_nullable_to_non_nullable
                  as bool,
        isResolved: null == isResolved
            ? _value.isResolved
            : isResolved // ignore: cast_nullable_to_non_nullable
                  as bool,
        detectedAt: null == detectedAt
            ? _value.detectedAt
            : detectedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        acknowledgedAt: freezed == acknowledgedAt
            ? _value.acknowledgedAt
            : acknowledgedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        resolvedAt: freezed == resolvedAt
            ? _value.resolvedAt
            : resolvedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        rawData: freezed == rawData
            ? _value._rawData
            : rawData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthAnomalyImpl extends _HealthAnomaly {
  const _$HealthAnomalyImpl({
    required this.id,
    required this.type,
    required this.severity,
    required this.title,
    this.titleAr,
    required this.description,
    this.descriptionAr,
    required this.metric,
    required this.currentValue,
    required this.expectedValue,
    required this.deviation,
    this.unit,
    final List<AnomalyAction> recommendedActions = const [],
    final List<String> relatedMetrics = const [],
    this.daysActive,
    this.confidence = 80,
    this.isAcknowledged = false,
    this.isResolved = false,
    required this.detectedAt,
    this.acknowledgedAt,
    this.resolvedAt,
    final Map<String, dynamic>? rawData,
  }) : _recommendedActions = recommendedActions,
       _relatedMetrics = relatedMetrics,
       _rawData = rawData,
       super._();

  factory _$HealthAnomalyImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthAnomalyImplFromJson(json);

  @override
  final String id;
  @override
  final AnomalyType type;
  @override
  final AnomalySeverity severity;

  /// Title of the anomaly (English)
  @override
  final String title;
  @override
  final String? titleAr;

  /// Description of what was detected (English)
  @override
  final String description;
  @override
  final String? descriptionAr;

  /// The metric that triggered this anomaly
  @override
  final String metric;

  /// Current value of the metric
  @override
  final double currentValue;

  /// Expected/baseline value
  @override
  final double expectedValue;

  /// Deviation from expected (as percentage or absolute)
  @override
  final double deviation;

  /// Unit of measurement
  @override
  final String? unit;

  /// Recommended actions to address the anomaly
  final List<AnomalyAction> _recommendedActions;

  /// Recommended actions to address the anomaly
  @override
  @JsonKey()
  List<AnomalyAction> get recommendedActions {
    if (_recommendedActions is EqualUnmodifiableListView)
      return _recommendedActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedActions);
  }

  /// Related metrics that also show concerning patterns
  final List<String> _relatedMetrics;

  /// Related metrics that also show concerning patterns
  @override
  @JsonKey()
  List<String> get relatedMetrics {
    if (_relatedMetrics is EqualUnmodifiableListView) return _relatedMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedMetrics);
  }

  /// Historical context (how long has this been happening)
  @override
  final int? daysActive;

  /// Confidence in the anomaly detection (0-100)
  @override
  @JsonKey()
  final int confidence;

  /// Whether this anomaly has been acknowledged by user
  @override
  @JsonKey()
  final bool isAcknowledged;

  /// Whether this anomaly has been resolved
  @override
  @JsonKey()
  final bool isResolved;

  /// Timestamps
  @override
  final DateTime detectedAt;
  @override
  final DateTime? acknowledgedAt;
  @override
  final DateTime? resolvedAt;

  /// Raw data that led to this detection (for debugging)
  final Map<String, dynamic>? _rawData;

  /// Raw data that led to this detection (for debugging)
  @override
  Map<String, dynamic>? get rawData {
    final value = _rawData;
    if (value == null) return null;
    if (_rawData is EqualUnmodifiableMapView) return _rawData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'HealthAnomaly(id: $id, type: $type, severity: $severity, title: $title, titleAr: $titleAr, description: $description, descriptionAr: $descriptionAr, metric: $metric, currentValue: $currentValue, expectedValue: $expectedValue, deviation: $deviation, unit: $unit, recommendedActions: $recommendedActions, relatedMetrics: $relatedMetrics, daysActive: $daysActive, confidence: $confidence, isAcknowledged: $isAcknowledged, isResolved: $isResolved, detectedAt: $detectedAt, acknowledgedAt: $acknowledgedAt, resolvedAt: $resolvedAt, rawData: $rawData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthAnomalyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.metric, metric) || other.metric == metric) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.expectedValue, expectedValue) ||
                other.expectedValue == expectedValue) &&
            (identical(other.deviation, deviation) ||
                other.deviation == deviation) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            const DeepCollectionEquality().equals(
              other._recommendedActions,
              _recommendedActions,
            ) &&
            const DeepCollectionEquality().equals(
              other._relatedMetrics,
              _relatedMetrics,
            ) &&
            (identical(other.daysActive, daysActive) ||
                other.daysActive == daysActive) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.isAcknowledged, isAcknowledged) ||
                other.isAcknowledged == isAcknowledged) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved) &&
            (identical(other.detectedAt, detectedAt) ||
                other.detectedAt == detectedAt) &&
            (identical(other.acknowledgedAt, acknowledgedAt) ||
                other.acknowledgedAt == acknowledgedAt) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    type,
    severity,
    title,
    titleAr,
    description,
    descriptionAr,
    metric,
    currentValue,
    expectedValue,
    deviation,
    unit,
    const DeepCollectionEquality().hash(_recommendedActions),
    const DeepCollectionEquality().hash(_relatedMetrics),
    daysActive,
    confidence,
    isAcknowledged,
    isResolved,
    detectedAt,
    acknowledgedAt,
    resolvedAt,
    const DeepCollectionEquality().hash(_rawData),
  ]);

  /// Create a copy of HealthAnomaly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthAnomalyImplCopyWith<_$HealthAnomalyImpl> get copyWith =>
      __$$HealthAnomalyImplCopyWithImpl<_$HealthAnomalyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthAnomalyImplToJson(this);
  }
}

abstract class _HealthAnomaly extends HealthAnomaly {
  const factory _HealthAnomaly({
    required final String id,
    required final AnomalyType type,
    required final AnomalySeverity severity,
    required final String title,
    final String? titleAr,
    required final String description,
    final String? descriptionAr,
    required final String metric,
    required final double currentValue,
    required final double expectedValue,
    required final double deviation,
    final String? unit,
    final List<AnomalyAction> recommendedActions,
    final List<String> relatedMetrics,
    final int? daysActive,
    final int confidence,
    final bool isAcknowledged,
    final bool isResolved,
    required final DateTime detectedAt,
    final DateTime? acknowledgedAt,
    final DateTime? resolvedAt,
    final Map<String, dynamic>? rawData,
  }) = _$HealthAnomalyImpl;
  const _HealthAnomaly._() : super._();

  factory _HealthAnomaly.fromJson(Map<String, dynamic> json) =
      _$HealthAnomalyImpl.fromJson;

  @override
  String get id;
  @override
  AnomalyType get type;
  @override
  AnomalySeverity get severity;

  /// Title of the anomaly (English)
  @override
  String get title;
  @override
  String? get titleAr;

  /// Description of what was detected (English)
  @override
  String get description;
  @override
  String? get descriptionAr;

  /// The metric that triggered this anomaly
  @override
  String get metric;

  /// Current value of the metric
  @override
  double get currentValue;

  /// Expected/baseline value
  @override
  double get expectedValue;

  /// Deviation from expected (as percentage or absolute)
  @override
  double get deviation;

  /// Unit of measurement
  @override
  String? get unit;

  /// Recommended actions to address the anomaly
  @override
  List<AnomalyAction> get recommendedActions;

  /// Related metrics that also show concerning patterns
  @override
  List<String> get relatedMetrics;

  /// Historical context (how long has this been happening)
  @override
  int? get daysActive;

  /// Confidence in the anomaly detection (0-100)
  @override
  int get confidence;

  /// Whether this anomaly has been acknowledged by user
  @override
  bool get isAcknowledged;

  /// Whether this anomaly has been resolved
  @override
  bool get isResolved;

  /// Timestamps
  @override
  DateTime get detectedAt;
  @override
  DateTime? get acknowledgedAt;
  @override
  DateTime? get resolvedAt;

  /// Raw data that led to this detection (for debugging)
  @override
  Map<String, dynamic>? get rawData;

  /// Create a copy of HealthAnomaly
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthAnomalyImplCopyWith<_$HealthAnomalyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnomalyAction _$AnomalyActionFromJson(Map<String, dynamic> json) {
  return _AnomalyAction.fromJson(json);
}

/// @nodoc
mixin _$AnomalyAction {
  String get action => throw _privateConstructorUsedError;
  String? get actionAr => throw _privateConstructorUsedError;
  String get rationale => throw _privateConstructorUsedError;
  String? get rationaleAr => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  /// Serializes this AnomalyAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnomalyAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnomalyActionCopyWith<AnomalyAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnomalyActionCopyWith<$Res> {
  factory $AnomalyActionCopyWith(
    AnomalyAction value,
    $Res Function(AnomalyAction) then,
  ) = _$AnomalyActionCopyWithImpl<$Res, AnomalyAction>;
  @useResult
  $Res call({
    String action,
    String? actionAr,
    String rationale,
    String? rationaleAr,
    String priority,
    String category,
  });
}

/// @nodoc
class _$AnomalyActionCopyWithImpl<$Res, $Val extends AnomalyAction>
    implements $AnomalyActionCopyWith<$Res> {
  _$AnomalyActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnomalyAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? actionAr = freezed,
    Object? rationale = null,
    Object? rationaleAr = freezed,
    Object? priority = null,
    Object? category = null,
  }) {
    return _then(
      _value.copyWith(
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            actionAr: freezed == actionAr
                ? _value.actionAr
                : actionAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            rationale: null == rationale
                ? _value.rationale
                : rationale // ignore: cast_nullable_to_non_nullable
                      as String,
            rationaleAr: freezed == rationaleAr
                ? _value.rationaleAr
                : rationaleAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnomalyActionImplCopyWith<$Res>
    implements $AnomalyActionCopyWith<$Res> {
  factory _$$AnomalyActionImplCopyWith(
    _$AnomalyActionImpl value,
    $Res Function(_$AnomalyActionImpl) then,
  ) = __$$AnomalyActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String action,
    String? actionAr,
    String rationale,
    String? rationaleAr,
    String priority,
    String category,
  });
}

/// @nodoc
class __$$AnomalyActionImplCopyWithImpl<$Res>
    extends _$AnomalyActionCopyWithImpl<$Res, _$AnomalyActionImpl>
    implements _$$AnomalyActionImplCopyWith<$Res> {
  __$$AnomalyActionImplCopyWithImpl(
    _$AnomalyActionImpl _value,
    $Res Function(_$AnomalyActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnomalyAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? actionAr = freezed,
    Object? rationale = null,
    Object? rationaleAr = freezed,
    Object? priority = null,
    Object? category = null,
  }) {
    return _then(
      _$AnomalyActionImpl(
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        actionAr: freezed == actionAr
            ? _value.actionAr
            : actionAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        rationale: null == rationale
            ? _value.rationale
            : rationale // ignore: cast_nullable_to_non_nullable
                  as String,
        rationaleAr: freezed == rationaleAr
            ? _value.rationaleAr
            : rationaleAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnomalyActionImpl implements _AnomalyAction {
  const _$AnomalyActionImpl({
    required this.action,
    this.actionAr,
    required this.rationale,
    this.rationaleAr,
    this.priority = 'medium',
    this.category = 'general',
  });

  factory _$AnomalyActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnomalyActionImplFromJson(json);

  @override
  final String action;
  @override
  final String? actionAr;
  @override
  final String rationale;
  @override
  final String? rationaleAr;
  @override
  @JsonKey()
  final String priority;
  @override
  @JsonKey()
  final String category;

  @override
  String toString() {
    return 'AnomalyAction(action: $action, actionAr: $actionAr, rationale: $rationale, rationaleAr: $rationaleAr, priority: $priority, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnomalyActionImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.actionAr, actionAr) ||
                other.actionAr == actionAr) &&
            (identical(other.rationale, rationale) ||
                other.rationale == rationale) &&
            (identical(other.rationaleAr, rationaleAr) ||
                other.rationaleAr == rationaleAr) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    action,
    actionAr,
    rationale,
    rationaleAr,
    priority,
    category,
  );

  /// Create a copy of AnomalyAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnomalyActionImplCopyWith<_$AnomalyActionImpl> get copyWith =>
      __$$AnomalyActionImplCopyWithImpl<_$AnomalyActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnomalyActionImplToJson(this);
  }
}

abstract class _AnomalyAction implements AnomalyAction {
  const factory _AnomalyAction({
    required final String action,
    final String? actionAr,
    required final String rationale,
    final String? rationaleAr,
    final String priority,
    final String category,
  }) = _$AnomalyActionImpl;

  factory _AnomalyAction.fromJson(Map<String, dynamic> json) =
      _$AnomalyActionImpl.fromJson;

  @override
  String get action;
  @override
  String? get actionAr;
  @override
  String get rationale;
  @override
  String? get rationaleAr;
  @override
  String get priority;
  @override
  String get category;

  /// Create a copy of AnomalyAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnomalyActionImplCopyWith<_$AnomalyActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
