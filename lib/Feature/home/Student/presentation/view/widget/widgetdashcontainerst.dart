import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/linearPrecent.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';

Widget dashcontainerst({required double attendanceRate, required double averageGrade}) {

  final double attendancePercent = attendanceRate.clamp(0.0, 100.0);
  final double gradePercent = averageGrade.clamp(0.0, 100.0);

  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [

      Container(
        height: 180.sp,
        width: 160.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(4, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("الحضور", style: TextSt.textstyle14),
                  Spacer(),
                  Icon(
                    Icons.verified_user_outlined,
                    color: kcolorOlive,
                    size: 25.sp,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.sp),
            Text("${attendanceRate.toStringAsFixed(0)}%", style: TextSt.textstyle24),
            SizedBox(height: 16.sp),
            Text(
              attendanceRate >= 90 ? "ملتزم جداً" : "جيد",
              style: TextSt.textstyle17.copyWith(color: kcolorOlive),
            ),
            SizedBox(height: 12.sp),
            SizedBox(
              width: 150.sp,
              child: LinearPercentIndicator(
                isRTL: true,
                padding: EdgeInsets.zero,
                lineHeight: 8,
                percent: attendancePercent / 100,
                barRadius: Radius.circular(20.sp),
                backgroundColor: Colors.grey.shade300,
                progressColor: getProgressColor(attendancePercent),
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 40.sp),
   
      Container(
        height: 180.sp,
        width: 160.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(4, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("المعدل", style: TextSt.textstyle14),
                  Spacer(),
                  Icon(Icons.stars_outlined, size: 25.sp, color: kcolorOlive),
                ],
              ),
            ),
            SizedBox(height: 16.sp),
            Text(averageGrade.toStringAsFixed(2), style: TextSt.textstyle24),
            SizedBox(height: 16.sp),Text(
              "من 100",
              style: TextSt.textstyle17.copyWith(color: kcolorOlive),
            ),
            SizedBox(height: 12.sp),
            SizedBox(
              width: 150.sp,
              child: LinearPercentIndicator(
                isRTL: true,
                padding: EdgeInsets.zero,
                lineHeight: 8,
                percent: gradePercent / 100,
                barRadius: Radius.circular(20.sp),
                backgroundColor: Colors.grey.shade300,
                progressColor: getProgressColor(gradePercent),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Color getProgressColor(double progress) {
  if (progress >= 90) {
    return const Color(0xFF2E7D32);
  } else if (progress >= 60) {
    return const Color(0xFFF9A825);
  } else {
    return const Color(0xFFC62828);
  }
}