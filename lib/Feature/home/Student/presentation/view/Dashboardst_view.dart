import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Student/Data/repo/dashboard1/student_dashboard_repo_impl.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_dashboard_student/dashboard1_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view/Dashboardst_view_body.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigator/bottomfive_home_student.dart';

class DashboardstView extends StatelessWidget {
  const DashboardstView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Dashboard1StudentCubit(StudentDashboardRepoImpl()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actionsPadding: EdgeInsets.symmetric(horizontal: 40.sp),
          leadingWidth: 43,
      
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kprofileStudent);
                },
                icon: Icon(Icons.arrow_back, size: 30.sp),
              ),
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
        bottomNavigationBar: BottomfiveHomeStudent(select: 0),
        body: SafeArea(child: DashboardstViewBody()),
      ),
    );
  }
}
