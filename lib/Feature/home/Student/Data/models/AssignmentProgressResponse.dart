class AssignmentProgressResponse {
  final bool success;
  final AssignmentProgressData data;

  AssignmentProgressResponse({
    required this.success,
    required this.data,
  });

  factory AssignmentProgressResponse.fromJson(Map<String, dynamic> json) {
    return AssignmentProgressResponse(
      success: json['success'] ?? false,
      data: AssignmentProgressData.fromJson(json['data'] ?? {}),
    );
  }
}

class AssignmentProgressData {
  final int completed;
  final int total;
  final int percentage;

  AssignmentProgressData({
    required this.completed,
    required this.total,
    required this.percentage,
  });

  factory AssignmentProgressData.fromJson(Map<String, dynamic> json) {
    return AssignmentProgressData(
      completed: json['completed'] ?? 0,
      total: json['total'] ?? 0,
      percentage: json['percentage'] ?? 0,
    );
  }
}