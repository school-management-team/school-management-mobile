import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/auth/signup/Data/signup_teacher_rep/teacher_auth_repo_impl.dart';
import 'package:school/Feature/auth/signup/logic/manger/cubit_Teacher_signup/sign_up_teacher_cubit.dart';
import 'package:school/Feature/auth/signup/presentation/view/signup_teacher_body_view.dart';

class SignupTeacherView extends StatelessWidget {
  const SignupTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpTeacherCubit(TeacherAuthRepoImpl()),
      child: Scaffold(body: SafeArea(child: SignupTeacherBodyView())),
    );
  }
}
