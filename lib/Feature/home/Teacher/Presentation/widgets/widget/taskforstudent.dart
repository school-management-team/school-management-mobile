import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class taskforstudent extends StatelessWidget {
  final String classname;
  final String subjectname;
  final int studentcount;
  final String typeoftask;
  final Widget iconwidget;
  final Color iconbackgroundColor;
  final Color iconcolor;
  final VoidCallback onPublishtask;
  final VoidCallback onGraderecording;
  const taskforstudent({
    Key? key,
    required this.classname,
    required this.subjectname,
    required this.studentcount,
    required this.typeoftask,
    required this.iconwidget,
    required this.iconbackgroundColor,
    required this.iconcolor,
    required this.onPublishtask,
    required this.onGraderecording,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 342.w,
        // height: 250.59.h,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Color(0xFFFFFFFF),
          border: Border.all(
            color: Color(0xFFC4C6CD).withOpacity(0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF071A2F).withOpacity(0.05),
              offset: Offset(0, 4),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: iconbackgroundColor,
                  ),
                  child: IconTheme(
                    data: IconThemeData(color: iconcolor, size: 20),
                    child: iconwidget,
                  ),
                ),
                SizedBox(width: 20.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$classname-$subjectname',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C1C18),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$studentcount طالب -$typeoftask',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF44474D),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onPublishtask,
                    icon: Icon(Icons.grading, color: Color(0xFF000000)),
                    label: Text(
                      "رصد درجات ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF000000),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                  ),
                ),
                SizedBox(width: 13.w),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onPublishtask,
                    icon: Icon(Icons.add_task, color: Color(0XFFFFFFFF)),
                    label: Text(
                      "نشر المهمة",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF006C49),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
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
}
