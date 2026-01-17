import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'journal_behavior.freezed.dart';
part 'journal_behavior.g.dart';

/// Behavior category enum
@JsonEnum()
enum BehaviorCategory {
  @JsonValue('diet')
  diet,
  @JsonValue('sleep')
  sleep,
  @JsonValue('activity')
  activity,
  @JsonValue('wellness')
  wellness,
  @JsonValue('symptoms')
  symptoms,
  @JsonValue('supplements')
  supplements,
  @JsonValue('medications')
  medications,
  @JsonValue('womens_health')
  womensHealth,
  @JsonValue('social')
  social,
  @JsonValue('mental')
  mental,
}

/// Extension for category helpers
extension BehaviorCategoryExtension on BehaviorCategory {
  String get displayName {
    switch (this) {
      case BehaviorCategory.diet:
        return 'Diet';
      case BehaviorCategory.sleep:
        return 'Sleep';
      case BehaviorCategory.activity:
        return 'Activity';
      case BehaviorCategory.wellness:
        return 'Wellness';
      case BehaviorCategory.symptoms:
        return 'Symptoms';
      case BehaviorCategory.supplements:
        return 'Supplements';
      case BehaviorCategory.medications:
        return 'Medications';
      case BehaviorCategory.womensHealth:
        return "Women's Health";
      case BehaviorCategory.social:
        return 'Social';
      case BehaviorCategory.mental:
        return 'Mental';
    }
  }

  IconData get icon {
    switch (this) {
      case BehaviorCategory.diet:
        return Icons.restaurant;
      case BehaviorCategory.sleep:
        return Icons.bedtime;
      case BehaviorCategory.activity:
        return Icons.fitness_center;
      case BehaviorCategory.wellness:
        return Icons.spa;
      case BehaviorCategory.symptoms:
        return Icons.healing;
      case BehaviorCategory.supplements:
        return Icons.medication;
      case BehaviorCategory.medications:
        return Icons.medical_services;
      case BehaviorCategory.womensHealth:
        return Icons.favorite;
      case BehaviorCategory.social:
        return Icons.people;
      case BehaviorCategory.mental:
        return Icons.psychology;
    }
  }

  Color get color {
    switch (this) {
      case BehaviorCategory.diet:
        return const Color(0xFF4CAF50);
      case BehaviorCategory.sleep:
        return const Color(0xFF3F51B5);
      case BehaviorCategory.activity:
        return const Color(0xFFFF5722);
      case BehaviorCategory.wellness:
        return const Color(0xFF9C27B0);
      case BehaviorCategory.symptoms:
        return const Color(0xFFF44336);
      case BehaviorCategory.supplements:
        return const Color(0xFF00BCD4);
      case BehaviorCategory.medications:
        return const Color(0xFF607D8B);
      case BehaviorCategory.womensHealth:
        return const Color(0xFFE91E63);
      case BehaviorCategory.social:
        return const Color(0xFFFFEB3B);
      case BehaviorCategory.mental:
        return const Color(0xFF795548);
    }
  }
}

/// Input type for behavior logging
enum BehaviorInputType {
  /// Simple toggle (yes/no)
  toggle,

  /// Numeric value input
  numeric,

  /// Duration in minutes
  duration,

  /// Intensity scale (1-5)
  intensity,

  /// Time picker
  time,

  /// Custom options selection
  options,
}

/// A behavior definition (predefined or custom)
@freezed
class JournalBehavior with _$JournalBehavior {
  const factory JournalBehavior({
    required String id,
    required String name,
    required BehaviorCategory category,
    required BehaviorInputType inputType,
    String? icon,
    String? unit,
    double? minValue,
    double? maxValue,
    double? defaultValue,
    @Default([]) List<String> options,
    String? description,
    @Default(false) bool isCustom,
    @Default(true) bool isActive,

    /// Whether this behavior typically has a positive or negative correlation with recovery
    /// true = positive correlation (e.g., meditation improves recovery)
    /// false = negative correlation (e.g., alcohol hurts recovery)
    /// null = neutral or context-dependent
    bool? isPositiveForRecovery,
  }) = _JournalBehavior;

