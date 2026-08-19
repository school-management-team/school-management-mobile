

import 'package:school/Feature/home/Student/Data/models/classmate.dart';

sealed class ClassmateState {}

final class ClassmateStateInitial extends ClassmateState {}
final class ClassmateStateLoading extends ClassmateState {}
final class ClassmateStateFailuer extends ClassmateState {
 final String errmessage;
ClassmateStateFailuer({required this.errmessage});
}
final class ClassmateStateSuccess extends ClassmateState {
  final List<ClassmateModel>classmateModel;

  ClassmateStateSuccess({required this.classmateModel});
}