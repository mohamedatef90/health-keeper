import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// A widget that plays YouTube exercise demo videos
class ExerciseVideoPlayer extends StatefulWidget {
  final String videoId;
  final String? thumbnailUrl;
  final bool autoPlay;
  final VoidCallback? onFullScreen;

  const ExerciseVideoPlayer({
    super.key,
    required this.videoId,
    this.thumbnailUrl,
    this.autoPlay = false,
    this.onFullScreen,
  });

  @override
  State<ExerciseVideoPlayer> createState() => _ExerciseVideoPlayerState();
}

class _ExerciseVideoPlayerState extends State<ExerciseVideoPlayer> {
  late YoutubePlayerController _controller;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: false,
        enableCaption: false,
        forceHD: false,
        loop: false,
        controlsVisibleAtStart: true,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_controller.value.isReady && !_isReady) {
      setState(() {
        _isReady = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: AppColors.strain,
          progressColors: const ProgressBarColors(
            playedColor: AppColors.strain,
            handleColor: AppColors.strain,
            bufferedColor: AppColors.borderDark,
            backgroundColor: AppColors.surfaceDark,
          ),
          onReady: () {
            setState(() {
              _isReady = true;
            });
          },
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              if (!_isReady)
                Container(
                  height: 200,
                  color: AppColors.cardDark,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.strain,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

/// A thumbnail that shows a play button overlay
/// Tapping opens the full video player
class ExerciseVideoThumbnail extends StatelessWidget {
  final String? thumbnailUrl;
  final String videoId;
  final VoidCallback onTap;
  final int? durationSeconds;

  const ExerciseVideoThumbnail({
    super.key,
    this.thumbnailUrl,
    required this.videoId,
    required this.onTap,
    this.durationSeconds,
  });

  String get _thumbnailUrl {
    if (thumbnailUrl != null) return thumbnailUrl!;
    // Use YouTube's default thumbnail
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  String get _formattedDuration {
    if (durationSeconds == null) return '';
    final minutes = durationSeconds! ~/ 60;
    final seconds = durationSeconds! % 60;
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Thumbnail image
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                _thumbnailUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.cardDark,
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_outline,
                        size: 48,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: AppColors.cardDark,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.strain,
                        strokeWidth: 2,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Play button overlay
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.strain.withValues(alpha: 0.9),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow,
              size: 40,
              color: AppColors.backgroundDark,
            ),
          ),
          // Duration badge
          if (durationSeconds != null)
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xs,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.backgroundDark.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Text(
                  _formattedDuration,
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          // "Watch Demo" text
          Positioned(
            left: 8,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: AppColors.strain.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.videocam,
                    size: 14,
                    color: AppColors.backgroundDark,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Watch Demo',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.backgroundDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
