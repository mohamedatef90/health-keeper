import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/tokens/colors.dart';
import '../../../core/ui/tokens/spacing.dart';
import '../../../core/ui/tokens/typography.dart';
import '../data/repositories/agent_coach_chat_notifier.dart';

/// Modern Agent Chat Screen with glassmorphism and agent badges
/// 
/// Shows which agent is responding (🏋️🍽️🩺🤖)
class ModernAgentChatScreen extends ConsumerStatefulWidget {
  final String? contextTag;

  const ModernAgentChatScreen({
    super.key,
    this.contextTag,
  });

  @override
  ConsumerState<ModernAgentChatScreen> createState() =>
      _ModernAgentChatScreenState();
}

class _ModernAgentChatScreenState
    extends ConsumerState<ModernAgentChatScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Initialize chat on first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(agentCoachChatNotifierProvider.notifier).initChat(
            contextTag: widget.contextTag,
          );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    _focusNode.dispose();
    _animationController.dispose();
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

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    ref.read(agentCoachChatNotifierProvider.notifier).sendMessage(text);
    _textController.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(agentCoachChatNotifierProvider);

    // Scroll to bottom when new messages arrive
    ref.listen(agentCoachChatNotifierProvider, (previous, next) {
      if (previous?.messages.length != next.messages.length) {
        _scrollToBottom();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Messages
          Expanded(
            child: chatState.isLoading
                ? _buildLoadingState()
                : chatState.messages.isEmpty
                    ? _buildEmptyState()
                    : _buildMessageList(chatState),
          ),

          // Quick replies
          if (chatState.quickReplies.isNotEmpty && !chatState.isSending)
            _buildQuickReplies(chatState.quickReplies),

          // Input bar
          _buildInputBar(chatState),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.surfaceDark.withValues(alpha: 0.9),
      elevation: 0,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withValues(alpha: 0.1),
                  AppColors.surfaceDark.withValues(alpha: 0.9),
                ],
              ),
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Coach',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '4 AI Specialists',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: AppColors.textPrimary),
          onPressed: () {
            // TODO: Show more options
          },
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primary),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.2),
                  AppColors.accent.withValues(alpha: 0.2),
                ],
              ),
            ),
            child: const Icon(
              Icons.chat_bubble_outline,
              size: 64,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Start a conversation',
            style: AppTypography.titleLarge.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Ask anything about fitness, nutrition, or health',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(CoachChatState chatState) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: chatState.messages.length + (chatState.isSending ? 1 : 0),
      itemBuilder: (context, index) {
        // Typing indicator
        if (index == chatState.messages.length) {
          return _buildTypingIndicator();
        }

        final message = chatState.messages[index];
        return _buildMessageBubble(message);
      },
    );
  }

  Widget _buildMessageBubble(message) {
    final isUser = message.role.name == 'user';
    final agentInfo = _parseAgentInfo(message.contextTag);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser && agentInfo != null) ...[
            // Agent emoji avatar
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.3),
                    AppColors.accent.withValues(alpha: 0.3),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  agentInfo['emoji'] ?? '🤖',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
          // Message bubble
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (!isUser && agentInfo != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.xs,
                      bottom: AppSpacing.xs,
                    ),
                    child: Text(
                      agentInfo['name'] ?? 'Assistant',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    gradient: isUser
                        ? LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.primary.withValues(alpha: 0.8),
                            ],
                          )
                        : null,
                    color: isUser ? null : AppColors.surfaceDark,
                    borderRadius: BorderRadius.circular(AppSpacing.md),
                    border: isUser
                        ? null
                        : Border.all(
                            color: AppColors.primary.withValues(alpha: 0.2),
                            width: 1,
                          ),
                  ),
                  child: Text(
                    message.content,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(AppSpacing.md),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(0),
                const SizedBox(width: 4),
                _buildDot(1),
                const SizedBox(width: 4),
                _buildDot(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Opacity(
          opacity: (value + index * 0.3) % 1.0,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuickReplies(List<String> replies) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark.withValues(alpha: 0.5),
        border: Border(
          top: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: replies.map((reply) {
            return Padding(
              padding: const EdgeInsets.only(right: AppSpacing.xs),
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(agentCoachChatNotifierProvider.notifier)
                      .sendMessage(reply);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.2),
                        AppColors.accent.withValues(alpha: 0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(AppSpacing.lg),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    reply,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildInputBar(CoachChatState chatState) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark.withValues(alpha: 0.9),
        border: Border(
          top: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundDark,
                borderRadius: BorderRadius.circular(AppSpacing.lg),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _textController,
                focusNode: _focusNode,
                enabled: !chatState.isSending,
                maxLines: null,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
                decoration: InputDecoration(
                  hintText: 'اكتب رسالة...',
                  hintStyle: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          GestureDetector(
            onTap: chatState.isSending ? null : _sendMessage,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withValues(alpha: 0.8),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send,
                color: AppColors.textPrimary,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, String>? _parseAgentInfo(String? contextTag) {
    if (contextTag == null || contextTag.isEmpty) return null;

    // Parse emoji and name from contextTag (format: "🏋️ Fitness Agent")
    final parts = contextTag.split(' ');
    if (parts.isEmpty) return null;

    return {
      'emoji': parts.first,
      'name': parts.skip(1).join(' '),
    };
  }
}
