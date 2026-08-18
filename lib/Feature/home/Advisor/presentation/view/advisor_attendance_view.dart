import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Advisor/presentation/view/advisor_attendance_body_view.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/bottom_navigation_advisor.dart';

class AdvisorAttendanceView extends StatelessWidget {
  const AdvisorAttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFCF9F3),
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: const AssetImage(AssestData.profile),
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 10.w),
              Text(
                "تحضير الطلاب",
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF10B981),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Lottie.asset(AssestData.notification, width: 45.sp),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavigationAdvisor(select: 4),
        body: const SafeArea(
          child: AdvisorAttendanceBodyView(),
        ),
      ),
    );
  }
}
