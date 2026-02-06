/// Agent types in the multi-agent system
enum AgentType {
  fitness('fitness', 'وكيل اللياقة', '🏋️'),
  nutrition('nutrition', 'وكيل التغذية', '🍽️'),
  health('health', 'وكيل الصحة', '🩺'),
  general('general', 'الوكيل العام', '🤖');

  final String id;
  final String nameAr;
  final String emoji;

  const AgentType(this.id, this.nameAr, this.emoji);
}

/// Routes user messages to the appropriate agent based on intent
class AgentRouter {
  /// Detect which agent should handle this message
  static AgentType detectIntent(String message) {
    final messageLower = message.toLowerCase();

    // Calculate scores for each agent
    final scores = {
      AgentType.fitness: _calculateFitnessScore(messageLower),
      AgentType.nutrition: _calculateNutritionScore(messageLower),
      AgentType.health: _calculateHealthScore(messageLower),
    };

    // Find highest scoring agent
    final maxScore = scores.values.reduce((a, b) => a > b ? a : b);

    // If no strong match (score < 2), default to general
    if (maxScore < 2) {
      return AgentType.general;
    }

    // Return agent with highest score
    return scores.entries
        .firstWhere((entry) => entry.value == maxScore)
        .key;
  }

  /// Detect if message requires multiple agents (returns list)
  static List<AgentType> detectMultiIntent(String message) {
    final messageLower = message.toLowerCase();

    final agents = <AgentType>[];

    if (_calculateFitnessScore(messageLower) >= 2) {
      agents.add(AgentType.fitness);
    }
    if (_calculateNutritionScore(messageLower) >= 2) {
      agents.add(AgentType.nutrition);
    }
    if (_calculateHealthScore(messageLower) >= 2) {
      agents.add(AgentType.health);
    }

    // If multiple agents detected, use general to orchestrate
    if (agents.length > 1) {
      return [AgentType.general];
    }

    // If single agent, return it
    if (agents.length == 1) {
      return agents;
    }

    // Default: general
    return [AgentType.general];
  }

  // ============================================================================
  // SCORING FUNCTIONS
  // ============================================================================

  static int _calculateFitnessScore(String message) {
    int score = 0;

    // Primary fitness keywords (high weight)
    final primaryKeywords = [
      'تمرين',
      'رياضة',
      'workout',
      'تدريب',
      'exercise',
      'gym',
      'جيم',
      'لياقة',
      'fitness',
    ];
    for (final keyword in primaryKeywords) {
      if (message.contains(keyword)) score += 3;
    }

    // Secondary fitness keywords (medium weight)
    final secondaryKeywords = [
      'عضلات',
      'قوة',
      'كارديو',
      'جري',
      'مشي',
      'سباحة',
      'دراجة',
      'كرة',
      'football',
      'cardio',
      'strength',
      'running',
      'walking',
      'vo2',
      'strain',
    ];
    for (final keyword in secondaryKeywords) {
      if (message.contains(keyword)) score += 2;
    }

    // Tertiary fitness keywords (low weight)
    final tertiaryKeywords = [
      'hiit',
      'yoga',
      'يوجا',
      'إحماء',
      'warm up',
      'تمدد',
      'stretching',
    ];
    for (final keyword in tertiaryKeywords) {
      if (message.contains(keyword)) score += 1;
    }

    return score;
  }

  static int _calculateNutritionScore(String message) {
    int score = 0;

    // Primary nutrition keywords (high weight)
    final primaryKeywords = [
      'أكل',
      'وجبة',
      'طعام',
      'meal',
      'food',
      'eat',
      'فطار',
      'غدا',
      'عشا',
      'breakfast',
      'lunch',
      'dinner',
    ];
    for (final keyword in primaryKeywords) {
      if (message.contains(keyword)) score += 3;
    }

    // Secondary nutrition keywords (medium weight)
    final secondaryKeywords = [
      'سعرات',
      'بروتين',
      'كارب',
      'دهون',
      'calories',
      'protein',
      'carbs',
      'fats',
      'macros',
      'ماكروز',
      'نظام',
      'diet',
      'رجيم',
    ];
    for (final keyword in secondaryKeywords) {
      if (message.contains(keyword)) score += 2;
    }

    // Tertiary nutrition keywords (low weight)
    final tertiaryKeywords = [
      'وصفة',
      'recipe',
      'طبخ',
      'cooking',
      'مكونات',
      'ingredients',
      'ماء',
      'water',
      'شرب',
      'drink',
    ];
    for (final keyword in tertiaryKeywords) {
      if (message.contains(keyword)) score += 1;
    }

    return score;
  }

  static int _calculateHealthScore(String message) {
    int score = 0;

    // Primary health keywords (high weight)
    final primaryKeywords = [
      'صحة',
      'health',
      'موونجارو',
      'mounjaro',
      'دواء',
      'medication',
      'علاج',
      'نوم',
      'sleep',
    ];
    for (final keyword in primaryKeywords) {
      if (message.contains(keyword)) score += 3;
    }

    // Secondary health keywords (medium weight)
    final secondaryKeywords = [
      'ضغط',
      'سكر',
      'قلب',
      'hrv',
      'أعراض',
      'symptoms',
      'تعب',
      'fatigue',
      'إجهاد',
      'استشفاء',
      'recovery',
      'blood pressure',
      'glucose',
      'heart',
    ];
    for (final keyword in secondaryKeywords) {
      if (message.contains(keyword)) score += 2;
    }

    // Tertiary health keywords (low weight)
    final tertiaryKeywords = [
      'راحة',
      'rest',
      'تحليل',
      'analysis',
      'فحص',
      'checkup',
      'صداع',
      'headache',
    ];
    for (final keyword in tertiaryKeywords) {
      if (message.contains(keyword)) score += 1;
    }

    return score;
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Get agent display name (Arabic)
  static String getAgentName(AgentType agent, {bool withEmoji = true}) {
    if (withEmoji) {
      return '${agent.emoji} ${agent.nameAr}';
    }
    return agent.nameAr;
  }

  /// Check if message is a general query (needs orchestration)
  static bool isGeneralQuery(String message) {
    final generalKeywords = [
      'خطة',
      'plan',
      'جدول',
      'schedule',
      'أسبوع',
      'week',
      'شهر',
      'month',
      'نظرة',
      'overview',
      'ملخص',
      'summary',
      'تقرير',
      'report',
      'كيف حالي',
      'how am i',
      'وضعي',
      'status',
    ];

    final messageLower = message.toLowerCase();
    return generalKeywords.any((keyword) => messageLower.contains(keyword));
  }

  /// Build agent greeting message
  static String buildGreeting(AgentType agent) {
    switch (agent) {
      case AgentType.fitness:
        return 'مرحباً! أنا وكيل اللياقة 🏋️\nأقدر أساعدك في: تصميم التمارين، تتبع الأداء، تحليل HRV، تقييم الاستشفاء.';
      case AgentType.nutrition:
        return 'أهلاً! أنا وكيل التغذية 🍽️\nأقدر أساعدك في: تخطيط الوجبات، حساب السعرات، توازن الماكروز، تحليل الأكل.';
      case AgentType.health:
        return 'مرحباً! أنا وكيل الصحة 🩺\nأقدر أساعدك في: متابعة المؤشرات الحيوية، تتبع الأدوية، تحليل النوم، نصائح صحية.';
      case AgentType.general:
        return 'أهلاً! أنا الوكيل العام 🤖\nأقدر أنسق بين كل الوكلاء التانيين عشان أجيبلك نظرة شاملة على صحتك ولياقتك.';
    }
  }
}
