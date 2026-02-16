import '../database/database_helper.dart';
import '../models/student_model.dart';
import '../../core/utils/date_formatter.dart';

class StudentRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  
  Future<List<StudentModel>> getStudentsByClass(int classId) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'students',
      where: 'class_id = ?',
      whereArgs: [classId],
      orderBy: 'roll_number ASC',
    );
    
    if (result.isNotEmpty) {
      return result.map((map) => StudentModel.fromMap(map)).toList();
    }
    
    final List<StudentModel> students = [];
    for (int i = 1; i <= 55; i++) {
      students.add(StudentModel(
        classId: classId,
        rollNumber: i,
      ));
    }
    return students;
  }
  
  Future<StudentModel?> getStudent(int classId, int rollNumber) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'students',
      where: 'class_id = ? AND roll_number = ?',
      whereArgs: [classId, rollNumber],
    );
    
    if (result.isNotEmpty) {
      return StudentModel.fromMap(result.first);
    }
    return StudentModel(classId: classId, rollNumber: rollNumber);
  }
  
  Future<void> upsertStudent(StudentModel student) async {
    final db = await _dbHelper.database;
    final timestamp = DateFormatter.getCurrentTimestamp();
    
    final studentWithTimestamp = student.copyWith(lastUpdated: timestamp);
    
    final existing = await db.query(
      'students',
      where: 'class_id = ? AND roll_number = ?',
      whereArgs: [student.classId, student.rollNumber],
    );
    
    if (existing.isNotEmpty) {
      await db.update(
        'students',
        studentWithTimestamp.toMap(),
        where: 'class_id = ? AND roll_number = ?',
        whereArgs: [student.classId, student.rollNumber],
      );
    } else {
      await db.insert('students', studentWithTimestamp.toMap());
    }
  }
  
  Future<void> deleteStudent(int classId, int rollNumber) async {
    final db = await _dbHelper.database;
    await db.delete(
      'students',
      where: 'class_id = ? AND roll_number = ?',
      whereArgs: [classId, rollNumber],
    );
  }
  
  Future<List<StudentModel>> searchStudents(String query) async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery('''
      SELECT * FROM students 
      WHERE name LIKE ? OR roll_number LIKE ?
      ORDER BY class_id, roll_number
    ''', ['%$query%', '%$query%']);
    
    return result.map((map) => StudentModel.fromMap(map)).toList();
  }
}
