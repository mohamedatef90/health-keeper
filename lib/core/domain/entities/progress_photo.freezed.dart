// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProgressPhoto _$ProgressPhotoFromJson(Map<String, dynamic> json) {
  return _ProgressPhoto.fromJson(json);
}

/// @nodoc
mixin _$ProgressPhoto {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get photoUri => throw _privateConstructorUsedError;
  BodyPart get bodyPart => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this ProgressPhoto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressPhotoCopyWith<ProgressPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressPhotoCopyWith<$Res> {
  factory $ProgressPhotoCopyWith(
    ProgressPhoto value,
    $Res Function(ProgressPhoto) then,
  ) = _$ProgressPhotoCopyWithImpl<$Res, ProgressPhoto>;
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime date,
    String photoUri,
    BodyPart bodyPart,
    String? notes,
  });
}

/// @nodoc
class _$ProgressPhotoCopyWithImpl<$Res, $Val extends ProgressPhoto>
    implements $ProgressPhotoCopyWith<$Res> {
  _$ProgressPhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? photoUri = null,
    Object? bodyPart = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            photoUri: null == photoUri
                ? _value.photoUri
                : photoUri // ignore: cast_nullable_to_non_nullable
                      as String,
            bodyPart: null == bodyPart
                ? _value.bodyPart
                : bodyPart // ignore: cast_nullable_to_non_nullable
                      as BodyPart,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProgressPhotoImplCopyWith<$Res>
    implements $ProgressPhotoCopyWith<$Res> {
  factory _$$ProgressPhotoImplCopyWith(
    _$ProgressPhotoImpl value,
    $Res Function(_$ProgressPhotoImpl) then,
  ) = __$$ProgressPhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime date,
    String photoUri,
    BodyPart bodyPart,
    String? notes,
  });
}

/// @nodoc
class __$$ProgressPhotoImplCopyWithImpl<$Res>
    extends _$ProgressPhotoCopyWithImpl<$Res, _$ProgressPhotoImpl>
    implements _$$ProgressPhotoImplCopyWith<$Res> {
  __$$ProgressPhotoImplCopyWithImpl(
    _$ProgressPhotoImpl _value,
    $Res Function(_$ProgressPhotoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? photoUri = null,
    Object? bodyPart = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$ProgressPhotoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        photoUri: null == photoUri
            ? _value.photoUri
            : photoUri // ignore: cast_nullable_to_non_nullable
                  as String,
        bodyPart: null == bodyPart
            ? _value.bodyPart
            : bodyPart // ignore: cast_nullable_to_non_nullable
                  as BodyPart,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressPhotoImpl implements _ProgressPhoto {
  const _$ProgressPhotoImpl({
    required this.id,
    required this.userId,
    required this.date,
    required this.photoUri,
    required this.bodyPart,
    this.notes,
  });

  factory _$ProgressPhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressPhotoImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime date;
  @override
  final String photoUri;
  @override
  final BodyPart bodyPart;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ProgressPhoto(id: $id, userId: $userId, date: $date, photoUri: $photoUri, bodyPart: $bodyPart, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressPhotoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.photoUri, photoUri) ||
                other.photoUri == photoUri) &&
            (identical(other.bodyPart, bodyPart) ||
                other.bodyPart == bodyPart) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, date, photoUri, bodyPart, notes);

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressPhotoImplCopyWith<_$ProgressPhotoImpl> get copyWith =>
      __$$ProgressPhotoImplCopyWithImpl<_$ProgressPhotoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressPhotoImplToJson(this);
  }
}

abstract class _ProgressPhoto implements ProgressPhoto {
  const factory _ProgressPhoto({
    required final String id,
    required final String userId,
    required final DateTime date,
    required final String photoUri,
    required final BodyPart bodyPart,
    final String? notes,
  }) = _$ProgressPhotoImpl;

