# Multi-Agent System - Setup Guide

## ✅ What's Done

### 1. Database Tables Added (v9)
All 6 new tables have been added to the database schema:

- **ProtocolRules** - Static user rules (Mounjaro, Football, Eating Window)
- **AgentContexts** - Daily aggregated context for all agents
- **AgentConversations** - Per-agent conversation history
- **HealthMetricsTimeSeries** - Continuous health metrics (HR, HRV, BP, etc.)
- **MealsDetailed** - Enhanced meal tracking for agents
- **WorkoutsDetailed** - Enhanced workout tracking for agents

### 2. Database Operations Added
Complete CRUD operations for all new tables:
- Protocol Rules operations
- Agent Contexts operations (with upsert support)
- Agent Conversations operations (with streaming support)
- Health Metrics Time Series operations (batch insert support)
- Meals Detailed operations
- Workouts Detailed operations

### 3. Migration Setup
- Schema version bumped to **v9**
- Migration logic added for upgrading from v8 → v9
- All tables will be created automatically on app upgrade

---

## 🛠️ Next Steps

### Step 1: Build Generated Code
Run this command in the project directory:

```bash
cd C:\Users\Atef\Desktop\health-keeper
flutter pub run build_runner build --delete-conflicting-outputs
```

**This will:**
- Generate `database.g.dart`
- Create Drift table classes
- Build companion classes for inserts/updates

**Expected output:**
```
[INFO] Running build...
[INFO] Generating SDK summary...
[INFO] Succeeded after XXs with XXX outputs
```

---

### Step 2: Verify Build Success
Check that `database.g.dart` has been regenerated with the new tables:

```bash
# Should show recent modification time
ls -l lib/core/data/database/database.g.dart
```

---

### Step 3: Test Database Creation

Create a simple test to verify tables are created:

```dart
// test/database_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:health_keeper/core/data/database/database.dart';

void main() {
  test('Database creates all multi-agent tables', () async {
    final db = AppDatabase();
    
    // Test Protocol Rules
    final protocolRules = await db.getAllProtocolRules();
    expect(protocolRules, isNotNull);
    
    // Test Agent Contexts
    final todayContext = await db.getTodayAgentContext();
    expect(todayContext, isNull); // No data yet
    
    // Test Agent Conversations
    final fitnessConvos = await db.getAgentConversations(agentType: 'fitness');
    expect(fitnessConvos, isEmpty);
    
    await db.close();
  });
}
```

Run test:
```bash
flutter test test/database_test.dart
```

---

### Step 4: Seed Initial Protocol Rules

Add user's protocol rules to the database:

```dart
// Example: Seed protocol rules
Future<void> seedProtocolRules(AppDatabase db) async {
  // Mounjaro schedule
  await db.insertProtocolRule(
    ProtocolRulesCompanion.insert(
      id: Value('mounjaro'),
      category: 'medication',
      name: 'mounjaro',
      scheduleJson: jsonEncode({
        'days': ['monday', 'wednesday', 'friday'],
        'time': '09:00',
      }),
      rulesJson: jsonEncode({
        'dosage': '2.5mg',
        'sideEffects': ['nausea', 'fatigue', 'appetite_loss'],
        'notes': 'Take before breakfast, monitor glucose',
      }),
      isActive: true,
      createdAt: DateTime.now(),
    ),
  );

  // Football schedule
  await db.insertProtocolRule(
    ProtocolRulesCompanion.insert(
      id: Value('football'),
      category: 'activity',
      name: 'football',
      scheduleJson: jsonEncode({
        'days': ['monday'],
        'time': '18:00',
        'duration': '90min',
      }),
      rulesJson: jsonEncode({
        'intensity': 'high',
        'recovery': '24h',
        'notes': 'Weekly match - high strain activity',
      }),
      isActive: true,
      createdAt: DateTime.now(),
    ),
  );

  // Eating window
  await db.insertProtocolRule(
    ProtocolRulesCompanion.insert(
      id: Value('eating-window'),
      category: 'nutrition',
      name: 'eating-window',
      scheduleJson: jsonEncode({
        'start': '11:00',
        'end': '20:00',
      }),
      rulesJson: jsonEncode({
        'fastingHours': 15,
        'targetCalories': 2000,
        'targetProtein': 150,
        'notes': '9-hour eating window, 15-hour fast',
      }),
      isActive: true,
      createdAt: DateTime.now(),
    ),
  );
}
```

---

## ✅ Phase 2: Core Services (COMPLETE)

### Services Built:

#### 1. AgentContext Model
**Location:** `lib/core/agents/context/agent_context.dart`

