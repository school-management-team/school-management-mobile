import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/profile_student_textEditing.dart';

import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class ContainerStudentprofile extends StatelessWidget {
  const ContainerStudentprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodels = ProfileStudentTextediting();
    return BlocBuilder<ProfileStudentCubit, ProfileStudentState>(
      builder: (context, state) {
        final cubit = context.read<ProfileStudentCubit>();
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.black12),
              ),

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 120.sp,
                          height: 40.sp,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Colors.blue.shade100,
                            border: Border.all(
                              color: KcolorGrey.withOpacity(0.5),
                            ),
                          ),

                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.sp,
                              horizontal: 8.sp,
                            ),
                            child: Text(
                              " مرتبط بالنظام",
                              style: TextSt.textstyle14,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text("ولي الأمر", style: TextSt.textstyle16),
                        SizedBox(width: 12.sp),
                        Icon(Icons.family_restroom, size: 30.sp),
                      ],
                    ),
                    SizedBox(height: 16.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("عبدالله الشمري", style: TextSt.textstyle16),
                            Text(" الأب", style: TextSt.textstyle12),
                          ],
                        ),
                        SizedBox(width: 12.sp),
                        Container(
                          width: 60.sp,
                          height: 60.sp,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.sp),
                            color: Colors.blue.shade100,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.sp),
                            child: Icon(Icons.person_2_outlined, size: 30.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.sp),
                    TextFieldStyle(
                      keyboardytype: TextInputType.phone,
                      filledcolor: kPrimaryColor,
                      textEditingController: viewmodels.phone,
                      // hinit: " 05XXXXXXXX",
                      hinit: cubit.phone,
                      icontext: Icon(
                        Icons.phone_outlined,
                        color: KcolorGrey,
                        size: 30.sp,
                      ),
                    ),

                    SizedBox(height: 16),
                    TextFieldStyle(
                      filledcolor: kPrimaryColor,
                      keyboardytype: TextInputType.emailAddress,
                      textEditingController: viewmodels.email,
                      // hinit: " name@school.edu",
                      hinit: cubit.email,
                      icontext: Icon(
                        Icons.email_outlined,
                        color: KcolorGrey,
                        size: 30.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.sp),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("ملاحظات هامة", style: TextSt.textstyle24),
                        SizedBox(width: 16.sp),
                        Icon(
                          Icons.medical_information_outlined,
                          color: const Color.fromARGB(255, 178, 41, 31),
                          size: 30.sp,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.sp,
                      horizontal: 16.sp,
                    ),
                    child: Container(
                      height: 100.sp,

                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.red.withOpacity(0.2)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.sp,
                          vertical: 10.sp,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("حساسية طبية", style: TextSt.textstyle16),
                                Text(
                                  " الطالب يعاني من حساسية تجاه البنسلين. \n   يرجى توخي الحذر في الحالات الطارئة.",
                                  style: TextSt.textstyle12,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.warning_amber_rounded,
                              size: 40.sp,
                              color: const Color.fromARGB(255, 178, 41, 31),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