  factory JournalBehavior.fromJson(Map<String, dynamic> json) =>
      _$JournalBehaviorFromJson(json);
}

/// Static class containing all predefined behaviors
class JournalBehaviors {
  JournalBehaviors._();

  // ==================== DIET BEHAVIORS ====================

  static const caffeine = JournalBehavior(
    id: 'diet_caffeine',
    name: 'Caffeine',
    category: BehaviorCategory.diet,
    inputType: BehaviorInputType.numeric,
    icon: 'coffee',
    unit: 'mg',
    minValue: 0,
    maxValue: 1000,
    defaultValue: 100,
    description: 'Total caffeine consumed',
    isPositiveForRecovery: false,
  );

  static const alcohol = JournalBehavior(
    id: 'diet_alcohol',
    name: 'Alcohol',
    category: BehaviorCategory.diet,
    inputType: BehaviorInputType.numeric,
    icon: 'wine_bar',
    unit: 'drinks',
    minValue: 0,
    maxValue: 20,
    defaultValue: 1,
    description: 'Number of alcoholic drinks',
    isPositiveForRecovery: false,
  );

  static const sugar = JournalBehavior(
    id: 'diet_sugar',
    name: 'High Sugar',
    category: BehaviorCategory.diet,
    inputType: BehaviorInputType.toggle,
    icon: 'cake',
    description: 'Consumed high sugar foods/drinks',
    isPositiveForRecovery: false,
  );

  static const processedFood = JournalBehavior(
    id: 'diet_processed',
    name: 'Processed Food',
    category: BehaviorCategory.diet,
    inputType: BehaviorInputType.toggle,
    icon: 'fastfood',
    description: 'Ate highly processed foods',
    isPositiveForRecovery: false,
  );

  static const hydration = JournalBehavior(
    id: 'diet_hydration',
    name: 'Water Intake',
    category: BehaviorCategory.diet,
    inputType: BehaviorInputType.numeric,
    icon: 'water_drop',
    unit: 'L',
    minValue: 0,
    maxValue: 10,
    defaultValue: 2.0,
    description: 'Total water consumed',
    isPositiveForRecovery: true,
  );

  static const mealTiming = JournalBehavior(
    id: 'diet_meal_timing',
    name: 'Late Meal',
    category: BehaviorCategory.diet,
    inputType: BehaviorInputType.toggle,
    icon: 'schedule',
    description: 'Ate within 3 hours of bedtime',
    isPositiveForRecovery: false,
  );

  static const fasting = JournalBehavior(
    id: 'diet_fasting',
    name: 'Intermittent Fasting',
    category: BehaviorCategory.diet,
    inputType: BehaviorInputType.toggle,
    icon: 'timer',
    description: 'Followed fasting protocol',
    isPositiveForRecovery: true,
  );

  static const vegetables = JournalBehavior(
    id: 'diet_vegetables',
    name: 'Vegetables',
    category: BehaviorCategory.diet,
    inputType: BehaviorInputType.numeric,
    icon: 'eco',
    unit: 'servings',
    minValue: 0,
    maxValue: 15,
    defaultValue: 3,
    description: 'Vegetable servings consumed',
    isPositiveForRecovery: true,
  );

  static const protein = JournalBehavior(
    id: 'diet_protein',
    name: 'High Protein',
    category: BehaviorCategory.diet,
    inputType: BehaviorInputType.toggle,
    icon: 'egg',
    description: 'Hit protein target',
    isPositiveForRecovery: true,
  );

  // ==================== SLEEP BEHAVIORS ====================

  static const lateScreenTime = JournalBehavior(
    id: 'sleep_screen',
    name: 'Late Screen Time',
    category: BehaviorCategory.sleep,
    inputType: BehaviorInputType.toggle,
    icon: 'phone_android',
    description: 'Screen use within 1 hour of bed',
    isPositiveForRecovery: false,
  );

  static const roomTemperature = JournalBehavior(
    id: 'sleep_temp',
    name: 'Room Temperature',
    category: BehaviorCategory.sleep,
    inputType: BehaviorInputType.options,
    icon: 'thermostat',
    options: ['Too Hot', 'Perfect', 'Too Cold'],
    description: 'Bedroom temperature comfort',
  );

