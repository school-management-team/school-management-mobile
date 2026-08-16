import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view/profile_student_page2.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/AttendanceAndAbsence_profile.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/ContainerStudentprofile.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/information_student_profile_con1.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class ProfileStudentBodyView extends StatefulWidget {
  const ProfileStudentBodyView({super.key});

  @override
  State<ProfileStudentBodyView> createState() => _ProfileStudentBodyViewState();
}

class _ProfileStudentBodyViewState extends State<ProfileStudentBodyView> {
  final PageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return PageFlipBuilder(
      key: PageFlipKey,
      interactiveFlipEnabled: true,
      flipAxis: Axis.horizontal,

      frontBuilder: (_) => _buildMainContent(),

      backBuilder: (_) => (ProfileStudentPage2()),
    );
  }

  Widget _buildMainContent() {
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
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is ProfileStudentFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errMessage)));
              }

              return Column(
                children: [
                  informationstudentpr(),
                  SizedBox(height: 30.sp),
                  AttendanceAndAbsence(percentageInt: 66),
                  SizedBox(height: 30.sp),
                  ContainerStudentprofile(),
                  SizedBox(height: 40.sp),
                  GestureDetector(
                    onTap: () {
                      PageFlipKey.currentState?.flip();
                      // GoRouter.of(context).push(AppRouter.kprofileStudentpage2);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          " تابع لرؤية المزيد من المعلومات",
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
            },
          ),
        ),
      ),
    );
  }
}
