# 🏋️ Health Keeper - Multi-Agent AI Health Coach

A privacy-first AI health companion with specialized coaching agents. Built with Flutter, powered by Gemini 2.5 AI.

---

## 🎯 What is Health Keeper?

Health Keeper transforms your health data into actionable insights through **4 specialized AI coaches**:

- 🏋️ **Fitness Coach** - Training plans, recovery optimization
- 🍎 **Nutrition Coach** - Meal tracking, calorie/macro guidance  
- ❤️ **Health Monitor** - Vital trends, risk patterns
- 🧠 **General Orchestrator** - Holistic advice, agent coordination

All coaches share a unified memory system and are aware of your full health context.

---

## ⚡ Key Features

### 📊 Unified Data Hub (Apple Health)
- Reads **all your health data** from Apple Health App:
  - Smart Scale → Weight, Body Fat, Muscle Mass
  - Whoop → Sleep, HRV, Recovery Score
  - Apple Watch → Steps, Workouts, Active Calories
- Single source of truth for all agents

### 🤖 Multi-Agent AI System
- Each agent specializes in one domain
- **Cross-agent awareness**: Fitness Coach knows what you ate today
- **Shared memory**: Protocol (eating window, medications, football days)
- **Conversation memory**: Agents remember your preferences

### 💬 Intelligent Chat Interface
- Natural conversation with each agent
- **Context panel**: See what data the agent is using
- **Voice input**: Speak to your coaches
- **Quick actions**: Add weight, log meals via chat

### 🔒 Privacy-First
- All data stored **locally** (SQLite encrypted)
- No cloud sync by default
- Photos never leave your device
- You own your data (CSV/JSON export)

---

## 📱 How It Works

```
Apple Health (Hub)
  ↓
Health Keeper App
  ↓
Shared Memory System
  ↓
4 AI Agents (context-aware)
  ↓
Personalized Coaching
```

### Example Conversation (Fitness Coach)

**You:** "عايز خطة تمرين"

**Coach sees:**
- Weight: 94.5kg (trending ⬇️)
- Recovery: 72% (from Whoop)
- Sleep: 7.5h (good quality)
- Meals today: 1850 cal, 125g protein
- Tomorrow: Football (from Protocol)

**Coach responds:**
> "بناءً على recovery score (72%) والكورة بكره، أقترح:
> 
> **Upper Body Light**
> - Bench Press: 3 x 8
> - Rows: 3 x 10
> - Shoulder Press: 3 x 8
> 
> خلي رجليك ترتاح للكورة! ⚽"

---

## 🏗️ Architecture

### Data Flow
1. **HealthKit Sync** (hourly)
2. **Shared Memory** (workspace/shared/)
   - `protocol.json` - Your rules (eating window, meds, activities)
   - `daily/YYYY-MM-DD.json` - Daily logs
   - `conversations/` - Agent chat history
3. **Agent Context** - Each agent loads relevant data
4. **AI Prompt** - Gemini 2.5 generates response
5. **Action Execution** - Save to shared memory if needed

### Tech Stack
- **Flutter** (iOS-first, Android later)
- **Riverpod** (state management)
- **Drift** (local database)
- **HealthKit** (via health package)
- **Gemini 2.5 API** (all AI features)
- **Talker** (logging)

---

## 📂 Project Structure

```
lib/
├── core/
│   ├── agents/
│   │   └── base_agent.dart          # Base class for all agents
│   ├── services/
│   │   ├── shared_memory_manager.dart   # Central data manager
│   │   ├── healthkit_sync_service.dart  # Apple Health sync
│   │   └── gemini_coach_service.dart    # AI integration
│   └── domain/
│       └── entities/
│           ├── protocol.dart
│           ├── daily_data.dart
│           └── agent_context.dart
├── features/
│   ├── agents/
│   │   ├── fitness_agent.dart      # 🏋️ Fitness Coach
│   │   ├── nutrition_agent.dart    # 🍎 Nutrition Coach
│   │   ├── health_agent.dart       # ❤️ Health Monitor
│   │   └── general_agent.dart      # 🧠 Orchestrator
│   ├── home/
│   │   └── screens/home_screen.dart
│   └── chat/
│       └── screens/agent_chat_screen.dart
└── main.dart
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (stable channel)
- iOS device with HealthKit
- Apple Health app configured with:
  - Smart Scale connected
  - Whoop connected
  - Apple Watch paired

### Installation

1. Clone the repo:
```bash
git clone https://github.com/Mohamedatef90/health-keeper.git
cd health-keeper
```

2. Install dependencies:
```bash
flutter pub get
```

3. Add Gemini API key:
```bash
cp .env.example .env
# Edit .env and add your GEMINI_API_KEY
```

4. Run:
```bash
flutter run
```

---

## 📖 Documentation

- **[MULTI_AGENT_ARCHITECTURE.md](docs/MULTI_AGENT_ARCHITECTURE.md)** - Full system design
- **[IMPLEMENTATION_ROADMAP.md](IMPLEMENTATION_ROADMAP.md)** - Development plan
- **[CLAUDE.md](CLAUDE.md)** - Original project spec

---

## 🛠️ Development Status

### ✅ Completed
- Multi-agent architecture design
- Shared memory system (SharedMemoryManager)
- Base agent framework
- Fitness Agent example implementation

### 🔨 In Progress
- Entity classes (Protocol, DailyData, etc.)
- HealthKit integration service
- Gemini 2.5 API integration
- Chat UI implementation

### 📋 Next Steps
See [IMPLEMENTATION_ROADMAP.md](IMPLEMENTATION_ROADMAP.md) for detailed plan.

---

## 🤝 Contributing

This is a personal project, but ideas and suggestions are welcome!

---

## 📄 License

Private project - not licensed for public use.

---

## 💪 Good Luck!

**Start with Phase 2, Priority 1: Entity Classes**

Then move through the roadmap step by step. You've got the foundation - now build on it! 🚀
