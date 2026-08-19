import 'package:flutter/material.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/grade_model.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/taskandactivitymodel.dart';

class Taskforstud {
  List<ClassModel> mockclasses = [
    ClassModel(
      id: '1',
      classname: 'الصف العاشر',
      iconBackgroundColor: Color(0xFFFF6CF8BB),
      iconColor: Color(0xFF00714D),
      iconData: Icons.functions,
      studentcount: 32,
      subjectname: "أ (الرياضيات)",
      typeoftask: "الوحدة 3: المعادلات",
    ),
    ClassModel(
      id: '2',
      classname: 'الصف الحادي عشر',
      iconBackgroundColor: Color(0xFFFF6CF8BB),
      iconColor: Color(0xFF00714D),
      iconData: Icons.functions,
      studentcount: 28,
      subjectname: "ج (الفيزياء)",
      typeoftask: "الفصل 2: الحركة",
    ),
  ];
  List<ActivityModel> mockactivity = [
    ActivityModel(
      id: '1',
      title: 'تم رصد درجات الاختبار القصير',
      subtitle: "الصف العاشر-أ- قبل ساعتين",
      updatetext: 'تم تحديث درجات 30/32 طالب',
      isCompleted: true,
    ),
    ActivityModel(
      id: '2',
      title: 'مهمة جديدة : ورقة عمل الفصل 2',
      subtitle: "الصف الحادي عشر -ج- أمس",
      isCompleted: false,
    ),
  ];
  Future<List<ClassModel>> getclasses() async {
    await Future.delayed(Duration(milliseconds: 500));
    return mockclasses;
  }

  Future<List<ActivityModel>> getactivities() async {
    await Future.delayed(Duration(milliseconds: 500));
    return mockactivity;
  }

  //...................................
  Future<List<StudentModel>> getStudentsBySection(String sectionId) async {
    // final response = await dio.get('/api/sections/$sectionId/students');
    // return (response.data as List).map((e) => StudentModel.fromJson(e)).toList();

    await Future.delayed(const Duration(milliseconds: 500));
    return [
      StudentModel(id: '1', name: 'أحمد محمود'),
      StudentModel(id: '2', name: 'سامي خالد'),
      StudentModel(id: '3', name: 'محمد علي'),
    ];
  }

  Future<void> saveGrades({
    required String sectionId,
    required String gradeType,
    required List<GradeModel> grades,
  }) async {
    // await dio.post('/api/grades/save', data: {
    //   'section_id': sectionId,
    //   'grade_type': gradeType,
    //   'grades': grades.map((e) => e.toJson()).toList(),
    // });

    await Future.delayed(const Duration(milliseconds: 500));
  }
}
