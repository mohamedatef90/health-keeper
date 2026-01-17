import 'package:flutter/material.dart';

import '../../../../core/domain/entities/protocol.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class MedicationCard extends StatelessWidget {
  final Medication medication;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggle;
  final VoidCallback? onDelete;

  const MedicationCard({
    super.key,
    required this.medication,
    this.onTap,
    this.onToggle,
    this.onDelete,
  });

  String _getFrequencyText(MedicationFrequency frequency) {
    switch (frequency) {
      case MedicationFrequency.daily:
        return 'Daily';
      case MedicationFrequency.twiceDaily:
        return 'Twice Daily';
      case MedicationFrequency.weekly:
        return 'Weekly';
      case MedicationFrequency.biWeekly:
        return 'Every 2 Weeks';
      case MedicationFrequency.monthly:
        return 'Monthly';
      case MedicationFrequency.asNeeded:
        return 'As Needed';
    }
  }

  String _getTimesText() {
    if (medication.times.isEmpty) return '';
    return medication.times
        .map((t) => '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}')
        .join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final timesText = _getTimesText();
    final scheduleText = '${medication.dosage} - ${_getFrequencyText(medication.frequency)}${timesText.isNotEmpty ? ' at $timesText' : ''}';

    return Card(
      color: medication.isActive
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
                  color: AppColors.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: const Icon(
                  Icons.medication,
                  color: AppColors.secondary,
                  size: AppSpacing.iconSizeMedium,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medication.name,
                      style: AppTypography.titleSmall.copyWith(
                        color: medication.isActive
                            ? AppColors.textPrimaryDark
                            : AppColors.textSecondaryDark,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      scheduleText,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondaryDark,
                      ),
                    ),
                    if (medication.notes != null && medication.notes!.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        medication.notes!,
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
                  value: medication.remindersEnabled,
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
