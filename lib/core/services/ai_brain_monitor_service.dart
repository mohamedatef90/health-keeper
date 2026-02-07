import 'package:talker/talker.dart';
import 'package:uuid/uuid.dart';

import '../domain/entities/ai_brain_context.dart';
import '../domain/entities/health_anomaly.dart';

/// Service for proactive health monitoring and anomaly detection
///
/// Monitors health data for concerning patterns and generates alerts
/// when anomalies are detected. This runs during autonomous cycles
/// and on app launch/resume.
class AiBrainMonitorService {
  final Talker _talker;
  static const _uuid = Uuid();

  AiBrainMonitorService({required Talker talker}) : _talker = talker;

  /// Detect health anomalies from the current context
  ///
  /// Analyzes:
  /// - HRV drops from baseline (>25%)
  /// - RHR elevation (>10 bpm)
  /// - Sleep debt accumulation (>5 hours)
  /// - Strain/recovery imbalance
  /// - Prolonged low recovery (2+ days)
  Future<List<HealthAnomaly>> detectAnomalies(AiBrainContext context) async {
    final anomalies = <HealthAnomaly>[];

    try {
      final health = context.healthContext;
      final trends = context.trendsContext;

      if (health == null) {
        _talker.debug('No health context available for anomaly detection');
        return anomalies;
      }

      // Check HRV drop
      final hrvAnomaly = _checkHrvDrop(health, trends);
      if (hrvAnomaly != null) anomalies.add(hrvAnomaly);

      // Check RHR elevation
      final rhrAnomaly = _checkRhrElevation(health, trends);
      if (rhrAnomaly != null) anomalies.add(rhrAnomaly);

      // Check sleep debt
      final sleepAnomaly = _checkSleepDebt(health, trends);
      if (sleepAnomaly != null) anomalies.add(sleepAnomaly);

      // Check strain/recovery imbalance
      final strainAnomaly = _checkStrainRecoveryImbalance(health, trends);
      if (strainAnomaly != null) anomalies.add(strainAnomaly);

      // Check prolonged low recovery
      final lowRecoveryAnomaly = _checkProlongedLowRecovery(health, trends);
      if (lowRecoveryAnomaly != null) anomalies.add(lowRecoveryAnomaly);

      // Check for combined warning signs
      if (anomalies.length >= 2) {
        final combinedAnomaly = _createCombinedWarning(anomalies);
        anomalies.insert(0, combinedAnomaly); // Add at the top
      }

      _talker.info('Detected ${anomalies.length} health anomalies');
    } catch (e, st) {
      _talker.error('Error detecting anomalies: $e', e, st);
    }

    return anomalies;
  }

  /// Check for HRV drop from baseline
  HealthAnomaly? _checkHrvDrop(
    AiBrainHealthContext health,
    AiBrainTrendsContext? trends,
  ) {
    final hrv = health.hrv;
    final baseline = health.hrvBaseline;

    if (hrv == null || baseline == null || baseline == 0) return null;

    final dropPercent = (baseline - hrv) / baseline;

    if (dropPercent < AnomalyThresholds.hrvDropThreshold) return null;

    final severity = dropPercent >= 0.40
        ? AnomalySeverity.high
        : dropPercent >= 0.30
            ? AnomalySeverity.moderate
            : AnomalySeverity.low;

    return HealthAnomaly(
      id: _uuid.v4(),
      type: AnomalyType.hrvDrop,
      severity: severity,
      title: 'HRV Below Normal',
      titleAr: 'تقلب نبضات القلب منخفض',
      description:
          'Your HRV is ${(dropPercent * 100).toStringAsFixed(0)}% below your baseline. This may indicate stress or fatigue.',
      descriptionAr:
          'تقلب نبضات قلبك أقل بـ ${(dropPercent * 100).toStringAsFixed(0)}% من المعدل الطبيعي. قد يشير هذا إلى إجهاد أو تعب.',
      metric: 'HRV',
      currentValue: hrv.toDouble(),
      expectedValue: baseline.toDouble(),
      deviation: dropPercent * 100,
      unit: 'ms',
      recommendedActions: [
        AnomalyAction(
          action: 'Prioritize sleep tonight',
          actionAr: 'اهتم بالنوم الليلة',
          rationale: 'Sleep helps restore HRV',
          rationaleAr: 'النوم يساعد على استعادة تقلب نبضات القلب',
          priority: 'high',
          category: 'sleep',
        ),
        AnomalyAction(
          action: 'Reduce stress',
          actionAr: 'قلل من التوتر',
          rationale: 'Stress suppresses HRV',
          rationaleAr: 'التوتر يقلل من تقلب نبضات القلب',
          priority: 'medium',
          category: 'stress',
        ),
        AnomalyAction(
          action: 'Consider a lighter workout',
          actionAr: 'فكر في تمرين أخف',
          rationale: 'Allow body to recover',
          rationaleAr: 'اسمح لجسمك بالتعافي',
          priority: 'medium',
          category: 'activity',
        ),
      ],
      confidence: _calculateConfidence(true, true, trends?.hrvValues.isNotEmpty ?? false),
      detectedAt: DateTime.now(),
    );
  }

