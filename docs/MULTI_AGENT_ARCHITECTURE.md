# Multi-Agent Architecture - health-keeper

## Overview
نظام multi-agent حيث كل agent متخصص في مجال معين، لكن الكل بيشوف نفس السياق (shared context).

## Agent Types

### 1️⃣ Fitness Agent (وكيل اللياقة)
**المسؤولية:**
- تصميم برامج التمرين
- تتبع التقدم الرياضي
- VO2 Max, HRV trends
- تقييم الأداء البدني

**Context يشوفه:**
- ✅ النوم (جودة، مدة، HRV)
- ✅ التغذية (سعرات، بروتين)
- ✅ Protocol (Football Mondays, Mounjaro schedule)
- ✅ Recovery Score (Whoop)
- ✅ الوزن وكتلة العضلات

**مثال:**
> **User:** "إيه أحسن تمرين النهاردة؟"
> 
> **Fitness Agent Context:**
> - Today: Sleep 7.5h (HRV 55), 1800 cal eaten, 120g protein
> - Protocol: Football tomorrow (Monday)
> - Yesterday: Mounjaro dose taken
> 
> **Response:** "النهاردة راحة خفيفة أو مشي 20 دقيقة. عندك ماتش بكرة + موونجارو أمس، جسمك محتاج يستشفى."

---

### 2️⃣ Nutrition Agent (وكيل التغذية)
**المسؤولية:**
- تخطيط الوجبات
- حساب السعرات والماكروز
- تتبع الـcalorie deficit/surplus
- نصائح غذائية

**Context يشوفه:**
- ✅ الوزن اليومي
- ✅ النشاط البدني (سعرات محروقة)
- ✅ Protocol (Eating window 11:00-20:00)
- ✅ Mounjaro effects (appetite changes)
- ✅ الوجبات السابقة

**مثال:**
> **User:** "اقترحلي وجبة غدا"
> 
> **Nutrition Agent Context:**
> - Today: Eaten 800 cal so far (breakfast + snack)
> - Target: 2000 cal/day, 150g protein
> - Workout: 30 min strength (300 cal burned)
> - Eating window: 11:00-20:00 (4 hours left)
> 
> **Response:** "وجبة 600 سعر: صدر فراخ مشوي 200جم (300 سعر، 60جم بروتين) + أرز بني 150جم (200 سعر، 5جم بروتين) + سلطة + زيت زيتون. باقي 600 سعر للعشا."

---

### 3️⃣ Health Agent (وكيل الصحة)
**المسؤولية:**
- مراقبة المؤشرات الحيوية
- تتبع الأدوية (Mounjaro)
- نصائح صحية عامة
- تحذيرات (ضغط عالي، سكر، إلخ)

**Context يشوفه:**
- ✅ كل Health Metrics (HR, HRV, BP, Glucose)
- ✅ Protocol (Mounjaro schedule)
- ✅ Side effects tracking
- ✅ النوم والـrecovery
- ✅ التمارين الشاقة

**مثال:**
> **User:** "إيه حالتي الصحية النهاردة؟"
> 
> **Health Agent Context:**
> - Morning HRV: 55ms (↓ من المتوسط 62ms)
> - Resting HR: 58 bpm (↑ from avg 54)
> - Sleep: 7.5h but fragmented
> - Mounjaro: Day 2 post-injection
> - Recovery Score: 65% (yellow)
> 
> **Response:** "جسمك مش 100% النهاردة. HRV منخفض شوية وده طبيعي بعد موونجارو بيومين. خد يوم خفيف، اشرب مية كتير، ونام بدري الليلة."

---

### 4️⃣ General Orchestrator Agent (الوكيل العام)
**المسؤولية:**
- توجيه الأسئلة للagent المناسب
- الرد على أسئلة عامة
- دمج insights من agents مختلفة
- Dashboard summaries

**Context يشوفه:**
- ✅ كل البيانات (full context)
- ✅ تاريخ محادثات كل الـagents
- ✅ Weekly/monthly trends

**مثال:**
> **User:** "إيه خطتي للأسبوع ده؟"
> 
> **General Agent Context:**
> - Protocol: Football every Monday
> - Mounjaro: Mon, Wed, Fri
> - Current weight: 75.3kg (target: 72kg)
> - Avg calories: 1900/day (deficit 300)
> - Weekly workouts: 4x
> 
> **Response:** 
> "**الأسبوع ده:**
> - 🏋️ 4 تمارين: الأحد، الثلاثاء، الخميس، السبت (قوة + كارديو)
> - ⚽ ماتش الاتنين 6م
> - 💉 موونجارو: الاتنين، الأربعاء، الجمعة
> - 🍽️ هدف: 1900 سعر/يوم (عشان تنزل 0.5 كيلو)
> - 😴 نام 8 ساعات — HRV بتاعك أحسن لما تنام كويس"

