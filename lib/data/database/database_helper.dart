import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../core/constants/app_constants.dart';

/// Database helper for SQLite operations
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  
  DatabaseHelper._init();
  
  /// Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }
  
  /// Initialize database
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, AppConstants.databaseName);
    
    return await openDatabase(
      path,
      version: AppConstants.databaseVersion,
      onCreate: _createDB,
    );
  }
  
  /// Create database tables
  Future<void> _createDB(Database db, int version) async {
    // Create classes table
    await db.execute('''
      CREATE TABLE classes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        year TEXT NOT NULL,
        tutor_name TEXT NOT NULL
      )
    ''');
    
    // Create roll_numbers table
    await db.execute('''
      CREATE TABLE roll_numbers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        class_id INTEGER NOT NULL,
        roll_number INTEGER NOT NULL,
        FOREIGN KEY (class_id) REFERENCES classes (id) ON DELETE CASCADE
      )
    ''');
    
    // Create students table
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        class_id INTEGER NOT NULL,
        roll_number INTEGER NOT NULL,
        name TEXT,
        father_name TEXT,
        contact TEXT,
        address TEXT,
        comments TEXT,
        color_tag TEXT,
        photo_path TEXT,
        attendance_percentage REAL,
        last_updated TEXT,
        FOREIGN KEY (class_id) REFERENCES classes (id) ON DELETE CASCADE
      )
    ''');
    
    // Pre-populate classes and roll numbers
    await _populateInitialData(db);
  }
  
  /// Populate initial data
  Future<void> _populateInitialData(Database db) async {
    final classes = AppConstants.getAllClasses();
    
    for (var classData in classes) {
      // Insert class
      final classId = await db.insert('classes', {
        'name': classData['name'],
        'year': classData['year'],
        'tutor_name': AppConstants.defaultTutorName,
      });
      
      // Insert roll numbers (1-55)
      for (int rollNumber = 1; rollNumber <= AppConstants.totalRollCount; rollNumber++) {
        await db.insert('roll_numbers', {
          'class_id': classId,
          'roll_number': rollNumber,
        });
      }
    }
  }
  
  /// Close database
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
  
  /// Delete database
  Future<void> deleteDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, AppConstants.databaseName);
    await deleteDatabase(path);
    _database = null;
  }
}
