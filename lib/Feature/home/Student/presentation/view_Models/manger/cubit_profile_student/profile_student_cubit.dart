import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:school/Feature/home/Student/Data/repo/Profile/student_profile_repo.dart';

part 'profile_student_state.dart';

class ProfileStudentCubit extends Cubit<ProfileStudentState> {
  ProfileStudentCubit(this.studentProfileRepo) : super(ProfileStudentInitial());
  final StudentProfileRepo studentProfileRepo;
  String phone = "";
  String email = "";
  void getfetchData() async {
    emit(ProfileStudentLoading());
    final result = await studentProfileRepo.getStudentProfile();
    result.fold(
      (failure) =>
          emit(ProfileStudentFailure(errMessage: failure.errorMessage)),

      (success) => emit(
        ProfileStudentSuccess(
          nationalty: "الرياض، حي الملقا، شارع الأمير محمد",
          address: "1092837465",
          nationalIa: "سعودي",
          birthDate: "15 مارس 2008 (16 سنة)",
        ),
      ),
    );
  }

  void triggerEditingAction() {
    emit(ProfileStudentEditingState());
  }

  void triggerContactAction() {
    emit(ProfileStudentConactState());
  }

  void updateCotactInfor(String newPhone, String newEmail) {
    phone = newPhone;
    email = newEmail;
    emit(ProfileStudentUpdate(phone: phone, email: email));
  }
}
