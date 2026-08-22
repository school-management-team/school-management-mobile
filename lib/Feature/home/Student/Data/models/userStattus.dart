class UserStatusModel {
  final bool success;
  final String userStatus;

  UserStatusModel({
    required this.success,
    required this.userStatus,
  });


  factory UserStatusModel.fromJson(Map<String, dynamic> json) {
    return UserStatusModel(
      success: json['success'] ?? false,
      userStatus: json['user_status'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'user_status': userStatus,
    };
  }
}