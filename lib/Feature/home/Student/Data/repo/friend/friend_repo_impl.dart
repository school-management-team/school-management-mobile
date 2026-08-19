import 'package:dartz/dartz.dart';

import 'package:school/Feature/home/Student/Data/models/classgroup.dart';
import 'package:school/Feature/home/Student/Data/models/classmate.dart';
import 'package:school/Feature/home/Student/Data/repo/friend/friend_repo.dart';

import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/Failure.dart';
import 'package:school/core/api/errors/serverException.dart';

class FriendRepoImpl implements FriendRepo {
  final DioConsumer dioConsumer;

  FriendRepoImpl({
    required this.dioConsumer,
  });

  @override
  Future<Either<Failure, List<ClassGroupModel>>> getclassfriend() async {
    try {
      var data = await dioConsumer.get(
        ApiEndpoint.classgroupStudent,
      );

      List<ClassGroupModel> classgroup = [];

      for (var item in data['data']) {
        classgroup.add(
          ClassGroupModel.fromJson(item),
        );
      }

      return right(classgroup);
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
  Future<Either<Failure, List<ClassmateModel>>> getclassmate() async {
    try {
      var data = await dioConsumer.get(
        ApiEndpoint.classmateStudent,
      );

      List<ClassmateModel> classmate = [];

      for (var item in data['data']) {
        classmate.add(
          ClassmateModel.fromJson(item),
        );
      }

      return right(classmate);
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