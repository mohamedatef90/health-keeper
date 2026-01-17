import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// WHOOP-style quick action button with dark theme
class QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  final bool compact;

  const QuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? AppColors.recovery;

    return Material(
      color: AppColors.cardDark,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        splashColor: buttonColor.withOpacity(0.15),
        highlightColor: buttonColor.withOpacity(0.08),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: compact ? AppSpacing.sm : AppSpacing.md,
            horizontal: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(
              color: AppColors.borderDark,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: compact ? 36 : 44,
                height: compact ? 36 : 44,
                decoration: BoxDecoration(
                  color: buttonColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Icon(
                  icon,
                  color: buttonColor,
                  size: compact ? 20 : 24,
                ),
              ),
              SizedBox(height: compact ? AppSpacing.xs : AppSpacing.sm),
              Text(
                label,
                style: (compact ? AppTypography.labelXSmall : AppTypography.labelSmall)
                    .copyWith(color: AppColors.textPrimary),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Horizontal quick action button for alternative layouts
class HorizontalQuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? subtitle;
  final VoidCallback onTap;
  final Color? color;

  const HorizontalQuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.subtitle,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? AppColors.recovery;

    return Material(
      color: AppColors.cardDark,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        splashColor: buttonColor.withOpacity(0.15),
        highlightColor: buttonColor.withOpacity(0.08),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(
              color: AppColors.borderDark,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: buttonColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Icon(
                  icon,
                  color: buttonColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: AppTypography.titleSmall,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: AppTypography.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: AppColors.textTertiary,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Icon-only quick action for compact displays
class IconQuickAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
  final String? tooltip;

  const IconQuickAction({
    super.key,
    required this.icon,
    required this.onTap,
    this.color,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? AppColors.recovery;

    final button = Material(
      color: AppColors.cardDark,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        splashColor: buttonColor.withOpacity(0.15),
        highlightColor: buttonColor.withOpacity(0.08),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(
              color: AppColors.borderDark,
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: buttonColor,
            size: 24,
          ),
        ),
      ),
    );

    if (tooltip != null) {
      return Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    return button;
  }
}

/// Quick action grid for multiple actions
class QuickActionGrid extends StatelessWidget {
  final List<QuickActionItem> actions;
  final int crossAxisCount;
  final double spacing;

  const QuickActionGrid({
    super.key,
    required this.actions,
    this.crossAxisCount = 4,
    this.spacing = AppSpacing.sm,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 1.0,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return QuickActionButton(
          icon: action.icon,
          label: action.label,
          onTap: action.onTap,
          color: action.color,
          compact: true,
        );
      },
    );
  }
}

/// Data class for quick action items
class QuickActionItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const QuickActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });
}