  factory _ProgressPhoto.fromJson(Map<String, dynamic> json) =
      _$ProgressPhotoImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get date;
  @override
  String get photoUri;
  @override
  BodyPart get bodyPart;
  @override
  String? get notes;

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressPhotoImplCopyWith<_$ProgressPhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiFoodAnalysis _$AiFoodAnalysisFromJson(Map<String, dynamic> json) {
  return _AiFoodAnalysis.fromJson(json);
}

/// @nodoc
mixin _$AiFoodAnalysis {
  String get id => throw _privateConstructorUsedError;
  String get mealLogId => throw _privateConstructorUsedError;
  String get photoUri => throw _privateConstructorUsedError;
  String get rawResponse => throw _privateConstructorUsedError;
  List<ParsedFoodItem> get parsedItems => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError; // 0-100
  int get processingTime =>
      throw _privateConstructorUsedError; // in milliseconds
  String get model => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AiFoodAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiFoodAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiFoodAnalysisCopyWith<AiFoodAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiFoodAnalysisCopyWith<$Res> {
  factory $AiFoodAnalysisCopyWith(
    AiFoodAnalysis value,
    $Res Function(AiFoodAnalysis) then,
  ) = _$AiFoodAnalysisCopyWithImpl<$Res, AiFoodAnalysis>;
  @useResult
  $Res call({
    String id,
    String mealLogId,
    String photoUri,
    String rawResponse,
    List<ParsedFoodItem> parsedItems,
    int confidence,
    int processingTime,
    String model,
    DateTime createdAt,
  });
}

/// @nodoc
class _$AiFoodAnalysisCopyWithImpl<$Res, $Val extends AiFoodAnalysis>
    implements $AiFoodAnalysisCopyWith<$Res> {
  _$AiFoodAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiFoodAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mealLogId = null,
    Object? photoUri = null,
    Object? rawResponse = null,
    Object? parsedItems = null,
    Object? confidence = null,
    Object? processingTime = null,
    Object? model = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            mealLogId: null == mealLogId
                ? _value.mealLogId
                : mealLogId // ignore: cast_nullable_to_non_nullable
                      as String,
            photoUri: null == photoUri
                ? _value.photoUri
                : photoUri // ignore: cast_nullable_to_non_nullable
                      as String,
            rawResponse: null == rawResponse
                ? _value.rawResponse
                : rawResponse // ignore: cast_nullable_to_non_nullable
                      as String,
            parsedItems: null == parsedItems
                ? _value.parsedItems
                : parsedItems // ignore: cast_nullable_to_non_nullable
                      as List<ParsedFoodItem>,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
            processingTime: null == processingTime
                ? _value.processingTime
                : processingTime // ignore: cast_nullable_to_non_nullable
                      as int,
            model: null == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiFoodAnalysisImplCopyWith<$Res>
    implements $AiFoodAnalysisCopyWith<$Res> {
  factory _$$AiFoodAnalysisImplCopyWith(
    _$AiFoodAnalysisImpl value,
    $Res Function(_$AiFoodAnalysisImpl) then,
  ) = __$$AiFoodAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String mealLogId,
    String photoUri,
    String rawResponse,
    List<ParsedFoodItem> parsedItems,
    int confidence,
    int processingTime,
    String model,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$AiFoodAnalysisImplCopyWithImpl<$Res>
    extends _$AiFoodAnalysisCopyWithImpl<$Res, _$AiFoodAnalysisImpl>
    implements _$$AiFoodAnalysisImplCopyWith<$Res> {
  __$$AiFoodAnalysisImplCopyWithImpl(
    _$AiFoodAnalysisImpl _value,
    $Res Function(_$AiFoodAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiFoodAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mealLogId = null,
    Object? photoUri = null,
    Object? rawResponse = null,
    Object? parsedItems = null,
    Object? confidence = null,
    Object? processingTime = null,
    Object? model = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$AiFoodAnalysisImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        mealLogId: null == mealLogId
            ? _value.mealLogId
            : mealLogId // ignore: cast_nullable_to_non_nullable
                  as String,
        photoUri: null == photoUri
            ? _value.photoUri
            : photoUri // ignore: cast_nullable_to_non_nullable
                  as String,
        rawResponse: null == rawResponse
            ? _value.rawResponse
            : rawResponse // ignore: cast_nullable_to_non_nullable
                  as String,
        parsedItems: null == parsedItems
            ? _value._parsedItems
            : parsedItems // ignore: cast_nullable_to_non_nullable
                  as List<ParsedFoodItem>,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
        processingTime: null == processingTime
            ? _value.processingTime
            : processingTime // ignore: cast_nullable_to_non_nullable
                  as int,
        model: null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiFoodAnalysisImpl implements _AiFoodAnalysis {
  const _$AiFoodAnalysisImpl({
    required this.id,
    required this.mealLogId,
    required this.photoUri,
    required this.rawResponse,
    final List<ParsedFoodItem> parsedItems = const [],
    required this.confidence,
    required this.processingTime,
    this.model = 'gemini-2.5',
    required this.createdAt,
  }) : _parsedItems = parsedItems;

  factory _$AiFoodAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiFoodAnalysisImplFromJson(json);

  @override
  final String id;
  @override
  final String mealLogId;
  @override
  final String photoUri;
  @override
  final String rawResponse;
  final List<ParsedFoodItem> _parsedItems;
  @override
  @JsonKey()
  List<ParsedFoodItem> get parsedItems {
    if (_parsedItems is EqualUnmodifiableListView) return _parsedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parsedItems);
  }

  @override
  final int confidence;
  // 0-100
  @override
  final int processingTime;
  // in milliseconds
  @override
  @JsonKey()
  final String model;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'AiFoodAnalysis(id: $id, mealLogId: $mealLogId, photoUri: $photoUri, rawResponse: $rawResponse, parsedItems: $parsedItems, confidence: $confidence, processingTime: $processingTime, model: $model, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiFoodAnalysisImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mealLogId, mealLogId) ||
                other.mealLogId == mealLogId) &&
            (identical(other.photoUri, photoUri) ||
                other.photoUri == photoUri) &&
            (identical(other.rawResponse, rawResponse) ||
                other.rawResponse == rawResponse) &&
            const DeepCollectionEquality().equals(
              other._parsedItems,
              _parsedItems,
            ) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.processingTime, processingTime) ||
                other.processingTime == processingTime) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    mealLogId,
    photoUri,
    rawResponse,
    const DeepCollectionEquality().hash(_parsedItems),
    confidence,
    processingTime,
    model,
    createdAt,
  );

  /// Create a copy of AiFoodAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiFoodAnalysisImplCopyWith<_$AiFoodAnalysisImpl> get copyWith =>
      __$$AiFoodAnalysisImplCopyWithImpl<_$AiFoodAnalysisImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiFoodAnalysisImplToJson(this);
  }
}

abstract class _AiFoodAnalysis implements AiFoodAnalysis {
  const factory _AiFoodAnalysis({
    required final String id,
    required final String mealLogId,
    required final String photoUri,
    required final String rawResponse,
    final List<ParsedFoodItem> parsedItems,
    required final int confidence,
    required final int processingTime,
    final String model,
    required final DateTime createdAt,
  }) = _$AiFoodAnalysisImpl;

