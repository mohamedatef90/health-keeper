import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../domain/entities/chat_thread.dart';

/// Header widget for the coach chat bottom sheet
class ChatHeader extends StatelessWidget {
  final ChatThread? thread;
  final VoidCallback onClose;
  final VoidCallback? onNewChat;
  final VoidCallback? onMore;

  const ChatHeader({
    super.key,
    this.thread,
    required this.onClose,
    this.onNewChat,
    this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderDark,
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
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
          const SizedBox(height: AppSpacing.sm),
          // Header row
          Row(
            children: [
              // Close button
              _buildIconButton(
                icon: Icons.close_rounded,
                onTap: onClose,
              ),
              const SizedBox(width: AppSpacing.sm),
              // Title and context
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildAiBadge(),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'Coach',
                          style: AppTypography.titleMedium.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    if (thread?.contextTag != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        thread!.contextLabel,
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Action buttons
              if (onNewChat != null)
                _buildIconButton(
                  icon: Icons.add_comment_outlined,
                  onTap: onNewChat!,
                  tooltip: 'New conversation',
                ),
              if (onMore != null) ...[
                const SizedBox(width: AppSpacing.xs),
                _buildIconButton(
                  icon: Icons.more_vert_rounded,
                  onTap: onMore!,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
    String? tooltip,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        splashColor: AppColors.primary.withOpacity(0.15),
        highlightColor: AppColors.primary.withOpacity(0.08),
        child: Tooltip(
          message: tooltip ?? '',
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.cardDark,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(
                color: AppColors.borderDark,
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              size: 20,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAiBadge() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.auto_awesome,
        size: 12,
        color: Colors.white,
      ),
    );
  }
}

/// Empty state widget for new conversations
class ChatEmptyState extends StatelessWidget {
  final String? contextTag;

  const ChatEmptyState({
    super.key,
    this.contextTag,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.auto_awesome,
                size: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Hi! I\'m your AI Coach',
              style: AppTypography.titleLarge.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              _getContextMessage(),
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildSuggestions(),
          ],
        ),
      ),
    );
  }

  String _getContextMessage() {
    switch (contextTag) {
      case 'nutrition':
        return 'Ask me about your meals, calories, or nutrition goals. I can help you make better food choices.';
      case 'workouts':
        return 'Let\'s talk about your training. I can suggest workouts based on your recovery and goals.';
      case 'recovery':
        return 'I can explain your recovery metrics and suggest ways to optimize your rest and performance.';
      default:
        return 'I can help you with nutrition, workouts, recovery, and more. Ask me anything about your health journey!';
    }
  }

  Widget _buildSuggestions() {
    final suggestions = _getSuggestions();

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      alignment: WrapAlignment.center,
      children: suggestions.map((suggestion) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: AppColors.cardDark,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            border: Border.all(
              color: AppColors.borderDark,
              width: 1,
            ),
          ),
          child: Text(
            suggestion,
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        );
      }).toList(),
    );
  }

  List<String> _getSuggestions() {
    switch (contextTag) {
      case 'nutrition':
        return ['What should I eat?', 'Track a meal', 'Show my macros'];
      case 'workouts':
        return ['Suggest a workout', 'Am I ready to train?', 'Weekly plan'];
      case 'recovery':
        return ['Explain my score', 'How can I recover?', 'Sleep tips'];
      default:
        return ['How am I doing?', 'What should I focus on?', 'Help me improve'];
    }
  }
}
