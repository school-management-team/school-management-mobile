import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';

class CoustumAppBarSignup extends StatelessWidget {
  const CoustumAppBarSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Image.asset(AssestData.Logo, width: 150.w),

            const Spacer(),
            Text(
              "العودة لاختيار الدور",
              style: TextSt.textstyle12.copyWith(color: KcolorGrey),
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kroleselection);
              },
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),

        SizedBox(height: 22.h),
        Row(
          children: [
            Text(
              "بيانات الحساب",
              style: TextSt.textstyle16.copyWith(color: KcolorGrey),
            ),
            Image.asset(AssestData.circule, width: 30.w),
            Spacer(),
            Image.asset(AssestData.Horizontal_Divider),
            Spacer(),

            Text(
              "التحقق ",
              style: TextSt.textstyle16.copyWith(color: kcolorOlive),
            ),
            Image.asset(AssestData.circule1, width: 30.w),
          ],
        ),

        SizedBox(height: 33.h),
        Text(
          "إنشاء حساب جديد",
          style: TextSt.textstyle28
        ),
        SizedBox(height: 4.h),
        Text(
          " يرجى إدخال البيانات الوظيفية لإكمال إعداد الحساب  ",
          style: TextSt.textstyle14
        ),
        Text(
          " .الخاص بك ",
          style: TextSt.textstyle14,
        ),
      ],
    );
  }
}
