import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_state.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'dart:io';


class informationstudentpr extends StatelessWidget {
  const informationstudentpr({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileStudentCubit, ProfileStudentState>(
      listener: (context, state) {
        if (state is ProfileStudentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      child: BlocBuilder<ProfileStudentCubit, ProfileStudentState>(
        builder: (context, state) {
          if (state is! ProfileStudentSuccess) {
            return const SizedBox.shrink();
          }

          final profile = state.profileResponse.data;
          final cubit = context.read<ProfileStudentCubit>();
          final imageUrl = profile.profilePhotoUrl;

          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                height: 200.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.sp),
                    topRight: Radius.circular(12.sp),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF81D4FA).withOpacity(0.06),
                      const Color(0xFFA5D6A7).withOpacity(0.7),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.sp,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: state.localimage != null
                            ? ClipOval(
                                child: Image.file(
                                  File(
                                    state.localimage!.path,
                                  ),
                                  width: 150.sp,
                                  height: 150.sp,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : imageUrl != null &&
                                    imageUrl.toString().isNotEmpty
                                ? ClipOval(
                                    child: Image.network(
                                      imageUrl.toString(),
                                      width: 150.sp,
                                      height: 150.sp,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          AssestData.studentPortrait,
                                          width: 150.sp,
                                          height: 150.sp,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ): ClipOval(
                                    child: Image.asset(
                                      AssestData.studentPortrait,
                                      width: 150.sp,
                                      height: 150.sp,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                      ),
                      Positioned(
                        bottom: 10.sp,
                        right: 70.sp,
                        child: Container(
                          width: 110.sp,
                          height: 35.sp,
                          decoration: BoxDecoration(
                            color: kcolorOlive,
                            borderRadius:
                                BorderRadius.circular(60.sp),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.sp,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Text(
                                profile.status,
                                style:
                                    TextSt.textstyle16.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4.sp),
                              Icon(
                                Icons.check_circle,
                                size: 16.sp,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.sp),
                    bottomRight: Radius.circular(16.sp),
                  ),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.sp,
                    vertical: 12.sp,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100.sp,
                            height: 50.sp,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(12.sp),
                              color: Colors.blue.shade100,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "عرض كامل",
                              style: TextSt.textstyle14,
                            ),
                          ),
                          Text(
                            profile.userName,
                            style: TextSt.textstyle28.copyWith(
                              fontSize: 26.sp,),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(height: 18.sp),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end,
                        children: [
                          Text(
                            "رقم الطالب: ${profile.studentNumber}",
                            style: TextSt.textstyle17,
                          ),
                          SizedBox(width: 8.sp),
                          Icon(
                            Icons.badge_outlined,
                            size: 25.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.sp),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            cubit.pickAndUploadProfileImage();
                          },
                          borderRadius:
                              BorderRadius.circular(12.sp),
                          child: Container(
                            width: 140.sp,
                            height: 45.sp,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(12.sp),
                              color: kPrimaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Text(
                                  "تعديل",
                                  style: TextSt.textstyle14,
                                ),
                                SizedBox(width: 8.sp),
                                Icon(
                                  Icons.edit,
                                  size: 20.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.sp),
                      Divider(
                        color: Colors.black12,
                        thickness: 1,
                        height: 16.sp,
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.end,
                            children: [
                              Text(
                                "المسار",
                                style: TextSt.textstyle12,
                              ),
                              Text(
                                profile.track ?? "عام",
                                style: TextSt.textstyle24,
                              ),
                              SizedBox(height: 16.sp),
                              Text(
                                "حالة الحساب",
                                style: TextSt.textstyle12,
                              ),
                              SizedBox(height: 8.sp),
                              Container(
                                padding:
                                    EdgeInsets.symmetric(
                                  horizontal: 12.sp,
                                  vertical: 6.sp,
                                ),decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(8.sp),
                                  color: Colors
                                      .greenAccent.shade100,
                                ),
                                child: Text(
                                  profile.status,
                                  style: TextSt.textstyle14,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.end,
                            children: [
                              Text(
                                "الصف",
                                style: TextSt.textstyle12,
                              ),
                              Text(
                                profile.className,
                                style: TextSt.textstyle24,
                              ),
                              SizedBox(height: 16.sp),
                              Text(
                                "تاريخ الالتحاق",
                                style: TextSt.textstyle12,
                              ),
                              Text(
                                profile.enrollmentDate.isNotEmpty
                                    ? profile.enrollmentDate
                                        .substring(0, 10)
                                    : "",
                                style: TextSt.textstyle24,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}