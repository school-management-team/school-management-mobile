import 'package:dartz/dartz.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class StudentProfileRepo {
  Future<Either<Failure, void>> getStudentProfile();
}