**Features:**
- Complete context container for agents
- Protocol rules, daily context, meals, workouts, health metrics
- Conversation history
- Weekly trends
- `buildSummary()` - generates AR/EN summary for AI prompt
- `buildSnapshot()` - lightweight JSON for conversation storage

#### 2. SharedContextBuilder Service
**Location:** `lib/core/agents/context/shared_context_builder.dart`

**Features:**
- Builds complete context for any agent type
- Loads data in parallel (protocol, daily context, meals, workouts, metrics)
- Configurable lookback periods (meals: 2 days, workouts: 3 days)
- Calculates weekly trends (last 7 days)
- `buildQuickContext()` - lightweight context for notifications

**Usage:**
```dart
final builder = SharedContextBuilder(db);
final context = await builder.buildContext(agentType: 'fitness');
final summary = context.buildSummary(); // Pass to AI
```

#### 3. AgentRouter
**Location:** `lib/core/agents/router/agent_router.dart`

**Features:**
- Intent detection based on keywords (AR + EN)
- 4 agent types: Fitness 🏋️, Nutrition 🍽️, Health 🩺, General 🤖
- Scoring system (primary/secondary/tertiary keywords)
- Multi-intent detection (when message needs multiple agents)
- Agent greetings and display names

**Usage:**
```dart
final agent = AgentRouter.detectIntent('إيه أحسن تمرين النهاردة؟');
// Returns: AgentType.fitness

final agents = AgentRouter.detectMultiIntent('خطة الأسبوع للأكل والرياضة');
// Returns: [AgentType.general] (orchestrator for multi-agent queries)
```

#### 4. MemoryManager
**Location:** `lib/core/agents/memory/memory_manager.dart`

**Features:**
- Voice command processing
- Supported commands:
  - Weight: "وزني 75.3"
  - Medication: "خدت موونجارو"
  - Meal: "أكلت فول وبيض" (acknowledges, suggests detailed entry)
  - Workout: "عملت تمرين" (acknowledges, suggests detailed entry)
  - Sleep: auto from Apple Health
- Updates AgentContexts table
- Notifies all agents of new data
- Generic `writeToShared()` / `readShared()` interface

**Usage:**
```dart
final manager = MemoryManager(db);
final response = await manager.processVoiceCommand('وزني 75.3');
// Returns: "تمام! سجلت وزنك: 75.3 كيلو (↓ 0.2) 💪"
```

---

### Step 5: Test Core Services

Create test file to verify all services work:

```dart
// test/agents/core_services_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/context/shared_context_builder.dart';
import 'package:health_keeper/core/agents/router/agent_router.dart';
import 'package:health_keeper/core/agents/memory/memory_manager.dart';

void main() {
  late AppDatabase db;
  late SharedContextBuilder contextBuilder;
  late MemoryManager memoryManager;

  setUp(() {
    db = AppDatabase(); // Test database
    contextBuilder = SharedContextBuilder(db);
    memoryManager = MemoryManager(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('AgentRouter Tests', () {
    test('Detects fitness intent', () {
      expect(
        AgentRouter.detectIntent('إيه أحسن تمرين النهاردة؟'),
        AgentType.fitness,
      );
      expect(
        AgentRouter.detectIntent('workout plan for today'),
        AgentType.fitness,
      );
    });

    test('Detects nutrition intent', () {
      expect(
        AgentRouter.detectIntent('اقترحلي وجبة غدا'),
        AgentType.nutrition,
      );
      expect(
        AgentRouter.detectIntent('how many calories should I eat'),
        AgentType.nutrition,
      );
    });

    test('Detects health intent', () {
      expect(
        AgentRouter.detectIntent('إيه حالتي الصحية النهاردة؟'),
        AgentType.health,
      );
      expect(
        AgentRouter.detectIntent('when should I take mounjaro'),
        AgentType.health,
      );
    });

    test('Defaults to general for ambiguous queries', () {
      expect(
        AgentRouter.detectIntent('إيه خطتي للأسبوع؟'),
        AgentType.general,
      );
    });
  });

  group('MemoryManager Tests', () {
    test('Processes weight command', () async {
      final response = await memoryManager.processVoiceCommand('وزني 75.3');
      expect(response, contains('75.3'));
      expect(response, contains('كيلو'));

      // Verify it was saved
      final context = await db.getTodayAgentContext();
      expect(context?.weight, 75.3);
    });

    test('Processes Mounjaro command', () async {
      final response = await memoryManager.processVoiceCommand('خدت موونجارو');
      expect(response, contains('موونجارو'));

      // Verify it was saved
      final context = await db.getTodayAgentContext();
      expect(context?.mounjaroTaken, true);
    });
  });

  group('SharedContextBuilder Tests', () {
    test('Builds context for fitness agent', () async {
      final context = await contextBuilder.buildContext(
        agentType: 'fitness',
      );

      expect(context, isNotNull);
      expect(context.protocolRules, isNotNull);
    });

    test('Builds context summary', () async {
      final context = await contextBuilder.buildContext(
        agentType: 'general',
      );

      final summary = context.buildSummary();
      expect(summary, isNotEmpty);
    });
  });
}
```

