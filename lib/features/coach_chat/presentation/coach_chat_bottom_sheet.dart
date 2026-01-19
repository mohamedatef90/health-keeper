import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/tokens/colors.dart';
import '../../../core/ui/tokens/spacing.dart';
import '../data/repositories/coach_chat_repository.dart';
import 'widgets/chat_header.dart';
import 'widgets/chat_input_bar.dart';
import 'widgets/message_bubble.dart';

/// Show the coach chat bottom sheet
void showCoachChatBottomSheet({
  required BuildContext context,
  String? contextTag,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => CoachChatBottomSheet(contextTag: contextTag),
  );
}

/// The main coach chat bottom sheet widget
class CoachChatBottomSheet extends ConsumerStatefulWidget {
  final String? contextTag;

  const CoachChatBottomSheet({
    super.key,
    this.contextTag,
  });

  @override
  ConsumerState<CoachChatBottomSheet> createState() =>
      _CoachChatBottomSheetState();
}

class _CoachChatBottomSheetState extends ConsumerState<CoachChatBottomSheet> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Initialize chat on first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(coachChatNotifierProvider.notifier).initChat(
            contextTag: widget.contextTag,
          );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(coachChatNotifierProvider);

    // Scroll to bottom when new messages arrive
    ref.listen(coachChatNotifierProvider, (previous, next) {
      if (previous?.messages.length != next.messages.length) {
        _scrollToBottom();
      }
    });

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSpacing.bottomSheetRadius),
            ),
          ),
          child: Column(
            children: [
              // Header
              ChatHeader(
                thread: chatState.activeThread,
                onClose: () => Navigator.pop(context),
                onNewChat: () => _startNewChat(),
                onMore: () => _showMoreOptions(),
              ),

              // Messages or empty state
              Expanded(
                child: chatState.isLoading
                    ? _buildLoadingState()
                    : chatState.messages.isEmpty
                        ? ChatEmptyState(contextTag: widget.contextTag)
                        : _buildMessageList(chatState),
              ),

              // Quick replies
              if (chatState.quickReplies.isNotEmpty && !chatState.isSending)
                QuickReplyChips(
                  replies: chatState.quickReplies,
                  onTap: (reply) => _sendQuickReply(reply),
                  isLoading: chatState.isSending,
                ),

              // Input bar
              ChatInputBar(
                onSend: _sendMessage,
                isLoading: chatState.isSending,
                hintText: _getHintText(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildMessageList(CoachChatState chatState) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      itemCount: chatState.messages.length + (chatState.isSending ? 1 : 0),
      itemBuilder: (context, index) {
        // Show typing indicator at the end when sending
        if (chatState.isSending && index == chatState.messages.length) {
          return const TypingIndicator();
        }

        final message = chatState.messages[index];
        return MessageBubble(
          message: message,
          onTap: message.hasProposal
              ? () => _showProposal(message.proposalId!)
              : null,
        );
      },
    );
  }

  void _sendMessage(String content) {
    ref.read(coachChatNotifierProvider.notifier).sendMessage(content);
  }

  void _sendQuickReply(String reply) {
    ref.read(coachChatNotifierProvider.notifier).sendQuickReply(reply);
  }

  void _startNewChat() {
    // Clear current chat and start fresh
    ref.read(coachChatNotifierProvider.notifier).clearChat();
    ref.read(coachChatNotifierProvider.notifier).initChat(
          contextTag: widget.contextTag,
        );
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.bottomSheetRadius),
        ),
      ),
      builder: (context) => _MoreOptionsSheet(
        onDeleteChat: () {
          Navigator.pop(context); // Close options
          _deleteChat();
        },
      ),
    );
  }

  void _deleteChat() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceDark,
        title: const Text(
          'Delete Conversation?',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: const Text(
          'This will permanently delete this conversation. This action cannot be undone.',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await ref.read(coachChatNotifierProvider.notifier).deleteCurrentThread();
      if (mounted) {
        Navigator.pop(context); // Close chat
      }
    }
  }

  void _showProposal(String proposalId) {
    // TODO: Implement proposal viewing in PR3
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Proposal viewing will be available in a future update'),
        backgroundColor: AppColors.cardDark,
      ),
    );
  }

  String _getHintText() {
    switch (widget.contextTag) {
      case 'nutrition':
        return 'Ask about your nutrition...';
      case 'workouts':
        return 'Ask about your training...';
      case 'recovery':
        return 'Ask about your recovery...';
      default:
        return 'Message your coach...';
    }
  }
}

/// More options bottom sheet
class _MoreOptionsSheet extends StatelessWidget {
  final VoidCallback onDeleteChat;

  const _MoreOptionsSheet({
    required this.onDeleteChat,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.borderDark,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _buildOption(
              icon: Icons.delete_outline,
              label: 'Delete conversation',
              color: AppColors.error,
              onTap: onDeleteChat,
            ),
            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: color ?? AppColors.textSecondary,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: color ?? AppColors.textPrimary,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      tileColor: AppColors.cardDark,
    );
  }
}
