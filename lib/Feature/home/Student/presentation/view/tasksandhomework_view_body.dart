import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/Data/models/AssignmentProgressResponse.dart';
import 'package:school/Feature/home/Student/Data/models/AssignmentsListResponse.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/dailyprogresscard_taskhomework.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_tasksend/tasksend_cubit.dart';
import 'package:school/constant.dart';
import 'package:school/core/function/showloadingDialog.dart';
import 'package:school/core/widget/Text/text_style.dart';

class TasksandhomeworkViewBody extends StatefulWidget {
  const TasksandhomeworkViewBody({super.key});

  @override
  State<TasksandhomeworkViewBody> createState() =>
      _TasksandhomeworkViewBodyState();
}

class _TasksandhomeworkViewBodyState
    extends State<TasksandhomeworkViewBody> {
  @override
  void initState() {
    super.initState();

    context.read<TasksendCubit>().getTasksAndProgressData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksendCubit, TasksendState>(
      listener: (context, state) {
        if (state is TasksendFailuer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errormessage),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is TasksendLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: kcolorOlive,
            ),
          );
        }

        AssignmentProgressData? progressData;
        List<AssignmentModel> allAssignments = [];

        if (state is TasksendSuccess) {
          progressData = state.progressResponse.data;
          allAssignments = state.assignmentsList;
        }

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.sp,
              vertical: 8.sp,
            ),
            child: Column(
              children: [
                DailyProgressCard(
                  percentage: progressData?.percentage ?? 0,
                  completed: progressData?.completed ?? 0,
                  total: progressData?.total ?? 0,
                ),
                SizedBox(height: 16.sp),
                MRSHGRMainView(
                  assignments: allAssignments,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MRSHGRMainView extends StatefulWidget {
  final List<AssignmentModel> assignments;

  const MRSHGRMainView({
    super.key,
    required this.assignments,
  });

  @override
  State<MRSHGRMainView> createState() => _MRSHGRMainViewState();
}

class _MRSHGRMainViewState extends State<MRSHGRMainView> {
  int _selectedIndex = 0;
Future<void> _submitTask(int assignmentId) async {
  final cubit = context.read<TasksendCubit>();

  final success = await cubit.completeAssignment(assignmentId);

  if (!mounted) return;

  if (success) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم إنجاز المهمة بنجاح'),
        backgroundColor: Colors.green,
      ),
    );



    if (!mounted) return;

  
    setState(() {
      _selectedIndex = 1;
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('فشل إرسال المهمة، جربي مرة أخرى'),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    final filteredAssignments = widget.assignments.where((t) {
      final status = t.status.toLowerCase().trim();

      if (_selectedIndex == 1) {
        return status == 'completed' ||
            status == 'done' ||
            status == 'finished';
      } else {
        return status != 'completed' &&
            status != 'done' &&
            status != 'finished';
      }
    }).toList();filteredAssignments.sort(
      (a, b) {
        if (a.isUrgent == b.isUrgent) {
          return 0;
        }

        return a.isUrgent ? -1 : 1;
      },
    );

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16.sp),
          padding: EdgeInsets.all(4.sp),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(23),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Row(
            children: [
              _buildTab("المكتملة", 1),
              _buildTab("قيد التنفيذ", 0),
            ],
          ),
        ),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, anim) {
            return FadeTransition(
              opacity: anim,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.1, 0),
                  end: Offset.zero,
                ).animate(anim),
                child: child,
              ),
            );
          },
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            key: ValueKey(_selectedIndex),
            itemCount: filteredAssignments.length,
            itemBuilder: (context, i) {
              return _buildTaskCard(
                filteredAssignments[i],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = _selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(23),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 6,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: isSelected
                    ? kcolorgreen
                    : Colors.grey[800],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(AssignmentModel task) {
    final String status = task.status.toLowerCase().trim();

    final bool isCompleted =
        status == 'completed' ||
        status == 'done' ||
        status == 'finished';

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.sp,
        vertical: 8.sp,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.more_vert_sharp,
                color: Colors.grey,
                size: 20,
              ),Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.sp,
                  vertical: 4.sp,
                ),
                decoration: BoxDecoration(
                  color: (task.isUrgent
                          ? Colors.red
                          : Colors.green)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  task.isUrgent ? "هام جداً" : "عادي",
                  style: TextStyle(
                    color: task.isUrgent
                        ? Colors.red
                        : Colors.green,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.sp),

          Text(
            task.title,
            style: TextSt.textstyle16,
          ),

          SizedBox(height: 10.sp),

          Text(
            task.description,
            style: TextSt.textstyle14.copyWith(
              color: Colors.grey[600],
            ),
          ),

          SizedBox(height: 16.sp),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              if (!isCompleted)
              ElevatedButton.icon(
  onPressed: () {
  
    _submitTask(task.id);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: kcolorOlive,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  icon: Icon(
    Icons.check_circle_outline,
    size: 16.sp,
  ),
  label: Text(
    "تسليم",
    style: TextSt.textstyle17,
  ),
),
              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),

                  Text(
                    task.teacherAssignment.subject.name,
                    style: TextSt.textstyle10,
                  ),

                  SizedBox(width: 4.sp),

                  const Icon(
                    Icons.menu_book_rounded,
                    size: 12,
                    color: Colors.grey,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    task.dueDate.split('T')[0],
                    style: TextSt.textstyle10,
                  ),

                  const SizedBox(width: 4),

                  const Icon(
                    Icons.calendar_month,
                    size: 15,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}