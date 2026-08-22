part of 'dashboard1_student_cubit.dart';

@immutable
sealed class Dashboard1StudentState {}

final class Dashboard1StudentInitial extends Dashboard1StudentState {}

final class Dashboard1StudentLoading extends Dashboard1StudentState {}

final class Dashboard1StudentFailure extends Dashboard1StudentState {
  final String errMessage;

  Dashboard1StudentFailure({required this.errMessage});
}

final class Dashboard1StudentSuccess extends Dashboard1StudentState {

  final StudentDashboardModel studentDashboardModel;

  Dashboard1StudentSuccess({required this.studentDashboardModel});
}