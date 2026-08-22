import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school/Feature/home/Student/Data/models/AttendanceDataModel.dart';
import 'package:school/Feature/home/Student/Data/models/StudentPersonalData.dart';
import 'package:school/Feature/home/Student/Data/models/guardian.dart';
import 'package:school/Feature/home/Student/Data/models/profile.dart';
import 'package:school/Feature/home/Student/Data/repo/Profile/student_profile_repo.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_state.dart';
import 'package:school/core/api/endpoint.dart';



class ProfileStudentCubit extends Cubit<ProfileStudentState> {
  final StudentProfileRepo studentProfileRepo;

  ProfileStudentCubit({
    required this.studentProfileRepo,
  }) : super(ProfileStudentInitial());

  XFile? selectedImage;

  String? profileImageUrl;

  StudentProfileResponseModel? profileResponse;
  StudentPersonalResponseModel? personResponse;
  AttendanceSummaryResponseModel? attendanceResponse;
  StudentGuardianResponseModel? guardianResponse;

  Future<void> getProfileData() async {
    emit(ProfileStudentLoading());

    final profileResult =
        await studentProfileRepo.getStudentProfile();

    final personalResult =
        await studentProfileRepo.getStudentPersonalInfo();

    final attendanceResult =
        await studentProfileRepo.getAttendanceSummary();

    final guardianResult =
        await studentProfileRepo.getGuardianInfo();

    profileResult.fold(
      (failure) {
        emit(
          ProfileStudentFailure(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (profileData) {
        profileResponse = profileData;

        personalResult.fold(
          (failure) {
            emit(
              ProfileStudentFailure(
                errorMessage: failure.errorMessage,
              ),
            );
          },
          (personalData) {
            personResponse = personalData;

            attendanceResult.fold(
              (failure) {
                emit(
                  ProfileStudentFailure(
                    errorMessage: failure.errorMessage,
                  ),
                );
              },
              (attendanceData) {
                attendanceResponse = attendanceData;guardianResult.fold(
                  (failure) {
                    emit(
                      ProfileStudentFailure(
                        errorMessage: failure.errorMessage,
                      ),
                    );
                  },
                  (guardianData) {
                    guardianResponse = guardianData;

                    profileImageUrl =
                        profileData.data.profilePhotoUrl;

                    emit(
                      ProfileStudentSuccess(
                        profileResponse: profileData,
                        personResponse: personalData,
                        attendanceResponse: attendanceData,
                        guardianResponse: guardianData,
                        localimage: selectedImage,
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Future<void> pickAndUploadProfileImage() async {
    final picker = ImagePicker();

    final image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) {
      return;
    }

    selectedImage = image;

    if (profileResponse == null ||
        personResponse == null ||
        attendanceResponse == null ||
        guardianResponse == null) {
      return;
    }

    emit(
      ProfileImageUpdatingState(
        profileResponse: profileResponse!,
        personResponse: personResponse!,
        attendanceResponse: attendanceResponse!,
        guardianResponse: guardianResponse!,
        localimage: selectedImage,
      ),
    );

    final result =
        await studentProfileRepo.updateProfileImage(
      image.path,
    );

    result.fold(
      (failure) {
        emit(
          ProfileStudentFailure(
            errorMessage: failure.errorMessage,
          ),
        );
      },
    
(profilePhotoPath) async {
      String baseUrl =ApiEndpoint.urlbase; 
      String fullImageUrl = baseUrl + profilePhotoPath; 
      
      profileImageUrl = fullImageUrl;

      if (state is ProfileStudentSuccess) {
        final currentState = state as ProfileStudentSuccess;

      
        emit(
          ProfileStudentSuccess(
            personResponse: currentState.personResponse,
            profileResponse: currentState.profileResponse,
            attendanceResponse: currentState.attendanceResponse,
            guardianResponse: currentState.guardianResponse,
            localimage: selectedImage, 
          ),
        );
      }
    },
    );
  }
}