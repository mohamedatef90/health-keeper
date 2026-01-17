import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/screens/home_screen.dart';
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
import '../features/profile/presentation/screens/edit_profile_screen.dart';
import '../features/journal/presentation/screens/journal_screen.dart';
import '../features/insights/presentation/screens/health_insights_screen.dart';
import '../features/health_monitor/presentation/screens/health_monitor_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/welcome',
    debugLogDiagnostics: true,
    routes: [
      // Onboarding Flow
      GoRoute(
        path: '/welcome',
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Main App Flow
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          // Nutrition
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

          // Workouts
          GoRoute(
            path: 'workout-log',
            name: 'workout-log',
            builder: (context, state) => const WorkoutLogScreen(),
          ),

          // Recovery
          GoRoute(
            path: 'recovery',
            name: 'recovery',
            builder: (context, state) => const RecoveryScreen(),
          ),

          // Protocol
          GoRoute(
            path: 'protocol',
            name: 'protocol',
            builder: (context, state) => const ProtocolScreen(),
          ),

          // Reports
          GoRoute(
            path: 'weekly-report',
            name: 'weekly-report',
            builder: (context, state) => const WeeklyReportScreen(),
          ),

          // Progress Photos
          GoRoute(
            path: 'progress-photos',
            name: 'progress-photos',
            builder: (context, state) => const ProgressPhotosScreen(),
          ),

          // Settings
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),

          // Data Control
          GoRoute(
            path: 'data-control',
            name: 'data-control',
            builder: (context, state) => const DataControlScreen(),
          ),

          // Edit Profile
          GoRoute(
            path: 'edit-profile',
            name: 'edit-profile',
            builder: (context, state) => const EditProfileScreen(),
          ),

          // Journal
          GoRoute(
            path: 'journal',
            name: 'journal',
            builder: (context, state) => const JournalScreen(),
          ),

          // Health Insights
          GoRoute(
            path: 'insights',
            name: 'insights',
            builder: (context, state) => const HealthInsightsScreen(),
          ),

          // Health Monitor
          GoRoute(
            path: 'health-monitor',
            name: 'health-monitor',
            builder: (context, state) => const HealthMonitorScreen(),
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
  void goHome() => GoRouter.of(this).go('/');
  void goWelcome() => GoRouter.of(this).go('/welcome');
  void goOnboarding() => GoRouter.of(this).go('/onboarding');
  void goMealLog() => GoRouter.of(this).go('/meal-log');
  void goCameraFood() => GoRouter.of(this).go('/camera-food');
  void goWorkoutLog() => GoRouter.of(this).go('/workout-log');
  void goRecovery() => GoRouter.of(this).go('/recovery');
  void goProtocol() => GoRouter.of(this).go('/protocol');
  void goWeeklyReport() => GoRouter.of(this).go('/weekly-report');
  void goProgressPhotos() => GoRouter.of(this).go('/progress-photos');
  void goSettings() => GoRouter.of(this).go('/settings');
  void goDataControl() => GoRouter.of(this).go('/data-control');
  void goEditProfile() => GoRouter.of(this).go('/edit-profile');
  void goJournal() => GoRouter.of(this).go('/journal');
  void goInsights() => GoRouter.of(this).go('/insights');
  void goHealthMonitor() => GoRouter.of(this).go('/health-monitor');
}
