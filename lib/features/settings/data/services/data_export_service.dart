import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:talker/talker.dart';

import '../../../../core/data/database/database.dart';

/// Data summary information
class DataSummary {
  final int totalRecords;
  final int dailyLogs;
  final int mealLogs;
  final int workoutLogs;
  final int progressPhotos;
  final int journalEntries;
  final int medications;
  final int supplements;
  final int scheduledWorkouts;
  final DateTime? oldestRecord;
  final DateTime? newestRecord;
  final int estimatedSizeBytes;

  DataSummary({
    required this.totalRecords,
    required this.dailyLogs,
    required this.mealLogs,
    required this.workoutLogs,
    required this.progressPhotos,
    required this.journalEntries,
    required this.medications,
    required this.supplements,
    required this.scheduledWorkouts,
    this.oldestRecord,
    this.newestRecord,
    this.estimatedSizeBytes = 0,
  });
}

/// Types of data that can be deleted
enum DataType {
  mealLogs,
  workoutLogs,
  progressPhotos,
  journalEntries,
  medications,
  supplements,
  scheduledWorkouts,
  allData,
}

/// Service for exporting and managing user data
abstract class DataExportService {
  /// Exports all user data to a JSON file
  Future<File> exportToJson();

  /// Exports all user data to CSV files (one per data type)
  Future<List<File>> exportToCsv();

  /// Deletes all user data
  Future<void> deleteAllData();

  /// Deletes data of a specific type
  Future<void> deleteDataByType(DataType type);

  /// Gets a summary of all stored data
  Future<DataSummary> getDataSummary();
}

/// Implementation of DataExportService
class DataExportServiceImpl implements DataExportService {
  final AppDatabase _database;
  final Talker _talker;

  DataExportServiceImpl({
    required AppDatabase database,
    required Talker talker,
  })  : _database = database,
        _talker = talker;

  @override
  Future<File> exportToJson() async {
    _talker.info('Starting JSON export...');

    try {
      final exportData = <String, dynamic>{};

      // Export user profile
      final userProfile = await _database.getUserProfile();
      if (userProfile != null) {
        exportData['userProfile'] = {
          'id': userProfile.id,
          'createdAt': userProfile.createdAt.toIso8601String(),
          'updatedAt': userProfile.updatedAt.toIso8601String(),
          'height': userProfile.height,
          'age': userProfile.age,
          'gender': userProfile.gender,
          'timezone': userProfile.timezone,
          'goalsJson': userProfile.goalsJson,
          'aiPreferencesJson': userProfile.aiPreferencesJson,
        };
      }

      // Export daily logs
      final dailyLogs = await _database.getDailyLogsInRange(
        DateTime(2000),
        DateTime(2100),
      );
      exportData['dailyLogs'] = dailyLogs.map((log) => {
        'id': log.id,
        'date': log.date.toIso8601String(),
        'weight': log.weight,
        'notes': log.notes,
        'moodEnergy': log.moodEnergy,
        'hunger': log.hunger,
        'stress': log.stress,
        'symptomsJson': log.symptomsJson,
      }).toList();

      // Export meal templates
      if (userProfile != null) {
        final templates = await _database.getMealTemplates(userProfile.id);
        exportData['mealTemplates'] = templates.map((t) => {
          'id': t.id,
          'name': t.name,
          'itemsJson': t.itemsJson,
          'usageCount': t.usageCount,
          'createdAt': t.createdAt.toIso8601String(),
        }).toList();
      }

      // Add metadata
      exportData['metadata'] = {
        'exportedAt': DateTime.now().toIso8601String(),
        'version': '1.0',
        'appVersion': '1.0.0',
      };

      // Write to file
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
      final file = File('${directory.path}/health_keeper_export_$timestamp.json');

      await file.writeAsString(
        const JsonEncoder.withIndent('  ').convert(exportData),
      );

      _talker.info('JSON export completed: ${file.path}');
      return file;
    } catch (e, stack) {
      _talker.error('JSON export failed', e, stack);
      rethrow;
    }
  }

