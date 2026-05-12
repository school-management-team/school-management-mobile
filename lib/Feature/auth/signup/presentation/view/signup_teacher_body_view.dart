import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/CoustumAppBarSignup_teacher.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/textfield_Signup_teacher.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
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

          Requirements_Password(),
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
  }

  Padding Requirements_Password() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12, width: 1),
          color: Color(0Xff44474D).withOpacity(0.1),
        ),

        height: 170.sp,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Text(
                " :متطلبات كلمة المرور",
                style: TextSt.textstyle16.copyWith(color: Color(0XFF1C1C18)),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    " 8 أحرف على الأقل",
                    style: TextSt.textstyle14.copyWith(color: kcolorOlive),
                    textAlign: TextAlign.right,
                  ),
                  Image.asset(AssestData.circule1, width: 16),
                ],
              ),
              SizedBox(height: 8.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "حرف كبير واحد على الأقل",
                    style: TextSt.textstyle14.copyWith(color: KcolorGrey),
                    textAlign: TextAlign.right,
                  ),
                  Icon(Icons.circle_outlined, size: 16),
                ],
              ),
              SizedBox(height: 8.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "رقم واحد على الأقل أو رمز خاص",
                    style: TextSt.textstyle14.copyWith(color: KcolorGrey),
                    textAlign: TextAlign.right,
                  ),
                  Icon(Icons.circle_outlined, size: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
