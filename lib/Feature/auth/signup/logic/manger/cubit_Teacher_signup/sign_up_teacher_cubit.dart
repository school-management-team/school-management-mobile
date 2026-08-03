import 'package:bloc/bloc.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:school/Feature/auth/signup/Data/signup_teacher_rep/teacher_auth_repository.dart';
import 'package:school/core/api/errors/Failure.dart';

part 'sign_up_teacher_state.dart';

class SignUpTeacherCubit extends Cubit<SignUpTeacherState> {
  SignUpTeacherCubit(this.teacherAuthRepository)
    : super(SignUpTeacherInitial());
  final TeacherAuthRepository teacherAuthRepository;
  Future<void> registerTeacher({
    required String name,
   // required XFile file,
    required String subject,
    required String email,
    required String configePsassword,
    required String birhthDate,
    required String department,
    required String grade,
    required String phone,
    required String password,
  }) async {
    emit(SignUpTeacherLoading());
    final result = await teacherAuthRepository.registerTeacher(
     // file: file,
      name: name,
      
      subject: subject,
      email: email,
      configePsassword: configePsassword,
      birhthDate: birhthDate,
      department: department,
      grade: grade,
      phone: phone,
      password: password,
    );
    result.fold(
      (failure) => emit(SignUpTeacherFailure(failure.errorMessage)),
      (success) => emit(SignUpTeacherSuccess()),
    );
  }
}
