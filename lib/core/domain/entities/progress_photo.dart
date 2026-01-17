import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_photo.freezed.dart';
part 'progress_photo.g.dart';

@freezed
class ProgressPhoto with _$ProgressPhoto {
  const factory ProgressPhoto({
    required String id,
    required String userId,
    required DateTime date,
    required String photoUri,
    required BodyPart bodyPart,
    String? notes,
  }) = _ProgressPhoto;

  factory ProgressPhoto.fromJson(Map<String, dynamic> json) =>
      _$ProgressPhotoFromJson(json);
}

@freezed
class AiFoodAnalysis with _$AiFoodAnalysis {
  const factory AiFoodAnalysis({
    required String id,
    required String mealLogId,
    required String photoUri,
    required String rawResponse,
    @Default([]) List<ParsedFoodItem> parsedItems,
    required int confidence, // 0-100
    required int processingTime, // in milliseconds
    @Default('gemini-2.5') String model,
    required DateTime createdAt,
  }) = _AiFoodAnalysis;

  factory AiFoodAnalysis.fromJson(Map<String, dynamic> json) =>
      _$AiFoodAnalysisFromJson(json);
}

@freezed
class ParsedFoodItem with _$ParsedFoodItem {
  const factory ParsedFoodItem({
    required String name,
    required String portion,
    required int calories,
    required int protein,
    required int carbs,
    required int fat,
    required int confidence,
  }) = _ParsedFoodItem;

  factory ParsedFoodItem.fromJson(Map<String, dynamic> json) =>
      _$ParsedFoodItemFromJson(json);
}

@freezed
class PhotoComparison with _$PhotoComparison {
  const factory PhotoComparison({
    required String id,
    required String beforePhotoId,
    required String afterPhotoId,
    required String insights,
    @Default([]) List<String> detectedChanges,
    required DateTime generatedAt,
    @Default(true) bool isAiGenerated,
  }) = _PhotoComparison;

  factory PhotoComparison.fromJson(Map<String, dynamic> json) =>
      _$PhotoComparisonFromJson(json);
}

@JsonEnum()
enum BodyPart {
  @JsonValue('front')
  front,
  @JsonValue('side')
  side,
  @JsonValue('back')
  back,
}
