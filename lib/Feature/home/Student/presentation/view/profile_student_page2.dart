import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/SimpleSchedule.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/linearPrecent.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/textFieldPerson_profile.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigator/bottomNavgtion_fiveitems.dart';

class ProfileStudentPage2 extends StatefulWidget {
  const ProfileStudentPage2({super.key});

  @override
  State<ProfileStudentPage2> createState() => _ProfileStudentPage2State();
}

class _ProfileStudentPage2State extends State<ProfileStudentPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 40.sp),
        leadingWidth: 43,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              " نيو أكاديميك",
              style: TextSt.textstyle28.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 22.sp,
                fontFamily: 'normal',
              ),
            ),  SizedBox(width: 12.sp),
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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                   border: Border.all(color: Colors.black12)
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

                          Icon(Icons.badge_outlined, size: 30.sp),
                        ],
                      ),
                      SizedBox(height: 20.sp),
                      textfieldperson(
                        text: "تاريخ الميلاد",
                        texthint: "15 مارس 2008 (16 سنة)",
                      ),
                      SizedBox(height: 20.sp),
                      textfieldperson(text: "الجنسية ", texthint: "سعودي"),
                      SizedBox(height: 20.sp),
                      textfieldperson(
                        text: " رقم الهوية",
                        texthint: "1092837465",
                      ),
                      SizedBox(height: 20.sp),
                      textfieldperson(
                        text: "العنوان ",
                        texthint: "الرياض، حي الملقا، شارع الأمير محمد بن",
                      ),]))),
                      SizedBox(height: 20.sp),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                           border: Border.all(color: Colors.black12)
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
                                  Spacer(),
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
                                maintitle: "الرياضيات المتقدمة",
                                subtitle: "أ. خالد العتيبي",
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
                          border: Border.all(color: Colors.black12)
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

                                  Icon(
                                    Icons.history,
                                    size: 30.sp,
                                  ),
                                ],
                              ),
                              Column(
                                children: List.generate(activities.length, (
                                  index,
                                ) {
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                        color:
                                                            selectedIndex ==
                                                                index
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
                                                            selectedIndex ==
                                                                index
                                                            ? FontWeight.bold
                                                            : FontWeight.normal,
                                                        color:
                                                            selectedIndex ==
                                                                index
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
                                                    color:
                                                        selectedIndex == index
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
                                              ),
                                            ],
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
