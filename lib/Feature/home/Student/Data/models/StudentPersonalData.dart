class StudentPersonalResponseModel {
  final bool success;
  final String message;
  final StudentPersonalData data;

  StudentPersonalResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory StudentPersonalResponseModel.fromJson(Map<String, dynamic> json) {
    return StudentPersonalResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: StudentPersonalData.fromJson(json['data'] ?? {}),
    );
  }
}

class StudentPersonalData {
  final int id;
  final String studentNumber;
  final String? fatherName;
  final String? motherName;
  final String? nationality;
  final String? nationalId;
  final String? address;
  final String? medicalNotes;
  final String enrollmentDate;

  StudentPersonalData({
    required this.id,
    required this.studentNumber,
    this.fatherName,
    this.motherName,
    this.nationality,
    this.nationalId,
    this.address,
    this.medicalNotes,
    required this.enrollmentDate,
  });

  factory StudentPersonalData.fromJson(Map<String, dynamic> json) {
    return StudentPersonalData(
      id: json['id'] ?? 0,
      studentNumber: json['student_number'] ?? '',
      fatherName: json['father_name'],
      motherName: json['mother_name'],
      nationality: json['nationality'],
      nationalId: json['national_id'],
      address: json['address'],
      medicalNotes: json['medical_notes'],
      enrollmentDate: json['enrollment_date'] ?? '',
    );
  }
}
