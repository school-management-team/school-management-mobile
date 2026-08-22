import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/PercentageRingPainter.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class AttendanceAndAbsence extends StatelessWidget {
  final int percentageInt;
  final int lateCount;
  final int absentDays; 

  const AttendanceAndAbsence({
    super.key,
    required this.percentageInt,
    required this.lateCount,
    required this.absentDays,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 12.sp)),
                Text(
                  "الحضور والغياب",
                  style: TextSt.textstyle28,
                  textAlign: TextAlign.end,
                ),
                IconButton(
                  icon: Icon(
                    Icons.event_available,
                    color: kcolorOlive,
                    size: 40.sp,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Stack(
              alignment: Alignment.center,
              children: [
                GradeCircle(
                  grade: percentageInt.toDouble(),
                  text: "نسبة الحضور",
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [SizedBox(height: 60.sp)],
                ),
              ],
            ),
            SizedBox(height: 12.sp),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: Row(
                children: [
                  // بطاقة التأخير الحقيقية
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
                        Text(
                          "$lateCount", // عرض القيمة القادمة من الـ API
                          style: TextSt.textstyle14.copyWith(
                            color: Colors.amberAccent,
                          ),
                        ),
                        Text("تأخير", style: TextSt.textstyle14),
                      ],
                    ),
                  ),
                  Spacer(),
                  // بطاقة أيام الغياب الحقيقية
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
                        Text("$absentDays", // عرض القيمة القادمة من الـ API
                          style: TextSt.textstyle14.copyWith(
                            color: Colors.redAccent,
                          ),
                        ),
                        Text("أيام غياب", style: TextSt.textstyle14),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}