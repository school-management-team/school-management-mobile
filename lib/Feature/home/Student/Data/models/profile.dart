class StudentProfileResponseModel {
  final bool success;
  final StudentProfileDataModel data;

  StudentProfileResponseModel({
    required this.success,
    required this.data,
  });

  factory StudentProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return StudentProfileResponseModel(
      success: json['success'] ?? false,
      data: StudentProfileDataModel.fromJson(json['data'] ?? {}),
    );
  }
}

class StudentProfileDataModel {
  final String userName;
  final String? profilePhotoUrl;
  final String studentNumber;
  final String className;
  final String stage;
  final String? track;
  final String section;
  final String enrollmentDate;
  final String status;

  StudentProfileDataModel({
    required this.userName,
    this.profilePhotoUrl,
    required this.studentNumber,
    required this.className,
    required this.stage,
    this.track,
    required this.section,
    required this.enrollmentDate,
    required this.status,
  });

  factory StudentProfileDataModel.fromJson(Map<String, dynamic> json) {
    return StudentProfileDataModel(
      userName: json['user_name'] ?? '',
      profilePhotoUrl: json['profile_photo_url'],
      studentNumber: json['student_number'] ?? '',
      className: json['class'] ?? '',
      stage: json['stage'] ?? '',
      track: json['track'],
      section: json['section'] ?? '',
      enrollmentDate: json['enrollment_date'] ?? '',
      status: json['status'] ?? '',
    );
  }
}