  static const bedTimeConsistency = JournalBehavior(
    id: 'sleep_consistency',
    name: 'Consistent Bed Time',
    category: BehaviorCategory.sleep,
    inputType: BehaviorInputType.toggle,
    icon: 'schedule',
    description: 'Went to bed within 30 min of usual time',
    isPositiveForRecovery: true,
  );

  static const nap = JournalBehavior(
    id: 'sleep_nap',
    name: 'Nap',
    category: BehaviorCategory.sleep,
    inputType: BehaviorInputType.duration,
    icon: 'airline_seat_flat',
    description: 'Daytime nap duration',
  );

  static const sleepAids = JournalBehavior(
    id: 'sleep_aids',
    name: 'Sleep Aids',
    category: BehaviorCategory.sleep,
    inputType: BehaviorInputType.toggle,
    icon: 'nights_stay',
    description: 'Used sleep aid supplements/medication',
  );

  static const nightWaking = JournalBehavior(
    id: 'sleep_waking',
    name: 'Night Waking',
    category: BehaviorCategory.sleep,
    inputType: BehaviorInputType.numeric,
    icon: 'visibility',
    unit: 'times',
    minValue: 0,
    maxValue: 10,
    defaultValue: 0,
    description: 'Number of times woken up',
    isPositiveForRecovery: false,
  );

  // ==================== ACTIVITY BEHAVIORS ====================

  static const strengthTraining = JournalBehavior(
    id: 'activity_strength',
    name: 'Strength Training',
    category: BehaviorCategory.activity,
    inputType: BehaviorInputType.duration,
    icon: 'fitness_center',
    description: 'Weight/resistance training session',
    isPositiveForRecovery: true,
  );

  static const cardio = JournalBehavior(
    id: 'activity_cardio',
    name: 'Cardio',
    category: BehaviorCategory.activity,
    inputType: BehaviorInputType.duration,
    icon: 'directions_run',
    description: 'Cardiovascular exercise',
    isPositiveForRecovery: true,
  );

  static const stretching = JournalBehavior(
    id: 'activity_stretching',
    name: 'Stretching/Yoga',
    category: BehaviorCategory.activity,
    inputType: BehaviorInputType.duration,
    icon: 'self_improvement',
    description: 'Stretching or yoga session',
    isPositiveForRecovery: true,
  );

  static const steps = JournalBehavior(
    id: 'activity_steps',
    name: 'Daily Steps',
    category: BehaviorCategory.activity,
    inputType: BehaviorInputType.numeric,
    icon: 'directions_walk',
    unit: 'steps',
    minValue: 0,
    maxValue: 50000,
    defaultValue: 8000,
    description: 'Total steps today',
    isPositiveForRecovery: true,
  );

  static const hiit = JournalBehavior(
    id: 'activity_hiit',
    name: 'HIIT',
    category: BehaviorCategory.activity,
    inputType: BehaviorInputType.duration,
    icon: 'speed',
    description: 'High intensity interval training',
    isPositiveForRecovery: true,
  );

  static const swimming = JournalBehavior(
    id: 'activity_swimming',
    name: 'Swimming',
    category: BehaviorCategory.activity,
    inputType: BehaviorInputType.duration,
    icon: 'pool',
    description: 'Swimming session',
    isPositiveForRecovery: true,
  );

  static const cycling = JournalBehavior(
    id: 'activity_cycling',
    name: 'Cycling',
    category: BehaviorCategory.activity,
    inputType: BehaviorInputType.duration,
    icon: 'pedal_bike',
    description: 'Cycling/biking activity',
    isPositiveForRecovery: true,
  );

  static const sedentary = JournalBehavior(
    id: 'activity_sedentary',
    name: 'Sedentary Day',
    category: BehaviorCategory.activity,
    inputType: BehaviorInputType.toggle,
    icon: 'weekend',
    description: 'Mostly sitting/inactive',
    isPositiveForRecovery: false,
  );

