import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class WorkoutLogScreen extends ConsumerWidget {
  const WorkoutLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Workout'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AI Recommendation Card
            Card(
              color: AppColors.primary.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    const Icon(Icons.auto_awesome, color: AppColors.primary),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AI Recommendation',
                            style: AppTypography.titleSmall.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            'Moderate intensity today based on your recovery',
                            style: AppTypography.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Workout type selection
            Text('Workout Type', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                _WorkoutTypeChip(label: 'Walking', icon: Icons.directions_walk, isSelected: true),
                _WorkoutTypeChip(label: 'Running', icon: Icons.directions_run),
                _WorkoutTypeChip(label: 'Cycling', icon: Icons.directions_bike),
                _WorkoutTypeChip(label: 'Gym', icon: Icons.fitness_center),
                _WorkoutTypeChip(label: 'Swimming', icon: Icons.pool),
                _WorkoutTypeChip(label: 'Yoga', icon: Icons.self_improvement),
                _WorkoutTypeChip(label: 'Sports', icon: Icons.sports_soccer),
                _WorkoutTypeChip(label: 'Other', icon: Icons.more_horiz),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // Duration
            Text('Duration', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '30',
                      suffixText: 'min',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // Intensity
            Text('Intensity', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(10, (index) {
                final intensity = index + 1;
                final isSelected = intensity == 5;
                return GestureDetector(
                  onTap: () {
                    // TODO: Update intensity
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.divider,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Center(
                      child: Text(
                        '$intensity',
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textPrimary,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: AppSpacing.xs),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Easy', style: AppTypography.labelSmall),
                Text('Hard', style: AppTypography.labelSmall),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // Notes
            Text('Notes (optional)', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'How did it feel? Any notes...',
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
          child: ElevatedButton(
            onPressed: () {
              // TODO: Save workout
              context.go('/');
            },
            child: const Text('Save Workout'),
          ),
        ),
      ),
    );
  }
}

class _WorkoutTypeChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;

  const _WorkoutTypeChip({
    required this.label,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(label),
        ],
      ),
      selected: isSelected,
      onSelected: (selected) {
        // TODO: Update selection
      },
      selectedColor: AppColors.primary,
      checkmarkColor: Colors.white,
    );
  }
}
