import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import 'package:school/Feature/auth/signup/Data/repo/signup_teacher_rep/teacher_auth_repository.dart';

part 'sign_up_teacher_state.dart';

class SignUpTeacherCubit extends Cubit<SignUpTeacherState> {
  SignUpTeacherCubit(this.teacherAuthRepository)
      : super(SignUpTeacherInitial());

  final TeacherAuthRepository teacherAuthRepository;

  Future<void> registerTeacher({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String userName,
    required String gender,
    required String birthDate,
    required int stageId,
    required int subjectId,
    required String cv,
    required XFile legalDocumentPath,
  }) async {
    emit(SignUpTeacherLoading());

    final result = await teacherAuthRepository.registerTeacher(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      phone: phone,
      userName: userName,
      gender: gender,
      birthDate: birthDate,
      stageId: stageId,
      subjectId: subjectId,
      cv: cv,
      legalDocumentPath: legalDocumentPath,
    );

    result.fold(
      (failure) {
        emit(
          SignUpTeacherFailure(
            failure.errorMessage,
          ),
        );
      },
      (_) {
        emit(SignUpTeacherSuccess());
      },
    );
  }
}