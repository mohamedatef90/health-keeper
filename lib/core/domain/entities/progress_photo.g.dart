// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressPhotoImpl _$$ProgressPhotoImplFromJson(Map<String, dynamic> json) =>
    _$ProgressPhotoImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      photoUri: json['photoUri'] as String,
      bodyPart: $enumDecode(_$BodyPartEnumMap, json['bodyPart']),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ProgressPhotoImplToJson(_$ProgressPhotoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'photoUri': instance.photoUri,
      'bodyPart': _$BodyPartEnumMap[instance.bodyPart]!,
      'notes': instance.notes,
    };

const _$BodyPartEnumMap = {
  BodyPart.front: 'front',
  BodyPart.side: 'side',
  BodyPart.back: 'back',
};

_$AiFoodAnalysisImpl _$$AiFoodAnalysisImplFromJson(Map<String, dynamic> json) =>
    _$AiFoodAnalysisImpl(
      id: json['id'] as String,
      mealLogId: json['mealLogId'] as String,
      photoUri: json['photoUri'] as String,
      rawResponse: json['rawResponse'] as String,
      parsedItems:
          (json['parsedItems'] as List<dynamic>?)
              ?.map((e) => ParsedFoodItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      confidence: (json['confidence'] as num).toInt(),
      processingTime: (json['processingTime'] as num).toInt(),
      model: json['model'] as String? ?? 'gemini-2.5',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AiFoodAnalysisImplToJson(
  _$AiFoodAnalysisImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'mealLogId': instance.mealLogId,
  'photoUri': instance.photoUri,
  'rawResponse': instance.rawResponse,
  'parsedItems': instance.parsedItems,
  'confidence': instance.confidence,
  'processingTime': instance.processingTime,
  'model': instance.model,
  'createdAt': instance.createdAt.toIso8601String(),
};

_$ParsedFoodItemImpl _$$ParsedFoodItemImplFromJson(Map<String, dynamic> json) =>
    _$ParsedFoodItemImpl(
      name: json['name'] as String,
      portion: json['portion'] as String,
      calories: (json['calories'] as num).toInt(),
      protein: (json['protein'] as num).toInt(),
      carbs: (json['carbs'] as num).toInt(),
      fat: (json['fat'] as num).toInt(),
      confidence: (json['confidence'] as num).toInt(),
    );

Map<String, dynamic> _$$ParsedFoodItemImplToJson(
  _$ParsedFoodItemImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'portion': instance.portion,
  'calories': instance.calories,
  'protein': instance.protein,
  'carbs': instance.carbs,
  'fat': instance.fat,
  'confidence': instance.confidence,
};

_$PhotoComparisonImpl _$$PhotoComparisonImplFromJson(
  Map<String, dynamic> json,
) => _$PhotoComparisonImpl(
  id: json['id'] as String,
  beforePhotoId: json['beforePhotoId'] as String,
  afterPhotoId: json['afterPhotoId'] as String,
  insights: json['insights'] as String,
  detectedChanges:
      (json['detectedChanges'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  isAiGenerated: json['isAiGenerated'] as bool? ?? true,
);

Map<String, dynamic> _$$PhotoComparisonImplToJson(
  _$PhotoComparisonImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'beforePhotoId': instance.beforePhotoId,
  'afterPhotoId': instance.afterPhotoId,
  'insights': instance.insights,
  'detectedChanges': instance.detectedChanges,
  'generatedAt': instance.generatedAt.toIso8601String(),
  'isAiGenerated': instance.isAiGenerated,
};
