import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Student/presentation/view/tasksandhomework_view_body.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigator/bottomfive_home_student.dart';


class TasksandhomeworkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 40.sp),
        leadingWidth: 43,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "  مدارس المستقبل",
              style: TextSt.textstyle28.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 22.sp,
                fontFamily: 'normal',
              ),
            ),
            SizedBox(width: 12.sp),
            CircleAvatar(
              radius: 30.sp,
              backgroundImage: AssetImage(AssestData.studentprofile),
              backgroundColor: Colors.white,
            ),

            Spacer(),
            Lottie.asset(AssestData.notification, width: 55.sp),
          ],
        ),
      ),
      bottomNavigationBar: BottomfiveHomeStudent(select: 3),
      body: SafeArea(child: TasksandhomeworkViewBody())
    );
  }
}