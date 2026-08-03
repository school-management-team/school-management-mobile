import 'package:dartz/dartz.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class  StudentDashboardRepo {
 Future<Either<Failure,void>>getStudentDashboard();
  }
