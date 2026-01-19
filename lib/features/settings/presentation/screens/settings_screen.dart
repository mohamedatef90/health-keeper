import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
        children: [
          // Profile Section
          _SectionHeader(title: 'Profile'),
          Card(
            child: Column(
              children: [
                _SettingsTile(
                  icon: Icons.person_outline,
                  title: 'Edit Profile',
                  subtitle: 'Height, age, goals',
                  onTap: () => context.go('/edit-profile'),
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.calendar_today_outlined,
                  title: 'My Protocol',
                  subtitle: 'Eating window, medications, activities',
                  onTap: () => context.go('/protocol'),
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.photo_library_outlined,
                  title: 'Progress Photos',
                  subtitle: 'Track your visual progress',
                  onTap: () => context.go('/progress-photos'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // AI & Health Section
          _SectionHeader(title: 'AI & Health Data'),
          Card(
            child: Column(
              children: [
                _SettingsTile(
                  icon: Icons.watch_outlined,
                  title: 'Apple Health',
                  subtitle: 'Connected',
                  trailing: Container(
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
                  onTap: () {},
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.auto_awesome,
                  title: 'AI Coaching',
                  subtitle: 'Personalized insights enabled',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.psychology_outlined,
                  title: 'AI Autonomy',
                  subtitle: 'Control what AI can change automatically',
                  onTap: () => context.go('/autonomy-settings'),
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.language,
                  title: 'Language',
                  subtitle: 'العربية (Arabic)',
                  onTap: () {
                    _showLanguageDialog(context);
                  },
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.record_voice_over_outlined,
                  title: 'Coaching Tone',
                  subtitle: 'Supportive',
                  onTap: () {
                    _showToneDialog(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Notifications Section
          _SectionHeader(title: 'Notifications'),
          Card(
            child: Column(
              children: [
                _SettingsTile(
                  icon: Icons.notifications_outlined,
                  title: 'Daily Reminders',
                  subtitle: 'Morning check-in, meals',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.medication_outlined,
                  title: 'Medication Reminders',
                  subtitle: 'Weekly on Sundays',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Privacy & Data Section
          _SectionHeader(title: 'Privacy & Data'),
          Card(
            child: Column(
              children: [
                _SettingsTile(
                  icon: Icons.security_outlined,
                  title: 'Data & Privacy',
                  subtitle: 'Export, delete, and manage your data',
                  onTap: () => context.go('/data-control'),
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.download_outlined,
                  title: 'Export Data',
                  subtitle: 'CSV or JSON format',
                  onTap: () {
                    _showExportDialog(context);
                  },
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.delete_outline,
                  title: 'Delete All Data',
                  subtitle: 'Permanently remove all data',
                  textColor: AppColors.error,
                  onTap: () {
                    _showDeleteConfirmation(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // About Section
          _SectionHeader(title: 'About'),
          Card(
            child: Column(
              children: [
                _SettingsTile(
                  icon: Icons.info_outline,
                  title: 'About Health Keeper',
                  subtitle: 'Version 1.0.0',
                  onTap: () {},
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  onTap: () {},
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.description_outlined,
                  title: 'Terms of Service',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Medical Disclaimer
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.warning.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.medical_information_outlined,
                  color: AppColors.warning,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Health Keeper is not a medical device. All AI recommendations are estimates and should not replace professional medical advice.',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.warning,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('العربية (Arabic)'),
              value: 'ar',
              groupValue: 'ar',
              onChanged: (value) {
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: const Text('English'),
              value: 'en',
              groupValue: 'ar',
              onChanged: (value) {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showToneDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Coaching Tone'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('Supportive'),
              subtitle: const Text('Encouraging and gentle'),
              value: 'supportive',
              groupValue: 'supportive',
              onChanged: (value) {
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: const Text('Direct'),
              subtitle: const Text('Straight to the point'),
              value: 'direct',
              groupValue: 'supportive',
              onChanged: (value) {
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: const Text('Motivational'),
              subtitle: const Text('High energy and pushing'),
              value: 'motivational',
              groupValue: 'supportive',
              onChanged: (value) {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showExportDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Export Data', style: AppTypography.titleLarge),
            const SizedBox(height: AppSpacing.md),
            ListTile(
              leading: const Icon(Icons.table_chart),
              title: const Text('Export as CSV'),
              subtitle: const Text('Spreadsheet compatible'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Export CSV
              },
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Export as JSON'),
              subtitle: const Text('Full data backup'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Export JSON
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All Data?'),
        content: const Text(
          'This will permanently delete all your health data, progress photos, and settings. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Delete all data
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
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

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Color? textColor;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? AppColors.textPrimary),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
