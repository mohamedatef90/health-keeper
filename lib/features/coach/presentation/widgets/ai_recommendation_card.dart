import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../domain/entities/ai_workout_recommendation.dart';
import '../../providers/ai_workout_provider.dart';

class AiRecommendationCard extends ConsumerWidget {
  final VoidCallback? onStartWorkout;

  const AiRecommendationCard({
    super.key,
    this.onStartWorkout,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendationAsync = ref.watch(aiWorkoutRecommendationProvider);

    return recommendationAsync.when(
      loading: () => _buildLoadingCard(),
      error: (error, stack) => _buildErrorCard(),
      data: (recommendation) => _buildRecommendationCard(
        context,
        recommendation,
        ref,
      ),
    );
  }

  Widget _buildLoadingCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.strain.withOpacity(0.1),
            AppColors.recovery.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.xs),
                decoration: BoxDecoration(
                  color: AppColors.strain.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: AppColors.strain,
                  size: 16,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'AI RECOMMENDATION',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.strain,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.strain,
              strokeWidth: 2,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Center(
            child: Text(
              'Analyzing your nutrition & recovery...',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.info_outline,
            color: AppColors.textSecondary,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              'Unable to generate AI recommendation. Try logging a meal first.',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(
    BuildContext context,
    AiWorkoutRecommendation recommendation,
    WidgetRef ref,
  ) {
    final nutrition = recommendation.nutritionSummary;
    final health = recommendation.healthDataSummary;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.strain.withOpacity(0.15),
            AppColors.recovery.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(
          color: AppColors.strain.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AI Badge
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.xs),
                      decoration: BoxDecoration(
                        color: AppColors.strain.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: AppColors.strain,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      'AI RECOMMENDATION',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.strain,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    if (recommendation.isAiGenerated)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                        ),
                        child: Text(
                          'Live',
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.success,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),

                // Mini Stats Row
                _buildMiniStats(nutrition, health),
                const SizedBox(height: AppSpacing.md),

                // Reasoning
                Text(
                  recommendation.reasoning,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                    height: 1.4,
                  ),
                ),

                // Warnings
                if (recommendation.warnings.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.sm),
                  ...recommendation.warnings.map((warning) => Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.xxs),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.warning_amber_rounded,
                              color: AppColors.warning,
                              size: 14,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Expanded(
                              child: Text(
                                warning,
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.warning,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ],
            ),
          ),

          // Divider
          Container(
            height: 1,
            color: AppColors.borderDark.withOpacity(0.5),
          ),

          // Workout Suggestion
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                // Workout Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_forward,
                            color: AppColors.strain,
                            size: 16,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            'Suggested:',
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        recommendation.recommendedWorkout,
                        style: AppTypography.titleMedium.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Row(
                        children: [
                          _buildIntensityIndicator(recommendation.intensity),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            '~${recommendation.estimatedCaloriesBurn} kcal',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Start Button
                ElevatedButton(
                  onPressed: onStartWorkout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.strain,
                    foregroundColor: AppColors.backgroundDark,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.sm,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                  ),
                  child: const Text('START'),
                ),
              ],
            ),
          ),

          // Alternative if tired
          if (recommendation.alternativeIfTired != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.sleep.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppSpacing.radiusLg),
                  bottomRight: Radius.circular(AppSpacing.radiusLg),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.bedtime_outlined,
                    color: AppColors.sleep,
                    size: 14,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    'Feeling tired? Try: ${recommendation.alternativeIfTired}',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.sleep,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMiniStats(NutritionSummary nutrition, HealthDataSummary health) {
    return Row(
      children: [
        // Calories
        _buildMiniStat(
          icon: Icons.local_fire_department,
          value: '${nutrition.caloriesConsumed}',
          label: 'kcal',
          color: AppColors.calories,
          percentage: nutrition.caloriePercentage,
        ),
        const SizedBox(width: AppSpacing.md),
        // Protein
        _buildMiniStat(
          icon: Icons.egg_alt,
          value: '${nutrition.proteinConsumed}g',
          label: 'protein',
          color: AppColors.protein,
          percentage: nutrition.proteinPercentage,
        ),
        const SizedBox(width: AppSpacing.md),
        // Recovery
        _buildMiniStat(
          icon: Icons.favorite,
          value: health.recoveryScore != null ? '${health.recoveryScore}' : '--',
          label: 'recovery',
          color: _getRecoveryColor(health.recoveryScore),
        ),
        const SizedBox(width: AppSpacing.md),
        // Strain
        _buildMiniStat(
          icon: Icons.bolt,
          value: health.strainScore != null
              ? health.strainScore!.toStringAsFixed(1)
              : '--',
          label: 'strain',
          color: AppColors.strain,
        ),
      ],
    );
  }

  Widget _buildMiniStat({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
    double? percentage,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.xs),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 14),
            const SizedBox(height: 2),
            Text(
              value,
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (percentage != null)
              Text(
                '${percentage.round()}%',
                style: AppTypography.labelSmall.copyWith(
                  color: color,
                  fontSize: 9,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntensityIndicator(int intensity) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isActive = index < intensity;
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(right: 2),
          decoration: BoxDecoration(
            color: isActive
                ? _getIntensityColor(intensity)
                : AppColors.borderDark,
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }

  Color _getIntensityColor(int intensity) {
    if (intensity <= 2) return AppColors.success;
    if (intensity <= 3) return AppColors.warning;
    return AppColors.alert;
  }

  Color _getRecoveryColor(int? score) {
    if (score == null) return AppColors.textSecondary;
    if (score >= 67) return AppColors.success;
    if (score >= 34) return AppColors.warning;
    return AppColors.alert;
  }
}
