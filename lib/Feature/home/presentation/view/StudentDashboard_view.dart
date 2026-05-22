import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/presentation/view/StudentDashboard_body_view.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/bottomNavigatoionBar.dart';
import 'package:school/core/widget/Text/text_style.dart';

class StudentdashboardView extends StatelessWidget {
  const StudentdashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 20.sp),

        backgroundColor: Colors.white,
        leading: CircleAvatar(
          radius: 30.sp,
          backgroundImage: AssetImage(AssestData.studentDashboard),
          backgroundColor: Colors.white,
        ),
        title: Text(
          "Academic Portal",
          style: TextSt.textstyle28.copyWith(
            color: kcolorgreen,
            fontWeight: FontWeight.w900,
            fontSize: 22.sp,
            fontFamily: 'normal',
          ),
        ),
        centerTitle: true,
        actions: [
        /*  Icon(
            Icons.notifications_none_rounded,
            size: 35.sp,
            color: KcolorGrey.withOpacity(0.8),
          ),*/
          Lottie.asset(AssestData.notification,width: 55.sp)
        ],
      ),
      bottomNavigationBar:   
           Bottomnavigatoion(select: 0,),
      body: StudentdashboardBodyView(),
    );
  }
}
