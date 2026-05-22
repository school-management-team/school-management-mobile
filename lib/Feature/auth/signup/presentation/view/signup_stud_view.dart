
import 'package:flutter/material.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_stud_body_view.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_student_body_view.dart';

class SignupStudView extends StatelessWidget{
  const SignupStudView({super.key});

  @override
  Widget build(BuildContext context) {  
     return Scaffold(
     body: SafeArea(child: 
      
      const SignupStudBodyView(),
     ));
  }

}