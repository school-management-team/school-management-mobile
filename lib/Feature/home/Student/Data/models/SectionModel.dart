class SectionModel {
  final int id;
  final String name;
  final int capacity;
  final int classId;
  final String createdAt;
  final String updatedAt;
  final SchoolClassModel schoolClass;

  SectionModel({
    required this.id,
    required this.name,
    required this.capacity,
    required this.classId,
    required this.createdAt,
    required this.updatedAt,
    required this.schoolClass,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      capacity: json['capacity'] ?? 0,
      classId: json['class_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      schoolClass: SchoolClassModel.fromJson(json['school_class'] ?? {}),
    );
  }
}

class SchoolClassModel {
  final int id;
  final String name;
  final int gradeOrder;
  final int stageId;
  final String createdAt;
  final String updatedAt;

  SchoolClassModel({
    required this.id,
    required this.name,
    required this.gradeOrder,
    required this.stageId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SchoolClassModel.fromJson(Map<String, dynamic> json) {
    return SchoolClassModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      gradeOrder: json['grade_order'] ?? 0,
      stageId: json['stage_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}