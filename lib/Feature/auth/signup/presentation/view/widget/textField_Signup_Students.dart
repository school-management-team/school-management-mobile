

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class FieldSignupStudents extends StatelessWidget {
  const FieldSignupStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Text("رقم الهوية لولي الأمر ", style: TextSt.textstyle16),
          SizedBox(height: 16.h),
          TextFieldStyle(
            filledcolor: Color(0XFFFCF9F3),
            hinit: "أدخل رقم الهوية الوطنية أو الإقامة",
            textAlign: TextAlign.end,
            icontext: Icon(
              Icons.badge_outlined,
              color: kcolordarkBlue,
              size: 30,
            ),
          ),
          SizedBox(height: 20.h),
          Text(" الرقم الأكاديمي للطالب ", style: TextSt.textstyle16),
          SizedBox(height: 16.h),
          TextFieldStyle(
            filledcolor: Color(0XFFFCF9F3),

            hinit: "الرقم الجامعي أو المدرسي",
            textAlign: TextAlign.end,
            icontext: Icon(
              Icons.school_outlined,
              color: kcolordarkBlue,
              size: 30,
            ),
          ),

          SizedBox(height: 20.h),
          Row(
            children: [
              Text(
                " إرسال الرمز مجدداً ",
                style: TextSt.textstyle16.copyWith(color: kcolorOlive),
              ),
              Spacer(),
              Text(" رمز التحقق", style: TextSt.textstyle16),
              SizedBox(height: 16.h),
            ],
          ),
          SizedBox(height: 16.h),
          TextFieldStyle(
            filledcolor: Color(0XFFFCF9F3),
            hinit: "-----",
            icontext: Icon(
              Icons.password_outlined,
              color: kcolordarkBlue,
              size: 30
            ),
          ),

          SizedBox(height: 20.h),
          Text(
            ".سيتم إرسال رسالة نصية إلى الرقم المسجل في النظام",
            style: TextSt.textstyle12,
          ),
        ],
      ),
    );
  }
}
