import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // App Logo/Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite,
                  size: 64,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              // Welcome Title
              Text(
                'Health Keeper',
                style: AppTypography.headlineLarge.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              // Tagline
              Text(
                'Your AI-powered health companion',
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Track, analyze, and optimize your health journey',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textHint,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Features list
              _buildFeatureItem(
                icon: Icons.watch,
                title: 'Apple Watch Integration',
                subtitle: 'Sync your health data automatically',
              ),
              const SizedBox(height: AppSpacing.md),
              _buildFeatureItem(
                icon: Icons.camera_alt,
                title: 'AI Food Recognition',
                subtitle: 'Log meals with a photo',
              ),
              const SizedBox(height: AppSpacing.md),
              _buildFeatureItem(
                icon: Icons.insights,
                title: 'Personalized Coaching',
                subtitle: 'Daily insights powered by AI',
              ),
              const Spacer(),
              // Get Started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/onboarding'),
                  child: const Text('Get Started'),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              // Privacy notice
              Text(
                'Your data stays on your device. Privacy first.',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.textHint,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.titleSmall,
              ),
              Text(
                subtitle,
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
