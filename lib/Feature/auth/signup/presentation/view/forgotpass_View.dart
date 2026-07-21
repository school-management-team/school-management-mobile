import 'package:flutter/material.dart';
import 'package:school/Feature/auth/signup/presentation/view/forgotpass_body_view.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBE8E2),
      body: SafeArea(child: ForgotPasswordBody()),
    );
  }
}
