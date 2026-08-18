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
  final List<Map<String, dynamic>> sheduleList;
  final String? remainingHours;
   final String?completionPercentage;

  CubitWeekDaysSelectorSuccess({required this.sheduleList, this.remainingHours, this.completionPercentage});
}
