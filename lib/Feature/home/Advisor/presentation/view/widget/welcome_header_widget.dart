import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';

class WelcomeHeaderWidget extends StatelessWidget {
  const WelcomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "صباح الخير، أ. أحمد",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1C1C18),
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 16.sp,
              color: KcolorGrey,
            ),
            SizedBox(width: 6.w),
            Text(
              "الأحد، ١٥ أكتوبر ٢٠٢٣",
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 15.sp,
                color: KcolorGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
