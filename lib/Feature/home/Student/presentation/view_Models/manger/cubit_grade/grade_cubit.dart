

import 'package:bloc/bloc.dart';
import 'package:school/Feature/home/Student/Data/repo/grade/grade_repo.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_grade/grade_state.dart';

class StudentGradesCubit extends Cubit<StudentGradesState> {
  final StudentRepository studentRepository;

  StudentGradesCubit({required this.studentRepository})
      : super(StudentGradesInitial());

  Future<void> getStudentGrades() async {
    emit(StudentGradesLoading());

    final result = await studentRepository.getStudentGrades();

    result.fold(
      (failure) {
          if (!isClosed) {
       emit(StudentGradesFailure(errormessage: failure.errorMessage));}},
      (gradesModel) {  if (!isClosed) { emit(StudentGradesSuccess(studentGradesResponse: gradesModel));}},
    );
  }
}