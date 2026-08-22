import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/models/ImportantAnnouncementModel.dart';
import 'package:school/Feature/home/Student/Data/models/StudentGradesResponseModel.dart';
import 'package:school/Feature/home/Student/Data/models/grade.dart';

import 'package:school/core/api/errors/Failure.dart';


abstract class StudentRepository {
  Future<Either<Failure, StudentGradesResponseModel>> getStudentGrades();
}