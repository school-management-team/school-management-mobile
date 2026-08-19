class StudentModel {
  final String id;
  final String name;
  StudentModel({required this.id, required this.name});
}

class GradeModel {
  final String studentId;
  //final String studentName;
  final String gradeType;
  final double grade;
  GradeModel({
    required this.studentId,
    //  required this.studentName,
    required this.gradeType,
    required this.grade,
  });
  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      //  'studentName': studentName,
      'gradeType': gradeType,
      'grade': grade,
    };
  }
}
