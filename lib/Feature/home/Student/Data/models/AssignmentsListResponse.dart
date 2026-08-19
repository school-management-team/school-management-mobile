class AssignmentsListResponse {
  final bool success;
  final List<AssignmentModel> data;

  AssignmentsListResponse({
    required this.success,
    required this.data,
  });

  factory AssignmentsListResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List? ?? [];
    List<AssignmentModel> dataList =
        list.map((i) => AssignmentModel.fromJson(i)).toList();

    return AssignmentsListResponse(
      success: json['success'] ?? false,
      data: dataList,
    );
  }
}

class AssignmentModel {
  final int id;
  final int teacherAssignmentId;
  final String title;
  final String description;
  final String dueDate;
  final int maxGrade;
  final String? attachmentPath;
  final String? attachmentLink;
  final String createdAt;
  final String updatedAt;
  final String status;
  final bool isUrgent;
  final String? attachmentUrl;
  final TeacherAssignment teacherAssignment;

  AssignmentModel({
    required this.id,
    required this.teacherAssignmentId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.maxGrade,
    this.attachmentPath,
    this.attachmentLink,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.isUrgent,
    this.attachmentUrl,
    required this.teacherAssignment,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      id: json['id'] ?? 0,
      teacherAssignmentId: json['teacher_assignment_id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      dueDate: json['due_date'] ?? '',
      maxGrade: json['max_grade'] ?? 0,
      attachmentPath: json['attachment_path'],
      attachmentLink: json['attachment_link'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      status: json['status'] ?? '',
      isUrgent: json['is_urgent'] ?? false,
      attachmentUrl: json['attachment_url'],
      teacherAssignment: TeacherAssignment.fromJson(json['teacher_assignment'] ?? {}),
    );
  }
}

class TeacherAssignment {
  final int id;
  final int teacherId;
  final int subjectId;
  final int sectionId;
  final String createdAt;
  final String updatedAt;
  final Subject subject;

  TeacherAssignment({
    required this.id,
    required this.teacherId,
    required this.subjectId,
    required this.sectionId,
    required this.createdAt,
    required this.updatedAt,
    required this.subject,
  });

  factory TeacherAssignment.fromJson(Map<String, dynamic> json) {
    return TeacherAssignment(
      id: json['id'] ?? 0,
      teacherId: json['teacher_id'] ?? 0,
      subjectId: json['subject_id'] ?? 0,
      sectionId: json['section_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      subject: Subject.fromJson(json['subject'] ?? {}),
    );
  }
}

class Subject {
  final int id;
  final String name;

  Subject({
    required this.id,
    required this.name,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}