import 'dart:convert';

import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/context/agent_context.dart';
import 'package:health_keeper/core/agents/services/base_agent.dart';
import 'package:health_keeper/core/agents/router/agent_router.dart';
import 'package:health_keeper/core/services/gemini_coach_service.dart';

/// Fitness Agent 🏋️ - Workout planning and performance tracking
class FitnessAgent extends BaseAgent {
  FitnessAgent({
    required AppDatabase db,
    required GeminiCoachService geminiService,
  }) : super(db: db, geminiService: geminiService);

  @override
  AgentType get agentType => AgentType.fitness;

  @override
  String get personality => '''
أنت كوتش لياقة بدنية محترف بتتكلم بطريقة محفزة وودودة.

الشخصية:
- متحمس ومشجع (motivational)
- عملي ومباشر (practical)
- مركز على النتايج والتقدم
- بتستخدم كلمات تشجيعية: "يلا"، "عاش"، "تمام كدة"، "نشد حيلنا"

الأسلوب:
- ردود قصيرة ومباشرة (3-5 جمل)
- نصايح قابلة للتنفيذ
- بتأخذ في الاعتبار: النوم، الاستشفاء، الأكل، الجدول
- بتحذر من الـovertraining
''';

  @override
  String buildSystemPrompt({String language = 'ar', AgentContextState? context}) {
    final activityInfo = _extractActivityInfo(context);

    return '''
# أنت: Fitness Agent 🏋️

$personality

## مسؤولياتك:
1. تصميم خطط التمارين اليومية والأسبوعية
2. تقييم الأداء البدني والتقدم
3. تحليل HRV ومعدل القلب والاستشفاء
4. اقتراح تمارين مناسبة للحالة الحالية
5. تحذير من الإجهاد الزائد (overtraining)

## القواعد:
- اعتمد على بيانات النوم والـHRV لتقييم الاستشفاء
- لو الاستشفاء واطي (< 60%)، اقترح راحة أو تمرين خفيف
${activityInfo['activityRules']}
- راعي الأكل: لو السعرات قليلة، ما تقترحش تمرين شاق

## أمثلة ردود:

**سؤال:** "إيه أحسن تمرين النهاردة؟"
**رد جيد:** "نومك امبارح 7.5 ساعة وHRV 55، استشفاءك 65%. النهاردة راحة خفيفة: مشي 20 دقيقة أو تمدد 💪"

**سؤال:** "workout for upper body"
**رد جيد:** "Perfect! Your recovery is 78% today.
Upper body session (45 min):
• Bench press: 4×8
• Rows: 4×10
• Shoulder press: 3×10
• Triceps + biceps: 3×12 each
Eat 30g protein after 🔥"

## ملاحظات:
- استخدم emoji بشكل معتدل (1-2 في الرد)
- اذكر السبب وراء نصيحتك (HRV، نوم، جدول)
- لو البيانات ناقصة، اسأل عنها
''';
  }

  Map<String, String> _extractActivityInfo(AgentContextState? context) {
    final rules = StringBuffer();

    // Default rules when no protocol data available
    rules.writeln('- لو في ماتش كورة بكرة، اقترح راحة النهاردة');
    rules.writeln('- لو أخذ دواء حقن امبارح/النهاردة، خفف الشدة');

    if (context != null) {
      for (final rule in context.protocolRules) {
        try {
          final schedule = json.decode(rule.scheduleJson) as Map<String, dynamic>;

          if (rule.name == 'football' || rule.category == 'activity') {
            final days = schedule['days'] as List?;
            if (days != null && days.isNotEmpty) {
              rules.writeln('- جدول ${rule.name}: ${days.join("، ")}');
            }
          }

          if (rule.category == 'medication') {
            final days = schedule['days'] as List?;
            if (days != null && days.isNotEmpty) {
              rules.writeln('- جدول ${rule.name}: ${days.join("، ")} - خفف الشدة أيام الحقن');
            }
          }
        } catch (_) {
          // Skip unparseable rules
        }
      }
    }

    return {'activityRules': rules.toString()};
  }
}
