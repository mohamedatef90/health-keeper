import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/domain/entities/protocol.dart' as protocol;
import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../widgets/medication_card.dart';
import '../widgets/supplement_card.dart';
import '../widgets/workout_schedule_card.dart';
import '../widgets/add_medication_dialog.dart';
import '../widgets/add_supplement_dialog.dart';
import '../widgets/add_workout_dialog.dart';

class ProtocolScreen extends ConsumerStatefulWidget {
  const ProtocolScreen({super.key});

  @override
  ConsumerState<ProtocolScreen> createState() => _ProtocolScreenState();
}

class _ProtocolScreenState extends ConsumerState<ProtocolScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Mock data - in production, this would come from the database
  final List<protocol.Medication> _medications = [
    protocol.Medication(
      id: '1',
      name: 'Mounjaro',
      dosage: '5mg',
      frequency: protocol.MedicationFrequency.weekly,
      times: [const protocol.TimeOfDay(hour: 9, minute: 0)],
      startDate: DateTime(2024, 1, 1),
      remindersEnabled: true,
    ),
  ];

  final List<protocol.Supplement> _supplements = [
    protocol.Supplement(
      id: '1',
      name: 'Vitamin D',
      dosage: '2000 IU',
      frequency: protocol.SupplementFrequency.daily,
      times: [const protocol.TimeOfDay(hour: 8, minute: 0)],
      withMeals: true,
    ),
    protocol.Supplement(
      id: '2',
      name: 'Omega-3',
      dosage: '1000mg',
      frequency: protocol.SupplementFrequency.daily,
      times: [const protocol.TimeOfDay(hour: 8, minute: 0)],
      withMeals: true,
    ),
  ];

  final List<protocol.ScheduledWorkout> _workouts = [
    protocol.ScheduledWorkout(
      id: '1',
      name: 'Futsal',
      type: protocol.WorkoutType.sports,
      dayOfWeek: 1,
      preferredTime: const protocol.TimeOfDay(hour: 20, minute: 0),
      duration: 90,
    ),
    protocol.ScheduledWorkout(
      id: '2',
      name: 'Upper Body',
      type: protocol.WorkoutType.strength,
      dayOfWeek: 3,
      preferredTime: const protocol.TimeOfDay(hour: 18, minute: 0),
      duration: 60,
      targetStrain: 12.0,
    ),
    protocol.ScheduledWorkout(
      id: '3',
      name: 'Lower Body',
      type: protocol.WorkoutType.strength,
      dayOfWeek: 5,
      preferredTime: const protocol.TimeOfDay(hour: 18, minute: 0),
      duration: 60,
      targetStrain: 14.0,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _addMedication() async {
    final result = await showDialog<protocol.Medication>(
      context: context,
      builder: (context) => const AddMedicationDialog(),
    );
    if (result != null) {
      setState(() {
        _medications.add(result);
      });
    }
  }

  Future<void> _editMedication(protocol.Medication medication) async {
    final result = await showDialog<protocol.Medication>(
      context: context,
      builder: (context) => AddMedicationDialog(medication: medication),
    );
    if (result != null) {
      setState(() {
        final index = _medications.indexWhere((m) => m.id == result.id);
        if (index != -1) {
          _medications[index] = result;
        }
      });
    }
  }

  void _deleteMedication(protocol.Medication medication) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Medication?'),
        content: Text('Are you sure you want to delete ${medication.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _medications.removeWhere((m) => m.id == medication.id);
              });
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _addSupplement() async {
    final result = await showDialog<protocol.Supplement>(
      context: context,
      builder: (context) => const AddSupplementDialog(),
    );
    if (result != null) {
      setState(() {
        _supplements.add(result);
      });
    }
  }

  Future<void> _editSupplement(protocol.Supplement supplement) async {
    final result = await showDialog<protocol.Supplement>(
      context: context,
      builder: (context) => AddSupplementDialog(supplement: supplement),
    );
    if (result != null) {
      setState(() {
        final index = _supplements.indexWhere((s) => s.id == result.id);
        if (index != -1) {
          _supplements[index] = result;
        }
      });
    }
  }

  void _deleteSupplement(protocol.Supplement supplement) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Supplement?'),
        content: Text('Are you sure you want to delete ${supplement.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _supplements.removeWhere((s) => s.id == supplement.id);
              });
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _addWorkout() async {
    final result = await showDialog<protocol.ScheduledWorkout>(
      context: context,
      builder: (context) => const AddWorkoutDialog(),
    );
    if (result != null) {
      setState(() {
        _workouts.add(result);
      });
    }
  }

  Future<void> _editWorkout(protocol.ScheduledWorkout workout) async {
    final result = await showDialog<protocol.ScheduledWorkout>(
      context: context,
      builder: (context) => AddWorkoutDialog(workout: workout),
    );
    if (result != null) {
      setState(() {
        final index = _workouts.indexWhere((w) => w.id == result.id);
        if (index != -1) {
          _workouts[index] = result;
        }
      });
    }
  }

  void _deleteWorkout(protocol.ScheduledWorkout workout) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Workout?'),
        content: Text('Are you sure you want to delete ${workout.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _workouts.removeWhere((w) => w.id == workout.id);
              });
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Protocol'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Eating'),
            Tab(text: 'Medications'),
            Tab(text: 'Supplements'),
            Tab(text: 'Workouts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEatingWindowTab(),
          _buildMedicationsTab(),
          _buildSupplementsTab(),
          _buildWorkoutsTab(),
        ],
      ),
    );
  }

  Widget _buildEatingWindowTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lock status
          Card(
            color: AppColors.info.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  const Icon(Icons.lock_outline, color: AppColors.info),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Protocol Locked',
                          style: AppTypography.titleSmall.copyWith(
                            color: AppColors.info,
                          ),
                        ),
                        Text(
                          'Changes allowed after Jan 20, 2026',
                          style: AppTypography.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _showWhyLockedDialog();
                    },
                    child: const Text('Why?'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Eating Window
          Text('Eating Window', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.cardPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _TimeDisplay(
                        label: 'Start',
                        time: '11:00 AM',
                        icon: Icons.wb_sunny_outlined,
                      ),
                      Container(
                        width: 40,
                        height: 2,
                        color: AppColors.divider,
                      ),
                      _TimeDisplay(
                        label: 'End',
                        time: '8:00 PM',
                        icon: Icons.nightlight_outlined,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    '9 hour eating window',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Constraints
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Constraints', style: AppTypography.titleMedium),
              IconButton(
                icon: const Icon(Icons.add, color: AppColors.primary),
                onPressed: () {
                  // TODO: Add constraint
                },
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            color: AppColors.warning.withOpacity(0.1),
            child: ListTile(
              leading: const Icon(Icons.warning_amber, color: AppColors.warning),
              title: const Text('No heavy lifting'),
              subtitle: const Text('Until Feb 1, 2026 - Back recovery'),
              trailing: IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () {
                  // TODO: Edit constraint
                },
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }

  Widget _buildMedicationsTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_medications.length} Medications',
                style: AppTypography.titleSmall.copyWith(
                  color: AppColors.textSecondaryDark,
                ),
              ),
              ElevatedButton.icon(
                onPressed: _addMedication,
                icon: const Icon(Icons.add),
                label: const Text('Add'),
              ),
            ],
          ),
        ),
        Expanded(
          child: _medications.isEmpty
              ? _buildEmptyState(
                  icon: Icons.medication_outlined,
                  title: 'No medications added',
                  subtitle: 'Add your medications to get reminders',
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPaddingHorizontal,
                  ),
                  itemCount: _medications.length,
                  itemBuilder: (context, index) {
                    final medication = _medications[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: MedicationCard(
                        medication: medication,
                        onTap: () => _editMedication(medication),
                        onToggle: (value) {
                          setState(() {
                            _medications[index] = medication.copyWith(
                              remindersEnabled: value,
                            );
                          });
                        },
                        onDelete: () => _deleteMedication(medication),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildSupplementsTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_supplements.length} Supplements',
                style: AppTypography.titleSmall.copyWith(
                  color: AppColors.textSecondaryDark,
                ),
              ),
              ElevatedButton.icon(
                onPressed: _addSupplement,
                icon: const Icon(Icons.add),
                label: const Text('Add'),
              ),
            ],
          ),
        ),
        Expanded(
          child: _supplements.isEmpty
              ? _buildEmptyState(
                  icon: Icons.local_pharmacy_outlined,
                  title: 'No supplements added',
                  subtitle: 'Track your daily supplements here',
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPaddingHorizontal,
                  ),
                  itemCount: _supplements.length,
                  itemBuilder: (context, index) {
                    final supplement = _supplements[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: SupplementCard(
                        supplement: supplement,
                        onTap: () => _editSupplement(supplement),
                        onToggle: (value) {
                          setState(() {
                            _supplements[index] = supplement.copyWith(
                              remindersEnabled: value,
                            );
                          });
                        },
                        onDelete: () => _deleteSupplement(supplement),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildWorkoutsTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_workouts.length} Scheduled Workouts',
                style: AppTypography.titleSmall.copyWith(
                  color: AppColors.textSecondaryDark,
                ),
              ),
              ElevatedButton.icon(
                onPressed: _addWorkout,
                icon: const Icon(Icons.add),
                label: const Text('Add'),
              ),
            ],
          ),
        ),
        // Weekly overview
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPaddingHorizontal,
            ),
            itemCount: 7,
            itemBuilder: (context, index) {
              final dayOfWeek = index + 1;
              final dayWorkouts = _workouts.where((w) => w.dayOfWeek == dayOfWeek).toList();
              final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
              final isToday = DateTime.now().weekday == dayOfWeek;

              return Container(
                width: 48,
                margin: const EdgeInsets.only(right: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: isToday
                      ? AppColors.primary.withOpacity(0.2)
                      : AppColors.cardBackgroundDark,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  border: isToday
                      ? Border.all(color: AppColors.primary)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dayNames[index],
                      style: AppTypography.labelSmall.copyWith(
                        color: isToday
                            ? AppColors.primary
                            : AppColors.textSecondaryDark,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: dayWorkouts.isNotEmpty
                            ? AppColors.primary
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${dayWorkouts.length}',
                          style: AppTypography.labelSmall.copyWith(
                            color: dayWorkouts.isNotEmpty
                                ? Colors.white
                                : AppColors.textHintDark,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Expanded(
          child: _workouts.isEmpty
              ? _buildEmptyState(
                  icon: Icons.fitness_center_outlined,
                  title: 'No workouts scheduled',
                  subtitle: 'Plan your weekly workout routine',
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPaddingHorizontal,
                  ),
                  itemCount: _workouts.length,
                  itemBuilder: (context, index) {
                    final workout = _workouts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: WorkoutScheduleCard(
                        workout: workout,
                        onTap: () => _editWorkout(workout),
                        onToggle: (value) {
                          setState(() {
                            _workouts[index] = workout.copyWith(
                              isActive: value,
                            );
                          });
                        },
                        onDelete: () => _deleteWorkout(workout),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: AppColors.textHintDark,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            title,
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.textSecondaryDark,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitle,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textHintDark,
            ),
          ),
        ],
      ),
    );
  }

  void _showWhyLockedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Why is my protocol locked?'),
        content: const Text(
          'Locking your protocol helps you stick to your plan and avoid making frequent changes that can disrupt your progress. '
          'Changes are allowed after the lock period ends to encourage consistency.\n\n'
          'Research shows that sticking to a consistent protocol for at least 2-4 weeks is important for seeing results.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}

class _TimeDisplay extends StatelessWidget {
  final String label;
  final String time;
  final IconData icon;

  const _TimeDisplay({
    required this.label,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(height: AppSpacing.xs),
        Text(time, style: AppTypography.titleMedium),
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(color: AppColors.textHint),
        ),
      ],
    );
  }
}
