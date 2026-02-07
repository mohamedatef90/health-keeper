import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/providers/providers.dart';
import '../features/shell/presentation/screens/app_shell.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/health_tab/presentation/screens/health_tab_screen.dart';
import '../features/coach_chat/presentation/screens/agent_selection_screen.dart';
import '../features/insights/presentation/screens/insights_tab_screen.dart';
import '../features/settings/presentation/screens/profile_tab_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/onboarding/presentation/screens/welcome_screen.dart';
import '../features/nutrition/presentation/screens/meal_log_screen.dart';
import '../features/nutrition/presentation/screens/camera_food_screen.dart';
import '../features/workouts/presentation/screens/workout_log_screen.dart';
import '../features/recovery/presentation/screens/recovery_screen.dart';
import '../features/protocol/presentation/screens/protocol_screen.dart';
import '../features/reports/presentation/screens/weekly_report_screen.dart';
import '../features/progress_photos/presentation/screens/progress_photos_screen.dart';
import '../features/settings/presentation/screens/settings_screen.dart';
import '../features/settings/presentation/screens/data_control_screen.dart';
import '../features/settings/presentation/screens/autonomy_settings_screen.dart';
import '../features/settings/presentation/screens/protocol_settings_screen.dart';
import '../features/profile/presentation/screens/edit_profile_screen.dart';
import '../features/journal/presentation/screens/journal_screen.dart';
import '../features/insights/presentation/screens/health_insights_screen.dart';
import '../features/health_monitor/presentation/screens/health_monitor_screen.dart';
import '../features/coach/presentation/screens/coach_screen.dart';
import '../features/nutrition/presentation/screens/weekly_meal_plan_screen.dart';
import '../features/planning/presentation/screens/master_plan_screen.dart';
import '../features/coach/presentation/screens/weekly_workout_plan_screen.dart';
import '../features/coach_chat/presentation/modern_agent_chat_screen.dart';

// Navigator keys for each tab branch
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _overviewNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'overview');
final _healthNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'health');
final _coachNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'coach');
final _insightsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'insights');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      final path = state.uri.path;
      final isOnboarding = path == '/welcome' || path == '/onboarding';

      // Check if user has completed onboarding
      final db = ref.read(databaseProvider);
      final profile = await db.getUserProfile();
      final hasCompleted = profile?.hasCompletedOnboarding ?? false;

      if (!hasCompleted && !isOnboarding) {
        // Not onboarded yet → send to welcome
        return '/welcome';
      }
      if (hasCompleted && isOnboarding) {
        // Already onboarded → send to home
        return '/';
      }
      return null; // No redirect needed
    },
    routes: [
      // Onboarding Flow (outside shell)
      GoRoute(
        path: '/welcome',
        name: 'welcome',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Main App with 5-tab bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Overview (Home)
          StatefulShellBranch(
            navigatorKey: _overviewNavigatorKey,
            routes: [
              GoRoute(
                path: '/',
                name: 'home',
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'recovery',
                    name: 'recovery',
                    builder: (context, state) => const RecoveryScreen(),
                  ),
                  GoRoute(
                    path: 'health-monitor',
                    name: 'health-monitor',
                    builder: (context, state) => const HealthMonitorScreen(),
                  ),
                ],
              ),
            ],
          ),

          // Branch 1: Health (Protocol + Logging)
          StatefulShellBranch(
            navigatorKey: _healthNavigatorKey,
            routes: [
              GoRoute(
                path: '/health',
                name: 'health-tab',
                builder: (context, state) => const HealthTabScreen(),
                routes: [
                  GoRoute(
                    path: 'protocol',
                    name: 'protocol',
                    builder: (context, state) => const ProtocolScreen(),
                  ),
                  GoRoute(
                    path: 'meal-log',
                    name: 'meal-log',
                    builder: (context, state) => const MealLogScreen(),
                  ),
                  GoRoute(
                    path: 'camera-food',
                    name: 'camera-food',
                    builder: (context, state) => const CameraFoodScreen(),
                  ),
                  GoRoute(
                    path: 'workout-log',
                    name: 'workout-log',
                    builder: (context, state) => const WorkoutLogScreen(),
                  ),
                  GoRoute(
                    path: 'journal',
                    name: 'journal',
                    builder: (context, state) => const JournalScreen(),
                  ),
                  GoRoute(
                    path: 'protocol-settings',
                    name: 'protocol-settings',
                    builder: (context, state) => const ProtocolSettingsScreen(),
                  ),
                ],
              ),
            ],
          ),

          // Branch 2: AI Coach (center tab)
          StatefulShellBranch(
            navigatorKey: _coachNavigatorKey,
            routes: [
              GoRoute(
                path: '/agents',
                name: 'agents',
                builder: (context, state) => const AgentSelectionScreen(),
                routes: [
                  GoRoute(
                    path: 'chat',
                    name: 'agent-chat',
                    builder: (context, state) {
                      final contextTag = state.uri.queryParameters['context'];
                      return ModernAgentChatScreen(contextTag: contextTag);
                    },
                  ),
                  GoRoute(
                    path: 'coach',
                    name: 'coach',
                    builder: (context, state) => const CoachScreen(),
                  ),
                  GoRoute(
                    path: 'weekly-workout-plan',
                    name: 'weekly-workout-plan',
                    builder: (context, state) => const WeeklyWorkoutPlanScreen(),
                  ),
                  GoRoute(
                    path: 'weekly-meal-plan',
                    name: 'weekly-meal-plan',
                    builder: (context, state) => const WeeklyMealPlanScreen(),
                  ),
                  GoRoute(
                    path: 'master-plan',
                    name: 'master-plan',
                    builder: (context, state) => const MasterPlanScreen(),
                  ),
                ],
              ),
            ],
          ),

          // Branch 3: Insights
          StatefulShellBranch(
            navigatorKey: _insightsNavigatorKey,
            routes: [
              GoRoute(
                path: '/insights-tab',
                name: 'insights-tab',
                builder: (context, state) => const InsightsTabScreen(),
                routes: [
                  GoRoute(
                    path: 'weekly-report',
                    name: 'weekly-report',
                    builder: (context, state) => const WeeklyReportScreen(),
                  ),
                  GoRoute(
                    path: 'insights',
                    name: 'insights',
                    builder: (context, state) => const HealthInsightsScreen(),
                  ),
                  GoRoute(
                    path: 'progress-photos',
                    name: 'progress-photos',
                    builder: (context, state) => const ProgressPhotosScreen(),
                  ),
                ],
              ),
            ],
          ),

          // Branch 4: Profile
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfileTabScreen(),
                routes: [
                  GoRoute(
                    path: 'edit-profile',
                    name: 'edit-profile',
                    builder: (context, state) => const EditProfileScreen(),
                  ),
                  GoRoute(
                    path: 'settings',
                    name: 'settings',
                    builder: (context, state) => const SettingsScreen(),
                  ),
                  GoRoute(
                    path: 'data-control',
                    name: 'data-control',
                    builder: (context, state) => const DataControlScreen(),
                  ),
                  GoRoute(
                    path: 'autonomy-settings',
                    name: 'autonomy-settings',
                    builder: (context, state) => const AutonomySettingsScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
});

