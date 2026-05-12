
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/coustumAppBar_signup_studenrs.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/textField_Signup_Students.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SignupStudentBodyView extends StatelessWidget {
  const SignupStudentBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 16.h, horizontal: 18.w),
          child: Container(
          
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
               color: Colors.white
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomAppBarSignupStudents(),

                  Text(
                    "ربط حساب ",
                    style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height*0.07,
                      color: kcolorNavyBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "  الطالب ",
                    style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height*0.07,
                      color: kcolorNavyBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "الرجاء إدخال البيانات المطلوبة لإتمام ",
                    style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height*0.025,
                      color: KcolorGrey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    ". عملية الربط الأكاديمي ",
                    style: TextStyle(
                      fontSize:  MediaQuery.sizeOf(context).height*0.025,
                      color: KcolorGrey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 33.h),
                  FieldSignupStudents(),
                  SizedBox(height: 30.h),

                  TextButton.icon(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kaccountpendeing);
                      
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      fixedSize: Size(300, 55),

                      backgroundColor: kcolorOlive,
                    ),
                    icon: Icon(
                      Icons.check_circle_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                    label: Text(
                      " تفعيل الحساب ",
                      style: TextSt.textstyle16.copyWith(color: Colors.white),
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
                    child: TextButton.icon(
                      onPressed: () {
                        
                      },
                      //textDirection: TextDirection.rtl,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0XFFC4C6CD)),
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                        fixedSize: Size(300, 55),

                        backgroundColor: Colors.white,
                      ),
                      icon: Icon(
                        Icons.person_add_alt,
                        color: Colors.black,
                        size: 25,
                      ),

                      label: Text(
                        " إضافة طالب آخر  ",
                        style: TextSt.textstyle16.copyWith(color: Colors.black),
                      ),
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
                   SizedBox(height: 30)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
