import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:school/Feature/home/Student/Data/models/AttendanceDataModel.dart';
import 'package:school/Feature/home/Student/Data/models/StudentPersonalData.dart';
import 'package:school/Feature/home/Student/Data/models/guardian.dart';
import 'package:school/Feature/home/Student/Data/models/profile.dart';
import 'package:school/Feature/home/Student/Data/repo/Profile/student_profile_repo.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/Failure.dart';
import 'package:school/core/api/errors/serverException.dart';

class StudentProfileRepoImpl implements StudentProfileRepo {
  final DioConsumer dioConsumer;

  StudentProfileRepoImpl({
    required this.dioConsumer,
  });

  @override
  Future<Either<Failure, StudentProfileResponseModel>>
      getStudentProfile() async {
    try {
      final response = await dioConsumer.get(
        ApiEndpoint.studentProfile,
      );

      final profileModel =
          StudentProfileResponseModel.fromJson(response);

      return right(profileModel);
    } on ServerException catch (e) {
      return left(
        serverFailure(
          errorMessage: e.modelErrors.errorMessage,
        ),
      );
    } catch (e) {
      return left(
        serverFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AttendanceSummaryResponseModel>>
      getAttendanceSummary() async {
    try {
      final response = await dioConsumer.get(
        ApiEndpoint.studentAttendanceSummary,
      );

      final attendanceModel =
          AttendanceSummaryResponseModel.fromJson(response);

      return right(attendanceModel);
    } on ServerException catch (e) {
      return left(
        serverFailure(
          errorMessage: e.modelErrors.errorMessage,
        ),
      );
    } catch (e) {
      return left(
        serverFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, StudentPersonalResponseModel>>
      getStudentPersonalInfo() async {
    try {
      final response = await dioConsumer.get(
        ApiEndpoint.studentProfile,
      );

      final personalModel =
          StudentPersonalResponseModel.fromJson(response);

      return right(personalModel);
    } on ServerException catch (e) {
      return left(
        serverFailure(
          errorMessage: e.modelErrors.errorMessage,
        ),
      );
    } catch (e) {
      return left(
        serverFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, StudentGuardianResponseModel>>
      getGuardianInfo() async {
    try {
      final response = await dioConsumer.get(
        ApiEndpoint.guardian,
      );

      final guardianModel =
          StudentGuardianResponseModel.fromJson(response);

      return right(guardianModel);
    } on ServerException catch (e) {
      return left(
        serverFailure(
          errorMessage: e.modelErrors.errorMessage,
        ),
      );
    } catch (e) {
      return left(
        serverFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>>
      updateProfileImage(String imagePath) async {
    try {
      final formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(
          imagePath,
        ),
      });

      final response = await dioConsumer.post(
        ApiEndpoint.updateStudentProfileImage,
        data: formData,
        isFromData: false,
      );

      final imageUrl =
          response['data']?['profile_photo_url'] ??
          response['profile_photo_url'] ??
          '';return right(imageUrl.toString());
    } on ServerException catch (e) {
      return left(
        serverFailure(
          errorMessage: e.modelErrors.errorMessage,
        ),
      );
    } catch (e) {
      return left(
        serverFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}