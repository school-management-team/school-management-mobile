import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:school/Feature/auth/signup/Data/signup_teacher_rep/teacher_auth_repository.dart';
import 'package:school/core/api/errors/Failure.dart';
import 'package:school/core/api/errors/serverException.dart';
import 'package:school/core/function/upload_image_api.dart';

class TeacherAuthRepoImpl implements TeacherAuthRepository {
  @override
  Future<Either<Failure, void>> registerTeacher({
    required String name,
    
    required String subject,
    required String email,
    required String configePsassword,
    required String birhthDate,
   // required XFile file,
    required String department,
    required String grade,
    required String phone,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      print("successful enter information student:$name");
     // final fileToUpload=uploadImageToApi(file);
      //FormData formData=FormData.fromMap({"name":name,
      //"file":fileToUpload,
     // });
    //  await dio
      return right(null);
    } on ServerException catch (e) {
      return left(serverFailure(errorMessage: e.modelErrors.errorMessage));
    } catch (e) {
      return left(serverFailure(errorMessage: "errorMessage: ${e.toString()}"));
    }
  }
}
