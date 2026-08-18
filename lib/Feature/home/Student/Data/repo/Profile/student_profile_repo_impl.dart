import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/repo/Profile/student_profile_repo.dart';
import 'package:school/core/api/errors/Failure.dart';

class StudentProfileRepoImpl implements StudentProfileRepo {
  Future<Either<Failure, void>> getStudentProfile() async {
    return right(null);
  }
}
