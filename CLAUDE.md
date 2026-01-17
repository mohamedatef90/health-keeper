# Health Keeper (Working Name)

A privacy-first AI health companion built with Flutter. It tracks weight, measurements, nutrition, workouts, sleep, recovery, and uses Apple Watch data (HealthKit) to coach daily decisions, not just log numbers.

> Inspiration: Whoop-style recovery and coaching, but optimized for Apple Watch + camera food logging + a personalized protocol engine.

---

## 1. Repository Type & Scope

- **Repo Type:** Flutter mobile app (iOS-first, Android later).
- **In Scope for this repo:**
  - Flutter UI/UX, navigation, theming, design system tokens
  - Local-first data model (user profile, protocol, logs)
  - HealthKit integration (read Apple Watch metrics)
  - Camera food logging with AI estimation (Gemini 2.5 API)
  - AI coaching UX (daily brief, recommendations, alerts)
  - AI-powered protocol engine with Gemini 2.5
  - Notifications, reminders, weekly reports
  - Progress photos with comparison features
  - Analytics events (privacy-respecting, optional)
- **Out of Scope for this repo:**
  - Backend APIs, user auth server, payments, subscriptions
  - Model training pipelines
  - Medical diagnosis or clinical decision support
  - Admin dashboards, clinician portal
  - Heavy data science infrastructure

**Sister repos (conceptual):**
- `health-keeper-backend` (future): sync, subscriptions, advanced analytics.
- `health-keeper-ml` (future): custom model experiments if needed.

---

## 2. Product Overview

- **Product Type:** AI-powered personal health protocol app for mobile.
- **Core Value Proposition:**
  - Turns Apple Watch signals into a daily "Recovery + Action Plan"
  - Makes food logging fast (camera + AI estimation + quick confirmation + templates)
  - Maintains a personalized protocol (meals window, workouts, medication cadence)
  - Spots risk patterns early (sleep drop + HRV drop + high load, etc.) with calm alerts
  - AI-generated personalized coaching via Gemini 2.5
- **Primary Features:**
  - Profile + Protocol setup (locks decisions, gradual changes)
  - Daily logging (weight, measurements, meals, workouts, mood, symptoms)
  - Apple Watch metrics via HealthKit (sleep, HRV, RHR, steps, activity)
  - AI-powered recovery score + training readiness + recommendations
  - AI nutrition coaching: calorie/protein targets, meal timing insights, food recognition
  - AI workout planning: weekly plan, deload suggestions, injury-aware guidance
  - Progress photos with AI-powered comparison and insights
  - AI-generated weekly brief: summary + what worked + next week focus
  - Plateau detection with AI-driven suggestions
  - Rescue Day mode with personalized recovery plans

---

## 3. Target Users & Audience

- **Primary audience:** Individuals following a structured nutrition + activity protocol, using Apple Watch, and wanting AI coaching plus logging.
- **Secondary audience:** People who want a "coach" experience without manual spreadsheets.
- **Tone & Style:**
  - Straight-to-the-point, supportive, not preachy
  - Calm alerts, no guilt language
  - "Coach" vibe, not "doctor" vibe

**Languages:**
- UI: Arabic (Egypt) + English (toggle), Arabic-first.
- Code and file content: English.
- Content rules:
  - UI labels short, clear
  - Coaching copy: human, concise, actionable (AI-generated via Gemini)
  - Always include "This is not medical advice" disclaimer in relevant screens.

---

## 4. Current Phase & Priorities

- **Phase:** Full Feature Build (iOS-first).
- **Build Approach:** Complete functionality, no MVP phasing.
- **Top Priorities:**
  1) Complete data model + local-first logging (fast, reliable, offline-capable)
  2) HealthKit integration (sleep, HRV, RHR, activity)
  3) Gemini 2.5 AI integration for all coaching features
  4) Camera food logging with AI estimation
  5) Full protocol engine with AI-powered recommendations
  6) Progress photos with AI comparison
  7) Weekly reports with AI insights

**Not in scope:**
- Social features, community, leaderboards
- Multi-device sync (single device for now)
- Backend infrastructure
- Subscription/payments

---

## 5. Technical Stack & Constraints

