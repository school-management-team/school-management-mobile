import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';

class DailySummaryGlassCard extends StatelessWidget {
  const DailySummaryGlassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: kcolorNavyBlue.withOpacity(0.05),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF071A2F).withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.assessment_rounded,
                    color: kcolorOlive,
                    size: 24.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "ملخص الحضور اليومي",
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: kcolorNavyBlue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "٩٥٪",
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: kcolorOlive,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "حضور الطلاب",
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14.sp,
                              color: KcolorGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "٩٨٪",
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "حضور الكادر",
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14.sp,
                              color: KcolorGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "اكتمال الحصص",
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 14.sp,
                      color: KcolorGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "٤٥/٥٠ حصة",
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 14.sp,
                      color: KcolorGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(999.r),
                child: LinearProgressIndicator(
                  value: 0.9,
                  minHeight: 8.h,
                  backgroundColor: kcolorNavyBlue.withOpacity(0.1),
                  valueColor: const AlwaysStoppedAnimation<Color>(kcolorOlive),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
