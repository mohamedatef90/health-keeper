import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker/talker.dart';

import '../domain/entities/health_prediction.dart';
import '../providers/providers.dart';
import 'gemini_coach_service.dart';

/// Service for predictive health monitoring
///
/// Based on WHOOP research achieving 92.72% accuracy in predicting illness
/// within 7 days using:
/// - Respiratory rate changes
/// - HRV deviations from baseline
/// - Daily strain patterns
/// - Deep sleep duration changes
///
/// IMPORTANT: All predictions include appropriate disclaimers.
/// This is NOT medical advice - for informational purposes only.
abstract class HealthPredictionService {
  /// Predict overall health status based on current health context
  ///
  /// Analyzes biometric patterns to predict:
  /// - Illness risk (rising respiratory rate + dropping HRV + poor sleep)
  /// - Overtraining risk (high strain streak + declining recovery + elevated RHR)
  /// - Sleep debt accumulation
  /// - Stress accumulation
  ///
  /// Returns [HealthPrediction] with confidence levels and recommendations.
  Future<HealthPrediction> predictHealth(HealthContext context);

  /// Analyze health patterns from daily metrics history
  ///
  /// Looks for:
  /// - Emerging illness patterns (HRV drops, respiratory changes)
  /// - Overtraining indicators (strain/recovery imbalance)
  /// - Sleep debt accumulation
  /// - Behavioral correlations
  ///
  /// Returns list of [HealthAlert] sorted by severity.
  Future<List<HealthAlert>> analyzePatterns(List<DailyMetrics> history);

  /// Analyze trends in health metrics over time
  ///
  /// Identifies:
  /// - Weekly cycles
  /// - Monthly trends
  /// - Correlations between metrics
  /// - Optimization opportunities
  Future<TrendAnalysis> analyzeTrends(List<DailyMetrics> metrics);

  /// Get proactive health nudges based on current context
  ///
  /// Returns 1-3 actionable nudges based on:
  /// - Current recovery state
  /// - Recent patterns
  /// - Upcoming schedule
  Future<List<ProactiveNudge>> getProactiveNudges(HealthContext context);

  /// Get cached prediction if available and not stale
  Future<HealthPrediction?> getCachedPrediction();

  /// Clear cached prediction
  Future<void> clearCache();
}

/// Daily metrics for pattern analysis
class DailyMetrics {
  final DateTime date;
  final int? hrv;
  final int? rhr;
  final double? sleepHours;
  final int? sleepQuality;
  final double? respiratoryRate;
  final double? spo2;
  final double? strainScore;
  final int? recoveryScore;
  final List<String> behaviors;
  final int? moodEnergy;
  final int? stressLevel;

  const DailyMetrics({
    required this.date,
    this.hrv,
    this.rhr,
    this.sleepHours,
    this.sleepQuality,
    this.respiratoryRate,
    this.spo2,
    this.strainScore,
    this.recoveryScore,
    this.behaviors = const [],
    this.moodEnergy,
    this.stressLevel,
  });

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'hrv': hrv,
        'rhr': rhr,
        'sleepHours': sleepHours,
        'sleepQuality': sleepQuality,
        'respiratoryRate': respiratoryRate,
        'spo2': spo2,
        'strainScore': strainScore,
        'recoveryScore': recoveryScore,
        'behaviors': behaviors,
        'moodEnergy': moodEnergy,
        'stressLevel': stressLevel,
      };

  factory DailyMetrics.fromJson(Map<String, dynamic> json) => DailyMetrics(
        date: DateTime.parse(json['date']),
        hrv: json['hrv'],
        rhr: json['rhr'],
        sleepHours: json['sleepHours']?.toDouble(),
        sleepQuality: json['sleepQuality'],
        respiratoryRate: json['respiratoryRate']?.toDouble(),
        spo2: json['spo2']?.toDouble(),
        strainScore: json['strainScore']?.toDouble(),
        recoveryScore: json['recoveryScore'],
        behaviors: List<String>.from(json['behaviors'] ?? []),
        moodEnergy: json['moodEnergy'],
        stressLevel: json['stressLevel'],
      );
}

/// Health alert with severity and actionable steps
class HealthAlert {
  final HealthAlertType type;
  final AlertSeverity severity;
  final String title;
  final String message;
  final List<String> actionableSteps;
  final int confidence;
  final DateTime generatedAt;
  final String? relatedMetric;
  final double? metricChange;
  final bool requiresAttention;

  const HealthAlert({
    required this.type,
    required this.severity,
    required this.title,
    required this.message,
    required this.actionableSteps,
    required this.confidence,
    required this.generatedAt,
    this.relatedMetric,
    this.metricChange,
    this.requiresAttention = false,
  });

  Map<String, dynamic> toJson() => {
        'type': type.name,
        'severity': severity.name,
        'title': title,
        'message': message,
        'actionableSteps': actionableSteps,
        'confidence': confidence,
        'generatedAt': generatedAt.toIso8601String(),
        'relatedMetric': relatedMetric,
        'metricChange': metricChange,
        'requiresAttention': requiresAttention,
      };