- **Mobile tech:** Flutter (stable channel)
- **State management:** Riverpod
- **Navigation:** go_router
- **Local DB:** Drift (SQLite)
- **Health integration:** HealthKit via health package (iOS-first)
- **Camera:** camera plugin + image_picker fallback
- **Notifications:** flutter_local_notifications
- **Charts:** fl_chart (simple, performant)
- **Networking:** Dio
- **Serialization:** freezed + json_serializable
- **Logging:** talker

**AI Implementation:**
- **Primary AI Provider:** Google Gemini 2.5 API
- **AI Features:**
  - Recovery score calculation with personalized insights
  - Training readiness recommendations
  - Food recognition from camera images
  - Calorie/macro estimation from food photos
  - Daily brief generation (personalized coaching text)
  - Weekly report generation with trend analysis
  - Plateau detection and suggestions
  - Rescue Day plan generation
  - Progress photo analysis and comparison
- **AI Service Architecture:**
  - All AI calls go through `GeminiCoachService` abstraction
  - Graceful offline fallback to cached responses or basic rules
  - All AI outputs are editable by user
  - Rate limiting and caching to manage API costs

**Constraints:**
- Privacy-first, minimal data collection
- Offline-capable for core logging (AI features need network)
- Battery-friendly background reads (HealthKit)
- Not a medical device, no diagnosis
- Clear user consent for HealthKit, photos, and AI processing
- AI responses cached locally for offline viewing

---

## 6. Multi-Agent Collaboration Hints

- **Main entry agent:** `Product Orchestrator`
- **Key active roles:**
  - Business Analyst: requirements, edge cases, success metrics
  - UX Engineer: flows, screens, friction reduction
  - Flutter Engineer: architecture, components, implementation
  - AI Systems Specialist: Gemini integration, prompts, safety, evaluation
  - QA/Test Engineer: critical paths, regression suite
  - Privacy/Security Reviewer: permissions, data storage, disclaimers

**High-level rules:**
- Treat this repo as mobile-only.
- Do not design backend/database servers here, only define interfaces and stubs.
- AI features use Gemini 2.5 API - design prompts carefully.
- Any AI output must be editable by the user and framed as an estimate.
- Always propose changes as small PR-sized steps.

---

## 7. Output Style Preferences

- **Language:**
  - Explanations: Arabic (Egypt) primarily, English acceptable for technical terms.
  - Code: English only.
- **Response structure:**
  1) What is being changed
  2) Step-by-step plan
  3) Final output: files, diffs, or code blocks
- **Preferences:**
  - Be explicit about assumptions vs facts.
  - Avoid fluff.
  - Build complete features, not partial implementations.

---

## 8. Known Limitations / Decisions

- We do not:
  - Provide medical advice or medication instructions beyond user-entered schedules.
  - Store photos or health data in cloud by default.
  - Use shame-based notifications.
  - Send health data to AI without user consent.
- We already decided:
  - Flutter app, Apple Watch data via HealthKit
  - Local-first data storage
  - Gemini 2.5 API for all AI features
  - Whoop inspiration, but not a clone
  - Protocol engine exists as first-class feature
  - Full feature build (no MVP phasing)

---

## 9. Core Domain Model

**Entities:**
- `UserProfile`
  - id, createdAt, updatedAt
  - height, age, gender (optional), timezone
  - goals: targetWeight, targetWaist, targetSteps, etc.
  - aiPreferences: coachingTone, language
- `Protocol`
  - id, userId, createdAt, updatedAt
  - eatingWindowStart, eatingWindowEnd
  - medicationSchedule (name, dose, weekday, time)
  - weeklyActivityPlan (e.g. walking, futsal day)
  - constraints (no gym until date, injury notes)
  - "lockedUntil" date to limit frequent changes
- `ProtocolSnapshot`
  - id, protocolId, effectiveDate
  - serializedProtocol, changeReason
- `DailyLog`
  - id, date, createdAt, updatedAt
  - weight (optional)
  - notes
  - moodEnergy (1-5), hunger (1-5), stress (1-5)
  - symptoms (optional list)
- `MeasurementLog`
  - id, dailyLogId, date
  - waist, chest, hip, thigh, arm (all optional)
- `MealLog`
  - id, dailyLogId, time, createdAt
  - method: manual | camera | template
  - photoUri (optional)
  - templateId (optional)
  - aiAnalysisId (optional)
