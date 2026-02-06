# 🚀 Implementation Roadmap - Multi-Agent Health Keeper

## ✅ Phase 1: Foundation (COMPLETED)

### Architecture & Design
- ✅ Multi-agent architecture documented (`docs/MULTI_AGENT_ARCHITECTURE.md`)
- ✅ Shared memory system designed
- ✅ Data schemas defined (protocol, daily, conversation)
- ✅ Agent interaction flow mapped

### Core Services
- ✅ `SharedMemoryManager` implemented
  - Protocol management
  - Daily data storage
  - Conversation history
  - HealthKit cache
- ✅ `BaseAgent` abstract class
  - Context loading
  - AI integration hooks
  - Command parsing
- ✅ `FitnessAgent` example implementation

---

## 🔨 Phase 2: Core Infrastructure (NEXT)

### Priority 1: Entity Classes
Create domain entities used by SharedMemoryManager:

```dart
lib/core/domain/entities/
├── protocol.dart           # Protocol, EatingWindow, Medication, Activity
├── daily_data.dart        # DailyData, WeightData, MeasurementData, MealData
├── healthkit_data.dart    # SleepData, HRVData, WorkoutData
├── conversation_memory.dart # ConversationMemory, ConversationMessage
└── agent_context.dart     # AgentContext (wrapper for all context)
```

**Tasks:**
- [ ] Create `Protocol` class with fromJson/toJson
  - EatingWindow, Medication, WeeklyActivity, Goals
- [ ] Create `DailyData` class
  - WeightData, MeasurementData, MealData, HealthKitData, MoodData
- [ ] Create `ConversationMemory` class
  - ConversationMessage, AgentMemory
- [ ] Create `AgentContext` class
  - Aggregates protocol + daily + history + conversation

### Priority 2: HealthKit Integration Service

```dart
lib/core/services/healthkit_sync_service.dart
```

**Tasks:**
- [ ] Setup health package dependency
- [ ] Request HealthKit permissions
  - Weight (from Smart Scale)
  - Sleep, HRV, Resting HR (from Whoop)
  - Steps, Active Calories, Workouts (from Apple Watch)
  - Body Fat, Muscle Mass (from Smart Scale)
- [ ] Implement sync methods:
  - `syncWeight()`
  - `syncSleep()`
  - `syncVitals()` (HRV, RHR)
  - `syncActivity()` (steps, calories)
  - `syncWorkouts()`
- [ ] Auto-sync scheduler (every hour + on app open)
- [ ] Write synced data to SharedMemoryManager

### Priority 3: Gemini Integration Service

```dart
lib/core/services/gemini_coach_service.dart
```

**Tasks:**
- [ ] Setup Gemini 2.5 API client
- [ ] Add API key to .env
- [ ] Implement `generateResponse(prompt, agentId)`
- [ ] Add response caching (offline fallback)
- [ ] Add rate limiting
- [ ] Add error handling + retry logic

---

## 🤖 Phase 3: Complete All Agents

### Nutrition Agent

```dart
lib/features/agents/nutrition_agent.dart
```

**Tasks:**
- [ ] Extend BaseAgent
- [ ] Define system prompt (nutrition-focused)
- [ ] Implement quick insight (calories today)
- [ ] Add food recognition integration (camera)
- [ ] Add meal template system
- [ ] Calculate TDEE based on activity + weight

### Health Monitor Agent

```dart
lib/features/agents/health_agent.dart
```

**Tasks:**
- [ ] Extend BaseAgent
- [ ] Define system prompt (health-focused)
- [ ] Implement trend analysis (HRV, sleep, weight)
- [ ] Add alert detection (e.g., HRV drop + poor sleep)
- [ ] Provide health insights

### General Orchestrator Agent

```dart
lib/features/agents/general_agent.dart
```

**Tasks:**
- [ ] Extend BaseAgent
- [ ] Define system prompt (orchestrator role)
- [ ] Implement agent routing (when to forward to specialist)
- [ ] Provide holistic advice
- [ ] Handle general questions

---

## 📱 Phase 4: UI Implementation

### Home Screen

```dart
lib/features/home/screens/home_screen.dart
```

**Tasks:**
- [ ] Today's snapshot widget (weight, recovery, calories, steps)
- [ ] Agent cards list
  - Display icon, name, quick insight, unread badge
  - Navigate to AgentChatScreen on tap
- [ ] Quick actions (add weight, add meal, log workout)

### Agent Chat Screen

```dart
lib/features/chat/screens/agent_chat_screen.dart
```

**Tasks:**
- [ ] Agent app bar (name, icon, back button)
- [ ] Collapsible context panel
  - Show today's context (weight, recovery, meals, etc.)
  - Protocol summary
  - Recent trend
- [ ] Chat messages list
  - User messages (right-aligned)
  - Agent messages (left-aligned)
  - Timestamps
  - Quick action buttons (e.g., "Start Workout")
