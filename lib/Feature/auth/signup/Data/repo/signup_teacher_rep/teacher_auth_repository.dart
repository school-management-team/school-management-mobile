import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class TeacherAuthRepository {
  Future<Either<Failure, void>> registerTeacher({
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
  });
}
