import 'package:dartz/dartz.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class StudentAuthRepository {
   Future<Either<Failure,void>>registerStudent({
    required String name,
    required String fatherName,
    required String motherName,
    required String email,
    required String configePsassword,
    required String birhthDate,
    required String department,
    required String grade,
    required String phone,
    required String password,
  });
}
