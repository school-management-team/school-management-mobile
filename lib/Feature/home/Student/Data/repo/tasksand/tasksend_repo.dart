import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/models/AssignmentProgressResponse.dart';
import 'package:school/Feature/home/Student/Data/models/AssignmentsListResponse.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class TasksendRepo {

  Future<Either<Failure, AssignmentProgressResponse>> getStudentProgress();

 
  Future<Either<Failure, List<AssignmentModel>>> getAssignmentsWithStatus();

  Future<Either<Failure, void>> completeAssignment(int assignmentId);
}
