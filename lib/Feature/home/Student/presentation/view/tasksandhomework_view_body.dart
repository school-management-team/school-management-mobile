import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/dailyprogresscard_taskhomework.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class TasksandhomeworkViewBody extends StatefulWidget {
  const TasksandhomeworkViewBody({super.key});

  @override
  State<TasksandhomeworkViewBody> createState() =>
      _TasksandhomeworkViewBodyState();
}

class _TasksandhomeworkViewBodyState extends State<TasksandhomeworkViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
        child: Column(
          children: [
            DailyProgressCard(progress: 0.95, completed: 6, total: 5),
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: MRSHGRMainView(),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  String title, description, date, subject, priority;
  bool isCompleted;
  Task({
    required this.title,
    required this.description,
    required this.date,
    required this.subject,
    required this.priority,
    this.isCompleted = false,
  });
}

class MRSHGRMainView extends StatefulWidget {
  @override
  _MRSHGRMainViewState createState() => _MRSHGRMainViewState();
}

class _MRSHGRMainViewState extends State<MRSHGRMainView> {
  int _selectedIndex = 0;
  List<Task> tasks = [
    Task(
      title: "مشروع الفيزياء: الطاقة المتجددة",
      description: "تسليم عرض تقديمي مفصل عن الخلايا الشمسية",
      date: "غداً 10:00 ص",
      subject: "الفيزياء",
      priority: "هام جداً",
    ),
    Task(
      title: "تحليل نص: المتنبي",
      description: "كتابة مقال تحليلي لقصيدة واحر قلباه",
      date: "24 أكتوبر",
      subject: "اللغة العربية",
      priority: "عادي",
    ),
  ];

  Future<void> _submitTask(Task task) async {
    FilePickerResult? result = await FilePicker.pickFiles();
    if (result != null) {
      setState(() {
        task.isCompleted = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("تم تسليم الملف بنجاح! 🎉"),
          duration: Duration(seconds: 1),
          backgroundColor: kcolorOlive,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Task> filteredTasks = tasks
        .where((t) => t.isCompleted == (_selectedIndex == 1))
        .toList();
    filteredTasks.sort((a, b) => a.priority == "هام جداً" ? -1 : 1);

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
              physics: NeverScrollableScrollPhysics(),
              key: ValueKey(_selectedIndex),
              itemCount: filteredTasks.length,
              itemBuilder: (context, i) => _buildTaskCard(filteredTasks[i]),
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

  Widget _buildTaskCard(Task task) {
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
              PopupMenuButton(
                onSelected: (val) =>
                    setState(() => task.priority = val.toString()),
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: "هام جداً",
                    child: Text("هام جداً", style: TextSt.textstyle14),
                  ),
                  PopupMenuItem(
                    value: "عادي",
                    child: Text("عادي", style: TextSt.textstyle14),
                  ),
                ],
                child: Icon(
                  Icons.more_vert_sharp,
                  color: Colors.grey,
                  size: 20.sp,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                decoration: BoxDecoration(
                  color:
                      (task.priority == "هام جداً" ? Colors.red : Colors.green)
                          .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  task.priority,
                  style: TextStyle(
                    color: task.priority == "هام جداً"
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
          Text(task.title, style: TextSt.textstyle16),
          SizedBox(height: 10.sp),
          Text(task.description, style: TextStyle(color: Colors.grey[600])),
          SizedBox(height: 16.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!task.isCompleted)
                ElevatedButton.icon(
                  onPressed: () => _submitTask(task),
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
                  Text(task.subject, style: TextSt.textstyle12),
                  SizedBox(width: 4.sp),
                  Icon(
                    Icons.menu_book_rounded,
                    size: 15.sp,
                    color: Colors.grey,
                  ),
                  Text(task.date, style: TextSt.textstyle12),
                  const SizedBox(width: 4),
                  Icon(Icons.calendar_month, size: 15.sp, color: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
