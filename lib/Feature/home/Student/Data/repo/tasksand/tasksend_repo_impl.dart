import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, AssignmentProgressResponse>> getStudentProgress() async {
    try {
      final response = await dio.get(ApiEndpoint.assignmentsprogressStudent);
      
      AssignmentProgressResponse progressResponse = AssignmentProgressResponse.fromJson(response.data);
      return right(progressResponse);
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
        ),);
    }
  }

  @override
  Future<Either<Failure, List<AssignmentModel>>> getAssignmentsWithStatus() async {
    try {
      final response = await dio.get(ApiEndpoint.assignmentswithstatusStudent);
      
      AssignmentsListResponse listResponse = AssignmentsListResponse.fromJson(response.data);
      return right(listResponse.data);
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
        ),);
  }}

  @override
  Future<Either<Failure, void>> completeAssignment(int assignmentId) async {
    try {
      await dio.patch(ApiEndpoint.complete(assignmentId));
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
          errorMessage: e.toString(),
        ),);
  }}
}