import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:school/Feature/home/Student/Data/models/DailyScheduleModel.dart';
import 'package:school/Feature/home/Student/Data/repo/weekDaysSelector/weekDaysSelector_repo.dart';
import 'package:school/Feature/home/Student/Data/repo/weekDaysSelector/weekDaysSelector_repo_impl.dart';

part 'cubit_week_days_selector_state.dart';

class CubitWeekDaysSelectorCubit extends Cubit<CubitWeekDaysSelectorState> {
  CubitWeekDaysSelectorCubit(this.weekdaysselectorRepo)
    : super(CubitWeekDaysSelectorInitial());
  WeekdaysselectorRepo weekdaysselectorRepo;
  Future<void> getDailySchedulee({required String data}) async {
    emit(CubitWeekDaysSelectorLoading());
    final result = await weekdaysselectorRepo.getDailySchedule(data: data);
    result.fold(
       
      (failure) {
        if (!isClosed) {
          emit(CubitWeekDaysSelectorFailure(message: failure.errorMessage));}},
   
      (data) {
          if (!isClosed) { emit(
        CubitWeekDaysSelectorSuccess(
          sheduleList: data.data,
      
   ),
      );}}
    );
  }
}
