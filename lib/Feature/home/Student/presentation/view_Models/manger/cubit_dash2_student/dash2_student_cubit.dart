import 'package:bloc/bloc.dart';

import 'package:school/Feature/home/Student/Data/models/ImportantAnnouncementModel.dart';
import 'package:school/Feature/home/Student/Data/repo/dash2/dash2_repo.dart';

part 'dash2_student_state.dart';

class Dash2StudentCubit
    extends Cubit<Dash2StudentState> {
  Dash2StudentCubit(this.dash2repo)
      : super(Dash2StudentInitial());

  final Dash2Repo dash2repo;

  Future<void> fetchCalendarData() async {
    emit(Dash2StudentLoading());

    final eventsResult =
        await dash2repo.getclanderEvents();

    if (isClosed) return;

    final announcementsResult =
        await dash2repo.getAnnouncements();

    if (isClosed) return;

    eventsResult.fold(
      (failure) {
        emit(
          Dash2StudentFailure(
            message: failure.errorMessage,
          ),
        );
      },
      (events) {
        announcementsResult.fold(
          (failure) {
            emit(
              Dash2StudentFailure(
                message: failure.errorMessage,
              ),
            );
          },
          (announcements) {
            emit(
              Dash2StudentSuccess(
                events: events,
                announcements:
                    announcements,
              ),
            );
          },
        );
      },
    );
  }
}