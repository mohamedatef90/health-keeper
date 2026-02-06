import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/data/user_protocol.dart';

/// Seeds protocol on first app launch
class FirstLaunchSeeder {
  static const String _keyProtocolSeeded = 'protocol_seeded';

  static Future<void> seedIfNeeded(AppDatabase db) async {
    final prefs = await SharedPreferences.getInstance();
    final alreadySeeded = prefs.getBool(_keyProtocolSeeded) ?? false;

    if (!alreadySeeded) {
      print('🌱 First launch detected - seeding protocol...');
      
      final protocol = UserProtocol(db);
      await protocol.seedProtocol();
      
      await prefs.setBool(_keyProtocolSeeded, true);
      print('✅ Protocol seeded successfully!');
    } else {
      print('✅ Protocol already seeded');
    }
  }

  /// Force re-seed (for testing)
  static Future<void> resetAndReseed(AppDatabase db) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyProtocolSeeded, false);
    await seedIfNeeded(db);
  }
}
