import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/CoustumAppBarSignup_stud.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/requeriedPassword.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/textfield_Signup_stud.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SignupStudBodyView extends StatelessWidget {
  const SignupStudBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 18.sp),
      child: ListView(
        children: [
          const CoustumAppBarSignup(),

          SizedBox(height: 33.h),
          TextfieldSignupStud(),
          SizedBox(height: 30.h),

         
      requeriedPassword(),
      
   

          SizedBox(height: 30.h),

          TextButton.icon(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.ksignupteacher);
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12.r),
              ),
              fixedSize: Size(300.sp, 55.sp),

              backgroundColor: kcolorOlive,
            ),
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 25.sp),
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