  factory _AiFoodAnalysis.fromJson(Map<String, dynamic> json) =
      _$AiFoodAnalysisImpl.fromJson;

  @override
  String get id;
  @override
  String get mealLogId;
  @override
  String get photoUri;
  @override
  String get rawResponse;
  @override
  List<ParsedFoodItem> get parsedItems;
  @override
  int get confidence; // 0-100
  @override
  int get processingTime; // in milliseconds
  @override
  String get model;
  @override
  DateTime get createdAt;

  /// Create a copy of AiFoodAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiFoodAnalysisImplCopyWith<_$AiFoodAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParsedFoodItem _$ParsedFoodItemFromJson(Map<String, dynamic> json) {
  return _ParsedFoodItem.fromJson(json);
}

/// @nodoc
mixin _$ParsedFoodItem {
  String get name => throw _privateConstructorUsedError;
  String get portion => throw _privateConstructorUsedError;
  int get calories => throw _privateConstructorUsedError;
  int get protein => throw _privateConstructorUsedError;
  int get carbs => throw _privateConstructorUsedError;
  int get fat => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError;

  /// Serializes this ParsedFoodItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParsedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParsedFoodItemCopyWith<ParsedFoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParsedFoodItemCopyWith<$Res> {
  factory $ParsedFoodItemCopyWith(
    ParsedFoodItem value,
    $Res Function(ParsedFoodItem) then,
  ) = _$ParsedFoodItemCopyWithImpl<$Res, ParsedFoodItem>;
  @useResult
  $Res call({
    String name,
    String portion,
    int calories,
    int protein,
    int carbs,
    int fat,
    int confidence,
  });
}

/// @nodoc
class _$ParsedFoodItemCopyWithImpl<$Res, $Val extends ParsedFoodItem>
    implements $ParsedFoodItemCopyWith<$Res> {
  _$ParsedFoodItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParsedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? portion = null,
    Object? calories = null,
    Object? protein = null,
    Object? carbs = null,
    Object? fat = null,
    Object? confidence = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            portion: null == portion
                ? _value.portion
                : portion // ignore: cast_nullable_to_non_nullable
                      as String,
            calories: null == calories
                ? _value.calories
                : calories // ignore: cast_nullable_to_non_nullable
                      as int,
            protein: null == protein
                ? _value.protein
                : protein // ignore: cast_nullable_to_non_nullable
                      as int,
            carbs: null == carbs
                ? _value.carbs
                : carbs // ignore: cast_nullable_to_non_nullable
                      as int,
            fat: null == fat
                ? _value.fat
                : fat // ignore: cast_nullable_to_non_nullable
                      as int,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ParsedFoodItemImplCopyWith<$Res>
    implements $ParsedFoodItemCopyWith<$Res> {
  factory _$$ParsedFoodItemImplCopyWith(
    _$ParsedFoodItemImpl value,
    $Res Function(_$ParsedFoodItemImpl) then,
  ) = __$$ParsedFoodItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String portion,
    int calories,
    int protein,
    int carbs,
    int fat,
    int confidence,
  });
}

