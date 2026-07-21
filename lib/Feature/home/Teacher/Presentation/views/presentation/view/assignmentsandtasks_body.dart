import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/TaskList.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class assignmentschool extends StatefulWidget {
  @override
  assignments createState() => assignments();
}

class assignments extends State<assignmentschool> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 1023.35.h,
      padding: EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 20),
      //  margin: EdgeInsets.all(24),
      child: ListView(
        children: [
          Container(
            width: 358.w,
            height: 175.78.h,
            padding: EdgeInsets.only(bottom: 32, left: 24, right: 24, top: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Color(0xFFFFFFFF).withOpacity(0.7),
              boxShadow: [
                BoxShadow(
                  color: Color(0XFF071A2F).withOpacity(0.05),
                  offset: Offset(0, 3),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 96.w,
                      height: 96.h,
                      child: CircularProgressIndicator(
                        value: 0.66,
                        strokeWidth: 8.0,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF006C49),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                    Text(
                      "66%",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF006C49),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 40.w),
                Container(
                  width: 162.72.w,
                  height: 119.78.h,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            "إنجازك اليوم",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        Container(
                          //  width: 42.44.w,
                          height: 26.59.h,
                          padding: EdgeInsets.only(bottom: 0.59),
                          child: Text(
                            "لديك 4 من أصل 6 مهام ",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF74777D),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          // width: 133.08.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: SizedBox(
                              child: Text(
                                "تفاصيل التقدم",
                                style: TextSt.textstyle24.copyWith(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF006C49),
                              padding: EdgeInsets.only(
                                left: 24,
                                right: 24,
                                top: 8,
                                bottom: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(
                                  17.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            width: 358.w,
            height: 44.h,
            padding: EdgeInsets.only(right: 2, bottom: 2, top: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9999.r),
              color: Color(0xFFF0EEE8),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: isSelected
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: 170.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 175.w,
                      height: 36.h,
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9999.r),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = false;
                          });
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Text(
                            "مكتملة",
                            style: TextStyle(
                              color: isSelected
                                  ? Color(0xFF74777D)
                                  : Color(0xFF00714D),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 175.w,
                      height: 36.h,
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9999.r),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = true;
                          });
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Text(
                            "قيد التنفيذ",
                            style: TextStyle(
                              color: isSelected
                                  ? Color(0xFF00714D)
                                  : Color(0xFF74777D),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          if (isSelected) ...[
            tasklist(
              tagtext: "هام جدا",
              title: "مشروع الفيزياء: الطاقة المتجددة",
              description:
                  "تسليم عرض تقديمي مفصل عن الخلايا الشمسية وتطبيقاتها",
              datetext: "غدا,10:00 صباحا",
              subjecttext: "الفيزياء",
              onSubmit: () {},
            ),
            SizedBox(height: 25.h),
            tasklist(
              tagtext: "عادي",
              title: "تحليل نص : المتنبي",
              description:
                  "كتابة مقال تحليلي لقصيدة 'واحر قلباه' مع شرح الصور الجمالية ",
              datetext: "24 أكتوبر",
              subjecttext: "اللغة العربية",
              onSubmit: () {},
            ),
            SizedBox(height: 25.h),
            tasklist(
              tagtext: "عادي",
              title: "تمارين الرياضيات : الهندسة",
              datetext: "25 أكتوبر",
              subjecttext: "الرياضيات",
              onSubmit: () {},
            ),
          ] else ...[
            SizedBox(
              height: 200.h,
              child: Center(
                child: Text(
                  "لا يوجد مهام مكتملة حاليا",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFF74777D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
