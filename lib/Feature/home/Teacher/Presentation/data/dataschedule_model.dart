class dataSchedule {
  final String id;
  final String type;
  final String startTime;
  final String endTime;
  final String dayOfWeek;
  final int periodNumber;
  final String status;
  final String? subjectName;
  final String? className;

  dataSchedule({
    required this.id,
    required this.type,
    required this.startTime,
    required this.endTime,
    required this.dayOfWeek,
    required this.periodNumber,
    required this.status,
    this.className,
    this.subjectName,
  });

  /*factory dataSchedule.fromJson(Map<String, dynamic> json) {
    return dataSchedule(
      id: json['id']?.toString() ?? '',
      type: json['type'] ?? '',
      startTime: json['start_time'] ?? json['startTime'] ?? '',
      endTime: json['end_time'] ?? json['endTime'] ?? '',
      dayOfWeek: json['day_of_week'] ?? json['dayOfWeek'] ?? '',
      periodNumber: json['period_number'] ?? json['periodNumber'] ?? 0,
    );
  }*/

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'start_time': startTime,
      'end_time': endTime,
      'day_of_week': dayOfWeek,
      'period_number': periodNumber,
    };
  }
}
