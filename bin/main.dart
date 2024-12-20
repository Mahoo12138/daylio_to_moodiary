import 'dart:io';
import 'package:isar/isar.dart';

import 'package:daylio_to_moodiary/migrations/daylio.dart';
import 'package:daylio_to_moodiary/models/category.dart';
import 'package:daylio_to_moodiary/models/diary.dart';
import 'package:daylio_to_moodiary/utils/screen.dart';
import 'package:daylio_to_moodiary/utils/prompt.dart';

void main(List<String> arguments) async {
  printLogo();
  try {
    // String sqlitePath = promptDatabasePath();
    String sqlitePath = 'E:/Workbench/daylio_to_moodiary/entries.db';
    print('Selected database path: $sqlitePath');

    await Isar.initialize('isar_windows_x64.dll');

    final isar = Isar.open(
      schemas: [DiarySchema, CategorySchema],
      directory: Directory.current.path,
    );

    final migration = DaylioMigration(sqlitePath: sqlitePath, isar: isar);

    await migration.migrate();

    print('Migration completed successfully');
  } catch (e) {
    print('Migration failed: $e');
  }
}
