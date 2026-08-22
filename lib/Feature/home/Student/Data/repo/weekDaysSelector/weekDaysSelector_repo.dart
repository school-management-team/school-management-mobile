import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/models/DailyScheduleResponse.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class WeekdaysselectorRepo {
  Future<Either<Failure, DailyScheduleResponse>> getDailySchedule({required String data});
}