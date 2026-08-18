import 'package:dartz/dartz.dart';
import 'package:school/Feature/home/Student/Data/repo/dash2/dash2_repo.dart';
import 'package:school/core/api/errors/Failure.dart';

class Dash2RepoImpl implements Dash2Repo {
  @override
  Future<Either<Failure, Map<DateTime, Map<String, dynamic>>>>
  getclanderEvents() async {
    try {
      final Map<DateTime, Map<String, dynamic>> events = {
        DateTime.utc(2026, 6, 21): {
          'name': 'امتحانات نهاية العام',
          'type': 'exam',
        },
        DateTime.utc(2026, 6, 25): {
          'name': 'يوم النشاط الطلابي',
          'type': 'activity',
        },
      };
      return right(events);
    } catch (e) {
      return left(serverFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getAnnouncements() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final List<Map<String, dynamic>> announcements = [];
      return right(announcements);
    } catch (e) {
      return left(serverFailure(errorMessage: e.toString()));
    }
  }
}
