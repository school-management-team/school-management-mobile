import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/coustumAppBar_teacher.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/requeriedPassword.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/textfield_teacher.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/custom_buttom.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SignupTeacherBodyView extends StatefulWidget {
  const SignupTeacherBodyView({super.key});

  @override
  State<SignupTeacherBodyView> createState() => _SignupTeacherBodyViewState();
}

class _SignupTeacherBodyViewState extends State<SignupTeacherBodyView> {
  String? selectedFilePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: ListView(
        children: [
          customAPPTeacher(),
          SizedBox(height: 16.sp),
          Divider(color: Color(0XFFC4C6CD), thickness: 0),
          SizedBox(height: 16.sp),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.school_outlined,
                size: 350.sp,
                color: Colors.grey[200],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //  crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        " معلم ",
                        style: TextSt.textstyle28.copyWith(color: kcolorOlive),
                      ),
                      Text("إنشاء حساب ", style: TextSt.textstyle28),
                    ],
                  ),
                  Text(
                    "يرجى تعبئة كافة الحقول التالية لإتمام عملية",
                    style: TextSt.textstyle14.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " .التسجيل",
                    style: TextSt.textstyle14.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  TextfieldTeacher(),
                  SizedBox(height: 16.sp),
                  requeriedPassword(),
                  SizedBox(height: 16.sp),
                  Text(
                    "السيرة الذاتية / نبذة تعريفية",
                    style: TextSt.textstyle14,
                  ),
                  SizedBox(height: 16.sp),

                  TextFieldStyle(
                    max: 5,
                    hinit: "...تحدث عن خبراتك ومهاراتك الأكاديمية",
                    filledcolor: Color(0XFFFFFFFF),
                    textAlign: TextAlign.end,
                  ),

                  SizedBox(height: 16.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    
                      SizedBox(height: 16.sp),

                      GestureDetector(
                        onTap: () async {
                          FilePickerResult? result = await FilePicker.pickFiles(
                            type: FileType.custom,
                          );

                          if (result != null &&
                              result.files.single.path != null) {
                            setState(() {
                              selectedFilePath = result.files.single.path;
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: selectedFilePath != null
                              ? EdgeInsets.zero
                              : EdgeInsets.symmetric(
                                  vertical: 30.sp,
                                  horizontal: 16.sp,
                                ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.grey,style: BorderStyle.solid),
                          ),
                          child: selectedFilePath != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.file(
                                    File(selectedFilePath!),
                                    width: double.infinity,
                                    height: 140.sp,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.file_upload_outlined,
                                      size: 40.sp,
                                      color: const Color(0xFF2E6B4E),
                                    ),
                                    SizedBox(height: 12.sp),
                                    Text(
                                      "رفع صورة السيرة الذاتية أو الشهادات",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.sp),
          Buttontext(
            background: kcolorOlive,
            textColor: Colors.white,
            text: "إكمال التسجيل",
            icons: Icons.arrow_back,
            borderColor: KcolorGrey,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kaccountpendeing);
            },
          ),
          SizedBox(height: 16.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "تسجيل الدخول",
                style: TextSt.textstyle14.copyWith(color: kcolorOlive),
              ),

              Text("لديك حساب بالفعل؟ ", style: TextSt.textstyle14),
            ],
          ),
          SizedBox(height: 40.sp),
        ],
      ),
    );
  }
}
