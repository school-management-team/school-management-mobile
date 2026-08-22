import 'package:school/Feature/home/Student/Data/models/DailyScheduleModel.dart';

class DailyScheduleResponse {
  final bool success;
  final List<DailyScheduleModel> data;

  DailyScheduleResponse({
    required this.success,
    required this.data,
  });

  factory DailyScheduleResponse.fromJson(Map<String, dynamic> json) {
    return DailyScheduleResponse(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => DailyScheduleModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}