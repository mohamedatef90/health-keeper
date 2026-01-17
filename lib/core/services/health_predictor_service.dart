import '../domain/entities/daily_log.dart';
import '../domain/entities/health_prediction.dart';

/// AI-powered health prediction service for analyzing health trends and predicting risks
///
/// This service uses Gemini AI to analyze biometric data, behavior patterns,
/// and health trends to provide personalized health predictions and recommendations.
///
/// IMPORTANT DISCLAIMERS:
/// - This service is for informational purposes only
/// - It does not provide medical diagnoses
/// - Users should always consult healthcare providers for concerning symptoms
/// - All predictions include confidence levels
abstract class HealthPredictorService {
  /// Analyzes overall health trends and generates a comprehensive health prediction
  ///
  /// Takes a [HealthContext] containing:
  /// - HRV trends (current, baseline, 7-day history)
  /// - Heart rate data (RHR, trends)
  /// - Sleep data (duration, quality, trends)
  /// - Respiratory rate and SpO2
  /// - Strain and recovery scores
  /// - Current symptoms and behaviors
  ///
  /// Returns a [HealthPrediction] with:
  /// - Overall health status and score
  /// - Risk factors identified
  /// - Personalized recommendations
  /// - Confidence level for the prediction
  Future<HealthPrediction> analyzeHealthTrends(HealthContext context);

  /// Predicts illness risk based on biometric patterns
  ///
  /// Analyzes patterns that typically precede illness:
  /// - HRV drops (especially morning HRV)
  /// - Elevated resting heart rate
  /// - Sleep disruption patterns
  /// - Respiratory rate changes
  /// - SpO2 fluctuations
  /// - User-reported symptoms
  ///
  /// Uses [DailyLog] history (minimum 7 days recommended, 14 days optimal)
  ///
  /// Returns [IllnessRisk] with:
  /// - Probability percentage (0-100%)
  /// - Contributing factors with impact scores
  /// - Preventive actions ordered by priority
  /// - Whether to recommend consulting a doctor
  Future<IllnessRisk> predictIllnessRisk(List<DailyLog> history);

  /// Assesses overtraining risk based on strain and recovery balance
  ///
  /// Analyzes:
  /// - Recent strain scores vs recovery scores
  /// - Cumulative training load
  /// - HRV and RHR trends
  /// - Sleep quality patterns
  /// - Performance indicators
  ///
  /// Returns [OvertrainingRisk] with:
  /// - Risk level (optimal to critical)
  /// - Strain and recovery trends
  /// - Warning signals
  /// - Estimated days to full recovery
  Future<OvertrainingRisk> assessOvertrainingRisk(
    StrainRecoveryHistory history,
  );

  /// Analyzes the impact of tracked behaviors on recovery
  ///
  /// Correlates journal behaviors with recovery outcomes to identify:
  /// - Which behaviors are associated with better recovery
  /// - Which behaviors may be hindering recovery
  /// - Personalized insights based on the user's specific patterns
  ///
  /// Requires at least 14 days of data for meaningful correlations
  ///
  /// Returns list of [BehaviorCorrelation] sorted by impact strength
  Future<List<BehaviorCorrelation>> analyzeBehaviorImpact(
    JournalHistory history,
  );

  /// Generates proactive health insights without user prompting
  ///
  /// Scans for:
  /// - Emerging trends (positive or negative)
  /// - Pattern anomalies
  /// - Milestone achievements
  /// - Optimization opportunities
  ///
  /// Returns list of [ProactiveInsight] prioritized by urgency and relevance
  Future<List<ProactiveInsight>> getProactiveInsights(HealthContext context);

  /// Answers health-related questions using the user's context
  ///
  /// Provides conversational health Q&A with:
  /// - Context-aware responses based on user's data
  /// - Appropriate disclaimers
  /// - Suggestions to consult professionals when needed
  ///
  /// IMPORTANT: Will never diagnose conditions or prescribe treatments
  Future<HealthQAResponse> answerHealthQuestion(
    String question,
    HealthContext context,
  );

  /// Analyzes recovery factors to identify what helps/hurts this specific user
  ///
  /// Uses correlation analysis on journal data to provide:
  /// - Top 5 helpful behaviors for recovery
  /// - Top 5 harmful behaviors for recovery
  /// - Personalized advice based on patterns
  Future<RecoveryFactorsAnalysis> analyzeRecoveryFactors(
    JournalHistory history,
  );

  /// Assesses sleep debt and its impact on health
  ///
  /// Calculates:
  /// - Accumulated sleep debt
  /// - Impact on various health metrics
  /// - Recovery timeline
  Future<SleepDebtAssessment> assessSleepDebt(
    List<double> sleepHoursLast14Days,
    double targetSleepHours,
  );
}

/// Extended health data for more comprehensive analysis
class ExtendedHealthData {
  final HealthContext context;
  final StrainRecoveryHistory strainRecoveryHistory;
  final JournalHistory journalHistory;
  final List<DailyLog> dailyLogs;

  const ExtendedHealthData({
    required this.context,
    required this.strainRecoveryHistory,
    required this.journalHistory,
    required this.dailyLogs,
  });
}

/// Configuration for health predictions
class HealthPredictorConfig {
  /// Minimum days of data required for reliable predictions
  final int minimumDataDays;

  /// Optimal days of data for best predictions
  final int optimalDataDays;

  /// Confidence threshold for showing predictions (0-100)
  final int confidenceThreshold;

  /// Whether to include experimental predictions
  final bool includeExperimental;

  /// Language for responses
  final String language;

  const HealthPredictorConfig({
    this.minimumDataDays = 7,
    this.optimalDataDays = 30,
    this.confidenceThreshold = 60,
    this.includeExperimental = false,
    this.language = 'en',
  });

  factory HealthPredictorConfig.arabic() => const HealthPredictorConfig(
        language: 'ar',
      );
}
