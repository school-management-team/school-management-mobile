import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';

class statcardwithprogress extends StatelessWidget {
  final String val1;
  final Widget icon;
  final double progressvalue;

  const statcardwithprogress({
    super.key,
    required this.val1,
    required this.icon,
    required this.progressvalue,
  });
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 400.w,
        // height: 185.h,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Color(0xFFFCF9F3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [icon]),
            SizedBox(height: 16.h),
            Container(
              width: 292.w,
              height: 84.18.h,
              child: SizedBox(
                height: 58.h,
                width: 105.84.w,
                child: Text(
                  '${progressvalue.toInt()}%',
                  style: TextStyle(
                    color: Color(0xFF091C31),
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: 292.w,
              height: 26.59.h,
              padding: EdgeInsets.only(bottom: 0.59),
              child: SizedBox(
                height: 26.h,
                width: 93.77.w,
                child: Text(
                  val1,
                  style: TextStyle(color: Color(0xFF44474D), fontSize: 16.sp),
                ),
              ),
            ),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(9999.r),
              minHeight: 8.h,
              valueColor: AlwaysStoppedAnimation<Color>(kcolorOlive),
              backgroundColor: Color(0xFF071A2F).withOpacity(0.1),
              value: progressvalue / 100,
            ),
          ],
        ),
      ),
    );
  }
}
