import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/questionbankcubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/QuestionModel.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';

class quickadd extends StatefulWidget {
  const quickadd({super.key});
  @override
  State<quickadd> createState() => quickaddstate();
}

class quickaddstate extends State<quickadd> {
  final questionController = TextEditingController();
  final option1cont = TextEditingController();
  final option2cont = TextEditingController();
  final option3cont = TextEditingController();
  final option4cont = TextEditingController();

  void _addQuestionToBank({
    required String questionText,
    required String subject,
    required String difficulty,
    required String type,
    List<String>? options,
  }) {
    if (questionText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(' الرجاء إدخال نص السؤال'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final question = QuestionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      questionText: questionText,
      subject: subject.isEmpty ? 'عام' : subject,
      difficulty: difficulty.isEmpty ? 'متوسط' : difficulty,
      typequestion: type,
      options: options,
      creataAt: DateTime.now(),
      isBookMarked: false,
      usage: 0,
    );

    context.read<QuestionCubit>().addquestion(question);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(' تم إضافة السؤال بنجاح'),
        backgroundColor: kcolorOlive,
      ),
    );
  }

  final List<QuestionModel> addedques = [];
  void _showAddQuestionDialog(String type) {
    questionController.clear();
    option1cont.clear();

    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: Color(0xFFFCF9F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            title: Text('إضافة سؤال ${type == 'مقالي' ? 'مقالي' : 'صح/خطأ'}'),
            content: Container(
              width: 300.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: questionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "اكتب نص السؤال هنا",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextField(
                    controller: option1cont,
                    decoration: InputDecoration(
                      hintText: "المادة (اختياري)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kcolorOlive),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "إلغاء",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kcolorOlive),
                onPressed: () {
                  final questionText = questionController.text.trim();
                  final subject = option1cont.text.trim();

                  if (questionText.isNotEmpty) {
                    _addQuestionToBank(
                      questionText: questionText,
                      subject: subject.isEmpty ? '' : subject,
                      difficulty: 'متوسط',
                      type: type,
                      options: type == 'صح/خطأ' ? ['صحيح', 'خطأ'] : null,
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(' الرجاء إدخال نص السؤال'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text(
                  'إضافة',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showChoicesDialog() {
    questionController.clear();
    option1cont.clear();
    option2cont.clear();
    option3cont.clear();
    option4cont.clear();

    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: Color(0xFFFCF9F3),
            title: Text("إضافة سؤال اختر من متعدد"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: questionController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF44474D)),
                      ),
                      labelText: 'نص السؤال *',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildOptionField(option1cont, 'الخيار الأول *'),
                  SizedBox(height: 10.h),
                  _buildOptionField(option2cont, 'الخيار الثاني *'),
                  SizedBox(height: 10.h),
                  _buildOptionField(option3cont, 'الخيار الثالث'),
                  SizedBox(height: 10.h),
                  _buildOptionField(option4cont, 'الخيار الرابع'),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kcolorOlive),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'الغاء',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kcolorOlive),
                onPressed: () {
                  final questionText = questionController.text.trim();

                  if (questionText.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(' الرجاء إدخال نص السؤال'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  final options = [
                    option1cont.text.trim(),
                    option2cont.text.trim(),
                    option3cont.text.trim(),
                    option4cont.text.trim(),
                  ].where((o) => o.isNotEmpty).toList();

                  if (options.length < 2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('الرجاء إدخال خيارين على الأقل'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  _addQuestionToBank(
                    questionText: questionText,
                    subject: 'عام',
                    difficulty: 'متوسط',
                    type: 'خيارات متعددة',
                    options: options,
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  'حفظ السؤال',
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 342.w,
        height: 292.h,
        padding: EdgeInsets.only(bottom: 24, left: 24, right: 24, top: 23),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF006C49).withOpacity(0.05),
              Color(0XFF006C49).withOpacity(0.0),
            ],
          ),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Color(0xFF000000).withOpacity(0.05),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF071A2F).withOpacity(0.05),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "إضافة سريعة",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
            SizedBox(height: 7.h),
            Text(
              "اختر نوع السؤال للبدء الفوري",
              style: TextStyle(
                color: Color(0xFF44474D),
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 15.h),
            CustomScrollView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final items = [
                      {
                        'title': 'خيارات متعددة',
                        'icon': Icons.format_list_bulleted,
                      },
                      {'title': 'صح / خطأ', 'icon': Icons.check_circle_outline},
                    ];
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          _showChoicesDialog();
                        } else {
                          _showAddQuestionDialog('صح / خطأ');
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Color(0xFFFCF9F3),

                          border: Border.all(
                            color: Color(0xFF000000).withOpacity(0.1),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 18.w,
                              height: 14.h,
                              child: Icon(
                                items[index]['icon'] as IconData,
                                color: Color(0xFF74777D),
                                size: 20.r,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              width: 73.23.w,
                              height: 19.h,
                              child: Text(
                                items[index]['title'] as String,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF000000),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, childCount: 2),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.h,
                    mainAxisExtent: 66.h,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 12.h)),
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {
                      _showAddQuestionDialog('مقالي');
                    },
                    child: Container(
                      width: 292.w,
                      height: 66.h,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Color(0xFFFCF9F3),

                        border: Border.all(
                          color: Color(0xFF000000).withOpacity(0.1),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 18.w,
                            height: 14.h,
                            padding: EdgeInsets.only(bottom: 4),
                            child: Icon(
                              Icons.edit_note,
                              color: Color(0xFF74777D),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 73.23.w,
                            height: 16.h,
                            child: Text(
                              "سؤال مقالي",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF44474D)),
        ),
        labelText: label,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF44474D)),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}
