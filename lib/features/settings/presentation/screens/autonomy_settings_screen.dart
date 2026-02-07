import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/domain/entities/user_autonomy_settings.dart';
import '../../../../core/providers/ai_brain_provider.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class AutonomySettingsScreen extends ConsumerWidget {
  const AutonomySettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(userAutonomySettingsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Autonomy'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/profile/settings'),
        ),
      ),
      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: AppColors.error),
              const SizedBox(height: AppSpacing.md),
              Text('Error loading settings: $error'),
              const SizedBox(height: AppSpacing.md),
              ElevatedButton(
                onPressed: () => ref.invalidate(userAutonomySettingsNotifierProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (settings) => ListView(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
          children: [
            // AI Brain Status Card
            _AiBrainStatusCard(settings: settings),
            const SizedBox(height: AppSpacing.lg),

            // Autonomy Level Section
            _SectionHeader(title: 'Autonomy Level'),
            _AutonomyLevelCard(
              settings: settings,
              onChanged: (level) {
                ref
                    .read(userAutonomySettingsNotifierProvider.notifier)
                    .updateAutoApplyLevel(level);
              },
            ),
            const SizedBox(height: AppSpacing.lg),

            // Notification Frequency Section
            _SectionHeader(title: 'Notification Frequency'),
            _NotificationFrequencyCard(
              settings: settings,
              onChanged: (frequency) {
                ref
                    .read(userAutonomySettingsNotifierProvider.notifier)
                    .updateNotificationFrequency(frequency);
              },
            ),
            const SizedBox(height: AppSpacing.lg),

            // Specific Permissions Section
            _SectionHeader(title: 'Specific Permissions'),
            _PermissionsCard(
              settings: settings,
              onSettingChanged: (setting, value) {
                ref
                    .read(userAutonomySettingsNotifierProvider.notifier)
                    .updateSetting(setting, value);
              },
            ),
            const SizedBox(height: AppSpacing.lg),

            // Quiet Hours Section
            _SectionHeader(title: 'Quiet Hours'),
            _QuietHoursCard(
              settings: settings,
              onEnabledChanged: (enabled) {
                ref
                    .read(userAutonomySettingsNotifierProvider.notifier)
                    .updateSetting('quietHoursEnabled', enabled);
              },
              onStartChanged: (hour) {
                ref
                    .read(userAutonomySettingsNotifierProvider.notifier)
                    .updateSetting('quietHoursStart', hour);
              },
              onEndChanged: (hour) {
                ref
                    .read(userAutonomySettingsNotifierProvider.notifier)
                    .updateSetting('quietHoursEnd', hour);
              },
            ),
            const SizedBox(height: AppSpacing.lg),

            // Advanced Section
            _SectionHeader(title: 'Advanced'),
            _AdvancedCard(
              settings: settings,
              onSettingChanged: (setting, value) {
                ref
                    .read(userAutonomySettingsNotifierProvider.notifier)
                    .updateSetting(setting, value);
              },
            ),
            const SizedBox(height: AppSpacing.lg),

            // Info Box
            _InfoBox(),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.xs,
        bottom: AppSpacing.sm,
      ),
      child: Text(
        title,
        style: AppTypography.labelMedium.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _AiBrainStatusCard extends StatelessWidget {
  final UserAutonomySettings settings;

  const _AiBrainStatusCard({required this.settings});

  @override
  Widget build(BuildContext context) {
    final levelIcon = _getAutonomyLevelIcon(settings.autoApplyLevel);
    final levelColor = _getAutonomyLevelColor(settings.autoApplyLevel);
    final levelLabel = _getAutonomyLevelLabel(settings.autoApplyLevel);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: levelColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Icon(
                levelIcon,
                color: levelColor,
                size: 32,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI Brain Mode',
                    style: AppTypography.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    levelLabel,
                    style: AppTypography.bodyMedium.copyWith(
                      color: levelColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              child: Text(
                'Active',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.success,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getAutonomyLevelIcon(AutoApplyLevel level) {
    switch (level) {
      case AutoApplyLevel.conservative:
        return Icons.shield_outlined;
      case AutoApplyLevel.moderate:
        return Icons.auto_awesome;
      case AutoApplyLevel.aggressive:
        return Icons.flash_on;
    }
  }

  Color _getAutonomyLevelColor(AutoApplyLevel level) {
    switch (level) {
      case AutoApplyLevel.conservative:
        return AppColors.info;
      case AutoApplyLevel.moderate:
        return AppColors.success;
      case AutoApplyLevel.aggressive:
        return AppColors.warning;
    }
  }

  String _getAutonomyLevelLabel(AutoApplyLevel level) {
    switch (level) {
      case AutoApplyLevel.conservative:
        return 'Conservative - Always asks';
      case AutoApplyLevel.moderate:
        return 'Moderate - Smart automation';
      case AutoApplyLevel.aggressive:
        return 'Aggressive - Maximum automation';
    }
  }
}

class _AutonomyLevelCard extends StatelessWidget {
  final UserAutonomySettings settings;
  final ValueChanged<AutoApplyLevel> onChanged;

  const _AutonomyLevelCard({
    required this.settings,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _AutonomyLevelTile(
            icon: Icons.shield_outlined,
            title: 'Conservative',
            subtitle: 'Always ask before making any changes',
            isSelected: settings.autoApplyLevel == AutoApplyLevel.conservative,
            onTap: () => onChanged(AutoApplyLevel.conservative),
          ),
          const Divider(height: 1),
          _AutonomyLevelTile(
            icon: Icons.auto_awesome,
            title: 'Moderate (Recommended)',
            subtitle: 'Safe changes auto-apply, risky changes ask',
            isSelected: settings.autoApplyLevel == AutoApplyLevel.moderate,
            onTap: () => onChanged(AutoApplyLevel.moderate),
          ),
          const Divider(height: 1),
          _AutonomyLevelTile(
            icon: Icons.flash_on,
            title: 'Aggressive',
            subtitle: 'Most changes auto-apply, only major changes ask',
            isSelected: settings.autoApplyLevel == AutoApplyLevel.aggressive,
            onTap: () => onChanged(AutoApplyLevel.aggressive),
          ),
        ],
      ),
    );
  }
}

class _AutonomyLevelTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _AutonomyLevelTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.textPrimary,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: AppColors.primary)
          : const Icon(Icons.circle_outlined, color: AppColors.textSecondary),
      onTap: onTap,
    );
  }
}

class _NotificationFrequencyCard extends StatelessWidget {
  final UserAutonomySettings settings;
  final ValueChanged<NotificationFrequency> onChanged;

  const _NotificationFrequencyCard({
    required this.settings,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _NotificationFrequencyTile(
            icon: Icons.notifications_off_outlined,
            title: 'Minimal',
            subtitle: 'Only critical alerts',
            isSelected:
                settings.notificationFrequency == NotificationFrequency.minimal,
            onTap: () => onChanged(NotificationFrequency.minimal),
          ),
          const Divider(height: 1),
          _NotificationFrequencyTile(
            icon: Icons.notifications_outlined,
            title: 'Normal',
            subtitle: 'Important updates and reminders',
            isSelected:
                settings.notificationFrequency == NotificationFrequency.normal,
            onTap: () => onChanged(NotificationFrequency.normal),
          ),
          const Divider(height: 1),
          _NotificationFrequencyTile(
            icon: Icons.notifications_active_outlined,
            title: 'All',
            subtitle: 'Proactive coaching and all updates',
            isSelected:
                settings.notificationFrequency == NotificationFrequency.all,
            onTap: () => onChanged(NotificationFrequency.all),
          ),
        ],
      ),
    );
  }
}

