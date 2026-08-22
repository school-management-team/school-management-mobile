import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Student/Data/repo/grade/grade_repo_impl.dart';
import 'package:school/Feature/home/Student/presentation/view/dash2_view_body.dart';
import 'package:school/Feature/home/Student/presentation/view/gradecardst_view_body.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_grade/grade_cubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/gradecubit.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigator/bottomfive_home_student.dart';

class GradecardstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentGradesCubit(studentRepository: StudentRepositoryImpl(DioConsumer(Dio()))),
      child: Scaffold(
        appBar: AppBar(
          actionsPadding: EdgeInsets.symmetric(horizontal: 40.sp),
          leadingWidth: 43.sp,
        
          title: Row(
            children: [
              Text(
                "  مدارس المستقبل",
                style: TextSt.textstyle28.copyWith(
                  
                  fontWeight: FontWeight.w900,
                  fontSize: 22.sp,
                  fontFamily: 'normal',
                ),
              ),
             
              Spacer(),
              Lottie.asset(AssestData.notification, width: 55.sp),
            ],
          ),
        ),
        bottomNavigationBar: BottomfiveHomeStudent(select: 1),
        body: SafeArea(child: GradecardstViewBody()),
      ),
    );
  }
}
