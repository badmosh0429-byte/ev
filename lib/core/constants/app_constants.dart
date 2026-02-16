/// Application constants
class AppConstants {
  // App Information
  static const String appName = 'EV - Student Manager';
  static const String appBarTitle = 
      'EV - Student Manager | Government College of Technology Sahiwal';
  static const String packageName = 'com.ev.studentmanager';
  static const String appVersion = '1.0.0';
  static const String buildVersion = '1';
  
  // Institution Information
  static const String institutionName = 'Government College of Technology Sahiwal';
  
  // Developer Information
  static const String developerName = 'Meesam Raza';
  static const String developerSession = '2023–2026';
  static const String developerRollNo = '23ER101';
  static const String developerProgram = 'DAE Electrical Engineering';
  
  // Years
  static const List<String> years = [
    'First Year',
    'Second Year',
    'Third Year',
  ];
  
  // Class names
  static const List<String> firstYearClasses = ['FE-1', 'FE-2', 'FE-3', 'FE-4'];
  static const List<String> secondYearClasses = ['SE-1', 'SE-2', 'SE-3', 'SE-4'];
  static const List<String> thirdYearClasses = ['DE-1', 'DE-2', 'DE-3', 'DE-4'];
  
  // Roll numbers
  static const int standardRollCount = 50;
  static const int additionalRollCount = 5;
  static const int totalRollCount = 55;
  
  // Color tags
  static const List<String> colorTags = [
    'Red',
    'Yellow',
    'Green',
    'Blue',
    'Purple',
  ];
  
  // Settings keys
  static const String keyPIN = 'secure_pin';
  static const String keyHODName = 'hod_name';
  static const String keyThemeMode = 'theme_mode';
  static const String keyFirstLaunch = 'first_launch';
  
  // Database
  static const String databaseName = 'student_manager.db';
  static const int databaseVersion = 1;
  
  // Default values
  static const String defaultHODName = 'Head of Department';
  static const String defaultTutorName = 'Not Assigned';
  
  // PDF Settings
  static const String pdfFooterText = 'Government College of Technology Sahiwal';
  static const String pdfSubtitle = 'Official Academic Record';
  
  // Get all classes
  static List<Map<String, String>> getAllClasses() {
    final List<Map<String, String>> classes = [];
    
    for (var className in firstYearClasses) {
      classes.add({'name': className, 'year': 'First Year'});
    }
    
    for (var className in secondYearClasses) {
      classes.add({'name': className, 'year': 'Second Year'});
    }
    
    for (var className in thirdYearClasses) {
      classes.add({'name': className, 'year': 'Third Year'});
    }
    
    return classes;
  }
}