// Navigation helper extension
extension GoRouterExtension on BuildContext {
  // Main tabs
  void goHome() => GoRouter.of(this).go('/');
  void goHealthTab() => GoRouter.of(this).go('/health');
  void goAgents() => GoRouter.of(this).go('/agents');
  void goInsightsTab() => GoRouter.of(this).go('/insights-tab');
  void goProfile() => GoRouter.of(this).go('/profile');

  // Onboarding
  void goWelcome() => GoRouter.of(this).go('/welcome');
  void goOnboarding() => GoRouter.of(this).go('/onboarding');

  // Overview sub-routes
  void goRecovery() => GoRouter.of(this).go('/recovery');
  void goHealthMonitor() => GoRouter.of(this).go('/health-monitor');

  // Health sub-routes
  void goMealLog() => GoRouter.of(this).go('/health/meal-log');
  void goCameraFood() => GoRouter.of(this).go('/health/camera-food');
  void goWorkoutLog() => GoRouter.of(this).go('/health/workout-log');
  void goJournal() => GoRouter.of(this).go('/health/journal');
  void goProtocol() => GoRouter.of(this).go('/health/protocol');
  void goProtocolSettings() => GoRouter.of(this).go('/health/protocol-settings');

  // Coach sub-routes
  void goAgentChat({String? context}) {
    final query = context != null ? '?context=$context' : '';
    GoRouter.of(this).go('/agents/chat$query');
  }
  void goCoach() => GoRouter.of(this).go('/agents/coach');
  void goWeeklyMealPlan() => GoRouter.of(this).go('/agents/weekly-meal-plan');
  void goMasterPlan() => GoRouter.of(this).go('/agents/master-plan');
  void goWeeklyWorkoutPlan() => GoRouter.of(this).go('/agents/weekly-workout-plan');

  // Insights sub-routes
  void goWeeklyReport() => GoRouter.of(this).go('/insights-tab/weekly-report');
  void goInsights() => GoRouter.of(this).go('/insights-tab/insights');
  void goProgressPhotos() => GoRouter.of(this).go('/insights-tab/progress-photos');

  // Profile sub-routes
  void goEditProfile() => GoRouter.of(this).go('/profile/edit-profile');
  void goSettings() => GoRouter.of(this).go('/profile/settings');
  void goDataControl() => GoRouter.of(this).go('/profile/data-control');
  void goAutonomySettings() => GoRouter.of(this).go('/profile/autonomy-settings');
}
