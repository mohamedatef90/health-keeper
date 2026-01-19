import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../domain/entities/exercise.dart';
import '../widgets/exercise_video_player.dart';

/// Screen showing exercise details with video demo
class ExerciseDetailScreen extends ConsumerStatefulWidget {
  final Exercise exercise;

  const ExerciseDetailScreen({
    super.key,
    required this.exercise,
  });

  @override
  ConsumerState<ExerciseDetailScreen> createState() =>
      _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends ConsumerState<ExerciseDetailScreen> {
  bool _showVideo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Exercise Details',
          style: AppTypography.titleMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Section
            if (widget.exercise.hasVideo)
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: _showVideo
                    ? ExerciseVideoPlayer(
                        videoId: widget.exercise.youtubeVideoId!,
                        thumbnailUrl: widget.exercise.videoThumbnailUrl,
                        autoPlay: true,
                      )
                    : ExerciseVideoThumbnail(
                        videoId: widget.exercise.youtubeVideoId!,
                        thumbnailUrl: widget.exercise.videoThumbnailUrl,
                        durationSeconds: widget.exercise.videoDurationSeconds,
                        onTap: () {
                          setState(() {
                            _showVideo = true;
                          });
                        },
                      ),
              ),

            // No video placeholder
            if (!widget.exercise.hasVideo)
              Container(
                margin: const EdgeInsets.all(AppSpacing.md),
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: AppColors.cardDark,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  border: Border.all(color: AppColors.borderDark),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.videocam_off_outlined,
                      size: 48,
                      color: AppColors.textTertiary,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Video demo coming soon',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

            // Exercise Info Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Exercise Name
                  Text(
                    widget.exercise.name,
                    style: AppTypography.titleLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),

                  // Tags Row
                  Row(
                    children: [
                      _buildTag(
                        widget.exercise.muscleGroup.displayName,
                        _getMuscleGroupColor(widget.exercise.muscleGroup),
                      ),
                      if (widget.exercise.equipment != null) ...[
                        const SizedBox(width: AppSpacing.sm),
                        _buildTag(
                          widget.exercise.equipment!,
                          AppColors.sleep,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xl),

                  // Instructions Section
                  if (widget.exercise.instructions != null) ...[
                    Text(
                      'HOW TO PERFORM',
                      style: AppTypography.sectionHeader,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.cardDark,
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusMd),
                        border: Border.all(color: AppColors.borderDark),
                      ),
                      child: Text(
                        widget.exercise.instructions!,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textPrimary,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                  ],

                  // Tips Section
                  _buildTipsSection(),
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: ElevatedButton(
            onPressed: () {
              // TODO: Add to workout
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${widget.exercise.name} added to workout'),
                  backgroundColor: AppColors.success,
                ),
              );
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.strain,
              foregroundColor: AppColors.backgroundDark,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
            ),
            child: Text(
              'Add to Workout',
              style: AppTypography.button.copyWith(
                color: AppColors.backgroundDark,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTipsSection() {
    final tips = _getTipsForMuscleGroup(widget.exercise.muscleGroup);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TIPS',
          style: AppTypography.sectionHeader,
        ),
        const SizedBox(height: AppSpacing.md),
        ...tips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.strain,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      tip,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  List<String> _getTipsForMuscleGroup(MuscleGroup group) {
    switch (group) {
      case MuscleGroup.chest:
        return [
          'Keep your core tight throughout the movement',
          'Control the weight on the way down',
          'Don\'t lock out your elbows completely',
        ];
      case MuscleGroup.back:
        return [
          'Squeeze your shoulder blades together',
          'Pull with your elbows, not your hands',
          'Keep your back straight',
        ];
      case MuscleGroup.shoulders:
        return [
          'Don\'t use momentum - control the movement',
          'Keep a slight bend in your elbows',
          'Don\'t shrug your shoulders up',
        ];
      case MuscleGroup.arms:
        return [
          'Focus on the muscle contraction',
          'Don\'t swing the weights',
          'Use a full range of motion',
        ];
      case MuscleGroup.legs:
        return [
          'Keep your knees tracking over your toes',
          'Don\'t let your knees cave inward',
          'Push through your heels',
        ];
      case MuscleGroup.core:
        return [
          'Breathe steadily throughout',
          'Don\'t hold your breath',
          'Focus on quality over quantity',
        ];
      case MuscleGroup.cardio:
        return [
          'Warm up properly before starting',
          'Stay hydrated',
          'Cool down after your session',
        ];
      default:
        return [
          'Focus on proper form',
          'Start with lighter weight',
          'Listen to your body',
        ];
    }
  }

  Color _getMuscleGroupColor(MuscleGroup group) {
    switch (group) {
      case MuscleGroup.chest:
        return AppColors.strain;
      case MuscleGroup.back:
        return AppColors.recovery;
      case MuscleGroup.shoulders:
        return AppColors.calories;
      case MuscleGroup.arms:
        return AppColors.protein;
      case MuscleGroup.legs:
        return AppColors.sleep;
      case MuscleGroup.core:
        return AppColors.warning;
      case MuscleGroup.fullBody:
        return AppColors.success;
      case MuscleGroup.cardio:
        return AppColors.alert;
      case MuscleGroup.other:
        return AppColors.textSecondary;
    }
  }
}
