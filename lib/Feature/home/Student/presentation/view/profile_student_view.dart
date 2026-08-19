import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Student/Data/repo/Profile/student_profile_repo.dart';
import 'package:school/Feature/home/Student/Data/repo/Profile/student_profile_repo_impl.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view/profile_student_body_view.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigator/bottomNavgtion_fiveitems.dart';

class ProfileStudentView extends StatelessWidget {
  const ProfileStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.symmetric(horizontal: 40.sp),
        leadingWidth: 43,

        title: Row(
          children: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.ksignupStud);
              },
              icon: Icon(Icons.arrow_back, size: 30.sp),
            ),
            Text(
              " نيو أكاديميك",
              style: TextSt.textstyle28.copyWith(
              
                fontWeight: FontWeight.w900,
                fontSize: 22.sp,
                fontFamily: 'normal',
              ),
            ),
            SizedBox(width: 12.sp),
            CircleAvatar(
              radius: 30.sp,
              backgroundImage: AssetImage(AssestData.studentDashboard),
              backgroundColor: Colors.white,
            ),

            Spacer(),
            Lottie.asset(AssestData.notification, width: 55.sp),
          ],
        ),
      ),
      bottomNavigationBar: BottomnavgtionFiveitems(select: 3),
      body: BlocProvider(
        create: (context) => ProfileStudentCubit(StudentProfileRepoImpl()),
        child: SafeArea(child: ProfileStudentBodyView()),
      ),
    );
  }
}
