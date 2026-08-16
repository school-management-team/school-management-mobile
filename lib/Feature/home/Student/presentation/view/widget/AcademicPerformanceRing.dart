import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/PercentageRingPainter.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class AcademicPerformanceRing extends StatelessWidget {
  final int percentageInt;

  const AcademicPerformanceRing({super.key, required this.percentageInt});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 400.sp,
        width: 520.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: KcolorGrey.withOpacity(0.2)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
          child: ListView(
            children: [
              Text(
                "                          الأداء العام",
                style: TextSt.textstyle28,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 16.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  GradeCircle(grade: percentageInt.toDouble(), text: ""),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 60.sp),
                      Text(
                        getGradeText(percentageInt.toDouble()),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: getGradeColor(percentageInt.toDouble()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.sp),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                child: Row(
                  children: [
                    Container(
                      height: 70.sp,
                      width: 120.sp,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: KcolorGrey.withOpacity(0.2)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("السلوك", style: TextSt.textstyle14),
                          Text(
                            getGradeLetter(percentageInt.toDouble()),
                            style: TextSt.textstyle24.copyWith(
                              color: getGradeColor(percentageInt.toDouble()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 70.sp,
                      width: 120.sp,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: KcolorGrey.withOpacity(0.2)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("الغياب", style: TextSt.textstyle14),
                          Text("أيام2", style: TextSt.textstyle14),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getGradeText(double grade) {
    if (grade >= 85) {
      return "ممتاز";
    } else if (grade >= 70) {
      return "جيد جداً";
    } else if (grade >= 50) {
      return "جيد";
    } else {
      return "ضعيف";
    }
  }

  Color getGradeColor(double grade) {
    if (grade >= 85) {
      return kcolorOlive;
    } else if (grade >= 70) {
      return Colors.green;
    } else if (grade >= 50) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getGradeLetter(double grade) {
    if (grade >= 90) {
      return "A+";
    } else if (grade >= 70) {
      return "A";
    } else if (grade >= 50) {
      return "B";
    } else {
      return "C";
    }
  }
}
