import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/calendarmodel.dart';

class Eventsstate extends StatelessWidget {
  final List<EventModel> events;

  const Eventsstate({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 358.w,
        padding: const EdgeInsets.only(
          bottom: 24,
          left: 24,
          right: 24,
          top: 23,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(color: const Color(0xFFC4C6CD).withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF071A2F).withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "الفعاليات القادمة",
              style: TextStyle(
                color: const Color(0xFF000000),
                fontSize: 25.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 8.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Container(
                        width: 50.w,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: event.background.withOpacity(0.1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              event.month,
                              style: TextStyle(
                                color: event.background,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              event.day,
                              style: TextStyle(
                                color: event.background,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              event.subtitle,
                              style: const TextStyle(color: Color(0xFF44474D)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 7.h),
            Container(
              height: 38.h,
              width: 308.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFC4C6CD).withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text("عرض كل الفعاليات"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
