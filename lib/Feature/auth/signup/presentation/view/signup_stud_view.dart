import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/auth/signup/Data/signup_student_rep/student_auth_repo_impl.dart';
import 'package:school/Feature/auth/signup/logic/manger/cubit_Student_signup/sign_up_student_cubit.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_stud_body_view.dart';

class SignupStudView extends StatelessWidget {
  const SignupStudView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpStudentCubit(StudentAuthRepoImpl()),
      child: Scaffold(body: SafeArea(child:  SignupStudBodyView())),
    );
  }
}
