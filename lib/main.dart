import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/router.dart';
import 'app/theme.dart';

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

class HealthKeeperApp extends ConsumerWidget {
  const HealthKeeperApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
