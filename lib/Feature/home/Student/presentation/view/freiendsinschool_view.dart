import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:collection';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Student/Data/repo/friend/friend_repo.dart';
import 'package:school/Feature/home/Student/Data/repo/friend/friend_repo_impl.dart';
import 'package:school/Feature/home/Student/presentation/view/freiendschool_view_body.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/SchoolCalendarScreen.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_friend/cubit_classgroup/classgroup_cubit.dart' show ClassgroupCubit;
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_friend/cubit_classmate/classmate_cubit.dart';

import 'package:school/constant.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigator/bottomNavgtion_fiveitems.dart';
import 'package:school/core/widget/bottomnavigator/bottomfive_home_student.dart';
import 'package:table_calendar/table_calendar.dart';
class FreiendsinschoolView extends StatelessWidget {
  const FreiendsinschoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
           
               create: (context) => ClassgroupCubit(FriendRepoImpl(dioConsumer: DioConsumer(Dio()))..getclassfriend())
    ),
    BlocProvider(
      create: (context) => ClassmateCubit(FriendRepoImpl(dioConsumer: DioConsumer(Dio()))..getclassmate()))
       
    
        ],
      child: Scaffold(
        appBar: AppBar(
          actionsPadding: EdgeInsets.symmetric(horizontal: 40.sp),
          leadingWidth: 43,

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
              SizedBox(width: 12.sp),
              CircleAvatar(
                radius: 30.sp,
                backgroundImage: AssetImage(AssestData.studentprofile),
                backgroundColor: Colors.white,
              ),

              Spacer(),
              Lottie.asset(AssestData.notification, width: 55.sp),
            ],
          ),
        ),
        bottomNavigationBar: BottomfiveHomeStudent(select: 4),
        body: SafeArea(child: FreiendschoolViewBody()),
      ),
    );
  }
}
