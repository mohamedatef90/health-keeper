// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MealSuggestion _$MealSuggestionFromJson(Map<String, dynamic> json) {
  return _MealSuggestion.fromJson(json);
}

/// @nodoc
mixin _$MealSuggestion {
  String get id => throw _privateConstructorUsedError;

  /// Meal name in Arabic
  String get name => throw _privateConstructorUsedError;

  /// Meal name in English
  String get nameEn => throw _privateConstructorUsedError;

  /// Estimated calories
  int get calories => throw _privateConstructorUsedError;

  /// Protein in grams
  int get protein => throw _privateConstructorUsedError;

  /// Carbohydrates in grams
  int get carbs => throw _privateConstructorUsedError;

  /// Fat in grams
  int get fat => throw _privateConstructorUsedError;

  /// Meal category: breakfast, lunch, dinner, snack
  String get category => throw _privateConstructorUsedError;

  /// Serving size description
  String? get servingSize => throw _privateConstructorUsedError;

  /// Why this meal is suggested
  String? get reasoning => throw _privateConstructorUsedError;

  /// How well it fits user's goals (0-100)
  int get fitScore => throw _privateConstructorUsedError;

  /// Tags for filtering
  List<String> get tags => throw _privateConstructorUsedError;

  /// Is this a high protein meal?
  bool get isHighProtein => throw _privateConstructorUsedError;

  /// Is this vegetarian?
  bool get isVegetarian => throw _privateConstructorUsedError;

  /// Is this low carb?
  bool get isLowCarb => throw _privateConstructorUsedError;

  /// Was this AI-generated or from database?
  bool get isAiGenerated => throw _privateConstructorUsedError;

  /// AI confidence in this suggestion (0-100)
  int? get confidence => throw _privateConstructorUsedError;

  /// Serializes this MealSuggestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealSuggestionCopyWith<MealSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealSuggestionCopyWith<$Res> {
  factory $MealSuggestionCopyWith(
    MealSuggestion value,
    $Res Function(MealSuggestion) then,
  ) = _$MealSuggestionCopyWithImpl<$Res, MealSuggestion>;
  @useResult
  $Res call({
    String id,
    String name,
    String nameEn,
    int calories,
    int protein,
    int carbs,
    int fat,
    String category,
    String? servingSize,
    String? reasoning,
    int fitScore,
    List<String> tags,
    bool isHighProtein,
    bool isVegetarian,
    bool isLowCarb,
    bool isAiGenerated,
    int? confidence,
  });
}

/// @nodoc
class _$MealSuggestionCopyWithImpl<$Res, $Val extends MealSuggestion>
    implements $MealSuggestionCopyWith<$Res> {
  _$MealSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameEn = null,
    Object? calories = null,
    Object? protein = null,
    Object? carbs = null,
    Object? fat = null,
    Object? category = null,
    Object? servingSize = freezed,
    Object? reasoning = freezed,
    Object? fitScore = null,
    Object? tags = null,
    Object? isHighProtein = null,
    Object? isVegetarian = null,
    Object? isLowCarb = null,
    Object? isAiGenerated = null,
    Object? confidence = freezed,
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
            nameEn: null == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
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
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            servingSize: freezed == servingSize
                ? _value.servingSize
                : servingSize // ignore: cast_nullable_to_non_nullable
                      as String?,
            reasoning: freezed == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String?,
            fitScore: null == fitScore
                ? _value.fitScore
                : fitScore // ignore: cast_nullable_to_non_nullable
                      as int,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isHighProtein: null == isHighProtein
                ? _value.isHighProtein
                : isHighProtein // ignore: cast_nullable_to_non_nullable
                      as bool,
            isVegetarian: null == isVegetarian
                ? _value.isVegetarian
                : isVegetarian // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLowCarb: null == isLowCarb
                ? _value.isLowCarb
                : isLowCarb // ignore: cast_nullable_to_non_nullable
                      as bool,
            isAiGenerated: null == isAiGenerated
                ? _value.isAiGenerated
                : isAiGenerated // ignore: cast_nullable_to_non_nullable
                      as bool,
            confidence: freezed == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MealSuggestionImplCopyWith<$Res>
    implements $MealSuggestionCopyWith<$Res> {
  factory _$$MealSuggestionImplCopyWith(
    _$MealSuggestionImpl value,
    $Res Function(_$MealSuggestionImpl) then,
  ) = __$$MealSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String nameEn,
    int calories,
    int protein,
    int carbs,
    int fat,
    String category,
    String? servingSize,
    String? reasoning,
    int fitScore,
    List<String> tags,
    bool isHighProtein,
    bool isVegetarian,
    bool isLowCarb,
    bool isAiGenerated,
    int? confidence,
  });
}

/// @nodoc
class __$$MealSuggestionImplCopyWithImpl<$Res>
    extends _$MealSuggestionCopyWithImpl<$Res, _$MealSuggestionImpl>
    implements _$$MealSuggestionImplCopyWith<$Res> {
  __$$MealSuggestionImplCopyWithImpl(
    _$MealSuggestionImpl _value,
    $Res Function(_$MealSuggestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameEn = null,
    Object? calories = null,
    Object? protein = null,
    Object? carbs = null,
    Object? fat = null,
    Object? category = null,
    Object? servingSize = freezed,
    Object? reasoning = freezed,
    Object? fitScore = null,
    Object? tags = null,
    Object? isHighProtein = null,
    Object? isVegetarian = null,
    Object? isLowCarb = null,
    Object? isAiGenerated = null,
    Object? confidence = freezed,
  }) {
    return _then(
      _$MealSuggestionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: null == nameEn
            ? _value.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
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
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        servingSize: freezed == servingSize
            ? _value.servingSize
            : servingSize // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasoning: freezed == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String?,
        fitScore: null == fitScore
            ? _value.fitScore
            : fitScore // ignore: cast_nullable_to_non_nullable
                  as int,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isHighProtein: null == isHighProtein
            ? _value.isHighProtein
            : isHighProtein // ignore: cast_nullable_to_non_nullable
                  as bool,
        isVegetarian: null == isVegetarian
            ? _value.isVegetarian
            : isVegetarian // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLowCarb: null == isLowCarb
            ? _value.isLowCarb
            : isLowCarb // ignore: cast_nullable_to_non_nullable
                  as bool,
        isAiGenerated: null == isAiGenerated
            ? _value.isAiGenerated
            : isAiGenerated // ignore: cast_nullable_to_non_nullable
                  as bool,
        confidence: freezed == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MealSuggestionImpl implements _MealSuggestion {
  const _$MealSuggestionImpl({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.category,
    this.servingSize,
    this.reasoning,
    this.fitScore = 0,
    final List<String> tags = const [],
    this.isHighProtein = false,
    this.isVegetarian = false,
    this.isLowCarb = false,
    this.isAiGenerated = false,
    this.confidence,
  }) : _tags = tags;

  factory _$MealSuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealSuggestionImplFromJson(json);

  @override
  final String id;

  /// Meal name in Arabic
  @override
  final String name;

  /// Meal name in English
  @override
  final String nameEn;

  /// Estimated calories
  @override
  final int calories;

  /// Protein in grams
  @override
  final int protein;

  /// Carbohydrates in grams
  @override
  final int carbs;

  /// Fat in grams
  @override
  final int fat;

  /// Meal category: breakfast, lunch, dinner, snack
  @override
  final String category;

  /// Serving size description
  @override
  final String? servingSize;

  /// Why this meal is suggested
  @override
  final String? reasoning;

  /// How well it fits user's goals (0-100)
  @override
  @JsonKey()
  final int fitScore;

  /// Tags for filtering
  final List<String> _tags;

  /// Tags for filtering
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// Is this a high protein meal?
  @override
  @JsonKey()
  final bool isHighProtein;

  /// Is this vegetarian?
  @override
  @JsonKey()
  final bool isVegetarian;

  /// Is this low carb?
  @override
  @JsonKey()
  final bool isLowCarb;

  /// Was this AI-generated or from database?
  @override
  @JsonKey()
  final bool isAiGenerated;

  /// AI confidence in this suggestion (0-100)
  @override
  final int? confidence;

  @override
  String toString() {
    return 'MealSuggestion(id: $id, name: $name, nameEn: $nameEn, calories: $calories, protein: $protein, carbs: $carbs, fat: $fat, category: $category, servingSize: $servingSize, reasoning: $reasoning, fitScore: $fitScore, tags: $tags, isHighProtein: $isHighProtein, isVegetarian: $isVegetarian, isLowCarb: $isLowCarb, isAiGenerated: $isAiGenerated, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealSuggestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.fat, fat) || other.fat == fat) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.servingSize, servingSize) ||
                other.servingSize == servingSize) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.fitScore, fitScore) ||
                other.fitScore == fitScore) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isHighProtein, isHighProtein) ||
                other.isHighProtein == isHighProtein) &&
            (identical(other.isVegetarian, isVegetarian) ||
                other.isVegetarian == isVegetarian) &&
            (identical(other.isLowCarb, isLowCarb) ||
                other.isLowCarb == isLowCarb) &&
            (identical(other.isAiGenerated, isAiGenerated) ||
                other.isAiGenerated == isAiGenerated) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    nameEn,
    calories,
    protein,
    carbs,
    fat,
    category,
    servingSize,
    reasoning,
    fitScore,
    const DeepCollectionEquality().hash(_tags),
    isHighProtein,
    isVegetarian,
    isLowCarb,
    isAiGenerated,
    confidence,
  );

  /// Create a copy of MealSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealSuggestionImplCopyWith<_$MealSuggestionImpl> get copyWith =>
      __$$MealSuggestionImplCopyWithImpl<_$MealSuggestionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MealSuggestionImplToJson(this);
  }
}

