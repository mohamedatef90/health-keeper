import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/providers.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

/// Banner widget that prompts users to connect Health app
/// when HealthKit permissions haven't been granted.
class ConnectHealthBanner extends ConsumerWidget {
  const ConnectHealthBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionStatus = ref.watch(healthKitPermissionStatusProvider);

    return permissionStatus.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => _buildBanner(context, ref),
      data: (hasPermissions) {
        if (hasPermissions) {
          return const SizedBox.shrink();
        }
        return _buildBanner(context, ref);
      },
    );
  }

  Widget _buildBanner(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.recovery.withValues(alpha: 0.15),
            AppColors.sleep.withValues(alpha: 0.15),
          ],
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(
          color: AppColors.recovery.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.recovery.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: AppColors.recovery,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connect Apple Health',
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'ربط تطبيق الصحة',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Enable Health access to track sleep, heart rate, HRV, and workouts for personalized recovery insights.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _requestHealthPermissions(context, ref),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.recovery,
                foregroundColor: AppColors.backgroundDark,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
              ),
              icon: const Icon(Icons.health_and_safety, size: 20),
              label: Text(
                'Connect Now',
                style: AppTypography.button.copyWith(
                  color: AppColors.backgroundDark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _requestHealthPermissions(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final healthKitService = ref.read(healthKitServiceProvider);
    final granted = await healthKitService.requestPermissions();

    if (granted) {
      // Refresh the permission status provider
      ref.invalidate(healthKitPermissionStatusProvider);

      // Refresh health data providers
      ref.invalidate(todayStrainScoreProvider);
      ref.invalidate(todayRecoveryScoreProvider);
      ref.invalidate(healthPredictionProvider);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Health connected successfully!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Health access is needed for recovery tracking. You can enable it in Settings.',
            ),
            backgroundColor: AppColors.alert,
            action: SnackBarAction(
              label: 'Settings',
              textColor: AppColors.textPrimary,
              onPressed: () {
                // This would open app settings in a real implementation
              },
            ),
          ),
        );
      }
    }
  }
}
