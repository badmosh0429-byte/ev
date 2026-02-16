import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/class_model.dart';
import '../../data/repositories/class_repository.dart';

final classRepoProvider = Provider((ref) => ClassRepository());

final classListProvider = FutureProvider<List<ClassModel>>((ref) async {
  final repo = ref.read(classRepoProvider);
  return await repo.getAllClasses();
});

final classStatsProvider = FutureProvider.family<Map<String, int>, int>((ref, classId) async {
  final repo = ref.read(classRepoProvider);
  return await repo.getClassStatistics(classId);
});
