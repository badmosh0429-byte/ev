import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/student_model.dart';
import '../../data/repositories/student_repository.dart';

final studentRepoProvider = Provider((ref) => StudentRepository());

final studentsProvider = FutureProvider.family<List<StudentModel>, int>((ref, classId) async {
  final repo = ref.read(studentRepoProvider);
  return await repo.getStudentsByClass(classId);
});
