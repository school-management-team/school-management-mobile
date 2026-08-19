import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:school/Feature/auth/signup/Data/repo/signup_student_rep/student_auth_repository.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/Failure.dart';
import 'package:school/core/api/errors/serverException.dart';
import 'package:school/core/database/cache/cahe_helper.dart';

class StudentAuthRepoImpl implements StudentAuthRepository {
  final DioConsumer dioConsume;

  StudentAuthRepoImpl(this.dioConsume);

  @override
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
  }) async {
    try {
      final response = await dioConsume.post(
        ApiEndpoint.signupStudent,

        options: Options(
          connectTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),

        data: {
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'user_name': userName,
          'phone': phone,
          'gender': gender,
          'birth_date': birthDate,
          'father_name': fatherName,
          'mother_name': motherName,
          'class_id': classId,
        },
      );
     

      return right(null);

    } on ServerException catch (e) {
      return left(
        serverFailure(
          errorMessage: e.modelErrors.errorMessage,
        ),
      );

    } catch (e) {
      return left(
        serverFailure(
          errorMessage: "errorMessage: ${e.toString()}",
        ),
      );
    }
  }
}