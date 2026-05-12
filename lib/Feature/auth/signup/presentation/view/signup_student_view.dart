import 'package:flutter/material.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_student_body_view.dart';

class SignupStudentView extends StatelessWidget {
  const SignupStudentView({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0XFFEBE8E2) ,
      body:SafeArea(child: 
     SignupStudentBodyView()
      )
    );
  }
}