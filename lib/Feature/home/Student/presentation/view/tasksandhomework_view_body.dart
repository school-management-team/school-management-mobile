import 'package:file_picker/file_picker.dart';
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

class _TasksandhomeworkViewBodyState extends State<TasksandhomeworkViewBody> {
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
        } else if (state is TasksendSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("تم تسليم المهمة بنجاح"),
              duration: Duration(seconds: 1),
              backgroundColor: kcolorOlive,
            ),
          );
        }
      },
      builder: (context, state) {
      
        AssignmentProgressData? progressData;
        List<AssignmentModel> allAssignments = [];

        if (state is TasksendSuccess) {
          progressData = state.progressResponse.data;
          allAssignments = state.assignmentsList;
        }

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
            child: Column(
              children: [
               
                DailyProgressCard(
                  progress: progressData != null ? progressData.percentage / 100 : 0.0,
                  completed: progressData?.completed ?? 0,
                  total: progressData?.total ?? 0,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: MRSHGRMainView(assignments: allAssignments),
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

  const MRSHGRMainView({super.key, required this.assignments});

  @override
  _MRSHGRMainViewState createState() => _MRSHGRMainViewState();
}

class _MRSHGRMainViewState extends State<MRSHGRMainView> {
  int _selectedIndex = 0; 

  Future<void> _submitTask(int assignmentId) async {
    FilePickerResult? result = await FilePicker.pickFiles();
    if (result != null) {
    
      BlocProvider.of<TasksendCubit>(context).completeAssignment(assignmentId);
    }
  }

  @override
  Widget build(BuildContext context) {

    List<AssignmentModel> filteredAssignments = widget.assignments.where((t) {
      if (_selectedIndex == 1) {
        return t.status == 'completed';
      } else {
        return t.status != 'completed';
      }
    }).toList();
    filteredAssignments.sort((a, b) => (a.isUrgent == b.isUrgent) ? 0 : a.isUrgent ? -1 : 1);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16.sp),
            padding: EdgeInsets.all(4.sp),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(23),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [_buildTab("المكتملة", 1), _buildTab("قيد التنفيذ", 0)],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, anim) => FadeTransition(
              opacity: anim,
              child: SlideTransition(
                position: Tween(
                  begin: const Offset(0.1, 0),
                  end: Offset.zero,
                ).animate(anim),
                child: child,
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              key: ValueKey(_selectedIndex),
              itemCount: filteredAssignments.length,
              itemBuilder: (context, i) => _buildTaskCard(filteredAssignments[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
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
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? kcolorgreen : Colors.grey[800],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(AssignmentModel task) {
    bool isCompleted = task.status == 'completed';

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade300),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.more_vert_sharp, color: Colors.grey, size: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                decoration: BoxDecoration(
                  color: (task.isUrgent ? Colors.red : Colors.green).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  task.isUrgent ? "هام جداً" : "عادي",
                  style: TextStyle(color: task.isUrgent ? Colors.red : Colors.green,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.sp),
          Text(task.title, style: TextSt.textstyle16),
          SizedBox(height: 10.sp),
          Text(task.description, style: TextStyle(color: Colors.grey[600])),
          SizedBox(height: 16.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isCompleted)
                ElevatedButton.icon(
                  onPressed: () => _submitTask(task.id),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kcolorOlive,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Icon(Icons.upload_file, size: 16.sp),
                  label: Text("تسليم", style: TextSt.textstyle17),
                ),
              SizedBox(height: 12.sp),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(task.teacherAssignment.subject.name, style: TextSt.textstyle12),
                  SizedBox(width: 4.sp),
                  const Icon(Icons.menu_book_rounded, size: 15, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(task.dueDate.split('T')[0], style: TextSt.textstyle12),
                  const SizedBox(width: 4),
                  const Icon(Icons.calendar_month, size: 15, color: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}