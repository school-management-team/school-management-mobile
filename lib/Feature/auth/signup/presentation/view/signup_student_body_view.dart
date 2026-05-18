import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/coustumAppBar_signup_studenrs.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/textField_Signup_Students.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/custom_buttom.dart';

class SignupStudentBodyView extends StatelessWidget {
  const SignupStudentBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 16.h,
            horizontal: 18.w,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomAppBarSignupStudents(),
                  SizedBox(height: 16),
                  Text(
                    "ربط حساب ",
                    style: TextSt.textstyle28.copyWith(
                      fontSize: 48.sp,
                      color: kcolorNavyBlue,
                    ),
                  ),
                  Text(
                    "  الطالب ",
                    style: TextSt.textstyle28.copyWith(
                      fontSize: 48.sp,
                      color: kcolorNavyBlue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "الرجاء إدخال البيانات المطلوبة لإتمام ",
                    style: TextSt.textstyle16.copyWith(
                      fontWeight: FontWeight.w400,
                      color: KcolorGrey,
                    ),
                  ),
                  Text(
                    ". عملية الربط الأكاديمي ",
                    style: TextSt.textstyle16.copyWith(
                      fontWeight: FontWeight.w400,
                      color: KcolorGrey,
                    ),
                  ),
                  SizedBox(height: 33.h),
                  FieldSignupStudents(),
                  SizedBox(height: 30.h),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Buttontext(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kaccountpendeing);
                      },
                      borderColor: KcolorGrey,
                      width: 0.2.w,
                      background: kcolorOlive,
                      textColor: Colors.white,

                      text: " تفعيل الحساب ",

                      icons: Icons.check_circle_outlined,
                    ),
                  ),

                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Color(0XFFC4C6CD), thickness: 0),
                      ),
                      Text(
                        "أو",
                        textAlign: TextAlign.center,
                        style: TextSt.textstyle14,
                      ),
                      Expanded(
                        child: Divider(color: Color(0XFFC4C6CD), thickness: 0),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Buttontext(
                      borderColor: Color(0XFFC4C6CD),
                      width: 0.2.w,
                      background: Colors.white,
                      textColor: Colors.black,
                      text: " إضافة طالب آخر  ",
                      icons: Icons.person_add_alt,
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kaccountpendeing);
                      },
                    ),
                  ),

                  SizedBox(height: 30),

                  Divider(color: Color(0XFFC4C6CD), thickness: 0),
                  SizedBox(height: 16),

                  Row(
                    children: [
                      Text(
                        "تواصل مع الدعم  \n      الفني",
                        style: TextSt.textstyle14.copyWith(
                          color: Color(0XFF006C49),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),

                      Text(
                        "هل تواجه مشكلة في عملية \n            الربط؟",
                        style: TextSt.textstyle14,
                      ),
                      Icon(Icons.help_outline_outlined, size: 16),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
