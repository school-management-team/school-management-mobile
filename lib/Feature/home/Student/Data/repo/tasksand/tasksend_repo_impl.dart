import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:school/Feature/home/Student/Data/models/AssignmentProgressResponse.dart';
import 'package:school/Feature/home/Student/Data/models/AssignmentsListResponse.dart';
import 'package:school/Feature/home/Student/Data/repo/tasksand/tasksend_repo.dart';

import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/Failure.dart';
import 'package:school/core/api/errors/serverException.dart';

class TasksendRepoImpl implements TasksendRepo {
  final DioConsumer dio;

  TasksendRepoImpl(this.dio);



  @override
  Future<Either<Failure, List<AssignmentModel>>>
      getAssignmentsWithStatus() async {
    try {
      final response = await dio.get(
        ApiEndpoint.assignmentswithstatusStudent,
      );

      final Map<String, dynamic> responseData =
          response is Response ? response.data : response;

      print("========== ASSIGNMENTS RESPONSE ==========");
      print(responseData);
      print("==========================================");

      final List<dynamic> dataList =
          responseData['data'] ?? [];

      final List<AssignmentModel> assignments =
          dataList.map((item) {
        return AssignmentModel.fromJson(item);
      }).toList();

      return right(assignments);
    } on ServerException catch (e) {
      return left(
        serverFailure(
          errorMessage: e.modelErrors.errorMessage,
        ),
      );
    } catch (e) {
      print("DEBUG ERROR in assignments: $e");

      return left(
        serverFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

 

  @override
  Future<Either<Failure, AssignmentProgressResponse>>
      getStudentProgress() async {
    try {
      final response = await dio.get(
        ApiEndpoint.assignmentsprogressStudent,
      );

      final Map<String, dynamic> responseData =
          response is Response ? response.data : response;

      print("========== PROGRESS RESPONSE ==========");
      print(responseData);
      print("=======================================");

      final AssignmentProgressResponse progressResponse =
          AssignmentProgressResponse.fromJson(
        responseData,
      );

      return right(progressResponse);
    } on ServerException catch (e) {
      return left(
        serverFailure(
          errorMessage: e.modelErrors.errorMessage,
        ),
      );
    } catch (e) {
      print("DEBUG ERROR in progress: $e");

      return left(
        serverFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

 

  @override
  Future<Either<Failure, void>> completeAssignment(
    int assignmentId,
  ) async {
    try {
      print("=======================================");
      print("COMPLETE ASSIGNMENT");
      print("Assignment ID: $assignmentId");
      print("Endpoint: ${ApiEndpoint.complete(assignmentId)}");
      print("=======================================");

      final response = await dio.patch(
        ApiEndpoint.complete(assignmentId),
      );

      print("========== COMPLETE RESPONSE ==========");
      print(response);
      print("=======================================");

      return right(null);
    } on ServerException catch (e) {
      print("========== COMPLETE SERVER ERROR ==========");
      print(e.modelErrors.errorMessage);
      print("===========================================");return left(
        serverFailure(
          errorMessage: e.modelErrors.errorMessage,
        ),
      );
    } catch (e) {
      print("========== COMPLETE ERROR ==========");
      print(e);
      print("====================================");

      return left(
        serverFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}