import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/calendar_repo.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/calendarmodel.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/taskandactivitymodel.dart';

abstract class CalendarState {}

class CalendarInitialState extends CalendarState {}

class CalendarLoadedState extends CalendarState {
  final String selectedTab;
  final List<EventModel> events;
  final List<ActivitiesModel> filteredActivities;

  CalendarLoadedState({
    required this.selectedTab,
    required this.events,
    required this.filteredActivities,
  });
}

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitialState());

  String selectedTab = 'الكل';
  final List<EventModel> events = MockCalendarData.eventsList;
  final List<ActivitiesModel> allActivities = MockCalendarData.activitiesList;

  void loadCalendarData() {
    emit(
      CalendarLoadedState(
        selectedTab: selectedTab,
        events: events,
        filteredActivities: getFilteredActivities(selectedTab),
      ),
    );
  }

  void changeTab(String newTab) {
    selectedTab = newTab;
    emit(
      CalendarLoadedState(
        selectedTab: selectedTab,
        events: events,
        filteredActivities: getFilteredActivities(newTab),
      ),
    );
  }

  List<ActivitiesModel> getFilteredActivities(String tab) {
    if (tab == 'الكل') return allActivities;
    return allActivities.where((item) => item.category == tab).toList();
  }
}
