import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_dashboard_student/dashboard1_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_tasksend/tasksend_cubit.dart';

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
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Dashboard1StudentCubit>().getStudentDashboardData();
    });
  }

  bool _isTaskCompleted(dynamic task) {
    final status = task['status']?.toString().toLowerCase().trim() ?? '';

    return status == 'completed' || status == 'done' || status == 'finished';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Dashboard1StudentCubit, Dashboard1StudentState>(
      listener: (context, state) {
        if (state is Dashboard1StudentFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },

      builder: (context, state) {
        if (state is Dashboard1StudentLoading) {
          return const Center(
            child: CircularProgressIndicator(color: kcolorOlive),
          );
        }

        if (state is Dashboard1StudentFailure) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Text(
                state.errMessage,
                style: TextSt.textstyle14,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        final dashboardData = state is Dashboard1StudentSuccess
            ? state.studentDashboardModel.data
            : null;

        if (dashboardData == null) {
          return const Center(
            child: CircularProgressIndicator(color: kcolorOlive),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text("أهلاً بك مجدداً ", style: TextSt.textstyle16),

                SizedBox(height: 16.sp),
                Text(
                  ".أتمنى لك يوماً دراسياً ممتعاً ومفيداً",
                  style: TextSt.textstyle14,
                ),

                SizedBox(height: 30.sp),

                dashcontainerst(
                  attendanceRate: dashboardData.attendanceRate ?? 0.0,

                  averageGrade: dashboardData.averageGrade100 ?? 0.0,
                ),

                SizedBox(height: 20.sp),

                dashboardData.nextClass == null
                    ? const SizedBox.shrink()
                    : Container(
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

                        child: Padding(
                          padding: EdgeInsets.all(12.sp),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,

                                children: [
                                  Text(
                                    dashboardData.nextClass['time'] ?? "",
                                    style: TextSt.textstyle16.copyWith(
                                      color: kcolorOlive,
                                    ),
                                  ),

                                  SizedBox(height: 12.sp),

                                  Text(
                                    dashboardData.nextClass['room'] ?? "",
                                    style: TextSt.textstyle14,
                                  ),
                                ],
                              ),

                              SizedBox(width: 16.sp),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,

                                children: [
                                  Text(
                                    "الحصة القادمة",
                                    style: TextSt.textstyle14,
                                  ),

                                  SizedBox(height: 10.sp),
                                  Text(
                                    dashboardData.nextClass['name'] ?? "",
                                    style: TextSt.textstyle16,
                                  ),
                                ],
                              ),

                              const Spacer(),

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
                      ),

                SizedBox(height: 30.sp),

                Text("الوصول السريع", style: TextSt.textstyle17),

                SizedBox(height: 16.sp),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    _buildQuickCard(
                      context: context,
                      title: "الجدول",
                      icon: Icons.calendar_month,
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kDash2Student);
                      },
                    ),

                    _buildQuickCard(
                      context: context,
                      title: "المهام",
                      icon: Icons.assignment_outlined,
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.kTaskshomeworkStudent);
                      },
                    ),

                    _buildQuickCard(
                      context: context,
                      title: "الدرجات",
                      icon: Icons.star_outline,
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.kGradecardstStudent);
                      },
                    ),
                  ],
                ),

                SizedBox(height: 20.sp),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Text(
                      "عرض الكل",
                      style: TextSt.textstyle16.copyWith(color: kcolorOlive),
                    ),

                    const Spacer(),

                    Text("مهام اليوم", style: TextSt.textstyle16),
                  ],
                ),

                SizedBox(height: 16.sp),

              dashboardData.todayAssignments.isEmpty
    ? Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.sp,
        ),
        child: Center(
          child: Text(
            "لا توجد مهام دراسية لهذا اليوم",
            style: TextSt.textstyle14.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      )
    : ListView.builder(
        itemCount:
            dashboardData.todayAssignments.length,
        shrinkWrap: true,
        physics:
            const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final task =
              dashboardData.todayAssignments[index];

          return CustomCardItem(
            title: task['title'] ??
                'مهمة جديدة',
            subtitle: task['description'] ??
                'موعد تسليم المهام اليوم',
            icons:
                Icons.assignment_turned_in,
            status:
                task['status']?.toString() ?? '',
          );
        },
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

  Widget _buildQuickCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
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

                border: Border.all(color: Colors.green.shade100),

                borderRadius: BorderRadius.circular(40.sp),
              ),

              child: IconButton(
                onPressed: onTap,

                icon: Icon(icon, size: 20.sp, color: kcolorOlive),
              ),
            ),
          ),

          Text(title, style: TextSt.textstyle17),
        ],
      ),
    );
  }
}
