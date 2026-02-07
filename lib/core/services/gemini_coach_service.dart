import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:talker/talker.dart';

import '../domain/entities/entities.dart';
import 'gemini_prompts.dart';

/// AI-powered coaching service using Google Gemini 2.5 API
abstract class GeminiCoachService {
  /// Whether the service is initialized with a valid API key
  bool get isInitialized;

  /// Generate daily brief with recovery score and coaching text
  Future<DailyBriefResult> generateDailyBrief(DailyBriefContext context);

  /// Analyze food photo and return identified items with nutrition estimates
  Future<FoodAnalysisResult> analyzeFoodPhoto(Uint8List imageBytes);

  /// Get training recommendation based on recovery and protocol
  Future<TrainingRecommendation> getTrainingRecommendation(
    RecoveryContext recoveryContext,
  );

  /// Analyze weight/measurement history for plateau detection
  Future<PlateauAnalysis> analyzePlateau(List<DailyLog> history);

  /// Generate weekly report with insights
  Future<WeeklyReportResult> generateWeeklyReport(WeeklyReportContext context);

  /// Generate rescue day plan for recovery
  Future<RescueDayPlan> generateRescuePlan(RescueDayContext context);

  /// Compare progress photos and provide insights
  Future<PhotoComparisonResult> comparePhotos(
    Uint8List beforeImage,
    Uint8List afterImage,
  );

  // ============ NEW HEALTH PREDICTION METHODS ============

  /// Predict illness risk based on biometric patterns and symptoms
  ///
  /// Analyzes HRV drops, respiratory rate changes, sleep disruption,
  /// and user-reported symptoms to assess illness probability.
  ///
  /// Returns [IllnessRisk] with probability, contributing factors,
  /// and preventive recommendations.
  Future<IllnessRisk> predictIllness(HealthContext context);

  /// Analyze what behaviors help or hurt recovery for this specific user
  ///
  /// Correlates journal behaviors with recovery scores to identify
  /// personalized patterns. Requires at least 14 days of data.
  ///
  /// Returns [RecoveryFactorsAnalysis] with top helpful/harmful behaviors.
  Future<RecoveryFactorsAnalysis> analyzeRecoveryFactors(JournalHistory history);

  /// Get proactive health insights without user prompting
  ///
  /// Scans current health context for emerging trends, pattern anomalies,
  /// milestone achievements, and optimization opportunities.
  ///
  /// Returns list of [ProactiveInsight] prioritized by urgency.
  Future<List<ProactiveInsight>> getProactiveInsights(HealthContext context);

  /// Answer health-related questions using user's context
  ///
  /// Provides conversational health Q&A with context-aware responses,
  /// appropriate disclaimers, and professional consultation suggestions.
  ///
  /// IMPORTANT: Never diagnoses conditions or prescribes treatments.
  Future<HealthQAResponse> answerHealthQuestion(
    String question,
    HealthContext context,
  );

  /// Assess overtraining risk based on strain/recovery balance
  ///
  /// Analyzes recent strain scores vs recovery scores, HRV/RHR trends,
  /// and training patterns to identify overtraining risk.
  Future<OvertrainingRisk> assessOvertrainingRisk(
    StrainRecoveryHistory history,
  );

  /// Assess sleep debt and its impact on health
  ///
  /// Calculates accumulated sleep debt, health impacts,
  /// and recovery timeline.
  Future<SleepDebtAssessment> assessSleepDebt(
    List<double> sleepHoursLast14Days,
    double targetSleepHours,
    List<int>? sleepQualityLast14Days,
  );

  /// Detect patterns in 30-day health data
  ///
  /// Identifies weekly cycles, correlations, trends, and
  /// optimization opportunities from comprehensive health data.
  Future<PatternAnalysisResult> detectPatterns(
    List<Map<String, dynamic>> dailyData,
    List<String> allBehaviors,
    Map<String, dynamic> userProfile,
  );

  /// Get personalized daily coaching based on current state
  Future<DailyCoachingResult> getDailyCoaching(DailyCoachingContext context);

  // ============ NEW DIET AND ACTIVITY METHODS ============

  /// Suggest Egyptian meals based on nutritional targets
  ///
  /// Uses AI to suggest meals from Egyptian cuisine that fit
  /// the user's calorie and protein goals.
  Future<AiMealSuggestionResult> suggestEgyptianMeals({
    required int targetCalories,
    required int targetProtein,
    required String mealType,
    List<String> dietaryRestrictions,
    bool preferEgyptian,
    String language,
  });

  /// Get AI-enhanced activity recommendation
  ///
  /// Provides detailed activity suggestions based on recovery,
  /// strain, and Egyptian context (weather, Ramadan, etc.)
  Future<AiActivityRecommendationResult> getActivityRecommendation({
    required double recoveryScore,
    double? strainScore,
    required List<Map<String, dynamic>> recentWorkouts,
    required List<String> constraints,
    required List<String> weeklyPlan,
    required bool isRamadan,
    String language,
  });

  /// Classify a detected workout using AI
  ///
  /// Analyzes heart rate patterns, duration, and other data
  /// to determine the most likely workout type.
  Future<WorkoutClassification> classifyWorkout({
    required double averageHeartRate,
    required double maxHeartRate,
    required int durationMinutes,
    required List<Map<String, dynamic>> heartRatePattern,
    int? steps,
    Map<String, dynamic>? zones,
  });

  /// Generate a complete daily meal plan
  ///
  /// Creates a full day's meal plan optimized for Egyptian cuisine
  /// and the user's health goals.
  Future<AiDailyMealPlanResult> generateDailyMealPlan({
    required int targetCalories,
    required int targetProtein,
    List<String> dietaryRestrictions,
    String? eatingWindowStart,
    String? eatingWindowEnd,
    bool preferHighProtein,
    bool preferVegetarian,
    bool preferLowCarb,
    int? recoveryScore,
    bool hasWorkoutToday,
    bool isRamadan,
    String language,
  });

  /// Generate a complete 7-day weekly meal plan
  ///
  /// Creates a full week's meal plan optimized for Egyptian cuisine,
  /// coordinated with workout schedule, and adjusted for health data.
  Future<AiWeeklyMealPlanResult> generateWeeklyMealPlan({
    required int dailyCalorieTarget,
    required int dailyProteinTarget,
    List<String> dietaryRestrictions,
    String? eatingWindowStart,
    String? eatingWindowEnd,
    List<int> workoutDays,
    List<int> strengthDays,
    int? recoveryScore,
    double? strainScore,
    bool preferHighProtein,
    bool preferVegetarian,
    bool preferLowCarb,
    int workoutDayCalorieBonus,
    int strengthDayProteinBonus,
    String language,
  });

  /// Get diet-aware workout recommendation
  ///
  /// Analyzes today's nutrition intake along with recovery and strain data
  /// to recommend the optimal workout. Considers:
  /// - Calorie and protein consumption vs. targets
  /// - Recovery score from HealthKit/Whoop
  /// - Current strain and workout history
  /// - User constraints (injuries, no gym, etc.)
  Future<DietAwareWorkoutResult> getDietAwareWorkoutRecommendation({
    required int caloriesConsumed,
    required int proteinConsumed,
    required int targetCalories,
    required int targetProtein,
    int? recoveryScore,
    double? strainScore,
    double? sleepHours,
    int? hrv,
    int? restingHR,
    int workoutsThisWeek,
    List<String> constraints,
    String language,
  });

  /// Get health-only workout recommendation (no nutrition data)
  ///
  /// Used when user hasn't logged meals today. Analyzes recovery and health
  /// data from HealthKit/Whoop to recommend optimal workout. Considers:
  /// - Recovery score (0-100)
  /// - Strain score (0-21)
  /// - Sleep hours and quality
  /// - HRV and resting heart rate trends
  /// - Recent workout history
  Future<DietAwareWorkoutResult> getHealthOnlyWorkoutRecommendation({
    int? recoveryScore,
    double? strainScore,
    double? sleepHours,
    int? sleepQuality,
    int? hrv,
    int? restingHR,
    int workoutsThisWeek,
    List<String> constraints,
    String language,
  });

  /// Generate a complete 7-day weekly workout plan with exercises
  ///
  /// Creates a full week's workout plan with specific exercises,
  /// sets, reps, and timing. Considers:
  /// - User's fitness goals (strength, hypertrophy, etc.)
  /// - Available equipment
  /// - Recovery status
  /// - Constraints (injuries, time limits)
  /// - Meal plan coordination (if available)
  Future<AiWeeklyWorkoutPlanResult> generateWeeklyWorkoutPlan({
    required int targetWorkoutDays,
    List<String> fitnessGoals,
    List<String> availableEquipment,
    int? recoveryScore,
    double? strainScore,
    List<String> constraints,
    List<String> preferredWorkoutTypes,
    int? mealPlanCalories,
    String language,
  });

  // ============ GENERIC AI CONTENT GENERATION ============

  /// Generate raw content from a prompt
  ///
  /// Low-level method for custom prompt handling.
  /// Returns raw text response from Gemini.
  /// Used by AI Brain for chat and decision generation.
  Future<String?> generateContent(String prompt);
}

/// Gemini 2.5 implementation of GeminiCoachService
class GeminiCoachServiceImpl implements GeminiCoachService {
  final Talker _talker;
  late final GenerativeModel _model;
  late final GenerativeModel _visionModel;

  late final String _apiKey;
  bool _isInitialized = false;

  /// Whether the service is initialized with a valid API key
  @override
  bool get isInitialized => _isInitialized;

