import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/addtasktostudmodel.dart';

abstract class NewTaskstate {}

class NewTaskInitial extends NewTaskstate {}

class NewTaskLoading extends NewTaskstate {}

class NewTaskSuccess extends NewTaskstate {
  final String message;
  NewTaskSuccess(this.message);
}

class NewTaskError extends NewTaskstate {
  final String message;
  NewTaskError(this.message);
}

class NewTaskCubit extends Cubit<NewTaskstate> {
  NewTaskCubit() : super(NewTaskInitial());
  Future<void> addnewtask(newtaskmodel taskdata) async {
    emit(NewTaskLoading());
    try {
      await Future.delayed(Duration(milliseconds: 500));
      //........
      final success = true;
      if (success) {
        emit(NewTaskSuccess('تم نشر المهمة بنجاح'));
      }
    } catch (e) {
      emit(NewTaskError('خطأ غير متوقع'));
    }
  }
}

final globalNewTaskCubit = NewTaskCubit();
