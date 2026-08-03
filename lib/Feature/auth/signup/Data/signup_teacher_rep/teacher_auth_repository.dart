import 'dart:io';

import 'package:dartz/dartz.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class TeacherAuthRepository {
   Future<Either<Failure,void>> registerTeacher({
    required String name,
    //required XFile file,
    required String subject,
    required String email,
    required String configePsassword,
    required String birhthDate,
    required String department,
    required String grade,
    required String phone,
    required String password,
  });
}