/// @nodoc
class __$$ParsedFoodItemImplCopyWithImpl<$Res>
    extends _$ParsedFoodItemCopyWithImpl<$Res, _$ParsedFoodItemImpl>
    implements _$$ParsedFoodItemImplCopyWith<$Res> {
  __$$ParsedFoodItemImplCopyWithImpl(
    _$ParsedFoodItemImpl _value,
    $Res Function(_$ParsedFoodItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ParsedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? portion = null,
    Object? calories = null,
    Object? protein = null,
    Object? carbs = null,
    Object? fat = null,
    Object? confidence = null,
  }) {
    return _then(
      _$ParsedFoodItemImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        portion: null == portion
            ? _value.portion
            : portion // ignore: cast_nullable_to_non_nullable
                  as String,
        calories: null == calories
            ? _value.calories
            : calories // ignore: cast_nullable_to_non_nullable
                  as int,
        protein: null == protein
            ? _value.protein
            : protein // ignore: cast_nullable_to_non_nullable
                  as int,
        carbs: null == carbs
            ? _value.carbs
            : carbs // ignore: cast_nullable_to_non_nullable
                  as int,
        fat: null == fat
            ? _value.fat
            : fat // ignore: cast_nullable_to_non_nullable
                  as int,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ParsedFoodItemImpl implements _ParsedFoodItem {
  const _$ParsedFoodItemImpl({
    required this.name,
    required this.portion,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.confidence,
  });

  factory _$ParsedFoodItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParsedFoodItemImplFromJson(json);

  @override
  final String name;
  @override
  final String portion;
  @override
  final int calories;
  @override
  final int protein;
  @override
  final int carbs;
  @override
  final int fat;
  @override
  final int confidence;

  @override
  String toString() {
    return 'ParsedFoodItem(name: $name, portion: $portion, calories: $calories, protein: $protein, carbs: $carbs, fat: $fat, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParsedFoodItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.portion, portion) || other.portion == portion) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.fat, fat) || other.fat == fat) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    portion,
    calories,
    protein,
    carbs,
    fat,
    confidence,
  );

  /// Create a copy of ParsedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParsedFoodItemImplCopyWith<_$ParsedFoodItemImpl> get copyWith =>
      __$$ParsedFoodItemImplCopyWithImpl<_$ParsedFoodItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ParsedFoodItemImplToJson(this);
  }
}

abstract class _ParsedFoodItem implements ParsedFoodItem {
  const factory _ParsedFoodItem({
    required final String name,
    required final String portion,
    required final int calories,
    required final int protein,
    required final int carbs,
    required final int fat,
    required final int confidence,
  }) = _$ParsedFoodItemImpl;

  factory _ParsedFoodItem.fromJson(Map<String, dynamic> json) =
      _$ParsedFoodItemImpl.fromJson;

  @override
  String get name;
  @override
  String get portion;
  @override
  int get calories;
  @override
  int get protein;
  @override
  int get carbs;
  @override
  int get fat;
  @override
  int get confidence;

  /// Create a copy of ParsedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParsedFoodItemImplCopyWith<_$ParsedFoodItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhotoComparison _$PhotoComparisonFromJson(Map<String, dynamic> json) {
  return _PhotoComparison.fromJson(json);
}

/// @nodoc
mixin _$PhotoComparison {
  String get id => throw _privateConstructorUsedError;
  String get beforePhotoId => throw _privateConstructorUsedError;
  String get afterPhotoId => throw _privateConstructorUsedError;
  String get insights => throw _privateConstructorUsedError;
  List<String> get detectedChanges => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  bool get isAiGenerated => throw _privateConstructorUsedError;

  /// Serializes this PhotoComparison to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotoComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoComparisonCopyWith<PhotoComparison> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoComparisonCopyWith<$Res> {
  factory $PhotoComparisonCopyWith(
    PhotoComparison value,
    $Res Function(PhotoComparison) then,
  ) = _$PhotoComparisonCopyWithImpl<$Res, PhotoComparison>;
  @useResult
  $Res call({
    String id,
    String beforePhotoId,
    String afterPhotoId,
    String insights,
    List<String> detectedChanges,
    DateTime generatedAt,
    bool isAiGenerated,
  });
}

/// @nodoc
class _$PhotoComparisonCopyWithImpl<$Res, $Val extends PhotoComparison>
    implements $PhotoComparisonCopyWith<$Res> {
  _$PhotoComparisonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? beforePhotoId = null,
    Object? afterPhotoId = null,
    Object? insights = null,
    Object? detectedChanges = null,
    Object? generatedAt = null,
    Object? isAiGenerated = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            beforePhotoId: null == beforePhotoId
                ? _value.beforePhotoId
                : beforePhotoId // ignore: cast_nullable_to_non_nullable
                      as String,
            afterPhotoId: null == afterPhotoId
                ? _value.afterPhotoId
                : afterPhotoId // ignore: cast_nullable_to_non_nullable
                      as String,
            insights: null == insights
                ? _value.insights
                : insights // ignore: cast_nullable_to_non_nullable
                      as String,
            detectedChanges: null == detectedChanges
                ? _value.detectedChanges
                : detectedChanges // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isAiGenerated: null == isAiGenerated
                ? _value.isAiGenerated
                : isAiGenerated // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PhotoComparisonImplCopyWith<$Res>
    implements $PhotoComparisonCopyWith<$Res> {
  factory _$$PhotoComparisonImplCopyWith(
    _$PhotoComparisonImpl value,
    $Res Function(_$PhotoComparisonImpl) then,
  ) = __$$PhotoComparisonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String beforePhotoId,
    String afterPhotoId,
    String insights,
    List<String> detectedChanges,
    DateTime generatedAt,
    bool isAiGenerated,
  });
}

/// @nodoc
class __$$PhotoComparisonImplCopyWithImpl<$Res>
    extends _$PhotoComparisonCopyWithImpl<$Res, _$PhotoComparisonImpl>
    implements _$$PhotoComparisonImplCopyWith<$Res> {
  __$$PhotoComparisonImplCopyWithImpl(
    _$PhotoComparisonImpl _value,
    $Res Function(_$PhotoComparisonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PhotoComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? beforePhotoId = null,
    Object? afterPhotoId = null,
    Object? insights = null,
    Object? detectedChanges = null,
    Object? generatedAt = null,
    Object? isAiGenerated = null,
  }) {
    return _then(
      _$PhotoComparisonImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        beforePhotoId: null == beforePhotoId
            ? _value.beforePhotoId
            : beforePhotoId // ignore: cast_nullable_to_non_nullable
                  as String,
        afterPhotoId: null == afterPhotoId
            ? _value.afterPhotoId
            : afterPhotoId // ignore: cast_nullable_to_non_nullable
                  as String,
        insights: null == insights
            ? _value.insights
            : insights // ignore: cast_nullable_to_non_nullable
                  as String,
        detectedChanges: null == detectedChanges
            ? _value._detectedChanges
            : detectedChanges // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isAiGenerated: null == isAiGenerated
            ? _value.isAiGenerated
            : isAiGenerated // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoComparisonImpl implements _PhotoComparison {
  const _$PhotoComparisonImpl({
    required this.id,
    required this.beforePhotoId,
    required this.afterPhotoId,
    required this.insights,
    final List<String> detectedChanges = const [],
    required this.generatedAt,
    this.isAiGenerated = true,
  }) : _detectedChanges = detectedChanges;

  factory _$PhotoComparisonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoComparisonImplFromJson(json);

  @override
  final String id;
  @override
  final String beforePhotoId;
  @override
  final String afterPhotoId;
  @override
  final String insights;
  final List<String> _detectedChanges;
  @override
  @JsonKey()
  List<String> get detectedChanges {
    if (_detectedChanges is EqualUnmodifiableListView) return _detectedChanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detectedChanges);
  }

  @override
  final DateTime generatedAt;
  @override
  @JsonKey()
  final bool isAiGenerated;

  @override
  String toString() {
    return 'PhotoComparison(id: $id, beforePhotoId: $beforePhotoId, afterPhotoId: $afterPhotoId, insights: $insights, detectedChanges: $detectedChanges, generatedAt: $generatedAt, isAiGenerated: $isAiGenerated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoComparisonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.beforePhotoId, beforePhotoId) ||
                other.beforePhotoId == beforePhotoId) &&
            (identical(other.afterPhotoId, afterPhotoId) ||
                other.afterPhotoId == afterPhotoId) &&
            (identical(other.insights, insights) ||
                other.insights == insights) &&
            const DeepCollectionEquality().equals(
              other._detectedChanges,
              _detectedChanges,
            ) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.isAiGenerated, isAiGenerated) ||
                other.isAiGenerated == isAiGenerated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    beforePhotoId,
    afterPhotoId,
    insights,
    const DeepCollectionEquality().hash(_detectedChanges),
    generatedAt,
    isAiGenerated,
  );

  /// Create a copy of PhotoComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoComparisonImplCopyWith<_$PhotoComparisonImpl> get copyWith =>
      __$$PhotoComparisonImplCopyWithImpl<_$PhotoComparisonImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoComparisonImplToJson(this);
  }
}

abstract class _PhotoComparison implements PhotoComparison {
  const factory _PhotoComparison({
    required final String id,
    required final String beforePhotoId,
    required final String afterPhotoId,
    required final String insights,
    final List<String> detectedChanges,
    required final DateTime generatedAt,
    final bool isAiGenerated,
  }) = _$PhotoComparisonImpl;

  factory _PhotoComparison.fromJson(Map<String, dynamic> json) =
      _$PhotoComparisonImpl.fromJson;

  @override
  String get id;
  @override
  String get beforePhotoId;
  @override
  String get afterPhotoId;
  @override
  String get insights;
  @override
  List<String> get detectedChanges;
  @override
  DateTime get generatedAt;
  @override
  bool get isAiGenerated;

  /// Create a copy of PhotoComparison
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoComparisonImplCopyWith<_$PhotoComparisonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
