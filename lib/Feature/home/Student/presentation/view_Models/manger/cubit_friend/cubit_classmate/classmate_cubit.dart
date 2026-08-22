
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:school/Feature/home/Student/Data/models/classgroup.dart';
import 'package:school/Feature/home/Student/Data/models/classmate.dart';
import 'package:school/Feature/home/Student/Data/repo/friend/friend_repo.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_friend/cubit_classmate/classmate_state.dart';

class ClassmateCubit extends Cubit<ClassmateState> {
  ClassmateCubit(this.friendRepo) : super(ClassmateStateInitial());
  final FriendRepo friendRepo;

Future<void> getClassmateData() async {
  emit(ClassmateStateLoading());
  
  var result = await friendRepo.getclassmate();
  

  if (isClosed) return; 

  result.fold(
    (failure) {
      if (!isClosed) {
        emit(ClassmateStateFailuer(errmessage: failure.errorMessage));
      }
    },
    (list) {
      if (!isClosed) {
        emit(ClassmateStateSuccess(classmateModel: list));
      }
    },
  );
}}