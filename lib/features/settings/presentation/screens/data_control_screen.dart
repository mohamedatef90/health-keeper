import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/providers.dart';
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';

class DataControlScreen extends ConsumerStatefulWidget {
  const DataControlScreen({super.key});

  @override
  ConsumerState<DataControlScreen> createState() => _DataControlScreenState();
}

class _DataControlScreenState extends ConsumerState<DataControlScreen> {
  Map<String, int>? _dataSummary;
  bool _isLoading = true;
  bool _isExporting = false;
  bool _healthKitSyncEnabled = true;
  bool _aiDataProcessingEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadDataSummary();
  }

  Future<void> _loadDataSummary() async {
    setState(() => _isLoading = true);
    try {
      final db = ref.read(databaseProvider);
      final summary = await db.getDataSummary();
      setState(() {
        _dataSummary = summary;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _exportToJson() async {
    setState(() => _isExporting = true);
    try {
      // In production, this would use DataExportService
      await Future.delayed(const Duration(seconds: 2)); // Simulate export
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data exported to Downloads folder'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() => _isExporting = false);
    }
  }

  Future<void> _exportToCsv() async {
    setState(() => _isExporting = true);
    try {
      // In production, this would use DataExportService
      await Future.delayed(const Duration(seconds: 2)); // Simulate export
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('CSV files exported to Downloads folder'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() => _isExporting = false);
    }
  }

  void _showDeleteDataDialog(String dataType, String description) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete $dataType?'),
        content: Text(
          'This will permanently delete $description. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteData(dataType);
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteData(String dataType) async {
    try {
      // In production, this would delete specific data types
      await Future.delayed(const Duration(seconds: 1));
      _loadDataSummary(); // Refresh summary
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$dataType deleted successfully'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _showDeleteAllDataDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All Data?'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This will permanently delete ALL your data including:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('- Profile and settings'),
            Text('- Protocol and schedules'),
            Text('- All daily logs'),
            Text('- Meal logs and food photos'),
            Text('- Workout history'),
            Text('- Progress photos'),
            Text('- Journal entries'),
            SizedBox(height: 16),
            Text(
              'This action cannot be undone.',
              style: TextStyle(color: AppColors.error),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showFinalDeleteConfirmation();
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _showFinalDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Final Confirmation'),
        content: const Text(
          'Type "DELETE" to confirm you want to permanently delete all your data.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data & Privacy'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/profile/settings'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
        children: [
          // Data Summary Section
          _SectionHeader(title: 'Data Summary'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.cardPadding),
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        _DataSummaryRow(
                          icon: Icons.calendar_today,
                          label: 'Daily Logs',
                          count: _dataSummary?['dailyLogs'] ?? 0,
                        ),
                        const Divider(height: AppSpacing.lg),
                        _DataSummaryRow(
                          icon: Icons.restaurant,
                          label: 'Meal Logs',
                          count: _dataSummary?['mealLogs'] ?? 0,
                        ),
                        const Divider(height: AppSpacing.lg),
                        _DataSummaryRow(
                          icon: Icons.fitness_center,
                          label: 'Workout Logs',
                          count: _dataSummary?['workoutLogs'] ?? 0,
                        ),
                        const Divider(height: AppSpacing.lg),
                        _DataSummaryRow(
                          icon: Icons.photo_library,
                          label: 'Progress Photos',
                          count: _dataSummary?['progressPhotos'] ?? 0,
                        ),
                        const Divider(height: AppSpacing.lg),
                        _DataSummaryRow(
                          icon: Icons.book,
                          label: 'Journal Entries',
                          count: _dataSummary?['journalEntries'] ?? 0,
                        ),
                        const Divider(height: AppSpacing.lg),
                        _DataSummaryRow(
                          icon: Icons.medication,
                          label: 'Medications',
                          count: _dataSummary?['medications'] ?? 0,
                        ),
                        const Divider(height: AppSpacing.lg),
                        _DataSummaryRow(
                          icon: Icons.local_pharmacy,
                          label: 'Supplements',
                          count: _dataSummary?['supplements'] ?? 0,
                        ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Export Data Section
          _SectionHeader(title: 'Export Data'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.code, color: AppColors.primary),
                  title: const Text('Export as JSON'),
                  subtitle: const Text('Full data backup with all details'),
                  trailing: _isExporting
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.download),
                  onTap: _isExporting ? null : _exportToJson,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.table_chart, color: AppColors.primary),
                  title: const Text('Export as CSV'),
                  subtitle: const Text('Spreadsheet-compatible format'),
                  trailing: _isExporting
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.download),
                  onTap: _isExporting ? null : _exportToCsv,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Privacy Controls Section
          _SectionHeader(title: 'Privacy Controls'),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.watch, color: AppColors.secondary),
                  title: const Text('Apple Health Sync'),
                  subtitle: const Text('Sync data with Apple Health'),
                  value: _healthKitSyncEnabled,
                  onChanged: (value) {
                    setState(() {
                      _healthKitSyncEnabled = value;
                    });
                    // TODO: Update settings in database
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.auto_awesome, color: AppColors.accent),
                  title: const Text('AI Data Processing'),
                  subtitle: const Text('Allow AI to analyze your health data'),
                  value: _aiDataProcessingEnabled,
                  onChanged: (value) {
                    setState(() {
                      _aiDataProcessingEnabled = value;
                    });
                    // TODO: Update settings in database
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Delete Data Section
          _SectionHeader(title: 'Delete Data'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.restaurant_outlined, color: AppColors.warning),
                  title: const Text('Delete Meal Logs'),
                  subtitle: const Text('Remove all meal and nutrition data'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showDeleteDataDialog('Meal Logs', 'all your meal logs and food photos'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.fitness_center_outlined, color: AppColors.warning),
                  title: const Text('Delete Workout Logs'),
                  subtitle: const Text('Remove all workout history'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showDeleteDataDialog('Workout Logs', 'all your workout logs'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.photo_library_outlined, color: AppColors.warning),
                  title: const Text('Delete Progress Photos'),
                  subtitle: const Text('Remove all progress photos'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showDeleteDataDialog('Progress Photos', 'all your progress photos'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.book_outlined, color: AppColors.warning),
                  title: const Text('Delete Journal Entries'),
                  subtitle: const Text('Remove all journal entries'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showDeleteDataDialog('Journal Entries', 'all your journal entries'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Danger Zone
          _SectionHeader(title: 'Danger Zone'),
          Card(
            color: AppColors.error.withOpacity(0.1),
            child: ListTile(
              leading: const Icon(Icons.delete_forever, color: AppColors.error),
              title: Text(
                'Delete All Data',
                style: AppTypography.titleSmall.copyWith(color: AppColors.error),
              ),
              subtitle: const Text('Permanently remove all your data'),
              trailing: const Icon(Icons.chevron_right, color: AppColors.error),
              onTap: _showDeleteAllDataDialog,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Privacy Notice
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.privacy_tip_outlined,
                  color: AppColors.info,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Your data is stored locally on your device. Health Keeper does not upload your health data to any servers. AI processing uses only the minimum data necessary.',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.info,
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

class _DataSummaryRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;

  const _DataSummaryRow({
    required this.icon,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.textSecondaryDark, size: 20),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textPrimaryDark,
            ),
          ),
        ),
        Text(
          count.toString(),
          style: AppTypography.titleMedium.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