  factory HealthAlert.fromJson(Map<String, dynamic> json) => HealthAlert(
        type: HealthAlertType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => HealthAlertType.general,
        ),
        severity: AlertSeverity.values.firstWhere(
          (e) => e.name == json['severity'],
          orElse: () => AlertSeverity.low,
        ),
        title: json['title'] ?? '',
        message: json['message'] ?? '',
        actionableSteps: List<String>.from(json['actionableSteps'] ?? []),
        confidence: json['confidence'] ?? 0,
        generatedAt: DateTime.parse(json['generatedAt']),
        relatedMetric: json['relatedMetric'],
        metricChange: json['metricChange']?.toDouble(),
        requiresAttention: json['requiresAttention'] ?? false,
      );
}

/// Types of health alerts
enum HealthAlertType {
  illness,
  overtraining,
  sleepDebt,
  stress,
  hrvDrop,
  rhrElevated,
  patternAnomaly,
  general,
}

/// Alert severity levels
enum AlertSeverity {
  low,
  medium,
  high,
  critical,
}

/// Proactive nudge for the user
class ProactiveNudge {
  final NudgeType type;
  final String message;
  final String? actionableAdvice;
  final NudgeTiming timing;
  final NudgePriority priority;
  final DateTime generatedAt;
  final int confidence;

  const ProactiveNudge({
    required this.type,
    required this.message,
    this.actionableAdvice,
    required this.timing,
    required this.priority,
    required this.generatedAt,
    required this.confidence,
  });

  Map<String, dynamic> toJson() => {
        'type': type.name,
        'message': message,
        'actionableAdvice': actionableAdvice,
        'timing': timing.name,
        'priority': priority.name,
        'generatedAt': generatedAt.toIso8601String(),
        'confidence': confidence,
      };

  factory ProactiveNudge.fromJson(Map<String, dynamic> json) => ProactiveNudge(
        type: NudgeType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => NudgeType.recovery,
        ),
        message: json['message'] ?? '',
        actionableAdvice: json['actionableAdvice'],
        timing: NudgeTiming.values.firstWhere(
          (e) => e.name == json['timing'],
          orElse: () => NudgeTiming.now,
        ),
        priority: NudgePriority.values.firstWhere(
          (e) => e.name == json['priority'],
          orElse: () => NudgePriority.medium,
        ),
        generatedAt: DateTime.parse(json['generatedAt']),
        confidence: json['confidence'] ?? 0,
      );
}

/// Types of nudges
enum NudgeType {
  strain,
  recovery,
  sleep,
  nutrition,
  hydration,
  stress,
  celebration,
}

/// When to show the nudge
enum NudgeTiming {
  now,
  morning,
  afternoon,
  evening,
  beforeSleep,
  afterWorkout,
}

/// Nudge priority
enum NudgePriority {
  low,
  medium,
  high,
  urgent,
}

/// Trend analysis result
class TrendAnalysis {
  final int analysisConfidence;
  final String dataQuality;
  final List<DetectedTrend> trends;
  final List<MetricCorrelation> correlations;
  final WeeklyPattern? weeklyPattern;
  final List<String> keyInsights;
  final List<String> optimizationOpportunities;
  final List<String> warnings;
  final List<String> celebrations;
  final DateTime analyzedAt;

  const TrendAnalysis({
    required this.analysisConfidence,
    required this.dataQuality,
    required this.trends,
    required this.correlations,
    this.weeklyPattern,
    required this.keyInsights,
    required this.optimizationOpportunities,
    required this.warnings,
    required this.celebrations,
    required this.analyzedAt,
  });

  factory TrendAnalysis.empty() => TrendAnalysis(
        analysisConfidence: 0,
        dataQuality: 'insufficient',
        trends: [],
        correlations: [],
        keyInsights: ['Log more data to see trends'],
        optimizationOpportunities: [],
        warnings: [],
        celebrations: [],
        analyzedAt: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        'analysisConfidence': analysisConfidence,
        'dataQuality': dataQuality,
        'trends': trends.map((t) => t.toJson()).toList(),
        'correlations': correlations.map((c) => c.toJson()).toList(),
        'weeklyPattern': weeklyPattern?.toJson(),
        'keyInsights': keyInsights,
        'optimizationOpportunities': optimizationOpportunities,
        'warnings': warnings,
        'celebrations': celebrations,
        'analyzedAt': analyzedAt.toIso8601String(),
      };
}

/// A detected trend in health data
class DetectedTrend {
  final String metric;
  final TrendDirection direction;
  final double changeRate;
  final int confidence;
  final String description;
  final String? suggestedAction;

  const DetectedTrend({
    required this.metric,
    required this.direction,
    required this.changeRate,
    required this.confidence,
    required this.description,
    this.suggestedAction,
  });

  Map<String, dynamic> toJson() => {
        'metric': metric,
        'direction': direction.name,
        'changeRate': changeRate,
        'confidence': confidence,
        'description': description,
        'suggestedAction': suggestedAction,
      };
}

/// Trend direction
enum TrendDirection {
  improving,
  stable,
  declining,
  rapidlyDeclining,
}

