import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/ContainerStudentprofile.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view/profile_student_page2.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/AttendanceAndAbsence_profile.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/information_student_profile_con1.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_state.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';
class ProfileStudentBodyView extends StatefulWidget {
  const ProfileStudentBodyView({super.key});

  @override
  State<ProfileStudentBodyView> createState() =>
      _ProfileStudentBodyViewState();
}

class _ProfileStudentBodyViewState
    extends State<ProfileStudentBodyView> {

  final PageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileStudentCubit>().getProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageFlipBuilder(
      key: PageFlipKey,
      interactiveFlipEnabled: true,
      flipAxis: Axis.horizontal,
      frontBuilder: (_) => _buildMainContent(context),
      backBuilder: (_) => const ProfileStudentPage2(),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileStudentCubit, ProfileStudentState>(
            builder: (context, state) {
              if (state is ProfileStudentLoading) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.sp),
                    child: const CircularProgressIndicator(),
                  ),
                );
              } else if (state is ProfileStudentFailure) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.sp),
                    child: Text(
                      state.errorMessage,
                      style: TextSt.textstyle16.copyWith(color: Colors.red),
                    ),
                  ),
                );
              } else if (state is ProfileStudentSuccess) {
                final attendance = state.attendanceResponse?.data;

                return Column(
                  children: [
              
                    const informationstudentpr(),
                    SizedBox(height: 30.sp),

                
                    AttendanceAndAbsence(
                      percentageInt: attendance != null
                          ? attendance.attendanceRate.toInt()
                          : 0,
                      lateCount: attendance != null ? attendance.lateCount : 0,
                      absentDays: attendance != null
                          ? attendance.absentDays
                          : 0,
                    ),
                    SizedBox(height: 40.sp),
 
                  ContainerStudentprofile(),
                  SizedBox(height: 40.sp),
                   
                    GestureDetector(
                      onTap: () {
                        PageFlipKey.currentState?.flip();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "تابع لرؤية المزيد من المعلومات",
                            style: TextSt.textstyle16.copyWith(
                              color: kcolorOlive,
                            ),
                          ),
                          SizedBox(width: 12.sp),
                          Icon(
                            Icons.arrow_circle_right_rounded,
                            size: 50.sp,
                            color: kcolorOlive,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80.sp),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