class _NotificationFrequencyTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _NotificationFrequencyTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.textPrimary,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: AppColors.primary)
          : const Icon(Icons.circle_outlined, color: AppColors.textSecondary),
      onTap: onTap,
    );
  }
}

class _PermissionsCard extends StatelessWidget {
  final UserAutonomySettings settings;
  final void Function(String, dynamic) onSettingChanged;

  const _PermissionsCard({
    required this.settings,
    required this.onSettingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _PermissionTile(
            icon: Icons.local_fire_department_outlined,
            title: 'Auto-adjust Calories',
            subtitle: 'Adjust daily calorie targets based on activity',
            value: settings.canAutoAdjustCalories,
            onChanged: (v) => onSettingChanged('canAutoAdjustCalories', v),
          ),
          const Divider(height: 1),
          _PermissionTile(
            icon: Icons.fitness_center_outlined,
            title: 'Auto-adjust Protein',
            subtitle: 'Adjust protein targets based on recovery',
            value: settings.canAutoAdjustProtein,
            onChanged: (v) => onSettingChanged('canAutoAdjustProtein', v),
          ),
          const Divider(height: 1),
          _PermissionTile(
            icon: Icons.speed_outlined,
            title: 'Auto-adjust Intensity',
            subtitle: 'Modify workout intensity based on recovery',
            value: settings.canAutoAdjustIntensity,
            onChanged: (v) => onSettingChanged('canAutoAdjustIntensity', v),
          ),
          const Divider(height: 1),
          _PermissionTile(
            icon: Icons.schedule_outlined,
            title: 'Auto-adjust Meal Timing',
            subtitle: 'Suggest meal time changes',
            value: settings.canAutoAdjustMealTiming,
            onChanged: (v) => onSettingChanged('canAutoAdjustMealTiming', v),
          ),
          const Divider(height: 1),
          _PermissionTile(
            icon: Icons.hotel_outlined,
            title: 'Auto-add Rest Days',
            subtitle: 'Automatically add rest days when recovery is low',
            value: settings.canAutoAddRestDay,
            onChanged: (v) => onSettingChanged('canAutoAddRestDay', v),
            isHighImpact: true,
          ),
          const Divider(height: 1),
          _PermissionTile(
            icon: Icons.cancel_outlined,
            title: 'Auto-skip Workouts',
            subtitle: 'Skip workouts when not recommended',
            value: settings.canAutoRemoveWorkout,
            onChanged: (v) => onSettingChanged('canAutoRemoveWorkout', v),
            isHighImpact: true,
          ),
          const Divider(height: 1),
          _PermissionTile(
            icon: Icons.notifications_outlined,
            title: 'Proactive Notifications',
            subtitle: 'Send AI-generated coaching notifications',
            value: settings.canAutoSendNotifications,
            onChanged: (v) => onSettingChanged('canAutoSendNotifications', v),
          ),
        ],
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isHighImpact;

  const _PermissionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.isHighImpact = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isHighImpact ? AppColors.warning : AppColors.textPrimary,
      ),
      title: Row(
        children: [
          Text(title),
          if (isHighImpact) ...[
            const SizedBox(width: AppSpacing.xs),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
              ),
              child: Text(
                'High Impact',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.warning,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ],
      ),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

class _QuietHoursCard extends StatelessWidget {
  final UserAutonomySettings settings;
  final ValueChanged<bool> onEnabledChanged;
  final ValueChanged<int> onStartChanged;
  final ValueChanged<int> onEndChanged;

  const _QuietHoursCard({
    required this.settings,
    required this.onEnabledChanged,
    required this.onStartChanged,
    required this.onEndChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.bedtime_outlined),
            title: const Text('Enable Quiet Hours'),
            subtitle: const Text('Pause non-urgent notifications'),
            trailing: Switch(
              value: settings.quietHoursEnabled,
              onChanged: onEnabledChanged,
            ),
          ),
          if (settings.quietHoursEnabled) ...[
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.schedule_outlined),
              title: const Text('Quiet Period'),
              subtitle: Text(
                '${_formatHour(settings.quietHoursStart)} - ${_formatHour(settings.quietHoursEnd)}',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showQuietHoursDialog(context),
            ),
          ],
        ],
      ),
    );
  }

  String _formatHour(int hour) {
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:00 $period';
  }

  void _showQuietHoursDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set Quiet Hours'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Start Time'),
              trailing: DropdownButton<int>(
                value: settings.quietHoursStart,
                items: List.generate(
                  24,
                  (i) => DropdownMenuItem(
                    value: i,
                    child: Text(_formatHour(i)),
                  ),
                ),
                onChanged: (v) {
                  if (v != null) {
                    onStartChanged(v);
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('End Time'),
              trailing: DropdownButton<int>(
                value: settings.quietHoursEnd,
                items: List.generate(
                  24,
                  (i) => DropdownMenuItem(
                    value: i,
                    child: Text(_formatHour(i)),
                  ),
                ),
                onChanged: (v) {
                  if (v != null) {
                    onEndChanged(v);
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}

class _AdvancedCard extends StatelessWidget {
  final UserAutonomySettings settings;
  final void Function(String, dynamic) onSettingChanged;

  const _AdvancedCard({
    required this.settings,
    required this.onSettingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.psychology_outlined),
            title: const Text('Show AI Reasoning'),
            subtitle: const Text('Explain why AI made each decision'),
            trailing: Switch(
              value: settings.showAiReasoning,
              onChanged: (v) => onSettingChanged('showAiReasoning', v),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.science_outlined),
            title: const Text('Experimental Features'),
            subtitle: const Text('Try new AI capabilities early'),
            trailing: Switch(
              value: settings.enableExperimentalFeatures,
              onChanged: (v) => onSettingChanged('enableExperimentalFeatures', v),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.tune_outlined),
            title: const Text('Recovery Threshold'),
            subtitle: Text(
              'Min recovery for intensity increase: ${settings.minRecoveryForIntensityIncrease}%',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showThresholdDialog(
              context,
              'Recovery Threshold',
              settings.minRecoveryForIntensityIncrease,
              (v) => onSettingChanged('minRecoveryForIntensityIncrease', v),
              min: 40,
              max: 80,
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.local_fire_department_outlined),
            title: const Text('Max Calorie Adjustment'),
            subtitle: Text(
              'Per day: ±${settings.maxCalorieAdjustmentPerDay} kcal',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showThresholdDialog(
              context,
              'Max Calorie Adjustment',
              settings.maxCalorieAdjustmentPerDay,
              (v) => onSettingChanged('maxCalorieAdjustmentPerDay', v),
              min: 100,
              max: 500,
              step: 50,
            ),
          ),
        ],
      ),
    );
  }

  void _showThresholdDialog(
    BuildContext context,
    String title,
    int currentValue,
    ValueChanged<int> onChanged, {
    required int min,
    required int max,
    int step = 5,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$currentValue',
                  style: AppTypography.headlineMedium,
                ),
                Slider(
                  value: currentValue.toDouble(),
                  min: min.toDouble(),
                  max: max.toDouble(),
                  divisions: ((max - min) / step).round(),
                  label: '$currentValue',
                  onChanged: (v) {
                    setState(() {
                      currentValue = v.round();
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$min'),
                    Text('$max'),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onChanged(currentValue);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.info.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline,
            color: AppColors.info,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              'The AI Brain analyzes your health data to make proactive adjustments. '
              'You always remain in control - adjust these settings to match your comfort level.',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.info,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
