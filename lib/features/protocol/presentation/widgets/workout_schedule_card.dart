import 'package:flutter/material.dart';

import '../../../../core/domain/entities/protocol.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class WorkoutScheduleCard extends StatelessWidget {
  final ScheduledWorkout workout;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggle;
  final VoidCallback? onDelete;

  const WorkoutScheduleCard({
    super.key,
    required this.workout,
    this.onTap,
    this.onToggle,
    this.onDelete,
  });

  String _getDayName(int dayOfWeek) {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    if (dayOfWeek >= 1 && dayOfWeek <= 7) {
      return days[dayOfWeek - 1];
    }
    return 'Unknown';
  }

  String _getWorkoutTypeText(WorkoutType type) {
    switch (type) {
      case WorkoutType.strength:
        return 'Strength';
      case WorkoutType.cardio:
        return 'Cardio';
      case WorkoutType.flexibility:
        return 'Flexibility';
      case WorkoutType.sports:
        return 'Sports';
      case WorkoutType.hiit:
        return 'HIIT';
      case WorkoutType.yoga:
        return 'Yoga';
      case WorkoutType.swimming:
        return 'Swimming';
      case WorkoutType.cycling:
        return 'Cycling';
      case WorkoutType.running:
        return 'Running';
      case WorkoutType.walking:
        return 'Walking';
      case WorkoutType.other:
        return 'Other';
    }
  }

  IconData _getWorkoutIcon(WorkoutType type) {
    switch (type) {
      case WorkoutType.strength:
        return Icons.fitness_center;
      case WorkoutType.cardio:
        return Icons.favorite;
      case WorkoutType.flexibility:
        return Icons.self_improvement;
      case WorkoutType.sports:
        return Icons.sports_soccer;
      case WorkoutType.hiit:
        return Icons.timer;
      case WorkoutType.yoga:
        return Icons.spa;
      case WorkoutType.swimming:
        return Icons.pool;
      case WorkoutType.cycling:
        return Icons.directions_bike;
      case WorkoutType.running:
        return Icons.directions_run;
      case WorkoutType.walking:
        return Icons.directions_walk;
      case WorkoutType.other:
        return Icons.sports;
    }
  }

  Color _getWorkoutColor(WorkoutType type) {
    switch (type) {
      case WorkoutType.strength:
        return AppColors.error;
      case WorkoutType.cardio:
        return AppColors.primary;
      case WorkoutType.flexibility:
        return AppColors.secondary;
      case WorkoutType.sports:
        return AppColors.accent;
      case WorkoutType.hiit:
        return AppColors.warning;
      case WorkoutType.yoga:
        return AppColors.info;
      case WorkoutType.swimming:
        return AppColors.secondaryLight;
      case WorkoutType.cycling:
        return AppColors.primaryLight;
      case WorkoutType.running:
        return AppColors.accentLight;
      case WorkoutType.walking:
        return AppColors.recoveryGood;
      case WorkoutType.other:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getWorkoutColor(workout.type);
    final timeText = workout.preferredTime != null
        ? '${workout.preferredTime!.hour.toString().padLeft(2, '0')}:${workout.preferredTime!.minute.toString().padLeft(2, '0')}'
        : '';
    final durationText = workout.duration != null ? '${workout.duration} min' : '';
    final strainText = workout.targetStrain != null ? 'Target: ${workout.targetStrain!.toStringAsFixed(1)}' : '';

    final scheduleDetails = [
      _getDayName(workout.dayOfWeek),
      if (timeText.isNotEmpty) timeText,
      if (durationText.isNotEmpty) durationText,
      if (strainText.isNotEmpty) strainText,
    ].join(' - ');

    return Card(
      color: workout.isActive
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
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Icon(
                  _getWorkoutIcon(workout.type),
                  color: color,
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
                            workout.name,
                            style: AppTypography.titleSmall.copyWith(
                              color: workout.isActive
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textSecondaryDark,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: AppSpacing.xxs,
                          ),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                          ),
                          child: Text(
                            _getWorkoutTypeText(workout.type),
                            style: AppTypography.labelSmall.copyWith(
                              color: color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      scheduleDetails,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondaryDark,
                      ),
                    ),
                    if (workout.notes != null && workout.notes!.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        workout.notes!,
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
                  value: workout.isActive,
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
