# Health Keeper
## Product Report & Feature Documentation

**Version:** 1.0.0
**Platform:** iOS (Apple Watch Integration)
**Technology:** Flutter, Gemini AI
**Report Date:** January 2026

---

## Executive Summary

Health Keeper is a **privacy-first AI health companion** that transforms Apple Watch data into actionable daily coaching. Unlike traditional fitness apps that simply log numbers, Health Keeper provides personalized protocols, intelligent meal tracking via camera AI, and proactive health alerts — delivering a premium coaching experience without compromising user privacy.

### Key Differentiators

| Feature | Health Keeper | Competitors |
|---------|--------------|-------------|
| AI Food Recognition | Camera + Gemini AI estimation | Manual entry only |
| Recovery Scoring | Multi-factor (HRV, RHR, Sleep) | Basic sleep tracking |
| Health Predictions | Illness & overtraining risk alerts | None |
| Protocol Engine | Locked personalized rules | Generic recommendations |
| Data Privacy | Local-first, user-owned | Cloud-dependent |
| Language Support | Arabic (Egypt) + English | English only |

---

## Product Vision

> *"Your personal health coach that spots patterns you can't see, predicts problems before they happen, and guides daily decisions with AI precision — all while keeping your data private."*

### Target Audience

**Primary:** Health-conscious individuals using Apple Watch who want structured nutrition and activity protocols with AI-powered coaching.

**Secondary:** Users seeking a "coach" experience without manual spreadsheets or expensive personal trainers.

---

## Core Features

### 1. Intelligent Recovery System

The heart of Health Keeper — a sophisticated recovery scoring engine that analyzes multiple physiological signals to determine your body's readiness.

**How It Works:**

```
Recovery Score (0-100) =
  HRV Score (40%) +
  RHR Score (25%) +
  Sleep Score (25%) +
  Respiratory Score (10%)
```

**Recovery States:**

| Score | State | Color | Recommendation |
|-------|-------|-------|----------------|
| 67-100 | Peak/Good | Green | Push hard, high intensity OK |
| 34-66 | Moderate | Yellow | Moderate activity, listen to body |
| 0-33 | Low/Rest | Red | Recovery day, light activity only |

**Data Sources:**
- Heart Rate Variability (HRV) from Apple Watch
- Resting Heart Rate (RHR) trends
- Sleep duration & quality
- 7-day rolling baseline for personalization

---

### 2. AI-Powered Strain Tracking

Measures daily physical load on a 0-21 scale (inspired by professional sports science).

**Strain Levels:**

| Score | Level | Description |
|-------|-------|-------------|
| 0-4 | Light | Rest day, minimal exertion |
| 5-9 | Moderate | Light activity, walking |
| 10-13 | Active | Moderate workout |
| 14-17 | Strenuous | Intense training |
| 18-21 | All Out | Maximum effort |

**Intelligence Features:**
- Recovery-aware strain recommendations
- Overtraining risk detection
- Optimal strain targets based on recovery state

---

### 3. Camera Food Recognition

Revolutionary meal logging that takes seconds instead of minutes.

**User Flow:**
1. Point camera at meal
2. AI identifies foods and portions
3. Review/edit macro estimates
4. Confirm to log

**AI Capabilities (Gemini 2.5):**
- Multi-item food recognition
- Portion size estimation
- Calorie calculation
- Macro breakdown (Protein, Carbs, Fat)
- Egyptian cuisine support (Koshari, Ful, etc.)
- Confidence scoring for transparency

**Alternative Logging:**
- Quick templates for repeated meals
- Manual entry for precision
- Photo gallery import

---

### 4. Personalized Protocol Engine

A first-class feature that locks in your health decisions, preventing impulsive changes.

**Protocol Components:**

**Eating Window**
- Configurable start/end times
- Supports intermittent fasting
- Meal timing reminders

**Medications**
- Name, dosage, frequency
- Weekly scheduling (e.g., Mounjaro on Sundays)
- Smart reminders

**Supplements**
- Daily/weekly frequency
- With/without meal preferences
- Timing optimization

**Activity Schedule**
- Weekly workout plan
- Type, duration, intensity
- Rest day configuration

**Lock Mechanism:**
- Prevents frequent protocol changes
- Encourages commitment to plans
- Change history tracking

---

### 5. Proactive Health Alerts

AI-driven health monitoring that warns you before problems occur.

**Alert Types:**

| Alert | Severity | Trigger |
|-------|----------|---------|
| Illness Risk | Critical/High | HRV drop + sleep deficit + elevated RHR |
| Overtraining | High/Medium | Consecutive high strain + low recovery |
| Sleep Debt | Medium | Accumulated sleep deficit > 5 hours |
| Recovery Warning | Medium | Recovery below baseline for 3+ days |

