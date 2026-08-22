class AttendanceSummaryResponseModel {
  final bool success;
  final AttendanceDataModel data;

  AttendanceSummaryResponseModel({
    required this.success,
    required this.data,
  });

  factory AttendanceSummaryResponseModel.fromJson(Map<String, dynamic> json) {
    return AttendanceSummaryResponseModel(
      success: json['success'] ?? false,
      data: AttendanceDataModel.fromJson(json['data'] ?? {}),
    );
  }
}

class AttendanceDataModel {
  final double attendanceRate;
  final int lateCount;
  final int absentDays;

  AttendanceDataModel({
    required this.attendanceRate,
    required this.lateCount,
    required this.absentDays,
  });

  factory AttendanceDataModel.fromJson(Map<String, dynamic> json) {
    return AttendanceDataModel(
      attendanceRate: (json['attendance_rate'] as num?)?.toDouble() ?? 0.0,
      lateCount: json['late_count'] ?? 0,
      absentDays: json['absent_days'] ?? 0,
    );
  }
}