import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/models/StudentDashboardModel.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class StudentDashboardRepo {
  Future<Either<Failure, StudentDashboardModel>> getStudentDashboard();
}