import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:school/Feature/home/Student/Data/repo/weekDaysSelector/weekDaysSelector_repo.dart';
import 'package:school/Feature/home/Student/Data/repo/weekDaysSelector/weekDaysSelector_repo_impl.dart';

part 'cubit_week_days_selector_state.dart';

class CubitWeekDaysSelectorCubit extends Cubit<CubitWeekDaysSelectorState> {
  CubitWeekDaysSelectorCubit(this.weekdaysselectorRepo)
    : super(CubitWeekDaysSelectorInitial());
  WeekdaysselectorRepo weekdaysselectorRepo;
  Future<void> getDailySchedulee() async {
    emit(CubitWeekDaysSelectorLoading());
    final result = await weekdaysselectorRepo.getDailySchedule();
    result.fold(
      (failure) =>
          emit(CubitWeekDaysSelectorFailure(message: failure.errorMessage)),

      (data) => emit(
        CubitWeekDaysSelectorSuccess(
          sheduleList: data['schedule'],
          remainingHours: data['remaining_hours'],
          completionPercentage: data['completion_perectage'],
        ),
      ),
    );
  }
}
