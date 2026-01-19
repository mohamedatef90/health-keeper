import 'dart:convert';

import 'package:talker/talker.dart';

import '../domain/entities/ai_brain_context.dart';
import '../domain/entities/ai_brain_decision.dart';
import 'gemini_coach_service.dart';
import 'gemini_prompts.dart';

/// Handler for AI Brain chat interactions
///
/// Processes user messages, generates AI responses with context awareness,
/// and handles action execution from chat commands.
class AiBrainChatHandler {
  final GeminiCoachService _geminiService;
  final Talker _talker;

  AiBrainChatHandler({
    required GeminiCoachService geminiService,
    required Talker talker,
  })  : _geminiService = geminiService,
        _talker = talker;

  /// Process a user message and generate AI response
  ///
  /// [message] - The user's message
  /// [context] - Current AI Brain context
  /// [conversationHistory] - Last N messages for context
  /// [language] - Preferred language ('ar' or 'en')
  Future<AiBrainChatResponse> processMessage({
    required String message,
    required AiBrainContext context,
    List<Map<String, String>> conversationHistory = const [],
    String language = 'ar',
  }) async {
    final stopwatch = Stopwatch()..start();

    try {
      // Build context map for the prompt
      final contextMap = _buildContextMap(context);

      // Build the prompt
      final prompt = GeminiPrompts.buildAiBrainChatPrompt(
        userMessage: message,
        context: contextMap,
        conversationHistory: conversationHistory,
        language: language,
      );

      _talker.debug('AI Brain Chat: Processing message: ${message.substring(0, message.length.clamp(0, 50))}...');

      // Call Gemini API
      final response = await _geminiService.generateContent(prompt);

      if (response == null || response.isEmpty) {
        throw Exception('Empty response from Gemini');
      }

      // Parse the response
      final parsedResponse = _parseResponse(response, language);

      stopwatch.stop();
      _talker.info('AI Brain Chat: Processed in ${stopwatch.elapsedMilliseconds}ms');

      return parsedResponse.copyWith(
        processingTimeMs: stopwatch.elapsedMilliseconds,
      );
    } catch (e, st) {
      stopwatch.stop();
      _talker.error('AI Brain Chat Error: $e', e, st);

      // Return fallback response
      return AiBrainChatResponse(
        content: language == 'ar'
            ? 'عذراً، حدث خطأ في معالجة رسالتك. حاول مرة أخرى.'
            : 'Sorry, there was an error processing your message. Please try again.',
        quickReplies: language == 'ar'
            ? ['حاول مرة أخرى', 'أخبرني المزيد']
            : ['Try again', 'Tell me more'],
        processingTimeMs: stopwatch.elapsedMilliseconds,
      );
    }
  }

  /// Build context map from AiBrainContext
  Map<String, dynamic> _buildContextMap(AiBrainContext context) {
    return {
      'health': {
        'recoveryScore': context.healthContext?.recoveryScore,
        'recoveryState': context.healthContext?.recoveryState,
        'strainScore': context.healthContext?.strainScore,
        'sleepDuration': context.healthContext?.sleepDuration,
        'hrv': context.healthContext?.hrv,
        'hrvBaseline': context.healthContext?.hrvBaseline,
        'restingHR': context.healthContext?.restingHR,
        'rhrBaseline': context.healthContext?.rhrBaseline,
        'steps': context.healthContext?.steps,
        'moodEnergy': context.healthContext?.moodEnergy,
        'stress': context.healthContext?.stress,
      },
      'nutrition': {
        'caloriesConsumed': context.nutritionContext?.caloriesConsumed ?? 0,
        'caloriesTarget': context.nutritionContext?.caloriesTarget ?? 2000,
        'proteinConsumed': context.nutritionContext?.proteinConsumed ?? 0,
        'proteinTarget': context.nutritionContext?.proteinTarget ?? 120,
        'mealsLoggedToday': context.nutritionContext?.mealsLoggedToday ?? 0,
        'isInEatingWindow': context.nutritionContext?.isInEatingWindow ?? true,
      },
      'plans': {
        'hasMealPlan': context.plansContext?.mealPlan != null,
        'hasWorkoutPlan': context.plansContext?.workoutPlan != null,
        'todayWorkoutType': context.plansContext?.workoutPlan?.todayWorkoutType,
        'isTodayRestDay': context.plansContext?.workoutPlan?.isTodayRestDay ?? false,
        'pendingChangesCount': context.plansContext?.pendingChanges.length ?? 0,
      },
      'trends': {
        'recoveryTrend': context.trendsContext?.recoveryTrend ?? 'stable',
        'strainTrend': context.trendsContext?.strainTrend ?? 'stable',
        'sleepTrend': context.trendsContext?.sleepTrend ?? 'stable',
        'avgRecovery': context.trendsContext?.avgRecovery,
        'avgSleep': context.trendsContext?.avgSleep,
      },
      'user': {
        'language': context.userContext?.language ?? 'ar',
        'coachingTone': context.userContext?.coachingTone ?? 'supportive',
      },
    };
  }

