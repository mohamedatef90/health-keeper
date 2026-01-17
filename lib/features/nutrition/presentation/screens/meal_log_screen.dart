import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class MealLogScreen extends ConsumerWidget {
  const MealLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Meal'),
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
            // Quick options
            Text('Quick Log', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _QuickLogOption(
                    icon: Icons.camera_alt,
                    label: 'Camera',
                    subtitle: 'AI food recognition',
                    onTap: () => context.go('/camera-food'),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _QuickLogOption(
                    icon: Icons.bookmark,
                    label: 'Templates',
                    subtitle: 'Saved meals',
                    onTap: () {
                      // TODO: Show templates
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // Manual entry
            Text('Manual Entry', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),

            // Meal name
            TextField(
              decoration: const InputDecoration(
                labelText: 'Meal name (optional)',
                hintText: 'e.g., Lunch, Snack',
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Food items
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Food Items', style: AppTypography.titleSmall),
                        TextButton.icon(
                          onPressed: () => _showAddFoodDialog(context),
                          icon: const Icon(Icons.add, size: 18),
                          label: const Text('Add'),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    // Placeholder for food items
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: BoxDecoration(
                        color: AppColors.divider.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                        border: Border.all(
                          color: AppColors.divider,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.restaurant_menu,
                              size: 48,
                              color: AppColors.textHint,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              'No items added yet',
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textHint,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              'Tap "Add" to add food items',
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textHint,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Totals
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Totals', style: AppTypography.titleSmall),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _MacroDisplay(
                          label: 'Calories',
                          value: '0',
                          color: AppColors.calories,
                        ),
                        _MacroDisplay(
                          label: 'Protein',
                          value: '0g',
                          color: AppColors.protein,
                        ),
                        _MacroDisplay(
                          label: 'Carbs',
                          value: '0g',
                          color: AppColors.carbs,
                        ),
                        _MacroDisplay(
                          label: 'Fat',
                          value: '0g',
                          color: AppColors.fat,
                        ),
                      ],
                    ),
                  ],
                ),
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
              // TODO: Save meal
              context.go('/');
            },
            child: const Text('Save Meal'),
          ),
        ),
      ),
    );
  }

  void _showAddFoodDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Food Item', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Food name',
                  hintText: 'e.g., Grilled chicken',
                ),
                autofocus: true,
              ),
              const SizedBox(height: AppSpacing.md),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Portion',
                  hintText: 'e.g., 150g, 1 cup',
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Calories',
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Protein (g)',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Add Item'),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickLogOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  const _QuickLogOption({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.primary, size: 32),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(label, style: AppTypography.titleSmall),
              Text(
                subtitle,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MacroDisplay extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MacroDisplay({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.titleMedium.copyWith(color: color),
        ),
        Text(
          label,
          style: AppTypography.labelSmall,
        ),
      ],
    );
  }
}