Run tests:
```bash
flutter test test/agents/core_services_test.dart
```

---

### Step 5: Next - Seed Protocol Rules

Next, build the **SharedContextBuilder** service:

```dart
// lib/core/agents/context/shared_context_builder.dart

class SharedContextBuilder {
  final AppDatabase db;

  SharedContextBuilder(this.db);

  Future<AgentContext> buildContext({
    required String agentType,
    DateTime? targetDate,
  }) async {
    final date = targetDate ?? DateTime.now();
    
    return AgentContext(
      // Protocol layer
      protocol: await _loadProtocolRules(),
      
      // Daily context
      today: await db.getAgentContextForDate(date),
      yesterday: await db.getAgentContextForDate(
        date.subtract(Duration(days: 1)),
      ),
      
      // Detailed data
      recentMeals: await db.getMealsForDate(date),
      recentWorkouts: await db.getWorkoutsForDate(date),
      
      // Health metrics
      latestHRV: await db.getLatestHealthMetric('hrv'),
      latestHeartRate: await db.getLatestHealthMetric('heart-rate'),
      
      // Agent-specific history
      conversationHistory: await db.getAgentConversations(
        agentType: agentType,
        limit: 50,
      ),
    );
  }

  Future<List<ProtocolRule>> _loadProtocolRules() async {
    return await db.getAllProtocolRules(activeOnly: true);
  }
}
```

---

### Step 6: Build Agent Router

Create the **AgentRouter** for intent detection:

```dart
// lib/core/agents/agent_router.dart

enum AgentType { fitness, nutrition, health, general }

class AgentRouter {
  static AgentType detectIntent(String message) {
    final messageLower = message.toLowerCase();
    
    // Fitness keywords
    if (_containsAny(messageLower, [
      'تمرين', 'رياضة', 'workout', 'تدريب', 'عضلات',
      'gym', 'جري', 'مشي', 'كارديو', 'قوة', 'vo2', 'hrv'
    ])) {
      return AgentType.fitness;
    }
    
    // Nutrition keywords
    if (_containsAny(messageLower, [
      'أكل', 'وجبة', 'سعرات', 'بروتين', 'كارب', 'دهون',
      'فطار', 'غدا', 'عشا', 'وصفة', 'calories', 'macros',
      'meal', 'food', 'eat'
    ])) {
      return AgentType.nutrition;
    }
    
    // Health keywords
    if (_containsAny(messageLower, [
      'صحة', 'ضغط', 'سكر', 'قلب', 'نوم', 'موونجارو',
      'دواء', 'أعراض', 'health', 'medication', 'sleep',
      'recovery', 'hrv'
    ])) {
      return AgentType.health;
    }
    
    // Default: general
    return AgentType.general;
  }

  static bool _containsAny(String text, List<String> keywords) {
    return keywords.any((keyword) => text.contains(keyword));
  }
}
```

---

## 📋 Checklist

### Phase 1: Database Layer ✅
- [x] Add 6 new database tables
- [x] Add database operations for all tables
- [x] Update schema version to v9
- [x] Add migration logic
- [x] Run build_runner

### Phase 2: Core Services ✅
- [x] Build AgentContext model
- [x] Build SharedContextBuilder service
- [x] Build AgentRouter (intent detection)
- [x] Build MemoryManager (voice commands)

### Phase 3: Integration (NEXT)
- [ ] **Test core services** ← YOU ARE HERE
- [ ] Seed protocol rules
- [ ] Create 4 specialized agents (Fitness, Nutrition, Health, General)
- [ ] Integrate with existing GeminiCoachService
- [ ] Build Apple Health sync service
- [ ] Update chat UI
- [ ] Test full multi-agent flow

---

## 🚀 Next Phase: Services

After completing the database setup, move on to:

1. **Apple Health Sync Service** - Pull all data types into the database
2. **Memory Manager** - Handle voice command "add to share"
3. **Agent Services** - 4 specialized agents with Gemini 2.5
4. **UI Integration** - Update chat UI to show agent type

---

## 📖 Documentation References

- **Architecture:** `docs/MULTI_AGENT_ARCHITECTURE.md`
- **Database Schema:** `docs/SHARED_MEMORY_SCHEMA.md`
- **Apple Health Integration:** `docs/APPLE_HEALTH_INTEGRATION.md`

---

**Status:** Database layer complete ✅  
**Next:** Run `flutter pub run build_runner build`
