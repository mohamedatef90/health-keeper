import 'package:flutter/material.dart';

import '../../../../core/domain/entities/health_prediction.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Card displaying illness risk assessment
class IllnessRiskCard extends StatelessWidget {
  final IllnessRisk illnessRisk;
  final VoidCallback? onTap;

  const IllnessRiskCard({
    super.key,
    required this.illnessRisk,
    this.onTap,
  });

  Color get _riskColor {
    switch (illnessRisk.riskLevel) {
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

  IconData get _riskIcon {
    switch (illnessRisk.riskLevel) {
      case IllnessRiskLevel.low:
        return Icons.check_circle_outline;
      case IllnessRiskLevel.moderate:
        return Icons.info_outline;
      case IllnessRiskLevel.elevated:
        return Icons.warning_amber_outlined;
      case IllnessRiskLevel.high:
        return Icons.error_outline;
      case IllnessRiskLevel.unknown:
        return Icons.help_outline;
    }
  }

  String get _riskLabel {
    switch (illnessRisk.riskLevel) {
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

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: _riskColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _riskIcon,
                      color: _riskColor,
                      size: 20,
                    ),
                  ),
                  const Spacer(),
                  if (illnessRisk.shouldConsultDoctor)
                    Icon(
                      Icons.medical_services_outlined,
                      color: AppColors.warning,
                      size: 16,
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Illness Risk',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${illnessRisk.probability}%',
                    style: AppTypography.headlineMedium.copyWith(
                      color: _riskColor,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      _riskLabel,
                      style: AppTypography.labelSmall.copyWith(
                        color: _riskColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              // Confidence indicator
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: illnessRisk.confidence / 100,
                        backgroundColor: AppColors.divider,
                        valueColor: AlwaysStoppedAnimation(
                          AppColors.info.withOpacity(0.5),
                        ),
                        minHeight: 3,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    '${illnessRisk.confidence}%',
                    style: AppTypography.labelSmall.copyWith(
                      fontSize: 9,
                      color: AppColors.textHint,
                    ),
                  ),
                ],
              ),
              if (onTap != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Details',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Icon(
                      Icons.chevron_right,
                      size: 14,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