abstract class _MealSuggestion implements MealSuggestion {
  const factory _MealSuggestion({
    required final String id,
    required final String name,
    required final String nameEn,
    required final int calories,
    required final int protein,
    required final int carbs,
    required final int fat,
    required final String category,
    final String? servingSize,
    final String? reasoning,
    final int fitScore,
    final List<String> tags,
    final bool isHighProtein,
    final bool isVegetarian,
    final bool isLowCarb,
    final bool isAiGenerated,
    final int? confidence,
  }) = _$MealSuggestionImpl;

  factory _MealSuggestion.fromJson(Map<String, dynamic> json) =
      _$MealSuggestionImpl.fromJson;

  @override
  String get id;

  /// Meal name in Arabic
  @override
  String get name;

  /// Meal name in English
  @override
  String get nameEn;

  /// Estimated calories
  @override
  int get calories;

  /// Protein in grams
  @override
  int get protein;

  /// Carbohydrates in grams
  @override
  int get carbs;

  /// Fat in grams
  @override
  int get fat;

  /// Meal category: breakfast, lunch, dinner, snack
  @override
  String get category;

  /// Serving size description
  @override
  String? get servingSize;

  /// Why this meal is suggested
  @override
  String? get reasoning;

  /// How well it fits user's goals (0-100)
  @override
  int get fitScore;

  /// Tags for filtering
  @override
  List<String> get tags;

  /// Is this a high protein meal?
  @override
  bool get isHighProtein;

  /// Is this vegetarian?
  @override
  bool get isVegetarian;

  /// Is this low carb?
  @override
  bool get isLowCarb;

  /// Was this AI-generated or from database?
  @override
  bool get isAiGenerated;

  /// AI confidence in this suggestion (0-100)
  @override
  int? get confidence;

  /// Create a copy of MealSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealSuggestionImplCopyWith<_$MealSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyMealPlan _$DailyMealPlanFromJson(Map<String, dynamic> json) {
  return _DailyMealPlan.fromJson(json);
}

/// @nodoc
mixin _$DailyMealPlan {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Target calories for the day
  int get targetCalories => throw _privateConstructorUsedError;

  /// Target protein in grams
  int get targetProtein => throw _privateConstructorUsedError;

  /// Breakfast suggestion
  MealSuggestion? get breakfast => throw _privateConstructorUsedError;

  /// Lunch suggestion
  MealSuggestion? get lunch => throw _privateConstructorUsedError;

  /// Dinner suggestion
  MealSuggestion? get dinner => throw _privateConstructorUsedError;

  /// Snacks suggestions (up to 2)
  List<MealSuggestion> get snacks => throw _privateConstructorUsedError;

  /// Total planned calories
  int get totalCalories => throw _privateConstructorUsedError;

  /// Total planned protein
  int get totalProtein => throw _privateConstructorUsedError;

  /// Total planned carbs
  int get totalCarbs => throw _privateConstructorUsedError;

  /// Total planned fat
  int get totalFat => throw _privateConstructorUsedError;

  /// How well the plan matches targets (0-100)
  int get overallFitScore => throw _privateConstructorUsedError;

  /// AI-generated coaching note about the plan
  String? get coachingNote => throw _privateConstructorUsedError;

  /// Is this an AI-generated plan?
  bool get isAiGenerated => throw _privateConstructorUsedError;

  /// AI confidence in this plan (0-100)
  int? get confidence => throw _privateConstructorUsedError;

  /// Dietary restrictions considered
  List<String> get dietaryRestrictions => throw _privateConstructorUsedError;

  /// Serializes this DailyMealPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyMealPlanCopyWith<DailyMealPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyMealPlanCopyWith<$Res> {
  factory $DailyMealPlanCopyWith(
    DailyMealPlan value,
    $Res Function(DailyMealPlan) then,
  ) = _$DailyMealPlanCopyWithImpl<$Res, DailyMealPlan>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime generatedAt,
    int targetCalories,
    int targetProtein,
    MealSuggestion? breakfast,
    MealSuggestion? lunch,
    MealSuggestion? dinner,
    List<MealSuggestion> snacks,
    int totalCalories,
    int totalProtein,
    int totalCarbs,
    int totalFat,
    int overallFitScore,
    String? coachingNote,
    bool isAiGenerated,
    int? confidence,
    List<String> dietaryRestrictions,
  });

  $MealSuggestionCopyWith<$Res>? get breakfast;
  $MealSuggestionCopyWith<$Res>? get lunch;
  $MealSuggestionCopyWith<$Res>? get dinner;
}