**Proactive Nudges:**
- Context-aware suggestions (max 2 per day)
- Non-intrusive, actionable advice
- "Rescue Day" mode for bad days

---

### 6. AI Daily Brief

Every morning, receive a personalized coaching message.

**Brief Contents:**
- Recovery score interpretation
- Today's recommended intensity (1-5)
- Top 3 action items
- Relevant warnings (max 2)
- Motivational coaching text

**Personalization Factors:**
- Recovery state
- Yesterday's strain
- Protocol adherence
- Sleep quality
- Upcoming scheduled activities

---

### 7. Weekly Reports

AI-generated comprehensive weekly analysis.

**Report Sections:**
- Week summary with key metrics
- Highlights (what went well)
- Concerns (patterns to watch)
- Next week focus areas
- Trend visualizations

**Sharing:**
- Export as PDF
- Share with trainers/coaches
- Historical comparison

---

### 8. Progress Photos

Visual tracking with AI-powered comparison.

**Features:**
- Multi-angle capture (Front, Side, Back)
- Date-stamped gallery
- Side-by-side comparison
- AI-detected changes
- Private local storage

---

### 9. Health Insights Dashboard

Advanced analytics for health optimization.

**Metrics Displayed:**
- Overall Health Score (0-100)
- Illness Risk Probability
- Overtraining Risk Level
- Sleep Debt (hours)
- Behavior Correlations
- 30-Day Pattern Analysis

**Pattern Detection:**
- Sleep vs. recovery correlation
- Strain vs. illness risk
- Nutrition vs. energy levels

---

### 10. Journal & Symptom Tracking

Daily logging for behavior-health correlation.

**Categories:**
- Nutrition behaviors
- Sleep patterns
- Stress levels
- Exercise responses
- Mood tracking
- Custom symptoms

**AI Correlation:**
- Links behaviors to recovery changes
- Identifies triggers
- Suggests optimizations

---

## Technical Architecture

### Technology Stack

| Layer | Technology |
|-------|------------|
| Framework | Flutter 3.x (Stable) |
| State Management | Riverpod |
| Navigation | Go Router |
| Local Database | Drift (SQLite) |
| AI Engine | Google Gemini 2.5 API |
| Health Data | HealthKit (iOS) |
| Notifications | Flutter Local Notifications |
| Serialization | Freezed + JSON Serializable |

### Architecture Pattern

```
┌─────────────────────────────────────────┐
│              UI Layer                    │
│   (Screens, Widgets, Components)         │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│           State Layer                    │
│      (Riverpod Providers)                │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│          Domain Layer                    │
│    (Entities, Use Cases)                 │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│           Data Layer                     │
│  (Repositories, Services, Database)      │
└─────────────────────────────────────────┘
```

### Data Flow

```
Apple Watch → HealthKit → Health Keeper → Local DB
                              ↓
                         Gemini AI
                              ↓
                    Personalized Insights
```

---

## Privacy & Security

### Privacy-First Principles

1. **Local-First Storage**
   - All health data stored on device
   - No cloud sync by default
   - User owns their data

2. **Minimal AI Data**
   - Only necessary context sent to Gemini
   - No PII in AI prompts
   - Responses cached locally

3. **Explicit Consent**
   - Separate permissions for HealthKit
   - Separate consent for AI processing
   - Granular data controls

4. **Data Export**
   - CSV/JSON export for all logs
   - User can take data anywhere
   - No vendor lock-in

5. **No Tracking**
   - No analytics without consent
   - No advertising
   - No data selling

### Security Measures

- SQLCipher encryption for local database
- Secure storage for sensitive preferences
- No cloud credentials stored
- Biometric authentication support (planned)

---

## User Experience

### Design Philosophy

- **Dark-first theme** optimized for health apps
- **Purple-to-magenta gradient** brand identity
- **Minimal cognitive load** — max 2 alerts, 3 actions
- **Arabic-first** with English support
- **No guilt language** — supportive coaching tone

### Key Screens

| Screen | Purpose |
|--------|---------|
| Home | Recovery/Strain rings, daily brief, quick actions |
| Recovery | Detailed recovery metrics and insights |
| Nutrition | Meal logging, macro tracking, AI suggestions |
| Workouts | Activity logging, AI recommendations |
| Protocol | Personal rules management |
| Insights | Health predictions and patterns |
| Progress | Photo tracking and comparison |
| Settings | Privacy controls, data management |

### Accessibility

- Dynamic text scaling
- High contrast colors
- VoiceOver support (iOS)
- RTL layout for Arabic

---

## AI Integration

### Gemini 2.5 Capabilities

