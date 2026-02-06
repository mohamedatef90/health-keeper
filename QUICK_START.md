# Multi-Agent System - Quick Start 🚀

## ✅ What's Done

### Phase 1: Database ✅
- 6 new tables for multi-agent system
- 50+ database operations
- Schema v9 with migrations

### Phase 2: Core Services ✅
- **AgentContext** - Full context container
- **SharedContextBuilder** - Loads all data for agents
- **AgentRouter** - Intent detection (AR + EN)
- **MemoryManager** - Voice commands ("وزني 75.3")

### Phase 3: Agents ✅
- **FitnessAgent 🏋️** - Workout planning, HRV analysis
- **NutritionAgent 🍽️** - Meal planning, macro tracking
- **HealthAgent 🩺** - Vital signs, medication tracking
- **GeneralAgent 🤖** - Overview, weekly plans
- **AgentFactory** - Auto-routing and management
- **Tests** - Comprehensive test suite

---

## 🎯 Next Steps (For You)

### Step 1: Fill Protocol Template ✏️

**File:** `lib/core/agents/data/user_protocol.dart`

Fill in YOUR protocol:
- Mounjaro schedule (days, time, dosage)
- Football schedule
- Eating window
- Any other rules

Then run once:
```dart
final protocol = UserProtocol(db);
await protocol.seedProtocol();
```

---

### Step 2: Run Tests (Optional) 🧪

```bash
flutter test test/agents/core_services_test.dart
```

This verifies:
- Intent detection works
- Voice commands work
- Context loading works

---

### Step 3: Integrate with Gemini 🤖

**File:** `lib/core/agents/services/base_agent.dart`

Find this method:
```dart
Future<String> _callAI(String prompt) async {
  // TODO: Replace with actual implementation
  return 'AI response placeholder. Integrate with Gemini 2.5.';
}
```

Replace with:
```dart
Future<String> _callAI(String prompt) async {
  final geminiService = GeminiCoachService(); // Your existing service
  final response = await geminiService.chat(
    message: prompt,
    model: 'gemini-2.5-flash', // or 'gemini-2.5-pro'
  );
  return response;
}
```

---

### Step 4: Update Chat UI 🎨

Show agent type in messages:

```dart
// In your chat widget
Widget buildAgentMessage(ChatMessage message) {
  return Container(
    child: Column(
      children: [
        // Agent header
        Row(
          children: [
            Text(message.agentName), // "🏋️ وكيل اللياقة"
            // ... timestamp
          ],
        ),
        // Message content
        Text(message.content),
      ],
    ),
  );
}
```

---

### Step 5: Use It! 💬

```dart
// In your chat service
final factory = AgentFactory(db);

Future<void> sendMessage(String userMessage) async {
  // 1. Check if voice command
  if (userMessage.contains('وزني') || 
      userMessage.contains('خدت موونجارو')) {
    final memoryManager = MemoryManager(db);
    final response = await memoryManager.processVoiceCommand(userMessage);
    // Display system message
    return;
  }

  // 2. Route to agent
  final response = await factory.routeMessage(userMessage);

  // 3. Display response with agent info
  addMessage(
    content: response.message,
    agentName: response.agentName,
    agentType: response.agentType,
  );
}
```

---

## 📖 Documentation

- **PHASE_1_COMPLETE.md** - Database layer
- **PHASE_2_COMPLETE.md** - Core services
- **PHASE_3_COMPLETE.md** - Agents (← Read this!)
- **USAGE_EXAMPLE.dart** - Integration examples

---

## 🧪 Test Queries

After integration, test with:

**Fitness:**
- "إيه أحسن تمرين النهاردة؟"
- "workout for upper body"

**Nutrition:**
- "اقترحلي وجبة غدا"
- "how much protein today?"

**Health:**
- "إيه حالتي الصحية؟"
- "when should I take mounjaro"

**General:**
- "خطة الأسبوع"
- "how am I doing this month?"

**Voice Commands:**
- "وزني 75.3"
- "خدت موونجارو"

---

## 🎉 You're Ready!

All infrastructure is built. Just:
1. Fill protocol
2. Connect Gemini
3. Update UI
4. Test!

Multi-agent system complete 🚀
