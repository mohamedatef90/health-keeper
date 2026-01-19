import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../coach_chat_bottom_sheet.dart';

/// Floating action button to open the coach chat
class CoachChatButton extends StatelessWidget {
  /// The context tag to pass to the chat (determines context-aware responses)
  /// Values: 'home', 'nutrition', 'workouts', 'recovery'
  final String contextTag;

  /// Optional custom onPressed handler (defaults to opening bottom sheet)
  final VoidCallback? onPressed;

  /// Whether to show extended label
  final bool extended;

  /// Optional badge count for notifications
  final int? badgeCount;

  const CoachChatButton({
    super.key,
    required this.contextTag,
    this.onPressed,
    this.extended = false,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    if (extended) {
      return _buildExtendedFab(context);
    }
    return _buildStandardFab(context);
  }

  Widget _buildStandardFab(BuildContext context) {
    return Stack(
      children: [
        FloatingActionButton(
          onPressed: () => _handlePressed(context),
          backgroundColor: AppColors.primary,
          elevation: 4,
          child: Container(
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
        if (badgeCount != null && badgeCount! > 0)
          Positioned(
            right: 0,
            top: 0,
            child: _buildBadge(),
          ),
      ],
    );
  }

  Widget _buildExtendedFab(BuildContext context) {
    return Stack(
      children: [
        FloatingActionButton.extended(
          onPressed: () => _handlePressed(context),
          backgroundColor: AppColors.primary,
          elevation: 4,
          icon: const Icon(
            Icons.auto_awesome,
            color: Colors.white,
            size: 20,
          ),
          label: const Text(
            'Coach',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (badgeCount != null && badgeCount! > 0)
          Positioned(
            right: 0,
            top: 0,
            child: _buildBadge(),
          ),
      ],
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.alert,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.backgroundDark,
          width: 2,
        ),
      ),
      constraints: const BoxConstraints(
        minWidth: 18,
        minHeight: 18,
      ),
      child: Text(
        badgeCount! > 9 ? '9+' : badgeCount.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _handlePressed(BuildContext context) {
    if (onPressed != null) {
      onPressed!();
      return;
    }

    // Open the coach chat bottom sheet
    showCoachChatBottomSheet(
      context: context,
      contextTag: contextTag,
    );
  }
}

/// Small icon button variant for use in app bars or inline
class CoachChatIconButton extends StatelessWidget {
  final String contextTag;
  final VoidCallback? onPressed;
  final double size;

  const CoachChatIconButton({
    super.key,
    required this.contextTag,
    this.onPressed,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _handlePressed(context),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        splashColor: AppColors.primary.withOpacity(0.15),
        highlightColor: AppColors.primary.withOpacity(0.08),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.cardDark,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(
              color: AppColors.borderDark,
              width: 1,
            ),
          ),
          child: const Icon(
            Icons.auto_awesome,
            size: 18,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  void _handlePressed(BuildContext context) {
    if (onPressed != null) {
      onPressed!();
      return;
    }

    showCoachChatBottomSheet(
      context: context,
      contextTag: contextTag,
    );
  }
}