/// @nodoc
class _$DailyMealPlanCopyWithImpl<$Res, $Val extends DailyMealPlan>
    implements $DailyMealPlanCopyWith<$Res> {
  _$DailyMealPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? generatedAt = null,
    Object? targetCalories = null,
    Object? targetProtein = null,
    Object? breakfast = freezed,
    Object? lunch = freezed,
    Object? dinner = freezed,
    Object? snacks = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? overallFitScore = null,
    Object? coachingNote = freezed,
    Object? isAiGenerated = null,
    Object? confidence = freezed,
    Object? dietaryRestrictions = null,
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
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            targetCalories: null == targetCalories
                ? _value.targetCalories
                : targetCalories // ignore: cast_nullable_to_non_nullable
                      as int,
            targetProtein: null == targetProtein
                ? _value.targetProtein
                : targetProtein // ignore: cast_nullable_to_non_nullable
                      as int,
            breakfast: freezed == breakfast
                ? _value.breakfast
                : breakfast // ignore: cast_nullable_to_non_nullable
                      as MealSuggestion?,
            lunch: freezed == lunch
                ? _value.lunch
                : lunch // ignore: cast_nullable_to_non_nullable
                      as MealSuggestion?,
            dinner: freezed == dinner
                ? _value.dinner
                : dinner // ignore: cast_nullable_to_non_nullable
                      as MealSuggestion?,
            snacks: null == snacks
                ? _value.snacks
                : snacks // ignore: cast_nullable_to_non_nullable
                      as List<MealSuggestion>,
            totalCalories: null == totalCalories
                ? _value.totalCalories
                : totalCalories // ignore: cast_nullable_to_non_nullable
                      as int,
            totalProtein: null == totalProtein
                ? _value.totalProtein
                : totalProtein // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCarbs: null == totalCarbs
                ? _value.totalCarbs
                : totalCarbs // ignore: cast_nullable_to_non_nullable
                      as int,
            totalFat: null == totalFat
                ? _value.totalFat
                : totalFat // ignore: cast_nullable_to_non_nullable
                      as int,
            overallFitScore: null == overallFitScore
                ? _value.overallFitScore
                : overallFitScore // ignore: cast_nullable_to_non_nullable
                      as int,
            coachingNote: freezed == coachingNote
                ? _value.coachingNote
                : coachingNote // ignore: cast_nullable_to_non_nullable
                      as String?,
            isAiGenerated: null == isAiGenerated
                ? _value.isAiGenerated
                : isAiGenerated // ignore: cast_nullable_to_non_nullable
                      as bool,
            confidence: freezed == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int?,
            dietaryRestrictions: null == dietaryRestrictions
                ? _value.dietaryRestrictions
                : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of DailyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealSuggestionCopyWith<$Res>? get breakfast {
    if (_value.breakfast == null) {
      return null;
    }

    return $MealSuggestionCopyWith<$Res>(_value.breakfast!, (value) {
      return _then(_value.copyWith(breakfast: value) as $Val);
    });
  }

  /// Create a copy of DailyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealSuggestionCopyWith<$Res>? get lunch {
    if (_value.lunch == null) {
      return null;
    }

    return $MealSuggestionCopyWith<$Res>(_value.lunch!, (value) {
      return _then(_value.copyWith(lunch: value) as $Val);
    });
  }

  /// Create a copy of DailyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealSuggestionCopyWith<$Res>? get dinner {
    if (_value.dinner == null) {
      return null;
    }

    return $MealSuggestionCopyWith<$Res>(_value.dinner!, (value) {
      return _then(_value.copyWith(dinner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyMealPlanImplCopyWith<$Res>
    implements $DailyMealPlanCopyWith<$Res> {
  factory _$$DailyMealPlanImplCopyWith(
    _$DailyMealPlanImpl value,
    $Res Function(_$DailyMealPlanImpl) then,
  ) = __$$DailyMealPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    DateTime generatedAt,
    int targetCalories,
    int targetProtein,
    MealSuggestion? breakfast,
    MealSuggestion? lunch,
    MealSuggestion? dinner,
    List<MealSuggestion> snacks,
    int totalCalories,
    int totalProtein,
    int totalCarbs,
    int totalFat,
    int overallFitScore,
    String? coachingNote,
    bool isAiGenerated,
    int? confidence,
    List<String> dietaryRestrictions,
  });

  @override
  $MealSuggestionCopyWith<$Res>? get breakfast;
  @override
  $MealSuggestionCopyWith<$Res>? get lunch;
  @override
  $MealSuggestionCopyWith<$Res>? get dinner;
}

/// @nodoc
class __$$DailyMealPlanImplCopyWithImpl<$Res>
    extends _$DailyMealPlanCopyWithImpl<$Res, _$DailyMealPlanImpl>
    implements _$$DailyMealPlanImplCopyWith<$Res> {
  __$$DailyMealPlanImplCopyWithImpl(
    _$DailyMealPlanImpl _value,
    $Res Function(_$DailyMealPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? generatedAt = null,
    Object? targetCalories = null,
    Object? targetProtein = null,
    Object? breakfast = freezed,
    Object? lunch = freezed,
    Object? dinner = freezed,
    Object? snacks = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? overallFitScore = null,
    Object? coachingNote = freezed,
    Object? isAiGenerated = null,
    Object? confidence = freezed,
    Object? dietaryRestrictions = null,
  }) {
    return _then(
      _$DailyMealPlanImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        targetCalories: null == targetCalories
            ? _value.targetCalories
            : targetCalories // ignore: cast_nullable_to_non_nullable
                  as int,
        targetProtein: null == targetProtein
            ? _value.targetProtein
            : targetProtein // ignore: cast_nullable_to_non_nullable
                  as int,
        breakfast: freezed == breakfast
            ? _value.breakfast
            : breakfast // ignore: cast_nullable_to_non_nullable
                  as MealSuggestion?,
        lunch: freezed == lunch
            ? _value.lunch
            : lunch // ignore: cast_nullable_to_non_nullable
                  as MealSuggestion?,
        dinner: freezed == dinner
            ? _value.dinner
            : dinner // ignore: cast_nullable_to_non_nullable
                  as MealSuggestion?,
        snacks: null == snacks
            ? _value._snacks
            : snacks // ignore: cast_nullable_to_non_nullable
                  as List<MealSuggestion>,
        totalCalories: null == totalCalories
            ? _value.totalCalories
            : totalCalories // ignore: cast_nullable_to_non_nullable
                  as int,
        totalProtein: null == totalProtein
            ? _value.totalProtein
            : totalProtein // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCarbs: null == totalCarbs
            ? _value.totalCarbs
            : totalCarbs // ignore: cast_nullable_to_non_nullable
                  as int,
        totalFat: null == totalFat
            ? _value.totalFat
            : totalFat // ignore: cast_nullable_to_non_nullable
                  as int,
        overallFitScore: null == overallFitScore
            ? _value.overallFitScore
            : overallFitScore // ignore: cast_nullable_to_non_nullable
                  as int,
        coachingNote: freezed == coachingNote
            ? _value.coachingNote
            : coachingNote // ignore: cast_nullable_to_non_nullable
                  as String?,
        isAiGenerated: null == isAiGenerated
            ? _value.isAiGenerated
            : isAiGenerated // ignore: cast_nullable_to_non_nullable
                  as bool,
        confidence: freezed == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int?,
        dietaryRestrictions: null == dietaryRestrictions
            ? _value._dietaryRestrictions
            : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyMealPlanImpl implements _DailyMealPlan {
  const _$DailyMealPlanImpl({
    required this.id,
    required this.date,
    required this.generatedAt,
    required this.targetCalories,
    required this.targetProtein,
    this.breakfast,
    this.lunch,
    this.dinner,
    final List<MealSuggestion> snacks = const [],
    this.totalCalories = 0,
    this.totalProtein = 0,
    this.totalCarbs = 0,
    this.totalFat = 0,
    this.overallFitScore = 0,
    this.coachingNote,
    this.isAiGenerated = false,
    this.confidence,
    final List<String> dietaryRestrictions = const [],
  }) : _snacks = snacks,
       _dietaryRestrictions = dietaryRestrictions;

  factory _$DailyMealPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyMealPlanImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime generatedAt;

  /// Target calories for the day
  @override
  final int targetCalories;

  /// Target protein in grams
  @override
  final int targetProtein;

  /// Breakfast suggestion
  @override
  final MealSuggestion? breakfast;

  /// Lunch suggestion
  @override
  final MealSuggestion? lunch;

  /// Dinner suggestion
  @override
  final MealSuggestion? dinner;

  /// Snacks suggestions (up to 2)
  final List<MealSuggestion> _snacks;

  /// Snacks suggestions (up to 2)
  @override
  @JsonKey()
  List<MealSuggestion> get snacks {
    if (_snacks is EqualUnmodifiableListView) return _snacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_snacks);
  }

  /// Total planned calories
  @override
  @JsonKey()
  final int totalCalories;

  /// Total planned protein
  @override
  @JsonKey()
  final int totalProtein;

  /// Total planned carbs
  @override
  @JsonKey()
  final int totalCarbs;

  /// Total planned fat
  @override
  @JsonKey()
  final int totalFat;

  /// How well the plan matches targets (0-100)
  @override
  @JsonKey()
  final int overallFitScore;

  /// AI-generated coaching note about the plan
  @override
  final String? coachingNote;

  /// Is this an AI-generated plan?
  @override
  @JsonKey()
  final bool isAiGenerated;

  /// AI confidence in this plan (0-100)
  @override
  final int? confidence;

  /// Dietary restrictions considered
  final List<String> _dietaryRestrictions;

  /// Dietary restrictions considered
  @override
  @JsonKey()
  List<String> get dietaryRestrictions {
    if (_dietaryRestrictions is EqualUnmodifiableListView)
      return _dietaryRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryRestrictions);
  }

  @override
  String toString() {
    return 'DailyMealPlan(id: $id, date: $date, generatedAt: $generatedAt, targetCalories: $targetCalories, targetProtein: $targetProtein, breakfast: $breakfast, lunch: $lunch, dinner: $dinner, snacks: $snacks, totalCalories: $totalCalories, totalProtein: $totalProtein, totalCarbs: $totalCarbs, totalFat: $totalFat, overallFitScore: $overallFitScore, coachingNote: $coachingNote, isAiGenerated: $isAiGenerated, confidence: $confidence, dietaryRestrictions: $dietaryRestrictions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyMealPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.targetCalories, targetCalories) ||
                other.targetCalories == targetCalories) &&
            (identical(other.targetProtein, targetProtein) ||
                other.targetProtein == targetProtein) &&
            (identical(other.breakfast, breakfast) ||
                other.breakfast == breakfast) &&
            (identical(other.lunch, lunch) || other.lunch == lunch) &&
            (identical(other.dinner, dinner) || other.dinner == dinner) &&
            const DeepCollectionEquality().equals(other._snacks, _snacks) &&
            (identical(other.totalCalories, totalCalories) ||
                other.totalCalories == totalCalories) &&
            (identical(other.totalProtein, totalProtein) ||
                other.totalProtein == totalProtein) &&
            (identical(other.totalCarbs, totalCarbs) ||
                other.totalCarbs == totalCarbs) &&
            (identical(other.totalFat, totalFat) ||
                other.totalFat == totalFat) &&
            (identical(other.overallFitScore, overallFitScore) ||
                other.overallFitScore == overallFitScore) &&
            (identical(other.coachingNote, coachingNote) ||
                other.coachingNote == coachingNote) &&
            (identical(other.isAiGenerated, isAiGenerated) ||
                other.isAiGenerated == isAiGenerated) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(
              other._dietaryRestrictions,
              _dietaryRestrictions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    generatedAt,
    targetCalories,
    targetProtein,
    breakfast,
    lunch,
    dinner,
    const DeepCollectionEquality().hash(_snacks),
    totalCalories,
    totalProtein,
    totalCarbs,
    totalFat,
    overallFitScore,
    coachingNote,
    isAiGenerated,
    confidence,
    const DeepCollectionEquality().hash(_dietaryRestrictions),
  );

  /// Create a copy of DailyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMealPlanImplCopyWith<_$DailyMealPlanImpl> get copyWith =>
      __$$DailyMealPlanImplCopyWithImpl<_$DailyMealPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyMealPlanImplToJson(this);
  }
}

abstract class _DailyMealPlan implements DailyMealPlan {
  const factory _DailyMealPlan({
    required final String id,
    required final DateTime date,
    required final DateTime generatedAt,
    required final int targetCalories,
    required final int targetProtein,
    final MealSuggestion? breakfast,
    final MealSuggestion? lunch,
    final MealSuggestion? dinner,
    final List<MealSuggestion> snacks,
    final int totalCalories,
    final int totalProtein,
    final int totalCarbs,
    final int totalFat,
    final int overallFitScore,
    final String? coachingNote,
    final bool isAiGenerated,
    final int? confidence,
    final List<String> dietaryRestrictions,
  }) = _$DailyMealPlanImpl;

  factory _DailyMealPlan.fromJson(Map<String, dynamic> json) =
      _$DailyMealPlanImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get generatedAt;

  /// Target calories for the day
  @override
  int get targetCalories;

  /// Target protein in grams
  @override
  int get targetProtein;

  /// Breakfast suggestion
  @override
  MealSuggestion? get breakfast;

  /// Lunch suggestion
  @override
  MealSuggestion? get lunch;

  /// Dinner suggestion
  @override
  MealSuggestion? get dinner;

  /// Snacks suggestions (up to 2)
  @override
  List<MealSuggestion> get snacks;

  /// Total planned calories
  @override
  int get totalCalories;

  /// Total planned protein
  @override
  int get totalProtein;

  /// Total planned carbs
  @override
  int get totalCarbs;

  /// Total planned fat
  @override
  int get totalFat;

  /// How well the plan matches targets (0-100)
  @override
  int get overallFitScore;

  /// AI-generated coaching note about the plan
  @override
  String? get coachingNote;

  /// Is this an AI-generated plan?
  @override
  bool get isAiGenerated;

  /// AI confidence in this plan (0-100)
  @override
  int? get confidence;

  /// Dietary restrictions considered
  @override
  List<String> get dietaryRestrictions;

  /// Create a copy of DailyMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyMealPlanImplCopyWith<_$DailyMealPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealSuggestionContext _$MealSuggestionContextFromJson(
  Map<String, dynamic> json,
) {
  return _MealSuggestionContext.fromJson(json);
}

/// @nodoc
mixin _$MealSuggestionContext {
  /// Target calories for the meal
  int get targetCalories => throw _privateConstructorUsedError;

  /// Target protein for the meal
  int get targetProtein => throw _privateConstructorUsedError;

  /// Meal type: breakfast, lunch, dinner, snack
  String get mealType => throw _privateConstructorUsedError;

  /// User's dietary restrictions
  List<String> get dietaryRestrictions => throw _privateConstructorUsedError;

  /// Prefer Egyptian/local cuisine
  bool get preferEgyptian => throw _privateConstructorUsedError;

  /// Remaining calories for the day (if any)
  int? get remainingCalories => throw _privateConstructorUsedError;

  /// Remaining protein for the day (if any)
  int? get remainingProtein => throw _privateConstructorUsedError;

  /// Meals already consumed today
  List<String> get mealsConsumedToday => throw _privateConstructorUsedError;

  /// Time of day (for appropriate suggestions)
  String? get timeOfDay => throw _privateConstructorUsedError;

  /// User's preference for high protein
  bool get preferHighProtein => throw _privateConstructorUsedError;

  /// User's preference for vegetarian
  bool get preferVegetarian => throw _privateConstructorUsedError;

  /// User's preference for low carb
  bool get preferLowCarb => throw _privateConstructorUsedError;

  /// Current Ramadan mode (affects meal timing)
  bool get isRamadan => throw _privateConstructorUsedError;

  /// Language preference: 'ar' or 'en'
  String get language => throw _privateConstructorUsedError;

  /// Serializes this MealSuggestionContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealSuggestionContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealSuggestionContextCopyWith<MealSuggestionContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealSuggestionContextCopyWith<$Res> {
  factory $MealSuggestionContextCopyWith(
    MealSuggestionContext value,
    $Res Function(MealSuggestionContext) then,
  ) = _$MealSuggestionContextCopyWithImpl<$Res, MealSuggestionContext>;
  @useResult
  $Res call({
    int targetCalories,
    int targetProtein,
    String mealType,
    List<String> dietaryRestrictions,
    bool preferEgyptian,
    int? remainingCalories,
    int? remainingProtein,
    List<String> mealsConsumedToday,
    String? timeOfDay,
    bool preferHighProtein,
    bool preferVegetarian,
    bool preferLowCarb,
    bool isRamadan,
    String language,
  });
}

/// @nodoc
class _$MealSuggestionContextCopyWithImpl<
  $Res,
  $Val extends MealSuggestionContext
>
    implements $MealSuggestionContextCopyWith<$Res> {
  _$MealSuggestionContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealSuggestionContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetCalories = null,
    Object? targetProtein = null,
    Object? mealType = null,
    Object? dietaryRestrictions = null,
    Object? preferEgyptian = null,
    Object? remainingCalories = freezed,
    Object? remainingProtein = freezed,
    Object? mealsConsumedToday = null,
    Object? timeOfDay = freezed,
    Object? preferHighProtein = null,
    Object? preferVegetarian = null,
    Object? preferLowCarb = null,
    Object? isRamadan = null,
    Object? language = null,
  }) {
    return _then(
      _value.copyWith(
            targetCalories: null == targetCalories
                ? _value.targetCalories
                : targetCalories // ignore: cast_nullable_to_non_nullable
                      as int,
            targetProtein: null == targetProtein
                ? _value.targetProtein
                : targetProtein // ignore: cast_nullable_to_non_nullable
                      as int,
            mealType: null == mealType
                ? _value.mealType
                : mealType // ignore: cast_nullable_to_non_nullable
                      as String,
            dietaryRestrictions: null == dietaryRestrictions
                ? _value.dietaryRestrictions
                : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            preferEgyptian: null == preferEgyptian
                ? _value.preferEgyptian
                : preferEgyptian // ignore: cast_nullable_to_non_nullable
                      as bool,
            remainingCalories: freezed == remainingCalories
                ? _value.remainingCalories
                : remainingCalories // ignore: cast_nullable_to_non_nullable
                      as int?,
            remainingProtein: freezed == remainingProtein
                ? _value.remainingProtein
                : remainingProtein // ignore: cast_nullable_to_non_nullable
                      as int?,
            mealsConsumedToday: null == mealsConsumedToday
                ? _value.mealsConsumedToday
                : mealsConsumedToday // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            timeOfDay: freezed == timeOfDay
                ? _value.timeOfDay
                : timeOfDay // ignore: cast_nullable_to_non_nullable
                      as String?,
            preferHighProtein: null == preferHighProtein
                ? _value.preferHighProtein
                : preferHighProtein // ignore: cast_nullable_to_non_nullable
                      as bool,
            preferVegetarian: null == preferVegetarian
                ? _value.preferVegetarian
                : preferVegetarian // ignore: cast_nullable_to_non_nullable
                      as bool,
            preferLowCarb: null == preferLowCarb
                ? _value.preferLowCarb
                : preferLowCarb // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRamadan: null == isRamadan
                ? _value.isRamadan
                : isRamadan // ignore: cast_nullable_to_non_nullable
                      as bool,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MealSuggestionContextImplCopyWith<$Res>
    implements $MealSuggestionContextCopyWith<$Res> {
  factory _$$MealSuggestionContextImplCopyWith(
    _$MealSuggestionContextImpl value,
    $Res Function(_$MealSuggestionContextImpl) then,
  ) = __$$MealSuggestionContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int targetCalories,
    int targetProtein,
    String mealType,
    List<String> dietaryRestrictions,
    bool preferEgyptian,
    int? remainingCalories,
    int? remainingProtein,
    List<String> mealsConsumedToday,
    String? timeOfDay,
    bool preferHighProtein,
    bool preferVegetarian,
    bool preferLowCarb,
    bool isRamadan,
    String language,
  });
}

/// @nodoc
class __$$MealSuggestionContextImplCopyWithImpl<$Res>
    extends
        _$MealSuggestionContextCopyWithImpl<$Res, _$MealSuggestionContextImpl>
    implements _$$MealSuggestionContextImplCopyWith<$Res> {
  __$$MealSuggestionContextImplCopyWithImpl(
    _$MealSuggestionContextImpl _value,
    $Res Function(_$MealSuggestionContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealSuggestionContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetCalories = null,
    Object? targetProtein = null,
    Object? mealType = null,
    Object? dietaryRestrictions = null,
    Object? preferEgyptian = null,
    Object? remainingCalories = freezed,
    Object? remainingProtein = freezed,
    Object? mealsConsumedToday = null,
    Object? timeOfDay = freezed,
    Object? preferHighProtein = null,
    Object? preferVegetarian = null,
    Object? preferLowCarb = null,
    Object? isRamadan = null,
    Object? language = null,
  }) {
    return _then(
      _$MealSuggestionContextImpl(
        targetCalories: null == targetCalories
            ? _value.targetCalories
            : targetCalories // ignore: cast_nullable_to_non_nullable
                  as int,
        targetProtein: null == targetProtein
            ? _value.targetProtein
            : targetProtein // ignore: cast_nullable_to_non_nullable
                  as int,
        mealType: null == mealType
            ? _value.mealType
            : mealType // ignore: cast_nullable_to_non_nullable
                  as String,
        dietaryRestrictions: null == dietaryRestrictions
            ? _value._dietaryRestrictions
            : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        preferEgyptian: null == preferEgyptian
            ? _value.preferEgyptian
            : preferEgyptian // ignore: cast_nullable_to_non_nullable
                  as bool,
        remainingCalories: freezed == remainingCalories
            ? _value.remainingCalories
            : remainingCalories // ignore: cast_nullable_to_non_nullable
                  as int?,
        remainingProtein: freezed == remainingProtein
            ? _value.remainingProtein
            : remainingProtein // ignore: cast_nullable_to_non_nullable
                  as int?,
        mealsConsumedToday: null == mealsConsumedToday
            ? _value._mealsConsumedToday
            : mealsConsumedToday // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        timeOfDay: freezed == timeOfDay
            ? _value.timeOfDay
            : timeOfDay // ignore: cast_nullable_to_non_nullable
                  as String?,
        preferHighProtein: null == preferHighProtein
            ? _value.preferHighProtein
            : preferHighProtein // ignore: cast_nullable_to_non_nullable
                  as bool,
        preferVegetarian: null == preferVegetarian
            ? _value.preferVegetarian
            : preferVegetarian // ignore: cast_nullable_to_non_nullable
                  as bool,
        preferLowCarb: null == preferLowCarb
            ? _value.preferLowCarb
            : preferLowCarb // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRamadan: null == isRamadan
            ? _value.isRamadan
            : isRamadan // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$MealSuggestionContextImpl implements _MealSuggestionContext {
  const _$MealSuggestionContextImpl({
    required this.targetCalories,
    required this.targetProtein,
    required this.mealType,
    final List<String> dietaryRestrictions = const [],
    this.preferEgyptian = true,
    this.remainingCalories,
    this.remainingProtein,
    final List<String> mealsConsumedToday = const [],
    this.timeOfDay,
    this.preferHighProtein = false,
    this.preferVegetarian = false,
    this.preferLowCarb = false,
    this.isRamadan = false,
    this.language = 'ar',
  }) : _dietaryRestrictions = dietaryRestrictions,
       _mealsConsumedToday = mealsConsumedToday;

  factory _$MealSuggestionContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealSuggestionContextImplFromJson(json);

  /// Target calories for the meal
  @override
  final int targetCalories;

  /// Target protein for the meal
  @override
  final int targetProtein;

  /// Meal type: breakfast, lunch, dinner, snack
  @override
  final String mealType;

  /// User's dietary restrictions
  final List<String> _dietaryRestrictions;

  /// User's dietary restrictions
  @override
  @JsonKey()
  List<String> get dietaryRestrictions {
    if (_dietaryRestrictions is EqualUnmodifiableListView)
      return _dietaryRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryRestrictions);
  }

  /// Prefer Egyptian/local cuisine
  @override
  @JsonKey()
  final bool preferEgyptian;

  /// Remaining calories for the day (if any)
  @override
  final int? remainingCalories;

  /// Remaining protein for the day (if any)
  @override
  final int? remainingProtein;

  /// Meals already consumed today
  final List<String> _mealsConsumedToday;

  /// Meals already consumed today
  @override
  @JsonKey()
  List<String> get mealsConsumedToday {
    if (_mealsConsumedToday is EqualUnmodifiableListView)
      return _mealsConsumedToday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mealsConsumedToday);
  }

  /// Time of day (for appropriate suggestions)
  @override
  final String? timeOfDay;

  /// User's preference for high protein
  @override
  @JsonKey()
  final bool preferHighProtein;

  /// User's preference for vegetarian
  @override
  @JsonKey()
  final bool preferVegetarian;

  /// User's preference for low carb
  @override
  @JsonKey()
  final bool preferLowCarb;

  /// Current Ramadan mode (affects meal timing)
  @override
  @JsonKey()
  final bool isRamadan;

  /// Language preference: 'ar' or 'en'
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'MealSuggestionContext(targetCalories: $targetCalories, targetProtein: $targetProtein, mealType: $mealType, dietaryRestrictions: $dietaryRestrictions, preferEgyptian: $preferEgyptian, remainingCalories: $remainingCalories, remainingProtein: $remainingProtein, mealsConsumedToday: $mealsConsumedToday, timeOfDay: $timeOfDay, preferHighProtein: $preferHighProtein, preferVegetarian: $preferVegetarian, preferLowCarb: $preferLowCarb, isRamadan: $isRamadan, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealSuggestionContextImpl &&
            (identical(other.targetCalories, targetCalories) ||
                other.targetCalories == targetCalories) &&
            (identical(other.targetProtein, targetProtein) ||
                other.targetProtein == targetProtein) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            const DeepCollectionEquality().equals(
              other._dietaryRestrictions,
              _dietaryRestrictions,
            ) &&
            (identical(other.preferEgyptian, preferEgyptian) ||
                other.preferEgyptian == preferEgyptian) &&
            (identical(other.remainingCalories, remainingCalories) ||
                other.remainingCalories == remainingCalories) &&
            (identical(other.remainingProtein, remainingProtein) ||
                other.remainingProtein == remainingProtein) &&
            const DeepCollectionEquality().equals(
              other._mealsConsumedToday,
              _mealsConsumedToday,
            ) &&
            (identical(other.timeOfDay, timeOfDay) ||
                other.timeOfDay == timeOfDay) &&
            (identical(other.preferHighProtein, preferHighProtein) ||
                other.preferHighProtein == preferHighProtein) &&
            (identical(other.preferVegetarian, preferVegetarian) ||
                other.preferVegetarian == preferVegetarian) &&
            (identical(other.preferLowCarb, preferLowCarb) ||
                other.preferLowCarb == preferLowCarb) &&
            (identical(other.isRamadan, isRamadan) ||
                other.isRamadan == isRamadan) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    targetCalories,
    targetProtein,
    mealType,
    const DeepCollectionEquality().hash(_dietaryRestrictions),
    preferEgyptian,
    remainingCalories,
    remainingProtein,
    const DeepCollectionEquality().hash(_mealsConsumedToday),
    timeOfDay,
    preferHighProtein,
    preferVegetarian,
    preferLowCarb,
    isRamadan,
    language,
  );

  /// Create a copy of MealSuggestionContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealSuggestionContextImplCopyWith<_$MealSuggestionContextImpl>
  get copyWith =>
      __$$MealSuggestionContextImplCopyWithImpl<_$MealSuggestionContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MealSuggestionContextImplToJson(this);
  }
}

abstract class _MealSuggestionContext implements MealSuggestionContext {
  const factory _MealSuggestionContext({
    required final int targetCalories,
    required final int targetProtein,
    required final String mealType,
    final List<String> dietaryRestrictions,
    final bool preferEgyptian,
    final int? remainingCalories,
    final int? remainingProtein,
    final List<String> mealsConsumedToday,
    final String? timeOfDay,
    final bool preferHighProtein,
    final bool preferVegetarian,
    final bool preferLowCarb,
    final bool isRamadan,
    final String language,
  }) = _$MealSuggestionContextImpl;

  factory _MealSuggestionContext.fromJson(Map<String, dynamic> json) =
      _$MealSuggestionContextImpl.fromJson;

  /// Target calories for the meal
  @override
  int get targetCalories;

  /// Target protein for the meal
  @override
  int get targetProtein;

  /// Meal type: breakfast, lunch, dinner, snack
  @override
  String get mealType;

  /// User's dietary restrictions
  @override
  List<String> get dietaryRestrictions;

  /// Prefer Egyptian/local cuisine
  @override
  bool get preferEgyptian;

  /// Remaining calories for the day (if any)
  @override
  int? get remainingCalories;

  /// Remaining protein for the day (if any)
  @override
  int? get remainingProtein;

  /// Meals already consumed today
  @override
  List<String> get mealsConsumedToday;

  /// Time of day (for appropriate suggestions)
  @override
  String? get timeOfDay;

  /// User's preference for high protein
  @override
  bool get preferHighProtein;

  /// User's preference for vegetarian
  @override
  bool get preferVegetarian;

  /// User's preference for low carb
  @override
  bool get preferLowCarb;

  /// Current Ramadan mode (affects meal timing)
  @override
  bool get isRamadan;

  /// Language preference: 'ar' or 'en'
  @override
  String get language;

  /// Create a copy of MealSuggestionContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealSuggestionContextImplCopyWith<_$MealSuggestionContextImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DailyMealPlanContext _$DailyMealPlanContextFromJson(Map<String, dynamic> json) {
  return _DailyMealPlanContext.fromJson(json);
}

/// @nodoc
mixin _$DailyMealPlanContext {
  /// Target calories for the day
  int get targetCalories => throw _privateConstructorUsedError;

  /// Target protein for the day
  int get targetProtein => throw _privateConstructorUsedError;

  /// User's dietary restrictions
  List<String> get dietaryRestrictions => throw _privateConstructorUsedError;

  /// Prefer Egyptian/local cuisine
  bool get preferEgyptian => throw _privateConstructorUsedError;

  /// Eating window start time (for intermittent fasting)
  String? get eatingWindowStart => throw _privateConstructorUsedError;

  /// Eating window end time (for intermittent fasting)
  String? get eatingWindowEnd => throw _privateConstructorUsedError;

  /// Number of meals per day
  int get mealsPerDay => throw _privateConstructorUsedError;

  /// Include snacks in the plan
  bool get includeSnacks => throw _privateConstructorUsedError;

  /// User's preference for high protein
  bool get preferHighProtein => throw _privateConstructorUsedError;

  /// User's preference for vegetarian
  bool get preferVegetarian => throw _privateConstructorUsedError;

  /// User's preference for low carb
  bool get preferLowCarb => throw _privateConstructorUsedError;

  /// Recovery score (affects suggestions)
  int? get recoveryScore => throw _privateConstructorUsedError;

  /// Workout planned today
  bool get hasWorkoutToday => throw _privateConstructorUsedError;

  /// Workout type if any
  String? get workoutType => throw _privateConstructorUsedError;

  /// Current Ramadan mode
  bool get isRamadan => throw _privateConstructorUsedError;

  /// Language preference: 'ar' or 'en'
  String get language => throw _privateConstructorUsedError;

  /// Serializes this DailyMealPlanContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyMealPlanContextCopyWith<DailyMealPlanContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyMealPlanContextCopyWith<$Res> {
  factory $DailyMealPlanContextCopyWith(
    DailyMealPlanContext value,
    $Res Function(DailyMealPlanContext) then,
  ) = _$DailyMealPlanContextCopyWithImpl<$Res, DailyMealPlanContext>;
  @useResult
  $Res call({
    int targetCalories,
    int targetProtein,
    List<String> dietaryRestrictions,
    bool preferEgyptian,
    String? eatingWindowStart,
    String? eatingWindowEnd,
    int mealsPerDay,
    bool includeSnacks,
    bool preferHighProtein,
    bool preferVegetarian,
    bool preferLowCarb,
    int? recoveryScore,
    bool hasWorkoutToday,
    String? workoutType,
    bool isRamadan,
    String language,
  });
}

/// @nodoc
class _$DailyMealPlanContextCopyWithImpl<
  $Res,
  $Val extends DailyMealPlanContext
>
    implements $DailyMealPlanContextCopyWith<$Res> {
  _$DailyMealPlanContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetCalories = null,
    Object? targetProtein = null,
    Object? dietaryRestrictions = null,
    Object? preferEgyptian = null,
    Object? eatingWindowStart = freezed,
    Object? eatingWindowEnd = freezed,
    Object? mealsPerDay = null,
    Object? includeSnacks = null,
    Object? preferHighProtein = null,
    Object? preferVegetarian = null,
    Object? preferLowCarb = null,
    Object? recoveryScore = freezed,
    Object? hasWorkoutToday = null,
    Object? workoutType = freezed,
    Object? isRamadan = null,
    Object? language = null,
  }) {
    return _then(
      _value.copyWith(
            targetCalories: null == targetCalories
                ? _value.targetCalories
                : targetCalories // ignore: cast_nullable_to_non_nullable
                      as int,
            targetProtein: null == targetProtein
                ? _value.targetProtein
                : targetProtein // ignore: cast_nullable_to_non_nullable
                      as int,
            dietaryRestrictions: null == dietaryRestrictions
                ? _value.dietaryRestrictions
                : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            preferEgyptian: null == preferEgyptian
                ? _value.preferEgyptian
                : preferEgyptian // ignore: cast_nullable_to_non_nullable
                      as bool,
            eatingWindowStart: freezed == eatingWindowStart
                ? _value.eatingWindowStart
                : eatingWindowStart // ignore: cast_nullable_to_non_nullable
                      as String?,
            eatingWindowEnd: freezed == eatingWindowEnd
                ? _value.eatingWindowEnd
                : eatingWindowEnd // ignore: cast_nullable_to_non_nullable
                      as String?,
            mealsPerDay: null == mealsPerDay
                ? _value.mealsPerDay
                : mealsPerDay // ignore: cast_nullable_to_non_nullable
                      as int,
            includeSnacks: null == includeSnacks
                ? _value.includeSnacks
                : includeSnacks // ignore: cast_nullable_to_non_nullable
                      as bool,
            preferHighProtein: null == preferHighProtein
                ? _value.preferHighProtein
                : preferHighProtein // ignore: cast_nullable_to_non_nullable
                      as bool,
            preferVegetarian: null == preferVegetarian
                ? _value.preferVegetarian
                : preferVegetarian // ignore: cast_nullable_to_non_nullable
                      as bool,
            preferLowCarb: null == preferLowCarb
                ? _value.preferLowCarb
                : preferLowCarb // ignore: cast_nullable_to_non_nullable
                      as bool,
            recoveryScore: freezed == recoveryScore
                ? _value.recoveryScore
                : recoveryScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            hasWorkoutToday: null == hasWorkoutToday
                ? _value.hasWorkoutToday
                : hasWorkoutToday // ignore: cast_nullable_to_non_nullable
                      as bool,
            workoutType: freezed == workoutType
                ? _value.workoutType
                : workoutType // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRamadan: null == isRamadan
                ? _value.isRamadan
                : isRamadan // ignore: cast_nullable_to_non_nullable
                      as bool,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyMealPlanContextImplCopyWith<$Res>
    implements $DailyMealPlanContextCopyWith<$Res> {
  factory _$$DailyMealPlanContextImplCopyWith(
    _$DailyMealPlanContextImpl value,
    $Res Function(_$DailyMealPlanContextImpl) then,
  ) = __$$DailyMealPlanContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int targetCalories,
    int targetProtein,
    List<String> dietaryRestrictions,
    bool preferEgyptian,
    String? eatingWindowStart,
    String? eatingWindowEnd,
    int mealsPerDay,
    bool includeSnacks,
    bool preferHighProtein,
    bool preferVegetarian,
    bool preferLowCarb,
    int? recoveryScore,
    bool hasWorkoutToday,
    String? workoutType,
    bool isRamadan,
    String language,
  });
}

/// @nodoc
class __$$DailyMealPlanContextImplCopyWithImpl<$Res>
    extends _$DailyMealPlanContextCopyWithImpl<$Res, _$DailyMealPlanContextImpl>
    implements _$$DailyMealPlanContextImplCopyWith<$Res> {
  __$$DailyMealPlanContextImplCopyWithImpl(
    _$DailyMealPlanContextImpl _value,
    $Res Function(_$DailyMealPlanContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetCalories = null,
    Object? targetProtein = null,
    Object? dietaryRestrictions = null,
    Object? preferEgyptian = null,
    Object? eatingWindowStart = freezed,
    Object? eatingWindowEnd = freezed,
    Object? mealsPerDay = null,
    Object? includeSnacks = null,
    Object? preferHighProtein = null,
    Object? preferVegetarian = null,
    Object? preferLowCarb = null,
    Object? recoveryScore = freezed,
    Object? hasWorkoutToday = null,
    Object? workoutType = freezed,
    Object? isRamadan = null,
    Object? language = null,
  }) {
    return _then(
      _$DailyMealPlanContextImpl(
        targetCalories: null == targetCalories
            ? _value.targetCalories
            : targetCalories // ignore: cast_nullable_to_non_nullable
                  as int,
        targetProtein: null == targetProtein
            ? _value.targetProtein
            : targetProtein // ignore: cast_nullable_to_non_nullable
                  as int,
        dietaryRestrictions: null == dietaryRestrictions
            ? _value._dietaryRestrictions
            : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        preferEgyptian: null == preferEgyptian
            ? _value.preferEgyptian
            : preferEgyptian // ignore: cast_nullable_to_non_nullable
                  as bool,
        eatingWindowStart: freezed == eatingWindowStart
            ? _value.eatingWindowStart
            : eatingWindowStart // ignore: cast_nullable_to_non_nullable
                  as String?,
        eatingWindowEnd: freezed == eatingWindowEnd
            ? _value.eatingWindowEnd
            : eatingWindowEnd // ignore: cast_nullable_to_non_nullable
                  as String?,
        mealsPerDay: null == mealsPerDay
            ? _value.mealsPerDay
            : mealsPerDay // ignore: cast_nullable_to_non_nullable
                  as int,
        includeSnacks: null == includeSnacks
            ? _value.includeSnacks
            : includeSnacks // ignore: cast_nullable_to_non_nullable
                  as bool,
        preferHighProtein: null == preferHighProtein
            ? _value.preferHighProtein
            : preferHighProtein // ignore: cast_nullable_to_non_nullable
                  as bool,
        preferVegetarian: null == preferVegetarian
            ? _value.preferVegetarian
            : preferVegetarian // ignore: cast_nullable_to_non_nullable
                  as bool,
        preferLowCarb: null == preferLowCarb
            ? _value.preferLowCarb
            : preferLowCarb // ignore: cast_nullable_to_non_nullable
                  as bool,
        recoveryScore: freezed == recoveryScore
            ? _value.recoveryScore
            : recoveryScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        hasWorkoutToday: null == hasWorkoutToday
            ? _value.hasWorkoutToday
            : hasWorkoutToday // ignore: cast_nullable_to_non_nullable
                  as bool,
        workoutType: freezed == workoutType
            ? _value.workoutType
            : workoutType // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRamadan: null == isRamadan
            ? _value.isRamadan
            : isRamadan // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$DailyMealPlanContextImpl implements _DailyMealPlanContext {
  const _$DailyMealPlanContextImpl({
    required this.targetCalories,
    required this.targetProtein,
    final List<String> dietaryRestrictions = const [],
    this.preferEgyptian = true,
    this.eatingWindowStart,
    this.eatingWindowEnd,
    this.mealsPerDay = 3,
    this.includeSnacks = true,
    this.preferHighProtein = false,
    this.preferVegetarian = false,
    this.preferLowCarb = false,
    this.recoveryScore,
    this.hasWorkoutToday = false,
    this.workoutType,
    this.isRamadan = false,
    this.language = 'ar',
  }) : _dietaryRestrictions = dietaryRestrictions;

  factory _$DailyMealPlanContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyMealPlanContextImplFromJson(json);

  /// Target calories for the day
  @override
  final int targetCalories;

  /// Target protein for the day
  @override
  final int targetProtein;

  /// User's dietary restrictions
  final List<String> _dietaryRestrictions;

  /// User's dietary restrictions
  @override
  @JsonKey()
  List<String> get dietaryRestrictions {
    if (_dietaryRestrictions is EqualUnmodifiableListView)
      return _dietaryRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryRestrictions);
  }

  /// Prefer Egyptian/local cuisine
  @override
  @JsonKey()
  final bool preferEgyptian;

  /// Eating window start time (for intermittent fasting)
  @override
  final String? eatingWindowStart;

  /// Eating window end time (for intermittent fasting)
  @override
  final String? eatingWindowEnd;

  /// Number of meals per day
  @override
  @JsonKey()
  final int mealsPerDay;

  /// Include snacks in the plan
  @override
  @JsonKey()
  final bool includeSnacks;

  /// User's preference for high protein
  @override
  @JsonKey()
  final bool preferHighProtein;

  /// User's preference for vegetarian
  @override
  @JsonKey()
  final bool preferVegetarian;

  /// User's preference for low carb
  @override
  @JsonKey()
  final bool preferLowCarb;

  /// Recovery score (affects suggestions)
  @override
  final int? recoveryScore;

  /// Workout planned today
  @override
  @JsonKey()
  final bool hasWorkoutToday;

  /// Workout type if any
  @override
  final String? workoutType;

  /// Current Ramadan mode
  @override
  @JsonKey()
  final bool isRamadan;

  /// Language preference: 'ar' or 'en'
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'DailyMealPlanContext(targetCalories: $targetCalories, targetProtein: $targetProtein, dietaryRestrictions: $dietaryRestrictions, preferEgyptian: $preferEgyptian, eatingWindowStart: $eatingWindowStart, eatingWindowEnd: $eatingWindowEnd, mealsPerDay: $mealsPerDay, includeSnacks: $includeSnacks, preferHighProtein: $preferHighProtein, preferVegetarian: $preferVegetarian, preferLowCarb: $preferLowCarb, recoveryScore: $recoveryScore, hasWorkoutToday: $hasWorkoutToday, workoutType: $workoutType, isRamadan: $isRamadan, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyMealPlanContextImpl &&
            (identical(other.targetCalories, targetCalories) ||
                other.targetCalories == targetCalories) &&
            (identical(other.targetProtein, targetProtein) ||
                other.targetProtein == targetProtein) &&
            const DeepCollectionEquality().equals(
              other._dietaryRestrictions,
              _dietaryRestrictions,
            ) &&
            (identical(other.preferEgyptian, preferEgyptian) ||
                other.preferEgyptian == preferEgyptian) &&
            (identical(other.eatingWindowStart, eatingWindowStart) ||
                other.eatingWindowStart == eatingWindowStart) &&
            (identical(other.eatingWindowEnd, eatingWindowEnd) ||
                other.eatingWindowEnd == eatingWindowEnd) &&
            (identical(other.mealsPerDay, mealsPerDay) ||
                other.mealsPerDay == mealsPerDay) &&
            (identical(other.includeSnacks, includeSnacks) ||
                other.includeSnacks == includeSnacks) &&
            (identical(other.preferHighProtein, preferHighProtein) ||
                other.preferHighProtein == preferHighProtein) &&
            (identical(other.preferVegetarian, preferVegetarian) ||
                other.preferVegetarian == preferVegetarian) &&
            (identical(other.preferLowCarb, preferLowCarb) ||
                other.preferLowCarb == preferLowCarb) &&
            (identical(other.recoveryScore, recoveryScore) ||
                other.recoveryScore == recoveryScore) &&
            (identical(other.hasWorkoutToday, hasWorkoutToday) ||
                other.hasWorkoutToday == hasWorkoutToday) &&
            (identical(other.workoutType, workoutType) ||
                other.workoutType == workoutType) &&
            (identical(other.isRamadan, isRamadan) ||
                other.isRamadan == isRamadan) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    targetCalories,
    targetProtein,
    const DeepCollectionEquality().hash(_dietaryRestrictions),
    preferEgyptian,
    eatingWindowStart,
    eatingWindowEnd,
    mealsPerDay,
    includeSnacks,
    preferHighProtein,
    preferVegetarian,
    preferLowCarb,
    recoveryScore,
    hasWorkoutToday,
    workoutType,
    isRamadan,
    language,
  );

  /// Create a copy of DailyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMealPlanContextImplCopyWith<_$DailyMealPlanContextImpl>
  get copyWith =>
      __$$DailyMealPlanContextImplCopyWithImpl<_$DailyMealPlanContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyMealPlanContextImplToJson(this);
  }
}

abstract class _DailyMealPlanContext implements DailyMealPlanContext {
  const factory _DailyMealPlanContext({
    required final int targetCalories,
    required final int targetProtein,
    final List<String> dietaryRestrictions,
    final bool preferEgyptian,
    final String? eatingWindowStart,
    final String? eatingWindowEnd,
    final int mealsPerDay,
    final bool includeSnacks,
    final bool preferHighProtein,
    final bool preferVegetarian,
    final bool preferLowCarb,
    final int? recoveryScore,
    final bool hasWorkoutToday,
    final String? workoutType,
    final bool isRamadan,
    final String language,
  }) = _$DailyMealPlanContextImpl;

  factory _DailyMealPlanContext.fromJson(Map<String, dynamic> json) =
      _$DailyMealPlanContextImpl.fromJson;

  /// Target calories for the day
  @override
  int get targetCalories;

  /// Target protein for the day
  @override
  int get targetProtein;

  /// User's dietary restrictions
  @override
  List<String> get dietaryRestrictions;

  /// Prefer Egyptian/local cuisine
  @override
  bool get preferEgyptian;

  /// Eating window start time (for intermittent fasting)
  @override
  String? get eatingWindowStart;

  /// Eating window end time (for intermittent fasting)
  @override
  String? get eatingWindowEnd;

  /// Number of meals per day
  @override
  int get mealsPerDay;

  /// Include snacks in the plan
  @override
  bool get includeSnacks;

  /// User's preference for high protein
  @override
  bool get preferHighProtein;

  /// User's preference for vegetarian
  @override
  bool get preferVegetarian;

  /// User's preference for low carb
  @override
  bool get preferLowCarb;

  /// Recovery score (affects suggestions)
  @override
  int? get recoveryScore;

  /// Workout planned today
  @override
  bool get hasWorkoutToday;

  /// Workout type if any
  @override
  String? get workoutType;

  /// Current Ramadan mode
  @override
  bool get isRamadan;

  /// Language preference: 'ar' or 'en'
  @override
  String get language;

  /// Create a copy of DailyMealPlanContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyMealPlanContextImplCopyWith<_$DailyMealPlanContextImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UserGoals _$UserGoalsFromJson(Map<String, dynamic> json) {
  return _UserGoals.fromJson(json);
}

/// @nodoc
mixin _$UserGoals {
  /// Daily calorie target
  int get dailyCalories => throw _privateConstructorUsedError;

  /// Daily protein target in grams
  int get dailyProtein => throw _privateConstructorUsedError;

  /// Target weight in kg (optional)
  double? get targetWeight => throw _privateConstructorUsedError;

  /// Goal type: lose, maintain, gain
  String get goalType => throw _privateConstructorUsedError;

  /// Dietary restrictions
  List<String> get dietaryRestrictions => throw _privateConstructorUsedError;

  /// Food allergies
  List<String> get allergies => throw _privateConstructorUsedError;

  /// Preferred cuisine types
  List<String> get preferredCuisines => throw _privateConstructorUsedError;

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
    int dailyCalories,
    int dailyProtein,
    double? targetWeight,
    String goalType,
    List<String> dietaryRestrictions,
    List<String> allergies,
    List<String> preferredCuisines,
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
    Object? dailyCalories = null,
    Object? dailyProtein = null,
    Object? targetWeight = freezed,
    Object? goalType = null,
    Object? dietaryRestrictions = null,
    Object? allergies = null,
    Object? preferredCuisines = null,
  }) {
    return _then(
      _value.copyWith(
            dailyCalories: null == dailyCalories
                ? _value.dailyCalories
                : dailyCalories // ignore: cast_nullable_to_non_nullable
                      as int,
            dailyProtein: null == dailyProtein
                ? _value.dailyProtein
                : dailyProtein // ignore: cast_nullable_to_non_nullable
                      as int,
            targetWeight: freezed == targetWeight
                ? _value.targetWeight
                : targetWeight // ignore: cast_nullable_to_non_nullable
                      as double?,
            goalType: null == goalType
                ? _value.goalType
                : goalType // ignore: cast_nullable_to_non_nullable
                      as String,
            dietaryRestrictions: null == dietaryRestrictions
                ? _value.dietaryRestrictions
                : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            allergies: null == allergies
                ? _value.allergies
                : allergies // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            preferredCuisines: null == preferredCuisines
                ? _value.preferredCuisines
                : preferredCuisines // ignore: cast_nullable_to_non_nullable
                      as List<String>,
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
    int dailyCalories,
    int dailyProtein,
    double? targetWeight,
    String goalType,
    List<String> dietaryRestrictions,
    List<String> allergies,
    List<String> preferredCuisines,
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
    Object? dailyCalories = null,
    Object? dailyProtein = null,
    Object? targetWeight = freezed,
    Object? goalType = null,
    Object? dietaryRestrictions = null,
    Object? allergies = null,
    Object? preferredCuisines = null,
  }) {
    return _then(
      _$UserGoalsImpl(
        dailyCalories: null == dailyCalories
            ? _value.dailyCalories
            : dailyCalories // ignore: cast_nullable_to_non_nullable
                  as int,
        dailyProtein: null == dailyProtein
            ? _value.dailyProtein
            : dailyProtein // ignore: cast_nullable_to_non_nullable
                  as int,
        targetWeight: freezed == targetWeight
            ? _value.targetWeight
            : targetWeight // ignore: cast_nullable_to_non_nullable
                  as double?,
        goalType: null == goalType
            ? _value.goalType
            : goalType // ignore: cast_nullable_to_non_nullable
                  as String,
        dietaryRestrictions: null == dietaryRestrictions
            ? _value._dietaryRestrictions
            : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        allergies: null == allergies
            ? _value._allergies
            : allergies // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        preferredCuisines: null == preferredCuisines
            ? _value._preferredCuisines
            : preferredCuisines // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserGoalsImpl implements _UserGoals {
  const _$UserGoalsImpl({
    required this.dailyCalories,
    required this.dailyProtein,
    this.targetWeight,
    this.goalType = 'maintain',
    final List<String> dietaryRestrictions = const [],
    final List<String> allergies = const [],
    final List<String> preferredCuisines = const ['egyptian'],
  }) : _dietaryRestrictions = dietaryRestrictions,
       _allergies = allergies,
       _preferredCuisines = preferredCuisines;

  factory _$UserGoalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGoalsImplFromJson(json);

  /// Daily calorie target
  @override
  final int dailyCalories;

  /// Daily protein target in grams
  @override
  final int dailyProtein;

  /// Target weight in kg (optional)
  @override
  final double? targetWeight;

  /// Goal type: lose, maintain, gain
  @override
  @JsonKey()
  final String goalType;

  /// Dietary restrictions
  final List<String> _dietaryRestrictions;

  /// Dietary restrictions
  @override
  @JsonKey()
  List<String> get dietaryRestrictions {
    if (_dietaryRestrictions is EqualUnmodifiableListView)
      return _dietaryRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryRestrictions);
  }

  /// Food allergies
  final List<String> _allergies;

  /// Food allergies
  @override
  @JsonKey()
  List<String> get allergies {
    if (_allergies is EqualUnmodifiableListView) return _allergies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergies);
  }

  /// Preferred cuisine types
  final List<String> _preferredCuisines;

  /// Preferred cuisine types
  @override
  @JsonKey()
  List<String> get preferredCuisines {
    if (_preferredCuisines is EqualUnmodifiableListView)
      return _preferredCuisines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredCuisines);
  }

  @override
  String toString() {
    return 'UserGoals(dailyCalories: $dailyCalories, dailyProtein: $dailyProtein, targetWeight: $targetWeight, goalType: $goalType, dietaryRestrictions: $dietaryRestrictions, allergies: $allergies, preferredCuisines: $preferredCuisines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGoalsImpl &&
            (identical(other.dailyCalories, dailyCalories) ||
                other.dailyCalories == dailyCalories) &&
            (identical(other.dailyProtein, dailyProtein) ||
                other.dailyProtein == dailyProtein) &&
            (identical(other.targetWeight, targetWeight) ||
                other.targetWeight == targetWeight) &&
            (identical(other.goalType, goalType) ||
                other.goalType == goalType) &&
            const DeepCollectionEquality().equals(
              other._dietaryRestrictions,
              _dietaryRestrictions,
            ) &&
            const DeepCollectionEquality().equals(
              other._allergies,
              _allergies,
            ) &&
            const DeepCollectionEquality().equals(
              other._preferredCuisines,
              _preferredCuisines,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dailyCalories,
    dailyProtein,
    targetWeight,
    goalType,
    const DeepCollectionEquality().hash(_dietaryRestrictions),
    const DeepCollectionEquality().hash(_allergies),
    const DeepCollectionEquality().hash(_preferredCuisines),
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
    required final int dailyCalories,
    required final int dailyProtein,
    final double? targetWeight,
    final String goalType,
    final List<String> dietaryRestrictions,
    final List<String> allergies,
    final List<String> preferredCuisines,
  }) = _$UserGoalsImpl;

  factory _UserGoals.fromJson(Map<String, dynamic> json) =
      _$UserGoalsImpl.fromJson;

  /// Daily calorie target
  @override
  int get dailyCalories;

  /// Daily protein target in grams
  @override
  int get dailyProtein;

  /// Target weight in kg (optional)
  @override
  double? get targetWeight;

  /// Goal type: lose, maintain, gain
  @override
  String get goalType;

  /// Dietary restrictions
  @override
  List<String> get dietaryRestrictions;

  /// Food allergies
  @override
  List<String> get allergies;

  /// Preferred cuisine types
  @override
  List<String> get preferredCuisines;

  /// Create a copy of UserGoals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserGoalsImplCopyWith<_$UserGoalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
