import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';

class RecentActivitiesFeed extends StatelessWidget {
  const RecentActivitiesFeed({super.key});

  Widget _buildActivityCard({
    required String title,
    required String subtitle,
    required String time,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required Color borderColor,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 4.w,
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 20.sp),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1C1C18),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 14.sp,
                          color: KcolorGrey,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        time,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 12.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "أحدث النشاطات",
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1C1C18),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "عرض الكل",
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: kcolorOlive,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        _buildActivityCard(
          title: "اعتماد خطة درس",
          subtitle: "تم اعتماد خطة مادة الرياضيات للأستاذ محمود.",
          time: "منذ ١٥ دقيقة",
          icon: Icons.assignment_turned_in_rounded,
          iconColor: kcolorOlive,
          iconBgColor: const Color(0xFF6CF8BB).withOpacity(0.2),
          borderColor: kcolorOlive,
        ),
        _buildActivityCard(
          title: "تأخر معلم",
          subtitle: "تم تسجيل تأخر الأستاذ خالد عن الحصة الأولى.",
          time: "منذ ساعة",
          icon: Icons.warning_rounded,
          iconColor: const Color(0xFFBA1A1A),
          iconBgColor: const Color(0xFFFFDAD6).withOpacity(0.4),
          borderColor: const Color(0xFFBA1A1A),
        ),
      ],
    );
  }
}
