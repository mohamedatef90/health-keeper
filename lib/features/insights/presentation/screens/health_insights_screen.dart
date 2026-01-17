import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/domain/entities/health_prediction.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../widgets/behavior_correlation_card.dart';
import '../widgets/health_score_ring.dart';
import '../widgets/illness_risk_card.dart';
import '../widgets/overtraining_risk_card.dart';
import '../widgets/proactive_insight_card.dart';
import '../widgets/sleep_debt_card.dart';

/// Health Insights Screen
///
/// Displays AI-powered health predictions including:
/// - Overall health prediction and score
/// - Illness risk indicator
/// - Overtraining risk indicator
/// - Sleep debt assessment
/// - Top behavior correlations
/// - Proactive insights
///
/// IMPORTANT: All predictions include confidence levels and disclaimers.
/// This is for informational purposes only - not medical advice.
class HealthInsightsScreen extends ConsumerStatefulWidget {
  const HealthInsightsScreen({super.key});

  @override
  ConsumerState<HealthInsightsScreen> createState() => _HealthInsightsScreenState();
}

class _HealthInsightsScreenState extends ConsumerState<HealthInsightsScreen> {
  bool _isLoading = true;
  String? _error;

  // Demo data - in production, this would come from providers
  late HealthPrediction _healthPrediction;
  late List<BehaviorCorrelation> _topBehaviors;
  late List<ProactiveInsight> _proactiveInsights;

  @override
  void initState() {
    super.initState();
    _loadHealthInsights();
  }

  Future<void> _loadHealthInsights() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // TODO: Replace with actual provider calls
      await Future.delayed(const Duration(milliseconds: 500));

