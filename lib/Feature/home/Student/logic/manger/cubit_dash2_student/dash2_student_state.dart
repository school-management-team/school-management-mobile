part of 'dash2_student_cubit.dart';

sealed class Dash2StudentState {}

final class Dash2StudentInitial extends Dash2StudentState {}

final class Dash2StudentLoading extends Dash2StudentState {}

final class Dash2StudentFailure extends Dash2StudentState {
  final String message;

  Dash2StudentFailure({required this.message});
  
}

final class Dash2StudentSuccess extends Dash2StudentState {
final  Map<DateTime,Map<String,dynamic>>events;
final List<Map<String, dynamic>>announcements;

  Dash2StudentSuccess({required this.events, required this.announcements});

  

}
