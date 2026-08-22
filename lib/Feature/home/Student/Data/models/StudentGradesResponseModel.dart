import 'package:school/Feature/home/Student/Data/models/grade.dart';

class StudentGradesResponseModel {
  final bool success;
  final GradesDataModel data;

  StudentGradesResponseModel({
    required this.success,
    required this.data,
  });

  factory StudentGradesResponseModel.fromJson(Map<String, dynamic> json) {
    return StudentGradesResponseModel(
      success: json['success'] ?? false,
      data: GradesDataModel.fromJson(json['data'] ?? {}),
    );
  }
}