      // Demo data for UI development
      _healthPrediction = _createDemoHealthPrediction();
      _topBehaviors = _createDemoBehaviorCorrelations();
      _proactiveInsights = _createDemoProactiveInsights();

      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Failed to load health insights. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Insights'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadHealthInsights,
            tooltip: 'Refresh insights',
          ),
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: _showDisclaimerDialog,
            tooltip: 'About AI predictions',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: AppSpacing.md),
            Text('Analyzing your health data...'),
          ],
        ),
      );
    }

    if (_error != null) {
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
                _error!,
                textAlign: TextAlign.center,
                style: AppTypography.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.lg),
              ElevatedButton(
                onPressed: _loadHealthInsights,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadHealthInsights,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AI Disclaimer Banner
            _buildDisclaimerBanner(),
            const SizedBox(height: AppSpacing.lg),

            // Overall Health Score
            _buildOverallHealthSection(),
            const SizedBox(height: AppSpacing.lg),

            // Risk Indicators Section
            Text('Risk Assessment', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            _buildRiskIndicators(),
            const SizedBox(height: AppSpacing.lg),

            // Sleep Debt Section
            SleepDebtCard(sleepDebt: _healthPrediction.sleepDebt),
            const SizedBox(height: AppSpacing.lg),

            // Proactive Insights
            if (_proactiveInsights.isNotEmpty) ...[
              Text('AI Insights', style: AppTypography.titleMedium),
              const SizedBox(height: AppSpacing.md),
              ..._proactiveInsights.map((insight) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: ProactiveInsightCard(insight: insight),
                  )),
              const SizedBox(height: AppSpacing.lg),
            ],

            // Behavior Correlations
            if (_topBehaviors.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('What Affects Your Recovery', style: AppTypography.titleMedium),
                  TextButton(
                    onPressed: _showBehaviorDetails,
                    child: const Text('See All'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              ..._topBehaviors.take(5).map((behavior) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: BehaviorCorrelationCard(correlation: behavior),
                  )),
              const SizedBox(height: AppSpacing.lg),
            ],

            // Recommendations Section
            if (_healthPrediction.recommendations.isNotEmpty) ...[
              Text('Recommendations', style: AppTypography.titleMedium),
              const SizedBox(height: AppSpacing.md),
              _buildRecommendations(),
              const SizedBox(height: AppSpacing.lg),
            ],

            // Confidence and data quality note
            _buildDataQualityNote(),
            const SizedBox(height: AppSpacing.xxl),
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
              'AI-powered insights for informational purposes only',
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

  Widget _buildOverallHealthSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HealthScoreRing(
                  score: _healthPrediction.overallScore,
                  status: _healthPrediction.overallStatus,
                  size: 120,
                ),
                const SizedBox(width: AppSpacing.lg),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getStatusTitle(_healthPrediction.overallStatus),
                        style: AppTypography.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        _healthPrediction.summary,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _buildConfidenceIndicator(_healthPrediction.confidence),
                    ],
                  ),
                ),
              ],
            ),
            if (_healthPrediction.positiveIndicators.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.md),
              const Divider(),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: _healthPrediction.positiveIndicators
                    .map((indicator) => Chip(
                          label: Text(indicator),
                          backgroundColor: AppColors.success.withOpacity(0.1),
                          labelStyle: AppTypography.labelSmall.copyWith(
                            color: AppColors.success,
                          ),
                          side: BorderSide.none,
                          padding: EdgeInsets.zero,
                        ))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRiskIndicators() {
    return Row(
      children: [
        Expanded(
          child: IllnessRiskCard(
            illnessRisk: _healthPrediction.illnessRisk,
            onTap: () => _showIllnessRiskDetails(),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: OvertrainingRiskCard(
            overtrainingRisk: _healthPrediction.overtrainingRisk,
            onTap: () => _showOvertrainingRiskDetails(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendations() {
    return Card(
      child: Column(
        children: _healthPrediction.recommendations
            .map((rec) => ListTile(
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
                ))
            .toList(),
      ),
    );
  }

  Widget _buildConfidenceIndicator(int confidence) {
    Color color;
    String label;
    if (confidence >= 80) {
      color = AppColors.success;
      label = 'High confidence';
    } else if (confidence >= 60) {
      color = AppColors.warning;
      label = 'Moderate confidence';
    } else {
      color = AppColors.textHint;
      label = 'Low confidence';
    }

    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(
          '$label ($confidence%)',
          style: AppTypography.labelSmall.copyWith(color: color),
        ),
      ],
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

  Widget _buildDataQualityNote() {
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
                'Analysis Quality',
                style: AppTypography.labelMedium.copyWith(color: AppColors.textHint),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Based on ${_healthPrediction.confidence >= 80 ? "30+" : _healthPrediction.confidence >= 60 ? "14-30" : "less than 14"} days of data. More data improves prediction accuracy.',
            style: AppTypography.bodySmall,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            _healthPrediction.disclaimer,
            style: AppTypography.aiGenerated,
          ),
        ],
      ),
    );
  }

  String _getStatusTitle(HealthStatus status) {
    switch (status) {
      case HealthStatus.excellent:
        return 'Excellent Health';
      case HealthStatus.good:
        return 'Good Health';
      case HealthStatus.moderate:
        return 'Moderate Health';
      case HealthStatus.attentionNeeded:
        return 'Needs Attention';
      case HealthStatus.unknown:
        return 'Analyzing...';
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

  void _showDisclaimerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About AI Health Insights'),
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
                'These health insights are generated by AI for informational purposes only. They are NOT medical advice, diagnoses, or treatment recommendations.',
              ),
              SizedBox(height: 16),
              Text(
                'What This Means:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '- Predictions are based on patterns in your data\n'
                '- Confidence levels indicate prediction reliability\n'
                '- All insights should be verified with healthcare professionals\n'
                '- Seek immediate medical attention for emergencies',
              ),
              SizedBox(height: 16),
              Text(
                'When to Consult a Doctor:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '- If you experience concerning symptoms\n'
                '- Before making significant health changes\n'
                '- If illness risk is flagged as high\n'
                '- For any medical concerns or questions',
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

  void _showIllnessRiskDetails() {
    final risk = _healthPrediction.illnessRisk;
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
                ...risk.contributingFactors.map((factor) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(factor.factor),
                      subtitle: Text('${factor.observation}\nNormal: ${factor.normalRange}'),
                      trailing: Text(
                        '${factor.impactScore}%',
                        style: AppTypography.titleSmall.copyWith(
                          color: _getImpactColor(factor.impactScore),
                        ),
                      ),
                    )),
                const SizedBox(height: AppSpacing.lg),
              ],
              if (risk.preventiveActions.isNotEmpty) ...[
                Text('Preventive Actions', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                ...risk.preventiveActions.map((action) => Card(
                      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: ListTile(
                        leading: Icon(
                          _getCategoryIcon(action.category),
                          color: _getCategoryColor(action.category),
                        ),
                        title: Text(action.action),
                        subtitle: Text(action.rationale),
                        trailing: _buildPriorityBadge(action.priority),
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
                          'Consider consulting a healthcare provider about these symptoms.',
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

  void _showOvertrainingRiskDetails() {
    final risk = _healthPrediction.overtrainingRisk;
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
              Text('Overtraining Risk Assessment', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(risk.explanation, style: AppTypography.bodyMedium),
              const SizedBox(height: AppSpacing.lg),
              // Strain/Recovery Balance
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Strain/Recovery Balance', style: AppTypography.titleSmall),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              if (risk.warningSignals.isNotEmpty) ...[
                Text('Warning Signals', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                ...risk.warningSignals.map((signal) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.warning_amber, color: AppColors.warning),
                      title: Text(signal),
                    )),
                const SizedBox(height: AppSpacing.lg),
              ],
              if (risk.recommendations.isNotEmpty) ...[
                Text('Recommendations', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                ...risk.recommendations.map((rec) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.check_circle_outline, color: AppColors.primary),
                      title: Text(rec),
                    )),
              ],
              if (risk.daysToRecovery > 0) ...[
                const SizedBox(height: AppSpacing.lg),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.info.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.access_time, color: AppColors.info),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Text(
                          'Estimated ${risk.daysToRecovery} days of focused recovery recommended.',
                          style: AppTypography.bodyMedium,
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

  void _showBehaviorDetails() {
    // TODO: Navigate to full behavior analysis screen
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
            if (rec.requiresProfessional) ...[
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: AppColors.warning, size: 16),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        'Consult a healthcare professional for guidance.',
                        style: AppTypography.bodySmall.copyWith(
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
    );
  }

  // Demo data creators
  HealthPrediction _createDemoHealthPrediction() {
    return HealthPrediction(
      id: 'demo-1',
      generatedAt: DateTime.now(),
      overallStatus: HealthStatus.good,
      overallScore: 75,
      confidence: 82,
      illnessRisk: IllnessRisk(
        probability: 15,
        riskLevel: IllnessRiskLevel.low,
        confidence: 78,
        contributingFactors: [
          const ContributingFactor(
            factor: 'HRV',
            observation: '42ms (down 8% from baseline)',
            normalRange: '45-55ms',
            impactScore: 25,
            trend: FactorTrend.declining,
          ),
          const ContributingFactor(
            factor: 'Sleep Quality',
            observation: '72% average',
            normalRange: '80-90%',
            impactScore: 18,
            trend: FactorTrend.stable,
          ),
        ],
        preventiveActions: [
          const PreventiveAction(
            action: 'Prioritize 8+ hours of sleep tonight',
            rationale: 'Sleep is crucial for immune function',
            priority: ActionPriority.high,
            category: ActionCategory.sleep,
          ),
          const PreventiveAction(
            action: 'Stay well hydrated (3L water)',
            rationale: 'Hydration supports immune response',
            priority: ActionPriority.medium,
            category: ActionCategory.hydration,
          ),
        ],
        explanation: 'Your biometrics show minor stress signals but no significant illness risk. Slight HRV decline suggests your body may be under mild stress.',
        shouldConsultDoctor: false,
      ),
      overtrainingRisk: OvertrainingRisk(
        riskScore: 35,
        riskLevel: OvertrainingLevel.adequate,
        confidence: 85,
        strainTrend: const StrainTrend(
          trend: FactorTrend.stable,
          averageLast7Days: 12.5,
          averageLast30Days: 11.8,
          peakLast7Days: 16.2,
        ),
        recoveryTrend: const RecoveryTrend(
          trend: FactorTrend.stable,
          averageLast7Days: 68,
          averageLast30Days: 72,
          lowestLast7Days: 52,
        ),
        strainRecoveryBalance: 0.85,
        warningSignals: [
          'Recovery dipped below 55% twice this week',
        ],
        recommendations: [
          'Consider a lighter training day tomorrow',
          'Focus on sleep quality to boost recovery',
        ],
        daysToRecovery: 1,
        explanation: 'Your training load is manageable but approaching your recovery capacity. Minor adjustments can prevent overtraining.',
      ),
      sleepDebt: const SleepDebtAssessment(
        accumulatedDebtHours: 4.5,
        averageSleepLast7Days: 6.8,
        targetSleepHours: 8.0,
        deficitPerNight: 1.2,
        level: SleepDebtLevel.mild,
        daysToRecover: 3,
        impacts: [
          'May affect recovery speed',
          'Could impact cognitive performance',
        ],
        recommendations: [
          'Add 30 minutes to sleep time for 3-4 nights',
          'Avoid caffeine after 2pm',
        ],
        explanation: 'You have accumulated mild sleep debt. Consistent earlier bedtimes can help recover.',
      ),
      riskFactors: [
        const RiskFactor(
          name: 'Sleep Consistency',
          description: 'Bedtime varies by 2+ hours on weekends',
          severity: 35,
          category: RiskCategory.behavioral,
          isActionable: true,
          suggestedAction: 'Try to keep bedtime within 1 hour of weekday schedule',
        ),
      ],
      recommendations: [
        const HealthRecommendation(
          title: 'Optimize Sleep Schedule',
          description: 'Aim for consistent 10:30pm bedtime this week',
          category: ActionCategory.sleep,
          priority: ActionPriority.high,
          rationale: 'Consistent sleep timing improves HRV and recovery by 15-20%',
          duration: 'This week',
        ),
        const HealthRecommendation(
          title: 'Active Recovery Session',
          description: 'Light yoga or 20-minute walk',
          category: ActionCategory.activity,
          priority: ActionPriority.medium,
          rationale: 'Active recovery promotes blood flow without adding training stress',
        ),
        const HealthRecommendation(
          title: 'Hydration Focus',
          description: 'Increase water intake to 3L today',
          category: ActionCategory.hydration,
          priority: ActionPriority.medium,
          rationale: 'Proper hydration supports recovery and reduces perceived fatigue',
        ),
      ],
      positiveIndicators: [
        'Consistent workout schedule',
        'Good protein intake',
        'Regular sleep pattern',
      ],
      summary: 'Your overall health is good with room for optimization. Focus on sleep consistency to maximize recovery.',
      disclaimer: 'This analysis is AI-generated for informational purposes only. It is not medical advice. Consult a healthcare provider for medical concerns.',
    );
  }

  List<BehaviorCorrelation> _createDemoBehaviorCorrelations() {
    return [
      const BehaviorCorrelation(
        behavior: 'Cold shower',
        impactOnRecovery: BehaviorImpact.positive,
        correlationStrength: 0.65,
        confidence: 75,
        occurrences: 18,
        averageRecoveryWith: 78,
        averageRecoveryWithout: 65,
        explanation: 'Cold exposure appears to boost your recovery by 13%',
        insights: ['Most effective when done in morning'],
      ),
      const BehaviorCorrelation(
        behavior: 'Meditation',
        impactOnRecovery: BehaviorImpact.positive,
        correlationStrength: 0.52,
        confidence: 68,
        occurrences: 22,
        averageRecoveryWith: 74,
        averageRecoveryWithout: 66,
        explanation: 'Meditation correlates with 8% better recovery',
        insights: ['Evening sessions show stronger effect'],
      ),
      const BehaviorCorrelation(
        behavior: 'Alcohol',
        impactOnRecovery: BehaviorImpact.negative,
        correlationStrength: -0.72,
        confidence: 82,
        occurrences: 8,
        averageRecoveryWith: 52,
        averageRecoveryWithout: 72,
        explanation: 'Alcohol significantly reduces your recovery by ~20%',
        insights: ['Effect lasts 2-3 days'],
      ),
      const BehaviorCorrelation(
        behavior: 'Late meal',
        impactOnRecovery: BehaviorImpact.negative,
        correlationStrength: -0.45,
        confidence: 70,
        occurrences: 12,
        averageRecoveryWith: 62,
        averageRecoveryWithout: 71,
        explanation: 'Eating within 2 hours of bed reduces recovery',
        insights: ['Try to finish eating by 8pm'],
      ),
    ];
  }

  List<ProactiveInsight> _createDemoProactiveInsights() {
    return [
      ProactiveInsight(
        id: '1',
        generatedAt: DateTime.now(),
        type: InsightType.trendAlert,
        title: 'HRV Trending Down',
        message: 'Your HRV has dropped 12% over the past 3 days. This often precedes illness or indicates accumulated stress.',
        priority: ActionPriority.high,
        confidence: 78,
        actionableAdvice: 'Consider a rest day and prioritize 8+ hours of sleep',
        relatedMetric: 'HRV',
        metricChange: -12,
        isUrgent: false,
      ),
      ProactiveInsight(
        id: '2',
        generatedAt: DateTime.now(),
        type: InsightType.celebration,
        title: '14-Day Logging Streak!',
        message: 'You\'ve logged consistently for 2 weeks. This data quality enables more accurate predictions.',
        priority: ActionPriority.low,
        confidence: 100,
        isUrgent: false,
      ),
    ];
  }
}
