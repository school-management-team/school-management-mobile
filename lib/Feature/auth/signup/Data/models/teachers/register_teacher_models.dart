class TeacherRegistrationModel {
  final String email;
  final String password;
  final String passwordConfirmation;
  final String phone;
  final String userName;
  final String gender;
  final String birthDate;
  final int stageId;
  final int subjectId;
  final String? cv;
  final String? legalDocumentPath;

  TeacherRegistrationModel({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    required this.userName,
    required this.gender,
    required this.birthDate,
    required this.stageId,
    required this.subjectId,
    this.cv,
    this.legalDocumentPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phone': phone,
      'user_name': userName,
      'gender': gender,
      'birth_date': birthDate,
      'stage_id': stageId,
      'subject_id': subjectId,
      'cv': cv ?? '',
      'legal_document_path': legalDocumentPath ?? '',
    };
  }
}