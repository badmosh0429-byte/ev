import 'package:flutter/material.dart';

/// Application color constants
class AppColors {
  // Primary color - Dark Government Green
  static const Color primaryGreen = Color(0xFF006400);
  
  // Color tags for student behavior
  static const Color redTag = Colors.red;
  static const Color yellowTag = Colors.amber;
  static const Color greenTag = Colors.green;
  static const Color blueTag = Colors.blue;
  static const Color purpleTag = Colors.purple;
  
  // Background shades for color tags
  static final Color redBackground = Colors.red[50]!;
  static final Color yellowBackground = Colors.amber[50]!;
  static final Color greenBackground = Colors.green[50]!;
  static final Color blueBackground = Colors.blue[50]!;
  static final Color purpleBackground = Colors.purple[50]!;
  
  // Get background color for a tag
  static Color getBackgroundForTag(String? tag) {
    switch (tag?.toLowerCase()) {
      case 'red':
        return redBackground;
      case 'yellow':
        return yellowBackground;
      case 'green':
        return greenBackground;
      case 'blue':
        return blueBackground;
      case 'purple':
        return purpleBackground;
      default:
        return Colors.white;
    }
  }
  
  // Get color for a tag
  static Color getColorForTag(String? tag) {
    switch (tag?.toLowerCase()) {
      case 'red':
        return redTag;
      case 'yellow':
        return yellowTag;
      case 'green':
        return greenTag;
      case 'blue':
        return blueTag;
      case 'purple':
        return purpleTag;
      default:
        return Colors.grey;
    }
  }
}
