import 'package:flutter/material.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_teacher_body_view.dart';

class SignupTeacherView extends StatelessWidget {
  const SignupTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: SafeArea(child: 
     SignupTeacherBodyView()
     ),
    );
  }
}