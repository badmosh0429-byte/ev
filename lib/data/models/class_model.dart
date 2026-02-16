/// Class model representing a class in the database
class ClassModel {
  final int? id;
  final String name;
  final String year;
  final String tutorName;
  
  ClassModel({
    this.id,
    required this.name,
    required this.year,
    required this.tutorName,
  });
  
  /// Convert model to map for database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'tutor_name': tutorName,
    };
  }
  
  /// Create model from database map
  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      year: map['year'] as String,
      tutorName: map['tutor_name'] as String,
    );
  }
  
  /// Create copy with modified fields
  ClassModel copyWith({
    int? id,
    String? name,
    String? year,
    String? tutorName,
  }) {
    return ClassModel(
      id: id ?? this.id,
      name: name ?? this.name,
      year: year ?? this.year,
      tutorName: tutorName ?? this.tutorName,
    );
  }
}
