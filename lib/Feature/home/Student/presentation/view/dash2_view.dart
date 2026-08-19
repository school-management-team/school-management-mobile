import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Student/Data/repo/dash2/dash2_repo_impl.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_dash2_student/dash2_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view/dash2_view_body.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/themes/themes.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigator/bottomfive_home_student.dart';

class SchoolCalendarScreen extends StatefulWidget {
  @override
  _SchoolCalendarScreenState createState() => _SchoolCalendarScreenState();
}

class _SchoolCalendarScreenState extends State<SchoolCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
        appBar: AppBar(
          actionsPadding: EdgeInsets.symmetric(horizontal: 40.sp),
          leadingWidth: 43,
          //backgroundColor: Colors.white,
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
        bottomNavigationBar: BottomfiveHomeStudent(select: 2),
        body:  BlocProvider<Dash2StudentCubit>(
      create: (context) => Dash2StudentCubit(Dash2RepoImpl()),child:SafeArea(child: SafeArea(child: Dash2ViewBody())),
      ),
    );
  }
}
