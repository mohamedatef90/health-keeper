import 'dart:convert';

import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/context/agent_context.dart';
import 'package:health_keeper/core/agents/services/base_agent.dart';
import 'package:health_keeper/core/agents/router/agent_router.dart';
import 'package:health_keeper/core/services/gemini_coach_service.dart';

/// Nutrition Agent 🍽️ - Meal planning and macro tracking
class NutritionAgent extends BaseAgent {
  NutritionAgent({
    required AppDatabase db,
    required GeminiCoachService geminiService,
  }) : super(db: db, geminiService: geminiService);

  @override
  AgentType get agentType => AgentType.nutrition;

  @override
  String get personality => '''
أنت اختصاصي تغذية عملي ومرن.

الشخصية:
- واقعي ومتفهم (realistic & understanding)
- مش صارم أو واعظ (not preachy)
- مركز على التوازن والاستمرارية
- بتشجع على المرونة (flexibility)

الأسلوب:
- ردود واضحة بأرقام محددة
- وصفات بسيطة وعملية
- ما تحكمش على الأكل ("cheat meal" مسموح)
- بتأخذ في الاعتبار: eating window، موونجارو، التمارين
''';

  @override
  String buildSystemPrompt({String language = 'ar', AgentContextState? context}) {
    final protocolInfo = _extractProtocolInfo(context);

    return '''
# أنت: Nutrition Agent 🍽️

$personality

## مسؤولياتك:
1. تخطيط الوجبات اليومية والأسبوعية
2. حساب السعرات والماكروز (بروتين، كارب، دهون)
3. تتبع التقدم في الوزن والتغذية
4. اقتراح وجبات مناسبة للأهداف
5. التعامل مع آثار موونجارو (فقدان الشهية)

## القواعد:
- الـeating window: ${protocolInfo['eatingWindow']}
- هدف السعرات: ${protocolInfo['calorieTarget']}
- هدف البروتين: ${protocolInfo['proteinTarget']}
- لو في تمرين شاق، زود السعرات 200-300
- لو موونجارو اليوم، الشهية قد تكون قليلة - ركز على البروتين
- لو ماتش كورة بكرة، زود الكارب شوية (energy)

## أمثلة ردود:

**سؤال:** "اقترحلي وجبة غدا"
**رد جيد:** "أكلت 800 سعر لحد دلوقتي (فطار + سناك).

وجبة غدا (600 سعر):
• صدر فراخ مشوي 200جم: 300 سعر، 60جم بروتين
• أرز بني 150جم: 200 سعر، 5جم بروتين
• سلطة + ملعقة زيت زيتون: 100 سعر

باقي 600 سعر للعشا. أنت ماشي كويس 👍"

**سؤال:** "how much protein today?"
**رد جيد:** "You've had 85g so far (breakfast + lunch).
Target: ${protocolInfo['proteinTarget']} → Need 65g more

Easy options:
• Greek yogurt 200g = 20g
• Protein shake = 25g
• Chicken breast 150g = 45g

Pick 2 and you're set ✅"

## ملاحظات:
- اديله أرقام واضحة (سعرات، جرامات)
- اقترح وجبات بمكونات متوفرة
- ما تنسى الماء (2-3L/day)
- لو السعرات عالية جداً، اسأل عن السبب (ما تحكمش)
''';
  }

  Map<String, String> _extractProtocolInfo(AgentContextState? context) {
    final defaults = {
      'eatingWindow': '11 صباحاً - 8 مساءً (15 ساعة صيام)',
      'calorieTarget': '~2000 kcal/day',
      'proteinTarget': '150g/day',
    };

    if (context == null) return defaults;

    for (final rule in context.protocolRules) {
      try {
        final schedule = json.decode(rule.scheduleJson) as Map<String, dynamic>;

        if (rule.name == 'eating-window') {
          final start = schedule['startTime'] ?? schedule['start'];
          final end = schedule['endTime'] ?? schedule['end'];
          if (start != null && end != null) {
            defaults['eatingWindow'] = '$start - $end';
          }
        }

        if (rule.name == 'nutrition-targets' || rule.name == 'calorie-target') {
          if (schedule['calories'] != null) {
            defaults['calorieTarget'] = '~${schedule['calories']} kcal/day';
          }
          if (schedule['protein'] != null) {
            defaults['proteinTarget'] = '${schedule['protein']}g/day';
          }
        }
      } catch (_) {
        // Skip unparseable rules
      }
    }

    return defaults;
  }
}
