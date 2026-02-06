import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../domain/entities/protocol.dart';
import '../domain/entities/daily_data.dart';
import '../domain/entities/conversation_memory.dart';

/// Manages all shared memory between agents
/// - Protocol (static user rules)
/// - Daily data (today + history)
/// - Conversation history per agent
/// - HealthKit cache
class SharedMemoryManager {
  static SharedMemoryManager? _instance;
  static SharedMemoryManager get instance => _instance ??= SharedMemoryManager._();
  
  SharedMemoryManager._();
  
  late final Directory _workspaceDir;
  late final Directory _sharedDir;
  late final Directory _dailyDir;
  late final Directory _healthKitCacheDir;
  late final Directory _conversationsDir;
  
  /// Initialize workspace directories
  Future<void> initialize() async {
    final appDir = await getApplicationDocumentsDirectory();
    _workspaceDir = Directory('${appDir.path}/workspace');
    _sharedDir = Directory('${_workspaceDir.path}/shared');
    _dailyDir = Directory('${_sharedDir.path}/daily');
    _healthKitCacheDir = Directory('${_sharedDir.path}/healthkit_cache');
    _conversationsDir = Directory('${_sharedDir.path}/conversations');
    
    // Create directories if they don't exist
    await _workspaceDir.create(recursive: true);
    await _sharedDir.create(recursive: true);
    await _dailyDir.create(recursive: true);
    await _healthKitCacheDir.create(recursive: true);
    await _conversationsDir.create(recursive: true);
    
    print('✅ SharedMemoryManager initialized at: ${_workspaceDir.path}');
  }
  
  // ========================
  // PROTOCOL (Static Rules)
  // ========================
  
  File get _protocolFile => File('${_sharedDir.path}/protocol.json');
  
  /// Get user protocol (eating window, medications, activities, constraints)
  Future<Protocol> getProtocol() async {
    if (!await _protocolFile.exists()) {
      // Create default protocol
      final defaultProtocol = Protocol.defaultProtocol();
      await saveProtocol(defaultProtocol);
      return defaultProtocol;
    }
    
    final json = await _protocolFile.readAsString();
    return Protocol.fromJson(jsonDecode(json));
  }
  
  /// Save/update protocol
  Future<void> saveProtocol(Protocol protocol) async {
    final json = jsonEncode(protocol.toJson());
    await _protocolFile.writeAsString(json);
    print('✅ Protocol saved');
  }
  
  // ========================
  // DAILY DATA
  // ========================
  
  File _dailyFile(DateTime date) {
    final dateStr = date.toIso8601String().split('T')[0]; // YYYY-MM-DD
    return File('${_dailyDir.path}/$dateStr.json');
  }
  
  /// Get daily data for a specific date
  Future<DailyData> getDaily(DateTime date) async {
    final file = _dailyFile(date);
    
    if (!await file.exists()) {
      // Create empty daily data
      final emptyData = DailyData.empty(date);
      await saveDaily(emptyData);
      return emptyData;
    }
    
    final json = await file.readAsString();
    return DailyData.fromJson(jsonDecode(json));
  }
  
  /// Save daily data
  Future<void> saveDaily(DailyData data) async {
    final file = _dailyFile(data.date);
    final json = jsonEncode(data.toJson());
    await file.writeAsString(json);
    print('✅ Daily data saved for ${data.date}');
  }
  
  /// Update specific field in today's data
  Future<void> updateToday({
    double? weight,
    Map<String, double>? measurements,
    Map<String, dynamic>? meal,
    Map<String, dynamic>? workout,
    Map<String, dynamic>? healthKit,
  }) async {
    final today = await getDaily(DateTime.now());
    
    if (weight != null) {
      today.weight = WeightData(
        value: weight,
        source: 'manual',
        timestamp: DateTime.now(),
      );
    }
    
    if (measurements != null) {
      today.measurements = MeasurementData(
        waist: measurements['waist'],
        chest: measurements['chest'],
        hip: measurements['hip'],
        timestamp: DateTime.now(),
        source: 'manual',
      );
    }
    
    if (meal != null) {
      today.meals.add(MealData.fromJson(meal));
    }
    
    if (healthKit != null) {
      // Update HealthKit data
      // TODO: implement healthkit merge logic
    }
    
    await saveDaily(today);
  }
  
  /// Get history (last N days)
  Future<List<DailyData>> getHistory({int days = 7}) async {
    final history = <DailyData>[];
    
    for (int i = 0; i < days; i++) {
      final date = DateTime.now().subtract(Duration(days: i));
      try {
        final data = await getDaily(date);
        history.add(data);
      } catch (e) {
        print('⚠️ Could not load data for $date: $e');
      }
    }
    
    return history;
  }
  
  // ========================
  // CONVERSATION MEMORY
  // ========================
  
  File _conversationFile(String agentId) {
    return File('${_conversationsDir.path}/${agentId}_agent.json');
  }
  
  /// Get conversation memory for an agent
  Future<ConversationMemory> getConversation(String agentId) async {
    final file = _conversationFile(agentId);
    
    if (!await file.exists()) {
      final empty = ConversationMemory.empty(agentId);
      await saveConversation(empty);
      return empty;
    }
    
    final json = await file.readAsString();
    return ConversationMemory.fromJson(jsonDecode(json));
  }
  
  /// Save conversation memory
  Future<void> saveConversation(ConversationMemory memory) async {
    final file = _conversationFile(memory.agentId);
    final json = jsonEncode(memory.toJson());
    await file.writeAsString(json);
  }
  
  /// Add message to conversation
  Future<void> addMessage(
    String agentId, {
    required String role, // 'user' or 'assistant'
    required String message,
    Map<String, dynamic>? contextUsed,
  }) async {
    final conversation = await getConversation(agentId);
    
    conversation.history.add(ConversationMessage(
      timestamp: DateTime.now(),
      role: role,
      message: message,
      contextUsed: contextUsed,
    ));
    
    // Keep last 50 messages only
    if (conversation.history.length > 50) {
      conversation.history.removeRange(0, conversation.history.length - 50);
    }
    
    await saveConversation(conversation);
  }
  
  // ========================
  // HEALTHKIT CACHE
  // ========================
  
  File _healthKitFile(String type, DateTime month) {
    final monthStr = '${month.year}-${month.month.toString().padLeft(2, '0')}';
    return File('${_healthKitCacheDir.path}/${type}_$monthStr.json');
  }
  
  /// Cache HealthKit data (sleep, workouts, vitals)
  Future<void> cacheHealthKitData(
    String type, // 'sleep', 'workouts', 'vitals', etc.
    DateTime month,
    Map<String, dynamic> data,
  ) async {
    final file = _healthKitFile(type, month);
    final json = jsonEncode(data);
    await file.writeAsString(json);
  }
  
  /// Read cached HealthKit data
  Future<Map<String, dynamic>?> readHealthKitCache(
    String type,
    DateTime month,
  ) async {
    final file = _healthKitFile(type, month);
    
    if (!await file.exists()) return null;
    
    final json = await file.readAsString();
    return jsonDecode(json);
  }
  
  // ========================
  // UTILITY
  // ========================
  
  /// Export all data as JSON (for backup/export feature)
  Future<String> exportAllData() async {
    final protocol = await getProtocol();
    final history = await getHistory(days: 365); // full year
    
    final export = {
      'protocol': protocol.toJson(),
      'history': history.map((d) => d.toJson()).toList(),
      'exported_at': DateTime.now().toIso8601String(),
    };
    
    return jsonEncode(export);
  }
}
