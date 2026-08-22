part of 'sign_up_student_cubit.dart';

@immutable
sealed class SignUpStudentState {}

final class SignUpStudentInitial extends SignUpStudentState {}

final class SignUpStudentSuccess extends SignUpStudentState {

  final int userId;

  SignUpStudentSuccess({required this.userId});
}

final class SignUpStudentFailure extends SignUpStudentState {
  final String errorMessage;
  SignUpStudentFailure(this.errorMessage);
}

final class SignUpStudentLoading extends SignUpStudentState {}
