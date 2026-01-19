import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_thread.freezed.dart';
part 'chat_thread.g.dart';

/// Chat thread entity representing a conversation with the AI coach
@freezed
class ChatThread with _$ChatThread {
  const factory ChatThread({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,

    /// Optional title for the thread (auto-generated from first message)
    String? title,

    /// Last message timestamp for sorting
    DateTime? lastMessageAt,

    /// Whether this thread is active
    @Default(true) bool isActive,

    /// Context tag indicating where the chat was started
    /// Values: 'home', 'nutrition', 'workouts', 'recovery'
    String? contextTag,
  }) = _ChatThread;

  factory ChatThread.fromJson(Map<String, dynamic> json) =>
      _$ChatThreadFromJson(json);
}

/// Extension for chat thread helpers
extension ChatThreadExtension on ChatThread {
  /// Get display title (use first message content or default)
  String get displayTitle => title ?? 'New Conversation';

  /// Check if thread has recent activity (within last 24 hours)
  bool get hasRecentActivity {
    if (lastMessageAt == null) return false;
    return DateTime.now().difference(lastMessageAt!).inHours < 24;
  }

  /// Get context-friendly label
  String get contextLabel {
    switch (contextTag) {
      case 'nutrition':
        return 'Nutrition';
      case 'workouts':
        return 'Workouts';
      case 'recovery':
        return 'Recovery';
      case 'home':
      default:
        return 'General';
    }
  }
}