---

## System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    User Interface                       │
│              (Flutter Chat / Voice Input)               │
└─────────────────────┬───────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────┐
│              Agent Router Service                       │
│  - Detects intent (fitness/nutrition/health/general)    │
│  - Routes to appropriate agent                          │
│  - Handles multi-agent queries                          │
└─────────────────────┬───────────────────────────────────┘
                      │
         ┌────────────┼────────────┬────────────┐
         │            │            │            │
         ▼            ▼            ▼            ▼
┌─────────────┐ ┌──────────┐ ┌─────────┐ ┌──────────┐
│   Fitness   │ │Nutrition │ │ Health  │ │ General  │
│    Agent    │ │  Agent   │ │  Agent  │ │   Agent  │
└──────┬──────┘ └────┬─────┘ └────┬────┘ └────┬─────┘
       │             │             │            │
       └─────────────┴─────────────┴────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────┐
│            Shared Context Builder                       │
│  - Loads Protocol (static rules)                        │
│  - Loads DailyContext (today + yesterday)               │
│  - Loads Meals, Workouts, HealthMetrics                 │
│  - Loads Agent conversation history                     │
└─────────────────────┬───────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────┐
│              Shared Memory (SQLite)                     │
│  Protocol │ DailyContext │ AgentMemory │ Meals │ etc.  │
└─────────────────────┬───────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────┐
│         Apple Health Sync Service                       │
│  - Syncs all HealthKit data types                       │
│  - Updates shared memory                                │
│  - Triggers agent notifications                         │
└─────────────────────────────────────────────────────────┘
```

## Agent Communication Protocol

### 1. User Message Flow
```dart
User: "إيه أحسن تمرين النهاردة؟"
    ↓
AgentRouter.detectIntent() → 'fitness'
    ↓
SharedContextBuilder.buildContext(agentType: 'fitness')
    ↓
FitnessAgent.generateResponse(context, message)
    ↓
Response: "راحة خفيفة — عندك ماتش بكرة"
    ↓
AgentMemory.save(agentType: 'fitness', role: 'assistant', content: ...)
```

### 2. Cross-Agent Consultation
```dart
User: "هل الفول على الفطار كويس قبل التمرين؟"
    ↓
AgentRouter.detectIntent() → 'nutrition' + 'fitness' (multi-agent)
    ↓
NutritionAgent.analyze() → "الفول فيه 15جم بروتين + ألياف"
    ↓
FitnessAgent.consult(nutritionAnalysis) → "كويس بس قبل التمرين بساعتين"
    ↓
GeneralAgent.synthesize() → "آه كويس! الفول فيه بروتين وألياف. خده قبل التمرين بـ2 ساعة عشان ميتقلش معدتك."
```

### 3. Voice Command: "Add to Share"
```dart
User (voice): "وزني النهاردة 75.3"
    ↓
VoiceCommandDetector.parse() → intent='update_weight', value=75.3
    ↓
MemoryManager.writeToShared(category: 'measurement', data: '75.3 kg')
    ↓
DailyContext.update(date: today, weight: 75.3)
    ↓
AgentNotifier.broadcast() → All agents notified
    ↓
Response: "تمام، سجلت وزنك: 75.3 كيلو (↓ 0.2 من امبارح) 💪"
```

## Intent Detection

```dart
class AgentRouter {
  AgentType detectIntent(String message) {
    // Keywords mapping
    final Map<AgentType, List<String>> keywords = {
      AgentType.fitness: [
        'تمرين', 'رياضة', 'workout', 'تدريب', 'عضلات', 'جري',
        'مشي', 'كارديو', 'قوة', 'vo2', 'hrv'
      ],
      AgentType.nutrition: [
        'أكل', 'وجبة', 'سعرات', 'بروتين', 'كارب', 'دهون',
        'فطار', 'غدا', 'عشا', 'وصفة', 'calories', 'macros'
      ],
      AgentType.health: [
        'صحة', 'ضغط', 'سكر', 'قلب', 'نوم', 'موونجارو',
        'دواء', 'أعراض', 'health', 'medication'
      ],
    };
    
    // Score each agent
    // Return highest match or 'general' if ambiguous
  }
}
```

## Agent Personality & Tone

### Fitness Agent 🏋️
- **Vibe:** Motivational coach
- **Language:** "يلا نشد حيلنا", "عاش!", "تمام كدة"
- **Focus:** Progress, consistency, recovery

### Nutrition Agent 🍽️
- **Vibe:** Practical advisor
- **Language:** Clear numbers, simple recipes
- **Focus:** Balance, flexibility, no guilt

### Health Agent 🩺
- **Vibe:** Caring doctor (but chill)
- **Language:** Informative but not scary
- **Focus:** Trends, prevention, listen to body

### General Agent 🤖
- **Vibe:** Smart assistant
- **Language:** Organized, concise
- **Focus:** Big picture, coordination

## Example Multi-Agent Scenario

### User: "خطة الأسبوع ده"

**Step 1: General Agent Orchestrates**
```dart
GeneralAgent queries:
  - FitnessAgent.getWeeklyPlan()
  - NutritionAgent.getCalorieTarget()
  - HealthAgent.getMedicationSchedule()