  // ==================== WELLNESS BEHAVIORS ====================

  static const meditation = JournalBehavior(
    id: 'wellness_meditation',
    name: 'Meditation',
    category: BehaviorCategory.wellness,
    inputType: BehaviorInputType.duration,
    icon: 'self_improvement',
    description: 'Meditation or mindfulness',
    isPositiveForRecovery: true,
  );

  static const coldExposure = JournalBehavior(
    id: 'wellness_cold',
    name: 'Cold Exposure',
    category: BehaviorCategory.wellness,
    inputType: BehaviorInputType.duration,
    icon: 'ac_unit',
    description: 'Cold shower/ice bath',
    isPositiveForRecovery: true,
  );

  static const sauna = JournalBehavior(
    id: 'wellness_sauna',
    name: 'Sauna',
    category: BehaviorCategory.wellness,
    inputType: BehaviorInputType.duration,
    icon: 'hot_tub',
    description: 'Sauna session',
    isPositiveForRecovery: true,
  );

  static const massage = JournalBehavior(
    id: 'wellness_massage',
    name: 'Massage',
    category: BehaviorCategory.wellness,
    inputType: BehaviorInputType.toggle,
    icon: 'back_hand',
    description: 'Had a massage',
    isPositiveForRecovery: true,
  );

  static const breathing = JournalBehavior(
    id: 'wellness_breathing',
    name: 'Breathing Exercise',
    category: BehaviorCategory.wellness,
    inputType: BehaviorInputType.duration,
    icon: 'air',
    description: 'Breathing exercises (Wim Hof, box breathing)',
    isPositiveForRecovery: true,
  );

  static const sunlight = JournalBehavior(
    id: 'wellness_sunlight',
    name: 'Morning Sunlight',
    category: BehaviorCategory.wellness,
    inputType: BehaviorInputType.toggle,
    icon: 'wb_sunny',
    description: 'Got morning sunlight exposure',
    isPositiveForRecovery: true,
  );

  static const journaling = JournalBehavior(
    id: 'wellness_journaling',
    name: 'Journaling',
    category: BehaviorCategory.wellness,
    inputType: BehaviorInputType.toggle,
    icon: 'edit_note',
    description: 'Written journaling session',
    isPositiveForRecovery: true,
  );

  static const gratitude = JournalBehavior(
    id: 'wellness_gratitude',
    name: 'Gratitude Practice',
    category: BehaviorCategory.wellness,
    inputType: BehaviorInputType.toggle,
    icon: 'volunteer_activism',
    description: 'Practiced gratitude',
    isPositiveForRecovery: true,
  );

  static const foamRolling = JournalBehavior(
    id: 'wellness_foam',
    name: 'Foam Rolling',
    category: BehaviorCategory.wellness,
    inputType: BehaviorInputType.duration,
    icon: 'sports_gymnastics',
    description: 'Foam rolling/self-myofascial release',
    isPositiveForRecovery: true,
  );

  // ==================== SYMPTOMS BEHAVIORS ====================

  static const fatigue = JournalBehavior(
    id: 'symptoms_fatigue',
    name: 'Fatigue',
    category: BehaviorCategory.symptoms,
    inputType: BehaviorInputType.intensity,
    icon: 'battery_alert',
    description: 'Level of tiredness/fatigue',
    isPositiveForRecovery: false,
  );

  static const soreness = JournalBehavior(
    id: 'symptoms_soreness',
    name: 'Muscle Soreness',
    category: BehaviorCategory.symptoms,
    inputType: BehaviorInputType.intensity,
    icon: 'accessibility_new',
    description: 'Muscle soreness level',
    isPositiveForRecovery: false,
  );

  static const headache = JournalBehavior(
    id: 'symptoms_headache',
    name: 'Headache',
    category: BehaviorCategory.symptoms,
    inputType: BehaviorInputType.intensity,
    icon: 'psychology',
    description: 'Headache severity',
    isPositiveForRecovery: false,
  );

  static const mood = JournalBehavior(
    id: 'symptoms_mood',
    name: 'Mood',
    category: BehaviorCategory.symptoms,
    inputType: BehaviorInputType.intensity,
    icon: 'mood',
    description: 'Overall mood (1=low, 5=great)',
    isPositiveForRecovery: true,
  );

