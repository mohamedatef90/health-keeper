# Shared Memory Schema - Multi-Agent System

## Overview
نظام ذاكرة مشتركة من 3 طبقات يسمح لكل الـagents بالوصول للسياق الكامل.

## Architecture Layers

```
┌─────────────────────────────────────────────────┐
│         Layer 1: Protocol (Static)              │
│  Mounjaro schedule, Football, Eating window     │
└─────────────────────────────────────────────────┘
                      ▼
┌─────────────────────────────────────────────────┐
│      Layer 2: Daily Context (Dynamic)           │
│   Meals, Workouts, Metrics, Sleep, Recovery     │
└─────────────────────────────────────────────────┘
                      ▼
┌─────────────────────────────────────────────────┐
│   Layer 3: Agent Memory (Conversations)         │
│     Fitness  │  Nutrition  │  Health  │ General │
└─────────────────────────────────────────────────┘
```

## Database Tables (Drift)

### 1️⃣ Protocol Table (Static Rules)

```dart
@DataClassName('ProtocolRule')
class ProtocolRules extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text()(); // 'medication' | 'activity' | 'nutrition'
  TextColumn get name => text()(); // 'mounjaro' | 'football' | 'eating-window'
  TextColumn get schedule => text()(); // JSON: {"days": [1,3,5], "time": "09:00"}
  TextColumn get rules => text()(); // JSON: {"dosage": "2.5mg", "notes": "..."}
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
```

**Example Data:**
```json
[
  {
    "category": "medication",
    "name": "mounjaro",
    "schedule": {"days": ["monday", "wednesday", "friday"], "time": "09:00"},
    "rules": {"dosage": "2.5mg", "sideEffects": ["nausea", "fatigue"], "notes": "Take before breakfast"}
  },
  {
    "category": "activity",
    "name": "football",
    "schedule": {"days": ["monday"], "time": "18:00"},
    "rules": {"duration": "90min", "intensity": "high", "recovery": "24h"}
  },
  {
    "category": "nutrition",
    "name": "eating-window",
    "schedule": {"start": "11:00", "end": "20:00"},
    "rules": {"fastingHours": 15, "targetCalories": 2000}
  }
]
```

### 2️⃣ Daily Context Table (Today's Data)

```dart
@DataClassName('DailyContext')
class DailyContexts extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()(); // yyyy-MM-dd (day key)
  
  // Sleep Data
  RealColumn get sleepDuration => real().nullable()(); // hours
  IntColumn get sleepQuality => integer().nullable()(); // 0-100 score
  RealColumn get sleepHRV => real().nullable()(); // ms
  TextColumn get sleepStages => text().nullable()(); // JSON: {"deep": 1.5, "rem": 2.0, ...}
  
  // Body Metrics
  RealColumn get weight => real().nullable()(); // kg
  RealColumn get bodyFat => real().nullable()(); // %
  RealColumn get leanMass => real().nullable()(); // kg
  
  // Activity
  IntColumn get steps => integer().nullable()();
  RealColumn get activeCalories => real().nullable()(); // kcal
  IntColumn get exerciseMinutes => integer().nullable()();
  
  // Nutrition
  RealColumn get caloriesConsumed => real().nullable()(); // kcal
  RealColumn get protein => real().nullable()(); // g
  RealColumn get carbs => real().nullable()(); // g
  RealColumn get fats => real().nullable()(); // g
  RealColumn get water => real().nullable()(); // ml
  
  // Recovery
  IntColumn get recoveryScore => integer().nullable()(); // 0-100 (Whoop)
  IntColumn get strain => integer().nullable()(); // 0-21 (Whoop)
  IntColumn get restingHeartRate => integer().nullable()(); // bpm
  
  // Medication
  BoolColumn get mounjaroTaken => boolean().withDefault(const Constant(false))();
  
  // Computed Fields
  TextColumn get contextSummary => text().nullable()(); // AI-generated daily summary
  
  DateTimeColumn get syncedAt => dateTime().withDefault(currentDateAndTime)();
}
```

### 3️⃣ Agent Memory Table (Conversation History)

```dart
@DataClassName('AgentMessage')
class AgentMessages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get agentType => text()(); // 'fitness' | 'nutrition' | 'health' | 'general'
  TextColumn get role => text()(); // 'user' | 'assistant' | 'system'
  TextColumn get content => text()();
  
  // Context snapshot at time of message
  IntColumn get dailyContextId => integer().nullable()();
  TextColumn get contextSnapshot => text().nullable()(); // JSON snapshot of relevant context
  
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  
  // For tracking agent recommendations
  TextColumn get actionType => text().nullable()(); // 'workout' | 'meal' | 'medication' | 'insight'
  BoolColumn get wasActedUpon => boolean().nullable()();
}
```

### 4️⃣ Meals Table (Detailed Nutrition)

```dart
@DataClassName('Meal')
class Meals extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get consumedAt => dateTime()();
  TextColumn get mealType => text()(); // 'breakfast' | 'lunch' | 'dinner' | 'snack'
  TextColumn get name => text()();
  
  RealColumn get calories => real()();
  RealColumn get protein => real()();
  RealColumn get carbs => real()();
  RealColumn get fats => real()();
  RealColumn get fiber => real().nullable()();
  
  TextColumn get ingredients => text().nullable()(); // JSON array
  TextColumn get notes => text().nullable()();
  TextColumn get source => text().nullable()(); // 'manual' | 'apple-health' | 'ai-logged'
  
  BoolColumn get isEditable => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
```

### 5️⃣ Workouts Table (Detailed Activity)

