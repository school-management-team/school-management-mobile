import 'package:dartz/dartz.dart';

import 'package:school/Feature/home/Student/Data/models/ImportantAnnouncementModel.dart';
import 'package:school/Feature/home/Student/Data/models/ImportantAnnouncementResponseModel.dart';
import 'package:school/Feature/home/Student/Data/models/StudentGradesResponseModel.dart';
import 'package:school/Feature/home/Student/Data/models/grade.dart';
import 'package:school/Feature/home/Student/Data/repo/dash2/dash2_repo.dart';
import 'package:school/Feature/home/Student/Data/repo/grade/grade_repo.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/Failure.dart';
import 'package:school/core/api/errors/serverException.dart';

class StudentRepositoryImpl implements StudentRepository {
  final DioConsumer dioConsumer;

  StudentRepositoryImpl(this.dioConsumer);

  @override
  Future<Either<Failure, StudentGradesResponseModel>> getStudentGrades() async {
    try {
      final response = await dioConsumer.get(ApiEndpoint.studentGrades);

      StudentGradesResponseModel studentGrades =
          StudentGradesResponseModel.fromJson(response);

      return right(studentGrades);
    } on ServerException catch (e) {
      return left(serverFailure(errorMessage: e.modelErrors.errorMessage));
    } catch (e) {
      return left(serverFailure(errorMessage: e.toString()));
    }
  }
}