  static const stress = JournalBehavior(
    id: 'symptoms_stress',
    name: 'Stress Level',
    category: BehaviorCategory.symptoms,
    inputType: BehaviorInputType.intensity,
    icon: 'sentiment_stressed',
    description: 'Stress level (1=low, 5=high)',
    isPositiveForRecovery: false,
  );

  static const anxiety = JournalBehavior(
    id: 'symptoms_anxiety',
    name: 'Anxiety',
    category: BehaviorCategory.symptoms,
    inputType: BehaviorInputType.intensity,
    icon: 'psychology_alt',
    description: 'Anxiety level',
    isPositiveForRecovery: false,
  );

  static const digestion = JournalBehavior(
    id: 'symptoms_digestion',
    name: 'Digestive Issues',
    category: BehaviorCategory.symptoms,
    inputType: BehaviorInputType.toggle,
    icon: 'sick',
    description: 'Had digestive problems',
    isPositiveForRecovery: false,
  );

  static const jointPain = JournalBehavior(
    id: 'symptoms_joint',
    name: 'Joint Pain',
    category: BehaviorCategory.symptoms,
    inputType: BehaviorInputType.intensity,
    icon: 'elderly',
    description: 'Joint pain severity',
    isPositiveForRecovery: false,
  );

  static const congestion = JournalBehavior(
    id: 'symptoms_congestion',
    name: 'Congestion',
    category: BehaviorCategory.symptoms,
    inputType: BehaviorInputType.toggle,
    icon: 'masks',
    description: 'Nasal/sinus congestion',
    isPositiveForRecovery: false,
  );

  // ==================== SUPPLEMENTS ====================

  static const multivitamin = JournalBehavior(
    id: 'supp_multivitamin',
    name: 'Multivitamin',
    category: BehaviorCategory.supplements,
    inputType: BehaviorInputType.toggle,
    icon: 'medication',
    description: 'Took multivitamin',
    isPositiveForRecovery: true,
  );

  static const vitaminD = JournalBehavior(
    id: 'supp_vitamin_d',
    name: 'Vitamin D',
    category: BehaviorCategory.supplements,
    inputType: BehaviorInputType.numeric,
    icon: 'wb_sunny',
    unit: 'IU',
    minValue: 0,
    maxValue: 10000,
    defaultValue: 2000,
    description: 'Vitamin D dosage',
    isPositiveForRecovery: true,
  );

  static const omega3 = JournalBehavior(
    id: 'supp_omega3',
    name: 'Omega-3/Fish Oil',
    category: BehaviorCategory.supplements,
    inputType: BehaviorInputType.toggle,
    icon: 'water',
    description: 'Took fish oil/omega-3',
    isPositiveForRecovery: true,
  );

  static const proteinPowder = JournalBehavior(
    id: 'supp_protein',
    name: 'Protein Powder',
    category: BehaviorCategory.supplements,
    inputType: BehaviorInputType.numeric,
    icon: 'blender',
    unit: 'g',
    minValue: 0,
    maxValue: 100,
    defaultValue: 25,
    description: 'Protein supplement amount',
    isPositiveForRecovery: true,
  );

  static const creatine = JournalBehavior(
    id: 'supp_creatine',
    name: 'Creatine',
    category: BehaviorCategory.supplements,
    inputType: BehaviorInputType.numeric,
    icon: 'fitness_center',
    unit: 'g',
    minValue: 0,
    maxValue: 20,
    defaultValue: 5,
    description: 'Creatine dosage',
    isPositiveForRecovery: true,
  );

  static const magnesium = JournalBehavior(
    id: 'supp_magnesium',
    name: 'Magnesium',
    category: BehaviorCategory.supplements,
    inputType: BehaviorInputType.numeric,
    icon: 'bolt',
    unit: 'mg',
    minValue: 0,
    maxValue: 1000,
    defaultValue: 400,
    description: 'Magnesium dosage',
    isPositiveForRecovery: true,
  );

