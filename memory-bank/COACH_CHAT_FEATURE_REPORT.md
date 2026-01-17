# Health Keeper - Coach Chat Feature Report

**Date:** 2026-01-17
**Version:** 1.0
**Status:** Feature Specification & Implementation Plan
**Contributors:** Product Orchestrator, Business Analyst, AI Systems Specialist, Flutter Engineer

---

## Executive Summary

This report documents the **Coach Chat** feature — a ChatGPT-like intelligence layer to be added to Health Keeper. This feature transforms the existing app into an interactive AI health coaching platform where users can have conversations with a domain-specific AI coach that reads their personal health data, proposes changes to their protocols, and executes approved modifications to their plans.

### Key Highlights

| Aspect | Decision |
|--------|----------|
| **Feature Type** | In-app chat window (bottom sheet/modal) |
| **AI Model** | Gemini 2.5 via existing `GeminiCoachService` |
| **Data Access** | HealthKit metrics + all app logs (meals, workouts, recovery, protocol) |
| **Write Operations** | Only via user-approved Action Proposals |
| **Large Changes** | Always require explicit confirmation |
| **UI Impact** | Minimal — adds Coach button + bottom sheet, no screen redesign |
| **Implementation** | 6 PR-sized increments |

### What Makes This Different

Unlike the existing AI features (daily brief, food recognition), Coach Chat provides:
1. **Conversational interaction** — Users ask questions, get context-aware answers
2. **Proactive suggestions** — AI notices patterns and suggests actions
3. **Executable proposals** — AI can propose changes that actually modify user data
4. **Strict safety** — All writes require explicit approval with audit logging

---

## Part 1: Business Analysis

### 1.1 Problem Statement

**Current State:**
Users receive AI-generated insights (daily brief, food analysis, weekly reports) but cannot:
- Ask follow-up questions about their data
- Request modifications to their plans through natural conversation
- Get real-time coaching when situations change

