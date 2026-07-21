import 'package:flutter/material.dart';
import 'package:school/Feature/auth/signup/presentation/view/Login_body_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBE8E2),
      body: SafeArea(child: LoginBodyView()),
    );
  }
}