  @override
  Future<List<File>> exportToCsv() async {
    _talker.info('Starting CSV export...');

    try {
      final files = <File>[];
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');

      // Export daily logs
      final dailyLogs = await _database.getDailyLogsInRange(
        DateTime(2000),
        DateTime(2100),
      );

      if (dailyLogs.isNotEmpty) {
        final csvContent = StringBuffer();
        csvContent.writeln('id,date,weight,moodEnergy,hunger,stress,notes');

        for (final log in dailyLogs) {
          csvContent.writeln(
            '${log.id},'
            '${log.date.toIso8601String()},'
            '${log.weight ?? ""},'
            '${log.moodEnergy ?? ""},'
            '${log.hunger ?? ""},'
            '${log.stress ?? ""},'
            '"${(log.notes ?? "").replaceAll('"', '""')}"',
          );
        }

        final file = File('${directory.path}/daily_logs_$timestamp.csv');
        await file.writeAsString(csvContent.toString());
        files.add(file);
      }

      _talker.info('CSV export completed: ${files.length} files');
      return files;
    } catch (e, stack) {
      _talker.error('CSV export failed', e, stack);
      rethrow;
    }
  }

  @override
  Future<void> deleteAllData() async {
    _talker.warning('Deleting all user data...');

    try {
      await _database.deleteAllUserData();
      _talker.info('All user data deleted successfully');
    } catch (e, stack) {
      _talker.error('Failed to delete all data', e, stack);
      rethrow;
    }
  }

  @override
  Future<void> deleteDataByType(DataType type) async {
    _talker.warning('Deleting data of type: $type');

    try {
      switch (type) {
        case DataType.mealLogs:
          // TODO: Implement meal logs deletion
          break;
        case DataType.workoutLogs:
          // TODO: Implement workout logs deletion
          break;
        case DataType.progressPhotos:
          // TODO: Implement progress photos deletion
          break;
        case DataType.journalEntries:
          // TODO: Implement journal entries deletion
          break;
        case DataType.medications:
          // TODO: Implement medications deletion
          break;
        case DataType.supplements:
          // TODO: Implement supplements deletion
          break;
        case DataType.scheduledWorkouts:
          // TODO: Implement scheduled workouts deletion
          break;
        case DataType.allData:
          await deleteAllData();
          break;
      }

      _talker.info('Data of type $type deleted successfully');
    } catch (e, stack) {
      _talker.error('Failed to delete data of type $type', e, stack);
      rethrow;
    }
  }

  @override
  Future<DataSummary> getDataSummary() async {
    _talker.info('Getting data summary...');

    try {
      final summaryMap = await _database.getDataSummary();

      final dailyLogs = summaryMap['dailyLogs'] ?? 0;
      final mealLogs = summaryMap['mealLogs'] ?? 0;
      final workoutLogs = summaryMap['workoutLogs'] ?? 0;
      final progressPhotos = summaryMap['progressPhotos'] ?? 0;
      final journalEntries = summaryMap['journalEntries'] ?? 0;
      final medications = summaryMap['medications'] ?? 0;
      final supplements = summaryMap['supplements'] ?? 0;
      final scheduledWorkouts = summaryMap['scheduledWorkouts'] ?? 0;

      final totalRecords = dailyLogs + mealLogs + workoutLogs +
          progressPhotos + journalEntries + medications +
          supplements + scheduledWorkouts;

      return DataSummary(
        totalRecords: totalRecords,
        dailyLogs: dailyLogs,
        mealLogs: mealLogs,
        workoutLogs: workoutLogs,
        progressPhotos: progressPhotos,
        journalEntries: journalEntries,
        medications: medications,
        supplements: supplements,
        scheduledWorkouts: scheduledWorkouts,
      );
    } catch (e, stack) {
      _talker.error('Failed to get data summary', e, stack);
      rethrow;
    }
  }
}
