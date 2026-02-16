/// Student model representing a student in the database
class StudentModel {
  final int? id;
  final int classId;
  final int rollNumber;
  final String? name;
  final String? fatherName;
  final String? contact;
  final String? address;
  final String? comments;
  final String? colorTag;
  final String? photoPath;
  final double? attendancePercentage;
  final String? lastUpdated;
  
  StudentModel({
    this.id,
    required this.classId,
    required this.rollNumber,
    this.name,
    this.fatherName,
    this.contact,
    this.address,
    this.comments,
    this.colorTag,
    this.photoPath,
    this.attendancePercentage,
    this.lastUpdated,
  });
  
  /// Check if student has data
  bool get hasData => name != null && name!.isNotEmpty;
  
  /// Convert model to map for database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'class_id': classId,
      'roll_number': rollNumber,
      'name': name,
      'father_name': fatherName,
      'contact': contact,
      'address': address,
      'comments': comments,
      'color_tag': colorTag,
      'photo_path': photoPath,
      'attendance_percentage': attendancePercentage,
      'last_updated': lastUpdated,
    };
  }
  
  /// Create model from database map
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] as int?,
      classId: map['class_id'] as int,
      rollNumber: map['roll_number'] as int,
      name: map['name'] as String?,
      fatherName: map['father_name'] as String?,
      contact: map['contact'] as String?,
      address: map['address'] as String?,
      comments: map['comments'] as String?,
      colorTag: map['color_tag'] as String?,
      photoPath: map['photo_path'] as String?,
      attendancePercentage: map['attendance_percentage'] as double?,
      lastUpdated: map['last_updated'] as String?,
    );
  }
  
  /// Create copy with modified fields
  StudentModel copyWith({
    int? id,
    int? classId,
    int? rollNumber,
    String? name,
    String? fatherName,
    String? contact,
    String? address,
    String? comments,
    String? colorTag,
    String? photoPath,
    double? attendancePercentage,
    String? lastUpdated,
  }) {
    return StudentModel(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      rollNumber: rollNumber ?? this.rollNumber,
      name: name ?? this.name,
      fatherName: fatherName ?? this.fatherName,
      contact: contact ?? this.contact,
      address: address ?? this.address,
      comments: comments ?? this.comments,
      colorTag: colorTag ?? this.colorTag,
      photoPath: photoPath ?? this.photoPath,
      attendancePercentage: attendancePercentage ?? this.attendancePercentage,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
