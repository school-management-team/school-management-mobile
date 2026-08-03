import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:school/Feature/auth/signup/Data/signup_student_rep/student_auth_repo_impl.dart';
import 'package:school/Feature/auth/signup/Data/signup_teacher_rep/teacher_auth_repo_impl.dart';
import 'package:school/Feature/auth/signup/logic/manger/cubit_Student_signup/sign_up_student_cubit.dart';
import 'package:school/Feature/auth/signup/logic/manger/cubit_Teacher_signup/sign_up_teacher_cubit.dart';
import 'package:school/Feature/home/Student/Data/Profile/student_profile_repo_impl.dart';
import 'package:school/Feature/home/Student/logic/manger/cubit_profile_student/profile_student_cubit.dart';

import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', '');
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignUpStudentCubit(StudentAuthRepoImpl()),
          ),
          BlocProvider(
            create: (context) => SignUpTeacherCubit(TeacherAuthRepoImpl()),
          ),
            BlocProvider(
            create: (context) => ProfileStudentCubit(StudentProfileRepoImpl()),
          ),
        ],

        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Tajawal',
          ).copyWith(scaffoldBackgroundColor: kPrimaryColor),
        ),
      ),
    );
  }
}
