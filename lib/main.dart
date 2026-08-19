import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:school/Feature/auth/signup/Data/repo/signup_student_rep/student_auth_repo_impl.dart';
import 'package:school/Feature/auth/signup/Data/repo/signup_teacher_rep/teacher_auth_repo_impl.dart';
import 'package:school/Feature/auth/signup/presentation/view_Models/manger/cubit_Student_signup/sign_up_student_cubit.dart';
import 'package:school/Feature/auth/signup/presentation/view_Models/manger/cubit_Teacher_signup/sign_up_teacher_cubit.dart';
import 'package:school/Feature/home/Student/Data/repo/Profile/student_profile_repo_impl.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_cubit.dart';

import 'package:school/constant.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/database/cache/cahe_helper.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/themes/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', '');
  await ScreenUtil.ensureScreenSize();
  await CacheHelper().init();
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
            create: (context) =>
                SignUpTeacherCubit(TeacherAuthRepoImpl(DioConsumer(Dio()))),
          ),
          BlocProvider(create: (context) => ThemeCubit()),
        ],

        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,

              themeMode: themeMode,
              theme: ThemeData(
                fontFamily: 'Tajawal',
              ).copyWith(scaffoldBackgroundColor: kPrimaryColor),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: Color(0xFF1E1E1E),
                appBarTheme: AppBarTheme(
                  backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
