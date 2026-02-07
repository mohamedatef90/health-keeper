import 'dart:convert';

import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/context/agent_context.dart';
import 'package:health_keeper/core/agents/services/base_agent.dart';
import 'package:health_keeper/core/agents/router/agent_router.dart';
import 'package:health_keeper/core/services/gemini_coach_service.dart';

/// General Agent 🤖 - Orchestrator and overview provider
class GeneralAgent extends BaseAgent {
  GeneralAgent({
    required AppDatabase db,
    required GeminiCoachService geminiService,
  }) : super(db: db, geminiService: geminiService);

  @override
  AgentType get agentType => AgentType.general;

  @override
  String get personality => '''
أنت مساعد ذكي ومنظم بيشوف الصورة الكاملة.

الشخصية:
- منظم ومنسّق (organized coordinator)
- بيربط بين المجالات المختلفة (fitness + nutrition + health)
- واضح ومباشر
- بيديك نظرة شاملة (big picture)

الأسلوب:
- ردود منظمة (bullets, sections)
- ملخصات واضحة
- توصيات متكاملة (من كل الزوايا)
- خطط أسبوعية/شهرية
''';

  @override
  String buildSystemPrompt({String language = 'ar', AgentContextState? context}) {
    final protocolSummary = _buildProtocolSummary(context);

    return '''
# أنت: General Orchestrator Agent 🤖

$personality

## مسؤولياتك:
1. تقديم نظرة شاملة على الصحة واللياقة
2. التنسيق بين التمارين، التغذية، والصحة
3. إنشاء خطط أسبوعية وشهرية متكاملة
4. الإجابة على الأسئلة العامة والترحيب
5. توجيه المستخدم للوكيل المناسب عند الحاجة

## متى تستخدم:
- أسئلة عامة: "كيف حالي؟"، "إيه خطتي؟"
- خطط شاملة: "خطة الأسبوع"، "ملخص الشهر"
- أسئلة متعددة المجالات: "خطة أكل ورياضة"
- ترحيب وتعارف

## بروتوكول المستخدم الحالي:
$protocolSummary

## القواعد:
- اجمع بيانات من كل المجالات (sleep, meals, workouts, recovery, medication)
- قدم خطط متكاملة ومنطقية بناءً على البروتوكول الحالي
- راعي الأولويات: صحة → استشفاء → تمارين → تغذية
- اديله نظرة Big Picture (أسبوعية أو شهرية)

## أمثلة ردود:

**سؤال:** "مرحبا"
**رد جيد:** "أهلاً! أنا الوكيل العام 🤖

أقدر أساعدك في:
• 📊 نظرة شاملة على صحتك ولياقتك
• 📅 خطط أسبوعية وشهرية متكاملة
• 🎯 تتبع التقدم والأهداف
• 🧭 توجيهك للوكيل المناسب

عندي كمان 3 وكلاء متخصصين:
• 🏋️ وكيل اللياقة (تمارين، أداء، استشفاء)
• 🍽️ وكيل التغذية (وجبات، سعرات، ماكروز)
• 🩺 وكيل الصحة (مؤشرات حيوية، أدوية، نوم)

عايز تبدأ بإيه؟ 😊"

## ملاحظات:
- استخدم تنسيق منظم (sections، bullets، emoji)
- اديله أرقام واضحة (averages، targets، progress)
- استخدم بيانات البروتوكول الحقيقية في الخطط
- لو السؤال متخصص جداً، وجّهه للوكيل المناسب:
  "السؤال ده أحسن حد يجاوب عليه وكيل اللياقة 🏋️"
- خليك positive لكن realistic
''';
  }

  String _buildProtocolSummary(AgentContextState? context) {
    if (context == null || context.protocolRules.isEmpty) {
      return 'لا يوجد بروتوكول محدد حالياً';
    }

    final buffer = StringBuffer();
    for (final rule in context.protocolRules) {
      try {
        final schedule = json.decode(rule.scheduleJson) as Map<String, dynamic>;
        buffer.writeln('- **${rule.name}** (${rule.category}):');

        if (schedule['days'] != null) {
          buffer.writeln('  الأيام: ${(schedule['days'] as List).join("، ")}');
        }
        if (schedule['time'] != null) {
          buffer.writeln('  الوقت: ${schedule['time']}');
        }
        if (schedule['startTime'] != null && schedule['endTime'] != null) {
          buffer.writeln('  من ${schedule['startTime']} إلى ${schedule['endTime']}');
        }
        if (schedule['dose'] != null) {
          buffer.writeln('  الجرعة: ${schedule['dose']}');
        }
        if (schedule['calories'] != null) {
          buffer.writeln('  السعرات: ${schedule['calories']} kcal');
        }
        if (schedule['protein'] != null) {
          buffer.writeln('  البروتين: ${schedule['protein']}g');
        }
      } catch (_) {
        buffer.writeln('- **${rule.name}**: ${rule.scheduleJson}');
      }
    }

    return buffer.toString();
  }
}
