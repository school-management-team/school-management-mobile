import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/CoustumAppBarSignup_teacher.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/requeriedPassword.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/textfield_Signup_teacher.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SignupTeacherBodyView extends StatelessWidget {
  const SignupTeacherBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 18.w),
      child: ListView(
        children: [
          const CoustumAppBarSignup(),

          SizedBox(height: 33.h),
          TextfieldSignupTeacher(),
          SizedBox(height: 30.h),

         
      requeriedPassword(),
      
   

          SizedBox(height: 30.h),

          TextButton.icon(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.ksignupStudent);
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              fixedSize: Size(300, 55),

              backgroundColor: kcolorOlive,
            ),
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 25),
            label: Text(
              "  إنشاء حساب",
              style: TextSt.textstyle16.copyWith(color: Colors.white),
            ),
          ),

          SizedBox(height: 33.h),
        ],
      ),
    );
  }}
