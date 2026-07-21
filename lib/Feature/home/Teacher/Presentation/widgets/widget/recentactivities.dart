import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class dataofactivity {
  final String title;
  final String subtitle;
  final String? updatetext;
  final bool iscompleted;
  const dataofactivity({
    Key? key,
    required this.title,
    required this.subtitle,
    this.updatetext,
    this.iscompleted = false,
  });
}

class Activity extends StatelessWidget {
  final List<dataofactivity> items;
  const Activity({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 358.w,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Color(0xFFFFFFFF),
          border: Border.all(color: Color(0xFFC4C6CD).withOpacity(0.1)),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Row(
                children: [
                  const Icon(Icons.history, color: Color(0xFF006C49)),
                  const SizedBox(width: 8),
                  const Text(
                    "النشاط الأخير",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1C1C18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isActivity = index == items.length - 1;
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15.sp,
                            color: item.iscompleted
                                ? Color(0xFF006C49)
                                : Color(0xFFC4C6CD),
                          ),
                          if (!isActivity)
                            Expanded(
                              child: Container(
                                width: 1.5.w,
                                color: const Color(0xFFC4C6CD).withOpacity(0.5),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Color(0xFF1C1C18),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              item.subtitle,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF44474D),
                              ),
                            ),
                            if (item.updatetext != null) ...[
                              SizedBox(height: 8.h),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAF6F0),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  item.updatetext!,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF1C1C18),
                                  ),
                                ),
                              ),
                            ],
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
