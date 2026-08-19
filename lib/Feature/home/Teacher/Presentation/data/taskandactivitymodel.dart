import 'package:flutter/widgets.dart';

class ClassModel {
  final String id;
  final String classname;
  final String subjectname;
  final int studentcount;
  final String typeoftask;
  final IconData iconData;
  final Color iconBackgroundColor;
  final Color iconColor;
  ClassModel({
    required this.id,
    required this.classname,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.iconData,
    required this.studentcount,
    required this.subjectname,
    required this.typeoftask,
  });
}

class ActivityModel {
  final String id;
  final String title;
  final String subtitle;
  final String? updatetext;
  final bool isCompleted;
  ActivityModel({
    required this.id,
    required this.title,
    required this.subtitle,
    this.updatetext,
    required this.isCompleted,
  });
}
