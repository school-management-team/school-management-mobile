part of 'profile_student_cubit.dart';

@immutable
sealed class ProfileStudentState {}

final class ProfileStudentInitial extends ProfileStudentState {}

final class ProfileStudentLoading extends ProfileStudentState {}

final class ProfileStudentSuccess extends ProfileStudentState {
  final String nationalty;
  final String address;
  final String nationalIa;
  final String birthDate;

  ProfileStudentSuccess({
    required this.nationalty,
    required this.address,
    required this.nationalIa,
    required this.birthDate,
  });
}

final class ProfileStudentFailure extends ProfileStudentState {
  final String errMessage;

  ProfileStudentFailure({required this.errMessage});
}

final class ProfileStudentEditingState extends ProfileStudentState {}

final class ProfileStudentConactState extends ProfileStudentState {}

final class ProfileStudentUpdate extends ProfileStudentState {
  final String phone;
  final String email;

  ProfileStudentUpdate({required this.phone, required this.email});
}