- [ ] Chat input bar
  - Text input
  - Voice button (hold to speak)
  - Data add button (quick weight/meal entry)
  - Send button

### Context Panel Widget

```dart
lib/features/chat/widgets/context_panel.dart
```

**Tasks:**
- [ ] Expandable tile
- [ ] Display today's data (weight, recovery, meals, etc.)
- [ ] Display protocol (eating window, medications, activities)
- [ ] Display 7-day trend (mini chart or text summary)

### Chat Input Widget

```dart
lib/features/chat/widgets/chat_input.dart
```

**Tasks:**
- [ ] Text field
- [ ] Voice input button (speech-to-text)
- [ ] Quick data add button (bottom sheet)
- [ ] Send button
- [ ] Loading state while AI responds

---

## 🔄 Phase 5: Data Flow Integration

### HealthKit Auto-Sync

**Tasks:**
- [ ] Run sync on app startup
- [ ] Schedule hourly background sync
- [ ] Merge synced data into today's DailyData
- [ ] Show sync status indicator in UI
- [ ] Handle sync errors gracefully

### Agent-to-Agent Awareness

**Tasks:**
- [ ] Test cross-agent context sharing
  - Fitness sees meals from Nutrition
  - Nutrition sees tomorrow's football from Protocol
  - Health sees workout load from Fitness
- [ ] Ensure all agents load same shared memory
- [ ] Test conversation isolation (each agent has separate history)

### Data Entry Commands

**Tasks:**
- [ ] Parse weight entry: "ضيف وزن 94.5"
- [ ] Parse measurement: "قياس الوسط 95"
- [ ] Parse meal entry: "كلت بيتزا"
- [ ] Auto-save to SharedMemoryManager
- [ ] Confirm to user ("✅ حفظت الوزن")

---

## 🎨 Phase 6: Polish & Features

### Progress Photos

**Tasks:**
- [ ] Camera integration
- [ ] Save photos locally
- [ ] AI-powered comparison (Gemini Vision API)
- [ ] Progress gallery screen

### Weekly Reports

**Tasks:**
- [ ] Generate AI weekly summary
- [ ] Show highlights, concerns, next week focus
- [ ] Display as rich card in home screen

### Notifications

**Tasks:**
- [ ] Remind to log weight (morning)
- [ ] Remind to log meals (if none logged by noon)
- [ ] Recovery score notification (morning)
- [ ] Weekly report ready notification (Sunday)

### Settings

**Tasks:**
- [ ] HealthKit permissions management
- [ ] Protocol editor
- [ ] Data export (CSV/JSON)
- [ ] Privacy controls
- [ ] Agent preferences (tone, language)

---

## ✅ Testing Strategy

### Unit Tests
- [ ] SharedMemoryManager (read/write/update)
- [ ] BaseAgent (context loading, response flow)
- [ ] Data parsing (weight, measurements from messages)

### Integration Tests
- [ ] HealthKit sync → SharedMemory → Agent context
- [ ] User message → Agent response → Save conversation
- [ ] Cross-agent awareness (Fitness sees meals)

### UI Tests
- [ ] Home screen displays agents correctly
- [ ] Chat screen loads context
- [ ] Message send/receive flow
- [ ] Data entry confirmation

---

## 📋 Checklist Summary

### Must-Have (MVP)
- [ ] HealthKit sync (Smart Scale + Whoop + Apple Watch)
- [ ] Shared memory system working
- [ ] All 4 agents functional (Fitness, Nutrition, Health, General)
- [ ] Chat UI with context panel
- [ ] Data entry via chat commands
- [ ] Protocol management

### Nice-to-Have
- [ ] Progress photos with AI comparison
- [ ] Weekly AI reports
- [ ] Voice input
- [ ] Notifications
- [ ] Data export

---

## 🚀 Next Steps (Start Here!)

1. **Create Entity Classes** (Priority 1)
   - Start with `Protocol` class
   - Then `DailyData` class
   - Then `ConversationMemory` class
   - Finally `AgentContext` class

2. **Setup HealthKit Integration**
   - Add health package to pubspec.yaml
   - Request permissions
   - Implement sync methods
   - Test with real devices (Smart Scale, Whoop, Apple Watch)

3. **Setup Gemini API**
   - Get API key from Google AI Studio
   - Add to .env
   - Test simple prompt/response
   - Integrate with BaseAgent

4. **Build Chat UI**
   - Home screen with agent cards
   - Agent chat screen
   - Context panel
   - Test with mock data

5. **Connect Everything**
   - HealthKit → SharedMemory
   - SharedMemory → Agent Context
   - Agent Context → AI Prompt
   - AI Response → User

---

**Ready to build! 💪🔥**

Start with Phase 2, Priority 1: Entity Classes.
Then move to HealthKit integration.
Then Gemini integration.
Then UI.

Good luck! 🚀
