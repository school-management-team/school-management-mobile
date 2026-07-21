import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/AcademicPerformanceRing.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/SimpleSchedule.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/inforcontaner_studentDash.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/informationStudent.dart';
import 'package:school/constant.dart';

import 'package:school/core/widget/Text/text_style.dart';

class StudentdashboardBodyView extends StatelessWidget {
  const StudentdashboardBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 14.w, vertical: 12.h),
        child: Column(
          children: [
            ContainerStudentDash(),
            SizedBox(height: 16.h),
            containerStudySchedule(),
            SizedBox(height: 16.h),
            AcademicPerformanceRing(percentageInt: 5),
            SizedBox(height: 16.h),
            Container(
              height: 300.sp,
              width: 400.sp,
              decoration: BoxDecoration(
                color: Color(0xFFFFDDB8),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Color(0XFF2A1700).withOpacity(0.2)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.sp,
                  vertical: 16.sp,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "القسط المدرسي",
                          style: TextSt.textstyle24.copyWith(
                            color: Color(0XFF2A1700),
                          ),
                        ),
                        Spacer(),

                        Container(
                          height: 40.sp,
                          width: 120.sp,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 249, 222, 193),
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: KcolorGrey.withOpacity(0.2),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 4.h,
                            ),
                            child: Text(
                              "مستحق قريباً",
                              style: TextSt.textstyle14.copyWith(
                                color: Color(0XFF2A1700),
                              ),

                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "درهم",
                          style: TextSt.textstyle17.copyWith(
                            color: Color(0XFF2A1700),
                          ),
                        ),
                        Text(
                          "3,500 ",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF2A1700),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Color(0XFF2A1700),
                          size: 12,
                        ),
                        Text(
                          "يستحق في: 15 أكتوبر 2023",
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Color(0XFF2A1700)),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                        fixedSize: Size(300.sp, 55.sp),

                        backgroundColor: Color(0XFF2A1700),
                      ),
                      onPressed: () {},
                      child: Text(
                        "دفع الآن",
                        style: TextSt.textstyle16.copyWith(
                          color: Color(0xFFFFDDB8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 500.sp,
              width: 400.sp,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Color(0XFF2A1700).withOpacity(0.2)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.sp,
                  vertical: 16.sp,
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.campaign_outlined, size: 25.sp),
                        Text("الإعلانات المدرسية", style: TextSt.textstyle24),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    inforcontainer(
                      maintitle: "مهرجان العلوم السنوي",
                      subtitle: "ندعوكم لحضور مهرجان العلوم ",

                      subtitle2:
                          "يوم الخميس القادم. نرجو تأكيد \n                                  .الحضور",
                      lasttitle: "منذ ساعتين",
                      icon: Icon(Icons.celebration_outlined, size: 25.sp),
                      color: Color(0XffD3E4FF),
                    ),
                    SizedBox(height: 12.h),
                    inforcontainer(
                      maintitle: "تحديث قائمة الكتب",
                      subtitle: " تم توفير النسخ الرقمية من",
                      subtitle2:
                          "مقررات الفصل الثاني على\n                           .المنصة ",
                      icon: Icon(Icons.menu_book_outlined, size: 25.sp),
                      color: KcolorGrey.withOpacity(0.2),
                      lasttitle: "أمس",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 500.sp,
              width: 400.sp,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Color(0XFF2A1700).withOpacity(0.2)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.sp,
                  vertical: 16.sp,
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.medical_services_outlined,
                          size: 25.sp,
                          color: const Color.fromARGB(255, 161, 40, 31),
                        ),
                        Text("السجل الصحي ", style: TextSt.textstyle24),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      height: 250.sp,
                      width: 400.sp,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Color(0XFF2A1700).withOpacity(0.2),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 16.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40.sp,
                                  width: 150.sp,
                                  decoration: BoxDecoration(
                                    color: KcolorGrey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      color: KcolorGrey.withOpacity(0.2),
                                    ),
                                  ),

                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                    child: Text(
                                      "آخر زيارة للعيادة",
                                      style: TextSt.textstyle14,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "  12 سبتمبر  ",
                                  style: TextSt.textstyle14,
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text("صداع بسيط وإرهاق", style: TextSt.textstyle17),
                            SizedBox(height: 8.h),
                            Text(
                              "تم إعطاء الطالب قسطاً من الراحة",
                              style: TextSt.textstyle14.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "ومسكن بسيط. عاد الطالب للصف بعد",
                              style: TextSt.textstyle14.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              ".30 دقيقة وحالته مستقرة",
                              style: TextSt.textstyle14.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Divider(color: Color(0XFFC4C6CD), thickness: 0),
                    SizedBox(height: 12.h),

                    Text(
                      "الحساسية المسجلة",
                      textAlign: TextAlign.end,
                      style: TextSt.textstyle14,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Container(
                          height: 40.sp,
                          width: 120.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: KcolorGrey.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Text(
                              "الأسبرين",
                              textAlign: TextAlign.center,
                              style: TextSt.textstyle14,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          height: 40.sp,
                          width: 150.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: Color(0xffFFDAD6),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Text(
                              "الفول السوداني",
                              textAlign: TextAlign.center,
                              style: TextSt.textstyle14.copyWith(
                                color: Color(0xffBA1A1A),
                              ),
                            ),
                          ),
                        ),
                      ],
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
}
