import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/auth/login/presentation/view/Login_body_view.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/LoginCubit.dart';
import 'package:school/core/api/Dio_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(DioConsumer(Dio())),
      child: Scaffold(
        backgroundColor: Color(0xFFEBE8E2),
        body: SafeArea(child: LoginBodyView()),
      ),
    );
  }
}
