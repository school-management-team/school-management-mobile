

class GradesDataModel {
  final int semester;
  final String semesterLabel;
  final double averageGrade100;
  final List<SubjectModel> subjects;

  GradesDataModel({
    required this.semester,
    required this.semesterLabel,
    required this.averageGrade100,
    required this.subjects,
  });

  factory GradesDataModel.fromJson(Map<String, dynamic> json) {
    return GradesDataModel(
      semester: json['semester'] ?? 0,
      semesterLabel: json['semester_label'] ?? '',
      averageGrade100: (json['average_grade_100'] as num?)?.toDouble() ?? 0.0,
      subjects: (json['subjects'] as List<dynamic>?)
              ?.map((e) => SubjectModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class SubjectModel {
  final String subject;
  final double totalValue;
  final double passingGrade;
  final bool passed;

  SubjectModel({
    required this.subject,
    required this.totalValue,
    required this.passingGrade,
    required this.passed,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subject: json['subject'] ?? '',
      totalValue: (json['total_value'] as num?)?.toDouble() ?? 0.0,
      passingGrade: (json['passing_grade'] as num?)?.toDouble() ?? 0.0,
      passed: json['passed'] ?? false,
    );
  }
}