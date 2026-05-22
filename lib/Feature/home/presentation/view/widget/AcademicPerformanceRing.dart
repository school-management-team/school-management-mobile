import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class AcademicPerformanceRing extends StatelessWidget {
  final int percentageInt;

  AcademicPerformanceRing({required this.percentageInt});

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
                  CustomPaint(
                    size: Size(150.sp, 150.sp),
                    painter: PercentageRingPainter(
                      percentage: percentageInt / 100.sp,
                      baseColor: KcolorGrey,

                      progressColor: getcolor(percentageInt),
                      strokeWidth: 8.sp,
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "$percentageInt",
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text("%", style: TextSt.textstyle24),
                        ],
                      ),
                      if (percentageInt >= 90)
                        Text(
                          "ممتاز",
                          style: TextSt.textstyle16.copyWith(
                            color: kcolorOlive,
                          ),
                        )
                      else if (percentageInt >= 70)
                        Text(
                          "جيد جداً",
                          style: TextSt.textstyle16.copyWith(
                            color: kcolorOlive,
                          ),
                        )
                      else if (percentageInt >= 50)
                        Text(
                          "جيد ",
                          style: TextSt.textstyle16.copyWith(
                            color: Colors.deepOrangeAccent,
                          ),
                        )
                      else
                        Text(
                          "سيء ",
                          style: TextSt.textstyle16.copyWith(color: Colors.red),
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

                          if (percentageInt >= 90)
                            Text(
                              "A+",
                              style: TextSt.textstyle24.copyWith(
                                color: kcolorOlive,
                              ),
                            )
                          else if (percentageInt >= 70)
                            Text(
                              " A",
                              style: TextSt.textstyle24.copyWith(
                                color: kcolorOlive,
                              ),
                            )
                          else if (percentageInt >= 50)
                            Text(
                              "B ",
                              style: TextSt.textstyle24.copyWith(
                                color: Colors.deepOrangeAccent,
                              ),
                            )
                          else
                            Text(
                              "C ",
                              style: TextSt.textstyle24.copyWith(
                                color: Colors.red,
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
}

class PercentageRingPainter extends CustomPainter {
  final double percentage;
  final Color baseColor;
  final Color progressColor;
  final double strokeWidth;

  PercentageRingPainter({
    required this.percentage,
    required this.baseColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (min(size.width.sp, size.height.sp) - strokeWidth) / 2.sp;

    Paint basePaint = Paint()
      ..color = baseColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, basePaint);

    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double sweepAngle = 2.sp * pi * percentage;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2.sp,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(PercentageRingPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}

Color getcolor(int score) {
  if (score >= 90)
    return kcolorOlive;
  else if (score >= 70)
    return kcolorOlive;
  else if (score >= 50)
    return Colors.deepOrangeAccent;
  else
    return Colors.red;
}
