import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class containerStudySchedule extends StatelessWidget {
  const containerStudySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.sp,
      width: 520.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: KcolorGrey.withOpacity(0.2)),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(Icons.timer_outlined, color: kcolorOlive),
                Spacer(),
                Text("الجدول الدراسي اليوم", style: TextSt.textstyle24),
                Text(
                  "عرض الكل",
                  style: TextSt.textstyle14.copyWith(color: kcolorOlive),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            SimpleSchedule(),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class SimpleSchedule extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  SimpleScheduleState createState() => SimpleScheduleState();
}

class SimpleScheduleState extends State<SimpleSchedule> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        buildStep(0, "الرياضيات المتقدمة", "أ. خالد عبدالله", "08:00 - 08:45"),
        buildStep(1, "العلوم الطبيعية", "أ. نورة سعد", "09:00 - 09:45"),
        buildStep(2, "اللغة الإنجليزية", "أ. سارة جونز", "10:00 - 10:45"),
      ],
    );
  }

  Widget buildStep(int index, String title, String subtitle, String time) {
    bool isSelected = selectedIndex == index;

    return IntrinsicHeight(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Column(
              children: [
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  size: 20.sp,
                  color: isSelected ? kcolorOlive : Colors.grey[300],
                ),
                Expanded(child: Container(width: 2, color: Colors.grey[200])),
              ],
            ),
            SizedBox(width: 12.w),

            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: Container(
                  margin:  EdgeInsets.only(bottom: 20.w),
                  padding:  EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? kcolorOlive.withOpacity(0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? kcolorOlive : Colors.white,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? kcolorOlive : Colors.grey[100],
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          time,
                          style: TextSt.textstyle12.copyWith(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: isSelected
                                ? TextSt.textstyle16
                                : TextSt.textstyle17,
                          ),
                          Text(
                            subtitle,
                            style: TextSt.textstyle14.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
