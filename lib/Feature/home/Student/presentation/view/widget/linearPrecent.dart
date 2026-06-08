import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class linearcontainerprofile extends StatelessWidget {
  const linearcontainerprofile({
    super.key,
    required this.maintitle,
    required this.subtitle,
    required this.lasttitle,
    required this.text,
    this.color,
    required this.progress,
  });
  final String maintitle;
  final String subtitle;

  final String lasttitle;
  final String text;
  final Color? color;
  final int progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0XFF2A1700).withOpacity(0.2)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50.sp,
                      width: 80.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: KcolorGrey.withOpacity(0.2)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.sp,
                          vertical: 5.sp,
                        ),
                        child: Text(text, style: TextSt.textstyle14),
                      ),
                    ),Spacer(),
                    Text(maintitle, style: TextSt.textstyle17),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  subtitle,
                  style: TextSt.textstyle14.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                      Text("$progress %", style: TextSt.textstyle16.copyWith(color: getProgressColor(progress.toDouble()))),
                      Spacer(),
                    Text(lasttitle, style: TextSt.textstyle12),
                  ],
                ),
                SizedBox(height: 16.sp),
                SizedBox(
                  width: 400.sp,
                  child: LinearPercentIndicator(
                   isRTL: true,
                    padding: EdgeInsets.zero,
                    lineHeight: 10,
                    percent: progress.toDouble() / 100,
                    barRadius:  Radius.circular(20.sp),
                    backgroundColor: Colors.grey.shade300,
                    progressColor: getProgressColor(progress.toDouble()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color getProgressColor(double progress) {
    if (progress >= 90) {
      return const Color(0xFF2E7D32);
    } else if (progress >= 80) {
      return const Color(0xFFF9A825);
    } else {
      return const Color(0xFFC62828);
    }
  }
}
