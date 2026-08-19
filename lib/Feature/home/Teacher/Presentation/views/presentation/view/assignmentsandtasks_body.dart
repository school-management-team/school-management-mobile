import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/taskteachercubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/TaskList.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class assignmentschool extends StatefulWidget {
  const assignmentschool({super.key});

  @override
  assignments createState() => assignments();
}

class assignments extends State<assignmentschool> {
  bool isSelected = true;

  @override
  void initState() {
    super.initState();
    context.read<TaskCubit>().fetchtasks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 1023.35.h,
      padding: EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 20),
      child: ListView(
        children: [
          Container(
            width: 358.w,
            height: 183.78.h,
            padding: EdgeInsets.only(bottom: 32, left: 24, right: 24, top: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Color(0xFFFFFFFF).withOpacity(0.7),
              boxShadow: [
                BoxShadow(
                  color: Color(0XFF071A2F).withOpacity(0.05),
                  offset: Offset(0, 3),
                  blurRadius: 8,
                ),
              ],
            ),
            child: BlocBuilder<TaskCubit, TaskTeacher>(
              builder: (context, state) {
                int totaltasks = 0;
                int complete = 0;
                if (state is TaskLoaded) {
                  totaltasks = state.tasks.length;
                  complete = state.tasks
                      .where(
                        (task) =>
                            task['iscompleted'] == true ||
                            task['status'] == 'completed',
                      )
                      .length;
                }
                double progress = totaltasks > 0 ? complete / totaltasks : 0;
                return Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 96.w,
                          height: 96.h,
                          child: CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 8.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF006C49),
                            ),
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                        Text(
                          "${(progress * 100).toInt()}%",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF006C49),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 40.w),
                    Container(
                      width: 162.72.w,
                      height: 119.78.h,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                "إنجازك اليوم",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              height: 26.59.h,
                              padding: EdgeInsets.only(bottom: 0.59),
                              child: Text(
                                "لديك $complete من أصل $totaltasks مهام",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF74777D),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              height: 38.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: SizedBox(
                                  child: Text(
                                    "تفاصيل التقدم",
                                    style: TextSt.textstyle24.copyWith(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF006C49),
                                  padding: EdgeInsets.only(
                                    left: 24,
                                    right: 24,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17.r),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 15.h),

          Container(
            width: 358.w,
            height: 44.h,
            padding: EdgeInsets.only(right: 2, bottom: 2, top: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9999.r),
              color: Color(0xFFF0EEE8),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: isSelected
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: 170.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 175.w,
                      height: 40.h,
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9999.r),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = false;
                          });
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Text(
                            "مكتملة",
                            style: TextStyle(
                              color: isSelected
                                  ? Color(0xFF74777D)
                                  : Color(0xFF00714D),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 175.w,
                      height: 40.h,
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9999.r),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = true;
                          });
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Text(
                            "قيد التنفيذ",
                            style: TextStyle(
                              color: isSelected
                                  ? Color(0xFF00714D)
                                  : Color(0xFF74777D),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),

          BlocBuilder<TaskCubit, TaskTeacher>(
            builder: (context, state) {
              if (state is TaskLoading) {
                return Center(
                  child: CircularProgressIndicator(color: Color(0xFF006C49)),
                );
              } else if (state is TaskLoaded) {
                final filtertask = state.tasks.where((task) {
                  final isCompleted =
                      task['iscompleted'] == true ||
                      task['status'] == 'completed';
                  return isSelected ? !isCompleted : isCompleted;
                }).toList();
                if (filtertask.isEmpty) {
                  return SizedBox(
                    height: 200.h,
                    child: Center(
                      child: Text(
                        isSelected
                            ? "لا توجد مهام قيد التنفيذ"
                            : "لا توجد مهام مكتملة حاليا",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Color(0xFF74777D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filtertask.length,
                  itemBuilder: (context, index) {
                    final task = filtertask[index];
                    final originalIndex = state.tasks.indexOf(task);
                    final isCompleted =
                        task['iscompleted'] == true ||
                        task['status'] == 'completed';

                    return tasklist(
                      tagtext: task['tagtext'] ?? '',
                      title: task['title'] ?? '',
                      datetext: task['datetext'] ?? '',
                      subjecttext: task['subjecttext'] ?? '',
                      description: task['description'] ?? '',
                      iscompleted: isCompleted,
                      onSubmit: () {
                        if (isSelected) {
                          context.read<TaskCubit>().completeTask(originalIndex);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("تم إكمال المهمة بنجاح!"),
                              backgroundColor: Color(0xFF006C49),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                    );
                  },
                );
              } else if (state is TaskError) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.message,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ElevatedButton(
                          onPressed: () {
                            context.read<TaskCubit>().fetchtasks();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF006C49),
                          ),
                          child: Text("إعادة المحاولة"),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
