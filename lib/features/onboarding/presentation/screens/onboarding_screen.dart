import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingStep> _steps = [
    OnboardingStep(
      title: 'Health Data Access',
      description:
          'Connect with Apple Health to import your sleep, heart rate, and activity data for personalized insights.',
      icon: Icons.health_and_safety,
      permissionType: PermissionType.healthKit,
    ),
    OnboardingStep(
      title: 'AI Coaching',
      description:
          'Allow AI analysis of your health data to generate personalized daily briefs and recommendations.',
      icon: Icons.psychology,
      permissionType: PermissionType.aiConsent,
    ),
    OnboardingStep(
      title: 'Photo Access',
      description:
          'Use your camera to log meals instantly with AI-powered food recognition.',
      icon: Icons.camera_alt,
      permissionType: PermissionType.photos,
    ),
    OnboardingStep(
      title: 'Notifications',
      description:
          'Get gentle reminders for meals, medications, and daily check-ins.',
      icon: Icons.notifications,
      permissionType: PermissionType.notifications,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _steps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Complete onboarding
      context.go('/');
    }
  }

  void _skipToEnd() {
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _skipToEnd,
                child: const Text('Skip'),
              ),
            ),
            // Page view
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() => _currentPage = page);
                },
                itemCount: _steps.length,
                itemBuilder: (context, index) {
                  return _buildStepPage(_steps[index]);
                },
              ),
            ),
            // Page indicators
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _steps.length,
                  (index) => _buildDot(index == _currentPage),
                ),
              ),
            ),
            // Action buttons
            Padding(
              padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _handlePermission(_steps[_currentPage]),
                      child: Text(_currentPage == _steps.length - 1
                          ? 'Complete Setup'
                          : 'Allow & Continue'),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  if (_currentPage < _steps.length - 1)
                    TextButton(
                      onPressed: _nextPage,
                      child: const Text('Not now'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepPage(OnboardingStep step) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              step.icon,
              size: 48,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            step.title,
            style: AppTypography.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            step.description,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          // Privacy note
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.lock_outline,
                  size: 20,
                  color: AppColors.info,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Your data stays private and is stored only on your device.',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.info,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.divider,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Future<void> _handlePermission(OnboardingStep step) async {
    // TODO: Implement actual permission requests
    // For now, just move to next page
    _nextPage();
  }
}

class OnboardingStep {
  final String title;
  final String description;
  final IconData icon;
  final PermissionType permissionType;

  OnboardingStep({
    required this.title,
    required this.description,
    required this.icon,
    required this.permissionType,
  });
}

enum PermissionType {
  healthKit,
  aiConsent,
  photos,
  notifications,
}
