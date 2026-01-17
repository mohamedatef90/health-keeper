import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class CameraFoodScreen extends ConsumerStatefulWidget {
  const CameraFoodScreen({super.key});

  @override
  ConsumerState<CameraFoodScreen> createState() => _CameraFoodScreenState();
}

class _CameraFoodScreenState extends ConsumerState<CameraFoodScreen> {
  bool _isAnalyzing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera preview placeholder
          Container(
            color: Colors.black,
            child: const Center(
              child: Icon(
                Icons.camera_alt,
                size: 64,
                color: Colors.white30,
              ),
            ),
          ),

          // Top bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => context.go('/'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.auto_awesome,
                            size: 16,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            'AI Food Recognition',
                            style: AppTypography.labelSmall.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.photo_library, color: Colors.white),
                      onPressed: () {
                        // TODO: Pick from gallery
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Instructions overlay
          if (!_isAnalyzing)
            Positioned(
              bottom: 150,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.md,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                  child: Text(
                    'Point camera at your meal',
                    style: AppTypography.bodyMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

          // Analyzing overlay
          if (_isAnalyzing)
            Container(
              color: Colors.black87,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'Analyzing food...',
                      style: AppTypography.titleMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'AI is identifying items and estimating nutrition',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Bottom controls
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Capture button
                    GestureDetector(
                      onTap: _isAnalyzing ? null : _captureAndAnalyze,
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _captureAndAnalyze() async {
    setState(() => _isAnalyzing = true);

    // Simulate AI analysis delay
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() => _isAnalyzing = false);

    // Show results
    _showAnalysisResults();
  }

  void _showAnalysisResults() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppSpacing.bottomSheetRadius),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.divider,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),

                // Header
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      'Food Identified',
                      style: AppTypography.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      size: 14,
                      color: AppColors.info,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      'AI estimate - tap items to edit',
                      style: AppTypography.aiGenerated,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),

                // Food items (placeholder)
                _buildFoodItem(
                  name: 'Grilled Chicken Breast',
                  portion: '~150g',
                  calories: 248,
                  protein: 46,
                  carbs: 0,
                  fat: 5,
                  confidence: 92,
                ),
                const SizedBox(height: AppSpacing.sm),
                _buildFoodItem(
                  name: 'Steamed Rice',
                  portion: '~1 cup',
                  calories: 206,
                  protein: 4,
                  carbs: 45,
                  fat: 0,
                  confidence: 88,
                ),
                const SizedBox(height: AppSpacing.sm),
                _buildFoodItem(
                  name: 'Mixed Vegetables',
                  portion: '~100g',
                  calories: 45,
                  protein: 2,
                  carbs: 9,
                  fat: 0,
                  confidence: 75,
                ),
                const SizedBox(height: AppSpacing.lg),

                // Totals
                Card(
                  color: AppColors.primary.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _TotalDisplay(label: 'Calories', value: '499'),
                        _TotalDisplay(label: 'Protein', value: '52g'),
                        _TotalDisplay(label: 'Carbs', value: '54g'),
                        _TotalDisplay(label: 'Fat', value: '5g'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),

                // Actions
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Retake photo
                        },
                        child: const Text('Retake'),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.go('/');
                          // TODO: Save meal
                        },
                        child: const Text('Save Meal'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFoodItem({
    required String name,
    required String portion,
    required int calories,
    required int protein,
    required int carbs,
    required int fat,
    required int confidence,
  }) {
    return Card(
      child: ListTile(
        title: Text(name, style: AppTypography.titleSmall),
        subtitle: Row(
          children: [
            Text(portion, style: AppTypography.bodySmall),
            const SizedBox(width: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: confidence >= 80
                    ? AppColors.success.withOpacity(0.1)
                    : AppColors.warning.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '$confidence% confidence',
                style: AppTypography.labelSmall.copyWith(
                  color: confidence >= 80
                      ? AppColors.success
                      : AppColors.warning,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$calories cal',
              style: AppTypography.titleSmall.copyWith(
                color: AppColors.calories,
              ),
            ),
            Text(
              '${protein}g protein',
              style: AppTypography.labelSmall,
            ),
          ],
        ),
        onTap: () {
          // TODO: Edit item
        },
      ),
    );
  }
}

class _TotalDisplay extends StatelessWidget {
  final String label;
  final String value;

  const _TotalDisplay({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.titleMedium.copyWith(
            color: AppColors.primary,
          ),
        ),
        Text(label, style: AppTypography.labelSmall),
      ],
    );
  }
}
