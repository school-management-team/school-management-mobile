// 📁 lib/Feature/home/Teacher/Presentation/widgets/widget/grade_dialog.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/gradecubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/grade_model.dart';
import 'package:school/constant.dart';

class GradeDialog extends StatefulWidget {
  const GradeDialog({super.key});

  @override
  State<GradeDialog> createState() => _GradeDialogState();
}

class _GradeDialogState extends State<GradeDialog> {
  String? _class;
  String? _section;
  String? _type;

  List<String> _classesList = [];
  List<String> _sectionsList = [];
  List<StudentModel> _studentsList = [];

  final Map<String, TextEditingController> _controllers = {};
  final Map<String, bool> _selected = {};

  @override
  void initState() {
    super.initState();
    context.read<GradeCubit>().fetchClasses();
  }

  @override
  void dispose() {
    for (var c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _initControllers(List<StudentModel> students) {
    for (var s in students) {
      if (!_controllers.containsKey(s.id)) {
        _controllers[s.id] = TextEditingController();
        _selected[s.id] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GradeCubit, GradeState>(
      listener: (context, state) {
        if (state is GradeClassesLoaded) {
          setState(() => _classesList = state.classes);
        } else if (state is GradeSectionsLoaded) {
          setState(() => _sectionsList = state.sections);
        } else if (state is GradeStudentsLoaded) {
          _initControllers(state.students);
          setState(() => _studentsList = state.students);
        } else if (state is GradeSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: kcolorOlive,
            ),
          );
          Navigator.pop(context);
        } else if (state is GradeError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: Color(0xFFFFFFFF),
          title: Row(
            children: [
              // Icon(Icons.grade, color: kcolorOlive),
              SizedBox(width: 8.w),
              Text(
                ' تسجبل درجات فوري ',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_classesList.isNotEmpty)
                  _dropdown('الفصل', _classesList, _class, (v) {
                    setState(() {
                      _class = v;
                      _section = null;
                      _sectionsList = [];
                      _studentsList = [];
                    });
                    if (v != null) context.read<GradeCubit>().fetchSections(v);
                  }),
                SizedBox(height: 12.h),
                if (_sectionsList.isNotEmpty)
                  _dropdown('الشعبة', _sectionsList, _section, (v) {
                    setState(() {
                      _section = v;
                      _studentsList = [];
                    });
                    if (v != null && _class != null) {
                      context.read<GradeCubit>().fetchStudents(_class!, v);
                    }
                  }),
                SizedBox(height: 12.h),
                if (_studentsList.isNotEmpty) ...[
                  _dropdown('النوع', ['مذاكرة', 'امتحان', 'مشاركة'], _type, (
                    v,
                  ) {
                    setState(() => _type = v);
                  }),
                  SizedBox(height: 12.h),
                  if (_type != null) _buildStudentsList(_studentsList),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<GradeCubit>().reset();
                Navigator.pop(context);
              },
              child: const Text('إلغاء'),
            ),
            if (_studentsList.isNotEmpty && _type != null)
              ElevatedButton(
                onPressed: _saveGrades,
                style: ElevatedButton.styleFrom(backgroundColor: kcolorOlive),
                child: const Text('حفظ', style: TextStyle(color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _dropdown(
    String label,
    List<String> items,
    String? value,
    Function(String?) onChanged,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Text('$label :', style: const TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(width: 10.w),
          Expanded(
            child: DropdownButton<String>(
              value: value,
              // hint: const Text('اختر'),
              isExpanded: true,
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: onChanged,
              underline: const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentsList(List<StudentModel> students) {
    return SizedBox(
      height: 250.h,
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: students.every((s) => _selected[s.id] == true),
                onChanged: (v) {
                  setState(() {
                    for (var s in students) _selected[s.id] = v ?? false;
                  });
                },
                activeColor: kcolorOlive,
              ),
              Text('الكل (${students.length})'),
              const Spacer(),
              Text('الدرجة', style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final s = students[index];
                return Row(
                  children: [
                    Checkbox(
                      value: _selected[s.id] ?? true,
                      onChanged: (v) =>
                          setState(() => _selected[s.id] = v ?? false),
                      activeColor: kcolorOlive,
                    ),

                    SizedBox(width: 10.w),
                    Expanded(child: Text(s.name)),
                    SizedBox(
                      width: 70.w,
                      height: 36.h,
                      child: TextField(
                        controller: _controllers[s.id],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        enabled: _selected[s.id] ?? true,
                        decoration: InputDecoration(
                          hintText: 'الدرجة',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _saveGrades() {
    List<GradeModel> grades = [];
    for (var s in _controllers.keys) {
      if (_selected[s] == true) {
        final text = _controllers[s]?.text.trim() ?? '';
        if (text.isNotEmpty) {
          grades.add(
            GradeModel(
              studentId: s,
              //  studentName: '',
              gradeType: _type!,
              grade: double.tryParse(text) ?? 0,
            ),
          );
        }
      }
    }

    if (grades.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            title: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.yellow.shade800,
                  size: 24.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'تنبيه',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Text(
              'الرجاء إدخال علامة للطلاب المحددين قبل الحفظ.',
              style: TextStyle(fontSize: 14.sp),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'حسناً',
                  style: TextStyle(
                    color: kcolorOlive,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      return;
    }

    context.read<GradeCubit>().saveGrades(gradeType: _type!, grades: grades);
  }
}