```dart
@DataClassName('Workout')
class Workouts extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  
  TextColumn get workoutType => text()(); // 'strength' | 'cardio' | 'football' | 'walking' | 'other'
  TextColumn get name => text()();
  IntColumn get duration => integer()(); // minutes
  
  RealColumn get caloriesBurned => real().nullable()();
  IntColumn get avgHeartRate => integer().nullable()();
  IntColumn get maxHeartRate => integer().nullable()();
  TextColumn get intensity => text().nullable()(); // 'low' | 'medium' | 'high'
  
  TextColumn get exercises => text().nullable()(); // JSON: [{"name": "...", "sets": 3, "reps": 10}]
  TextColumn get notes => text().nullable()();
  TextColumn get source => text().nullable()(); // 'manual' | 'apple-health' | 'whoop'
  
  BoolColumn get isEditable => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
```

### 6️⃣ Health Metrics Table (Time-Series Data)

```dart
@DataClassName('HealthMetric')
class HealthMetrics extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get metricType => text()(); // 'heart-rate' | 'hrv' | 'blood-pressure' | 'glucose'
  
  RealColumn get value => real()();
  TextColumn get unit => text()(); // 'bpm' | 'ms' | 'mmHg' | 'mg/dL'
  TextColumn get context => text().nullable()(); // 'resting' | 'exercise' | 'sleeping'
  
  TextColumn get source => text()(); // 'apple-health' | 'whoop' | 'manual'
  DateTimeColumn get syncedAt => dateTime().withDefault(currentDateAndTime)();
}
```

## Data Flow

### Morning Sync (07:00 - 09:00)
```
Apple Health
    ├─> Sleep data → DailyContexts (yesterday)
    ├─> Weight, Body Fat → DailyContexts (today)
    ├─> HRV, Resting HR → HealthMetrics
    └─> Recovery Score (Whoop) → DailyContexts
```

### Throughout Day
```
User Activity
    ├─> Meal logged → Meals → Update DailyContexts.nutrition
    ├─> Workout completed → Workouts → Update DailyContexts.activity
    └─> Metrics synced → HealthMetrics
```

### Agent Query (Any Time)
```
Agent receives user message
    ├─> Load Protocol rules
    ├─> Load DailyContext (today + yesterday)
    ├─> Load relevant Meals, Workouts
    ├─> Load agent conversation history
    └─> Generate context-aware response
```

## Context Builder Service

```dart
class SharedContextBuilder {
  // Build complete context for any agent
  Future<AgentContext> buildContext({
    required String agentType,
    DateTime? targetDate,
  }) async {
    final date = targetDate ?? DateTime.now();
    
    return AgentContext(
      // Static rules
      protocol: await _loadProtocol(),
      
      // Today's data
      today: await _loadDailyContext(date),
      yesterday: await _loadDailyContext(date.subtract(Duration(days: 1))),
      
      // Detailed data
      recentMeals: await _loadRecentMeals(date, days: 2),
      recentWorkouts: await _loadRecentWorkouts(date, days: 3),
      
      // Trends
      weeklyTrends: await _calculateWeeklyTrends(date),
      
      // Agent-specific history
      conversationHistory: await _loadAgentHistory(agentType, limit: 50),
    );
  }
}
```

## Memory Manager Service

```dart
class MemoryManager {
  // Write to shared file on voice command
  Future<void> writeToShared(String data, String category) async {
    // Parse data and route to appropriate table
    if (category == 'measurement') {
      await _updateBodyMetrics(data);
    } else if (category == 'meal') {
      await _logMeal(data);
    } else if (category == 'workout') {
      await _logWorkout(data);
    }
    
    // Update daily context
    await _refreshDailyContext(DateTime.now());
    
    // Notify all agents of new data
    _notifyAgents();
  }
  
  // Read shared context for agent
  Future<Map<String, dynamic>> readShared(String agentType) async {
    return await SharedContextBuilder().buildContext(agentType: agentType);
  }
}
```

## Usage Example

### User Says: "Add my weight to the share"
```dart
// Voice command triggers
await memoryManager.writeToShared(
  '75.3 kg',
  category: 'measurement'
);

// System updates:
1. DailyContexts.weight = 75.3
2. Notification sent to all agents
3. Fitness agent can now see new weight
4. Nutrition agent adjusts calorie targets
```

### Fitness Agent Query
```dart
final context = await contextBuilder.buildContext(agentType: 'fitness');

// Context includes:
- Protocol: Football on Mondays, Mounjaro today
- Today: Weight 75.3kg, Sleep 7.5h (HRV 55), No workout yet
- Yesterday: Mounjaro dose taken, 1800 cal, 120g protein
- Recommendation: "Easy recovery walk today — football tomorrow + Mounjaro effects"
```

## Indexes & Performance

```dart
// Critical indexes for fast queries
@TableIndex(name: 'daily_context_date', columns: {#date})
@TableIndex(name: 'agent_messages_type_timestamp', columns: {#agentType, #timestamp})
@TableIndex(name: 'meals_consumed_at', columns: {#consumedAt})
@TableIndex(name: 'workouts_start_time', columns: {#startTime})
@TableIndex(name: 'health_metrics_type_timestamp', columns: {#metricType, #timestamp})
```

## Privacy & Security

- ✅ All data encrypted at rest (SQLite + sqlcipher)
- ✅ No cloud sync (local-first)
- ✅ User controls what agents can write/read
- ✅ Audit log for all shared file writes

## Next Steps

1. Implement Drift tables
2. Build Context Builder service
3. Build Memory Manager service
4. Create Apple Health sync layer
5. Test multi-agent read/write access
