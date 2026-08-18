import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_cubit.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';

class informationstudentpr extends StatelessWidget {
  const informationstudentpr({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileStudentCubit, ProfileStudentState>(
      builder: (context, state) {
        return ListView(
          physics: NeverScrollableScrollPhysics(),
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
                    Color(0xFF81D4FA).withOpacity(0.06),
                    Color(0xFFA5D6A7).withOpacity(0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 130.sp, top: 20.sp),
                          child: Image.asset(
                            AssestData.studentPortrait,
                            width: 180.sp,
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
                              borderRadius: BorderRadius.circular(60.sp),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.sp,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "نشط",
                                  style: TextSt.textstyle16.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
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
                border: Border.all(color: Colors.black12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.sp,
                  vertical: 12.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100.sp,
                          height: 50.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            color: Colors.blue.shade100,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.sp,
                              vertical: 12.sp,
                            ),
                            child: Text("عرض كامل ", style: TextSt.textstyle14),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "عمر عبدالله  \n    الشمري",
                          style: TextSt.textstyle28.copyWith(fontSize: 32),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("رقم الطالب: 20230491", style: TextSt.textstyle17),
                        Icon(Icons.badge_outlined, size: 25.sp),
                      ],
                    ),
                    SizedBox(height: 16.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 130.sp,
                          height: 50.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            color: kcolorOlive,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.sp,
                                ),
                              ),
                              Text(
                                "مراسلة",
                                style: TextSt.textstyle14.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.mail_outline_outlined,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                onPressed: () {
                                  context
                                      .read<ProfileStudentCubit>()
                                      .triggerContactAction();
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 16.sp),
                        Container(
                          width: 130.sp,
                          height: 50.sp,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            color: kPrimaryColor,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.sp,
                                ),
                              ),
                              Text("تعديل", style: TextSt.textstyle14),
                              IconButton(
                                icon: Icon(Icons.edit, size: 20.sp),
                                onPressed: () {
                                  context
                                      .read<ProfileStudentCubit>()
                                      .triggerEditingAction();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.sp),
                    Divider(color: Colors.black12, thickness: 0, height: 16.sp),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("المسار", style: TextSt.textstyle12),

                            Text("العلمي", style: TextSt.textstyle24),

                            SizedBox(height: 16.sp),

                            Text("حالة الرسوم", style: TextSt.textstyle12),
                            SizedBox(height: 12.sp),
                            Container(
                              width: 130.sp,
                              height: 50.sp,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.sp),
                                color: Colors.greenAccent.shade100,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.sp,
                                    ),
                                  ),
                                  Text("مسددة", style: TextSt.textstyle14),
                                  IconButton(
                                    icon: Icon(
                                      Icons.check_circle_outline,
                                      size: 20.sp,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("الصف", style: TextSt.textstyle12),

                            Text("العاشر - أ", style: TextSt.textstyle24),

                            SizedBox(height: 16.sp),
                            Text("تاريخ الالتحاق", style: TextSt.textstyle12),

                            Text(" سبتمبر 2021", style: TextSt.textstyle24),
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
    );
  }
}
