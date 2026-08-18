import 'package:dartz/dartz.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class WeekdaysselectorRepo {
  Future<Either<Failure, Map<String, dynamic>>> getDailySchedule();
}