- `MealItem`
  - id, mealLogId
  - name, portion
  - caloriesEstimate, proteinEstimate, carbsEstimate, fatEstimate
  - isAiEstimate, isUserEdited
  - confidence (0-100)
- `WorkoutLog`
  - id, dailyLogId, date
  - type, duration, intensity, notes
  - source: manual | watch
  - caloriesBurned
- `RecoveryMetrics`
  - id, dailyLogId, date, fetchedAt
  - sleepDuration, sleepQuality (if available)
  - HRV, restingHR
  - steps, activeEnergy, workoutsCount
  - dataSource: healthkit | manual
- `DailyBrief`
  - id, date, generatedAt
  - recoveryScore (0-100), readinessScore (0-100)
  - topActions (list, max 3)
  - warnings (list, max 2)
  - suggestedIntensity (1-5)
  - coachingText (AI-generated)
  - isAiGenerated
- `WeeklyReport`
  - id, weekStartDate, generatedAt
  - summary, highlights, concerns
  - progressAnalysis
  - nextWeekFocus
  - isAiGenerated
- `ProgressPhoto`
  - id, userId, date, photoUri
  - bodyPart: front | side | back
  - notes
- `AiFoodAnalysis`
  - id, mealLogId, photoUri
  - rawResponse, parsedItems
  - confidence, processingTime
  - model: gemini-2.5

---

## 10. Protocol Defaults (seeded, user-editable)

Seed the app with sensible defaults that the user can edit:
- Eating window: 11:00 to 20:00
- Medication schedule: weekly reminder (Sunday morning) for Mounjaro 5mg
- Weekly activity: walking daily target, futsal on Monday
- "Special meal": Pizza Saturday mode (user-defined template)

Important: store these as user data, not hard-coded constants.

---

## 11. AI Engine (Gemini 2.5)

**AI Provider:** Google Gemini 2.5 API

**AI-Powered Features:**

### 11.1 Recovery Score & Daily Brief
- Input: HealthKit data (sleep, HRV, RHR, activity), recent logs, protocol
- Output: Recovery score (0-100), readiness score, personalized coaching text
- Prompt includes user context, recent trends, protocol constraints

### 11.2 Food Recognition & Estimation
- Input: Camera photo of meal
- Output: Identified foods, portions, calories, macros (protein, carbs, fat)
- User can edit all estimates before saving
- Confidence score displayed

### 11.3 Training Recommendations
- Input: Recovery score, protocol, workout history, injury constraints
- Output: Recommended workout type, intensity, duration
- Considers: recovery state, scheduled activities, recent load

### 11.4 Plateau Detection & Suggestions
- Input: Weight/measurement history (14+ days), meal logs, activity
- Output: Plateau detected (yes/no), potential causes, actionable suggestions
- AI analyzes patterns and correlations

### 11.5 Weekly Report Generation
- Input: All logs from the week, protocol adherence, progress
- Output: Summary, highlights, concerns, next week focus
- Personalized insights based on user's specific protocol

### 11.6 Rescue Day Mode
- Input: User triggers "bad day", current state
- Output: Personalized recovery plan (nutrition, activity, sleep suggestions)

### 11.7 Progress Photo Analysis
- Input: Two progress photos (before/after)
- Output: Visual comparison insights, detected changes
- Privacy: Photos processed via API, not stored on server

**AI Safety & Guardrails:**
- All AI outputs labeled as "AI-generated estimate"
- All AI outputs editable by user
- Medical disclaimer on all health-related AI content
- No diagnostic or prescriptive medical language
- Graceful fallback when offline or API unavailable
- Rate limiting to manage costs
- Response validation before display

**Prompt Engineering Principles:**
- Include user context (age, goals, protocol)
- Specify output format (JSON for structured data)
- Include safety instructions in system prompt
- Use Arabic or English based on user preference
- Keep coaching tone supportive, not preachy

---

## 12. Key User Flows

### Onboarding:
- Welcome -> consent (HealthKit, AI, photos) -> profile -> protocol setup -> first daily brief

### Daily Home:
- Recovery ring + readiness score
- AI-generated "3 actions today"
- Quick add buttons: weight, meal, workout, mood
- Warnings/alerts (max 2)

