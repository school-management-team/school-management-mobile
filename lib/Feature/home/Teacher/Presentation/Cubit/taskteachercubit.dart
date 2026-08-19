import 'package:bloc/bloc.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/task_repo.dart';

abstract class TaskTeacher {}

class taskinitial extends TaskTeacher {}

class TaskLoading extends TaskTeacher {}

class TaskLoaded extends TaskTeacher {
  final List<Map<String, dynamic>> tasks;
  TaskLoaded(this.tasks);
}

class TaskError extends TaskTeacher {
  final String message;
  TaskError(this.message);
}

class TaskUpdating extends TaskTeacher {}

class TaskAddSubmitting extends TaskTeacher {}

class TaskAddSuccess extends TaskTeacher {}

class TaskCubit extends Cubit<TaskTeacher> {
  final TaskRepo repo;
  TaskCubit(this.repo) : super(taskinitial());

  Future<void> fetchtasks() async {
    emit(TaskLoading());
    try {
      final tasks = await repo.getTask();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError('فشل في تحميل المهام'));
    }
  }

  Future<void> addTask(Map<String, dynamic> taskData) async {
    emit(TaskAddSubmitting());
    try {
      final success = await repo.addTask(taskData);
      if (success) {
        emit(TaskAddSuccess());
        await fetchtasks();
      } else {
        emit(TaskError('فشل إضافة المهمة'));
      }
    } catch (e) {
      emit(TaskError('خطأ غير متوقع'));
    }
  }

  Future<void> completeTask(int index) async {
    try {
      final currentState = state;
      if (currentState is TaskLoaded) {
        final tasks = List<Map<String, dynamic>>.from(currentState.tasks);
        if (index < tasks.length) {
          tasks[index]['status'] = 'completed';
          tasks[index]['iscompleted'] = true;
          emit(TaskLoaded(tasks));
        }
      }
    } catch (e) {
      emit(TaskError('فشل تحديث المهمة'));
    }
  }
}

final globalTaskCubit = TaskCubit(TaskRepo());
