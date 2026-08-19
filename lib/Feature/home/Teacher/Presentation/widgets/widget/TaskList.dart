import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class tasklist extends StatelessWidget {
  final String tagtext;
  final String title;
  final String? description;
  final String datetext;
  final String subjecttext;
  final VoidCallback onSubmit;
  final bool iscompleted;
  const tasklist({
    Key? key,
    required this.tagtext,
    required this.title,
    this.description,
    required this.datetext,
    required this.subjecttext,
    required this.onSubmit,
    this.iscompleted = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 358.w,
        //height: 254.6.h,
        //margin: EdgeInsets.all(10.8),
        padding: EdgeInsets.all(16.r),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: tagtext == 'هام'
                              ? Color(0xFFFFFEBEE)
                              : tagtext == 'متوسط'
                              ? Color(0xFFFFF3E0)
                              : Color(0XFFF5F5F5),
                        ),
                        child: Text(
                          tagtext,
                          style: TextStyle(
                            color: Color(0xFF00714D),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        title,
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w500,
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert),
              ],
            ),
            SizedBox(height: 12.h),
            if (description != null)
              Text(
                description!,
                style: TextStyle(
                  color: Color(0xFF44474D),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    SizedBox(width: 4.w),
                    Text(
                      datetext,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF74777D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.book_outlined),
                    SizedBox(width: 4.w),
                    Text(
                      subjecttext,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF74777D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (!iscompleted) ...[
                  SizedBox(
                    child: ElevatedButton.icon(
                      onPressed: onSubmit,
                      label: Text(
                        "تسليم",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14.sp,
                        ),
                      ),
                      icon: Icon(
                        Icons.file_upload_outlined,
                        color: Color(0xFFFFFFFF),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF006C49),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ] else ...[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Color(0xFF006C49), width: 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Color(0xFF006C49),
                          size: 16.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "تم الإنجاز",
                          style: TextStyle(
                            color: Color(0xFF006C49),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
