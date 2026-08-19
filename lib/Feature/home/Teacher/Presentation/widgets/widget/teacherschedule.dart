import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/schedulecubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/dataschedule_model.dart';

class infoschedule extends StatelessWidget {
  final List<dataSchedule> items;
  const infoschedule({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 75.w,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 25,
                        bottom: 0,
                        child: Container(width: 1, color: Colors.grey.shade300),
                      ),
                      Column(
                        children: [
                          Text(
                            item.startTime.length >= 5
                                ? item.startTime.substring(0, 5)
                                : item.startTime,
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.status == 'current'
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color: const Color(0xFF006C49),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(child: buildcard(context, item)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildcard(BuildContext context, dataSchedule item) {
    final bool isCurrent = item.status == 'current';
    switch (item.type) {
      case 'class':
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),

            color: isCurrent
                ? const Color(0xFF006C49).withOpacity(0.05)
                : Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.more_vert),
                    SizedBox(width: 30.w),
                    SizedBox(width: 8.w),
                    Text("الحصة ${item.periodNumber}"),
                    SizedBox(width: 13.w),
                    if (item.status == 'complete' ||
                        item.status == 'completed') ...[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF44474D).withOpacity(0.09),
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: const Text("مكتمل"),
                      ),
                    ],
                    if (item.status == 'current') ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(),
                        child: const Text("الآن"),
                      ),
                    ],
                    if (item.status == 'upcoming') ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF44474D).withOpacity(0.09),
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: const Text("قادمة"),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text(
                      item.subjectName ?? " ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color:
                            (item.status == 'complete' ||
                                item.status == 'completed')
                            ? Colors.grey
                            : const Color(0xFF1C1C18),
                        decoration:
                            (item.status == 'complete' ||
                                item.status == 'completed')
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 87.72.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          item.className ?? " ",
                          softWrap: true,
                          maxLines: 3,
                          style: TextStyle(
                            color: const Color(0xFF1C1C18),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      const Icon(Icons.people_alt_outlined, size: 20),
                      SizedBox(width: 7.w),
                      Flexible(
                        child: Text(
                          "قاعات الطابق الأرضي",
                          softWrap: true,
                          maxLines: 3,
                          style: TextStyle(
                            color: const Color(0xFF1C1C18),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.meeting_room_outlined, size: 20),
                    ],
                  ),
                ),
                SizedBox(height: 9.h),
                if (item.status == 'current') ...[
                  OutlinedButton.icon(
                    onPressed: () {
                      AddLessonPlanDialog(
                        context,
                        scheduleId: item.id,
                        subjectName: item.subjectName ?? 'المادة',
                      );
                    },
                    label: const Text("خطة الدرس"),
                    icon: const Icon(Icons.menu_book_outlined),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300),
                      foregroundColor: Colors.black87,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );

      case 'break':
        return Container(
          width: 270.w,
          height: 62.h,
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
            borderRadius: BorderRadius.circular(8.r),
            /* boxShadow: [
              BoxShadow(
                color: const Color(0xFF071A2F).withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],*/
          ),
          child: Row(
            children: [
              const Icon(Icons.coffee, color: Color(0xFF1C1C18), size: 17),
              SizedBox(width: 9.w),
              Text(
                'استراحة',
                style: TextStyle(
                  color: const Color(0xFF1C1C18),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        );

      case 'free':
      case 'free_period':
        return Container(
          width: 278.w,
          height: 90.h,
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
            borderRadius: BorderRadius.circular(8.r),
            /*  boxShadow: [
              BoxShadow(
                color: const Color(0xFF071A2F).withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],*/
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'حصة فراغ (تخطيط)',
                    style: TextStyle(
                      color: const Color(0xFF1C1C18),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'مكتب المعلمين',
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(width: 40.w),
              const Icon(Icons.free_breakfast_outlined, size: 30),
            ],
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  void AddLessonPlanDialog(
    BuildContext context, {
    required String scheduleId,
    required String subjectName,
  }) {
    final TextEditingController planController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: const Color(0xFFFCF9F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            title: Text(
              'إضافة خطة درس - $subjectName',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              width: 300.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: planController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "اكتب تفاصيل خطة الدرس هنا...",
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006C49),
                ),
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text(
                  "إلغاء",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006C49),
                ),
                onPressed: () {
                  final planText = planController.text.trim();

                  if (planText.isNotEmpty) {
                    context.read<TeacherScheduleCubit>().submitLessonPlan(
                      schedduleId: scheduleId,
                      lessonplan: subjectName,
                    );

                    Navigator.pop(dialogContext);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم إرسال خطة الدرس بنجاح'),
                        backgroundColor: Color(0xFF006C49),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('الرجاء إدخال تفاصيل خطة الدرس'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text(
                  'إرسال',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
