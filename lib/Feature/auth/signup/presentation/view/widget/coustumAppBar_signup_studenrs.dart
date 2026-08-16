import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/core/widget/Text/text_style.dart';

class CustomAppBarSignupStudents extends StatelessWidget {
  const CustomAppBarSignupStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8.w, vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Academia Neo",
            style: TextSt.textstyle16.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          SizedBox(width: 16.w),
          Container(
            width: 50.w,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0XffEBE8E2),
            ),
            child: Icon(Icons.account_balance),
            //Image.asset(AssestData.Mainlogo,width: 50 ,fit: BoxFit.fill,)
          ),
        ],
      ),
    );
  }
}