  static const melatonin = JournalBehavior(
    id: 'supp_melatonin',
    name: 'Melatonin',
    category: BehaviorCategory.supplements,
    inputType: BehaviorInputType.numeric,
    icon: 'bedtime',
    unit: 'mg',
    minValue: 0,
    maxValue: 20,
    defaultValue: 3,
    description: 'Melatonin dosage',
  );

  static const probiotic = JournalBehavior(
    id: 'supp_probiotic',
    name: 'Probiotic',
    category: BehaviorCategory.supplements,
    inputType: BehaviorInputType.toggle,
    icon: 'biotech',
    description: 'Took probiotic',
    isPositiveForRecovery: true,
  );

  static const preWorkout = JournalBehavior(
    id: 'supp_preworkout',
    name: 'Pre-Workout',
    category: BehaviorCategory.supplements,
    inputType: BehaviorInputType.toggle,
    icon: 'flash_on',
    description: 'Took pre-workout supplement',
    isPositiveForRecovery: false,
  );

  // ==================== MEDICATIONS ====================

  static const painMedication = JournalBehavior(
    id: 'med_pain',
    name: 'Pain Medication',
    category: BehaviorCategory.medications,
    inputType: BehaviorInputType.toggle,
    icon: 'healing',
    description: 'Took pain medication (ibuprofen, etc.)',
  );

  static const antihistamine = JournalBehavior(
    id: 'med_antihistamine',
    name: 'Antihistamine',
    category: BehaviorCategory.medications,
    inputType: BehaviorInputType.toggle,
    icon: 'local_pharmacy',
    description: 'Took allergy medication',
  );

  static const prescriptionMed = JournalBehavior(
    id: 'med_prescription',
    name: 'Prescription Taken',
    category: BehaviorCategory.medications,
    inputType: BehaviorInputType.toggle,
    icon: 'medication',
    description: 'Took prescribed medication',
  );

  static const customMedication = JournalBehavior(
    id: 'med_custom',
    name: 'Other Medication',
    category: BehaviorCategory.medications,
    inputType: BehaviorInputType.toggle,
    icon: 'medical_services',
    description: 'Other medication',
    isCustom: true,
  );

  // ==================== WOMEN'S HEALTH ====================

  static const menstrualPhase = JournalBehavior(
    id: 'womens_phase',
    name: 'Menstrual Phase',
    category: BehaviorCategory.womensHealth,
    inputType: BehaviorInputType.options,
    icon: 'circle',
    options: ['Menstrual', 'Follicular', 'Ovulation', 'Luteal'],
    description: 'Current cycle phase',
  );

  static const periodDay = JournalBehavior(
    id: 'womens_period',
    name: 'Period Day',
    category: BehaviorCategory.womensHealth,
    inputType: BehaviorInputType.numeric,
    icon: 'water_drop',
    unit: 'day',
    minValue: 1,
    maxValue: 10,
    defaultValue: 1,
    description: 'Day of period',
  );

  static const cramps = JournalBehavior(
    id: 'womens_cramps',
    name: 'Cramps',
    category: BehaviorCategory.womensHealth,
    inputType: BehaviorInputType.intensity,
    icon: 'sentiment_dissatisfied',
    description: 'Cramp severity',
    isPositiveForRecovery: false,
  );

  static const bloating = JournalBehavior(
    id: 'womens_bloating',
    name: 'Bloating',
    category: BehaviorCategory.womensHealth,
    inputType: BehaviorInputType.intensity,
    icon: 'expand',
    description: 'Bloating severity',
    isPositiveForRecovery: false,
  );

  static const pmsMood = JournalBehavior(
    id: 'womens_pms_mood',
    name: 'PMS Mood',
    category: BehaviorCategory.womensHealth,
    inputType: BehaviorInputType.intensity,
    icon: 'mood_bad',
    description: 'PMS mood symptoms',
    isPositiveForRecovery: false,
  );

  // ==================== SOCIAL ====================

  static const socialInteraction = JournalBehavior(
    id: 'social_interaction',
    name: 'Social Interaction',
    category: BehaviorCategory.social,
    inputType: BehaviorInputType.duration,
    icon: 'groups',
    description: 'Time spent with others',
    isPositiveForRecovery: true,
  );

