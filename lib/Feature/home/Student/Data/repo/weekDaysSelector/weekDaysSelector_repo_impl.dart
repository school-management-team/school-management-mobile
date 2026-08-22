import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/models/DailyScheduleResponse.dart';
import 'package:school/Feature/home/Student/Data/repo/weekDaysSelector/weekDaysSelector_repo.dart';
import 'package:school/core/api/api_consumer.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/Failure.dart';

class WeekdaysselectorRepoImpl implements WeekdaysselectorRepo {
  final ApiConsumer api;

  WeekdaysselectorRepoImpl({required this.api});

  @override
  Future<Either<Failure, DailyScheduleResponse>> getDailySchedule({required String data}) async {
    try {
      final response = await api.get(
        ApiEndpoint.DailySchdule, 
        data: {
          "data":data
        }
      );

      DailyScheduleResponse scheduleResponse = DailyScheduleResponse.fromJson(response);
      return right(scheduleResponse);
    } catch (e) {
      return left(serverFailure(errorMessage: e.toString()));
    }
  }
}