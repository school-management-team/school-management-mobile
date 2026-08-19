import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/dataschedule_model.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/dataschedulerepo.dart';

abstract class TeacherScheduleState {}

class TeacherScheduleInitial extends TeacherScheduleState {}

class TeacherScheduleLoading extends TeacherScheduleState {}

class TeacherScheduleLoaded extends TeacherScheduleState {
  final bool isDaysSelected;
  final int selectedIndex;
  final List<dataSchedule> activeSchedule;

  TeacherScheduleLoaded({
    required this.isDaysSelected,
    required this.selectedIndex,
    required this.activeSchedule,
  });
}

class TeacherScheduleError extends TeacherScheduleState {
  final String message;
  TeacherScheduleError(this.message);
}

class TeacherScheduleCubit extends Cubit<TeacherScheduleState> {
  TeacherScheduleCubit() : super(TeacherScheduleInitial());

  bool isDaysSelected = true;
  int selectedIndex = 0;

  void fetchTeacherSchedule() async {
    emit(TeacherScheduleLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      emit(
        TeacherScheduleLoaded(
          isDaysSelected: isDaysSelected,
          selectedIndex: selectedIndex,
          activeSchedule: mockAllData[selectedIndex],
        ),
      );
    } catch (e) {
      emit(TeacherScheduleError('عذرا , حدث خطأ ما'));
    }
  }

  void selectTab(bool isDay) {
    isDaysSelected = isDay;
    emitUpdatedState();
  }

  void selectDay(int index) {
    selectedIndex = index;

    emitUpdatedState();
  }

  void emitUpdatedState() {
    List<dataSchedule> schedule;
    if (isDaysSelected) {
      schedule = mockAllData[selectedIndex];
    } else {
      schedule = mockAllData.expand((dayList) => dayList).toList();
    }
    emit(
      TeacherScheduleLoaded(
        isDaysSelected: isDaysSelected,
        selectedIndex: selectedIndex,
        activeSchedule: schedule,
      ),
    );
  }

  Future<void> submitLessonPlan({
    required String schedduleId,
    required String lessonplan,
  }) async {
    try {
      //...........
      await Future.delayed(Duration(milliseconds: 500));
      emitUpdatedState();
    } catch (e) {
      emit(TeacherScheduleError('عذرا, حدث خطأ ما'));
    }
  }
}