  GeminiCoachServiceImpl({required Talker talker}) : _talker = talker {
    _apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
    if (_apiKey.isEmpty) {
      _talker.error('GEMINI_API_KEY not found in environment. Make sure .env file is in assets and contains GEMINI_API_KEY.');
      _isInitialized = false;
    } else {
      _isInitialized = true;
    }

    _model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: _apiKey,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 1024,
      ),
    );

    _visionModel = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: _apiKey,
      generationConfig: GenerationConfig(
        temperature: 0.3,
        topK: 32,
        topP: 0.8,
        maxOutputTokens: 2048,
      ),
    );
  }

  @override
  Future<DailyBriefResult> generateDailyBrief(DailyBriefContext context) async {
    try {
      final prompt = _buildDailyBriefPrompt(context);
      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseDailyBriefResponse(text);
    } catch (e, st) {
      _talker.error('Failed to generate daily brief', e, st);
      return DailyBriefResult.fallback();
    }
  }

  @override
  Future<FoodAnalysisResult> analyzeFoodPhoto(Uint8List imageBytes) async {
    try {
      final prompt = _buildFoodAnalysisPrompt();
      final response = await _visionModel.generateContent([
        Content.multi([
          TextPart(prompt),
          DataPart('image/jpeg', imageBytes),
        ]),
      ]);
      final text = response.text ?? '';

      return _parseFoodAnalysisResponse(text);
    } catch (e, st) {
      _talker.error('Failed to analyze food photo', e, st);
      return FoodAnalysisResult.error('Failed to analyze image');
    }
  }

  @override
  Future<TrainingRecommendation> getTrainingRecommendation(
    RecoveryContext recoveryContext,
  ) async {
    try {
      final prompt = _buildTrainingPrompt(recoveryContext);
      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseTrainingResponse(text);
    } catch (e, st) {
      _talker.error('Failed to get training recommendation', e, st);
      return TrainingRecommendation.fallback();
    }
  }

  @override
  Future<PlateauAnalysis> analyzePlateau(List<DailyLog> history) async {
    try {
      final prompt = _buildPlateauPrompt(history);
      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parsePlateauResponse(text);
    } catch (e, st) {
      _talker.error('Failed to analyze plateau', e, st);
      return PlateauAnalysis.none();
    }
  }

  @override
  Future<WeeklyReportResult> generateWeeklyReport(
    WeeklyReportContext context,
  ) async {
    try {
      final prompt = _buildWeeklyReportPrompt(context);
      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseWeeklyReportResponse(text);
    } catch (e, st) {
      _talker.error('Failed to generate weekly report', e, st);
      return WeeklyReportResult.fallback();
    }
  }

  @override
  Future<RescueDayPlan> generateRescuePlan(RescueDayContext context) async {
    try {
      final prompt = _buildRescuePlanPrompt(context);
      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseRescuePlanResponse(text);
    } catch (e, st) {
      _talker.error('Failed to generate rescue plan', e, st);
      return RescueDayPlan.fallback();
    }
  }

  @override
  Future<PhotoComparisonResult> comparePhotos(
    Uint8List beforeImage,
    Uint8List afterImage,
  ) async {
    try {
      final prompt = _buildPhotoComparisonPrompt();
      final response = await _visionModel.generateContent([
        Content.multi([
          TextPart(prompt),
          TextPart('Before photo:'),
          DataPart('image/jpeg', beforeImage),
          TextPart('After photo:'),
          DataPart('image/jpeg', afterImage),
        ]),
      ]);
      final text = response.text ?? '';

      return _parsePhotoComparisonResponse(text);
    } catch (e, st) {
      _talker.error('Failed to compare photos', e, st);
      return PhotoComparisonResult.error('Failed to compare photos');
    }
  }

  // Prompt Builders
  String _buildDailyBriefPrompt(DailyBriefContext context) {
    return '''
You are a supportive health coach. Generate a daily brief based on the user's data.
Be encouraging but honest. Use ${context.language == AppLanguage.arabic ? 'Arabic' : 'English'}.

User Context:
- Sleep: ${context.sleepHours ?? 'Unknown'} hours
- HRV: ${context.hrv ?? 'Unknown'} ms
- Resting HR: ${context.restingHR ?? 'Unknown'} bpm
- Steps yesterday: ${context.stepsYesterday ?? 'Unknown'}
- Recent weight trend: ${context.weightTrend ?? 'Stable'}
- Protocol: Eating window ${context.eatingWindowStart}-${context.eatingWindowEnd}

Respond in JSON format:
{
  "recoveryScore": <0-100>,
  "readinessScore": <0-100>,
  "suggestedIntensity": <1-5>,
  "topActions": ["action1", "action2", "action3"],
  "warnings": ["warning1"] or [],
  "coachingText": "Your personalized coaching message"
}

Important:
- Recovery score is based on sleep quality, HRV, and resting HR
- Readiness score factors in recovery plus recent activity load
- Suggested intensity: 1=rest, 2=light, 3=moderate, 4=hard, 5=very hard
- Keep coaching text under 100 words
- Be supportive, not preachy
''';
  }

  String _buildFoodAnalysisPrompt() {
    return '''
You are a nutrition analyst. Analyze this food image and identify all food items.
Provide calorie and macro estimates for each item.

Respond in JSON format:
{
  "items": [
    {
      "name": "Food name",
      "portion": "Estimated portion (e.g., '1 cup', '150g')",
      "calories": <number>,
      "protein": <grams>,
      "carbs": <grams>,
      "fat": <grams>,
      "confidence": <0-100>
    }
  ],
  "totalCalories": <number>,
  "totalProtein": <number>,
  "totalCarbs": <number>,
  "totalFat": <number>,
  "overallConfidence": <0-100>,
  "notes": "Any relevant notes about the meal"
}

Important:
- Be conservative with estimates
- Include confidence scores
- If uncertain about a food, note it
- This is an estimate, not medical advice
''';
  }

  String _buildTrainingPrompt(RecoveryContext context) {
    return '''
You are a fitness coach. Recommend today's training based on recovery data.

User Context:
- Recovery score: ${context.recoveryScore}
- Recent workouts: ${context.recentWorkouts.map((w) => '${w.type} (${w.duration}min)').join(', ')}
- Injury constraints: ${context.constraints.join(', ')}
- Weekly plan: ${context.weeklyPlan}

Respond in JSON format:
{
  "recommendedType": "workout type",
  "recommendedIntensity": <1-10>,
  "recommendedDuration": <minutes>,
  "reasoning": "Why this recommendation",
  "alternatives": ["alternative1", "alternative2"]
}
''';
  }

  String _buildPlateauPrompt(List<DailyLog> history) {
    final weights = history.where((l) => l.weight != null).map((l) => l.weight).toList();
    return '''
Analyze this weight history for plateau detection.

Weight data (last ${weights.length} entries): $weights

Respond in JSON format:
{
  "plateauDetected": true/false,
  "daysSincePlateau": <number or null>,
  "potentialCauses": ["cause1", "cause2"],
  "suggestions": ["suggestion1", "suggestion2"],
  "analysis": "Brief analysis"
}
''';
  }

  String _buildWeeklyReportPrompt(WeeklyReportContext context) {
    return '''
Generate a weekly health report summary.

Week Data:
- Days logged: ${context.daysLogged}
- Average calories: ${context.avgCalories}
- Average protein: ${context.avgProtein}g
- Average sleep: ${context.avgSleep} hours
- Workouts completed: ${context.workoutsCompleted}
- Weight change: ${context.weightChange}kg
- Protocol adherence: ${context.protocolAdherence}%

Respond in JSON format:
{
  "summary": "Week summary in 2-3 sentences",
  "highlights": ["highlight1", "highlight2"],
  "concerns": ["concern1"] or [],
  "progressAnalysis": "Progress analysis",
  "nextWeekFocus": "Focus area for next week"
}

Use ${context.language == AppLanguage.arabic ? 'Arabic' : 'English'}.
Be supportive and constructive.
''';
  }

  String _buildRescuePlanPrompt(RescueDayContext context) {
    return '''
The user is having a difficult day and needs a rescue plan.

Current State:
- Mood/Energy: ${context.moodEnergy}/5
- Stress: ${context.stress}/5
- Recovery score: ${context.recoveryScore}
- Reason: ${context.reason ?? 'General fatigue'}

Generate a supportive rescue day plan.

Respond in JSON format:
{
  "nutritionPlan": "Flexible nutrition guidance",
  "activitySuggestion": "Light activity or rest recommendation",
  "sleepTip": "Sleep optimization tip",
  "mindsetMessage": "Supportive message",
  "tomorrowNote": "Encouragement for tomorrow"
}

Be compassionate and non-judgmental.
''';
  }

  String _buildPhotoComparisonPrompt() {
    return '''
Compare these two progress photos and provide insights.
Focus on visible changes in body composition.

Respond in JSON format:
{
  "insights": "Overall comparison insights",
  "detectedChanges": ["change1", "change2"],
  "encouragement": "Positive message about progress",
  "disclaimer": "This is AI analysis, not professional assessment"
}

Be supportive and focus on positive changes.
Avoid body-shaming language.
''';
  }

  // Response Parsers
  DailyBriefResult _parseDailyBriefResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return DailyBriefResult.fallback();

    try {
      return DailyBriefResult(
        recoveryScore: (data['recoveryScore'] ?? 50) as int,
        readinessScore: (data['readinessScore'] ?? 50) as int,
        suggestedIntensity: (data['suggestedIntensity'] ?? 3) as int,
        topActions: List<String>.from(data['topActions'] ?? []),
        warnings: List<String>.from(data['warnings'] ?? []),
        coachingText: data['coachingText'] ?? '',
        isAiGenerated: true,
      );
    } catch (e) {
      _talker.warning('Failed to parse daily brief response: $e');
      return DailyBriefResult.fallback();
    }
  }

  FoodAnalysisResult _parseFoodAnalysisResponse(String text) {
    final data = _extractJson(text);
    if (data == null) {
      return FoodAnalysisResult(
        items: [],
        totalCalories: 0,
        totalProtein: 0,
        totalCarbs: 0,
        totalFat: 0,
        overallConfidence: 0,
        rawResponse: text,
      );
    }

    try {
      final items = (data['items'] as List? ?? []).map((item) => FoodItem(
            name: item['name'] ?? 'Unknown',
            portion: item['portion'] ?? '',
            calories: (item['calories'] ?? 0) as int,
            protein: (item['protein'] ?? 0) as int,
            carbs: (item['carbs'] ?? 0) as int,
            fat: (item['fat'] ?? 0) as int,
            confidence: (item['confidence'] ?? 0) as int,
          )).toList();

      return FoodAnalysisResult(
        items: items,
        totalCalories: (data['totalCalories'] ?? 0) as int,
        totalProtein: (data['totalProtein'] ?? 0) as int,
        totalCarbs: (data['totalCarbs'] ?? 0) as int,
        totalFat: (data['totalFat'] ?? 0) as int,
        overallConfidence: (data['overallConfidence'] ?? 0) as int,
        rawResponse: text,
      );
    } catch (e) {
      _talker.warning('Failed to parse food analysis response: $e');
      return FoodAnalysisResult(
        items: [],
        totalCalories: 0,
        totalProtein: 0,
        totalCarbs: 0,
        totalFat: 0,
        overallConfidence: 0,
        rawResponse: text,
      );
    }
  }

  TrainingRecommendation _parseTrainingResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return TrainingRecommendation.fallback();

    try {
      return TrainingRecommendation(
        recommendedType: data['recommendedType'] ?? 'Light activity',
        recommendedIntensity: (data['recommendedIntensity'] ?? 3) as int,
        recommendedDuration: (data['recommendedDuration'] ?? 30) as int,
        reasoning: data['reasoning'] ?? '',
        alternatives: List<String>.from(data['alternatives'] ?? []),
      );
    } catch (e) {
      _talker.warning('Failed to parse training response: $e');
      return TrainingRecommendation.fallback();
    }
  }

  PlateauAnalysis _parsePlateauResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return PlateauAnalysis.none();

    try {
      return PlateauAnalysis(
        plateauDetected: data['plateauDetected'] ?? false,
        daysSincePlateau: data['daysSincePlateau'] as int?,
        potentialCauses: List<String>.from(data['potentialCauses'] ?? []),
        suggestions: List<String>.from(data['suggestions'] ?? []),
        analysis: data['analysis'] ?? '',
      );
    } catch (e) {
      _talker.warning('Failed to parse plateau response: $e');
      return PlateauAnalysis.none();
    }
  }

  WeeklyReportResult _parseWeeklyReportResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return WeeklyReportResult.fallback();

    try {
      return WeeklyReportResult(
        summary: data['summary'] ?? '',
        highlights: List<String>.from(data['highlights'] ?? []),
        concerns: List<String>.from(data['concerns'] ?? []),
        progressAnalysis: data['progressAnalysis'] ?? '',
        nextWeekFocus: data['nextWeekFocus'] ?? '',
      );
    } catch (e) {
      _talker.warning('Failed to parse weekly report response: $e');
      return WeeklyReportResult.fallback();
    }
  }

  RescueDayPlan _parseRescuePlanResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return RescueDayPlan.fallback();

    try {
      return RescueDayPlan(
        nutritionPlan: data['nutritionPlan'] ?? '',
        activitySuggestion: data['activitySuggestion'] ?? '',
        sleepTip: data['sleepTip'] ?? '',
        mindsetMessage: data['mindsetMessage'] ?? '',
        tomorrowNote: data['tomorrowNote'] ?? '',
      );
    } catch (e) {
      _talker.warning('Failed to parse rescue plan response: $e');
      return RescueDayPlan.fallback();
    }
  }

  PhotoComparisonResult _parsePhotoComparisonResponse(String text) {
    final data = _extractJson(text);
    if (data == null) {
      return PhotoComparisonResult.error('Failed to parse comparison');
    }

    try {
      return PhotoComparisonResult(
        insights: data['insights'] ?? '',
        detectedChanges: List<String>.from(data['detectedChanges'] ?? []),
        encouragement: data['encouragement'] ?? '',
      );
    } catch (e) {
      _talker.warning('Failed to parse photo comparison response: $e');
      return PhotoComparisonResult.error('Failed to parse comparison');
    }
  }

  // ============ NEW HEALTH PREDICTION IMPLEMENTATIONS ============

  @override
  Future<IllnessRisk> predictIllness(HealthContext context) async {
    try {
      final prompt = IllnessPredictionPrompt.build(
        hrvLast7Days: context.hrvLast7Days,
        baselineHrv: context.baselineHrv,
        respiratoryRateLast7Days: context.respiratoryRateLast7Days,
        sleepHoursLast7Days: context.sleepLast7Days,
        sleepQualityLast7Days: context.sleepQualityLast7Days,
        rhrLast7Days: context.rhrLast7Days,
        baselineRhr: context.baselineRhr,
        spo2Last7Days: context.spo2Last7Days,
        currentSymptoms: context.currentSymptoms,
        moodEnergy: context.moodEnergy,
        stressLevel: context.stressLevel,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseIllnessRiskResponse(text);
    } catch (e, st) {
      _talker.error('Failed to predict illness risk', e, st);
      return IllnessRisk.fallback();
    }
  }

  @override
  Future<RecoveryFactorsAnalysis> analyzeRecoveryFactors(
    JournalHistory history,
  ) async {
    try {
      if (history.entries.length < 14) {
        return RecoveryFactorsAnalysis.fallback();
      }

      final journalEntries = history.entries.map((e) => {
        'date': e.date.toIso8601String(),
        'recoveryScore': e.recoveryScore,
        'behaviors': e.behaviors,
        'sleepHours': e.sleepHours,
        'moodEnergy': e.moodEnergy,
        'stress': e.stress,
      }).toList();

      final prompt = RecoveryOptimizationPrompt.build(
        journalEntries: journalEntries,
        allTrackedBehaviors: history.allTrackedBehaviors,
        dataPointCount: history.entries.length,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseRecoveryFactorsResponse(text, history.userId);
    } catch (e, st) {
      _talker.error('Failed to analyze recovery factors', e, st);
      return RecoveryFactorsAnalysis.fallback();
    }
  }

  @override
  Future<List<ProactiveInsight>> getProactiveInsights(
    HealthContext context,
  ) async {
    try {
      final currentContext = {
        'recoveryScore': context.recoveryScore,
        'hrv': context.currentHrv,
        'rhr': context.currentRhr,
        'sleepLastNight': context.lastNightSleep,
        'sleepQuality': context.sleepQuality,
        'strainScore': context.strainScore,
        'symptoms': context.currentSymptoms,
        'mood': context.moodEnergy,
        'stress': context.stressLevel,
      };

      final recentTrends = {
        'hrvTrend': _calculateTrend(context.hrvLast7Days.map((e) => e.toDouble()).toList()),
        'rhrTrend': _calculateTrend(context.rhrLast7Days.map((e) => e.toDouble()).toList()),
        'sleepTrend': _calculateTrend(context.sleepLast7Days),
        'recoveryTrend': _calculateTrend(context.recoveryLast7Days.map((e) => e.toDouble()).toList()),
        'strainTrend': _calculateTrend(context.strainLast7Days),
      };

      final prompt = ProactiveInsightsPrompt.build(
        currentContext: currentContext,
        recentTrends: recentTrends,
        previousInsights: [],
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseProactiveInsightsResponse(text);
    } catch (e, st) {
      _talker.error('Failed to get proactive insights', e, st);
      return [];
    }
  }

  @override
  Future<HealthQAResponse> answerHealthQuestion(
    String question,
    HealthContext context,
  ) async {
    try {
      final userContext = {
        'recoveryScore': context.recoveryScore,
        'hrv': context.currentHrv,
        'rhr': context.currentRhr,
        'sleepLastNight': context.lastNightSleep,
        'strainScore': context.strainScore,
        'symptoms': context.currentSymptoms,
        'recentBehaviors': context.recentBehaviors,
      };

      final prompt = HealthQAPrompt.build(
        question: question,
        userContext: userContext,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseHealthQAResponse(text, question);
    } catch (e, st) {
      _talker.error('Failed to answer health question', e, st);
      return HealthQAResponse.fallback(question);
    }
  }

  @override
  Future<OvertrainingRisk> assessOvertrainingRisk(
    StrainRecoveryHistory history,
  ) async {
    try {
      final strainRecoveryData = history.dailyData.map((d) => {
        'date': d.date.toIso8601String(),
        'strain': d.strainScore,
        'recovery': d.recoveryScore,
        'hrv': d.hrv,
        'rhr': d.rhr,
        'sleep': d.sleepHours,
      }).toList();

      final workouts = history.workouts.map((w) => {
        'date': w.date.toIso8601String(),
        'type': w.type,
        'duration': w.durationMinutes,
        'intensity': w.intensity,
      }).toList();

      final prompt = OvertrainingAssessmentPrompt.build(
        strainRecoveryData: strainRecoveryData,
        workouts: workouts,
        baselineHrv: history.dailyData.isNotEmpty ? history.dailyData.first.hrv : null,
        baselineRhr: history.dailyData.isNotEmpty ? history.dailyData.first.rhr : null,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseOvertrainingRiskResponse(text);
    } catch (e, st) {
      _talker.error('Failed to assess overtraining risk', e, st);
      return OvertrainingRisk.fallback();
    }
  }

  @override
  Future<SleepDebtAssessment> assessSleepDebt(
    List<double> sleepHoursLast14Days,
    double targetSleepHours,
    List<int>? sleepQualityLast14Days,
  ) async {
    try {
      final prompt = SleepDebtPrompt.build(
        sleepHoursLast14Days: sleepHoursLast14Days,
        targetSleepHours: targetSleepHours,
        sleepQualityLast14Days: sleepQualityLast14Days,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseSleepDebtResponse(text, targetSleepHours);
    } catch (e, st) {
      _talker.error('Failed to assess sleep debt', e, st);
      return SleepDebtAssessment.fallback();
    }
  }

  @override
  Future<PatternAnalysisResult> detectPatterns(
    List<Map<String, dynamic>> dailyData,
    List<String> allBehaviors,
    Map<String, dynamic> userProfile,
  ) async {
    try {
      final prompt = PatternDetectionPrompt.build(
        dailyData: dailyData,
        allBehaviors: allBehaviors,
        userProfile: userProfile,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parsePatternAnalysisResponse(text);
    } catch (e, st) {
      _talker.error('Failed to detect patterns', e, st);
      return PatternAnalysisResult.fallback();
    }
  }

  @override
  Future<DailyCoachingResult> getDailyCoaching(
    DailyCoachingContext context,
  ) async {
    try {
      final prompt = DailyCoachingPrompt.build(
        recoveryScore: context.recoveryScore,
        yesterdayStrain: context.yesterdayStrain,
        sleepDebtHours: context.sleepDebtHours,
        lastNightSleep: context.lastNightSleep,
        sleepQuality: context.sleepQuality,
        hrv: context.hrv,
        rhr: context.rhr,
        upcomingGoals: context.upcomingGoals,
        scheduledWorkouts: context.scheduledWorkouts,
        activeProtocols: context.activeProtocols,
        coachingTone: context.coachingTone,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseDailyCoachingResponse(text);
    } catch (e, st) {
      _talker.error('Failed to get daily coaching', e, st);
      return DailyCoachingResult.fallback();
    }
  }

  // ============ NEW PARSING HELPERS ============

  String _calculateTrend(List<double> values) {
    if (values.length < 3) return 'insufficient_data';
    final first = values.take(3).reduce((a, b) => a + b) / 3;
    final last = values.skip(values.length - 3).reduce((a, b) => a + b) / 3;
    final diff = last - first;
    if (diff > 5) return 'increasing';
    if (diff < -5) return 'decreasing';
    return 'stable';
  }

  Map<String, dynamic>? _extractJson(String text) {
    try {
      final jsonMatch = RegExp(r'\{[\s\S]*\}').firstMatch(text);
      if (jsonMatch == null) return null;
      return json.decode(jsonMatch.group(0)!) as Map<String, dynamic>;
    } catch (e) {
      _talker.warning('Failed to extract JSON from response: $e');
      return null;
    }
  }

  IllnessRisk _parseIllnessRiskResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return IllnessRisk.fallback();

    try {
      final contributingFactors = (data['contributingFactors'] as List? ?? [])
          .map((f) => ContributingFactor(
                factor: f['factor'] ?? '',
                observation: f['observation'] ?? '',
                normalRange: f['normalRange'] ?? '',
                impactScore: f['impactScore'] ?? 0,
                trend: _parseFactorTrend(f['trend']),
              ))
          .toList();

      final preventiveActions = (data['preventiveActions'] as List? ?? [])
          .map((a) => PreventiveAction(
                action: a['action'] ?? '',
                rationale: a['rationale'] ?? '',
                priority: _parseActionPriority(a['priority']),
                category: _parseActionCategory(a['category']),
              ))
          .toList();

      return IllnessRisk(
        probability: data['probability'] ?? 0,
        riskLevel: _parseIllnessRiskLevel(data['riskLevel']),
        confidence: data['confidence'] ?? 0,
        contributingFactors: contributingFactors,
        preventiveActions: preventiveActions,
        symptoms: List<String>.from(data['symptoms'] ?? []),
        timeframe: data['timeframe'],
        explanation: data['explanation'] ?? '',
        shouldConsultDoctor: data['shouldConsultDoctor'] ?? false,
      );
    } catch (e) {
      _talker.warning('Failed to parse illness risk response: $e');
      return IllnessRisk.fallback();
    }
  }

  RecoveryFactorsAnalysis _parseRecoveryFactorsResponse(String text, String userId) {
    final data = _extractJson(text);
    if (data == null) return RecoveryFactorsAnalysis.fallback();

    try {
      return RecoveryFactorsAnalysis(
        userId: userId,
        analyzedAt: DateTime.now(),
        dataPointsAnalyzed: data['dataPointsAnalyzed'] ?? 0,
        helpfulBehaviors: _parseBehaviorCorrelations(data['helpfulBehaviors']),
        harmfulBehaviors: _parseBehaviorCorrelations(data['harmfulBehaviors']),
        neutralBehaviors: _parseBehaviorCorrelations(data['neutralBehaviors']),
        keyInsights: List<String>.from(data['keyInsights'] ?? []),
        personalizedAdvice: data['personalizedAdvice'] ?? '',
        confidence: data['confidence'] ?? 0,
      );
    } catch (e) {
      _talker.warning('Failed to parse recovery factors response: $e');
      return RecoveryFactorsAnalysis.fallback();
    }
  }

  List<BehaviorCorrelation> _parseBehaviorCorrelations(dynamic data) {
    if (data == null || data is! List) return [];
    return data.map((b) => BehaviorCorrelation(
          behavior: b['behavior'] ?? '',
          impactOnRecovery: _parseBehaviorImpact(b['impactOnRecovery']),
          correlationStrength: (b['correlationStrength'] ?? 0.0).toDouble(),
          confidence: b['confidence'] ?? 0,
          occurrences: b['occurrences'] ?? 0,
          averageRecoveryWith: (b['averageRecoveryWith'] ?? 0.0).toDouble(),
          averageRecoveryWithout: (b['averageRecoveryWithout'] ?? 0.0).toDouble(),
          explanation: b['explanation'] ?? '',
          insights: List<String>.from(b['insights'] ?? []),
        )).toList();
  }

  List<ProactiveInsight> _parseProactiveInsightsResponse(String text) {
    final data = _extractJson(text);
    if (data == null || data['insights'] == null) return [];

    try {
      return (data['insights'] as List).map((i) => ProactiveInsight(
            id: i['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
            generatedAt: DateTime.now(),
            type: _parseInsightType(i['type']),
            title: i['title'] ?? '',
            message: i['message'] ?? '',
            priority: _parseActionPriority(i['priority']),
            confidence: i['confidence'] ?? 0,
            actionableAdvice: i['actionableAdvice'],
            relatedMetric: i['relatedMetric'],
            metricChange: (i['metricChange'] ?? 0.0).toDouble(),
            isUrgent: i['isUrgent'] ?? false,
          )).toList();
    } catch (e) {
      _talker.warning('Failed to parse proactive insights response: $e');
      return [];
    }
  }

  HealthQAResponse _parseHealthQAResponse(String text, String question) {
    final data = _extractJson(text);
    if (data == null) return HealthQAResponse.fallback(question);

    try {
      return HealthQAResponse(
        question: question,
        answer: data['answer'] ?? '',
        confidence: data['confidence'] ?? 0,
        relatedTopics: List<String>.from(data['relatedTopics'] ?? []),
        disclaimers: List<String>.from(data['disclaimers'] ?? []),
        suggestsConsultingDoctor: data['suggestsConsultingDoctor'] ?? false,
        followUpQuestion: data['followUpQuestion'],
      );
    } catch (e) {
      _talker.warning('Failed to parse health QA response: $e');
      return HealthQAResponse.fallback(question);
    }
  }

  OvertrainingRisk _parseOvertrainingRiskResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return OvertrainingRisk.fallback();

    try {
      final strainTrendData = data['strainTrend'] ?? {};
      final recoveryTrendData = data['recoveryTrend'] ?? {};

      return OvertrainingRisk(
        riskScore: data['riskScore'] ?? 0,
        riskLevel: _parseOvertrainingLevel(data['riskLevel']),
        confidence: data['confidence'] ?? 0,
        strainTrend: StrainTrend(
          trend: _parseFactorTrend(strainTrendData['trend']),
          averageLast7Days: (strainTrendData['averageLast7Days'] ?? 0.0).toDouble(),
          averageLast30Days: (strainTrendData['averageLast30Days'] ?? 0.0).toDouble(),
          peakLast7Days: (strainTrendData['peakLast7Days'] ?? 0.0).toDouble(),
        ),
        recoveryTrend: RecoveryTrend(
          trend: _parseFactorTrend(recoveryTrendData['trend']),
          averageLast7Days: (recoveryTrendData['averageLast7Days'] ?? 0.0).toDouble(),
          averageLast30Days: (recoveryTrendData['averageLast30Days'] ?? 0.0).toDouble(),
          lowestLast7Days: (recoveryTrendData['lowestLast7Days'] ?? 0.0).toDouble(),
        ),
        strainRecoveryBalance: (data['strainRecoveryBalance'] ?? 1.0).toDouble(),
        warningSignals: List<String>.from(data['warningSignals'] ?? []),
        recommendations: List<String>.from(data['recommendations'] ?? []),
        daysToRecovery: data['daysToRecovery'] ?? 0,
        explanation: data['explanation'] ?? '',
      );
    } catch (e) {
      _talker.warning('Failed to parse overtraining risk response: $e');
      return OvertrainingRisk.fallback();
    }
  }

  SleepDebtAssessment _parseSleepDebtResponse(String text, double targetHours) {
    final data = _extractJson(text);
    if (data == null) return SleepDebtAssessment.fallback();

    try {
      return SleepDebtAssessment(
        accumulatedDebtHours: (data['accumulatedDebtHours'] ?? 0.0).toDouble(),
        averageSleepLast7Days: (data['averageSleepLast7Days'] ?? 0.0).toDouble(),
        targetSleepHours: targetHours,
        deficitPerNight: (data['deficitPerNight'] ?? 0.0).toDouble(),
        level: _parseSleepDebtLevel(data['level']),
        daysToRecover: data['daysToRecover'] ?? 0,
        impacts: List<String>.from(data['impacts'] ?? []),
        recommendations: List<String>.from(data['recommendations'] ?? []),
        explanation: data['explanation'] ?? '',
      );
    } catch (e) {
      _talker.warning('Failed to parse sleep debt response: $e');
      return SleepDebtAssessment.fallback();
    }
  }

  PatternAnalysisResult _parsePatternAnalysisResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return PatternAnalysisResult.fallback();

    try {
      final patterns = (data['patterns'] as List? ?? []).map((p) => DetectedPattern(
            patternType: p['patternType'] ?? '',
            title: p['title'] ?? '',
            description: p['description'] ?? '',
            evidence: p['evidence'] ?? '',
            confidence: p['confidence'] ?? 0,
            actionability: p['actionability'] ?? 'low',
            suggestedAction: p['suggestedAction'] ?? '',
          )).toList();

      final correlations = (data['correlations'] as List? ?? []).map((c) => Correlation(
            factor1: c['factor1'] ?? '',
            factor2: c['factor2'] ?? '',
            relationship: c['relationship'] ?? '',
            strength: (c['strength'] ?? 0.0).toDouble(),
            explanation: c['explanation'] ?? '',
            confidence: c['confidence'] ?? 0,
          )).toList();

      return PatternAnalysisResult(
        analysisConfidence: data['analysisConfidence'] ?? 0,
        dataQuality: data['dataQuality'] ?? 'limited',
        patterns: patterns,
        correlations: correlations,
        keyInsights: List<String>.from(data['keyInsights']?.map((i) => i['insight'] ?? i.toString()) ?? []),
        optimizationOpportunities: List<String>.from(
            data['optimizationOpportunities']?.map((o) => o['howToAchieve'] ?? o.toString()) ?? []),
        warnings: List<String>.from(data['warnings']?.map((w) => w['concern'] ?? w.toString()) ?? []),
        celebrateWins: List<String>.from(data['celebrateWins'] ?? []),
      );
    } catch (e) {
      _talker.warning('Failed to parse pattern analysis response: $e');
      return PatternAnalysisResult.fallback();
    }
  }

  DailyCoachingResult _parseDailyCoachingResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return DailyCoachingResult.fallback();

    try {
      final training = data['trainingRecommendation'] ?? {};
      final nutrition = data['nutritionFocus'] ?? {};
      final sleep = data['sleepStrategy'] ?? {};

      return DailyCoachingResult(
        overallGuidance: data['overallGuidance'] ?? '',
        shouldTrain: training['shouldTrain'] ?? false,
        recommendedIntensity: training['recommendedIntensity'] ?? 1,
        recommendedType: training['recommendedType'] ?? 'rest',
        recommendedDuration: training['recommendedDuration'] ?? 0,
        trainingReasoning: training['reasoning'] ?? '',
        trainingAlternatives: List<String>.from(training['alternatives'] ?? []),
        recoveryProtocols: (data['recoveryProtocols'] as List? ?? [])
            .map((p) => '${p['protocol']}: ${p['timing']}')
            .toList(),
        nutritionPriority: nutrition['priority'] ?? '',
        hydrationGoal: nutrition['hydrationGoal'] ?? '2.5L',
        nutritionSuggestion: nutrition['suggestion'] ?? '',
        targetBedtime: sleep['targetBedtime'] ?? '',
        windDownTip: sleep['windDownTip'] ?? '',
        sleepDebtStrategy: sleep['sleepDebtStrategy'] ?? '',
        mindsetMessage: data['mindsetMessage'] ?? '',
        keyMetricsToWatch: List<String>.from(data['keyMetricsToWatch'] ?? []),
      );
    } catch (e) {
      _talker.warning('Failed to parse daily coaching response: $e');
      return DailyCoachingResult.fallback();
    }
  }

  // ============ ENUM PARSERS ============

  FactorTrend _parseFactorTrend(String? trend) {
    switch (trend?.toLowerCase()) {
      case 'improving':
        return FactorTrend.improving;
      case 'declining':
        return FactorTrend.declining;
      case 'rapidly_declining':
        return FactorTrend.rapidlyDeclining;
      default:
        return FactorTrend.stable;
    }
  }

  ActionPriority _parseActionPriority(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'immediate':
        return ActionPriority.immediate;
      case 'high':
        return ActionPriority.high;
      case 'medium':
        return ActionPriority.medium;
      default:
        return ActionPriority.low;
    }
  }

  ActionCategory _parseActionCategory(String? category) {
    switch (category?.toLowerCase()) {
      case 'sleep':
        return ActionCategory.sleep;
      case 'nutrition':
        return ActionCategory.nutrition;
      case 'hydration':
        return ActionCategory.hydration;
      case 'activity':
        return ActionCategory.activity;
      case 'stress':
        return ActionCategory.stress;
      case 'medical':
        return ActionCategory.medical;
      default:
        return ActionCategory.activity;
    }
  }

  IllnessRiskLevel _parseIllnessRiskLevel(String? level) {
    switch (level?.toLowerCase()) {
      case 'low':
        return IllnessRiskLevel.low;
      case 'moderate':
        return IllnessRiskLevel.moderate;
      case 'elevated':
        return IllnessRiskLevel.elevated;
      case 'high':
        return IllnessRiskLevel.high;
      default:
        return IllnessRiskLevel.unknown;
    }
  }

  BehaviorImpact _parseBehaviorImpact(String? impact) {
    switch (impact?.toLowerCase()) {
      case 'strongly_positive':
        return BehaviorImpact.stronglyPositive;
      case 'positive':
        return BehaviorImpact.positive;
      case 'negative':
        return BehaviorImpact.negative;
      case 'strongly_negative':
        return BehaviorImpact.stronglyNegative;
      default:
        return BehaviorImpact.neutral;
    }
  }

  InsightType _parseInsightType(String? type) {
    switch (type?.toLowerCase()) {
      case 'trend_alert':
        return InsightType.trendAlert;
      case 'pattern_detected':
        return InsightType.patternDetected;
      case 'milestone':
        return InsightType.milestone;
      case 'recommendation':
        return InsightType.recommendation;
      case 'warning':
        return InsightType.warning;
      case 'celebration':
        return InsightType.celebration;
      default:
        return InsightType.recommendation;
    }
  }

  OvertrainingLevel _parseOvertrainingLevel(String? level) {
    switch (level?.toLowerCase()) {
      case 'optimal':
        return OvertrainingLevel.optimal;
      case 'adequate':
        return OvertrainingLevel.adequate;
      case 'elevated':
        return OvertrainingLevel.elevated;
      case 'high':
        return OvertrainingLevel.high;
      case 'critical':
        return OvertrainingLevel.critical;
      default:
        return OvertrainingLevel.unknown;
    }
  }

  SleepDebtLevel _parseSleepDebtLevel(String? level) {
    switch (level?.toLowerCase()) {
      case 'none':
        return SleepDebtLevel.none;
      case 'mild':
        return SleepDebtLevel.mild;
      case 'moderate':
        return SleepDebtLevel.moderate;
      case 'severe':
        return SleepDebtLevel.severe;
      case 'critical':
        return SleepDebtLevel.critical;
      default:
        return SleepDebtLevel.unknown;
    }
  }

  // ============ NEW DIET AND ACTIVITY METHOD IMPLEMENTATIONS ============

  @override
  Future<AiMealSuggestionResult> suggestEgyptianMeals({
    required int targetCalories,
    required int targetProtein,
    required String mealType,
    List<String>? dietaryRestrictions,
    bool? preferEgyptian,
    String? language,
  }) async {
    try {
      final prompt = EgyptianDietSuggestionPrompt.build(
        targetCalories: targetCalories,
        targetProtein: targetProtein,
        mealType: mealType,
        dietaryRestrictions: dietaryRestrictions ?? [],
        preferEgyptian: preferEgyptian ?? true,
        language: language ?? 'ar',
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseEgyptianMealSuggestionResponse(text);
    } catch (e, st) {
      _talker.error('Failed to suggest Egyptian meals', e, st);
      return AiMealSuggestionResult.empty();
    }
  }

  @override
  Future<AiActivityRecommendationResult> getActivityRecommendation({
    required double recoveryScore,
    double? strainScore,
    required List<Map<String, dynamic>> recentWorkouts,
    required List<String> constraints,
    required List<String> weeklyPlan,
    required bool isRamadan,
    String? language,
  }) async {
    try {
      final prompt = ActivityRecommendationPrompt.build(
        recoveryScore: recoveryScore,
        strainScore: strainScore,
        recentWorkouts: recentWorkouts,
        constraints: constraints,
        weeklyPlan: weeklyPlan,
        isRamadan: isRamadan,
        language: language ?? 'ar',
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseActivityRecommendationResponse(text);
    } catch (e, st) {
      _talker.error('Failed to get activity recommendation', e, st);
      return AiActivityRecommendationResult.empty();
    }
  }

  @override
  Future<WorkoutClassification> classifyWorkout({
    required double averageHeartRate,
    required double maxHeartRate,
    required int durationMinutes,
    required List<Map<String, dynamic>> heartRatePattern,
    int? steps,
    Map<String, dynamic>? zones,
  }) async {
    try {
      final prompt = WorkoutClassificationPrompt.build(
        averageHeartRate: averageHeartRate,
        maxHeartRate: maxHeartRate,
        durationMinutes: durationMinutes,
        heartRatePattern: heartRatePattern,
        steps: steps,
        zones: zones,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseWorkoutClassificationResponse(text);
    } catch (e, st) {
      _talker.error('Failed to classify workout', e, st);
      return WorkoutClassification(
        primaryType: 'Unknown',
        confidence: 0,
        alternatives: [],
        reasoning: 'Classification failed',
        isAiClassified: false,
      );
    }
  }

  @override
  Future<AiDailyMealPlanResult> generateDailyMealPlan({
    required int targetCalories,
    required int targetProtein,
    List<String>? dietaryRestrictions,
    String? eatingWindowStart,
    String? eatingWindowEnd,
    bool? preferHighProtein,
    bool? preferVegetarian,
    bool? preferLowCarb,
    int? recoveryScore,
    bool? hasWorkoutToday,
    bool? isRamadan,
    String? language,
  }) async {
    try {
      final prompt = DailyMealPlanPrompt.build(
        targetCalories: targetCalories,
        targetProtein: targetProtein,
        dietaryRestrictions: dietaryRestrictions ?? [],
        eatingWindowStart: eatingWindowStart,
        eatingWindowEnd: eatingWindowEnd,
        preferHighProtein: preferHighProtein ?? false,
        preferVegetarian: preferVegetarian ?? false,
        preferLowCarb: preferLowCarb ?? false,
        recoveryScore: recoveryScore,
        hasWorkoutToday: hasWorkoutToday ?? false,
        isRamadan: isRamadan ?? false,
        language: language ?? 'ar',
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseDailyMealPlanResponse(text);
    } catch (e, st) {
      _talker.error('Failed to generate daily meal plan', e, st);
      return AiDailyMealPlanResult.fallback();
    }
  }

  // ============ NEW RESPONSE PARSERS ============

  AiMealSuggestionResult _parseEgyptianMealSuggestionResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return AiMealSuggestionResult.empty();

    try {
      final suggestions = (data['suggestions'] as List? ?? []).map((s) {
        return MealSuggestionData(
          name: s['name'] ?? '',
          nameEn: s['nameEn'] ?? '',
          calories: s['calories'] ?? 0,
          protein: s['protein'] ?? 0,
          carbs: s['carbs'] ?? 0,
          fat: s['fat'] ?? 0,
          servingSize: s['servingSize'],
          reasoning: s['reasoning'],
          fitScore: s['fitScore'] ?? 50,
          tags: List<String>.from(s['tags'] ?? []),
          isHighProtein: s['isHighProtein'] ?? false,
          isVegetarian: s['isVegetarian'] ?? false,
          isLowCarb: s['isLowCarb'] ?? false,
        );
      }).toList();

      return AiMealSuggestionResult(
        suggestions: suggestions,
        overallReasoning: data['overallReasoning'],
        tips: List<String>.from(data['tips'] ?? []),
        confidence: 75,
        isAiGenerated: true,
      );
    } catch (e) {
      _talker.warning('Failed to parse meal suggestion response: $e');
      return AiMealSuggestionResult.empty();
    }
  }

  AiActivityRecommendationResult _parseActivityRecommendationResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return AiActivityRecommendationResult.empty();

    try {
      return AiActivityRecommendationResult(
        recommendationType: data['recommendationType'] ?? 'moderate',
        primaryRecommendation: data['primaryRecommendation'] ?? '',
        alternativeActivities: List<String>.from(data['alternativeActivities'] ?? []),
        reasoning: data['reasoning'],
        targetStrainMin: (data['targetStrainRange']?['min'] ?? 0).toDouble(),
        targetStrainMax: (data['targetStrainRange']?['max'] ?? 21).toDouble(),
        suggestedDuration: data['suggestedDuration'] ?? 30,
        suggestedIntensity: data['suggestedIntensity'] ?? 5,
        warnings: List<String>.from(data['warnings'] ?? []),
        egyptianContext: data['egyptianContext'],
        confidence: data['confidence'] ?? 70,
        isAiGenerated: true,
      );
    } catch (e) {
      _talker.warning('Failed to parse activity recommendation response: $e');
      return AiActivityRecommendationResult.empty();
    }
  }

  WorkoutClassification _parseWorkoutClassificationResponse(String text) {
    final data = _extractJson(text);
    if (data == null) {
      return WorkoutClassification(
        primaryType: 'Unknown',
        confidence: 0,
        alternatives: [],
        isAiClassified: false,
      );
    }

    try {
      final alternatives = (data['alternatives'] as List? ?? [])
          .map((a) => ClassificationAlternativeData(
                type: a['type'] ?? '',
                confidence: (a['confidence'] ?? 0).toDouble(),
              ))
          .toList();

      return WorkoutClassification(
        primaryType: data['primaryType'] ?? 'Unknown',
        confidence: (data['confidence'] ?? 0).toDouble(),
        alternatives: alternatives,
        reasoning: data['reasoning'],
        isAiClassified: true,
      );
    } catch (e) {
      _talker.warning('Failed to parse workout classification response: $e');
      return WorkoutClassification(
        primaryType: 'Unknown',
        confidence: 0,
        alternatives: [],
        isAiClassified: false,
      );
    }
  }

  AiDailyMealPlanResult _parseDailyMealPlanResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return AiDailyMealPlanResult.fallback();

    try {
      MealSuggestionData? parseMeal(Map<String, dynamic>? mealData) {
        if (mealData == null) return null;
        return MealSuggestionData(
          name: mealData['name'] ?? '',
          nameEn: mealData['nameEn'] ?? '',
          calories: mealData['calories'] ?? 0,
          protein: mealData['protein'] ?? 0,
          carbs: mealData['carbs'] ?? 0,
          fat: mealData['fat'] ?? 0,
          servingSize: mealData['servingSize'],
          timing: mealData['timing'],
          notes: mealData['notes'],
        );
      }

      final snacks = (data['snacks'] as List? ?? [])
          .map((s) => parseMeal(s as Map<String, dynamic>))
          .whereType<MealSuggestionData>()
          .toList();

      final totals = data['totals'] as Map<String, dynamic>? ?? {};

      return AiDailyMealPlanResult(
        breakfast: parseMeal(data['breakfast'] as Map<String, dynamic>?),
        lunch: parseMeal(data['lunch'] as Map<String, dynamic>?),
        dinner: parseMeal(data['dinner'] as Map<String, dynamic>?),
        snacks: snacks,
        totalCalories: totals['calories'] ?? 0,
        totalProtein: totals['protein'] ?? 0,
        totalCarbs: totals['carbs'] ?? 0,
        totalFat: totals['fat'] ?? 0,
        overallFitScore: data['overallFitScore'] ?? 50,
        coachingNote: data['coachingNote'],
        hydrationGoal: data['hydrationGoal'],
        preWorkoutSuggestion: data['workoutNutrition']?['preWorkout'],
        postWorkoutSuggestion: data['workoutNutrition']?['postWorkout'],
        isAiGenerated: true,
        confidence: 75,
      );
    } catch (e) {
      _talker.warning('Failed to parse daily meal plan response: $e');
      return AiDailyMealPlanResult.fallback();
    }
  }

  @override
  Future<DietAwareWorkoutResult> getDietAwareWorkoutRecommendation({
    required int caloriesConsumed,
    required int proteinConsumed,
    required int targetCalories,
    required int targetProtein,
    int? recoveryScore,
    double? strainScore,
    double? sleepHours,
    int? hrv,
    int? restingHR,
    int workoutsThisWeek = 0,
    List<String> constraints = const [],
    String language = 'en',
  }) async {
    try {
      final prompt = GeminiPrompts.buildDietAwareWorkoutPrompt(
        caloriesConsumed: caloriesConsumed,
        proteinConsumed: proteinConsumed,
        targetCalories: targetCalories,
        targetProtein: targetProtein,
        recoveryScore: recoveryScore,
        strainScore: strainScore,
        sleepHours: sleepHours,
        hrv: hrv,
        restingHR: restingHR,
        workoutsThisWeek: workoutsThisWeek,
        constraints: constraints,
        language: language,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseDietAwareWorkoutResponse(text);
    } catch (e, st) {
      _talker.error('Failed to generate diet-aware workout recommendation', e, st);
      return DietAwareWorkoutResult.fallback();
    }
  }

  @override
  Future<AiWeeklyMealPlanResult> generateWeeklyMealPlan({
    required int dailyCalorieTarget,
    required int dailyProteinTarget,
    List<String> dietaryRestrictions = const [],
    String? eatingWindowStart,
    String? eatingWindowEnd,
    List<int> workoutDays = const [],
    List<int> strengthDays = const [],
    int? recoveryScore,
    double? strainScore,
    bool preferHighProtein = false,
    bool preferVegetarian = false,
    bool preferLowCarb = false,
    int workoutDayCalorieBonus = 250,
    int strengthDayProteinBonus = 20,
    String language = 'ar',
  }) async {
    try {
      final prompt = GeminiPrompts.buildWeeklyMealPlanPrompt(
        dailyCalorieTarget: dailyCalorieTarget,
        dailyProteinTarget: dailyProteinTarget,
        dietaryRestrictions: dietaryRestrictions,
        eatingWindowStart: eatingWindowStart,
        eatingWindowEnd: eatingWindowEnd,
        workoutDays: workoutDays,
        strengthDays: strengthDays,
        recoveryScore: recoveryScore,
        strainScore: strainScore,
        preferHighProtein: preferHighProtein,
        preferVegetarian: preferVegetarian,
        preferLowCarb: preferLowCarb,
        workoutDayCalorieBonus: workoutDayCalorieBonus,
        strengthDayProteinBonus: strengthDayProteinBonus,
        language: language,
      );

      // Check if initialized
      if (!_isInitialized || _apiKey.isEmpty) {
        throw Exception('Gemini API not initialized. Please check your GEMINI_API_KEY in .env file.');
      }

      // Use model with higher token output for 7-day plan
      final weeklyModel = GenerativeModel(
        model: 'gemini-2.0-flash',
        apiKey: _apiKey,
        generationConfig: GenerationConfig(
          temperature: 0.7,
          topK: 40,
          topP: 0.95,
          maxOutputTokens: 8192, // Higher limit for weekly plan
        ),
      );

      final response = await weeklyModel.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseWeeklyMealPlanResponse(text);
    } catch (e, st) {
      _talker.error('Failed to generate weekly meal plan', e, st);
      return AiWeeklyMealPlanResult.fallback();
    }
  }

  AiWeeklyMealPlanResult _parseWeeklyMealPlanResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return AiWeeklyMealPlanResult.fallback();

    try {
      final weeklyPlan = data['weeklyPlan'] as Map<String, dynamic>? ?? {};
      final weeklyTotals = data['weeklyTotals'] as Map<String, dynamic>? ?? {};

      // Parse each day's plan
      AiDayMealPlan? parseDay(String dayKey) {
        final dayData = weeklyPlan[dayKey] as Map<String, dynamic>?;
        if (dayData == null) return null;

        return AiDayMealPlan(
          dayName: dayData['date'] ?? dayKey,
          isWorkoutDay: dayData['isWorkoutDay'] ?? false,
          isStrengthDay: dayData['isStrengthDay'] ?? false,
          targetCalories: dayData['targetCalories'] ?? 0,
          targetProtein: dayData['targetProtein'] ?? 0,
          breakfast: _parseMealItem(dayData['breakfast']),
          lunch: _parseMealItem(dayData['lunch']),
          dinner: _parseMealItem(dayData['dinner']),
          snacks: (dayData['snacks'] as List? ?? [])
              .map((s) => _parseMealItem(s))
              .where((m) => m != null)
              .cast<AiMealItem>()
              .toList(),
          totalCalories: dayData['totalCalories'] ?? 0,
          totalProtein: dayData['totalProtein'] ?? 0,
          totalCarbs: dayData['totalCarbs'] ?? 0,
          totalFat: dayData['totalFat'] ?? 0,
          dayNote: dayData['dayNote'],
        );
      }

      return AiWeeklyMealPlanResult(
        monday: parseDay('monday'),
        tuesday: parseDay('tuesday'),
        wednesday: parseDay('wednesday'),
        thursday: parseDay('thursday'),
        friday: parseDay('friday'),
        saturday: parseDay('saturday'),
        sunday: parseDay('sunday'),
        totalCalories: weeklyTotals['totalCalories'] ?? 0,
        totalProtein: weeklyTotals['totalProtein'] ?? 0,
        totalCarbs: weeklyTotals['totalCarbs'] ?? 0,
        totalFat: weeklyTotals['totalFat'] ?? 0,
        averageDailyCalories: (weeklyTotals['averageDaily'] as Map<String, dynamic>?)?['calories'] ?? 0,
        averageDailyProtein: (weeklyTotals['averageDaily'] as Map<String, dynamic>?)?['protein'] ?? 0,
        coachingNote: data['coachingNote'] ?? '',
        coachingNoteEn: data['coachingNoteEn'] ?? '',
        fitScore: data['fitScore'] ?? 0,
        hydrationGoal: data['hydrationGoal'] ?? '2.5L',
        isAiGenerated: true,
      );
    } catch (e) {
      _talker.warning('Failed to parse weekly meal plan response: $e');
      return AiWeeklyMealPlanResult.fallback();
    }
  }

  AiMealItem? _parseMealItem(dynamic mealData) {
    if (mealData == null) return null;
    final data = mealData as Map<String, dynamic>;

    return AiMealItem(
      name: data['name'] ?? '',
      nameEn: data['nameEn'] ?? '',
      calories: data['calories'] ?? 0,
      protein: data['protein'] ?? 0,
      carbs: data['carbs'] ?? 0,
      fat: data['fat'] ?? 0,
      servingSize: data['servingSize'] ?? '',
      timing: data['timing'],
      notes: data['notes'],
    );
  }

  DietAwareWorkoutResult _parseDietAwareWorkoutResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return DietAwareWorkoutResult.fallback();

    try {
      return DietAwareWorkoutResult(
        recommendedWorkout: data['recommendedWorkout'] ?? 'Moderate Activity',
        recommendedWorkoutId: data['recommendedWorkoutId'],
        intensity: data['intensity'] ?? 3,
        estimatedCaloriesBurn: data['estimatedCaloriesBurn'] ?? 200,
        reasoning: data['reasoning'] ?? 'Based on your current nutrition and recovery data.',
        reasoningAr: data['reasoningAr'],
        warnings: List<String>.from(data['warnings'] ?? []),
        alternativeIfTired: data['alternativeIfTired'],
        nutritionInsight: data['nutritionInsight'],
        recoveryInsight: data['recoveryInsight'],
        isAiGenerated: true,
        confidence: data['confidence'] ?? 70,
      );
    } catch (e) {
      _talker.warning('Failed to parse diet-aware workout response: $e');
      return DietAwareWorkoutResult.fallback();
    }
  }

  @override
  Future<DietAwareWorkoutResult> getHealthOnlyWorkoutRecommendation({
    int? recoveryScore,
    double? strainScore,
    double? sleepHours,
    int? sleepQuality,
    int? hrv,
    int? restingHR,
    int workoutsThisWeek = 0,
    List<String> constraints = const [],
    String language = 'en',
  }) async {
    try {
      final prompt = GeminiPrompts.buildHealthOnlyWorkoutPrompt(
        recoveryScore: recoveryScore,
        strainScore: strainScore,
        sleepHours: sleepHours,
        sleepQuality: sleepQuality,
        hrv: hrv,
        restingHR: restingHR,
        workoutsThisWeek: workoutsThisWeek,
        constraints: constraints,
        language: language,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseHealthOnlyWorkoutResponse(text);
    } catch (e, st) {
      _talker.error('Failed to generate health-only workout recommendation', e, st);
      return DietAwareWorkoutResult.healthOnlyFallback(
        recoveryScore: recoveryScore,
        strainScore: strainScore,
        sleepHours: sleepHours,
      );
    }
  }

  DietAwareWorkoutResult _parseHealthOnlyWorkoutResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return DietAwareWorkoutResult.healthOnlyFallback();

    try {
      return DietAwareWorkoutResult(
        recommendedWorkout: data['recommendedWorkout'] ?? 'Moderate Activity',
        recommendedWorkoutId: data['recommendedWorkoutId'],
        intensity: data['intensity'] ?? 3,
        estimatedCaloriesBurn: data['estimatedCaloriesBurn'] ?? 200,
        reasoning: data['reasoning'] ?? 'Based on your recovery and health data.',
        reasoningAr: data['reasoningAr'],
        warnings: List<String>.from(data['warnings'] ?? []),
        alternativeIfTired: data['alternativeIfTired'],
        nutritionInsight: null, // No nutrition data available
        recoveryInsight: data['recoveryInsight'],
        isAiGenerated: true,
        confidence: data['confidence'] ?? 70,
      );
    } catch (e) {
      _talker.warning('Failed to parse health-only workout response: $e');
      return DietAwareWorkoutResult.healthOnlyFallback();
    }
  }

  @override
  Future<AiWeeklyWorkoutPlanResult> generateWeeklyWorkoutPlan({
    required int targetWorkoutDays,
    List<String> fitnessGoals = const ['strength', 'fitness'],
    List<String> availableEquipment = const ['full_gym'],
    int? recoveryScore,
    double? strainScore,
    List<String> constraints = const [],
    List<String> preferredWorkoutTypes = const [],
    int? mealPlanCalories,
    String language = 'ar',
  }) async {
    try {
      // Check if initialized
      if (!_isInitialized || _apiKey.isEmpty) {
        throw Exception('Gemini API not initialized. Please check your GEMINI_API_KEY in .env file.');
      }

      final prompt = GeminiPrompts.buildWeeklyWorkoutPlanPrompt(
        targetWorkoutDays: targetWorkoutDays,
        fitnessGoals: fitnessGoals,
        availableEquipment: availableEquipment,
        recoveryScore: recoveryScore,
        strainScore: strainScore,
        constraints: constraints,
        preferredWorkoutTypes: preferredWorkoutTypes,
        mealPlanCalories: mealPlanCalories,
        language: language,
      );

      // Use model with higher token output for 7-day plan with exercises
      final weeklyModel = GenerativeModel(
        model: 'gemini-2.0-flash',
        apiKey: _apiKey,
        generationConfig: GenerationConfig(
          temperature: 0.7,
          topK: 40,
          topP: 0.95,
          maxOutputTokens: 8192, // Higher limit for detailed workout plan
        ),
      );

      final response = await weeklyModel.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseWeeklyWorkoutPlanResponse(text);
    } catch (e, st) {
      _talker.error('Failed to generate weekly workout plan', e, st);
      return AiWeeklyWorkoutPlanResult.fallback();
    }
  }

  AiWeeklyWorkoutPlanResult _parseWeeklyWorkoutPlanResponse(String text) {
    final data = _extractJson(text);
    if (data == null) return AiWeeklyWorkoutPlanResult.fallback();

    try {
      final weeklyPlan = data['weeklyPlan'] as Map<String, dynamic>? ?? {};
      final weeklyTotals = data['weeklyTotals'] as Map<String, dynamic>? ?? {};

      // Parse each day's workout plan
      AiDayWorkoutPlan? parseDay(String dayKey) {
        final dayData = weeklyPlan[dayKey] as Map<String, dynamic>?;
        if (dayData == null) return null;

        final isRestDay = dayData['isRestDay'] == true;

        return AiDayWorkoutPlan(
          workoutName: dayData['workoutName'] ?? (isRestDay ? 'Rest Day' : 'Workout'),
          workoutNameAr: dayData['workoutNameAr'] ?? (isRestDay ? 'يوم راحة' : 'تمرين'),
          category: dayData['category'] ?? (isRestDay ? 'rest' : 'strength'),
          estimatedMinutes: dayData['estimatedMinutes'] ?? 0,
          estimatedCaloriesBurn: dayData['estimatedCaloriesBurn'] ?? 0,
          suggestedIntensity: dayData['suggestedIntensity'] ?? 3,
          isRestDay: isRestDay,
          targetMuscleGroups: List<String>.from(dayData['targetMuscleGroups'] ?? []),
          equipment: List<String>.from(dayData['equipment'] ?? []),
          description: dayData['description'],
          descriptionAr: dayData['descriptionAr'],
          timeOfDay: dayData['timeOfDay'],
          timeOfDayAr: dayData['timeOfDayAr'],
          warmup: _parseExerciseList(dayData['warmup']),
          exercises: _parseExerciseList(dayData['exercises']),
          cooldown: _parseExerciseList(dayData['cooldown']),
          notes: dayData['notes'],
        );
      }

      return AiWeeklyWorkoutPlanResult(
        monday: parseDay('monday'),
        tuesday: parseDay('tuesday'),
        wednesday: parseDay('wednesday'),
        thursday: parseDay('thursday'),
        friday: parseDay('friday'),
        saturday: parseDay('saturday'),
        sunday: parseDay('sunday'),
        totalWorkoutMinutes: weeklyTotals['totalWorkoutMinutes'] ?? 0,
        totalCaloriesBurn: weeklyTotals['totalCaloriesBurn'] ?? 0,
        workoutDaysCount: weeklyTotals['workoutDaysCount'] ?? 0,
        strengthDaysCount: weeklyTotals['strengthDaysCount'] ?? 0,
        cardioDaysCount: weeklyTotals['cardioDaysCount'] ?? 0,
        coachingNote: data['coachingNote'] ?? '',
        coachingNoteAr: data['coachingNoteAr'] ?? '',
        fitnessGoals: List<String>.from(data['fitnessGoals'] ?? []),
        equipmentRequired: List<String>.from(data['equipmentRequired'] ?? []),
        isAiGenerated: true,
      );
    } catch (e) {
      _talker.warning('Failed to parse weekly workout plan response: $e');
      return AiWeeklyWorkoutPlanResult.fallback();
    }
  }

  List<AiExerciseItem> _parseExerciseList(dynamic exerciseListData) {
    if (exerciseListData == null) return [];
    final list = exerciseListData as List? ?? [];

    return list.map((e) {
      final data = e as Map<String, dynamic>;
      return AiExerciseItem(
        exerciseId: data['exerciseId'],
        name: data['name'] ?? '',
        nameAr: data['nameAr'],
        muscleGroup: data['muscleGroup'],
        sets: data['sets'] ?? 3,
        reps: data['reps'],
        durationSeconds: data['durationSeconds'],
        restSeconds: data['restSeconds'] ?? 60,
        suggestedWeight: data['suggestedWeight'],
        suggestedWeightAr: data['suggestedWeightAr'],
        instruction: data['instruction'],
        instructionAr: data['instructionAr'],
        order: data['order'] ?? 0,
        isSupersetWithNext: data['isSupersetWithNext'] ?? false,
        equipment: data['equipment'],
      );
    }).toList();
  }

  // ============ GENERIC CONTENT GENERATION ============

  @override
  Future<String?> generateContent(String prompt) async {
    try {
      _talker.debug('Generating content with prompt (${prompt.length} chars)');
      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text;
      _talker.debug('Generated content: ${text?.length ?? 0} chars');
      return text;
    } catch (e) {
      _talker.error('Error generating content: $e');
      return null;
    }
  }
}

// Result Classes
class DailyBriefResult {
  final int recoveryScore;
  final int readinessScore;
  final int suggestedIntensity;
  final List<String> topActions;
  final List<String> warnings;
  final String coachingText;
  final bool isAiGenerated;

  DailyBriefResult({
    required this.recoveryScore,
    required this.readinessScore,
    required this.suggestedIntensity,
    required this.topActions,
    required this.warnings,
    required this.coachingText,
    required this.isAiGenerated,
  });

  factory DailyBriefResult.fallback() => DailyBriefResult(
        recoveryScore: 50,
        readinessScore: 50,
        suggestedIntensity: 3,
        topActions: ['Log your meals', 'Get 7+ hours sleep', 'Stay active'],
        warnings: [],
        coachingText: 'Unable to generate personalized brief. Here are general tips.',
        isAiGenerated: false,
      );
}

class FoodAnalysisResult {
  final List<FoodItem> items;
  final int totalCalories;
  final int totalProtein;
  final int totalCarbs;
  final int totalFat;
  final int overallConfidence;
  final String? rawResponse;
  final String? error;

  FoodAnalysisResult({
    required this.items,
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFat,
    required this.overallConfidence,
    this.rawResponse,
    this.error,
  });

  factory FoodAnalysisResult.error(String message) => FoodAnalysisResult(
        items: [],
        totalCalories: 0,
        totalProtein: 0,
        totalCarbs: 0,
        totalFat: 0,
        overallConfidence: 0,
        error: message,
      );
}

class FoodItem {
  final String name;
  final String portion;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final int confidence;

  FoodItem({
    required this.name,
    required this.portion,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.confidence,
  });
}

class TrainingRecommendation {
  final String recommendedType;
  final int recommendedIntensity;
  final int recommendedDuration;
  final String reasoning;
  final List<String> alternatives;

  TrainingRecommendation({
    required this.recommendedType,
    required this.recommendedIntensity,
    required this.recommendedDuration,
    required this.reasoning,
    required this.alternatives,
  });

  factory TrainingRecommendation.fallback() => TrainingRecommendation(
        recommendedType: 'Light activity',
        recommendedIntensity: 3,
        recommendedDuration: 30,
        reasoning: 'General recommendation',
        alternatives: ['Walking', 'Stretching'],
      );
}

class PlateauAnalysis {
  final bool plateauDetected;
  final int? daysSincePlateau;
  final List<String> potentialCauses;
  final List<String> suggestions;
  final String analysis;

  PlateauAnalysis({
    required this.plateauDetected,
    this.daysSincePlateau,
    required this.potentialCauses,
    required this.suggestions,
    required this.analysis,
  });

  factory PlateauAnalysis.none() => PlateauAnalysis(
        plateauDetected: false,
        potentialCauses: [],
        suggestions: [],
        analysis: 'No plateau detected',
      );
}

class WeeklyReportResult {
  final String summary;
  final List<String> highlights;
  final List<String> concerns;
  final String progressAnalysis;
  final String nextWeekFocus;

  WeeklyReportResult({
    required this.summary,
    required this.highlights,
    required this.concerns,
    required this.progressAnalysis,
    required this.nextWeekFocus,
  });

  factory WeeklyReportResult.fallback() => WeeklyReportResult(
        summary: 'Unable to generate report',
        highlights: [],
        concerns: [],
        progressAnalysis: '',
        nextWeekFocus: 'Keep logging consistently',
      );
}

class RescueDayPlan {
  final String nutritionPlan;
  final String activitySuggestion;
  final String sleepTip;
  final String mindsetMessage;
  final String tomorrowNote;

  RescueDayPlan({
    required this.nutritionPlan,
    required this.activitySuggestion,
    required this.sleepTip,
    required this.mindsetMessage,
    required this.tomorrowNote,
  });

  factory RescueDayPlan.fallback() => RescueDayPlan(
        nutritionPlan: 'Eat mindfully, prioritize protein',
        activitySuggestion: 'Rest or gentle movement',
        sleepTip: 'Prioritize early sleep tonight',
        mindsetMessage: 'One day doesn\'t define your journey',
        tomorrowNote: 'Tomorrow is a new opportunity',
      );
}

class PhotoComparisonResult {
  final String insights;
  final List<String> detectedChanges;
  final String encouragement;
  final String? error;

  PhotoComparisonResult({
    required this.insights,
    required this.detectedChanges,
    required this.encouragement,
    this.error,
  });

  factory PhotoComparisonResult.error(String message) => PhotoComparisonResult(
        insights: '',
        detectedChanges: [],
        encouragement: '',
        error: message,
      );
}

// Context Classes for Service Methods
class DailyBriefContext {
  final double? sleepHours;
  final int? hrv;
  final int? restingHR;
  final int? stepsYesterday;
  final String? weightTrend;
  final String? eatingWindowStart;
  final String? eatingWindowEnd;
  final AppLanguage language;

  DailyBriefContext({
    this.sleepHours,
    this.hrv,
    this.restingHR,
    this.stepsYesterday,
    this.weightTrend,
    this.eatingWindowStart,
    this.eatingWindowEnd,
    this.language = AppLanguage.arabic,
  });
}

class RecoveryContext {
  final int recoveryScore;
  final List<WorkoutLog> recentWorkouts;
  final List<String> constraints;
  final String weeklyPlan;

  RecoveryContext({
    required this.recoveryScore,
    required this.recentWorkouts,
    required this.constraints,
    required this.weeklyPlan,
  });
}

class WeeklyReportContext {
  final int daysLogged;
  final int avgCalories;
  final int avgProtein;
  final double avgSleep;
  final int workoutsCompleted;
  final double weightChange;
  final int protocolAdherence;
  final AppLanguage language;

  WeeklyReportContext({
    required this.daysLogged,
    required this.avgCalories,
    required this.avgProtein,
    required this.avgSleep,
    required this.workoutsCompleted,
    required this.weightChange,
    required this.protocolAdherence,
    this.language = AppLanguage.arabic,
  });
}

class RescueDayContext {
  final int moodEnergy;
  final int stress;
  final int recoveryScore;
  final String? reason;

  RescueDayContext({
    required this.moodEnergy,
    required this.stress,
    required this.recoveryScore,
    this.reason,
  });
}

// ============ NEW CONTEXT AND RESULT CLASSES ============

/// Context for daily coaching recommendations
class DailyCoachingContext {
  final int recoveryScore;
  final double? yesterdayStrain;
  final double sleepDebtHours;
  final double? lastNightSleep;
  final int? sleepQuality;
  final int? hrv;
  final int? rhr;
  final List<String> upcomingGoals;
  final List<String> scheduledWorkouts;
  final List<String> activeProtocols;
  final String coachingTone; // supportive, direct, motivational

  DailyCoachingContext({
    required this.recoveryScore,
    this.yesterdayStrain,
    required this.sleepDebtHours,
    this.lastNightSleep,
    this.sleepQuality,
    this.hrv,
    this.rhr,
    this.upcomingGoals = const [],
    this.scheduledWorkouts = const [],
    this.activeProtocols = const [],
    this.coachingTone = 'supportive',
  });
}

/// Result of daily coaching analysis
class DailyCoachingResult {
  final String overallGuidance;
  final bool shouldTrain;
  final int recommendedIntensity;
  final String recommendedType;
  final int recommendedDuration;
  final String trainingReasoning;
  final List<String> trainingAlternatives;
  final List<String> recoveryProtocols;
  final String nutritionPriority;
  final String hydrationGoal;
  final String nutritionSuggestion;
  final String targetBedtime;
  final String windDownTip;
  final String sleepDebtStrategy;
  final String mindsetMessage;
  final List<String> keyMetricsToWatch;

  DailyCoachingResult({
    required this.overallGuidance,
    required this.shouldTrain,
    required this.recommendedIntensity,
    required this.recommendedType,
    required this.recommendedDuration,
    required this.trainingReasoning,
    required this.trainingAlternatives,
    required this.recoveryProtocols,
    required this.nutritionPriority,
    required this.hydrationGoal,
    required this.nutritionSuggestion,
    required this.targetBedtime,
    required this.windDownTip,
    required this.sleepDebtStrategy,
    required this.mindsetMessage,
    required this.keyMetricsToWatch,
  });

  factory DailyCoachingResult.fallback() => DailyCoachingResult(
        overallGuidance: 'Listen to your body and focus on recovery today.',
        shouldTrain: false,
        recommendedIntensity: 2,
        recommendedType: 'Light activity',
        recommendedDuration: 20,
        trainingReasoning: 'General recommendation based on average recovery.',
        trainingAlternatives: ['Walking', 'Stretching', 'Yoga'],
        recoveryProtocols: ['Hydrate well', 'Get quality sleep'],
        nutritionPriority: 'Prioritize protein intake',
        hydrationGoal: '2.5L',
        nutritionSuggestion: 'Include lean protein with each meal',
        targetBedtime: '10:00 PM',
        windDownTip: 'Avoid screens 30 minutes before bed',
        sleepDebtStrategy: 'Aim for 7-8 hours tonight',
        mindsetMessage: 'Every day is an opportunity to improve.',
        keyMetricsToWatch: ['Sleep quality', 'HRV'],
      );
}

/// Result of pattern analysis
class PatternAnalysisResult {
  final int analysisConfidence;
  final String dataQuality;
  final List<DetectedPattern> patterns;
  final List<Correlation> correlations;
  final List<String> keyInsights;
  final List<String> optimizationOpportunities;
  final List<String> warnings;
  final List<String> celebrateWins;

  PatternAnalysisResult({
    required this.analysisConfidence,
    required this.dataQuality,
    required this.patterns,
    required this.correlations,
    required this.keyInsights,
    required this.optimizationOpportunities,
    required this.warnings,
    required this.celebrateWins,
  });

  factory PatternAnalysisResult.fallback() => PatternAnalysisResult(
        analysisConfidence: 0,
        dataQuality: 'insufficient',
        patterns: [],
        correlations: [],
        keyInsights: ['Log more data to see patterns'],
        optimizationOpportunities: [],
        warnings: [],
        celebrateWins: [],
      );
}

/// A detected pattern in health data
class DetectedPattern {
  final String patternType;
  final String title;
  final String description;
  final String evidence;
  final int confidence;
  final String actionability;
  final String suggestedAction;

  DetectedPattern({
    required this.patternType,
    required this.title,
    required this.description,
    required this.evidence,
    required this.confidence,
    required this.actionability,
    required this.suggestedAction,
  });
}

/// A correlation between two health factors
class Correlation {
  final String factor1;
  final String factor2;
  final String relationship;
  final double strength;
  final String explanation;
  final int confidence;

  Correlation({
    required this.factor1,
    required this.factor2,
    required this.relationship,
    required this.strength,
    required this.explanation,
    required this.confidence,
  });
}

// ============ NEW RESULT CLASSES FOR DIET, ACTIVITY, AND WORKOUT ============

/// Result from AI Egyptian meal suggestions
class AiMealSuggestionResult {
  final List<MealSuggestionData> suggestions;
  final String? overallReasoning;
  final List<String> tips;
  final int confidence;
  final bool isAiGenerated;

  AiMealSuggestionResult({
    required this.suggestions,
    this.overallReasoning,
    this.tips = const [],
    required this.confidence,
    this.isAiGenerated = true,
  });

  factory AiMealSuggestionResult.empty() => AiMealSuggestionResult(
        suggestions: [],
        confidence: 0,
        isAiGenerated: false,
      );
}

/// Data class for a single meal suggestion
class MealSuggestionData {
  final String name;
  final String nameEn;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final String? servingSize;
  final String? reasoning;
  final int fitScore;
  final List<String> tags;
  final bool isHighProtein;
  final bool isVegetarian;
  final bool isLowCarb;
  final String? timing;
  final String? notes;

  MealSuggestionData({
    required this.name,
    required this.nameEn,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.servingSize,
    this.reasoning,
    this.fitScore = 50,
    this.tags = const [],
    this.isHighProtein = false,
    this.isVegetarian = false,
    this.isLowCarb = false,
    this.timing,
    this.notes,
  });
}

/// Result from AI activity recommendation
class AiActivityRecommendationResult {
  final String recommendationType;
  final String primaryRecommendation;
  final List<String> alternativeActivities;
  final String? reasoning;
  final double targetStrainMin;
  final double targetStrainMax;
  final int suggestedDuration;
  final int suggestedIntensity;
  final List<String> warnings;
  final String? egyptianContext;
  final int confidence;
  final bool isAiGenerated;

  AiActivityRecommendationResult({
    required this.recommendationType,
    required this.primaryRecommendation,
    this.alternativeActivities = const [],
    this.reasoning,
    this.targetStrainMin = 0,
    this.targetStrainMax = 21,
    this.suggestedDuration = 30,
    this.suggestedIntensity = 5,
    this.warnings = const [],
    this.egyptianContext,
    required this.confidence,
    this.isAiGenerated = true,
  });

  factory AiActivityRecommendationResult.empty() => AiActivityRecommendationResult(
        recommendationType: 'moderate',
        primaryRecommendation: 'Unable to generate recommendation',
        confidence: 0,
        isAiGenerated: false,
      );
}

/// Result from AI workout classification
class WorkoutClassification {
  final String primaryType;
  final double confidence;
  final List<ClassificationAlternativeData> alternatives;
  final String? reasoning;
  final bool isAiClassified;

  WorkoutClassification({
    required this.primaryType,
    required this.confidence,
    this.alternatives = const [],
    this.reasoning,
    this.isAiClassified = false,
  });
}

/// Alternative workout classification
class ClassificationAlternativeData {
  final String type;
  final double confidence;

  ClassificationAlternativeData({
    required this.type,
    required this.confidence,
  });
}

/// Result from AI daily meal plan generation
class AiDailyMealPlanResult {
  final MealSuggestionData? breakfast;
  final MealSuggestionData? lunch;
  final MealSuggestionData? dinner;
  final List<MealSuggestionData> snacks;
  final int totalCalories;
  final int totalProtein;
  final int totalCarbs;
  final int totalFat;
  final int overallFitScore;
  final String? coachingNote;
  final String? hydrationGoal;
  final String? preWorkoutSuggestion;
  final String? postWorkoutSuggestion;
  final bool isAiGenerated;
  final int confidence;

  AiDailyMealPlanResult({
    this.breakfast,
    this.lunch,
    this.dinner,
    this.snacks = const [],
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFat,
    required this.overallFitScore,
    this.coachingNote,
    this.hydrationGoal,
    this.preWorkoutSuggestion,
    this.postWorkoutSuggestion,
    this.isAiGenerated = true,
    this.confidence = 75,
  });

  factory AiDailyMealPlanResult.fallback() => AiDailyMealPlanResult(
        totalCalories: 0,
        totalProtein: 0,
        totalCarbs: 0,
        totalFat: 0,
        overallFitScore: 0,
        coachingNote: 'Unable to generate meal plan. Please try again.',
        isAiGenerated: false,
        confidence: 0,
      );

  /// Get all meals as a list
  List<MealSuggestionData> get allMeals {
    final meals = <MealSuggestionData>[];
    if (breakfast != null) meals.add(breakfast!);
    if (lunch != null) meals.add(lunch!);
    if (dinner != null) meals.add(dinner!);
    meals.addAll(snacks);
    return meals;
  }
}

/// Result from diet-aware workout recommendation
class DietAwareWorkoutResult {
  final String recommendedWorkout;
  final String? recommendedWorkoutId;
  final int intensity; // 1-5
  final int estimatedCaloriesBurn;
  final String reasoning;
  final String? reasoningAr; // Arabic reasoning
  final List<String> warnings;
  final String? alternativeIfTired;
  final String? nutritionInsight;
  final String? recoveryInsight;
  final bool isAiGenerated;
  final int confidence;

  DietAwareWorkoutResult({
    required this.recommendedWorkout,
    this.recommendedWorkoutId,
    required this.intensity,
    required this.estimatedCaloriesBurn,
    required this.reasoning,
    this.reasoningAr,
    this.warnings = const [],
    this.alternativeIfTired,
    this.nutritionInsight,
    this.recoveryInsight,
    this.isAiGenerated = true,
    this.confidence = 70,
  });

  factory DietAwareWorkoutResult.fallback() => DietAwareWorkoutResult(
        recommendedWorkout: 'Moderate Activity',
        intensity: 3,
        estimatedCaloriesBurn: 200,
        reasoning: 'Unable to generate personalized recommendation. Consider a moderate workout based on how you feel.',
        isAiGenerated: false,
        confidence: 0,
      );

  /// Fallback for health-only recommendations (no nutrition data)
  factory DietAwareWorkoutResult.healthOnlyFallback({
    int? recoveryScore,
    double? strainScore,
    double? sleepHours,
  }) {
    String workout;
    int intensity;
    String reasoning;
    List<String> warnings = [];

    // Rule-based logic using health data only
    if (recoveryScore != null && recoveryScore < 40) {
      workout = 'Rest Day / Light Stretch';
      intensity = 1;
      reasoning = 'Your recovery score is low ($recoveryScore%). Focus on rest and recovery today.';
      warnings.add('Low recovery - prioritize rest');
    } else if (sleepHours != null && sleepHours < 6) {
      workout = 'Light Walk (20 min)';
      intensity = 2;
      reasoning = 'You didn\'t get enough sleep (${sleepHours.toStringAsFixed(1)}h). Keep activity light.';
      warnings.add('Poor sleep - avoid intense exercise');
    } else if (strainScore != null && strainScore > 15) {
      workout = 'Active Recovery / Yoga';
      intensity = 2;
      reasoning = 'Your strain is already high (${strainScore.toStringAsFixed(1)}). Focus on recovery.';
      warnings.add('High strain - avoid adding more intensity');
    } else if (recoveryScore != null && recoveryScore >= 70) {
      workout = 'Strength Training';
      intensity = 4;
      reasoning = 'Your recovery is excellent ($recoveryScore%). Great day for strength training!';
    } else if (recoveryScore != null && recoveryScore >= 50) {
      workout = 'Moderate Cardio (30 min)';
      intensity = 3;
      reasoning = 'Good recovery ($recoveryScore%). A moderate workout would be beneficial.';
    } else {
      workout = 'Light Activity (20 min)';
      intensity = 2;
      reasoning = 'Based on your health data, keep activity moderate today.';
    }

    return DietAwareWorkoutResult(
      recommendedWorkout: workout,
      intensity: intensity,
      estimatedCaloriesBurn: intensity * 80,
      reasoning: reasoning,
      warnings: warnings,
      alternativeIfTired: '10-minute stretch routine',
      recoveryInsight: recoveryScore != null
          ? 'Recovery: $recoveryScore%'
          : null,
      isAiGenerated: false,
      confidence: 50,
    );
  }
}

// ============ WEEKLY MEAL PLAN RESULT CLASSES ============

/// Result from AI weekly meal plan generation
class AiWeeklyMealPlanResult {
  final AiDayMealPlan? monday;
  final AiDayMealPlan? tuesday;
  final AiDayMealPlan? wednesday;
  final AiDayMealPlan? thursday;
  final AiDayMealPlan? friday;
  final AiDayMealPlan? saturday;
  final AiDayMealPlan? sunday;
  final int totalCalories;
  final int totalProtein;
  final int totalCarbs;
  final int totalFat;
  final int averageDailyCalories;
  final int averageDailyProtein;
  final String coachingNote;
  final String coachingNoteEn;
  final int fitScore;
  final String hydrationGoal;
  final bool isAiGenerated;

  AiWeeklyMealPlanResult({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFat,
    required this.averageDailyCalories,
    required this.averageDailyProtein,
    required this.coachingNote,
    required this.coachingNoteEn,
    required this.fitScore,
    required this.hydrationGoal,
    this.isAiGenerated = true,
  });

  /// Get all days as a list
  List<AiDayMealPlan?> get days => [
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
        sunday,
      ];

  /// Get day by index (0 = Monday)
  AiDayMealPlan? getDay(int index) {
    if (index < 0 || index > 6) return null;
    return days[index];
  }

  /// Count of planned days
  int get plannedDaysCount => days.where((d) => d != null).length;

  factory AiWeeklyMealPlanResult.fallback() => AiWeeklyMealPlanResult(
        totalCalories: 0,
        totalProtein: 0,
        totalCarbs: 0,
        totalFat: 0,
        averageDailyCalories: 0,
        averageDailyProtein: 0,
        coachingNote: 'تعذر إنشاء خطة الوجبات. حاول مرة أخرى.',
        coachingNoteEn: 'Unable to generate meal plan. Please try again.',
        fitScore: 0,
        hydrationGoal: '2.5L',
        isAiGenerated: false,
      );
}

/// A single day's meal plan in the weekly plan
class AiDayMealPlan {
  final String dayName;
  final bool isWorkoutDay;
  final bool isStrengthDay;
  final int targetCalories;
  final int targetProtein;
  final AiMealItem? breakfast;
  final AiMealItem? lunch;
  final AiMealItem? dinner;
  final List<AiMealItem> snacks;
  final int totalCalories;
  final int totalProtein;
  final int totalCarbs;
  final int totalFat;
  final String? dayNote;

  AiDayMealPlan({
    required this.dayName,
    this.isWorkoutDay = false,
    this.isStrengthDay = false,
    required this.targetCalories,
    required this.targetProtein,
    this.breakfast,
    this.lunch,
    this.dinner,
    this.snacks = const [],
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFat,
    this.dayNote,
  });
}

/// A single meal item in the meal plan
class AiMealItem {
  final String name;
  final String nameEn;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final String servingSize;
  final String? timing;
  final String? notes;

  AiMealItem({
    required this.name,
    required this.nameEn,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.servingSize,
    this.timing,
    this.notes,
  });
}

// ============ WEEKLY WORKOUT PLAN RESULT CLASSES ============

/// Result from AI weekly workout plan generation
class AiWeeklyWorkoutPlanResult {
  final AiDayWorkoutPlan? monday;
  final AiDayWorkoutPlan? tuesday;
  final AiDayWorkoutPlan? wednesday;
  final AiDayWorkoutPlan? thursday;
  final AiDayWorkoutPlan? friday;
  final AiDayWorkoutPlan? saturday;
  final AiDayWorkoutPlan? sunday;
  final int totalWorkoutMinutes;
  final int totalCaloriesBurn;
  final int workoutDaysCount;
  final int strengthDaysCount;
  final int cardioDaysCount;
  final String coachingNote;
  final String coachingNoteAr;
  final List<String> fitnessGoals;
  final List<String> equipmentRequired;
  final bool isAiGenerated;

  AiWeeklyWorkoutPlanResult({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    required this.totalWorkoutMinutes,
    required this.totalCaloriesBurn,
    required this.workoutDaysCount,
    required this.strengthDaysCount,
    required this.cardioDaysCount,
    required this.coachingNote,
    required this.coachingNoteAr,
    this.fitnessGoals = const [],
    this.equipmentRequired = const [],
    this.isAiGenerated = true,
  });

  /// Get all days as a list
  List<AiDayWorkoutPlan?> get days => [
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
        sunday,
      ];

  /// Get day by index (0 = Monday)
  AiDayWorkoutPlan? getDay(int index) {
    if (index < 0 || index > 6) return null;
    return days[index];
  }

  /// Count of planned workout days (non-rest)
  int get plannedDaysCount =>
      days.where((d) => d != null && !d.isRestDay).length;

  /// Count of rest days
  int get restDaysCount =>
      days.where((d) => d == null || d.isRestDay).length;

  factory AiWeeklyWorkoutPlanResult.fallback() => AiWeeklyWorkoutPlanResult(
        totalWorkoutMinutes: 0,
        totalCaloriesBurn: 0,
        workoutDaysCount: 0,
        strengthDaysCount: 0,
        cardioDaysCount: 0,
        coachingNote: 'Unable to generate workout plan. Please try again.',
        coachingNoteAr: 'تعذر إنشاء خطة التمارين. حاول مرة أخرى.',
        isAiGenerated: false,
      );
}

/// A single day's workout plan
class AiDayWorkoutPlan {
  final String workoutName;
  final String? workoutNameAr;
  final String category; // strength, cardio, hiit, flexibility, rest
  final int estimatedMinutes;
  final int estimatedCaloriesBurn;
  final int suggestedIntensity; // 1-5
  final bool isRestDay;
  final List<String> targetMuscleGroups;
  final List<String> equipment;
  final String? description;
  final String? descriptionAr;
  final String? timeOfDay;
  final String? timeOfDayAr;
  final List<AiExerciseItem> warmup;
  final List<AiExerciseItem> exercises;
  final List<AiExerciseItem> cooldown;
  final String? notes;

  AiDayWorkoutPlan({
    required this.workoutName,
    this.workoutNameAr,
    required this.category,
    required this.estimatedMinutes,
    required this.estimatedCaloriesBurn,
    this.suggestedIntensity = 3,
    this.isRestDay = false,
    this.targetMuscleGroups = const [],
    this.equipment = const [],
    this.description,
    this.descriptionAr,
    this.timeOfDay,
    this.timeOfDayAr,
    this.warmup = const [],
    this.exercises = const [],
    this.cooldown = const [],
    this.notes,
  });

  /// Total number of exercises (including warmup and cooldown)
  int get totalExerciseCount =>
      warmup.length + exercises.length + cooldown.length;

  /// Is this a strength training workout?
  bool get isStrengthTraining => category.toLowerCase() == 'strength';

  /// Is this a cardio workout?
  bool get isCardio => category.toLowerCase() == 'cardio';

  /// Is this HIIT?
  bool get isHiit => category.toLowerCase() == 'hiit';

  /// Is this a flexibility workout?
  bool get isFlexibility =>
      category.toLowerCase() == 'flexibility' ||
      category.toLowerCase() == 'recovery';
}

/// A single exercise in the workout plan
class AiExerciseItem {
  final String? exerciseId; // Links to exercise library
  final String name;
  final String? nameAr;
  final String? muscleGroup;
  final int sets;
  final int? reps;
  final int? durationSeconds;
  final int restSeconds;
  final String? suggestedWeight;
  final String? suggestedWeightAr;
  final String? instruction;
  final String? instructionAr;
  final int order;
  final bool isSupersetWithNext;
  final String? equipment;

  AiExerciseItem({
    this.exerciseId,
    required this.name,
    this.nameAr,
    this.muscleGroup,
    required this.sets,
    this.reps,
    this.durationSeconds,
    this.restSeconds = 60,
    this.suggestedWeight,
    this.suggestedWeightAr,
    this.instruction,
    this.instructionAr,
    this.order = 0,
    this.isSupersetWithNext = false,
    this.equipment,
  });

  /// Is this a timed exercise?
  bool get isTimed => durationSeconds != null && durationSeconds! > 0;

  /// Is this a rep-based exercise?
  bool get isRepBased => reps != null && reps! > 0;

  /// Display format for sets/reps (e.g., "4x10" or "3x30s")
  String get setsRepsDisplay {
    if (isTimed) {
      return '${sets}x${durationSeconds}s';
    } else if (isRepBased) {
      return '${sets}x$reps';
    }
    return '$sets sets';
  }
}
