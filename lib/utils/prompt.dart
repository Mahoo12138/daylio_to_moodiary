import 'dart:io';

String promptDatabasePath() {
  while (true) {
    print('\nPlease enter the full path to your SQLite database file:');
    print('(Example: C:\\Users\\YourName\\Documents\\daylio.db)');
    
    String? input = stdin.readLineSync()?.trim();
    
    if (input == null || input.isEmpty) {
      print('Path cannot be empty. Please try again.');
      continue;
    }
    
    File file = File(input);
    
    if (!file.existsSync()) {
      print('Error: File does not exist. Please check the path and try again.');
      continue;
    }
    
    if (!input.toLowerCase().endsWith('.db')) {
      print('Warning: The file does not have a .db extension. Are you sure this is correct? (y/n)');
      String? confirm = stdin.readLineSync()?.toLowerCase();
      if (confirm != 'y') {
        continue;
      }
    }
    
    return input;
  }
}