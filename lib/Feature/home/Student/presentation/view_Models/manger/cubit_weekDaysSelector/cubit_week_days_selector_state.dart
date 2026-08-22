part of 'cubit_week_days_selector_cubit.dart';

@immutable
sealed class CubitWeekDaysSelectorState {}

final class CubitWeekDaysSelectorInitial extends CubitWeekDaysSelectorState {}

final class CubitWeekDaysSelectorLoading extends CubitWeekDaysSelectorState {}

final class CubitWeekDaysSelectorFailure extends CubitWeekDaysSelectorState {
  final String message;

  CubitWeekDaysSelectorFailure({required this.message});
}

final class CubitWeekDaysSelectorSuccess extends CubitWeekDaysSelectorState {
  final List<DailyScheduleModel> sheduleList;


  CubitWeekDaysSelectorSuccess({required this.sheduleList});
}
