import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/core/router_app.dart';

class QuickActionsBentoGrid extends StatelessWidget {
  const QuickActionsBentoGrid({super.key});

  Widget _buildBentoItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F3ED),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Colors.black.withOpacity(0.05),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 22.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1C1C18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "إجراءات سريعة",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1C1C18),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildBentoItem(
                context: context,
                title: "التنبيهات",
                icon: Icons.campaign_rounded,
                iconBgColor: const Color(0xFFFFDAD6),
                iconColor: const Color(0xFFBA1A1A),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kadvisoralerts);
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _buildBentoItem(
                context: context,
                title: "نقل طالب",
                icon: Icons.swap_horiz_rounded,
                iconBgColor: const Color(0xFFD3E4FF),
                iconColor: const Color(0xFF091C31),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kstudenttransfer);
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _buildBentoItem(
                context: context,
                title: "التحضير",
                icon: Icons.how_to_reg_rounded,
                iconBgColor: const Color(0xFF6CF8BB),
                iconColor: const Color(0xFF00714D),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kadvisorattendance);
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _buildBentoItem(
                context: context,
                title: "الجدول",
                icon: Icons.event_note_rounded,
                iconBgColor: const Color(0xFFFFDDB8),
                iconColor: const Color(0xFF2A1700),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kadvisorschedule);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
