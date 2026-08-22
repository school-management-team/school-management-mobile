import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_state.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class ContainerStudentprofile extends StatelessWidget {
  const ContainerStudentprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileStudentCubit, ProfileStudentState>(
      builder: (context, state) {
        if (state is! ProfileStudentSuccess) {
          return const SizedBox.shrink();
        }

        final personalData = state.personResponse;
        final guardian = state.guardianResponse?.data;

        final fatherName = state.personResponse.data.fatherName?.isNotEmpty == true
            ? state.personResponse.data.fatherName!
            : "غير متوفر";

        final medicalNotes =
        
                 "لا توجد ملاحظات طبية";

        final guardianName =
            guardian?.name.isNotEmpty == true
                ? guardian!.name
                : fatherName;

        final guardianRelationship =
            guardian?.relationship.isNotEmpty == true
                ? guardian!.relationship
                : "ولي الأمر";

        final guardianPhone =
            guardian?.phone.isNotEmpty == true
                ? guardian!.phone
                : "غير متوفر";

        final guardianEmail =
            guardian?.email.isNotEmpty == true
                ? guardian!.email
                : "غير متوفر";

        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.black12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
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
                          alignment: Alignment.center,
                          child: Text(
                            "مرتبط بالنظام",
                            style: TextSt.textstyle14,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "ولي الأمر",
                          style: TextSt.textstyle16,
                        ),
                        SizedBox(width: 12.sp),
                        Icon(
                          Icons.family_restroom,
                          size: 30.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [Text(
                              guardianName,
                              style: TextSt.textstyle16,
                            ),
                            Text(
                              guardianRelationship,
                              style: TextSt.textstyle12,
                            ),
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
                          child: Icon(
                            Icons.person_2_outlined,
                            size: 30.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.sp),
                    _infoRow(
                      icon: Icons.phone_outlined,
                      value: guardianPhone,
                    ),
                    SizedBox(height: 16.sp),
                    _infoRow(
                      icon: Icons.email_outlined,
                      value: guardianEmail,
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
                        Text(
                          "ملاحظات هامة",
                          style: TextSt.textstyle24,
                        ),
                        SizedBox(width: 16.sp),
                        Icon(
                          Icons.medical_information_outlined,
                          color: const Color.fromARGB(
                            255,
                            178,
                            41,
                            31,
                          ),
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
                        border: Border.all(
                          color: Colors.red.withOpacity(0.2),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.sp,
                          vertical: 10.sp,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "حساسية طبية",
                                    style: TextSt.textstyle16,
                                  ),
                                  SizedBox(height: 4.sp),
                                  Text(
                                    medicalNotes,
                                    style: TextSt.textstyle12,
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.sp),
                            Icon(
                              Icons.warning_amber_rounded,
                              size: 40.sp,
                              color: const Color.fromARGB(
                                255,
                                178,
                                41,
                                31,
                              ),
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

  Widget _infoRow({
    required IconData icon,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 12.sp,
        vertical: 12.sp,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextSt.textstyle14,
            ),
          ),
          SizedBox(width: 10.sp),
          Icon(
            icon,
            color: KcolorGrey,
            size: 26.sp,
          ),
        ],
      ),
    );
  }
}