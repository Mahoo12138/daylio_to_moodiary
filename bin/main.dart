import 'dart:io';
import 'package:isar/isar.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:daylio_to_moodiary/models/category.dart';
import 'package:daylio_to_moodiary/models/diary.dart';
import 'package:daylio_to_moodiary/utils/screen.dart';
import 'package:daylio_to_moodiary/utils/prompt.dart';


void main(List<String> arguments) async {

  try {
    printLogo();

    String sqlitePath = promptDatabasePath();
    print('Selected database path: $sqlitePath');

    final sqliteDb = sqlite3.open(sqlitePath);
    
    final isar = await Isar.open(
      schemas: [DiarySchema, CategorySchema],
      directory: Directory.current.path,
    );

    print('Migration completed successfully');
  } catch (e) {
    print('Migration failed: $e');
  } finally {
    // sqliteDb.dispose();
    // await isar.close();
  }
}
