# Health Keeper

A Flutter health companion that reads Apple Health data, calculates recovery and strain scores, and offers four AI coaching agents powered by Google Gemini. Data is stored locally in a SQLite database (Drift). iOS is the primary target; Android project files exist as well.

## Features

- **Apple Health sync:** reads steps, activity, workouts, and other metrics through the `health` package (`lib/core/services/healthkit_service.dart`).
- **Recovery and strain scores:** a WHOOP-inspired recovery calculator (HRV, resting heart rate, sleep, compared to a 7-day baseline) and a strain calculator (`lib/core/domain/services/`), shown as dials on the Overview screen.
- **Four coaching agents:** Fitness, Nutrition, Health Monitor, and a General orchestrator, all built on a shared agent base class, with shared context and memory (`lib/core/agents/`). Chat screens live in `lib/features/coach_chat/`.
- **Workouts and nutrition:** workout templates, an exercise library, AI workout recommendations, weekly workout and meal plans, a meal log, a camera food screen (photos are sent to Gemini for analysis), and a bundled set of Egyptian meals.
- **Health monitor and insights:** health alerts, pattern insights, sleep debt, overtraining and illness risk cards, and a weekly report.
- **Protocol:** medications, supplements, and workout schedule with local notifications.
- **Master plan:** an AI-assisted plan with pending changes, plus autonomy settings.
- **Progress photos and journal:** photo tracking with Gemini-based comparison, and a behavior journal.
- **Data control:** export of all user data to JSON or CSV (`lib/features/settings/data/services/data_export_service.dart`).

The app has four main tabs: Overview, Health, Insights, and Profile (`lib/features/shell/`).

## Tech stack

- Flutter (Dart SDK `^3.10.4`)
- Riverpod for state, `go_router` for navigation
- Drift on SQLite for local storage
- `health` package for Apple Health, `flutter_local_notifications`, `camera` and `image_picker`
- Google Gemini through `google_generative_ai` (the code uses the model `gemini-2.0-flash`)
- `fl_chart` for charts, `freezed` and `json_serializable` for models

## Getting started

Prerequisites: the Flutter SDK, and for Apple Health a physical iOS device.

```bash
git clone https://github.com/mohamedatef90/health-keeper.git
cd health-keeper
flutter pub get
cp .env.example .env     # then set GEMINI_API_KEY
flutter run
```

Environment variable (see `.env.example`): `GEMINI_API_KEY`. `.env` is loaded at startup and is listed as an asset in `pubspec.yaml`.

Generated code (Drift, Freezed, Riverpod) is built with `build_runner`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Tests are in `test/agents/`:

```bash
flutter test
```

## Project structure

```
lib/
  app/                 Router and theme
  core/
    agents/            Base agent, the four agents, router, memory, shared context
    data/database/     Drift database and tables
    domain/            Entities and recovery/strain calculators
    providers/         Riverpod providers
    services/          HealthKit, Gemini, notifications, photos, planning
    ui/                Design tokens and shared components
  features/            home, health_tab, insights, coach, coach_chat, nutrition, protocol,
                       planning, journal, progress_photos, settings, onboarding, ...
test/agents/           Agent and core service tests
docs/                  Architecture and Apple Health integration notes
memory-bank/           Product reports and analysis
```

More notes: `docs/MULTI_AGENT_ARCHITECTURE.md`, `docs/SHARED_MEMORY_SCHEMA.md`, `docs/APPLE_HEALTH_INTEGRATION.md`, and `CLAUDE.md`.
