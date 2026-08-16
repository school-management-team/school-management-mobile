import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:school/Feature/auth/signup/Data/repo/signup_student_rep/student_auth_repository.dart';

part 'sign_up_student_state.dart';

class SignUpStudentCubit extends Cubit<SignUpStudentState> {
  SignUpStudentCubit(this.studentAuthRepository)
    : super(SignUpStudentInitial());

  final StudentAuthRepository studentAuthRepository;

  Future<void> registerStudent({
 required String userName,
    required String fatherName,
    required String motherName,
    required String email,
    required String passwordConfirmation,
    required String birthDate,
    required String department,
    required int classId,
    required String phone,
    required String password,
    required String gender
  }) async {
    print("cubit,,,,,,,,,,,,,,,,,0");
    emit(SignUpStudentLoading());
 print("cubit,,,,,,,,lllllllloadddddinggggg,,,,,,,,,0");
    final result = await studentAuthRepository.registerStudent(
      userName: userName,
      fatherName: fatherName,
      motherName: motherName,
      email: email,
      passwordConfirmation: passwordConfirmation,
      gender: gender,
      birthDate: birthDate,
      department: department,
      phone: phone,
      password: password,
       classId: classId,
    ); 
    
    print("cubit,,,,,,,,,,,,resullllttttt,,,,,0");
    result.fold(
      (failure) => emit(SignUpStudentFailure(failure.errorMessage)),
      (success) => emit(SignUpStudentSuccess()),
    );
  }
}
