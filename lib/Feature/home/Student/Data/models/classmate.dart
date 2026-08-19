class ClassmateModel {
  final int? id;
  final String? name;
  final String? phone;
  final String? image;

  ClassmateModel({
    this.id,
    this.name,
    this.phone,
    this.image,
  });

  factory ClassmateModel.fromJson(Map<String, dynamic> json) {
    return ClassmateModel(
      id: json['student_id'],
      name: json['user_name'],
      phone: json['phone'],
      image: json['profile_photo_url'],
    );
  }
}