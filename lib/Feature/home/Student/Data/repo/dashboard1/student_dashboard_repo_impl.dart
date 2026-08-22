import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart'; 
import 'package:school/Feature/home/Student/Data/models/StudentDashboardModel.dart';

import 'package:school/Feature/home/Student/Data/repo/dashboard1/student_dashboard_repo.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/Failure.dart';

import 'package:school/core/api/errors/serverException.dart'; 

class StudentDashboardRepoImpl implements StudentDashboardRepo {
  final DioConsumer api; 

  StudentDashboardRepoImpl(this.api);

  @override
  Future<Either<Failure, StudentDashboardModel>> getStudentDashboard() async {
    try {
      final response = await api.get(ApiEndpoint.studentDashboard); 
      
      final studentDashboardModel = StudentDashboardModel.fromJson(response);
      
      return right(studentDashboardModel);
    } on ServerException catch (e) {
      return left(
        serverFailure(
          errorMessage: e.modelErrors.errorMessage,
        ),
      );
    } catch (e) {
      return left(
        serverFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }}