import 'package:dartz/dartz.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class  Dash2Repo {
 Future<Either<Failure,Map<DateTime,Map<String,dynamic>>>>getclanderEvents();
  Future<Either<Failure,List<Map<String, dynamic>>>>getAnnouncements();
  }
