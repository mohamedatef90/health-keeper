import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/router.dart';
import 'app/theme.dart';
import 'core/providers/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables (optional - will use fallback if .env missing)
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // .env file not found - will use default/empty values
  }

  runApp(
    const ProviderScope(
      child: HealthKeeperApp(),
    ),
  );
}

class HealthKeeperApp extends ConsumerStatefulWidget {
  const HealthKeeperApp({super.key});

  @override
  ConsumerState<HealthKeeperApp> createState() => _HealthKeeperAppState();
}

class _HealthKeeperAppState extends ConsumerState<HealthKeeperApp>
    with WidgetsBindingObserver {
  bool _hasRunInitialCycle = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Run AI Brain autonomous cycle on app launch (delayed to ensure providers are ready)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runAiBrainCycle(isInitial: true);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Run AI Brain cycle when app resumes from background
    if (state == AppLifecycleState.resumed && _hasRunInitialCycle) {
      _runAiBrainCycle(isInitial: false);
    }
  }

  /// Run the AI Brain autonomous cycle
  void _runAiBrainCycle({required bool isInitial}) {
    try {
      final brainService = ref.read(aiBrainServiceProvider);

      // Run the autonomous cycle asynchronously
      brainService.runAutonomousCycle().then((result) {
        _hasRunInitialCycle = true;

        // Log the result
        final talker = ref.read(talkerProvider);
        talker.info(
          'AI Brain Cycle: Generated ${result.decisionsGenerated} decisions, '
          'Auto-executed ${result.decisionsAutoExecuted}, '
          'Pending approval ${result.decisionsPendingApproval}, '
          'Notifications scheduled ${result.notificationsScheduled}, '
          'Time: ${result.processingTime.inMilliseconds}ms',
        );

        if (result.hasErrors) {
          for (final error in result.errors) {
            talker.warning('AI Brain Cycle Error: $error');
          }
        }
      }).catchError((e) {
        final talker = ref.read(talkerProvider);
        talker.error('AI Brain Cycle Failed: $e');
      });
    } catch (e) {
      // Silently fail if providers aren't ready yet
      debugPrint('AI Brain Cycle skipped: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Health Keeper',
      debugShowCheckedModeBanner: false,
      // WHOOP 5 style: dark theme by default
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}
