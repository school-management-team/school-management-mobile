import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';

class generaloverview extends StatelessWidget {
  final int allquestions;
  final int savedquestion;
  final int addrecently;

  const generaloverview({
    super.key,
    required this.allquestions,
    required this.savedquestion,
    required this.addrecently,
  });
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 342.w,
        height: 260.h,
        // margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Color(0xFF000000).withOpacity(0.05),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF071A2F).withOpacity(0.05),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics_outlined,
                  color: Color(0xFF006C49),
                  size: 20,
                ),
                SizedBox(width: 7.w),
                Text(
                  "نظرة عامة ",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "إجمالي الأسئلة",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF44474D),
                  ),
                ),
                Text(
                  "${allquestions}",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.h),

            Divider(color: Color(0xFF44474D).withOpacity(0.2)),
            SizedBox(height: 7.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  "أسئلتي المحفوظة",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF44474D),
                  ),
                ),
                Text(
                  "${savedquestion}",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Divider(color: Color(0xFF44474D).withOpacity(0.2)),
            SizedBox(height: 7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  "تم إضافتها مؤخرا",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF44474D),
                  ),
                ),
                Text(
                  "${allquestions}",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
