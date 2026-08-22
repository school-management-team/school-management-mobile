import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/linearPrecent.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/textFieldPerson_profile.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_state.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class ProfileStudentPage2 extends StatefulWidget {
  const ProfileStudentPage2({super.key});

  @override
  State<ProfileStudentPage2> createState() => _ProfileStudentPage2State();
}

class _ProfileStudentPage2State extends State<ProfileStudentPage2> {
  int selectedIndex = -1;

  final activities = [
    ActivityItem(
      title: " تم تسليم واجب الرياضيات المتقدمة -  الفصل الثالث",
      time: "اليوم 10:30 صباحاً",
      color: Colors.green,
    ),
    ActivityItem(
      title: "تسجيل حضور مبكر في طابور الصباح  ",
      time: "أمس 08:15 صباحاً",
      color: Colors.blue,
    ),
    ActivityItem(
      title: " إشعار من المعلم: مشاركة متميزة في حصة الفيزياء",
      time: "12 أكتوبر، 01:00 ظهراً",
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileStudentCubit, ProfileStudentState>(
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
            final profile = state.profileResponse.data;
          final persondata=state.personResponse;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
              child: SingleChildScrollView(
                child: Column(
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.sp,
                                    horizontal: 8.sp,
                                  ),
                                  child: Text(
                                    "  البيانات الشخصية ",
                                    style: TextSt.textstyle24,
                                  ),
                                ),
                                Icon(Icons.badge_outlined, size: 30.sp),],
                            ),
                            SizedBox(height: 20.sp),
                            textfieldperson(
                              text: "تاريخ الالتحاق",
                              texthint: profile.enrollmentDate.isNotEmpty
                                  ? profile.enrollmentDate.substring(0, 10)
                                  : "غير متوفر",
                            ),
                            SizedBox(height: 20.sp),
                            textfieldperson(
                              text: "الجنسية",
                              texthint:state.personResponse.data.nationality?? "سوري", 
                            ),
                            SizedBox(height: 20.sp),
                            textfieldperson(
                              text: "رقم الهوية",
                              texthint: state.personResponse.data.nationalId ?? "غير متوفر",
                            ),
                            SizedBox(height: 20.sp),
                            textfieldperson(
                              text: "العنوان",
                              texthint: state.personResponse.data.address ?? "غير متوفر",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),

             
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
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.sp,
                                    horizontal: 8.sp,
                                  ),
                                  child: Text(
                                    " عرض الخطة \n   الدراسية ",
                                    style: TextSt.textstyle12,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  " المقررات \n الدراسية ",
                                  style: TextSt.textstyle24,
                                ),
                                SizedBox(width: 12.sp),
                                Icon(
                                  Icons.menu_book_outlined,
                                  size: 30.sp,
                                  color: kcolorOlive,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.sp),
                            linearcontainerprofile(
                              maintitle: "الرياضيات المتقدمة",
                              subtitle: "أ. خالد العتيبي",
                              lasttitle: "التقدم الأكاديمي",
                              text: "5 ساعات",
                              progress: 83,
                            ),
                            SizedBox(height: 16.sp),
                            linearcontainerprofile(
                              maintitle: "الرياضيات المتقدمة",subtitle: "أ. خالد العتيبي",
                              lasttitle: "التقدم الأكاديمي",
                              text: "5 ساعات",
                              progress: 99,
                            ),
                            SizedBox(height: 16.sp),
                            linearcontainerprofile(
                              maintitle: "الرياضيات المتقدمة",
                              subtitle: "أ. خالد العتيبي",
                              lasttitle: "التقدم الأكاديمي",
                              text: "5 ساعات",
                              progress: 23,
                            ),
                            SizedBox(height: 16.sp),
                            linearcontainerprofile(
                              maintitle: "الرياضيات المتقدمة",
                              subtitle: "أ. خالد العتيبي",
                              lasttitle: "التقدم الأكاديمي",
                              text: "5 ساعات",
                              progress: 65,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),

                 
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.sp,
                                    horizontal: 8.sp,
                                  ),
                                  child: Text(
                                    "   النشاط الأخير ",
                                    style: TextSt.textstyle24,
                                  ),
                                ),
                                Icon(Icons.history, size: 30.sp),
                              ],
                            ),
                            Column(
                              children: List.generate(activities.length, (index) {
                                final item = activities[index];

                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.sp,
                                      vertical: 16.sp,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selectedIndex == index
                                          ? item.color.withOpacity(0.15)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                item.time,
                                                style: TextSt.textstyle14
                                                    .copyWith(
                                                      color: selectedIndex == index
                                                          ? item.color
                                                          : Colors.grey,
                                                    ),
                                              ),
                                              SizedBox(height: 16.sp),
                                              Text(
                                                item.title,
                                                textAlign: TextAlign.right,
                                                style: TextSt.textstyle14
                                                    .copyWith(
                                                      fontWeight:
                                                          selectedIndex == index
                                                          ? FontWeight.bold
                                                          : FontWeight.normal,
                                                      color: selectedIndex == index
                                                          ? item.color
                                                          : Colors.black,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Column(
                                          children: [
                                            Container(
                                              width: 2.sp,
                                              height: 20.sp,
                                              color: Colors.grey.shade300,
                                            ),
                                            Container(
                                              width: 20.sp,
                                              height: 20.sp,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: item.color,
                                                border: Border.all(
                                                  color: selectedIndex == index
                                                      ? item.color
                                                      : Colors.white,
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 2.sp,
                                              height: 20.sp,
                                              color: Colors.grey.shade300,
                                            ),],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class ActivityItem {
  final String title;
  final String time;
  final Color color;

  ActivityItem({required this.title, required this.time, required this.color});
}