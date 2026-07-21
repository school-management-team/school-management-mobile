import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Student/presentation/view/profile_student_body_view.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigator/bottomNavgtion_fiveitems.dart';
import 'package:school/core/widget/bottomnavigator/bottomNavigatoionBar.dart';

class ProfileStudentView extends StatelessWidget {
  const ProfileStudentView({super.key});

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
              " نيو أكاديميك",
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
              backgroundImage: AssetImage(AssestData.studentDashboard),
              backgroundColor: Colors.white,
            ),

            Spacer(),
            Lottie.asset(AssestData.notification, width: 55.sp),
          ],
        ),
      ),
      bottomNavigationBar: BottomnavgtionFiveitems(select: 3),
      body: SafeArea(child: ProfileStudentBodyView()),
    );
  }
}
