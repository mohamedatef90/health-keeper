import 'dart:io';
import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/data/user_protocol.dart';

/// Script to seed user protocol rules
/// 
/// Run: dart run scripts/seed_protocol.dart
void main() async {
  print('🌱 Seeding User Protocol...\n');

  try {
    // Initialize database
    final db = AppDatabase();
    final protocol = UserProtocol(db);

    // Clear existing rules (optional - comment out if you want to keep old data)
    print('🗑️  Clearing old protocol rules...');
    await protocol.clearAllRules();
    print('✅ Cleared\n');

    // Seed new rules
    print('📝 Seeding protocol rules...');
    await protocol.seedProtocol();
    print('✅ Seeded\n');

    // List active rules
    print('📋 Active Protocol Rules:');
    final rules = await protocol.listActiveRules();
    for (final rule in rules) {
      print('  - ${rule.name} (${rule.category})');
    }

    print('\n🎉 Protocol seeding complete!');

    await db.close();
    exit(0);
  } catch (e, stackTrace) {
    print('❌ Error: $e');
    print(stackTrace);
    exit(1);
  }
}
