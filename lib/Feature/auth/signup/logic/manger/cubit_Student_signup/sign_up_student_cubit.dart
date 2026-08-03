import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:school/Feature/auth/signup/Data/signup_student_rep/student_auth_repository.dart';

part 'sign_up_student_state.dart';

class SignUpStudentCubit extends Cubit<SignUpStudentState> {
  SignUpStudentCubit(this.studentAuthRepository)
    : super(SignUpStudentInitial());

  final StudentAuthRepository studentAuthRepository;

  Future<void> registerStudent({
    required String name,
    required String fatherName,
    required String motherName,
    required String email,
    required String birhthDate,
    required String department,
    required String grade,
    required String phone,
    required String password,
    required String configepassword,
  }) async {
    emit(SignUpStudentLoading());
    
      final result=await studentAuthRepository.registerStudent(
        
        name: name,
        fatherName: fatherName,
        motherName: motherName,
        email: email,
        configePsassword: configepassword,
        grade: grade,
        birhthDate: birhthDate,
        department: department,
        phone: phone,
        password: password,
      );
       result.fold(
      (failure) => emit(SignUpStudentFailure(failure.errorMessage)),
      (success) => emit(SignUpStudentSuccess()),
    );
    
  }
}
