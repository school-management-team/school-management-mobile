import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';

class BottomNavigationAdvisor extends StatelessWidget {
  final int select;
  const BottomNavigationAdvisor({super.key, required this.select});

  void _onItemTapped(BuildContext context, int index) {
    if (index == select) return;

    switch (index) {
      case 0:
        GoRouter.of(context).go(AppRouter.kadvisordash);
        break;
      case 1:
        GoRouter.of(context).push(AppRouter.kadvisoroverview);
        break;
      case 2:
        GoRouter.of(context).push(AppRouter.kadvisorstaff);
        break;
      case 3:
        GoRouter.of(context).push(AppRouter.kadvisorschedule);
        break;
      case 4:
        GoRouter.of(context).push(AppRouter.kadvisorattendance);
        break;
    }
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 22.sp,
          color: isSelected ? kcolorOlive : KcolorGrey.withOpacity(0.7),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 11.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? kcolorOlive : KcolorGrey.withOpacity(0.7),
          ),
        ),
        if (isSelected)
          Container(
            margin: EdgeInsets.only(top: 2.h),
            height: 3.h,
            width: 16.w,
            decoration: BoxDecoration(
              color: kcolorOlive,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF071A2F).withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => _onItemTapped(context, 0),
            child: _buildNavItem(
              icon: Icons.dashboard_rounded,
              label: 'الرئيسية',
              index: 0,
              isSelected: select == 0,
            ),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(context, 1),
            child: _buildNavItem(
              icon: Icons.grid_view_rounded,
              label: 'نظرة عامة',
              index: 1,
              isSelected: select == 1,
            ),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(context, 2),
            child: _buildNavItem(
              icon: Icons.group_rounded,
              label: 'الكادر',
              index: 2,
              isSelected: select == 2,
            ),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(context, 3),
            child: _buildNavItem(
              icon: Icons.calendar_month_rounded,
              label: 'الجدول',
              index: 3,
              isSelected: select == 3,
            ),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(context, 4),
            child: _buildNavItem(
              icon: Icons.fact_check_rounded,
              label: 'الحضور',
              index: 4,
              isSelected: select == 4,
            ),
          ),
        ],
      ),
    );
  }
}
