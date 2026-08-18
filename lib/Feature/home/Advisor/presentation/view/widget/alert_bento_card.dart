import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';

class AlertBentoCard extends StatelessWidget {
  final String title;
  final String studentName;
  final String description;
  final String date;
  final String statusText;
  final IconData statusIcon;
  final Color statusBgColor;
  final Color statusTextColor;
  final Color edgeColor;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const AlertBentoCard({
    super.key,
    required this.title,
    required this.studentName,
    required this.description,
    required this.date,
    required this.statusText,
    required this.statusIcon,
    required this.statusBgColor,
    required this.statusTextColor,
    required this.edgeColor,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF091C31).withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF071A2F).withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
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
              width: 5.w,
              decoration: BoxDecoration(
                color: edgeColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                        SizedBox(width: 10.w),
                        Column(
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
                            Text(
                              "الطالب: $studentName",
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 13.sp,
                                color: KcolorGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(statusIcon,
                              color: statusTextColor, size: 14.sp),
                          SizedBox(width: 4.w),
                          Text(
                            statusText,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: statusTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 14.sp,
                    color: const Color(0xFF1C1C18),
                  ),
                ),
                SizedBox(height: 12.h),
                Divider(color: Colors.grey.withOpacity(0.15)),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined,
                            size: 14.sp, color: KcolorGrey),
                        SizedBox(width: 4.w),
                        Text(
                          date,
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 13.sp,
                            color: KcolorGrey,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            "التفاصيل",
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: kcolorOlive,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Icon(Icons.arrow_back_ios_new,
                              size: 12.sp, color: kcolorOlive),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
