import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/Data/models/grade.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/AcademicTipCard.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/GradeCard.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/PerformanceChart.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_grade/grade_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_grade/grade_state.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class GradecardstViewBody extends StatefulWidget {
  const GradecardstViewBody({super.key});

  @override
  State<GradecardstViewBody> createState() =>
      _GradecardstViewBodyState();
}

class _GradecardstViewBodyState
    extends State<GradecardstViewBody> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StudentGradesCubit>().getStudentGrades();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder
<StudentGradesCubit, StudentGradesState>(
      builder: (context, state) {
        if (state is StudentGradesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StudentGradesFailure) {
          return Center(
            child: Text(
              "خطأ في تحميل البيانات: ${state.errormessage}", // أو الخطأ حسب تصميم الـ Failure عندك
              style: TextSt.textstyle16.copyWith(color: Colors.red),
            ),
          );
        } 
          else if (state is StudentGradesSuccess) {
          final data = state.studentGradesResponse.data;

   
          SubjectModel? highestSubject;
          if (data.subjects.isNotEmpty) {
            highestSubject = data.subjects.reduce((curr, next) => 
              curr.totalValue > next.totalValue ? curr : next
            );
          }
        
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
                                data.averageGrade100.toString(),
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
                          child: Text(data.semesterLabel, 
                            style: TextSt.textstyle14,
                          ),
                        ),
                        SizedBox(height: 16.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "ممتاز",
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
                      const Spacer(),
                      Text("المواد الدراسية", style: TextSt.textstyle24),
                    ],
                  ),
                  SizedBox(height: 12.sp),

                  ...data.subjects.map((subject) => GradeCard(
                        subjectName: subject.subject,
                        subTitle: subject.passed ? "ناجح" : "راسب",
                        grade: subject.totalValue.toString(),
                        gpa: "${subject.passingGrade}",
                        progress: subject.totalValue / 100,
                        icon: Icons.book,
                      )),

                  SizedBox(height: 20.sp),

              
                  PerformanceChart(subjects: data.subjects),

                  SizedBox(height: 30.sp),
                  AcademicTipCard(
                    title: "نصيحة الأكاديمي",
                    content: "أداء متميز في المواد الدراسية. استمري بهذا التقدم الرائع!",
                    author: "الإدارة الأكاديمية",
                    authorInitial: "أ.ع",
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}