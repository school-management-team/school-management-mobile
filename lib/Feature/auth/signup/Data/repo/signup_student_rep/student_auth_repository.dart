import 'package:dartz/dartz.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class StudentAuthRepository {
  Future<Either<Failure, void>> registerStudent({
 required String userName,
    required String fatherName,
    required String motherName,
    required String email,
    required String passwordConfirmation,
    required String birthDate,
    required String department,
    required int classId,
    required String phone,
    required String password,
    required String gender,
  });
}
