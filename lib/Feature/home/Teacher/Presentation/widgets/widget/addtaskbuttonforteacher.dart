import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/taskteachercubit.dart';
import 'package:bloc/bloc.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/assignmentsandtasks_View.dart';
import 'package:school/constant.dart';

class AddTaskteacherbutton extends StatelessWidget {
  const AddTaskteacherbutton({super.key});
  void showaddtaskdialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String title = '';
    String description = '';
    String importance = '';
    String subject = '';
    String date = '';
    showDialog(
      context: context,
      builder: (BuildContext dialogcontext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: Color(0xFFFFFFFF),
            title: Text('أضف مهمتك الجديدة هنا '),
            content: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'عنوان المهمة',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'الرجاء إدخال العنوان' : null,
                      onSaved: (newValue) => title = newValue!,
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'شرح المهمة (اختياري)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      onSaved: (newValue) => description = newValue!,
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'اسم المادة ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      onSaved: (newValue) => subject = newValue!,
                    ),
                    SizedBox(height: 10.h),
                    DropdownButtonFormField(
                      hint: Text('درجة أهمية السؤال'),
                      borderRadius: BorderRadius.circular(19.r),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      items: ['هام', "متوسط", "عادي"].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) => importance = value!,
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'تاريخ التسليم',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'الرجاء إدخال تاريخ التسليم' : null,
                      onSaved: (newValue) => date = newValue!,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kcolorOlive),
                onPressed: () {
                  Navigator.pop(dialogcontext);
                },
                child: Text(
                  'إلغاء',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kcolorOlive),

                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    final taskCubit = context.read<TaskCubit>();
                    taskCubit.addTask({
                      'tagtext': importance,
                      'title': title,
                      'description': description,
                      'datetext': date,
                      'subjecttext': subject,
                    });
                    if (context.mounted) {
                      Navigator.pop(dialogcontext);

                      ///context.pushNamed('assignmentscool');

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("تمت إضافة المهمة بنجاح")),
                      );
                    }
                  }
                },
                child: Text(
                  "إضافة",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showaddtaskdialog(context),
      backgroundColor: Color(0xFF006C49),
      shape: CircleBorder(),
      child: Icon(Icons.add, color: Color(0xFFFFFFFF)),
    );
  }
}
