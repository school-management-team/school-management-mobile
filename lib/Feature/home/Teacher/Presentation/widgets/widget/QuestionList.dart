import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/questionbankcubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/QuestionModel.dart';
import 'package:school/constant.dart';

void showAddQuestionDialog(BuildContext context) {
  final TextEditingController quescontrol = TextEditingController();
  final TextEditingController titlecontrol = TextEditingController();
  final TextEditingController categorycontrol = TextEditingController();
  final TextEditingController difficultcontrol = TextEditingController();
  final TextEditingController optioncont = TextEditingController();

  final questionCubit = context.read<QuestionCubit>();

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (dialogcontext) {
      return BlocProvider.value(
        value: questionCubit,
        child: StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: 6,
              backgroundColor: const Color(0xFFFFFFFF),
              content: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: quescontrol,
                        decoration: InputDecoration(
                          labelText: "ادخل نص السؤال",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextField(
                        controller: titlecontrol,
                        decoration: InputDecoration(
                          labelText: "المادة",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextField(
                        controller: difficultcontrol,
                        decoration: InputDecoration(
                          labelText: "مستوى السؤال (سهل_متوسط_صعب)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextField(
                        controller: categorycontrol,
                        decoration: InputDecoration(
                          labelText: "نوع السؤال",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextField(
                        controller: optioncont,
                        decoration: InputDecoration(
                          labelText: "الخيارات (إن وجد)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF006C49),
                        ),
                        onPressed: () {
                          if (quescontrol.text.isNotEmpty) {
                            List<String>? options;
                            if (optioncont.text.isNotEmpty) {
                              options = optioncont.text
                                  .split(',')
                                  .map((e) => e.trim())
                                  .where((e) => e.isNotEmpty)
                                  .toList();
                            }
                            final question = QuestionModel(
                              id: DateTime.now().millisecondsSinceEpoch
                                  .toString(),
                              creataAt: DateTime.now(),
                              difficulty: difficultcontrol.text.isNotEmpty
                                  ? difficultcontrol.text
                                  : 'متوسط',
                              questionText: quescontrol.text,
                              subject: titlecontrol.text,
                              typequestion: categorycontrol.text.isNotEmpty
                                  ? categorycontrol.text
                                  : 'مقالي',
                            );

                            questionCubit.addquestion(question);
                            Navigator.pop(dialogcontext);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: kcolorOlive,
                                content: Text(
                                  "تمت إضافة السؤال بنجاح ",
                                  style: TextStyle(color: Color(0xFFFFFFFF)),
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "إضافة للقائمة",
                          style: TextStyle(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF006C49),
                        ),
                        onPressed: () {
                          Navigator.pop(dialogcontext);
                        },
                        child: const Text(
                          "إلغاء",
                          style: TextStyle(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    },
  );
}

class QuestionList extends StatefulWidget {
  const QuestionList({super.key});

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  int visibility = 3;

  Color getcolor(String difficulty) {
    switch (difficulty) {
      case 'سهل':
        return const Color(0xFF4CAF50);
      case 'متوسط':
        return const Color(0xFF4CAF50);
      case 'صعب':
        return const Color(0xFF4CAF50);
      default:
        return const Color(0xFF44474D);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionBankstate>(
      builder: (context, state) {
        if (state is QuestionLoading) {
          return SizedBox(
            height: 100.h,
            child: const Center(
              child: CircularProgressIndicator(color: Color(0xFF006C49)),
            ),
          );
        }
        if (state is QuestionError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (state is QuestionLoaded) {
          final questions = state.questions;
          final display = questions.take(visibility).toList();
          final showAll = visibility >= questions.length;
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: 342.w,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: const Color(0xFF000000).withOpacity(0.05),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF071A2F).withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "أحدث الأسئلة",
                        style: TextStyle(
                          color: const Color(0xFF000000),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            visibility = showAll ? 3 : questions.length;
                          });
                        },
                        child: Text(
                          showAll ? "عرض أقل" : "عرض الكل",
                          style: TextStyle(
                            color: const Color(0xFF006C49),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: display.length,
                    itemBuilder: (ctx, index) {
                      final q = display[index];
                      final Color difficultcolor = getcolor(q.difficulty);

                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCF9F3),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: const Color(0xFF000000).withOpacity(0.05),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Wrap(
                                    spacing: 8.w,
                                    runSpacing: 8.h,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEBE8E2),
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                        ),
                                        child: Text(
                                          q.subject,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: const Color(0xFF44474D),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEBE8E2),
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                        ),
                                        child: Text(
                                          q.difficulty,
                                          style: TextStyle(
                                            color: difficultcolor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEBE8E2),
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                        ),
                                        child: Text(
                                          q.typequestion,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: const Color(0xFF44474D),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<QuestionCubit>()
                                        .toggleBookMark(q.id);
                                  },
                                  child: Icon(
                                    q.isBookMarked
                                        ? Icons.bookmark
                                        : Icons.bookmark_border_outlined,
                                    color: q.isBookMarked
                                        ? const Color(0xFFB87500)
                                        : const Color(0xFF000000),
                                    size: 22,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              q.questionText,
                              style: TextStyle(
                                color: const Color(0xFF1C1C18),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 24.h,
                                  child: Text(
                                    "تمت الإضافة : ${q.creataAt.day}/${q.creataAt.month}/${q.creataAt.year}",
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.remove_red_eye_outlined,
                                        size: 15,
                                        color: Color(0xFF74777D),
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '${q.usage} استخدام',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: const Color(0xFF74777D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  if (!showAll && display.isNotEmpty)
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          visibility += 2;
                          if (visibility > questions.length) {
                            visibility = questions.length;
                          }
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFC4C6CD)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w,
                        ),
                      ),
                      child: const Text(
                        "تحميل المزيد",
                        style: TextStyle(color: Color(0xFF44474D)),
                      ),
                    ),
                ],
              ),
            ),
          );
        }
        return SizedBox(
          height: 100.h,
          child: const Center(
            child: Text(
              'جاري تحميل الأسئلة...',
              style: TextStyle(color: Color(0xFF74777D)),
            ),
          ),
        );
      },
    );
  }
}
