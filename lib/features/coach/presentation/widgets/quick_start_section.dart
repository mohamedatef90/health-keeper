import 'package:flutter/material.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../data/workout_templates.dart';

class QuickStartSection extends StatelessWidget {
  const QuickStartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUICK START',
          style: AppTypography.sectionHeader,
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            _QuickStartChip(
              label: 'Push',
              icon: Icons.fitness_center,
              color: AppColors.strain,
              onTap: () => _startQuickWorkout(context, 'push_day'),
            ),
            _QuickStartChip(
              label: 'Pull',
              icon: Icons.fitness_center,
              color: AppColors.recovery,
              onTap: () => _startQuickWorkout(context, 'pull_day'),
            ),
            _QuickStartChip(
              label: 'Legs',
              icon: Icons.directions_walk,
              color: AppColors.sleep,
              onTap: () => _startQuickWorkout(context, 'leg_day'),
            ),
            _QuickStartChip(
              label: 'HIIT',
              icon: Icons.timer,
              color: AppColors.alert,
              onTap: () => _startQuickWorkout(context, 'hiit'),
            ),
            _QuickStartChip(
              label: 'Cardio',
              icon: Icons.directions_run,
              color: AppColors.calories,
              onTap: () => _startQuickWorkout(context, 'cardio'),
            ),
            _QuickStartChip(
              label: 'Custom',
              icon: Icons.add,
              color: AppColors.textSecondary,
              onTap: () => _createCustomWorkout(context),
              isOutlined: true,
            ),
          ],
        ),
      ],
    );
  }

  void _startQuickWorkout(BuildContext context, String templateId) {
    final template = workoutTemplates.firstWhere(
      (t) => t.id == templateId,
      orElse: () => workoutTemplates.first,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Starting ${template.name}...'),
        backgroundColor: AppColors.strain,
      ),
    );
  }

  void _createCustomWorkout(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Custom workout builder coming soon!'),
        backgroundColor: AppColors.sleep,
      ),
    );
  }
}

class _QuickStartChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool isOutlined;

  const _QuickStartChip({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          border: Border.all(
            color: isOutlined ? AppColors.borderDark : color.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: color,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label,
              style: AppTypography.labelMedium.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
