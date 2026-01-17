import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/domain/entities/health_prediction.dart';
import '../../../../core/providers/health_monitor_provider.dart';
import '../../../../core/services/health_prediction_service.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../widgets/health_alert_card.dart';
import '../widgets/health_summary_card.dart';
import '../widgets/pattern_insight_card.dart';
import '../widgets/proactive_nudge_card.dart';
import '../widgets/risk_indicator.dart';

/// Health Monitor Screen
///
/// Displays AI-powered predictive health monitoring including:
/// - Overall health prediction and score
/// - Active health alerts with severity
/// - Illness risk indicator
/// - Overtraining risk indicator
/// - Sleep debt assessment
/// - Pattern insights and correlations
/// - Proactive nudges
///
/// IMPORTANT: All predictions include confidence levels and disclaimers.
/// This is for informational purposes only - NOT medical advice.
class HealthMonitorScreen extends ConsumerStatefulWidget {
  const HealthMonitorScreen({super.key});

  @override
  ConsumerState<HealthMonitorScreen> createState() => _HealthMonitorScreenState();
}

class _HealthMonitorScreenState extends ConsumerState<HealthMonitorScreen> {
  @override
  Widget build(BuildContext context) {
    final dashboardAsync = ref.watch(healthDashboardProvider);
    final monitorState = ref.watch(healthMonitorStateProvider);
    final notifier = ref.read(healthMonitorStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Monitor'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            icon: monitorState.isRefreshing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
            onPressed: monitorState.isRefreshing ? null : () => notifier.refresh(),
            tooltip: 'Refresh data',
          ),
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: _showDisclaimerDialog,
            tooltip: 'About AI predictions',
          ),
        ],
      ),
      body: dashboardAsync.when(
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: AppSpacing.md),
              Text('Analyzing your health data...'),
            ],
          ),
        ),
        error: (error, stack) => _buildErrorState(error.toString(), notifier),
        data: (dashboard) => _buildContent(dashboard, notifier),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showFeelingSickDialog(notifier),
        icon: const Icon(Icons.healing),
        label: const Text('Feeling Sick?'),
        backgroundColor: AppColors.warning,
      ),
    );
  }

  Widget _buildContent(HealthDashboardData dashboard, HealthMonitorNotifier notifier) {
    if (dashboard.error != null) {
      return _buildErrorState(dashboard.error!, notifier);
    }

    return RefreshIndicator(
      onRefresh: () => notifier.refresh(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AI Disclaimer Banner
            _buildDisclaimerBanner(),
            const SizedBox(height: AppSpacing.lg),

            // Health Summary Card
            if (dashboard.prediction != null)
              HealthSummaryCard(prediction: dashboard.prediction!),
            const SizedBox(height: AppSpacing.lg),

            // Risk Indicators Row
            if (dashboard.prediction != null) ...[
              Text('Risk Assessment', style: AppTypography.titleMedium),
              const SizedBox(height: AppSpacing.md),
              _buildRiskIndicators(dashboard.prediction!),
              const SizedBox(height: AppSpacing.lg),
            ],

            // Active Alerts
            if (dashboard.hasAlerts) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Active Alerts', style: AppTypography.titleMedium),
                  if (dashboard.hasUrgentAlerts)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xxs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.error.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                      ),
                      child: Text(
                        '${dashboard.urgentAlertCount} urgent',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.error,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              ...dashboard.alerts.map((alert) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: HealthAlertCard(
                      alert: alert,
                      onDismiss: () {}, // Would dismiss alert
                      onTakeAction: () => _showAlertDetails(alert),
                    ),
                  )),
              const SizedBox(height: AppSpacing.lg),
            ],

            // Proactive Nudges
            if (dashboard.nudges.isNotEmpty) ...[
              Text('Smart Nudges', style: AppTypography.titleMedium),
              const SizedBox(height: AppSpacing.md),
              ...dashboard.nudges.map((nudge) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: ProactiveNudgeCard(nudge: nudge),
                  )),
              const SizedBox(height: AppSpacing.lg),
            ],

            // Pattern Insights
            if (dashboard.trends != null &&
                dashboard.trends!.keyInsights.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pattern Insights', style: AppTypography.titleMedium),
                  TextButton(
                    onPressed: () => _showAllPatterns(dashboard.trends!),
                    child: const Text('See All'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              PatternInsightsCard(trends: dashboard.trends!),
              const SizedBox(height: AppSpacing.lg),
            ],

            // Sleep Debt Section
            if (dashboard.prediction != null) ...[
              _buildSleepDebtSection(dashboard.prediction!.sleepDebt),
              const SizedBox(height: AppSpacing.lg),
            ],

            // Recommendations
            if (dashboard.prediction != null &&
                dashboard.prediction!.recommendations.isNotEmpty) ...[
              Text('Recommendations', style: AppTypography.titleMedium),
              const SizedBox(height: AppSpacing.md),
              _buildRecommendations(dashboard.prediction!.recommendations),
              const SizedBox(height: AppSpacing.lg),
            ],

            // Data Quality Note
            if (dashboard.prediction != null)
              _buildDataQualityNote(dashboard.prediction!),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String error, HealthMonitorNotifier notifier) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error.withOpacity(0.5),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Failed to load health data',
              style: AppTypography.titleMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              error,
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () => notifier.refresh(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisclaimerBanner() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.info.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.info.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.auto_awesome, color: AppColors.info, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              'AI-powered predictions for informational purposes only',
              style: AppTypography.bodySmall.copyWith(color: AppColors.info),
            ),
          ),
          IconButton(
            icon: Icon(Icons.info_outline, color: AppColors.info, size: 20),
            onPressed: _showDisclaimerDialog,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskIndicators(HealthPrediction prediction) {
    return Row(
      children: [
        Expanded(
          child: RiskIndicator(
            title: 'Illness Risk',
            value: prediction.illnessRisk.probability,
            maxValue: 100,
            level: _illnessRiskLevelToString(prediction.illnessRisk.riskLevel),
            color: _getIllnessRiskColor(prediction.illnessRisk.riskLevel),
            icon: Icons.sick,
            onTap: () => _showIllnessRiskDetails(prediction.illnessRisk),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: RiskIndicator(
            title: 'Overtraining',
            value: prediction.overtrainingRisk.riskScore,
            maxValue: 100,
            level: _overtrainingLevelToString(prediction.overtrainingRisk.riskLevel),
            color: _getOvertrainingColor(prediction.overtrainingRisk.riskLevel),
            icon: Icons.fitness_center,
            onTap: () => _showOvertrainingDetails(prediction.overtrainingRisk),
          ),
        ),
      ],
    );
  }

  Widget _buildSleepDebtSection(SleepDebtAssessment sleepDebt) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.bedtime, color: Colors.indigo, size: 24),
                const SizedBox(width: AppSpacing.sm),
                Text('Sleep Debt', style: AppTypography.titleMedium),
                const Spacer(),
                _buildSleepDebtBadge(sleepDebt.level),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSleepMetric(
                  'Accumulated',
                  '${sleepDebt.accumulatedDebtHours.toStringAsFixed(1)}h',
                ),
                _buildSleepMetric(
                  'Avg Sleep',
                  '${sleepDebt.averageSleepLast7Days.toStringAsFixed(1)}h',
                ),
                _buildSleepMetric(
                  'Days to Recover',
                  '${sleepDebt.daysToRecover}',
                ),
              ],
            ),
            if (sleepDebt.impacts.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.md),
              const Divider(),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Impact',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              ...sleepDebt.impacts.map((impact) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_right,
                          size: 16,
                          color: AppColors.textHint,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Expanded(
                          child: Text(
                            impact,
                            style: AppTypography.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSleepMetric(String label, String value) {
    return Column(
      children: [
        Text(value, style: AppTypography.titleLarge),
        Text(label, style: AppTypography.labelSmall),
      ],
    );
  }

  Widget _buildSleepDebtBadge(SleepDebtLevel level) {
    Color color;
    String text;
    switch (level) {
      case SleepDebtLevel.none:
        color = AppColors.success;
        text = 'None';
        break;
      case SleepDebtLevel.mild:
        color = AppColors.recoveryGood;
        text = 'Mild';
        break;
      case SleepDebtLevel.moderate:
        color = AppColors.warning;
        text = 'Moderate';
        break;
      case SleepDebtLevel.severe:
        color = AppColors.accent;
        text = 'Severe';
        break;
      case SleepDebtLevel.critical:
        color = AppColors.error;
        text = 'Critical';
        break;
      case SleepDebtLevel.unknown:
        color = AppColors.textHint;
        text = 'Unknown';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Text(
        text,
        style: AppTypography.labelSmall.copyWith(color: color),
      ),
    );
  }

  Widget _buildRecommendations(List<HealthRecommendation> recommendations) {
    return Card(
      child: Column(
        children: recommendations.map((rec) => ListTile(
              leading: Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: _getCategoryColor(rec.category).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Icon(
                  _getCategoryIcon(rec.category),
                  color: _getCategoryColor(rec.category),
                  size: 20,
                ),
              ),
              title: Text(rec.title, style: AppTypography.titleSmall),
              subtitle: Text(
                rec.description,
                style: AppTypography.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: _buildPriorityBadge(rec.priority),
              onTap: () => _showRecommendationDetails(rec),
            )).toList(),
      ),
    );
  }

  Widget _buildPriorityBadge(ActionPriority priority) {
    Color color;
    String label;
    switch (priority) {
      case ActionPriority.immediate:
        color = AppColors.error;
        label = 'Now';
        break;
      case ActionPriority.high:
        color = AppColors.warning;
        label = 'High';
        break;
      case ActionPriority.medium:
        color = AppColors.info;
        label = 'Med';
        break;
      case ActionPriority.low:
        color = AppColors.textHint;
        label = 'Low';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(color: color),
      ),
    );
  }

  Widget _buildDataQualityNote(HealthPrediction prediction) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.analytics_outlined, size: 16, color: AppColors.textHint),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'Analysis Confidence: ${prediction.confidence}%',
                style: AppTypography.labelMedium.copyWith(color: AppColors.textHint),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            prediction.disclaimer,
            style: AppTypography.aiGenerated,
          ),
        ],
      ),
    );
  }

  // Helper methods

  String _illnessRiskLevelToString(IllnessRiskLevel level) {
    switch (level) {
      case IllnessRiskLevel.low:
        return 'Low';
      case IllnessRiskLevel.moderate:
        return 'Moderate';
      case IllnessRiskLevel.elevated:
        return 'Elevated';
      case IllnessRiskLevel.high:
        return 'High';
      case IllnessRiskLevel.unknown:
        return 'Unknown';
    }
  }

  Color _getIllnessRiskColor(IllnessRiskLevel level) {
    switch (level) {
      case IllnessRiskLevel.low:
        return AppColors.success;
      case IllnessRiskLevel.moderate:
        return AppColors.warning;
      case IllnessRiskLevel.elevated:
        return AppColors.accent;
      case IllnessRiskLevel.high:
        return AppColors.error;
      case IllnessRiskLevel.unknown:
        return AppColors.textHint;
    }
  }

  String _overtrainingLevelToString(OvertrainingLevel level) {
    switch (level) {
      case OvertrainingLevel.optimal:
        return 'Optimal';
      case OvertrainingLevel.adequate:
        return 'Adequate';
      case OvertrainingLevel.elevated:
        return 'Elevated';
      case OvertrainingLevel.high:
        return 'High';
      case OvertrainingLevel.critical:
        return 'Critical';
      case OvertrainingLevel.unknown:
        return 'Unknown';
    }
  }

  Color _getOvertrainingColor(OvertrainingLevel level) {
    switch (level) {
      case OvertrainingLevel.optimal:
        return AppColors.success;
      case OvertrainingLevel.adequate:
        return AppColors.recoveryGood;
      case OvertrainingLevel.elevated:
        return AppColors.warning;
      case OvertrainingLevel.high:
        return AppColors.accent;
      case OvertrainingLevel.critical:
        return AppColors.error;
      case OvertrainingLevel.unknown:
        return AppColors.textHint;
    }
  }

  Color _getCategoryColor(ActionCategory category) {
    switch (category) {
      case ActionCategory.sleep:
        return Colors.indigo;
      case ActionCategory.nutrition:
        return Colors.green;
      case ActionCategory.hydration:
        return Colors.blue;
      case ActionCategory.activity:
        return Colors.orange;
      case ActionCategory.stress:
        return Colors.purple;
      case ActionCategory.medical:
        return Colors.red;
    }
  }

  IconData _getCategoryIcon(ActionCategory category) {
    switch (category) {
      case ActionCategory.sleep:
        return Icons.bedtime;
      case ActionCategory.nutrition:
        return Icons.restaurant;
      case ActionCategory.hydration:
        return Icons.water_drop;
      case ActionCategory.activity:
        return Icons.fitness_center;
      case ActionCategory.stress:
        return Icons.self_improvement;
      case ActionCategory.medical:
        return Icons.medical_services;
    }
  }

  // Dialog methods

  void _showDisclaimerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About Health Monitor'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Important Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Health Monitor uses AI to analyze your biometric data and predict potential health concerns. '
                'These predictions are based on patterns in your data, similar to research showing 92% accuracy '
                'in predicting illness within 7 days using HRV and respiratory rate changes.',
              ),
              SizedBox(height: 16),
              Text(
                'This is NOT medical advice',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              SizedBox(height: 8),
              Text(
                '- All predictions are estimates with confidence levels\n'
                '- Always consult a healthcare professional for medical concerns\n'
                '- Seek immediate medical attention for emergencies\n'
                '- Data quality affects prediction accuracy',
              ),
              SizedBox(height: 16),
              Text(
                'What We Monitor:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '- HRV drops (immune response indicator)\n'
                '- RHR elevation (stress/illness marker)\n'
                '- Sleep debt accumulation\n'
                '- Strain/recovery balance\n'
                '- Behavioral patterns',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('I Understand'),
          ),
        ],
      ),
    );
  }

  void _showFeelingSickDialog(HealthMonitorNotifier notifier) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.bottomSheetRadius),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(AppSpacing.bottomSheetPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Not Feeling Well?', style: AppTypography.titleLarge),
            const SizedBox(height: AppSpacing.md),
            Text(
              'If you\'re feeling unwell, we can activate Rescue Day mode to help you recover.',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.lg),
            ListTile(
              leading: Icon(Icons.healing, color: AppColors.warning),
              title: const Text('Activate Rescue Day'),
              subtitle: const Text('Get a personalized recovery plan'),
              onTap: () {
                Navigator.pop(context);
                notifier.triggerRescueDay();
                context.go('/rescue-day');
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services, color: AppColors.error),
              title: const Text('Consult a Doctor'),
              subtitle: const Text('For serious symptoms'),
              onTap: () {
                Navigator.pop(context);
                _showDoctorRecommendation();
              },
            ),
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.info.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: 16, color: AppColors.info),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'This app cannot diagnose illness. Seek medical help for concerning symptoms.',
                      style: AppTypography.bodySmall.copyWith(color: AppColors.info),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }

  void _showDoctorRecommendation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.medical_services, color: AppColors.error),
            const SizedBox(width: AppSpacing.sm),
            const Text('Consult a Doctor'),
          ],
        ),
        content: const Text(
          'If you are experiencing serious symptoms such as:\n\n'
          '- High fever\n'
          '- Difficulty breathing\n'
          '- Chest pain\n'
          '- Severe headache\n'
          '- Persistent vomiting\n\n'
          'Please seek immediate medical attention or contact your healthcare provider.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('I Understand'),
          ),
        ],
      ),
    );
  }

  void _showAlertDetails(HealthAlert alert) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.bottomSheetRadius),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(AppSpacing.bottomSheetPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Row(
                children: [
                  _getAlertIcon(alert.type, alert.severity),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(alert.title, style: AppTypography.titleLarge),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Text(alert.message, style: AppTypography.bodyLarge),
              if (alert.relatedMetric != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Related: ${alert.relatedMetric} (${alert.metricChange?.toStringAsFixed(1)}% change)',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              Text('What You Can Do:', style: AppTypography.titleMedium),
              const SizedBox(height: AppSpacing.sm),
              ...alert.actionableSteps.map((step) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 20,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(step, style: AppTypography.bodyMedium),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Confidence: ${alert.confidence}%',
                style: AppTypography.aiGenerated,
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAlertIcon(HealthAlertType type, AlertSeverity severity) {
    IconData icon;
    switch (type) {
      case HealthAlertType.illness:
        icon = Icons.sick;
        break;
      case HealthAlertType.overtraining:
        icon = Icons.fitness_center;
        break;
      case HealthAlertType.sleepDebt:
        icon = Icons.bedtime;
        break;
      case HealthAlertType.stress:
        icon = Icons.psychology;
        break;
      case HealthAlertType.hrvDrop:
        icon = Icons.favorite;
        break;
      case HealthAlertType.rhrElevated:
        icon = Icons.monitor_heart;
        break;
      case HealthAlertType.patternAnomaly:
        icon = Icons.analytics;
        break;
      case HealthAlertType.general:
        icon = Icons.info;
        break;
    }

    Color color;
    switch (severity) {
      case AlertSeverity.low:
        color = AppColors.info;
        break;
      case AlertSeverity.medium:
        color = AppColors.warning;
        break;
      case AlertSeverity.high:
        color = AppColors.accent;
        break;
      case AlertSeverity.critical:
        color = AppColors.error;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Icon(icon, color: color, size: 28),
    );
  }

  void _showIllnessRiskDetails(IllnessRisk risk) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.bottomSheetRadius),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(AppSpacing.bottomSheetPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text('Illness Risk Assessment', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(risk.explanation, style: AppTypography.bodyMedium),
              const SizedBox(height: AppSpacing.lg),
              if (risk.contributingFactors.isNotEmpty) ...[
                Text('Contributing Factors', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                ...risk.contributingFactors.map((factor) => Card(
                      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(factor.factor, style: AppTypography.titleSmall),
                                Text(
                                  '${factor.impactScore}% impact',
                                  style: AppTypography.labelSmall.copyWith(
                                    color: _getImpactColor(factor.impactScore),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              factor.observation,
                              style: AppTypography.bodySmall,
                            ),
                            Text(
                              'Normal: ${factor.normalRange}',
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textHint,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
              if (risk.shouldConsultDoctor) ...[
                const SizedBox(height: AppSpacing.lg),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    border: Border.all(color: AppColors.warning),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.medical_services, color: AppColors.warning),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Text(
                          'Consider consulting a healthcare provider.',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.warning,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }

  void _showOvertrainingDetails(OvertrainingRisk risk) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.bottomSheetRadius),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(AppSpacing.bottomSheetPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text('Overtraining Assessment', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(risk.explanation, style: AppTypography.bodyMedium),
              const SizedBox(height: AppSpacing.lg),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMetricColumn(
                        'Avg Strain',
                        risk.strainTrend.averageLast7Days.toStringAsFixed(1),
                        '/21',
                      ),
                      _buildMetricColumn(
                        'Avg Recovery',
                        '${risk.recoveryTrend.averageLast7Days.toStringAsFixed(0)}%',
                        '',
                      ),
                      _buildMetricColumn(
                        'Balance',
                        risk.strainRecoveryBalance.toStringAsFixed(2),
                        '',
                      ),
                    ],
                  ),
                ),
              ),
              if (risk.warningSignals.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.lg),
                Text('Warning Signals', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                ...risk.warningSignals.map((signal) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.warning_amber, color: AppColors.warning),
                      title: Text(signal),
                    )),
              ],
              if (risk.recommendations.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.lg),
                Text('Recommendations', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                ...risk.recommendations.map((rec) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.check_circle_outline, color: AppColors.primary),
                      title: Text(rec),
                    )),
              ],
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricColumn(String label, String value, String suffix) {
    return Column(
      children: [
        Text(label, style: AppTypography.labelSmall),
        const SizedBox(height: AppSpacing.xs),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(value, style: AppTypography.titleLarge),
            if (suffix.isNotEmpty)
              Text(suffix, style: AppTypography.bodySmall),
          ],
        ),
      ],
    );
  }

  Color _getImpactColor(int impact) {
    if (impact >= 70) return AppColors.error;
    if (impact >= 40) return AppColors.warning;
    return AppColors.textSecondary;
  }

  void _showAllPatterns(TrendAnalysis trends) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.bottomSheetRadius),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(AppSpacing.bottomSheetPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text('Pattern Analysis', style: AppTypography.titleLarge),
              Text(
                'Based on ${trends.dataQuality} quality data',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              if (trends.keyInsights.isNotEmpty) ...[
                Text('Key Insights', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                ...trends.keyInsights.map((insight) => Card(
                      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: ListTile(
                        leading: Icon(Icons.lightbulb_outline, color: AppColors.primary),
                        title: Text(insight),
                      ),
                    )),
              ],
              if (trends.correlations.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.lg),
                Text('Correlations Found', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                ...trends.correlations.map((corr) => Card(
                      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(corr.metric1, style: AppTypography.titleSmall),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                                  child: Icon(
                                    corr.type == CorrelationType.positive
                                        ? Icons.trending_up
                                        : Icons.trending_down,
                                    color: corr.type == CorrelationType.positive
                                        ? AppColors.success
                                        : AppColors.error,
                                    size: 20,
                                  ),
                                ),
                                Text(corr.metric2, style: AppTypography.titleSmall),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              corr.explanation,
                              style: AppTypography.bodySmall,
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              'Strength: ${(corr.strength * 100).toStringAsFixed(0)}% | Confidence: ${corr.confidence}%',
                              style: AppTypography.aiGenerated,
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
              if (trends.celebrations.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.lg),
                Text('Wins to Celebrate', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                ...trends.celebrations.map((win) => Card(
                      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                      color: AppColors.success.withOpacity(0.1),
                      child: ListTile(
                        leading: Icon(Icons.celebration, color: AppColors.success),
                        title: Text(win),
                      ),
                    )),
              ],
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }

  void _showRecommendationDetails(HealthRecommendation rec) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.bottomSheetRadius),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(AppSpacing.bottomSheetPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: _getCategoryColor(rec.category).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Icon(
                    _getCategoryIcon(rec.category),
                    color: _getCategoryColor(rec.category),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(rec.title, style: AppTypography.titleLarge),
                ),
                _buildPriorityBadge(rec.priority),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(rec.description, style: AppTypography.bodyLarge),
            const SizedBox(height: AppSpacing.md),
            Text('Why this matters:', style: AppTypography.titleSmall),
            const SizedBox(height: AppSpacing.sm),
            Text(rec.rationale, style: AppTypography.bodyMedium),
            if (rec.duration != null) ...[
              const SizedBox(height: AppSpacing.md),
              Text(
                'Duration: ${rec.duration}',
                style: AppTypography.bodySmall.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}
