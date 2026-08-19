import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/classesandactivitycubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/taskteachercubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/tasktostudcubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/grade_model.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/addnewtask_teacher_body.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/addnewtask_teacher_view.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/recentactivities.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/taskforstudent.dart';
import 'package:school/constant.dart';

class taskandgrade extends StatefulWidget {
  //final TaskCubit taskCubit;
  const taskandgrade({super.key /*required this.taskCubit*/});
  @override
  State<taskandgrade> createState() => taskandgradestate();
}

class taskandgradestate extends State<taskandgrade> {
  @override
  void initState() {
    super.initState();
    context.read<ClassCubit>().fetchData();
  }

  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 937.01.h,
      padding: EdgeInsets.only(bottom: 24.48, left: 18, right: 15, top: 30),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            Container(
              width: 342.w,
              //height: 140.19.h,
              padding: EdgeInsets.only(bottom: 1.21),
              child: Text(
                "رصد الدرجات والمهام",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 44.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),

            //............................................
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.only(bottom: 0.59),
              child: Text(
                "الفصول الدراسية",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Color(0xFF1C1C18),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            //...............................................
            SizedBox(height: 10.h),
            BlocBuilder<ClassCubit, Classstate>(
              builder: (context, state) {
                if (state is ClassLoading) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: CircularProgressIndicator(
                        color: Color(0xFF006C49),
                      ),
                    ),
                  );
                } else if (state is ClassLoaded) {
                  if (state.classes.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Text('لا توجد فصول دراسية'),
                      ),
                    );
                  }
                  return Column(
                    children: state.classes.map((classData) {
                      return Column(
                        children: [
                          taskforstudent(
                            classname: classData.classname,
                            subjectname: classData.subjectname,
                            studentcount: classData.studentcount,
                            typeoftask: classData.typeoftask,
                            iconwidget: Icon(classData.iconData),
                            iconbackgroundColor: classData.iconBackgroundColor,
                            iconcolor: classData.iconColor,
                            onPublishtask: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) => NewTaskCubit(),
                                    child: addnewtaskteacherview(),
                                  ),
                                ),
                              );
                              // context.push('/addnewtaskteacherview');
                            },
                            onGraderecording: () {
                              globalClassesCubit.fetchStudentsBySectionId(
                                classData.id,
                              );
                              showTaskGradeDialog(
                                context: context,
                                sectionId: classData.id,
                                className: classData.classname,
                                subjectName: classData.subjectname,
                              );
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  );
                } else if (state is ClassError) {
                  return Center(child: Text(state.message));
                }
                return SizedBox.shrink();
              },
            ),
            SizedBox(height: 40.h),
            BlocBuilder<ClassCubit, Classstate>(
              builder: (context, state) {
                if (state is ClassLoading) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: CircularProgressIndicator(
                        color: Color(0xFF006C49),
                      ),
                    ),
                  );
                } else if (state is ClassLoaded) {
                  if (state.activities.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Text('لا يوجد نشاطات حاليا '),
                      ),
                    );
                  }
                  final List<dataofactivity> activitiesData = state.activities
                      .map((activity) {
                        return dataofactivity(
                          title: activity.title,
                          subtitle: activity.subtitle,
                          updatetext: activity.updatetext ?? '',
                          iscompleted: activity.isCompleted,
                        );
                      })
                      .toList();
                  return Activity(items: activitiesData);
                } else if (state is ClassError) {
                  return SizedBox.shrink();
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showTaskGradeDialog({
  required BuildContext context,
  required String sectionId,
  required String className,
  required String subjectName,
}) {
  String? selectedType;
  List<StudentModel> studentsList = [];
  final Map<String, TextEditingController> controllers = {};
  final Map<String, bool> selected = {};

  showDialog(
    context: context,
    builder: (dialogContext) {
      return BlocProvider.value(
        value: globalClassesCubit,
        child: StatefulBuilder(
          builder: (context, setState) {
            return BlocListener<ClassCubit, Classstate>(
              listener: (context, state) {
                if (state is SectionStudentLoaded) {
                  for (var s in state.students) {
                    controllers[s.id] ??= TextEditingController();
                    selected[s.id] ??= true;
                  }
                  setState(() => studentsList = state.students);
                } else if (state is GradeSavedSuccess) {
                  Navigator.pop(dialogContext);
                  showSuccessDialog(context, state.message);
                  globalClassesCubit.fetchData();
                } else if (state is GradeSavedError) {
                  _showErrorAlert(context, state.message);
                }
              },
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 8.w),
                          Text(
                            'رصد الدرجات',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: kcolorOlive.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          '$className ($subjectName)',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: kcolorOlive,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                'نوع العلامة : ',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: selectedType,
                                  //  hint: const Text('اختر'),
                                  isExpanded: true,
                                  items: ['مذاكرة', 'امتحان', 'مشاركة']
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (v) =>
                                      setState(() => selectedType = v),
                                  underline: const SizedBox(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),

                        BlocBuilder<ClassCubit, Classstate>(
                          builder: (context, state) {
                            if (state is SectionStudentLoading) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 30.h),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: kcolorOlive,
                                  ),
                                ),
                              );
                            }
                            if (selectedType != null &&
                                studentsList.isNotEmpty) {
                              return SizedBox(
                                height: 250.h,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: studentsList.every(
                                            (s) => selected[s.id] == true,
                                          ),
                                          onChanged: (v) {
                                            setState(() {
                                              for (var s in studentsList)
                                                selected[s.id] = v ?? false;
                                            });
                                          },
                                          activeColor: kcolorOlive,
                                        ),
                                        Text('الكل (${studentsList.length})'),
                                        const Spacer(),
                                        Text(
                                          'الدرجة',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: studentsList.length,
                                        itemBuilder: (context, index) {
                                          final s = studentsList[index];
                                          return Row(
                                            children: [
                                              Checkbox(
                                                value: selected[s.id] ?? true,
                                                onChanged: (v) => setState(
                                                  () => selected[s.id] =
                                                      v ?? false,
                                                ),
                                                activeColor: kcolorOlive,
                                              ),

                                              SizedBox(width: 10.w),
                                              Expanded(child: Text(s.name)),
                                              SizedBox(
                                                width: 70.w,
                                                height: 36.h,
                                                child: TextField(
                                                  controller: controllers[s.id],
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textAlign: TextAlign.center,
                                                  enabled:
                                                      selected[s.id] ?? true,
                                                  decoration: InputDecoration(
                                                    hintText: 'الدرجة',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.r,
                                                          ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 4.w,
                                                        ),
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
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text(
                                'اختر نوع التقييم لإظهار قائمة الطلاب',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        globalClassesCubit.fetchData();
                      },
                      child: const Text('إلغاء'),
                    ),
                    if (studentsList.isNotEmpty && selectedType != null)
                      ElevatedButton(
                        onPressed: () {
                          List<GradeModel> grades = [];
                          for (var sId in controllers.keys) {
                            if (selected[sId] == true) {
                              final text = controllers[sId]?.text.trim() ?? '';
                              if (text.isNotEmpty) {
                                grades.add(
                                  GradeModel(
                                    studentId: sId,
                                    grade: double.tryParse(text) ?? 0,
                                    gradeType: selectedType!,
                                  ),
                                );
                              }
                            }
                          }

                          if (grades.isEmpty) {
                            _showErrorAlert(
                              context,
                              'يرجى إدخال علامة للطلاب المحددين قبل الحفظ.',
                            );
                            return;
                          }

                          globalClassesCubit.saveSectionGrades(
                            sectionId: sectionId,
                            gradeType: selectedType!,
                            grades: grades,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kcolorOlive,
                        ),
                        child: const Text(
                          'حفظ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

void _showErrorAlert(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogCtx) {
      Future.delayed(const Duration(seconds: 3), () {
        if (dialogCtx.mounted && Navigator.canPop(dialogCtx)) {
          Navigator.pop(dialogCtx);
        }
      });

      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Icon(Icons.close, color: Colors.red, size: 60.sp),
              ),
              SizedBox(height: 16.h),
              Text(
                'عذرا, عليك إضافة علامة أولا ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      );
    },
  );
}

void showSuccessDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogCtx) {
      Future.delayed(const Duration(seconds: 3), () {
        if (dialogCtx.mounted && Navigator.canPop(dialogCtx)) {
          Navigator.pop(dialogCtx);
        }
      });

      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Icon(
                  Icons.check_circle_rounded,
                  color: kcolorOlive,
                  size: 60.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'تمت إضافة العلامة بنجاح!',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      );
    },
  );
}
