


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class inforcontainer extends StatelessWidget {
  const inforcontainer({
    super.key,
    required this.maintitle,
    required this.subtitle,
    required this.lasttitle,
    this.icon,
    this.color,
    required this.subtitle2,
  });
  final String maintitle;
  final String subtitle;
  final String subtitle2;
  final String lasttitle;
  final Icon? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.sp,
      width: 400.sp,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0XFF2A1700).withOpacity(0.2)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50.sp,
                  width: 50.sp,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: KcolorGrey.withOpacity(0.2)),
                  ),
                  child: icon,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(maintitle, style: TextSt.textstyle17),
                    SizedBox(height: 8.h),
                    Text(
                      subtitle,
                      style: TextSt.textstyle14.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      subtitle2,
                      style: TextSt.textstyle14.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(lasttitle, style: TextSt.textstyle12),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
