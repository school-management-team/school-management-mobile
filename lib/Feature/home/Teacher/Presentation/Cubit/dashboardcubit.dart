import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/dashboard_repo.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/dashboardmodel.dart';

abstract class DashBoardState {}

class DashBoardInitial extends DashBoardState {}

class DashBoardLoading extends DashBoardState {}

class DashBoardLoaded extends DashBoardState {
  final Dashboardmodel data;
  DashBoardLoaded(this.data);
}

class DashBoardError extends DashBoardState {
  final String message;
  DashBoardError(this.message);
}

class DashBoardCubit extends Cubit<DashBoardState> {
  final DashboardRepo repo;
  DashBoardCubit(this.repo) : super(DashBoardInitial());
  Future<void> fetchdashboarddata() async {
    emit(DashBoardLoading());
    try {
      final data = await repo.getDashBoardData();
      emit(DashBoardLoaded(data));
    } catch (e) {
      print("dashboard error:$e");
      emit(DashBoardError('فشل تحميل البيانات'));
    }
  }
}

final globalDashboardCubit = DashBoardCubit(DashboardRepo());
