import '../database/database_helper.dart';
import '../models/class_model.dart';

/// Repository for class operations
class ClassRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  
  /// Get all classes
  Future<List<ClassModel>> getAllClasses() async {
    final db = await _dbHelper.database;
    final result = await db.query('classes', orderBy: 'id ASC');
    return result.map((map) => ClassModel.fromMap(map)).toList();
  }
  
  /// Get class by ID
  Future<ClassModel?> getClassById(int id) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'classes',
      where: 'id = ?',
      whereArgs: [id],
    );
    
    if (result.isNotEmpty) {
      return ClassModel.fromMap(result.first);
    }
    return null;
  }
  
  /// Update tutor name
  Future<void> updateTutorName(int classId, String tutorName) async {
    final db = await _dbHelper.database;
    await db.update(
      'classes',
      {'tutor_name': tutorName},
      where: 'id = ?',
      whereArgs: [classId],
    );
  }
  
  /// Get class statistics
  Future<Map<String, int>> getClassStatistics(int classId) async {
    final db = await _dbHelper.database;
    
    final redCount = await db.rawQuery(
      'SELECT COUNT(*) as count FROM students WHERE class_id = ? AND color_tag = ?',
      [classId, 'Red'],
    );
    
    final yellowCount = await db.rawQuery(
      'SELECT COUNT(*) as count FROM students WHERE class_id = ? AND color_tag = ?',
      [classId, 'Yellow'],
    );
    
    final greenCount = await db.rawQuery(
      'SELECT COUNT(*) as count FROM students WHERE class_id = ? AND color_tag = ?',
      [classId, 'Green'],
    );
    
    final totalStudents = await db.rawQuery(
      'SELECT COUNT(*) as count FROM students WHERE class_id = ? AND name IS NOT NULL',
      [classId],
    );
    
    return {
      'red': redCount.first['count'] as int,
      'yellow': yellowCount.first['count'] as int,
      'green': greenCount.first['count'] as int,
      'total': totalStudents.first['count'] as int,
    };
  }
}
