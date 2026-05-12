
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class TextfieldSignupTeacher extends StatefulWidget {
  const TextfieldSignupTeacher({super.key});

  @override
  State<TextfieldSignupTeacher> createState() => _ListView_SignupState();
}

// ignore: camel_case_types
class _ListView_SignupState extends State<TextfieldSignupTeacher> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Text("الاسم الكامل", style: TextSt.textstyle14),
          SizedBox(height: 16.h),
          TextFieldStyle(
             filledcolor: Color(0XFFFFFFFF),
            hinit: "د. أحمد عبدالله ", textAlign: TextAlign.end),
          SizedBox(height: 20.h),
          Text("كود المدرسة ", style: TextSt.textstyle14),
          SizedBox(height: 16.h),
          TextFieldStyle(
             filledcolor: Color(0XFFFFFFFF),
            hinit: " SCH-000"),

          SizedBox(height: 20),
          Text(" الرقم الوظيفي ", style: TextSt.textstyle14),
          SizedBox(height: 16),
          TextFieldStyle(
             filledcolor: Color(0XFFFFFFFF),
            hinit: " EMP-12345"),

          SizedBox(height: 20.h),
          Text("البريد الإلكتروني للعمل ", style: TextSt.textstyle14),
          SizedBox(height: 16),
          TextFieldStyle(
            filledcolor: Color(0XFFFFFFFF),
            hinit: " name@school.edu",
            icontext: Icon(
              Icons.email_outlined,
              color: kcolordarkBlue,
            ),
          ),

          SizedBox(height: 20),
          Text(" كلمة المرور ", style: TextSt.textstyle14),
          SizedBox(height: 16),

          textfieldPassword(),
        ],
      ),
    );
  }

  TextField textfieldPassword() {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        enabledBorder: 
       OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: Color(0XFFC4C6CD))),
        fillColor:  Color(0XFFFFFFFF),filled: true,
        hintText: " .....",
        prefixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
        ),
        suffixIcon: Icon(Icons.lock_outline, color: kcolordarkBlue),
      ),
    );
  }
}
