import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/dashboardcubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/gradecubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/dashboard_repo.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/grade_repo.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/teacherdashboard_body_view.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/bottomnavigationTeacher.dart';

class teacherdashview extends StatelessWidget {
  const teacherdashview({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => globalDashboardCubit,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64.h,
          backgroundColor: Color(0xFFFFFFFF),
          shadowColor: Colors.black.withOpacity(0.4),
          elevation: 0.7,

          // shadowColor: Colors.black.withOpacity(0.08),
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //width: 186.77.w,
                  //height: 32.h,
                  child: Container(
                    height: 50.h,
                    width: 37.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9999.r),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_outlined),
                      color: Color(0xFF10B981),
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                Container(
                  // width: 142.77.w,
                  height: 28.h,
                  child: Text(
                    "مدارس القمة الأكاديمية",
                    style: TextStyle(
                      fontSize: 27.59.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                SizedBox(width: 3.w),

                Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999.r),
                    image: DecorationImage(
                      image: AssetImage(AssestData.profile),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        /* bottomNavigationBar: Container(
            width: 390.w,
            height: 80.h,
            padding: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF).withOpacity(0.85),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: Offset(0, -9),
                ),
              ],
            ),
            child: SafeArea(
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: Color(0xFF1B5E20),
                unselectedItemColor: Color(0xFF071A2F),
                selectedLabelStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12,
                  height: 1.3.h,
                ),
                type: BottomNavigationBarType.fixed,
                iconSize: 20,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(child: Icon(Icons.home_filled)),
                    label: 'الرئيسية',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month_outlined),
                    label: 'الجدول',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.messenger_outline),
                    label: 'الرسائل',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined),
                    label: 'الملف',
                  ),
                ],
              ),
            ),
          ),*/
        bottomNavigationBar: BottomnavigatoionTeacher(select: 0),
        backgroundColor: Color(0xFFFFFFFF),
        body: SafeArea(child: teacherdashbody()),
      ),
    );
  }
}
