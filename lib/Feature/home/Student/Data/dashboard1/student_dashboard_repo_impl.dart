import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/dashboard1/student_dashboard_repo.dart';
import 'package:school/core/api/errors/Failure.dart';

 class StudentDashboardRepoImpl implements StudentDashboardRepo {

  
  @override
  Future<Either<Failure, void>> getStudentDashboard()async {
      return right(null);
  }
}