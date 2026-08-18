import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';

Widget buildStudyGroupCard(
  String title,
  String subtitle,
  String iconText,
  Color color,
) {
  return Container(
    width: 300.sp,

    margin: EdgeInsets.only(right: 16, bottom: 12.sp),
    padding: EdgeInsets.all(16.sp),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.sp),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: const Offset(6, 6),
          blurRadius: 2,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 120.sp,
              height: 45.sp,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 14.sp,
                    backgroundColor: Colors.grey[200],
                    child: Text("+8", style: TextStyle(fontSize: 8.sp)),
                  ),
                  Positioned(
                    left: 40,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage(AssestData.studentprofile),
                    ),
                  ),
                  Positioned(
                    left: 60.sp,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.sp,
                        vertical: 8.sp,
                      ),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: Text(
                        iconText,
                        style: TextSt.textstyle16.copyWith(color: color),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 10.sp),
        Text(title, style: TextSt.textstyle16),
        SizedBox(height: 10.sp),
        Text(subtitle, style: TextSt.textstyle14.copyWith(color: Colors.grey)),

        SizedBox(
          width: double.infinity,

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kcolorOlive,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp),
              ),
            ),
            onPressed: () {},
            child: Text(
              "انضمام الآن",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ),
      ],
    ),
  );
}
