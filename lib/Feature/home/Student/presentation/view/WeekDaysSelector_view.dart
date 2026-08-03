import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Student/presentation/view/WeekDaysSelector_view_body.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigator/bottomNavigatoionBar.dart';
import 'package:school/core/widget/bottomnavigator/bottomfive_home_student.dart';


class WeekdaysselectorView extends StatefulWidget {
  @override
  WeekdaysselectorViewstate createState() => WeekdaysselectorViewstate();
}

class WeekdaysselectorViewstate extends State<WeekdaysselectorView> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(child: SchoolWeekSelector()),
    );
  }
}