```

**Step 2: Agents Respond**
```
FitnessAgent: "4 workouts — Sun, Tue, Thu, Sat + Football Monday"
NutritionAgent: "1900 cal/day target (300 deficit), 150g protein"
HealthAgent: "Mounjaro Mon/Wed/Fri, watch for fatigue"
```

**Step 3: General Agent Synthesizes**
```markdown
**خطة الأسبوع (Feb 5-11):**

🏋️ **التمارين:**
- الأحد: Upper body (45 دقيقة)
- الثلاثاء: Cardio + Core (30 دقيقة)
- الخميس: Lower body (45 دقيقة)
- السبت: Full body (40 دقيقة)
- **الاتنين: ماتش كورة 6م ⚽**

🍽️ **التغذية:**
- السعرات: 1900/يوم
- بروتين: 150جم/يوم
- ويندو: 11ص - 8م

💉 **موونجارو:**
- الاتنين، الأربعاء، الجمعة (9 صباحاً)
- خلي بالك من الإرهاق بعد الحقنة

🎯 **الهدف:**
نزول 0.5 كيلو الأسبوع ده (من 75.3 → 74.8)
```

## Implementation Phases

### Phase 1: Single Agent (Current State)
- ✅ Basic Gemini integration
- ✅ Simple context (meals, workouts)
- ❌ No specialization

### Phase 2: Context Builder (Next)
- [ ] Implement Shared Memory Schema
- [ ] Build Context Builder service
- [ ] Apple Health full sync
- [ ] Test with single agent reading rich context

### Phase 3: Multi-Agent Router
- [ ] Intent detection
- [ ] Agent router
- [ ] 4 specialized agents (Fitness, Nutrition, Health, General)
- [ ] Agent-specific conversation history

### Phase 4: Advanced Features
- [ ] Cross-agent consultation
- [ ] Voice command "add to share"
- [ ] Weekly summaries
- [ ] Proactive notifications

## Code Structure

```
lib/
├── features/
│   ├── agents/
│   │   ├── agent_router.dart
│   │   ├── agents/
│   │   │   ├── fitness_agent.dart
│   │   │   ├── nutrition_agent.dart
│   │   │   ├── health_agent.dart
│   │   │   └── general_agent.dart
│   │   ├── context/
│   │   │   ├── shared_context_builder.dart
│   │   │   └── agent_context.dart
│   │   └── memory/
│   │       ├── memory_manager.dart
│   │       └── agent_notifier.dart
│   ├── apple_health/
│   │   ├── apple_health_service.dart
│   │   └── data_sync_manager.dart
│   └── ...
└── data/
    ├── database/
    │   ├── app_database.dart (Drift)
    │   └── tables/
    │       ├── protocol_rules.dart
    │       ├── daily_contexts.dart
    │       ├── agent_messages.dart
    │       ├── meals.dart
    │       ├── workouts.dart
    │       └── health_metrics.dart
    └── ...
```

## Performance Considerations

### Context Loading Optimization
- ✅ Cache today's DailyContext in memory
- ✅ Lazy load conversation history (last 50 messages)
- ✅ Index all timestamp fields
- ✅ Batch Apple Health queries

### Agent Response Time
- Target: < 2 seconds for simple queries
- Target: < 5 seconds for complex multi-agent queries
- Use Gemini Flash for routine queries
- Use Gemini Pro for complex analysis

## Privacy & Security
- ✅ All agents see same data (no hidden info)
- ✅ User controls what goes into shared memory
- ✅ Audit log for all writes
- ✅ No data leaves device
- ✅ Encrypted at rest

## Next Steps

1. ✅ Document Apple Health integration
2. ✅ Design shared memory schema
3. ✅ Define multi-agent architecture
4. ⏳ Implement Drift tables
5. ⏳ Build Context Builder
6. ⏳ Implement Agent Router
7. ⏳ Create 4 specialized agents
8. ⏳ Test full flow

---

**Ready to build! 🚀**