/// Correlation between two metrics
class MetricCorrelation {
  final String metric1;
  final String metric2;
  final CorrelationType type;
  final double strength;
  final int confidence;
  final String explanation;

  const MetricCorrelation({
    required this.metric1,
    required this.metric2,
    required this.type,
    required this.strength,
    required this.confidence,
    required this.explanation,
  });

  Map<String, dynamic> toJson() => {
        'metric1': metric1,
        'metric2': metric2,
        'type': type.name,
        'strength': strength,
        'confidence': confidence,
        'explanation': explanation,
      };
}

/// Correlation type
enum CorrelationType {
  positive,
  negative,
  complex,
}

/// Weekly pattern analysis
class WeeklyPattern {
  final String? bestRecoveryDay;
  final String? worstRecoveryDay;
  final List<String> highStrainDays;
  final String? weekendPattern;

  const WeeklyPattern({
    this.bestRecoveryDay,
    this.worstRecoveryDay,
    this.highStrainDays = const [],
    this.weekendPattern,
  });

  Map<String, dynamic> toJson() => {
        'bestRecoveryDay': bestRecoveryDay,
        'worstRecoveryDay': worstRecoveryDay,
        'highStrainDays': highStrainDays,
        'weekendPattern': weekendPattern,
      };
}

/// Implementation of HealthPredictionService
class HealthPredictionServiceImpl implements HealthPredictionService {
  final GeminiCoachService _geminiService;
  final Talker _talker;

  static const String _cacheKey = 'health_prediction_cache';
  static const Duration _cacheDuration = Duration(hours: 4);

  HealthPredictionServiceImpl({
    required GeminiCoachService geminiService,
    required Talker talker,
  })  : _geminiService = geminiService,
        _talker = talker;

  @override
  Future<HealthPrediction> predictHealth(HealthContext context) async {
    try {
      // Check cache first
      final cached = await getCachedPrediction();
      if (cached != null) {
        _talker.info('Using cached health prediction');
        return cached;
      }

      // Build prediction from multiple AI analyses
      final illnessRisk = await _geminiService.predictIllness(context);

      // Build strain/recovery history for overtraining assessment
      final strainRecoveryHistory = StrainRecoveryHistory(
        userId: context.userId,
        dailyData: _buildDailyStrainRecovery(context),
        workouts: [], // Would come from actual workout logs
      );
      final overtrainingRisk = await _geminiService.assessOvertrainingRisk(
        strainRecoveryHistory,
      );

      // Assess sleep debt
      final sleepDebt = await _geminiService.assessSleepDebt(
        context.sleepLast7Days,
        8.0, // Target sleep hours
        context.sleepQualityLast7Days.isNotEmpty
            ? context.sleepQualityLast7Days
            : null,
      );

      // Get proactive insights
      final insights = await _geminiService.getProactiveInsights(context);

      // Build comprehensive prediction
      final prediction = _buildHealthPrediction(
        context: context,
        illnessRisk: illnessRisk,
        overtrainingRisk: overtrainingRisk,
        sleepDebt: sleepDebt,
        insights: insights,
      );

      // Cache the prediction
      await _cacheHealthPrediction(prediction);

      return prediction;
    } catch (e, st) {
      _talker.error('Failed to predict health', e, st);
      return HealthPrediction.fallback();
    }
  }

  @override
  Future<List<HealthAlert>> analyzePatterns(List<DailyMetrics> history) async {
    if (history.length < 7) {
      return [];
    }

    final alerts = <HealthAlert>[];

    try {
      // Check for HRV drops
      final hrvAlert = _analyzeHrvPattern(history);
      if (hrvAlert != null) alerts.add(hrvAlert);

      // Check for RHR elevation
      final rhrAlert = _analyzeRhrPattern(history);
      if (rhrAlert != null) alerts.add(rhrAlert);

      // Check for sleep debt
      final sleepAlert = _analyzeSleepPattern(history);
      if (sleepAlert != null) alerts.add(sleepAlert);

      // Check for strain/recovery imbalance
      final strainAlert = _analyzeStrainRecoveryPattern(history);
      if (strainAlert != null) alerts.add(strainAlert);

      // Sort by severity
      alerts.sort((a, b) => b.severity.index.compareTo(a.severity.index));

      return alerts;
    } catch (e, st) {
      _talker.error('Failed to analyze patterns', e, st);
      return [];
    }
  }

