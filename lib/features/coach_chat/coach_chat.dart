/// Coach Chat feature module
///
/// This module provides an AI-powered chat interface for health coaching.
/// Users can interact with the AI coach to get personalized recommendations,
/// ask questions about their health data, and receive actionable suggestions.
///
/// ## Usage
///
/// Add the CoachChatButton to any screen to enable the chat:
/// ```dart
/// Scaffold(
///   floatingActionButton: const CoachChatButton(
///     contextTag: 'home', // or 'nutrition', 'workouts', 'recovery'
///   ),
///   body: ...
/// )
/// ```
///
/// Or programmatically open the chat bottom sheet:
/// ```dart
/// showCoachChatBottomSheet(
///   context: context,
///   contextTag: 'nutrition',
/// );
/// ```

// Domain entities
export 'domain/entities/chat_thread.dart';
export 'domain/entities/chat_message.dart';

// Repository and providers
export 'data/repositories/coach_chat_repository.dart';

// Presentation
export 'presentation/coach_chat_bottom_sheet.dart';
export 'presentation/widgets/coach_chat_button.dart';
export 'presentation/widgets/message_bubble.dart';
export 'presentation/widgets/chat_input_bar.dart';
export 'presentation/widgets/chat_header.dart';
