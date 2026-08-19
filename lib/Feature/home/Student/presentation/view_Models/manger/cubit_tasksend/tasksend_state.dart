part of 'tasksend_cubit.dart';

@immutable
sealed class TasksendState {}

final class TasksendInitial extends TasksendState {}

final class TasksendLoading extends TasksendState {}

final class TasksendFailuer extends TasksendState {
  final String errormessage;
  TasksendFailuer({required this.errormessage});
}


final class TasksendSuccess extends TasksendState {
  final AssignmentProgressResponse progressResponse;
  final List<AssignmentModel> assignmentsList;

  TasksendSuccess({
    required this.progressResponse,
    required this.assignmentsList,
  });
}