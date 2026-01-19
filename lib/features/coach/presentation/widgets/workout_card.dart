import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../domain/entities/workout_template.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutTemplate template;
  final VoidCallback onTap;

  const WorkoutCard({
    super.key,
    required this.template,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(color: AppColors.borderDark),
        ),
        child: Row(
          children: [
            // Category Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _getCategoryColor(template.category).withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Icon(
                _getCategoryIcon(template.category),
                color: _getCategoryColor(template.category),
                size: 24,
              ),
            ),
            const SizedBox(width: AppSpacing.md),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    template.name,
                    style: AppTypography.titleSmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Row(
                    children: [
                      _buildInfoChip(
                        '${template.exercises.length} exercises',
                        AppColors.textSecondary,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _buildInfoChip(
                        '${template.estimatedMinutes} min',
                        AppColors.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Difficulty Indicator
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: _getDifficultyColor(template.difficulty).withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              child: Text(
                template.difficulty.displayName,
                style: AppTypography.labelSmall.copyWith(
                  color: _getDifficultyColor(template.difficulty),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),

            const Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }

  IconData _getCategoryIcon(WorkoutCategory category) {
    switch (category) {
      case WorkoutCategory.strength:
        return Icons.fitness_center;
      case WorkoutCategory.cardio:
        return Icons.directions_run;
      case WorkoutCategory.hiit:
        return Icons.timer;
      case WorkoutCategory.flexibility:
        return Icons.self_improvement;
      case WorkoutCategory.sport:
        return Icons.sports_soccer;
    }
  }

  Color _getCategoryColor(WorkoutCategory category) {
    switch (category) {
      case WorkoutCategory.strength:
        return AppColors.strain;
      case WorkoutCategory.cardio:
        return AppColors.calories;
      case WorkoutCategory.hiit:
        return AppColors.alert;
      case WorkoutCategory.flexibility:
        return AppColors.sleep;
      case WorkoutCategory.sport:
        return AppColors.success;
    }
  }

  Color _getDifficultyColor(WorkoutDifficulty difficulty) {
    switch (difficulty) {
      case WorkoutDifficulty.beginner:
        return AppColors.success;
      case WorkoutDifficulty.intermediate:
        return AppColors.warning;
      case WorkoutDifficulty.advanced:
        return AppColors.alert;
    }
  }
}
