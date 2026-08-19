
import 'package:school/Feature/home/Student/Data/models/classgroup.dart';

sealed class ClassgroupState {}

final class ClassgroupStateInitial extends ClassgroupState {}
final class ClassgroupStateLoading extends ClassgroupState {}
final class ClassgroupStateFailuer extends ClassgroupState {
 final String errmessage;
ClassgroupStateFailuer({required this.errmessage});
}
final class ClassgroupStateSuccess extends ClassgroupState {
  final List< ClassGroupModel> group;

  ClassgroupStateSuccess({required this.group});
}
