import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:school/Feature/home/Student/Data/repo/dashboard1/student_dashboard_repo.dart';

part 'dashboard1_student_state.dart';

class Dashboard1StudentCubit extends Cubit<Dashboard1StudentState> {
  Dashboard1StudentCubit(this.studentDashboardRepo)
    : super(Dashboard1StudentInitial());
  final StudentDashboardRepo studentDashboardRepo;
  Future<void> getStudentDashboardData() async {
    emit(Dashboard1StudentLoading());
    final result = await studentDashboardRepo.getStudentDashboard();
    result.fold(
      (failure) =>
          emit(Dashboard1StudentFailure(errMessage: failure.errorMessage)),

      (success) => emit(Dashboard1StudentSuccess()),
    );
  }
}