  /// Parse Gemini response into AiBrainChatResponse
  AiBrainChatResponse _parseResponse(String response, String language) {
    try {
      // Extract JSON from response (handle markdown code blocks)
      String jsonStr = response;
      if (response.contains('```json')) {
        final start = response.indexOf('```json') + 7;
        final end = response.indexOf('```', start);
        if (end > start) {
          jsonStr = response.substring(start, end).trim();
        }
      } else if (response.contains('```')) {
        final start = response.indexOf('```') + 3;
        final end = response.indexOf('```', start);
        if (end > start) {
          jsonStr = response.substring(start, end).trim();
        }
      }

      final json = jsonDecode(jsonStr) as Map<String, dynamic>;

      // Parse content
      final content = json['content'] as String? ?? '';

      // Parse quick replies
      List<String> quickReplies = [];
      if (json['quickReplies'] != null) {
        quickReplies = (json['quickReplies'] as List)
            .map((e) => e.toString())
            .take(3)
            .toList();
      }

      // Parse suggested action
      ChatAction? suggestedAction;
      if (json['suggestedAction'] != null &&
          json['suggestedAction']['type'] != null) {
        final actionJson = json['suggestedAction'] as Map<String, dynamic>;
        suggestedAction = ChatAction(
          type: actionJson['type'] as String,
          description: actionJson['description'] as String? ?? '',
          descriptionAr: actionJson['descriptionAr'] as String?,
          parameters: actionJson['parameters'] as Map<String, dynamic>? ?? {},
          requiresConfirmation:
              actionJson['requiresConfirmation'] as bool? ?? true,
        );
      }

      // Parse reasoning
      final reasoning = json['reasoning'] as String?;

      return AiBrainChatResponse(
        content: content,
        quickReplies: quickReplies,
        suggestedAction: suggestedAction,
        reasoning: reasoning,
      );
    } catch (e) {
      _talker.warning('Failed to parse chat response as JSON: $e');

      // If parsing fails, use the raw response as content
      return AiBrainChatResponse(
        content: response,
        quickReplies: language == 'ar'
            ? ['فهمت', 'أخبرني المزيد']
            : ['Got it', 'Tell me more'],
      );
    }
  }

  /// Generate quick contextual greeting based on time and health state
  String getContextualGreeting({
    required AiBrainContext context,
    String language = 'ar',
  }) {
    final hour = DateTime.now().hour;
    final recovery = context.healthContext?.recoveryScore ?? 50;

    if (language == 'ar') {
      String timeGreeting;
      if (hour < 12) {
        timeGreeting = 'صباح الخير';
      } else if (hour < 18) {
        timeGreeting = 'مساء الخير';
      } else {
        timeGreeting = 'مساء الخير';
      }

      String healthStatus;
      if (recovery >= 80) {
        healthStatus = 'تعافيك ممتاز اليوم ($recovery%)! جاهز للتحدي.';
      } else if (recovery >= 60) {
        healthStatus = 'تعافيك جيد ($recovery%). يوم مناسب للتمرين المعتدل.';
      } else if (recovery >= 40) {
        healthStatus = 'تعافيك متوسط ($recovery%). خذها ببساطة اليوم.';
      } else {
        healthStatus = 'تعافيك منخفض ($recovery%). ركز على الراحة اليوم.';
      }

      return '$timeGreeting! $healthStatus';
    } else {
      String timeGreeting;
      if (hour < 12) {
        timeGreeting = 'Good morning';
      } else if (hour < 18) {
        timeGreeting = 'Good afternoon';
      } else {
        timeGreeting = 'Good evening';
      }

      String healthStatus;
      if (recovery >= 80) {
        healthStatus = 'Your recovery is excellent today ($recovery%)! Ready for a challenge.';
      } else if (recovery >= 60) {
        healthStatus = 'Your recovery is good ($recovery%). Good day for moderate training.';
      } else if (recovery >= 40) {
        healthStatus = 'Your recovery is moderate ($recovery%). Take it easy today.';
      } else {
        healthStatus = 'Your recovery is low ($recovery%). Focus on rest today.';
      }

      return '$timeGreeting! $healthStatus';
    }
  }

  /// Generate suggested quick replies based on context
  List<String> getContextualQuickReplies({
    required AiBrainContext context,
    String language = 'ar',
  }) {
    final recovery = context.healthContext?.recoveryScore ?? 50;
    final hasWorkout = !(context.plansContext?.workoutPlan?.isTodayRestDay ?? true);
    final calorieProgress = context.nutritionContext?.calorieProgress ?? 0;

    if (language == 'ar') {
      final replies = <String>[];

      // Health status
      replies.add('كيف حالي اليوم؟');

      // Workout related
      if (hasWorkout) {
        if (recovery >= 60) {
          replies.add('ابدأ التمرين');
        } else {
          replies.add('هل أتمرن اليوم؟');
        }
      }

      // Nutrition related
      if (calorieProgress < 0.5) {
        replies.add('ماذا آكل؟');
      }

      // Recovery related
      if (recovery < 40) {
        replies.add('نصائح للتعافي');
      }

      return replies.take(3).toList();
    } else {
      final replies = <String>[];

      replies.add('How am I doing?');

      if (hasWorkout) {
        if (recovery >= 60) {
          replies.add('Start workout');
        } else {
          replies.add('Should I work out?');
        }
      }

      if (calorieProgress < 0.5) {
        replies.add('What should I eat?');
      }

      if (recovery < 40) {
        replies.add('Recovery tips');
      }

      return replies.take(3).toList();
    }
  }
}