  @override
  Future<TrendAnalysis> analyzeTrends(List<DailyMetrics> metrics) async {
    if (metrics.length < 14) {
      return TrendAnalysis.empty();
    }

    try {
      // Build daily data for pattern detection
      final dailyData = metrics.map((m) => {
        'date': m.date.toIso8601String(),
        'recovery': m.recoveryScore ?? 0,
        'strain': m.strainScore ?? 0.0,
        'hrv': m.hrv,
        'rhr': m.rhr,
        'sleep': m.sleepHours,
        'sleepQuality': m.sleepQuality,
        'behaviors': m.behaviors,
        'mood': m.moodEnergy,
        'stress': m.stressLevel,
        'workoutType': null,
        'workoutDuration': 0,
      }).toList();

      final allBehaviors = metrics
          .expand((m) => m.behaviors)
          .toSet()
          .toList();

      final result = await _geminiService.detectPatterns(
        dailyData,
        allBehaviors,
        {}, // User profile would come from actual user data
      );

      return TrendAnalysis(
        analysisConfidence: result.analysisConfidence,
        dataQuality: result.dataQuality,
        trends: result.patterns.map((p) => DetectedTrend(
          metric: p.patternType,
          direction: _parseTrendDirection(p.actionability),
          changeRate: 0.0, // Would be calculated from actual data
          confidence: p.confidence,
          description: p.description,
          suggestedAction: p.suggestedAction,
        )).toList(),
        correlations: result.correlations.map((c) => MetricCorrelation(
          metric1: c.factor1,
          metric2: c.factor2,
          type: _parseCorrelationType(c.relationship),
          strength: c.strength,
          confidence: c.confidence,
          explanation: c.explanation,
        )).toList(),
        keyInsights: result.keyInsights,
        optimizationOpportunities: result.optimizationOpportunities,
        warnings: result.warnings,
        celebrations: result.celebrateWins,
        analyzedAt: DateTime.now(),
      );
    } catch (e, st) {
      _talker.error('Failed to analyze trends', e, st);
      return TrendAnalysis.empty();
    }
  }

  @override
  Future<List<ProactiveNudge>> getProactiveNudges(HealthContext context) async {
    try {
      final insights = await _geminiService.getProactiveInsights(context);

      return insights.map((insight) => ProactiveNudge(
        type: _mapInsightTypeToNudgeType(insight.type),
        message: insight.message,
        actionableAdvice: insight.actionableAdvice,
        timing: insight.isUrgent ? NudgeTiming.now : NudgeTiming.morning,
        priority: _mapActionPriorityToNudgePriority(insight.priority),
        generatedAt: insight.generatedAt,
        confidence: insight.confidence,
      )).toList();
    } catch (e, st) {
      _talker.error('Failed to get proactive nudges', e, st);
      return [];
    }
  }

  @override
  Future<HealthPrediction?> getCachedPrediction() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedJson = prefs.getString(_cacheKey);
      if (cachedJson == null) return null;

      final cached = json.decode(cachedJson) as Map<String, dynamic>;
      final cachedAt = DateTime.parse(cached['cachedAt'] as String);

      // Check if cache is still valid
      if (DateTime.now().difference(cachedAt) > _cacheDuration) {
        await clearCache();
        return null;
      }

