import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import 'package:school/Feature/auth/signup/Data/repo/signup_teacher_rep/teacher_auth_repository.dart';
import 'package:school/core/api/Dio_consumer.dart';

import 'package:school/core/api/api_consumer.dart';
import 'package:school/core/api/endpoint.dart';

import 'package:school/core/api/errors/Failure.dart';
import 'package:school/core/api/errors/serverException.dart';

import 'package:school/core/function/upload_image_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherAuthRepoImpl implements TeacherAuthRepository {
  final DioConsumer api;

  TeacherAuthRepoImpl(this.api);

  @override
  Future<Either<Failure, int>> registerTeacher({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String userName,
    required String gender,
    required String birthDate,
    required int stageId,
    required int subjectId,
    required String cv,
    required XFile legalDocumentPath,
  }) async {
    try {
      final legalDocument = await uploadImageToApi(legalDocumentPath);

      final response = await api.post(
        ApiEndpoint.signupTeacher,
        isFromData: true,
        data: {
          'email': email,

          'password': password,

          'password_confirmation': passwordConfirmation,

          'phone': phone,

          'gender': gender,

          'user_name': userName,

          'birth_date': birthDate,

          'stage_id': stageId,

          'subject_id': subjectId,

          'cv': cv,

          'legal_document_path': legalDocument,
        },
      );


        options: Options(
                  connectTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

final userId = response['data']['user_id'];

if (userId == null) {
  return left(
    serverFailure(
      errorMessage: 'فشل في استخراج معرف المستخدم',
    ),
  );
}

return right(userId as int);
     
    } on ServerException catch (e) {
      return left(serverFailure(errorMessage: e.modelErrors.errorMessage));
    } catch (e) {
      return left(serverFailure(errorMessage: e.toString()));
    }
  }
}