**Desired State:**
A conversational AI coach that:
- Understands user context (today's recovery, calories consumed, upcoming workouts)
- Responds to questions ("Should I work out today?" "What should I eat for dinner?")
- Proposes actionable changes ("Move soccer to Wednesday since recovery is low")
- Executes approved changes with full audit trail

### 1.2 User Value Proposition

| User Need | How Coach Chat Solves It |
|-----------|-------------------------|
| "I want quick answers about my health data" | Ask in natural language, get contextual response |
| "I need help adjusting my plan when things change" | AI proposes reschedule, user approves with one tap |
| "I don't want to manually edit everything" | AI can execute approved changes automatically |
| "I worry about AI making wrong changes" | All changes require explicit confirmation |

### 1.3 Use Cases

**UC-01: Contextual Health Question**
```
User opens Coach Chat from Nutrition screen
User: "How many calories do I have left today?"
Coach: "You've consumed 1,450 of your 2,000 calorie target.
        You have 550 calories remaining.
        Based on your recovery (72%), I suggest a balanced dinner
        with lean protein. Want me to suggest some options?"
[Quick Replies: "Suggest dinner", "Show meal history", "No thanks"]
```

**UC-02: Training Plan Modification (Requires Confirmation)**
```
User opens Coach Chat from Home screen
Coach (proactive): "I noticed your recovery score is 38 (low) today
                    and you have soccer scheduled tomorrow.
                    Want me to propose rescheduling?"
User: "Yes, move it to Wednesday"
Coach: Shows Proposal Card:
       "📋 Reschedule Soccer
        From: Monday (tomorrow)
        To: Wednesday
        Reason: Low recovery (38) + high strain yesterday
        [Approve] [Reject] [Edit]"
User taps [Approve]
Coach: "Done! Soccer moved to Wednesday. I've adjusted your week:
        - Tuesday: Light recovery walk
        - Wednesday: Soccer (high intensity)
        - Thursday: Rest day"
```

**UC-03: Nutrition Compensation**
```
User: "I had pizza last night (2,500 calories). Help me compensate."
Coach: "Yesterday you exceeded your target by 800 calories.
        Here's a 3-day compensation plan:
        - Today: 1,700 cal (vs 2,000 target)
        - Tomorrow: 1,800 cal
        - Day 3: 1,900 cal
        This gentle deficit will balance out by Saturday.
        [Apply Plan] [Modify] [Skip]"
```

### 1.4 Non-Goals

| Explicitly Out of Scope | Rationale |
|------------------------|-----------|
| Redesigning existing UI screens | Minimizes risk, maintains familiarity |
| Backend sync / cloud storage | Local-first principle |
| Medical diagnosis or medication dosing | Not a medical device |
| Always-on background AI | Battery/cost concerns |
| General knowledge chitchat | Domain-specific coach only |

---

## Part 2: Technical Architecture

### 2.1 Architecture Overview

```
┌────────────────────────────────────────────────────────────────────────┐
│                         COACH CHAT FEATURE                              │
├────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                    PRESENTATION LAYER                             │  │
│  │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐   │  │
│  │  │ CoachChatButton │  │CoachChatBottom  │  │  ProposalCard   │   │  │
│  │  │ (FAB on screens)│  │    Sheet        │  │ Approve/Reject  │   │  │
│  │  └─────────────────┘  └─────────────────┘  └─────────────────┘   │  │
│  └──────────────────────────────────────────────────────────────────┘  │
│                                    │                                    │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                      DOMAIN LAYER                                 │  │
│  │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐   │  │
│  │  │SendChatMessage  │  │RequestCoachReply│  │ApproveProposal  │   │  │
│  │  │    UseCase      │  │    UseCase      │  │    UseCase      │   │  │
│  │  └─────────────────┘  └─────────────────┘  └─────────────────┘   │  │
│  └──────────────────────────────────────────────────────────────────┘  │
│                                    │                                    │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                     SERVICES LAYER                                │  │
│  │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐   │  │
│  │  │ CoachAgent      │  │ CoachContext    │  │ ActionExecutor  │   │  │
│  │  │   Service       │  │   Builder       │  │   Service       │   │  │
│  │  └────────┬────────┘  └─────────────────┘  └─────────────────┘   │  │
│  │           │                                                       │  │
│  │           ▼                                                       │  │
│  │  ┌─────────────────┐                                              │  │
│  │  │GeminiCoachService│ ← Uses EXISTING service                    │  │
│  │  │    (existing)   │                                              │  │
│  │  └─────────────────┘                                              │  │
│  └──────────────────────────────────────────────────────────────────┘  │
│                                    │                                    │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                       DATA LAYER                                  │  │
│  │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐   │  │
│  │  │  ChatRepository │  │ProposalRepository│  │  AuditLogRepo  │   │  │
│  │  └─────────────────┘  └─────────────────┘  └─────────────────┘   │  │
│  │                                                                   │  │
│  │  ┌───────────────────────────────────────────────────────────┐   │  │
│  │  │              DRIFT DATABASE (SQLite)                       │   │  │
│  │  │  NEW TABLES: ChatThreads, ChatMessages, ActivityEvents,   │   │  │
│  │  │  TrainingPlans, TrainingPlanSessions, PendingProposals,   │   │  │
│  │  │  AuditLog                                                  │   │  │
│  │  └───────────────────────────────────────────────────────────┘   │  │
│  └──────────────────────────────────────────────────────────────────┘  │
│                                                                         │
└────────────────────────────────────────────────────────────────────────┘
```

### 2.2 Agent + Tools Pattern

The Coach Chat uses an **Agent + Tools** architecture:

1. **User sends message** → Stored in ChatMessages
2. **CoachContextBuilder** → Gathers relevant data (recovery, meals, protocol, etc.)
3. **CoachAgentService** → Sends context + message to Gemini with strict prompt
4. **Gemini returns** → Assistant text + optional ActionProposals + quick replies
5. **ActionProposals stored** → In PendingProposals table
6. **User approves** → ActionExecutor validates and applies to DB
7. **AuditLog records** → All mutations logged

```
User Message
     │
     ▼
┌─────────────────┐
│ CoachContext    │ ← Gathers: today's data, 7-day trends, protocol, current plan
│    Builder      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ CoachAgent      │ ← Builds system prompt, calls Gemini, parses response
│   Service       │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Gemini 2.5 API  │ ← Returns JSON: assistant_text, quick_replies, proposals
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Response Parser │ ← Validates JSON, creates ActionProposal objects
└────────┬────────┘
         │
         ├──────────────────┐
         │                  │
         ▼                  ▼
┌─────────────────┐  ┌─────────────────┐
│ ChatMessage     │  │ PendingProposal │ ← Only created if AI proposes changes
│   (stored)      │  │   (stored)      │
└─────────────────┘  └─────────────────┘
                            │
                     User taps Approve
                            │
                            ▼
                    ┌─────────────────┐
                    │ ActionExecutor  │ ← Validates constraints, applies mutations
                    └────────┬────────┘
                             │
                    ┌────────┴────────┐
                    │                 │
                    ▼                 ▼
            ┌─────────────┐   ┌─────────────┐
            │  DB Writes  │   │  AuditLog   │
            │  (actual    │   │  (record)   │
            │   changes)  │   │             │
            └─────────────┘   └─────────────┘
```

### 2.3 Key Design Decisions

| Decision | Rationale |
|----------|-----------|
| **Bottom sheet, not new screen** | Preserves existing navigation, less disruptive |
| **Context-aware** | Chat opened from Nutrition screen focuses on nutrition data |
| **Proposals, not direct writes** | User always in control, can reject AI suggestions |
| **Large scope = always confirm** | Training plan changes are critical, no auto-apply |
| **Audit logging** | Track all AI-driven changes for transparency |
| **Minimal context to AI** | Privacy-first, only send necessary data |
| **Cache responses** | Reduce API costs, offline fallback |

---

## Part 3: Data Model Changes

### 3.1 New Drift Tables (7 Tables)

#### Table 1: ChatThreads
```dart
class ChatThreads extends Table {
  TextColumn get id => text()();  // UUID
  TextColumn get title => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
```

#### Table 2: ChatMessages
```dart
class ChatMessages extends Table {
  TextColumn get id => text()();  // UUID
  TextColumn get threadId => text().references(ChatThreads, #id)();
  TextColumn get role => text()();  // 'user' | 'assistant' | 'system'
  TextColumn get text => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get contextTag => text().nullable()();  // 'home' | 'nutrition' | 'workouts' | 'recovery'
  TextColumn get attachmentsJson => text().nullable()();  // References to logs
  TextColumn get proposalId => text().nullable().references(PendingProposals, #id)();

  @override
  Set<Column> get primaryKey => {id};
}
```

#### Table 3: ActivityEvents
```dart
class ActivityEvents extends Table {
  TextColumn get id => text()();  // UUID
  TextColumn get type => text()();  // 'soccer' | 'walk' | 'run' | 'strength' | 'workday_high_load' | 'recovery' | 'other'
  DateTimeColumn get startAt => dateTime()();
  DateTimeColumn get endAt => dateTime().nullable()();
  IntColumn get durationMin => integer().nullable()();
  IntColumn get intensity => integer().nullable()();  // 1-5
  TextColumn get source => text()();  // 'healthkit' | 'manual'
  TextColumn get notes => text().nullable()();
  RealColumn get derivedStrain => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
```

#### Table 4: TrainingPlans
```dart
class TrainingPlans extends Table {
  TextColumn get id => text()();  // UUID
  DateTimeColumn get weekStartDate => dateTime()();  // Monday of the week
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get templateId => text().nullable()();
  TextColumn get status => text()();  // 'active' | 'archived'
  IntColumn get version => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
```

#### Table 5: TrainingPlanSessions
```dart
class TrainingPlanSessions extends Table {
  TextColumn get id => text()();  // UUID
  TextColumn get planId => text().references(TrainingPlans, #id)();
  IntColumn get dayOfWeek => integer()();  // 1-7 (Mon-Sun)
  TextColumn get sessionType => text()();  // 'soccer' | 'walk' | 'run' | 'strength' | 'mobility' | 'rest' | 'custom'
  IntColumn get durationMin => integer()();
  IntColumn get intensity => integer()();  // 1-5
  TextColumn get title => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get tutorialRefsJson => text().nullable()();  // Future: exercise refs
  BoolColumn get isLocked => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
```

#### Table 6: PendingProposals
```dart
class PendingProposals extends Table {
  TextColumn get id => text()();  // UUID
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get type => text()();  // 'reschedule_session' | 'add_session' | 'nutrition_target' | etc.
  TextColumn get scope => text()();  // 'small' | 'large'
  BoolColumn get requiresConfirmation => boolean()();  // Always true for scope=large
  TextColumn get status => text()();  // 'pending' | 'approved' | 'rejected' | 'expired'
  TextColumn get proposalJson => text()();  // Full ActionProposal JSON
  TextColumn get contextTag => text()();  // Where it was proposed
  TextColumn get previewTitle => text()();
  TextColumn get previewSummary => text()();

  @override
  Set<Column> get primaryKey => {id};
}
```

#### Table 7: AuditLogs
```dart
class AuditLogs extends Table {
  TextColumn get id => text()();  // UUID
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get actionType => text()();  // 'reschedule_session' | 'approve_proposal' | etc.
  TextColumn get summaryText => text()();
  TextColumn get proposalId => text().nullable().references(PendingProposals, #id)();
  TextColumn get beforeJson => text().nullable()();  // Lightweight before snapshot
  TextColumn get afterJson => text().nullable()();   // Lightweight after snapshot

  @override
  Set<Column> get primaryKey => {id};
}
```

### 3.2 Migration Strategy

```dart
// Database version: 3 → 4
class AppDatabase extends _$AppDatabase {
  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (migrator, from, to) async {
        if (from < 4) {
          // Add Coach Chat tables
          await migrator.createTable(chatThreads);
          await migrator.createTable(chatMessages);
          await migrator.createTable(activityEvents);
          await migrator.createTable(trainingPlans);
          await migrator.createTable(trainingPlanSessions);
          await migrator.createTable(pendingProposals);
          await migrator.createTable(auditLogs);
        }
      },
    );
  }
}
```

**Rollback Note:** If migration fails, app should:
1. Log error via Talker
2. Attempt rollback (drop new tables)
3. Notify user that Coach Chat feature is unavailable
4. Continue with existing functionality

---

## Part 4: Action Proposal Schema

### 4.1 Top-Level Structure

```json
{
  "proposal_id": "uuid-string",
  "type": "reschedule_session",
  "scope": "large",
  "requires_confirmation": true,
  "preview": {
    "title": "Move Soccer to Wednesday",
    "summary": "Recovery is low (38). Moving soccer from Monday to Wednesday allows 2 recovery days."
  },
  "actions": [
    { "action_type": "...", "...action-specific fields..." }
  ],
  "constraints": [
    "No high intensity on consecutive days",
    "Respect knee pain constraint"
  ],
  "reasoning_short": [
    "Recovery score is 38 (low)",
    "Yesterday's strain was 16 (high)",
    "Wednesday shows projected recovery of 65"
  ],
  "safe_to_auto_apply": false
}
```

### 4.2 Action Types

#### Nutrition Actions
```json
// Set nutrition targets
{
  "action_type": "set_nutrition_targets",
  "date": "2026-01-18",
  "calories_target": 1800,
  "protein_g": 120,
  "carbs_g": 200,
  "fat_g": 60,
  "water_ml": 2500,
  "reason": "Compensation for yesterday's excess"
}

// Suggest recipe (not a DB write unless saved)
{
  "action_type": "suggest_recipe",
  "title": "Grilled Chicken Salad",
  "ingredients": ["chicken breast 150g", "mixed greens 100g", "olive oil 1 tbsp"],
  "steps": ["Grill chicken...", "Combine with greens..."],
  "estimated_calories_range": [350, 400],
  "macros": { "protein": 35, "carbs": 12, "fat": 18 },
  "cuisine_tag": "mediterranean"
}
```

#### Training Plan Actions (All scope=large)
```json
// Reschedule session
{
  "action_type": "reschedule_session",
  "plan_id": "uuid",
  "session_id": "uuid",
  "from_day": 1,
  "to_day": 3,
  "reason": "Low recovery"
}

// Add session
{
  "action_type": "add_session",
  "plan_id": "uuid",
  "day_of_week": 4,
  "session_type": "strength",
  "duration_min": 45,
  "intensity": 3,
  "title": "Upper Body Strength"
}

// Cancel session
{
  "action_type": "cancel_session",
  "plan_id": "uuid",
  "session_id": "uuid",
  "reason": "Illness recovery"
}
```

#### Activity Event Actions
```json
{
  "action_type": "add_activity_event",
  "type": "soccer",
  "start_at": "2026-01-20T18:00:00",
  "duration_min": 90,
  "intensity": 4,
  "source": "manual",
  "notes": "Weekly futsal match"
}
```

---

## Part 5: Validation Rules

### 5.1 Hard Constraints (ActionExecutor)

| Rule | Validation | Reject If |
|------|------------|-----------|
| **Training plan changes** | Check scope | scope != "large" OR requires_confirmation != true |
| **Consecutive high intensity** | Check day before and after | Two 4-5 intensity sessions back-to-back without explicit override |
| **Recovery state** | Check today's recovery | Scheduling high intensity when recovery < 40 |
| **Soccer = high load** | Auto-tag | Day after soccer must be <= intensity 2 |
| **Knee pain constraint** | Check protocol | Adding high-impact run/plyo when knee pain is flagged |
| **Medication changes** | Block | Never allow, only reminder scheduling |

### 5.2 Validation Flow

```dart
class ActionExecutor {
  Future<ExecutionResult> applyProposal(ActionProposal proposal) async {
    // Step 1: Pre-validation
    final validationResult = await _validateProposal(proposal);
    if (!validationResult.isValid) {
      return ExecutionResult.rejected(validationResult.errors);
    }

    // Step 2: Check constraints
    final constraintResult = await _checkConstraints(proposal);
    if (!constraintResult.satisfied) {
      return ExecutionResult.constraintViolation(constraintResult.violations);
    }

    // Step 3: Create before snapshot
    final beforeSnapshot = await _createSnapshot(proposal.affectedEntities);

    // Step 4: Apply mutations
    await _applyMutations(proposal.actions);

    // Step 5: Create after snapshot
    final afterSnapshot = await _createSnapshot(proposal.affectedEntities);

    // Step 6: Log to audit
    await _logAudit(proposal, beforeSnapshot, afterSnapshot);

    // Step 7: Update proposal status
    await _updateProposalStatus(proposal.id, 'approved');

    return ExecutionResult.success();
  }
}
```

---

## Part 6: Prompting Strategy

### 6.1 System Prompt Template

```
You are the Health Keeper Coach, a domain-specific health and fitness AI assistant.

CONTEXT RULES:
- You ONLY discuss health, nutrition, fitness, and the user's personal data
- You do NOT engage in general knowledge conversation
- You ALWAYS check if critical data is missing before making recommendations
- You NEVER claim to provide medical diagnosis or treatment

RESPONSE RULES:
- Keep coaching concise and actionable
- Maximum 2 nudges/suggestions per message
- Use supportive language, no guilt or shame
- Always frame AI estimates as editable

PROPOSAL RULES:
- Output JSON ActionProposal ONLY when a DB write is useful
- Training plan changes MUST have scope="large" and requires_confirmation=true
- Never auto-apply large changes (safe_to_auto_apply=false)

LANGUAGE:
- Respond in {user_language_preference} (Arabic Egypt or English)
- Use natural conversational tone

USER CONTEXT:
- Age: {age}, Goals: {goals}
- Today's Recovery: {recovery_score}/100
- Today's Strain: {strain_score}/21
- Calories: {consumed}/{target} consumed
- Protocol: {eating_window}, {scheduled_activities}
- Constraints: {protocol_constraints}
- Current Screen: {context_tag}

OUTPUT FORMAT (JSON only):
{
  "assistant_text": "Your response here",
  "quick_replies": ["Option 1", "Option 2"],
  "proposals": [ /* ActionProposal objects if needed */ ]
}
```

### 6.2 Context Building

```dart
class CoachContextBuilder {
  Future<CoachContext> buildContext({
    required String contextTag,  // 'home' | 'nutrition' | 'workouts' | 'recovery'
  }) async {
    // Always include
    final today = await _getTodaySnapshot();
    final weekTrends = await _get7DayTrends();
    final protocol = await _getCurrentProtocol();

    // Context-specific additions
    switch (contextTag) {
      case 'nutrition':
        return CoachContext(
          today: today,
          trends: weekTrends,
          protocol: protocol,
          focused: await _getNutritionFocus(),  // Recent meals, targets, templates
        );
      case 'workouts':
        return CoachContext(
          today: today,
          trends: weekTrends,
          protocol: protocol,
          focused: await _getWorkoutFocus(),  // Current plan, sessions, upcoming
        );
      // ... other contexts
    }
  }
}
```

---

## Part 7: UI Components

### 7.1 Coach Chat Button (Entry Point)

Add a small floating action button or icon button on existing screens:

```dart
// On Home, Nutrition, Workouts, Recovery screens
Scaffold(
  floatingActionButton: CoachChatButton(
    contextTag: 'home',  // Or 'nutrition', 'workouts', etc.
  ),
  // ... existing body
)

class CoachChatButton extends StatelessWidget {
  final String contextTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () => _openCoachChat(context, contextTag),
      child: Icon(Icons.chat_bubble_outline),
      tooltip: 'Coach Chat',
    );
  }

  void _openCoachChat(BuildContext context, String contextTag) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => CoachChatBottomSheet(contextTag: contextTag),
    );
  }
}
```

### 7.2 Bottom Sheet Structure

```dart
class CoachChatBottomSheet extends ConsumerStatefulWidget {
  final String contextTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatMessagesProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Column(
          children: [
            // Header with close button
            ChatHeader(),

            // Message list
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: messages.length,
                itemBuilder: (_, index) {
                  final message = messages[index];
                  if (message.proposalId != null) {
                    return ProposalCard(proposalId: message.proposalId!);
                  }
                  return MessageBubble(message: message);
                },
              ),
            ),

            // Quick replies (if any)
            if (messages.lastQuickReplies.isNotEmpty)
              QuickReplyChips(replies: messages.lastQuickReplies),

            // Input area
            ChatInputBar(),
          ],
        );
      },
    );
  }
}
```

### 7.3 Proposal Card

```dart
class ProposalCard extends ConsumerWidget {
  final String proposalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proposal = ref.watch(proposalProvider(proposalId));

    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon + Title
            Row(
              children: [
                Icon(Icons.auto_fix_high, color: Colors.amber),
                SizedBox(width: 8),
                Text(proposal.previewTitle, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),

            // Summary
            Text(proposal.previewSummary),
            SizedBox(height: 12),

            // Scope badge
            if (proposal.scope == 'large')
              Chip(
                label: Text('Requires Confirmation'),
                backgroundColor: Colors.orange.withOpacity(0.2),
              ),
            SizedBox(height: 12),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => ref.read(proposalActionsProvider).reject(proposalId),
                  child: Text('Reject'),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () => _showEditSheet(context, proposal),
                  child: Text('Edit'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => ref.read(proposalActionsProvider).approve(proposalId),
                  child: Text('Approve'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Part 8: Implementation Plan (6 PRs)

### PR 1: Coach Chat UI + Local Persistence

**Scope:** Chat UI bottom sheet + threads/messages tables + fake replies

**Files:**
```
lib/
├── features/coach_chat/
│   ├── data/
│   │   └── coach_chat_repository.dart
│   ├── domain/
│   │   └── entities/
│   │       ├── chat_thread.dart
│   │       └── chat_message.dart
│   └── presentation/
│       ├── coach_chat_bottom_sheet.dart
│       ├── widgets/
│       │   ├── message_bubble.dart
│       │   ├── chat_input_bar.dart
│       │   └── chat_header.dart
│       └── providers/
│           ├── chat_thread_provider.dart
│           └── chat_messages_provider.dart
├── core/data/database/
│   └── tables.dart (add ChatThreads, ChatMessages)

```

**Tests:**
- Widget test: Bottom sheet opens/closes
- Unit test: Message persistence works
- Unit test: Thread creation works

---

### PR 2: CoachContextBuilder + CoachAgentService

**Scope:** Context gathering + Gemini integration + text responses (no proposals yet)

**Files:**
```
lib/
├── core/services/
│   ├── coach_agent_service.dart
│   └── coach_context_builder.dart
├── features/coach_chat/
│   ├── domain/
│   │   └── entities/
│   │       ├── coach_reply.dart
│   │       └── coach_context.dart
│   └── presentation/
│       └── providers/
│           └── coach_reply_provider.dart
```

**Tests:**
- Unit test: Context builder gathers correct data per contextTag
- Unit test: CoachAgentService parses response correctly
- Unit test: Handles API failures gracefully

---

### PR 3: ActionProposal Schema + PendingProposals + ProposalCard UI

**Scope:** Proposal entities, table, validation schema, card UI (no execution)

**Files:**
```
lib/
├── features/coach_chat/
│   ├── domain/
│   │   └── entities/
│   │       ├── action_proposal.dart
│   │       └── action_item.dart
│   ├── data/
│   │   └── proposal_repository.dart
│   └── presentation/
│       └── widgets/
│           └── proposal_card.dart
├── core/data/database/
│   └── tables.dart (add PendingProposals)
```

**Tests:**
- Unit test: ActionProposal JSON parsing
- Unit test: Proposal validation (scope, requires_confirmation)
- Widget test: ProposalCard displays correctly

---

### PR 4: ActionExecutor + Validation + AuditLog

**Scope:** Execute approved proposals, validate constraints, log changes

**Files:**
```
lib/
├── core/services/
│   └── action_executor.dart
├── features/coach_chat/
│   ├── domain/
│   │   └── usecases/
│   │       ├── approve_proposal_usecase.dart
│   │       └── reject_proposal_usecase.dart
│   ├── data/
│   │   └── audit_log_repository.dart
├── core/data/database/
│   └── tables.dart (add AuditLogs)
```

**Tests:**
- Unit test: Validation rules (back-to-back intensity, recovery check)
- Unit test: Large changes require confirmation
- Unit test: Audit log created on approval
- Integration test: Full approve flow

---

### PR 5: Activity Events + Training Plans

**Scope:** Activity events table, training plan tables, weekly plan logic

**Files:**
```
lib/
├── features/coach_chat/
│   ├── domain/
│   │   └── entities/
│   │       ├── activity_event.dart
│   │       ├── training_plan.dart
│   │       └── training_plan_session.dart
│   ├── data/
│   │   ├── activity_event_repository.dart
│   │   └── training_plan_repository.dart
│   └── domain/
│       └── usecases/
│           ├── create_weekly_plan_usecase.dart
│           ├── reschedule_session_usecase.dart
│           └── handle_missed_session_usecase.dart
├── core/data/database/
│   └── tables.dart (add ActivityEvents, TrainingPlans, TrainingPlanSessions)
```

**Tests:**
- Unit test: Weekly plan generation
- Unit test: Reschedule session logic
- Unit test: Constraint validation (knee pain, consecutive intensity)

---

### PR 6: Voice Features (Optional)

**Scope:** TTS for assistant messages, STT for voice input

**Files:**
```
lib/
├── features/coach_chat/
│   └── presentation/
│       └── widgets/
│           ├── tts_button.dart
│           └── voice_input_button.dart
├── core/services/
│   └── voice_service.dart
```

**Dependencies:**
- `flutter_tts`
- `speech_to_text`

---

## Part 9: Safety & Privacy

### 9.1 Medical Disclaimer

All coaching screens must display:
```
"AI-generated suggestion. Not medical advice. Tap to edit."
```

### 9.2 Data Sent to AI

**Minimal Context:**
- Aggregate metrics (scores, totals, trends)
- Protocol settings (anonymized)
- No raw HealthKit samples
- No personal identifiers

**Example Context Payload:**
```json
{
  "recovery_score": 72,
  "strain_score": 8,
  "sleep_hours": 7.2,
  "calories_consumed": 1450,
  "calories_target": 2000,
  "protocol": {
    "eating_window": "12:00-20:00",
    "scheduled_activities": ["soccer:monday", "strength:wednesday"]
  },
  "week_trends": {
    "avg_recovery": 68,
    "avg_strain": 10
  }
}
```

### 9.3 Audit Trail

Every AI-driven change is logged with:
- Timestamp
- Action type
- Before/after state (lightweight)
- Proposal ID linkage
- User confirmation timestamp

---

## Part 10: Success Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Chat engagement | >30% of DAU use chat weekly | Analytics |
| Proposal acceptance rate | >60% of proposals approved | Database |
| Time to answer | <5 seconds average | Logging |
| User edits of AI suggestions | <30% | Database |
| Audit log integrity | 100% of changes logged | Automated check |
| Crash rate | <0.1% | Crashlytics |

---

## Appendix A: Folder Structure (Final)

```
lib/
├── app/
│   ├── router.dart (add coach_chat route if needed)
│   └── ...
├── features/
│   ├── coach_chat/           ← NEW FEATURE MODULE
│   │   ├── data/
│   │   │   ├── coach_chat_repository.dart
│   │   │   ├── proposal_repository.dart
│   │   │   ├── audit_log_repository.dart
│   │   │   ├── activity_event_repository.dart
│   │   │   └── training_plan_repository.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── chat_thread.dart
│   │   │   │   ├── chat_message.dart
│   │   │   │   ├── coach_reply.dart
│   │   │   │   ├── coach_context.dart
│   │   │   │   ├── action_proposal.dart
│   │   │   │   ├── action_item.dart
│   │   │   │   ├── activity_event.dart
│   │   │   │   ├── training_plan.dart
│   │   │   │   └── training_plan_session.dart
│   │   │   └── usecases/
│   │   │       ├── send_chat_message_usecase.dart
│   │   │       ├── build_chat_context_usecase.dart
│   │   │       ├── request_coach_reply_usecase.dart
│   │   │       ├── approve_proposal_usecase.dart
│   │   │       ├── reject_proposal_usecase.dart
│   │   │       ├── create_weekly_plan_usecase.dart
│   │   │       └── reschedule_session_usecase.dart
│   │   └── presentation/
│   │       ├── coach_chat_bottom_sheet.dart
│   │       ├── widgets/
│   │       │   ├── message_bubble.dart
│   │       │   ├── proposal_card.dart
│   │       │   ├── chat_input_bar.dart
│   │       │   ├── chat_header.dart
│   │       │   ├── quick_reply_chips.dart
│   │       │   └── tts_button.dart
│   │       └── providers/
│   │           ├── chat_thread_provider.dart
│   │           ├── chat_messages_provider.dart
│   │           ├── coach_reply_provider.dart
│   │           └── proposal_actions_provider.dart
│   ├── home/                  ← Add CoachChatButton
│   ├── nutrition/             ← Add CoachChatButton
│   ├── workouts/              ← Add CoachChatButton
│   ├── recovery/              ← Add CoachChatButton
│   └── ...
├── core/
│   ├── services/
│   │   ├── gemini_coach_service.dart    ← EXISTS
│   │   ├── coach_agent_service.dart     ← NEW
│   │   ├── coach_context_builder.dart   ← NEW
│   │   └── action_executor.dart         ← NEW
│   └── data/database/
│       ├── database.dart (bump to v4)
│       └── tables.dart (add 7 new tables)
└── ...
```

---

## Appendix B: Existing Services Integration

The Coach Chat feature builds on existing services:

| Existing Service | How Used by Coach Chat |
|-----------------|------------------------|
| `GeminiCoachService` | CoachAgentService wraps this for chat-specific prompts |
| `HealthKitService` | CoachContextBuilder reads recovery metrics |
| `DietSuggestionService` | Referenced for nutrition suggestions |
| `ActivityRecommendationService` | Referenced for activity suggestions |
| Database repositories | All existing repos used by CoachContextBuilder |

No modification needed to existing services — Coach Chat adds new services that compose the existing ones.

---

## Summary

The Coach Chat feature transforms Health Keeper into an interactive AI coaching platform while:

1. **Preserving existing UI** — Only adds entry button + bottom sheet
2. **Maintaining privacy** — Minimal data to AI, local storage, audit trail
3. **Ensuring safety** — All changes require user approval, hard constraints enforced
4. **Building incrementally** — 6 PR-sized deliverables with clear acceptance criteria

**Estimated total effort:** 6 PRs across ~4-6 weeks of focused development.

---

*Report generated by Product Orchestrator coordinating Business Analyst, AI Systems Specialist, and Flutter Engineer agents.*
