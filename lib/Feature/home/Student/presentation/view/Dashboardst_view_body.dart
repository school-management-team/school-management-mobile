import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_dashboard_student/dashboard1_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_profile_student/profile_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/todaytasks_dash.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/widgetdashcontainerst.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';

class DashboardstViewBody extends StatefulWidget {
  const DashboardstViewBody({super.key});

  @override
  State<DashboardstViewBody> createState() => _DashboardstViewBodyState();
}

class _DashboardstViewBodyState extends State<DashboardstViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Dashboard1StudentCubit, Dashboard1StudentState>(
      builder: (context, state) {
        if (state is Dashboard1StudentLoading) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.sp),
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is Dashboard1StudentFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("أهلاً بك مجدداً، أحمد", style: TextSt.textstyle16),
                SizedBox(height: 16.sp),
                Text(
                  " .أتمنى لك يوماً دراسياً ممتعاً ومفيداً",
                  style: TextSt.textstyle14,
                ),

                SizedBox(height: 30.sp),
                dashcontainerst(),
                SizedBox(height: 20.sp),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12.sp),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: const Offset(4, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  " ص10:30  ",
                                  style: TextSt.textstyle16.copyWith(
                                    color: kcolorOlive,
                                  ),
                                ),
                                SizedBox(height: 12.sp),
                                Text("قاعة 402", style: TextSt.textstyle14),
                              ],
                            ),
                            SizedBox(width: 16.sp),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "الحصة القادمة ",
                                  style: TextSt.textstyle14,
                                ),
                                SizedBox(height: 10.sp),
                                Text(
                                  " مختبر العلوم الحديثة",
                                  style: TextSt.textstyle16,
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 60.sp,
                              height: 60.sp,
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                border: Border.all(
                                  color: Colors.green.shade100,
                                ),
                                borderRadius: BorderRadius.circular(20.sp),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    offset: const Offset(4, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.science,
                                size: 30.sp,
                                color: kcolorOlive,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.sp),
                Text("الوصول السريع", style: TextSt.textstyle17),
                SizedBox(height: 16.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100.sp,
                      height: 120.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16.sp),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(4, 4),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 40.sp,
                              height: 40.sp,
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,

                                border: Border.all(
                                  color: Colors.green.shade100,
                                ),
                                borderRadius: BorderRadius.circular(40.sp),
                              ),
                              child: IconButton(
                                 onPressed:() => GoRouter.of(context).push(AppRouter.kDash2Student) ,icon: Icon(
                                Icons.calendar_month,
                                size: 20.sp,
                                color: kcolorOlive,
                              )),
                            ),
                          ),
                          Text("الجدول", style: TextSt.textstyle17),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.sp),
                    Container(
                      width: 100.sp,
                      height: 120.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(4, 4),
                            blurRadius: 6,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16.sp),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 40.sp,
                              height: 40.sp,
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,

                                border: Border.all(
                                  color: Colors.green.shade100,
                                ),
                                borderRadius: BorderRadius.circular(40.sp),
                              ),
                              child: IconButton(
                                 onPressed:() => GoRouter.of(context).push(AppRouter.kTaskshomeworkStudent) ,icon: Icon(
                                Icons.assignment_outlined,
                                size: 20.sp,
                                color: kcolorOlive,
                              )),
                            ),
                          ),
                          Text("المهام", style: TextSt.textstyle17),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.sp),
                    Container(
                      width: 100.sp,
                      height: 120.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),

                        borderRadius: BorderRadius.circular(16.sp),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(4, 4),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 40.sp,
                              height: 40.sp,
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,

                                border: Border.all(
                                  color: Colors.green.shade100,
                                ),
                                borderRadius: BorderRadius.circular(40.sp),
                              ),
                              child: IconButton(
                                 onPressed:() => GoRouter.of(context).push(AppRouter.kGradecardstStudent) ,icon: Icon(
                                Icons.star_outline,
                                size: 20.sp,
                                color: kcolorOlive,
                              )),
                            ),
                          ),
                          Text("الدرجات", style: TextSt.textstyle17),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      " عرض الكل",
                      style: TextSt.textstyle16.copyWith(color: kcolorOlive),
                    ),
                    Spacer(),
                    Text("مهام اليوم", style: TextSt.textstyle16),
                  ],
                ),
                SizedBox(height: 16.sp),
                CustomCardItem(
                  title: "حل تمارين التفاضل",
                  subtitle: "مادة الرياضيات • 3 مساءً",
                  icons: Icons.functions_rounded,
                ),
                CustomCardItem(
                  title: "مقال الأدب الجاهلي",
                  subtitle: " مادة اللغة العربية • 8 مساءً",
                  icons: Icons.edit_note,
                ),
                SizedBox(height: 30.sp),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AssestData.backgroundstudent,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