  /// Check for RHR elevation
  HealthAnomaly? _checkRhrElevation(
    AiBrainHealthContext health,
    AiBrainTrendsContext? trends,
  ) {
    final rhr = health.restingHR;
    final baseline = health.rhrBaseline;

    if (rhr == null || baseline == null) return null;

    final elevation = rhr - baseline;

    if (elevation < AnomalyThresholds.rhrElevationThreshold) return null;

    final severity = elevation >= 20
        ? AnomalySeverity.high
        : elevation >= 15
            ? AnomalySeverity.moderate
            : AnomalySeverity.low;

    return HealthAnomaly(
      id: _uuid.v4(),
      type: AnomalyType.rhrElevation,
      severity: severity,
      title: 'Elevated Resting Heart Rate',
      titleAr: 'ارتفاع معدل نبضات القلب في الراحة',
      description:
          'Your resting heart rate is ${elevation.toStringAsFixed(0)} bpm above normal. Your body may be under stress.',
      descriptionAr:
          'معدل نبضات قلبك في الراحة أعلى بـ ${elevation.toStringAsFixed(0)} نبضة من المعتاد. قد يكون جسمك تحت ضغط.',
      metric: 'Resting Heart Rate',
      currentValue: rhr.toDouble(),
      expectedValue: baseline.toDouble(),
      deviation: elevation.toDouble(),
      unit: 'bpm',
      recommendedActions: [
        AnomalyAction(
          action: 'Stay hydrated',
          actionAr: 'ابق رطباً',
          rationale: 'Dehydration elevates RHR',
          rationaleAr: 'الجفاف يرفع معدل نبضات القلب',
          priority: 'high',
          category: 'hydration',
        ),
        AnomalyAction(
          action: 'Get extra rest',
          actionAr: 'احصل على راحة إضافية',
          rationale: 'Your body needs recovery',
          rationaleAr: 'جسمك يحتاج للتعافي',
          priority: 'high',
          category: 'sleep',
        ),
      ],
      confidence: _calculateConfidence(true, true, trends?.rhrValues.isNotEmpty ?? false),
      detectedAt: DateTime.now(),
    );
  }

  /// Check for sleep debt accumulation
  HealthAnomaly? _checkSleepDebt(
    AiBrainHealthContext health,
    AiBrainTrendsContext? trends,
  ) {
    if (trends == null || trends.sleepDurations.isEmpty) return null;

    // Calculate sleep debt (assuming 7.5 hour target)
    const targetSleep = 7.5;
    double sleepDebt = 0;

    for (final sleep in trends.sleepDurations) {
      if (sleep < targetSleep) {
        sleepDebt += targetSleep - sleep;
      }
    }

    if (sleepDebt < AnomalyThresholds.sleepDebtThreshold) return null;

    final severity = sleepDebt >= 10
        ? AnomalySeverity.high
        : sleepDebt >= 7
            ? AnomalySeverity.moderate
            : AnomalySeverity.low;

    return HealthAnomaly(
      id: _uuid.v4(),
      type: AnomalyType.sleepDebt,
      severity: severity,
      title: 'Accumulated Sleep Debt',
      titleAr: 'دين النوم المتراكم',
      description:
          'You have ${sleepDebt.toStringAsFixed(1)} hours of sleep debt this week. This affects recovery and performance.',
      descriptionAr:
          'لديك ${sleepDebt.toStringAsFixed(1)} ساعة من دين النوم هذا الأسبوع. هذا يؤثر على التعافي والأداء.',
      metric: 'Sleep Debt',
      currentValue: sleepDebt,
      expectedValue: 0,
      deviation: sleepDebt,
      unit: 'hours',
      daysActive: trends.sleepDurations.length,
      recommendedActions: [
        AnomalyAction(
          action: 'Go to bed 30 minutes earlier',
          actionAr: 'اذهب للنوم قبل 30 دقيقة',
          rationale: 'Gradually pay back sleep debt',
          rationaleAr: 'سداد دين النوم تدريجياً',
          priority: 'high',
          category: 'sleep',
        ),
        AnomalyAction(
          action: 'Avoid caffeine after 2pm',
          actionAr: 'تجنب الكافيين بعد الساعة 2 ظهراً',
          rationale: 'Improve sleep quality',
          rationaleAr: 'تحسين جودة النوم',
          priority: 'medium',
          category: 'nutrition',
        ),
      ],
      confidence: 75 + (trends.sleepDurations.length * 3).clamp(0, 20),
      detectedAt: DateTime.now(),
    );
  }

