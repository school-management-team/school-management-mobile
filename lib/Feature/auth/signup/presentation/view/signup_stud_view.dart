import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/auth/signup/Data/repo/signup_student_rep/student_auth_repo_impl.dart';
import 'package:school/Feature/auth/signup/presentation/view_Models/manger/cubit_Student_signup/sign_up_student_cubit.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_stud_body_view.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/api/api_consumer.dart';

class SignupStudView extends StatelessWidget {
  const SignupStudView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpStudentCubit(StudentAuthRepoImpl(DioConsumer(Dio()))),
      child: Scaffold(body: SafeArea(child: SignupStudBodyView())),
    );
  }
}
