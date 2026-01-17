import 'package:flutter/material.dart';

import '../../../../core/domain/entities/protocol.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class SupplementCard extends StatelessWidget {
  final Supplement supplement;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggle;
  final VoidCallback? onDelete;

  const SupplementCard({
    super.key,
    required this.supplement,
    this.onTap,
    this.onToggle,
    this.onDelete,
  });

  String _getFrequencyText(SupplementFrequency frequency) {
    switch (frequency) {
      case SupplementFrequency.daily:
        return 'Daily';
      case SupplementFrequency.twiceDaily:
        return 'Twice Daily';
      case SupplementFrequency.threeTimesDaily:
        return 'Three Times Daily';
      case SupplementFrequency.withMeals:
        return 'With Meals';
      case SupplementFrequency.asNeeded:
        return 'As Needed';
    }
  }

  String _getTimesText() {
    if (supplement.times.isEmpty) return '';
    return supplement.times
        .map((t) => '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}')
        .join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final timesText = _getTimesText();
    final scheduleText = '${supplement.dosage} - ${_getFrequencyText(supplement.frequency)}${timesText.isNotEmpty ? ' at $timesText' : ''}';

    return Card(
      color: supplement.isActive
          ? AppColors.cardBackgroundDark
          : AppColors.cardBackgroundDark.withOpacity(0.5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: const Icon(
                  Icons.local_pharmacy,
                  color: AppColors.accent,
                  size: AppSpacing.iconSizeMedium,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            supplement.name,
                            style: AppTypography.titleSmall.copyWith(
                              color: supplement.isActive
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textSecondaryDark,
                            ),
                          ),
                        ),
                        if (supplement.withMeals)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                              vertical: AppSpacing.xxs,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.info.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                            ),
                            child: Text(
                              'With Meals',
                              style: AppTypography.labelSmall.copyWith(
                                color: AppColors.info,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      scheduleText,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondaryDark,
                      ),
                    ),
                    if (supplement.notes != null && supplement.notes!.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        supplement.notes!,
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.textHintDark,
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              if (onToggle != null)
                Switch(
                  value: supplement.remindersEnabled,
                  onChanged: onToggle,
                  activeThumbColor: AppColors.primary,
                ),
              if (onDelete != null)
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: AppColors.error),
                  onPressed: onDelete,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
