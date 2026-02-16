import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/widgets/app_bar_widget.dart';
import '../../data/models/class_model.dart';
import '../../domain/providers/student_provider.dart';
import 'student_detail_screen.dart';

class ClassScreen extends ConsumerWidget {
  final ClassModel classModel;
  const ClassScreen({super.key, required this.classModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(studentsProvider(classModel.id!));

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF006400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classModel.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  classModel.year,
                  style: const TextStyle(color: Colors.white70),
                ),
                Text(
                  'Tutor: ${classModel.tutorName}',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: studentsAsync.when(
              data: (students) => ListView.builder(
                itemCount: 55,
                itemBuilder: (context, index) {
                  final rollNumber = index + 1;
                  final student = students.firstWhere(
                    (s) => s.rollNumber == rollNumber,
                    orElse: () => students[index],
                  );
                  return ListTile(
                    leading: CircleAvatar(child: Text('$rollNumber')),
                    title: Text(student.name ?? 'Roll $rollNumber'),
                    trailing: student.colorTag != null
                        ? Icon(Icons.circle, color: _getColor(student.colorTag!))
                        : null,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StudentDetailScreen(
                          classModel: classModel,
                          rollNumber: rollNumber,
                        ),
                      ),
                    ),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'red': return Colors.red;
      case 'yellow': return Colors.amber;
      case 'green': return Colors.green;
      case 'blue': return Colors.blue;
      case 'purple': return Colors.purple;
      default: return Colors.grey;
    }
  }
}
