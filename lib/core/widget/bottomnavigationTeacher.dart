import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';

class BottomnavigatoionTeacher extends StatelessWidget {
  const BottomnavigatoionTeacher({super.key, required this.select});

  final int select;

  void _onItemTapped(BuildContext context, int index) {
    if (index == select) return;

    final List<String> routes = [
      AppRouter.kteacherdash,
      AppRouter.kassignmentandtasks,
      AppRouter.ktaskandgrademonitor,
    ];

    GoRouter.of(context).go(routes[index]);
  }

  Widget iconButton(IconData iconData, int index) {
    final isSelected = select == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(0, isSelected ? -10.h : 0, 0),
      margin: EdgeInsets.only(top: isSelected ? 0 : 10.h),
      padding: EdgeInsets.all(isSelected ? 10.w : 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? kcolorOlive.withOpacity(0.12) : Colors.transparent,
      ),
      child: Icon(iconData, size: isSelected ? 32.sp : 28.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            spreadRadius: 3,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: kcolorOlive,
          unselectedItemColor: KcolorGrey,
          currentIndex: select,
          onTap: (index) => _onItemTapped(context, index),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            height: 2.0,
          ),
          unselectedLabelStyle: TextStyle(fontSize: 11.sp, height: 2.0),
          items: [
            BottomNavigationBarItem(
              icon: iconButton(Icons.home_filled, 0),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: iconButton(Icons.calendar_today_outlined, 1),
              label: 'الجدول',
            ),
            BottomNavigationBarItem(
              icon: iconButton(Icons.assignment, 2),
              label: 'المهام',
            ),
            BottomNavigationBarItem(
              icon: iconButton(Icons.quiz, 3),
              label: 'الأسئلة',
            ),
            BottomNavigationBarItem(
              icon: iconButton(Icons.menu, 4),
              label: 'المزيد',
            ),
          ],
        ),
      ),
    );
  }
}
