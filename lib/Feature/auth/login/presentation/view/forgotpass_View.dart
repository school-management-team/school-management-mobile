import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/auth/login/presentation/view/forgotpass_body_view.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/forgotpasswordcubit.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: Scaffold(
        backgroundColor: Color(0xFFEBE8E2),
        body: SafeArea(child: ForgotPasswordBody()),
      ),
    );
  }
}
