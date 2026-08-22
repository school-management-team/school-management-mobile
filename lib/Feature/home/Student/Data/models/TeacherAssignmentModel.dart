class TeacherAssignmentModel {
  final int id;
  final int userId;
  final int subjectId;
  final int stageId;
  final String cv;
  final String legalDocumentPath;
  final String createdAt;
  final String updatedAt;
  final UserModel user;
  final SubjectModel subject;

  TeacherAssignmentModel({
    required this.id,
    required this.userId,
    required this.subjectId,
    required this.stageId,
    required this.cv,
    required this.legalDocumentPath,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.subject,
  });

  factory TeacherAssignmentModel.fromJson(Map<String, dynamic> json) {
    return TeacherAssignmentModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      subjectId: json['subject_id'] ?? 0,
      stageId: json['stage_id'] ?? 0,
      cv: json['cv'] ?? '',
      legalDocumentPath: json['legal_document_path'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      user: UserModel.fromJson(json['user'] ?? {}),
      subject: SubjectModel.fromJson(json['subject'] ?? {}),
    );
  }
}

class UserModel {
  final int id;
  final String userName;

  UserModel({required this.id, required this.userName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      userName: json['user_name'] ?? '',
    );
  }
}

class SubjectModel {
  final int id;
  final String name;

  SubjectModel({required this.id, required this.name});

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}