  static const qualityTime = JournalBehavior(
    id: 'social_quality',
    name: 'Quality Time',
    category: BehaviorCategory.social,
    inputType: BehaviorInputType.toggle,
    icon: 'favorite',
    description: 'Quality time with loved ones',
    isPositiveForRecovery: true,
  );

  static const isolation = JournalBehavior(
    id: 'social_isolation',
    name: 'Isolation',
    category: BehaviorCategory.social,
    inputType: BehaviorInputType.toggle,
    icon: 'person_off',
    description: 'Felt isolated today',
    isPositiveForRecovery: false,
  );

  // ==================== MENTAL ====================

  static const focusWork = JournalBehavior(
    id: 'mental_focus',
    name: 'Deep Focus Work',
    category: BehaviorCategory.mental,
    inputType: BehaviorInputType.duration,
    icon: 'psychology',
    description: 'Focused work time',
    isPositiveForRecovery: true,
  );

  static const creativity = JournalBehavior(
    id: 'mental_creativity',
    name: 'Creative Activity',
    category: BehaviorCategory.mental,
    inputType: BehaviorInputType.toggle,
    icon: 'palette',
    description: 'Engaged in creative activity',
    isPositiveForRecovery: true,
  );

  static const learning = JournalBehavior(
    id: 'mental_learning',
    name: 'Learning',
    category: BehaviorCategory.mental,
    inputType: BehaviorInputType.duration,
    icon: 'school',
    description: 'Time spent learning',
    isPositiveForRecovery: true,
  );

  static const screenTime = JournalBehavior(
    id: 'mental_screen',
    name: 'Total Screen Time',
    category: BehaviorCategory.mental,
    inputType: BehaviorInputType.numeric,
    icon: 'devices',
    unit: 'hours',
    minValue: 0,
    maxValue: 24,
    defaultValue: 4,
    description: 'Total screen time',
    isPositiveForRecovery: false,
  );

  /// Get all predefined behaviors
  static List<JournalBehavior> get all => [
        // Diet
        caffeine,
        alcohol,
        sugar,
        processedFood,
        hydration,
        mealTiming,
        fasting,
        vegetables,
        protein,
        // Sleep
        lateScreenTime,
        roomTemperature,
        bedTimeConsistency,
        nap,
        sleepAids,
        nightWaking,
        // Activity
        strengthTraining,
        cardio,
        stretching,
        steps,
        hiit,
        swimming,
        cycling,
        sedentary,
        // Wellness
        meditation,
        coldExposure,
        sauna,
        massage,
        breathing,
        sunlight,
        journaling,
        gratitude,
        foamRolling,
        // Symptoms
        fatigue,
        soreness,
        headache,
        mood,
        stress,
        anxiety,
        digestion,
        jointPain,
        congestion,
        // Supplements
        multivitamin,
        vitaminD,
        omega3,
        proteinPowder,
        creatine,
        magnesium,
        melatonin,
        probiotic,
        preWorkout,
        // Medications
        painMedication,
        antihistamine,
        prescriptionMed,
        customMedication,
        // Women's Health
        menstrualPhase,
        periodDay,
        cramps,
        bloating,
        pmsMood,
        // Social
        socialInteraction,
        qualityTime,
        isolation,
        // Mental
        focusWork,
        creativity,
        learning,
        screenTime,
      ];

  /// Get behaviors by category
  static List<JournalBehavior> getByCategory(BehaviorCategory category) {
    return all.where((b) => b.category == category).toList();
  }

  /// Get behavior by ID
  static JournalBehavior? getById(String id) {
    try {
      return all.firstWhere((b) => b.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get all categories with their behaviors
  static Map<BehaviorCategory, List<JournalBehavior>> get byCategory {
    final result = <BehaviorCategory, List<JournalBehavior>>{};
    for (final category in BehaviorCategory.values) {
      result[category] = getByCategory(category);
    }
    return result;
  }

  /// Get count of all behaviors
  static int get count => all.length;
}
