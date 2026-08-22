
import 'package:image_picker/image_picker.dart';
import 'package:school/Feature/home/Student/Data/models/AttendanceDataModel.dart';
import 'package:school/Feature/home/Student/Data/models/StudentPersonalData.dart';
import 'package:school/Feature/home/Student/Data/models/guardian.dart';
import 'package:school/Feature/home/Student/Data/models/profile.dart';

sealed class ProfileStudentState {}

class ProfileStudentInitial extends ProfileStudentState {}

class ProfileStudentLoading extends ProfileStudentState {}

class ProfileStudentSuccess extends ProfileStudentState {
  final StudentProfileResponseModel profileResponse;
  final StudentPersonalResponseModel personResponse;
  final AttendanceSummaryResponseModel attendanceResponse;
  final StudentGuardianResponseModel guardianResponse;
  final XFile? localimage;

  ProfileStudentSuccess({
    required this.profileResponse,
    required this.personResponse,
    required this.attendanceResponse,
    required this.guardianResponse,
    this.localimage,
  });
}

class ProfileStudentFailure extends ProfileStudentState {
  final String errorMessage;

  ProfileStudentFailure({
    required this.errorMessage,
  });
}

class ProfileImageUpdatingState extends ProfileStudentState {
  final StudentProfileResponseModel profileResponse;
  final StudentPersonalResponseModel personResponse;
  final AttendanceSummaryResponseModel attendanceResponse;
  final StudentGuardianResponseModel guardianResponse;
  final XFile? localimage;

  ProfileImageUpdatingState({
    required this.profileResponse,
    required this.personResponse,
    required this.attendanceResponse,
    required this.guardianResponse,
    this.localimage,
  });
}

class ProfileImageUpdatedState extends ProfileStudentState {
  final StudentProfileResponseModel profileResponse;
  final StudentPersonalResponseModel personResponse;
  final AttendanceSummaryResponseModel attendanceResponse;
  final StudentGuardianResponseModel guardianResponse;
  final XFile localimage;

  ProfileImageUpdatedState({
    required this.profileResponse,
    required this.personResponse,
    required this.attendanceResponse,
    required this.guardianResponse,
    required this.localimage,
  });
}

