import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/nutrition/domain/entities/meal_suggestion.dart';
import '../services/diet_suggestion_service.dart';
import 'providers.dart';

/// Provider for meal suggestions based on user context
///
/// Automatically generates suggestions based on time of day, remaining macros,
/// and user preferences.
final mealSuggestionsProvider = FutureProvider.autoDispose
    .family<List<MealSuggestion>, MealSuggestionContext>(
  (ref, context) async {
    final service = ref.watch(dietSuggestionServiceProvider);
    return service.suggestMeals(context);
  },
);

/// Provider for AI-enhanced meal suggestions
///
/// Uses Gemini AI to provide more personalized recommendations.
final aiMealSuggestionsProvider = FutureProvider.autoDispose
    .family<List<MealSuggestion>, MealSuggestionContext>(
  (ref, context) async {
    final service = ref.watch(dietSuggestionServiceProvider);
    return service.getAiEnhancedSuggestions(context);
  },
);

/// Provider for daily meal plan
///
/// Generates a complete day's meal plan based on targets and preferences.
final dailyMealPlanProvider = FutureProvider.autoDispose
    .family<DailyMealPlan, DailyMealPlanContext>(
  (ref, context) async {
    final service = ref.watch(dietSuggestionServiceProvider);
    return service.generateDailyPlan(context);
  },
);

/// Provider for suggestions to hit remaining macros
final remainingMacrosSuggestionsProvider = FutureProvider.autoDispose.family<
    List<MealSuggestion>,
    ({
      int remainingCalories,
      int remainingProtein,
      String mealType,
      List<String> dietaryRestrictions,
    })>(
  (ref, params) async {
    final service = ref.watch(dietSuggestionServiceProvider);
    return service.suggestForRemainingMacros(
      remainingCalories: params.remainingCalories,
      remainingProtein: params.remainingProtein,
      mealType: params.mealType,
      dietaryRestrictions: params.dietaryRestrictions,
    );
  },
);

/// State for meal suggestions UI
class MealSuggestionsState {
  final List<MealSuggestion> suggestions;
  final bool isLoading;
  final String? error;
  final MealSuggestionContext? lastContext;

  const MealSuggestionsState({
    this.suggestions = const [],
    this.isLoading = false,
    this.error,
    this.lastContext,
  });

  MealSuggestionsState copyWith({
    List<MealSuggestion>? suggestions,
    bool? isLoading,
    String? error,
    MealSuggestionContext? lastContext,
  }) {
    return MealSuggestionsState(
      suggestions: suggestions ?? this.suggestions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      lastContext: lastContext ?? this.lastContext,
    );
  }
}

/// Notifier for meal suggestions with caching and refresh
class MealSuggestionsNotifier extends StateNotifier<MealSuggestionsState> {
  final DietSuggestionService _service;

  MealSuggestionsNotifier(this._service) : super(const MealSuggestionsState());

  /// Load suggestions for the given context
  Future<void> loadSuggestions(MealSuggestionContext context) async {
    state = state.copyWith(isLoading: true, error: null, lastContext: context);

    try {
      final suggestions = await _service.suggestMeals(context);
      state = state.copyWith(suggestions: suggestions, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to load suggestions: $e',
        isLoading: false,
      );
    }
  }

  /// Load AI-enhanced suggestions
  Future<void> loadAiSuggestions(MealSuggestionContext context) async {
    state = state.copyWith(isLoading: true, error: null, lastContext: context);

    try {
      final suggestions = await _service.getAiEnhancedSuggestions(context);
      state = state.copyWith(suggestions: suggestions, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to load AI suggestions: $e',
        isLoading: false,
      );
    }
  }

  /// Refresh suggestions using last context
  Future<void> refresh() async {
    if (state.lastContext != null) {
      await loadSuggestions(state.lastContext!);
    }
  }

  /// Clear suggestions
  void clear() {
    state = const MealSuggestionsState();
  }
}

/// Provider for meal suggestions notifier
final mealSuggestionsNotifierProvider =
    StateNotifierProvider<MealSuggestionsNotifier, MealSuggestionsState>((ref) {
  final service = ref.watch(dietSuggestionServiceProvider);
  return MealSuggestionsNotifier(service);
});

/// Quick access provider for Egyptian breakfast suggestions
final egyptianBreakfastProvider =
    FutureProvider.autoDispose<List<MealSuggestion>>((ref) async {
  final service = ref.watch(dietSuggestionServiceProvider);
  return service.suggestMeals(
    const MealSuggestionContext(
      mealType: 'breakfast',
      targetCalories: 400,
      targetProtein: 20,
      preferEgyptian: true,
      language: 'ar',
    ),
  );
});

/// Quick access provider for Egyptian lunch suggestions
final egyptianLunchProvider =
    FutureProvider.autoDispose<List<MealSuggestion>>((ref) async {
  final service = ref.watch(dietSuggestionServiceProvider);
  return service.suggestMeals(
    const MealSuggestionContext(
      mealType: 'lunch',
      targetCalories: 600,
      targetProtein: 35,
      preferEgyptian: true,
      language: 'ar',
    ),
  );
});

/// Quick access provider for Egyptian dinner suggestions
final egyptianDinnerProvider =
    FutureProvider.autoDispose<List<MealSuggestion>>((ref) async {
  final service = ref.watch(dietSuggestionServiceProvider);
  return service.suggestMeals(
    const MealSuggestionContext(
      mealType: 'dinner',
      targetCalories: 500,
      targetProtein: 30,
      preferEgyptian: true,
      language: 'ar',
    ),
  );
});

/// Quick access provider for Egyptian snack suggestions
final egyptianSnacksProvider =
    FutureProvider.autoDispose<List<MealSuggestion>>((ref) async {
  final service = ref.watch(dietSuggestionServiceProvider);
  return service.suggestMeals(
    const MealSuggestionContext(
      mealType: 'snack',
      targetCalories: 200,
      targetProtein: 10,
      preferEgyptian: true,
      language: 'ar',
    ),
  );
});
