import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/models/classgroup.dart';
import 'package:school/Feature/home/Student/Data/models/classmate.dart';
import 'package:school/core/api/errors/Failure.dart';

abstract class FriendRepo {
  Future<Either<Failure,List< ClassGroupModel>>>getclassfriend();
    Future<Either<Failure,List< ClassmateModel>>>getclassmate();
}