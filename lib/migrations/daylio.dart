// lib/migration/sqlite_to_isar_migration.dart
import 'dart:ffi';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path/path.dart';
import 'package:sqlite3/open.dart';
import 'package:sqlite3/sqlite3.dart';

import '../../models/diary.dart';

class DaylioMigration {
  final String sqlitePath;
  final Isar isar;
  static const int BATCH_SIZE = 1000;

  DaylioMigration({required this.sqlitePath, required this.isar});

  init() async {
    open.overrideFor(OperatingSystem.windows, () {
      final scriptDir = File(Platform.script.toFilePath()).parent;
      final libraryNextToScript = File(join(scriptDir.path, 'sqlite3_windows_x64.dll'));
      return DynamicLibrary.open(libraryNextToScript.path);
    });

    return sqlite3.open(sqlitePath);
  }

  Future<void> migrate() async {
    final Database db = await init();

    final int totalEntries = db
        .select('SELECT COUNT(*) as count FROM table_entries')
        .first['count'] as int;

    for (int offset = 0; offset < totalEntries; offset += BATCH_SIZE) {
      final ResultSet entries = db.select('''
        SELECT id, note, date_time, mood 
        FROM table_entries
        LIMIT ? OFFSET ?
      ''', [BATCH_SIZE, offset]);

      for (final row in entries) {
        final ResultSet tagRows = db.select('''
          SELECT t.name 
          FROM table_tags t
          JOIN table_entries_with_tags et ON t.id = et.id_tag
          WHERE et.id_entry = ?
        ''', [row['id']]);

        final List<String> tags =
            tagRows.map((tagRow) => tagRow['name'] as String).toList();

        final diary = Diary()
          ..contentText = row['note'] ?? ''
          ..time = DateTime.fromMillisecondsSinceEpoch(row['date_time'] * 1000)
          ..mood = _normalizeMood(row['mood'])
          ..tags = tags;

        await isar.writeAsync((isar) async {
          isar.diarys.put(diary);
        });
      }

      print(
          'Migration ${offset + entries.length} / $totalEntries records successfully.');
    }

    db.dispose();
  }

  dispose() {
    isar.close();
  }

  // 将心情值标准化到0-1范围
  double _normalizeMood(int mood) {
    // 假设原始心情值范围是0-5
    return mood.toDouble() / 5.0;
  }
}
