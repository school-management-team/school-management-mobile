import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/AcademicTipCard.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/GradeCard.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/PerformanceChart.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class GradecardstViewBody extends StatelessWidget {
  const GradecardstViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.sp),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(4, 4),
                    blurRadius: 2,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.sp,
                          vertical: 8.sp,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        child: Text(
                          "3.92",
                          style: TextSt.textstyle16.copyWith(
                            color: kcolorgreen,
                          ),
                        ),
                      ),

                      Text("تحليل الدرجات", style: TextSt.textstyle24),
                    ],
                  ),

                  SizedBox(height: 16.sp),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "الفصل الدراسي الأول - 2024",
                      style: TextSt.textstyle14,
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        " (+0.12 من الشهر الماضي)",
                        style: TextSt.textstyle12,
                      ),
                      SizedBox(height: 12.sp),
                      Text(
                        "ممتاز ",
                        style: TextSt.textstyle16.copyWith(color: kcolorOlive),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.sp),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "التفاصيل",
                  style: TextSt.textstyle17.copyWith(color: kcolorOlive),
                ),
                Spacer(),
                Text("المواد الدراسية", style: TextSt.textstyle24),
              ],
            ),

            GradeCard(
              subjectName: "الرياضيات",
              subTitle: "التحليل الرياضي والهندسة",
              grade: "A",
              gpa: "4.0",
              progress: 0.94,
              icon: Icons.functions,
            ),
            GradeCard(
              subjectName: "الفيزياء",
              subTitle: "الميكانيكا الحيوية",
              grade: "A-",
              gpa: "3.7",
              progress: 0.65,
              icon: Icons.rocket_launch,
            ),
            GradeCard(
              subjectName: "اللغة العربية",
              subTitle: "الأدب والبلاغة",
              grade: "B+",
              gpa: "3.3",
              progress: 0.40,
              icon: Icons.translate,
            ),
            PerformanceChart(),
            SizedBox(height: 30.sp),
            AcademicTipCard(
              title: "نصيحة الأكاديمي",
              content:
                  "أداء متميز في المواد العلمية. نلاحظ تقدماً كبيراً في الرياضيات. ننصح بالتركيز أكثر على مهارات التعبير في اللغة العربية للحفاظ على معدل GPA مرتفع ",
              author: "أ. فهد العمري - مرشد أكاديمي",
              authorInitial: "أ.ف",
            ),
          ],
        ),
      ),
    );
  }
}