      return HealthPrediction.fromJson(
        cached['prediction'] as Map<String, dynamic>,
      );
    } catch (e) {
      _talker.warning('Failed to read cached prediction: $e');
      return null;
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_cacheKey);
    } catch (e) {
      _talker.warning('Failed to clear prediction cache: $e');
    }
  }

  // Private helper methods

  Future<void> _cacheHealthPrediction(HealthPrediction prediction) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cacheData = {
        'cachedAt': DateTime.now().toIso8601String(),
        'prediction': prediction.toJson(),
      };
      await prefs.setString(_cacheKey, json.encode(cacheData));
    } catch (e) {
      _talker.warning('Failed to cache prediction: $e');
    }
  }

  List<DailyStrainRecovery> _buildDailyStrainRecovery(HealthContext context) {
    final data = <DailyStrainRecovery>[];
    final now = DateTime.now();

    for (int i = 0; i < context.strainLast7Days.length; i++) {
      data.add(DailyStrainRecovery(
        date: now.subtract(Duration(days: context.strainLast7Days.length - 1 - i)),
        strainScore: context.strainLast7Days[i],
        recoveryScore: i < context.recoveryLast7Days.length
            ? context.recoveryLast7Days[i]
            : 70,
        hrv: i < context.hrvLast7Days.length ? context.hrvLast7Days[i] : null,
        rhr: i < context.rhrLast7Days.length ? context.rhrLast7Days[i] : null,
        sleepHours: i < context.sleepLast7Days.length
            ? context.sleepLast7Days[i]
            : null,
      ));
    }

    return data;
  }

  HealthPrediction _buildHealthPrediction({
    required HealthContext context,
    required IllnessRisk illnessRisk,
    required OvertrainingRisk overtrainingRisk,
    required SleepDebtAssessment sleepDebt,
    required List<ProactiveInsight> insights,
  }) {
    // Calculate overall score
    final overallScore = _calculateOverallScore(
      illnessRisk: illnessRisk,
      overtrainingRisk: overtrainingRisk,
      sleepDebt: sleepDebt,
    );

    // Determine overall status
    final overallStatus = _determineOverallStatus(overallScore);

    // Build risk factors
    final riskFactors = _buildRiskFactors(
      illnessRisk: illnessRisk,
      overtrainingRisk: overtrainingRisk,
      sleepDebt: sleepDebt,
    );

    // Build recommendations
    final recommendations = _buildRecommendations(
      illnessRisk: illnessRisk,
      overtrainingRisk: overtrainingRisk,
      sleepDebt: sleepDebt,
    );

    // Build positive indicators
    final positiveIndicators = _buildPositiveIndicators(
      context: context,
      illnessRisk: illnessRisk,
      overtrainingRisk: overtrainingRisk,
    );

    // Calculate confidence
    final confidence = _calculateConfidence(
      context: context,
      illnessRisk: illnessRisk,
      overtrainingRisk: overtrainingRisk,
      sleepDebt: sleepDebt,
    );

    return HealthPrediction(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      generatedAt: DateTime.now(),
      overallStatus: overallStatus,
      overallScore: overallScore,
      confidence: confidence,
      illnessRisk: illnessRisk,
      overtrainingRisk: overtrainingRisk,
      sleepDebt: sleepDebt,
      riskFactors: riskFactors,
      recommendations: recommendations,
      positiveIndicators: positiveIndicators,
      summary: _buildSummary(
        overallStatus: overallStatus,
        illnessRisk: illnessRisk,
        overtrainingRisk: overtrainingRisk,
        sleepDebt: sleepDebt,
      ),
      disclaimer: 'This analysis is AI-generated for informational purposes only. '
          'It is not medical advice. Consult a healthcare provider for medical concerns.',
    );
  }

  int _calculateOverallScore({
    required IllnessRisk illnessRisk,
    required OvertrainingRisk overtrainingRisk,
    required SleepDebtAssessment sleepDebt,
  }) {
    // Weighted scoring
    final illnessComponent = (100 - illnessRisk.probability) * 0.35;
    final overtrainingComponent = (100 - overtrainingRisk.riskScore) * 0.35;
    final sleepComponent = _sleepDebtToScore(sleepDebt) * 0.30;

    return (illnessComponent + overtrainingComponent + sleepComponent).round();
  }

  double _sleepDebtToScore(SleepDebtAssessment sleepDebt) {
    switch (sleepDebt.level) {
      case SleepDebtLevel.none:
        return 100;
      case SleepDebtLevel.mild:
        return 80;
      case SleepDebtLevel.moderate:
        return 60;
      case SleepDebtLevel.severe:
        return 40;
      case SleepDebtLevel.critical:
        return 20;
      case SleepDebtLevel.unknown:
        return 50;
    }
  }

  HealthStatus _determineOverallStatus(int score) {
    if (score >= 80) return HealthStatus.excellent;
    if (score >= 65) return HealthStatus.good;
    if (score >= 45) return HealthStatus.moderate;
    return HealthStatus.attentionNeeded;
  }

  List<RiskFactor> _buildRiskFactors({
    required IllnessRisk illnessRisk,
    required OvertrainingRisk overtrainingRisk,
    required SleepDebtAssessment sleepDebt,
  }) {
    final factors = <RiskFactor>[];

    // Add illness risk factors
    for (final factor in illnessRisk.contributingFactors) {
      factors.add(RiskFactor(
        name: factor.factor,
        description: factor.observation,
        severity: factor.impactScore,
        category: RiskCategory.biometric,
        isActionable: true,
        suggestedAction: 'Monitor ${factor.factor} and consider preventive measures',
      ));
    }

    // Add overtraining risk factors
    if (overtrainingRisk.riskLevel != OvertrainingLevel.optimal) {
      for (final signal in overtrainingRisk.warningSignals) {
        factors.add(RiskFactor(
          name: 'Training Load',
          description: signal,
          severity: _overtrainingLevelToSeverity(overtrainingRisk.riskLevel),
          category: RiskCategory.behavioral,
          isActionable: true,
          suggestedAction: overtrainingRisk.recommendations.isNotEmpty
              ? overtrainingRisk.recommendations.first
              : 'Consider reducing training intensity',
        ));
      }
    }

    // Add sleep debt risk
    if (sleepDebt.level != SleepDebtLevel.none &&
        sleepDebt.level != SleepDebtLevel.unknown) {
      factors.add(RiskFactor(
        name: 'Sleep Debt',
        description: '${sleepDebt.accumulatedDebtHours.toStringAsFixed(1)}h accumulated',
        severity: _sleepDebtLevelToSeverity(sleepDebt.level),
        category: RiskCategory.behavioral,
        isActionable: true,
        suggestedAction: sleepDebt.recommendations.isNotEmpty
            ? sleepDebt.recommendations.first
            : 'Prioritize sleep to recover',
      ));
    }

    return factors;
  }

  int _overtrainingLevelToSeverity(OvertrainingLevel level) {
    switch (level) {
      case OvertrainingLevel.optimal:
        return 0;
      case OvertrainingLevel.adequate:
        return 20;
      case OvertrainingLevel.elevated:
        return 50;
      case OvertrainingLevel.high:
        return 75;
      case OvertrainingLevel.critical:
        return 95;
      case OvertrainingLevel.unknown:
        return 30;
    }
  }

  int _sleepDebtLevelToSeverity(SleepDebtLevel level) {
    switch (level) {
      case SleepDebtLevel.none:
        return 0;
      case SleepDebtLevel.mild:
        return 25;
      case SleepDebtLevel.moderate:
        return 50;
      case SleepDebtLevel.severe:
        return 75;
      case SleepDebtLevel.critical:
        return 95;
      case SleepDebtLevel.unknown:
        return 30;
    }
  }

  List<HealthRecommendation> _buildRecommendations({
    required IllnessRisk illnessRisk,
    required OvertrainingRisk overtrainingRisk,
    required SleepDebtAssessment sleepDebt,
  }) {
    final recommendations = <HealthRecommendation>[];

    // Add illness prevention recommendations
    for (final action in illnessRisk.preventiveActions) {
      recommendations.add(HealthRecommendation(
        title: action.action,
        description: action.rationale,
        category: action.category,
        priority: action.priority,
        rationale: action.rationale,
      ));
    }

    // Add overtraining recommendations
    for (final rec in overtrainingRisk.recommendations) {
      recommendations.add(HealthRecommendation(
        title: rec,
        description: 'Based on your strain/recovery balance',
        category: ActionCategory.activity,
        priority: _overtrainingLevelToPriority(overtrainingRisk.riskLevel),
        rationale: overtrainingRisk.explanation,
      ));
    }

    // Add sleep recommendations
    for (final rec in sleepDebt.recommendations) {
      recommendations.add(HealthRecommendation(
        title: rec,
        description: 'To help recover from sleep debt',
        category: ActionCategory.sleep,
        priority: _sleepDebtLevelToPriority(sleepDebt.level),
        rationale: sleepDebt.explanation,
        duration: '${sleepDebt.daysToRecover} days',
      ));
    }

    // Sort by priority and limit to 5
    recommendations.sort((a, b) => a.priority.index.compareTo(b.priority.index));
    return recommendations.take(5).toList();
  }

  ActionPriority _overtrainingLevelToPriority(OvertrainingLevel level) {
    switch (level) {
      case OvertrainingLevel.critical:
        return ActionPriority.immediate;
      case OvertrainingLevel.high:
        return ActionPriority.high;
      case OvertrainingLevel.elevated:
        return ActionPriority.medium;
      default:
        return ActionPriority.low;
    }
  }

  ActionPriority _sleepDebtLevelToPriority(SleepDebtLevel level) {
    switch (level) {
      case SleepDebtLevel.critical:
        return ActionPriority.immediate;
      case SleepDebtLevel.severe:
        return ActionPriority.high;
      case SleepDebtLevel.moderate:
        return ActionPriority.medium;
      default:
        return ActionPriority.low;
    }
  }

  List<String> _buildPositiveIndicators({
    required HealthContext context,
    required IllnessRisk illnessRisk,
    required OvertrainingRisk overtrainingRisk,
  }) {
    final indicators = <String>[];

    // Check for positive signs
    if (illnessRisk.riskLevel == IllnessRiskLevel.low) {
      indicators.add('Low illness risk');
    }

    if (overtrainingRisk.riskLevel == OvertrainingLevel.optimal ||
        overtrainingRisk.riskLevel == OvertrainingLevel.adequate) {
      indicators.add('Good training balance');
    }

    if (context.sleepLast7Days.isNotEmpty) {
      final avgSleep = context.sleepLast7Days.reduce((a, b) => a + b) /
          context.sleepLast7Days.length;
      if (avgSleep >= 7) {
        indicators.add('Consistent sleep');
      }
    }

    if (context.recoveryLast7Days.isNotEmpty) {
      final avgRecovery = context.recoveryLast7Days.reduce((a, b) => a + b) /
          context.recoveryLast7Days.length;
      if (avgRecovery >= 70) {
        indicators.add('Strong recovery trend');
      }
    }

    return indicators;
  }

  int _calculateConfidence({
    required HealthContext context,
    required IllnessRisk illnessRisk,
    required OvertrainingRisk overtrainingRisk,
    required SleepDebtAssessment sleepDebt,
  }) {
    // Base confidence on data availability
    int dataPoints = 0;
    if (context.hrvLast7Days.isNotEmpty) dataPoints += context.hrvLast7Days.length;
    if (context.rhrLast7Days.isNotEmpty) dataPoints += context.rhrLast7Days.length;
    if (context.sleepLast7Days.isNotEmpty) dataPoints += context.sleepLast7Days.length;
    if (context.strainLast7Days.isNotEmpty) dataPoints += context.strainLast7Days.length;

    // More data = higher confidence
    final dataConfidence = (dataPoints / 28 * 50).clamp(0, 50).toInt();

    // Average AI confidence scores
    final aiConfidence = (illnessRisk.confidence +
        overtrainingRisk.confidence) ~/ 2;

    return ((dataConfidence + aiConfidence * 0.5)).clamp(0, 100).toInt();
  }

  String _buildSummary({
    required HealthStatus overallStatus,
    required IllnessRisk illnessRisk,
    required OvertrainingRisk overtrainingRisk,
    required SleepDebtAssessment sleepDebt,
  }) {
    final parts = <String>[];

    switch (overallStatus) {
      case HealthStatus.excellent:
        parts.add('Your health metrics look excellent.');
        break;
      case HealthStatus.good:
        parts.add('Your health metrics are looking good overall.');
        break;
      case HealthStatus.moderate:
        parts.add('Your health metrics show room for improvement.');
        break;
      case HealthStatus.attentionNeeded:
        parts.add('Your health metrics need some attention.');
        break;
      case HealthStatus.unknown:
        parts.add('Unable to fully assess your health status.');
        break;
    }

    // Add specific focus areas
    if (illnessRisk.riskLevel != IllnessRiskLevel.low) {
      parts.add('Monitor for early illness signs.');
    }
    if (overtrainingRisk.riskLevel != OvertrainingLevel.optimal &&
        overtrainingRisk.riskLevel != OvertrainingLevel.adequate) {
      parts.add('Consider adjusting your training load.');
    }
    if (sleepDebt.level != SleepDebtLevel.none &&
        sleepDebt.level != SleepDebtLevel.unknown) {
      parts.add('Focus on recovering sleep debt.');
    }

    return parts.join(' ');
  }

  // Pattern analysis helpers

  HealthAlert? _analyzeHrvPattern(List<DailyMetrics> history) {
    final hrvValues = history
        .where((m) => m.hrv != null)
        .map((m) => m.hrv!)
        .toList();

    if (hrvValues.length < 5) return null;

    final recent = hrvValues.take(3).toList();
    final baseline = hrvValues.skip(3).toList();

    if (baseline.isEmpty) return null;

    final recentAvg = recent.reduce((a, b) => a + b) / recent.length;
    final baselineAvg = baseline.reduce((a, b) => a + b) / baseline.length;

    final dropPercent = ((baselineAvg - recentAvg) / baselineAvg * 100);

    if (dropPercent >= 25) {
      return HealthAlert(
        type: HealthAlertType.hrvDrop,
        severity: AlertSeverity.high,
        title: 'Significant HRV Drop',
        message: 'Your HRV has dropped ${dropPercent.toStringAsFixed(0)}% from baseline. '
            'This may indicate your body is under stress or fighting something off.',
        actionableSteps: [
          'Prioritize rest and sleep',
          'Reduce training intensity',
          'Stay hydrated',
          'Monitor for illness symptoms',
        ],
        confidence: 78,
        generatedAt: DateTime.now(),
        relatedMetric: 'HRV',
        metricChange: -dropPercent,
        requiresAttention: true,
      );
    } else if (dropPercent >= 15) {
      return HealthAlert(
        type: HealthAlertType.hrvDrop,
        severity: AlertSeverity.medium,
        title: 'HRV Below Baseline',
        message: 'Your HRV has dropped ${dropPercent.toStringAsFixed(0)}% from baseline. '
            'Consider a lighter day.',
        actionableSteps: [
          'Consider a recovery day',
          'Get extra sleep tonight',
        ],
        confidence: 70,
        generatedAt: DateTime.now(),
        relatedMetric: 'HRV',
        metricChange: -dropPercent,
      );
    }

    return null;
  }

  HealthAlert? _analyzeRhrPattern(List<DailyMetrics> history) {
    final rhrValues = history
        .where((m) => m.rhr != null)
        .map((m) => m.rhr!)
        .toList();

    if (rhrValues.length < 5) return null;

    final recent = rhrValues.take(3).toList();
    final baseline = rhrValues.skip(3).toList();

    if (baseline.isEmpty) return null;

    final recentAvg = recent.reduce((a, b) => a + b) / recent.length;
    final baselineAvg = baseline.reduce((a, b) => a + b) / baseline.length;

    final elevation = recentAvg - baselineAvg;

    if (elevation >= 15) {
      return HealthAlert(
        type: HealthAlertType.rhrElevated,
        severity: AlertSeverity.high,
        title: 'Elevated Resting Heart Rate',
        message: 'Your RHR is ${elevation.toStringAsFixed(0)} bpm above baseline. '
            'This can indicate stress, illness, or overtraining.',
        actionableSteps: [
          'Rest and recover today',
          'Monitor for other symptoms',
          'Consider consulting a doctor if persistent',
        ],
        confidence: 75,
        generatedAt: DateTime.now(),
        relatedMetric: 'RHR',
        metricChange: elevation,
        requiresAttention: true,
      );
    } else if (elevation >= 8) {
      return HealthAlert(
        type: HealthAlertType.rhrElevated,
        severity: AlertSeverity.medium,
        title: 'RHR Above Baseline',
        message: 'Your RHR is ${elevation.toStringAsFixed(0)} bpm above baseline.',
        actionableSteps: [
          'Take it easy today',
          'Prioritize hydration',
        ],
        confidence: 68,
        generatedAt: DateTime.now(),
        relatedMetric: 'RHR',
        metricChange: elevation,
      );
    }

    return null;
  }

  HealthAlert? _analyzeSleepPattern(List<DailyMetrics> history) {
    final sleepValues = history
        .where((m) => m.sleepHours != null)
        .map((m) => m.sleepHours!)
        .toList();

    if (sleepValues.length < 7) return null;

    final avgSleep = sleepValues.reduce((a, b) => a + b) / sleepValues.length;
    final targetSleep = 8.0;
    final deficitPerNight = targetSleep - avgSleep;
    final totalDebt = deficitPerNight * sleepValues.length;

    if (totalDebt >= 10) {
      return HealthAlert(
        type: HealthAlertType.sleepDebt,
        severity: AlertSeverity.high,
        title: 'Significant Sleep Debt',
        message: 'You\'ve accumulated ${totalDebt.toStringAsFixed(1)} hours of sleep debt. '
            'This is affecting your recovery and performance.',
        actionableSteps: [
          'Aim for 8+ hours tonight',
          'Avoid caffeine after 2pm',
          'Create a consistent bedtime routine',
          'Reduce screen time before bed',
        ],
        confidence: 85,
        generatedAt: DateTime.now(),
        relatedMetric: 'Sleep',
        metricChange: -deficitPerNight,
        requiresAttention: true,
      );
    } else if (totalDebt >= 5) {
      return HealthAlert(
        type: HealthAlertType.sleepDebt,
        severity: AlertSeverity.medium,
        title: 'Accumulating Sleep Debt',
        message: 'You have ${totalDebt.toStringAsFixed(1)} hours of sleep debt.',
        actionableSteps: [
          'Add 30-60 min to sleep tonight',
          'Keep a consistent sleep schedule',
        ],
        confidence: 80,
        generatedAt: DateTime.now(),
        relatedMetric: 'Sleep',
        metricChange: -deficitPerNight,
      );
    }

    return null;
  }

  HealthAlert? _analyzeStrainRecoveryPattern(List<DailyMetrics> history) {
    final data = history
        .where((m) => m.strainScore != null && m.recoveryScore != null)
        .toList();

    if (data.length < 5) return null;

    // Calculate strain to recovery ratio
    final avgStrain = data.map((m) => m.strainScore!).reduce((a, b) => a + b) /
        data.length;
    final avgRecovery = data.map((m) => m.recoveryScore!).reduce((a, b) => a + b) /
        data.length;

    // Normalize strain to 0-100 scale (from 0-21)
    final normalizedStrain = (avgStrain / 21) * 100;
    final balance = avgRecovery / normalizedStrain;

    if (balance < 0.7) {
      return HealthAlert(
        type: HealthAlertType.overtraining,
        severity: AlertSeverity.high,
        title: 'Training Overload',
        message: 'Your strain is consistently exceeding your recovery capacity. '
            'Consider reducing training load.',
        actionableSteps: [
          'Take a recovery day',
          'Reduce training intensity this week',
          'Focus on sleep and nutrition',
          'Consider a deload week',
        ],
        confidence: 75,
        generatedAt: DateTime.now(),
        relatedMetric: 'Strain/Recovery',
        requiresAttention: true,
      );
    } else if (balance < 0.85) {
      return HealthAlert(
        type: HealthAlertType.overtraining,
        severity: AlertSeverity.medium,
        title: 'Watch Your Training Load',
        message: 'Your recovery is falling behind your training strain.',
        actionableSteps: [
          'Consider a lighter training day',
          'Prioritize recovery protocols',
        ],
        confidence: 70,
        generatedAt: DateTime.now(),
        relatedMetric: 'Strain/Recovery',
      );
    }

    return null;
  }

  // Enum mapping helpers

  TrendDirection _parseTrendDirection(String actionability) {
    switch (actionability.toLowerCase()) {
      case 'high':
        return TrendDirection.rapidlyDeclining;
      case 'medium':
        return TrendDirection.declining;
      case 'low':
        return TrendDirection.stable;
      default:
        return TrendDirection.stable;
    }
  }

  CorrelationType _parseCorrelationType(String relationship) {
    switch (relationship.toLowerCase()) {
      case 'positive':
        return CorrelationType.positive;
      case 'negative':
        return CorrelationType.negative;
      default:
        return CorrelationType.complex;
    }
  }

  NudgeType _mapInsightTypeToNudgeType(InsightType type) {
    switch (type) {
      case InsightType.trendAlert:
        return NudgeType.recovery;
      case InsightType.patternDetected:
        return NudgeType.recovery;
      case InsightType.milestone:
        return NudgeType.celebration;
      case InsightType.recommendation:
        return NudgeType.recovery;
      case InsightType.warning:
        return NudgeType.recovery;
      case InsightType.celebration:
        return NudgeType.celebration;
    }
  }

  NudgePriority _mapActionPriorityToNudgePriority(ActionPriority priority) {
    switch (priority) {
      case ActionPriority.immediate:
        return NudgePriority.urgent;
      case ActionPriority.high:
        return NudgePriority.high;
      case ActionPriority.medium:
        return NudgePriority.medium;
      case ActionPriority.low:
        return NudgePriority.low;
    }
  }
}

/// Provider for HealthPredictionService
final healthPredictionServiceProvider = Provider<HealthPredictionService>((ref) {
  final geminiService = ref.watch(geminiCoachServiceProvider);
  final talker = ref.watch(talkerProvider);
  return HealthPredictionServiceImpl(
    geminiService: geminiService,
    talker: talker,
  );
});
