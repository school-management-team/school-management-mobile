import 'package:flutter/material.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_advisor_body_view.dart';

class SignupAdvisorView extends StatelessWidget {
  const SignupAdvisorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SignupAdvisorBodyView(),
      ),
    );
  }
}
