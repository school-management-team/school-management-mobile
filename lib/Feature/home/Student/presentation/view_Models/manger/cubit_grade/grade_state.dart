
import 'package:school/Feature/home/Student/Data/models/StudentGradesResponseModel.dart';

sealed class Equatable {}



abstract class StudentGradesState extends Equatable {
  
}

class StudentGradesInitial extends StudentGradesState {}

class StudentGradesLoading extends StudentGradesState {}

class StudentGradesSuccess extends StudentGradesState {
  final StudentGradesResponseModel studentGradesResponse;

   StudentGradesSuccess({required this.studentGradesResponse});

}

class StudentGradesFailure extends StudentGradesState {
  final String errormessage;

   StudentGradesFailure({required this.errormessage});

  
}