import 'package:intl/intl.dart';

/// Date formatting utilities
class DateFormatter {
  /// Format datetime for display
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
  }
  
  /// Format date only
  static String formatDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }
  
  /// Format for PDF footer
  static String formatForPDF(DateTime dateTime) {
    return DateFormat('dd MMMM yyyy').format(dateTime);
  }
  
  /// Format for backup filename
  static String formatForBackup(DateTime dateTime) {
    return DateFormat('yyyyMMdd_HHmmss').format(dateTime);
  }
  
  /// Get current timestamp
  static String getCurrentTimestamp() {
    return formatDateTime(DateTime.now());
  }
}
