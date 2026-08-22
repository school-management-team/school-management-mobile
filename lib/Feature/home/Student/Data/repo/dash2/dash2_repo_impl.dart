import 'package:dartz/dartz.dart';

import 'package:school/Feature/home/Student/Data/models/ImportantAnnouncementModel.dart';
import 'package:school/Feature/home/Student/Data/models/ImportantAnnouncementResponseModel.dart';
import 'package:school/Feature/home/Student/Data/repo/dash2/dash2_repo.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/api/endpoint.dart';
import 'package:school/core/api/errors/Failure.dart';

class Dash2RepoImpl implements Dash2Repo {
  final DioConsumer api;

  Dash2RepoImpl({
    required this.api,
  });

  @override
  Future<Either<
      Failure,
      Map<DateTime, Map<String, dynamic>>>>
      getclanderEvents() async {
    try {
      final response = await api.get(
        ApiEndpoint.announcementsimportantdates,
      );

      final announcementResponse =
          ImportantAnnouncementResponseModel
              .fromJson(response);

      final List<ImportantAnnouncementModel>
          listData =
          announcementResponse.data ?? [];

      final Map<DateTime, Map<String, dynamic>>
          eventsMap = {};

      for (final item in listData) {
        if (item.date == null) {
          continue;
        }

        final parsedDate =
            DateTime.parse(item.date!);

        final normalizedDate = DateTime(
          parsedDate.year,
          parsedDate.month,
          parsedDate.day,
        );

        eventsMap[normalizedDate] = {
          'name': item.title ?? '',
          'type': item.type ?? 'academic',
          'description':
              item.description ?? '',
        };
      }

      return right(eventsMap);
    } catch (e) {
      return left(
        serverFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<
      Failure,
      List<ImportantAnnouncementModel>>>
      getAnnouncements() async {
    try {
      final response = await api.get(
        ApiEndpoint.announcementsupcoming,
      );

      final announcementResponse =
          ImportantAnnouncementResponseModel
              .fromJson(response);

      return right(
        announcementResponse.data ?? [],
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