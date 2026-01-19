/// Represents an exercise in the exercise library
class Exercise {
  final String id;
  final String name;
  final MuscleGroup muscleGroup;
  final String? equipment;
  final String? instructions;
  final bool isCustom;

  // Video demo fields
  final String? videoUrl; // YouTube URL or video ID
  final String? videoThumbnailUrl; // Thumbnail image URL
  final int? videoDurationSeconds; // Video length in seconds

  const Exercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    this.equipment,
    this.instructions,
    this.isCustom = false,
    this.videoUrl,
    this.videoThumbnailUrl,
    this.videoDurationSeconds,
  });

  /// Check if exercise has a demo video
  bool get hasVideo => videoUrl != null && videoUrl!.isNotEmpty;

  /// Extract YouTube video ID from URL
  String? get youtubeVideoId {
    if (videoUrl == null) return null;
    // Handle various YouTube URL formats
    final uri = Uri.tryParse(videoUrl!);
    if (uri == null) return videoUrl; // Assume it's already a video ID

    // youtube.com/watch?v=VIDEO_ID
    if (uri.host.contains('youtube.com')) {
      return uri.queryParameters['v'];
    }
    // youtu.be/VIDEO_ID
    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
    }
    return videoUrl; // Assume it's a video ID
  }

  Exercise copyWith({
    String? id,
    String? name,
    MuscleGroup? muscleGroup,
    String? equipment,
    String? instructions,
    bool? isCustom,
    String? videoUrl,
    String? videoThumbnailUrl,
    int? videoDurationSeconds,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      muscleGroup: muscleGroup ?? this.muscleGroup,
      equipment: equipment ?? this.equipment,
      instructions: instructions ?? this.instructions,
      isCustom: isCustom ?? this.isCustom,
      videoUrl: videoUrl ?? this.videoUrl,
      videoThumbnailUrl: videoThumbnailUrl ?? this.videoThumbnailUrl,
      videoDurationSeconds: videoDurationSeconds ?? this.videoDurationSeconds,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'muscleGroup': muscleGroup.name,
      'equipment': equipment,
      'instructions': instructions,
      'isCustom': isCustom,
      'videoUrl': videoUrl,
      'videoThumbnailUrl': videoThumbnailUrl,
      'videoDurationSeconds': videoDurationSeconds,
    };
  }

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] as String,
      name: json['name'] as String,
      muscleGroup: MuscleGroup.values.firstWhere(
        (e) => e.name == json['muscleGroup'],
        orElse: () => MuscleGroup.other,
      ),
      equipment: json['equipment'] as String?,
      instructions: json['instructions'] as String?,
      isCustom: json['isCustom'] as bool? ?? false,
      videoUrl: json['videoUrl'] as String?,
      videoThumbnailUrl: json['videoThumbnailUrl'] as String?,
      videoDurationSeconds: json['videoDurationSeconds'] as int?,
    );
  }
}

/// Muscle groups for categorizing exercises
enum MuscleGroup {
  chest('Chest', 'chest'),
  back('Back', 'back'),
  shoulders('Shoulders', 'shoulders'),
  arms('Arms', 'arms'),
  legs('Legs', 'legs'),
  core('Core', 'core'),
  fullBody('Full Body', 'full_body'),
  cardio('Cardio', 'cardio'),
  other('Other', 'other');

  final String displayName;
  final String value;

  const MuscleGroup(this.displayName, this.value);
}

/// Represents a single set performed during an exercise
class ExerciseSet {
  final int setNumber;
  final int? reps;
  final double? weight;
  final int? durationSeconds;
  final bool isCompleted;

  const ExerciseSet({
    required this.setNumber,
    this.reps,
    this.weight,
    this.durationSeconds,
    this.isCompleted = false,
  });

  ExerciseSet copyWith({
    int? setNumber,
    int? reps,
    double? weight,
    int? durationSeconds,
    bool? isCompleted,
  }) {
    return ExerciseSet(
      setNumber: setNumber ?? this.setNumber,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'setNumber': setNumber,
      'reps': reps,
      'weight': weight,
      'durationSeconds': durationSeconds,
      'isCompleted': isCompleted,
    };
  }

  factory ExerciseSet.fromJson(Map<String, dynamic> json) {
    return ExerciseSet(
      setNumber: json['setNumber'] as int,
      reps: json['reps'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      durationSeconds: json['durationSeconds'] as int?,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }
}