### Meal Logging:
- Camera capture -> Gemini analyzes -> shows estimates -> user confirms/edits -> save
- OR: Templates -> 1-tap repeat meals
- OR: Manual entry

### Workout:
- AI-suggested plan based on recovery
- Log workout -> adjust intensity -> save
- Import from Apple Watch

### Weekly Brief:
- AI-generated progress summary
- What worked this week
- Concerns/patterns detected
- Next week focus

### Progress Photos:
- Capture front/side/back
- Compare with previous (AI-assisted insights)
- Privacy controls

### Settings:
- Privacy controls, exports, HealthKit connection
- Protocol management (with lock)
- AI preferences (tone, language)
- Data export (CSV/JSON)

---

## 13. Architecture & Folder Structure

```
lib/
├── app/
│   ├── router.dart
│   ├── theme.dart
│   └── localization/
├── features/
│   ├── onboarding/
│   ├── home/
│   ├── nutrition/
│   ├── workouts/
│   ├── recovery/
│   ├── protocol/
│   ├── reports/
│   ├── progress_photos/
│   └── settings/
├── core/
│   ├── data/
│   │   ├── database/
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   └── usecases/
│   ├── services/
│   │   ├── healthkit_service.dart
│   │   ├── gemini_coach_service.dart
│   │   ├── notification_service.dart
│   │   └── photo_service.dart
│   └── ui/
│       ├── components/
│       └── tokens/
└── main.dart
```

**Strict layering:**
- UI -> UseCases -> Repositories -> DataSources/Services

---

## 14. Testing & Quality Bar

- **Unit tests:**
  - AI response parsing
  - Data transformations
  - Use case logic
- **Widget tests:**
  - Home screen, quick add flows
  - AI response display components
- **Integration tests:**
  - Onboarding happy path
  - Meal logging with camera
  - Daily brief generation
- **AI-specific tests:**
  - Prompt template validation
  - Response parsing edge cases
  - Fallback behavior when offline
- **Critical paths coverage:**
  - HealthKit permission denied -> graceful degradation
  - Gemini API unavailable -> cached/fallback response
  - Offline mode -> logging works, AI features show cached
  - Database migration safety

---

## 15. Security & Privacy

- Health data stored locally encrypted (SQLCipher via Drift).
- Photos stored locally by default.
- Explicit permissions with clear explanation screens.
- AI data processing:
  - User consents to AI processing separately
  - Minimal data sent to Gemini (only what's needed)
  - No PII in prompts where avoidable
  - AI responses cached locally
- Export feature:
  - CSV/JSON export for all logs
  - User owns their data
- Never claim medical accuracy.
- Any AI estimate must show "AI estimate - tap to edit" label.

---

## 16. Success Metrics

- Time to log a meal (camera): under 20 seconds with AI
- Time to log a meal (template): under 10 seconds
- Daily check-in completion: >70% weekly
- Retention: 7-day retention >40%, 30-day >25%
- Alert fatigue: average alerts < 2/day
- AI accuracy (food estimation): user edits <30% of AI estimates
- Weekly brief engagement: >60% of users view weekly report

---

## 17. AI Cost Management

**Gemini 2.5 API Usage Estimates:**

| Feature | Calls/User/Day | Est. Tokens | Priority |
|---------|----------------|-------------|----------|
| Daily Brief | 1 | ~500 | High |
| Food Analysis | 3-5 | ~800 each | High |
| Training Rec | 1 | ~300 | Medium |
| Weekly Report | 0.14 (1/week) | ~1000 | Medium |

**Cost Optimization:**
- Cache AI responses locally
- Batch requests where possible
- Use lighter prompts for simple tasks
- Rate limit per user per day
- Offline fallback to cached content

---

## 18. Claude Code Working Agreement

When implementing:
- Build complete features, not partial implementations.
- Keep PRs focused but complete:
  - One feature per PR with full functionality
- Always update:
  - `README.md` with setup steps
  - Migrations if DB changes
  - Tests for new logic
- Provide:
  - File list + diffs
  - Short reasoning for tradeoffs
- AI integration:
  - All Gemini calls go through `GeminiCoachService`
  - Include prompt templates in code
  - Handle API errors gracefully
  - Cache responses appropriately

End.
