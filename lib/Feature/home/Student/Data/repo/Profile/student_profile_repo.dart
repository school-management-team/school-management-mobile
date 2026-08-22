import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/models/AttendanceDataModel.dart';
import 'package:school/Feature/home/Student/Data/models/StudentPersonalData.dart';
import 'package:school/Feature/home/Student/Data/models/guardian.dart';
import 'package:school/Feature/home/Student/Data/models/profile.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class StudentProfileRepo {
  Future<Either<Failure, StudentProfileResponseModel>>
      getStudentProfile();

  Future<Either<Failure, AttendanceSummaryResponseModel>>
      getAttendanceSummary();

  Future<Either<Failure, StudentPersonalResponseModel>>
      getStudentPersonalInfo();

  Future<Either<Failure, StudentGuardianResponseModel>>
      getGuardianInfo();

  Future<Either<Failure, String>>
      updateProfileImage(String imagePath);
}