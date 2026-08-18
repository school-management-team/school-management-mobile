import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Advisor/presentation/view/advisor_dashboard_body.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/bottom_navigation_advisor.dart';

class AdvisorDashboardView extends StatelessWidget {
  const AdvisorDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFCF9F3),
        appBar: AppBar(
          toolbarHeight: 64.h,
          backgroundColor: Colors.white,
          elevation: 0.5,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                  image: const DecorationImage(
                    image: AssetImage(AssestData.profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                "الموجه التربوي",
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined),
                color: Colors.black,
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavigationAdvisor(select: 0),
        body: const SafeArea(
          child: AdvisorDashboardBody(),
        ),
      ),
    );
  }
}
