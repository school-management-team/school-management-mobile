import 'package:school/Feature/home/Teacher/Presentation/data/grade_model.dart';

class GradeRepo {
  List<String> _mockClasses = [
    'الصف العاشر',
    'الصف الحادي عشر',
    'الصف الثاني عشر',
  ];
  List<String> _mockSections = ['أ', 'ب', 'ج', 'د'];
  List<StudentModel> _mockStudents = [
    StudentModel(id: '1', name: 'أحمد محمد'),
    StudentModel(id: '2', name: 'سارة علي'),
    StudentModel(id: '3', name: 'محمد خالد'),
    StudentModel(id: '4', name: 'فاطمة حسن'),
    StudentModel(id: '5', name: 'عبدالله عمر'),
    StudentModel(id: '6', name: 'نورا سعيد'),
  ];

  Future<List<String>> getClasses() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockClasses;
  }

  Future<List<String>> getSections(String className) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockSections;
  }

  Future<List<StudentModel>> getStudents(
    String className,
    String section,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockStudents;
  }

  Future<bool> saveGrades({
    required String className,
    required String section,
    required String gradeType,
    required List<GradeModel> grades,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return true;
  }
}
