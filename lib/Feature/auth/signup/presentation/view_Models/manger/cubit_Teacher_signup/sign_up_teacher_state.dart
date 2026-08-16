part of 'sign_up_teacher_cubit.dart';

@immutable
sealed class SignUpTeacherState {}

final class SignUpTeacherInitial extends SignUpTeacherState {}

final class SignUpTeacherLoading extends SignUpTeacherState {}

final class SignUpTeacherSuccess extends SignUpTeacherState {}

final class SignUpTeacherFailure extends SignUpTeacherState {
  final String errorMessage;
  SignUpTeacherFailure(this.errorMessage);
}
