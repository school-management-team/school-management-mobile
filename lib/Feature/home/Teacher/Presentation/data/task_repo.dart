import 'package:flutter/material.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/taskteachercubit.dart';

class TaskRepo {
  final List<Map<String, dynamic>> mocktasks = [
    {
      'tagtext': 'هام جدا',
      'title': 'مشروع الفيزياء',
      'description': 'عرض تقديمي عن الخلايا',
      'datetext': 'غدا 10 ص',
      'subjecttext': 'الفيزياء',
    },
  ];
  final ValueNotifier<List<Map<String, dynamic>>> tasknotifier = ValueNotifier(
    [],
  );

  Future<List<Map<String, dynamic>>> getTask() async {
    await Future.delayed(Duration(milliseconds: 500));
    tasknotifier.value = List.from(mocktasks);
    //,,,
    //...
    return tasknotifier.value;
  }

  Future<bool> addTask(Map<String, dynamic> taskData) async {
    await Future.delayed(Duration(milliseconds: 500));
    mocktasks.add(taskData);
    tasknotifier.value = List.from(mocktasks);
    //..
    //..
    return true;
  }
}
