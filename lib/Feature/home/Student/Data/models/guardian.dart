class StudentGuardianResponseModel {
  final bool success;
  final String message;
  final StudentGuardianData data;

  StudentGuardianResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory StudentGuardianResponseModel.fromJson(Map<String, dynamic> json) {
    return StudentGuardianResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null 
          ? StudentGuardianData.fromJson(json['data']) 
          : StudentGuardianData(name: '', relationship: '', phone: '', email: ''),
    );
  }
}

class StudentGuardianData {
  final String name;
  final String relationship;
  final String phone;
  final String email;

  StudentGuardianData({
    required this.name,
    required this.relationship,
    required this.phone,
    required this.email,
  });

  factory StudentGuardianData.fromJson(Map<String, dynamic> json) {
    return StudentGuardianData(
      name: json['name'] ?? '',
      relationship: json['relationship'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
    );
  }
}