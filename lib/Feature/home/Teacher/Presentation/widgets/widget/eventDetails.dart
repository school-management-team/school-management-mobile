import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/calendarmodel.dart';

class EventDetailsPage extends StatelessWidget {
  final ActivitiesModel event;

  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          toolbarHeight: 64.h,
          backgroundColor: Color(0xFFFFFFFF),
          shadowColor: Colors.black.withOpacity(0.4),
          elevation: 0.7,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1C1C18)),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'تفاصيل الإعلان',
            style: TextStyle(
              color: const Color(0xFF000000),
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 240.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: (event.imageUrl != null && event.imageUrl!.isNotEmpty)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.network(
                          event.imageUrl!,
                          width: double.infinity,
                          height: 240.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              SizedBox.shrink(),
                        ),
                      )
                    : null,
              ),
              SizedBox(height: 30.h),

              Row(
                children: [
                  Icon(Icons.access_time, size: 20),
                  SizedBox(width: 8.w),
                  Text(
                    event.time,
                    style: TextStyle(
                      color: const Color(0xFF006C49),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),

              Text(
                event.title,
                style: TextStyle(
                  color: const Color(0xFF1C1C18),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),

              Text(
                event.description,
                style: TextStyle(
                  color: const Color(0xFF44474D),
                  fontSize: 16.sp,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
