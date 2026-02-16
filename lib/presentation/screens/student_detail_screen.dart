import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/widgets/app_bar_widget.dart';
import '../../core/widgets/color_tag_selector.dart';
import '../../data/models/class_model.dart';
import '../../data/models/student_model.dart';
import '../../data/repositories/student_repository.dart';
import '../../services/camera_service.dart';
import '../../core/utils/date_formatter.dart';

class StudentDetailScreen extends ConsumerStatefulWidget {
  final ClassModel classModel;
  final int rollNumber;
  const StudentDetailScreen({super.key, required this.classModel, required this.rollNumber});
  @override
  ConsumerState<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends ConsumerState<StudentDetailScreen> {
  final _nameController = TextEditingController();
  final _fatherController = TextEditingController();
  final _contactController = TextEditingController();
  final _addressController = TextEditingController();
  final _commentsController = TextEditingController();
  final _attendanceController = TextEditingController();
  String? _selectedTag;
  String? _photoPath;
  final _repo = StudentRepository();
  final _cameraService = CameraService();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStudent();
  }

  Future<void> _loadStudent() async {
    final student = await _repo.getStudent(widget.classModel.id!, widget.rollNumber);
    if (student != null) {
      _nameController.text = student.name ?? '';
      _fatherController.text = student.fatherName ?? '';
      _contactController.text = student.contact ?? '';
      _addressController.text = student.address ?? '';
      _commentsController.text = student.comments ?? '';
      _attendanceController.text = student.attendancePercentage?.toString() ?? '';
      _selectedTag = student.colorTag;
      _photoPath = student.photoPath;
    }
    setState(() => _isLoading = false);
  }

  Future<void> _saveStudent() async {
    final student = StudentModel(
      classId: widget.classModel.id!,
      rollNumber: widget.rollNumber,
      name: _nameController.text,
      fatherName: _fatherController.text,
      contact: _contactController.text,
      address: _addressController.text,
      comments: _commentsController.text,
      colorTag: _selectedTag,
      photoPath: _photoPath,
      attendancePercentage: double.tryParse(_attendanceController.text),
      lastUpdated: DateFormatter.getCurrentTimestamp(),
    );
    await _repo.upsertStudent(student);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student saved successfully')),
      );
      Navigator.pop(context);
    }
  }

  Future<void> _capturePhoto() async {
    final path = await _cameraService.capturePhoto();
    if (path != null) {
      setState(() => _photoPath = path);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _capturePhoto,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _photoPath != null ? FileImage(File(_photoPath!)) : null,
                child: _photoPath == null ? const Icon(Icons.camera_alt, size: 40) : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _fatherController,
              decoration: const InputDecoration(labelText: "Father's Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _contactController,
              decoration: const InputDecoration(labelText: 'Contact'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _commentsController,
              decoration: const InputDecoration(labelText: 'Comments'),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _attendanceController,
              decoration: const InputDecoration(labelText: 'Attendance %'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const Text('Color Tag:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ColorTagSelector(
              selectedTag: _selectedTag,
              onTagSelected: (tag) => setState(() => _selectedTag = tag),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _saveStudent,
              child: const Text('Save Student'),
            ),
          ],
        ),
      ),
    );
  }
}