| Feature | AI Function |
|---------|-------------|
| Daily Brief | Personalized coaching text generation |
| Food Analysis | Image recognition + macro estimation |
| Training Recs | Recovery-aware workout suggestions |
| Weekly Report | Trend analysis + insight generation |
| Plateau Detection | Pattern analysis + solution suggestions |
| Illness Prediction | Multi-factor risk assessment |
| Health Q&A | Contextual health questions |

### AI Safety Guardrails

- All outputs labeled as "AI-generated estimate"
- All AI outputs user-editable
- Medical disclaimer on health content
- No diagnostic or prescriptive language
- Graceful offline fallback
- Rate limiting for cost management

### Prompt Engineering

- User context included (age, goals, protocol)
- Structured JSON output for parsing
- Safety instructions in system prompt
- Language preference respected
- Coaching tone customizable

---

## Metrics & Success Criteria

### User Experience Metrics

| Metric | Target |
|--------|--------|
| Time to log meal (camera) | < 20 seconds |
| Time to log meal (template) | < 10 seconds |
| Daily check-in completion | > 70% weekly |
| 7-day retention | > 40% |
| 30-day retention | > 25% |
| Average alerts per day | < 2 |

### AI Performance Metrics

| Metric | Target |
|--------|--------|
| Food estimation accuracy | User edits < 30% |
| Weekly report engagement | > 60% view rate |
| Recovery prediction accuracy | > 80% |
| Alert relevance | > 85% actionable |

---

## Competitive Analysis

### vs. WHOOP

| Aspect | Health Keeper | WHOOP |
|--------|--------------|-------|
| Hardware | Uses existing Apple Watch | Requires WHOOP band |
| Price | One-time (planned) | $30/month subscription |
| Food Logging | AI camera recognition | None |
| Protocol Engine | Yes | No |
| Language | Arabic + English | English only |
| Data Privacy | Local-first | Cloud-based |

### vs. MyFitnessPal

| Aspect | Health Keeper | MyFitnessPal |
|--------|--------------|--------------|
| Food Logging | AI camera | Manual/barcode |
| Recovery Tracking | Yes | No |
| Health Predictions | Yes | No |
| Coaching | AI-personalized | Generic |
| Ads | None | Yes (free tier) |

### vs. Apple Health

| Aspect | Health Keeper | Apple Health |
|--------|--------------|--------------|
| Recovery Score | Multi-factor calculation | Basic (if any) |
| AI Coaching | Yes | No |
| Food Recognition | Yes | No |
| Protocol Management | Yes | No |
| Proactive Alerts | Yes | Limited |

---

## Roadmap

### Current Release (v1.0)

- [x] Recovery & Strain scoring
- [x] AI Daily Brief
- [x] Camera food logging
- [x] Protocol management
- [x] Health predictions & alerts
- [x] Progress photos
- [x] Weekly reports
- [x] Journal/symptom tracking
- [x] Arabic + English support

### Future Releases

**v1.1 — Enhanced AI**
- [ ] Voice meal logging
- [ ] Conversational health coach
- [ ] Workout video analysis

**v1.2 — Social & Sync**
- [ ] Optional cloud backup
- [ ] Share with trainer/coach
- [ ] Family sharing

**v1.3 — Platform Expansion**
- [ ] Android support
- [ ] Wear OS integration
- [ ] Web dashboard

**v2.0 — Advanced Features**
- [ ] Continuous glucose monitor integration
- [ ] Sleep environment optimization
- [ ] Genetic factor integration

---

## Business Model (Planned)

### Monetization Strategy

**Freemium Model:**

| Tier | Features | Price |
|------|----------|-------|
| Free | Basic logging, recovery score | $0 |
| Pro | AI coaching, predictions, unlimited photos | $9.99/month |
| Lifetime | All features forever | $99.99 one-time |

### Revenue Projections

*To be determined based on market validation*

---

## Team & Contact

**Project:** Health Keeper
**Status:** Development
**Repository:** Private

---

## Appendix

### A. Screen Inventory

1. Welcome Screen
2. Onboarding Flow
3. Home Dashboard
4. Recovery Details
5. Nutrition / Meal Log
6. Camera Food Recognition
7. Workout Log
8. Protocol Management
9. Weekly Report
10. Progress Photos
11. Journal
12. Health Insights
13. Health Monitor
14. Edit Profile
15. Settings
16. Data Control

### B. Data Models

- UserProfile
- DailyLog
- MealLog + MealItem
- WorkoutLog
- RecoveryMetrics
- Protocol (Medication, Supplement, ScheduledWorkout)
- ProgressPhoto
- HealthPrediction
- JournalEntry

### C. API Integrations

- Google Gemini 2.5 (AI)
- Apple HealthKit (Health Data)
- Flutter Local Notifications (Reminders)

---

*This document is confidential and intended for internal use and authorized stakeholders only.*

**Health Keeper** — *Your AI Health Companion*
