class StudentDashboardModel {
  final bool? success;
  final StudentDashboardData? data;

  StudentDashboardModel({
    this.success,
    this.data,
  });

  factory StudentDashboardModel.fromJson(Map<String, dynamic> json) {
    return StudentDashboardModel(
      success: json['success'] as bool?,
      data: json['data'] != null
          ? StudentDashboardData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
      };
}

class StudentDashboardData {
  final double? attendanceRate;
  final double? averageGrade100;
  final dynamic nextClass; 
  final List<dynamic> todayAssignments;

  StudentDashboardData({
    this.attendanceRate,
    this.averageGrade100,
    this.nextClass,
    required this.todayAssignments,
  });

  factory StudentDashboardData.fromJson(Map<String, dynamic> json) {
    return StudentDashboardData(
      attendanceRate: (json['attendance_rate'] as num?)?.toDouble(),
      averageGrade100: (json['average_grade_100'] as num?)?.toDouble(),
      nextClass: json['next_class'],
      todayAssignments: json['today_assignments'] as List<dynamic>? ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
        'attendance_rate': attendanceRate,
        'average_grade_100': averageGrade100,
        'next_class': nextClass,
        'today_assignments': todayAssignments,
      };
}