  /// Check for strain/recovery imbalance
  HealthAnomaly? _checkStrainRecoveryImbalance(
    AiBrainHealthContext health,
    AiBrainTrendsContext? trends,
  ) {
    if (trends == null ||
        trends.strainScores.isEmpty ||
        trends.recoveryScores.isEmpty) {
      return null;
    }

    // Calculate averages
    final avgStrain = trends.avgStrain ?? 0;
    final avgRecovery = trends.avgRecovery ?? 50;

    // Check imbalance (high strain with low recovery)
    // Strain is 0-21, Recovery is 0-100
    // Normalize strain to 0-100 scale for comparison
    final normalizedStrain = (avgStrain / 21) * 100;

    // If strain is significantly higher than recovery, we have imbalance
    if (normalizedStrain <= avgRecovery * AnomalyThresholds.strainRecoveryImbalance) {
      return null;
    }

    final imbalanceRatio = normalizedStrain / (avgRecovery > 0 ? avgRecovery : 1);

    final severity = imbalanceRatio >= 2.0
        ? AnomalySeverity.high
        : imbalanceRatio >= 1.7
            ? AnomalySeverity.moderate
            : AnomalySeverity.low;

    return HealthAnomaly(
      id: _uuid.v4(),
      type: AnomalyType.strainRecoveryImbalance,
      severity: severity,
      title: 'Training Load Imbalance',
      titleAr: 'اختلال توازن حمل التدريب',
      description:
          'Your strain level is high relative to your recovery. Consider reducing training intensity.',
      descriptionAr:
          'مستوى الإجهاد مرتفع مقارنة بتعافيك. فكر في تقليل شدة التمرين.',
      metric: 'Strain/Recovery Ratio',
      currentValue: imbalanceRatio,
      expectedValue: 1.0,
      deviation: (imbalanceRatio - 1) * 100,
      recommendedActions: [
        AnomalyAction(
          action: 'Take a recovery day',
          actionAr: 'خذ يوم راحة',
          rationale: 'Allow body to catch up',
          rationaleAr: 'اسمح لجسمك باللحاق',
          priority: 'high',
          category: 'activity',
        ),
        AnomalyAction(
          action: 'Reduce workout intensity',
          actionAr: 'قلل شدة التمرين',
          rationale: 'Lower strain to match recovery',
          rationaleAr: 'خفض الإجهاد ليتناسب مع التعافي',
          priority: 'high',
          category: 'activity',
        ),
      ],
      confidence: _calculateConfidence(
        true,
        true,
        trends.strainScores.length >= 3 && trends.recoveryScores.length >= 3,
      ),
      detectedAt: DateTime.now(),
    );
  }

  /// Check for prolonged low recovery
  HealthAnomaly? _checkProlongedLowRecovery(
    AiBrainHealthContext health,
    AiBrainTrendsContext? trends,
  ) {
    if (trends == null || trends.recoveryScores.isEmpty) return null;

    // Count consecutive days of low recovery
    int consecutiveLowDays = 0;
    for (final recovery in trends.recoveryScores.reversed) {
      if (recovery < AnomalyThresholds.lowRecoveryThreshold) {
        consecutiveLowDays++;
      } else {
        break;
      }
    }

    if (consecutiveLowDays < AnomalyThresholds.lowRecoveryDays) return null;

    final severity = consecutiveLowDays >= 4
        ? AnomalySeverity.high
        : consecutiveLowDays >= 3
            ? AnomalySeverity.moderate
            : AnomalySeverity.low;

    return HealthAnomaly(
      id: _uuid.v4(),
      type: AnomalyType.prolongedLowRecovery,
      severity: severity,
      title: 'Extended Low Recovery',
      titleAr: 'تعافي منخفض ممتد',
      description:
          'Your recovery has been below ${AnomalyThresholds.lowRecoveryThreshold}% for $consecutiveLowDays consecutive days.',
      descriptionAr:
          'تعافيك أقل من ${AnomalyThresholds.lowRecoveryThreshold}% منذ $consecutiveLowDays أيام متتالية.',
      metric: 'Recovery Score',
      currentValue: health.recoveryScore.toDouble(),
      expectedValue: 60,
      deviation: (60 - health.recoveryScore).toDouble(),
      unit: '%',
      daysActive: consecutiveLowDays,
      recommendedActions: [
        AnomalyAction(
          action: 'Schedule a rest day',
          actionAr: 'جدول يوم راحة',
          rationale: 'Your body needs extended recovery',
          rationaleAr: 'جسمك يحتاج تعافي ممتد',
          priority: 'immediate',
          category: 'activity',
        ),
        AnomalyAction(
          action: 'Review recent training load',
          actionAr: 'راجع حمل التدريب الأخير',
          rationale: 'Identify cause of low recovery',
          rationaleAr: 'حدد سبب انخفاض التعافي',
          priority: 'high',
          category: 'activity',
        ),
        AnomalyAction(
          action: 'Prioritize sleep',
          actionAr: 'أعط الأولوية للنوم',
          rationale: 'Sleep is key to recovery',
          rationaleAr: 'النوم مفتاح التعافي',
          priority: 'high',
          category: 'sleep',
        ),
      ],
      confidence: 80 + (consecutiveLowDays * 5).clamp(0, 15),
      detectedAt: DateTime.now(),
    );
  }

