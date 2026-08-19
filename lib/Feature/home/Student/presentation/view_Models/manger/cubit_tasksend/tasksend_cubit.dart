import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:school/Feature/home/Student/Data/models/AssignmentProgressResponse.dart';
import 'package:school/Feature/home/Student/Data/models/AssignmentsListResponse.dart';
import 'package:school/Feature/home/Student/Data/repo/tasksand/tasksend_repo.dart';

part 'tasksend_state.dart';



class TasksendCubit extends Cubit<TasksendState> {
  TasksendCubit(this.tasksendrepo) : super(TasksendInitial());

  final TasksendRepo tasksendrepo;

  Future<void> getTasksAndProgressData() async {
    emit(TasksendLoading());


    final progressResult = await tasksendrepo.getStudentProgress();

    final assignmentsResult = await tasksendrepo.getAssignmentsWithStatus();

    
    progressResult.fold(
      (failure) => emit(TasksendFailuer(errormessage: failure.errorMessage)),
      (progressData) {
        assignmentsResult.fold(
          (failure) => emit(TasksendFailuer(errormessage: failure.errorMessage)),
          (assignmentsData) {
            emit(TasksendSuccess(
              progressResponse: progressData,
              assignmentsList: assignmentsData,
            ));
          },
        );
      },
    );
  }


  Future<void> completeAssignment(int assignmentId) async {
    final result = await tasksendrepo.completeAssignment(assignmentId);
    
    result.fold(
      (failure) => emit(TasksendFailuer(errormessage: failure.errorMessage)),
      (_) {
     
        getTasksAndProgressData();
      },
    );
  }
}