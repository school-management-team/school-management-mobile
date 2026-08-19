

import 'package:bloc/bloc.dart';
import 'package:school/Feature/home/Student/Data/models/classgroup.dart';
import 'package:school/Feature/home/Student/Data/repo/friend/friend_repo.dart';

import 'classgroup_state.dart';

class ClassgroupCubit extends Cubit<ClassgroupState> {
  ClassgroupCubit(this.friendRepo) : super(ClassgroupStateInitial());
  final FriendRepo friendRepo;

  Future<void>getClassgroupData()async{
    emit(ClassgroupStateLoading());
    var result=await friendRepo.getclassfriend();
    result.fold((failure)=>emit(ClassgroupStateFailuer(errmessage: failure.errorMessage)),
     (group)=>emit(ClassgroupStateSuccess(group:group )));
  }
}