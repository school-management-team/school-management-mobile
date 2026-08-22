import 'package:school/Feature/home/Student/Data/models/SectionModel.dart';
import 'package:school/Feature/home/Student/Data/models/TeacherAssignmentModel.dart';

class DailyScheduleModel {
  final int id;
  final int teacherId;
  final int teacherAssignmentId;
  final int sectionId;
  final String dayOfWeek;
  final int periodNumber;
  final String startTime;
  final String endTime;
  final String type;
  final String createdAt;
  final String updatedAt;
  final String subjectName;
  final String sectionName;
  final String className;
  final TeacherAssignmentModel teacherAssignment;
  final SectionModel section;
  final String status;

  DailyScheduleModel({
    required this.id,
    required this.teacherId,
    required this.teacherAssignmentId,
    required this.sectionId,
    required this.dayOfWeek,
    required this.periodNumber,
    required this.startTime,
    required this.endTime,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.subjectName,
    required this.sectionName,
    required this.className,
    required this.teacherAssignment,
    required this.section,
    required this.status,
  });

  factory DailyScheduleModel.fromJson(Map<String, dynamic> json) {
    return DailyScheduleModel(
      id: json['id'] ?? 0,
      teacherId: json['teacher_id'] ?? 0,
      teacherAssignmentId: json['teacher_assignment_id'] ?? 0,
      sectionId: json['section_id'] ?? 0,
      dayOfWeek: json['day_of_week'] ?? '',
      periodNumber: json['period_number'] ?? 0,
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      type: json['type'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      subjectName: json['subject_name'] ?? '',
      sectionName: json['section_name'] ?? '',
      className: json['class_name'] ?? '',
      teacherAssignment: TeacherAssignmentModel.fromJson(json['teacher_assignment'] ?? {}),
      section: SectionModel.fromJson(json['section'] ?? {}),
      status: json['status'] ?? '',
    );
  }
}