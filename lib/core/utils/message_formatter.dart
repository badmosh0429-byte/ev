import '../constants/app_constants.dart';

/// Message formatting utilities for SMS/WhatsApp
class MessageFormatter {
  /// Format student message for communication
  static String formatStudentMessage({
    required String hodName,
    required String studentName,
    required int rollNumber,
    required String className,
    String? status,
    String? comment,
    double? attendancePercentage,
  }) {
    final buffer = StringBuffer();
    
    buffer.writeln('Dear Parent/Guardian,');
    buffer.writeln();
    buffer.writeln('Student Information:');
    buffer.writeln('Name: $studentName');
    buffer.writeln('Roll No: $rollNumber');
    buffer.writeln('Class: $className');
    
    if (status != null && status.isNotEmpty) {
      buffer.writeln('Status: $status');
    }
    
    if (attendancePercentage != null) {
      buffer.writeln('Attendance: ${attendancePercentage.toStringAsFixed(1)}%');
    }
    
    if (comment != null && comment.isNotEmpty) {
      buffer.writeln();
      buffer.writeln('Remarks: $comment');
    }
    
    buffer.writeln();
    buffer.writeln('---');
    buffer.writeln('Sent by: $hodName');
    buffer.writeln(AppConstants.institutionName);
    
    return buffer.toString();
  }
}