  /// Create a combined warning when multiple anomalies are present
  HealthAnomaly _createCombinedWarning(List<HealthAnomaly> anomalies) {
    final highPriorityCount =
        anomalies.where((a) => a.severity.index >= AnomalySeverity.moderate.index).length;

    final severity = highPriorityCount >= 2
        ? AnomalySeverity.critical
        : AnomalySeverity.high;

    final affectedMetrics = anomalies.map((a) => a.metric).toSet().toList();

    return HealthAnomaly(
      id: _uuid.v4(),
      type: AnomalyType.combinedWarning,
      severity: severity,
      title: 'Multiple Health Concerns',
      titleAr: 'عدة مخاوف صحية',
      description:
          'Multiple health indicators are showing concerning patterns. Consider taking action.',
      descriptionAr:
          'عدة مؤشرات صحية تظهر أنماطاً مقلقة. فكر في اتخاذ إجراء.',
      metric: 'Combined',
      currentValue: anomalies.length.toDouble(),
      expectedValue: 0,
      deviation: anomalies.length.toDouble(),
      relatedMetrics: affectedMetrics,
      recommendedActions: [
        AnomalyAction(
          action: 'Take a full rest day today',
          actionAr: 'خذ يوم راحة كامل اليوم',
          rationale: 'Multiple warning signs indicate need for recovery',
          rationaleAr: 'عدة علامات تحذيرية تشير إلى الحاجة للتعافي',
          priority: 'immediate',
          category: 'activity',
        ),
        AnomalyAction(
          action: 'Prioritize sleep and hydration',
          actionAr: 'أعط الأولوية للنوم والترطيب',
          rationale: 'Foundation of recovery',
          rationaleAr: 'أساس التعافي',
          priority: 'high',
          category: 'sleep',
        ),
        if (highPriorityCount >= 2)
          AnomalyAction(
            action: 'Monitor for illness symptoms',
            actionAr: 'راقب أعراض المرض',
            rationale: 'Multiple indicators may suggest onset of illness',
            rationaleAr: 'عدة مؤشرات قد تشير إلى بداية مرض',
            priority: 'high',
            category: 'medical',
          ),
      ],
      confidence: 90,
      detectedAt: DateTime.now(),
    );
  }

  /// Calculate confidence based on data availability
  int _calculateConfidence(bool hasCurrentData, bool hasBaseline, bool hasTrend) {
    int confidence = 50;
    if (hasCurrentData) confidence += 20;
    if (hasBaseline) confidence += 15;
    if (hasTrend) confidence += 15;
    return confidence.clamp(0, 100);
  }

  /// Generate notification content for an anomaly
  AnomalyNotificationContent getNotificationContent(
    HealthAnomaly anomaly,
    String language,
  ) {
    final title = anomaly.getTitle(language);
    final body = anomaly.getDescription(language);

    String priority;
    switch (anomaly.severity) {
      case AnomalySeverity.critical:
        priority = 'critical';
        break;
      case AnomalySeverity.high:
        priority = 'high';
        break;
      case AnomalySeverity.moderate:
        priority = 'medium';
        break;
      default:
        priority = 'low';
    }

    return AnomalyNotificationContent(
      title: title,
      body: body,
      priority: priority,
      anomalyId: anomaly.id,
    );
  }
}

/// Content for anomaly notifications
class AnomalyNotificationContent {
  final String title;
  final String body;
  final String priority;
  final String anomalyId;

  AnomalyNotificationContent({
    required this.title,
    required this.body,
    required this.priority,
    required this.anomalyId,
  });
}
