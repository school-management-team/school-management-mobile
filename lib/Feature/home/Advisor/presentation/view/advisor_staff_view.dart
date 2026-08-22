import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/bottom_navigation_advisor.dart';

class AdvisorStaffView extends StatelessWidget {
  const AdvisorStaffView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFCF9F3),
        appBar: AppBar(
          elevation: 0.5,
       
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: const AssetImage(AssestData.profile),
              ),
              SizedBox(width: 10.w),
              Text(
                "الموجه التربوي",
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavigationAdvisor(select: 2),
        body: const SafeArea(
          child: AdvisorStaffBodyView(),
        ),
      ),
    );
  }
}

class AdvisorStaffBodyView extends StatelessWidget {
  const AdvisorStaffBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "إدارة الكادر",
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF091C31),
                    ),
                  ),
                  Text(
                    "الثلاثاء، 24 أكتوبر 2023",
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 13.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00714D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                icon: const Icon(Icons.add, color: Colors.white),
                label: Text(
                  "إضافة",
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Attendance Summary Cards
          Row(
            children: [
              // Big Present Card
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.person_outline, color: const Color(0xFF00714D), size: 24.sp),
                          Text(
                            "حاضر",
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "42",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 34.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF091C31),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "95%",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 13.sp,
                          color: const Color(0xFF10B981),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              // Absent & Leave Column
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    // Absent
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.sensors_off_rounded, color: const Color(0xFFBA1A1A), size: 18.sp),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("غائب", style: TextStyle(fontFamily: 'Tajawal', fontSize: 12.sp, color: Colors.grey[600])),
                              Text("3", style: TextStyle(fontFamily: 'Tajawal', fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFFBA1A1A))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Leave
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.work_off_outlined, color: const Color(0xFFB87500), size: 18.sp),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("إجازة", style: TextStyle(fontFamily: 'Tajawal', fontSize: 12.sp, color: Colors.grey[600])),
                              Text("2", style: TextStyle(fontFamily: 'Tajawal', fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFFB87500))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Daily Attendance Record Header & Search
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "سجل الحضور اليومي",
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1C1C18),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.filter_alt_outlined, size: 18.sp, color: const Color(0xFF00714D)),
                  SizedBox(width: 4.w),
                  Text(
                    "تصفية",
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 13.sp,
                      color: const Color(0xFF00714D),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Search Field
          TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: "البحث عن معلم...",
              hintStyle: TextStyle(fontFamily: 'Tajawal', fontSize: 14.sp, color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFF6F3ED),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Teacher Card 1: Absent Needs Substitute (Red Border)
          Container(
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: const Color(0xFFBA1A1A), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFDAD6),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        "غائب",
                        style: TextStyle(fontFamily: 'Tajawal', fontSize: 12.sp, color: const Color(0xFFBA1A1A), fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "أحمد محمود",
                          style: TextStyle(fontFamily: 'Tajawal', fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "رياضيات - ثانوي",
                          style: TextStyle(fontFamily: 'Tajawal', fontSize: 12.sp, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.grey.shade200,
                      child: const Text("أ.م"),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDAD6).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.warning_amber_rounded, color: Color(0xFFBA1A1A), size: 18),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          "3 حصص غير مغطاة اليوم (الصف 10 أ، 11 ج)",
                          style: TextStyle(fontFamily: 'Tajawal', fontSize: 12.sp, color: const Color(0xFFBA1A1A)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF00714D)),
                    minimumSize: Size(double.infinity, 40.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  ),
                  icon: const Icon(Icons.person_add_alt_1_outlined, color: Color(0xFF00714D)),
                  label: Text("تعيين بديل", style: TextStyle(fontFamily: 'Tajawal', fontSize: 14.sp, color: const Color(0xFF00714D), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),

          // Teacher Card 2: Present (Green Border)
          Container(
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: const Color(0xFF10B981), width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F4EA),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "حاضر",
                    style: TextStyle(fontFamily: 'Tajawal', fontSize: 12.sp, color: const Color(0xFF10B981), fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("سارة عبدالله", style: TextStyle(fontFamily: 'Tajawal', fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    Text("علوم - إعدادي • وقت الحضور 07:15 ص", style: TextStyle(fontFamily: 'Tajawal', fontSize: 12.sp, color: Colors.grey[600])),
                  ],
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: const AssetImage(AssestData.studentwithlaptop),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),

          // Teacher Card 3: Leave (Orange Border)
          Container(
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: const Color(0xFFB87500), width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDDB8),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "إجازة مرضية",
                    style: TextStyle(fontFamily: 'Tajawal', fontSize: 12.sp, color: const Color(0xFFB87500), fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("خالد سعيد", style: TextStyle(fontFamily: 'Tajawal', fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    Text("لغة عربية - ابتدائي • العودة 26 أكتوبر", style: TextStyle(fontFamily: 'Tajawal', fontSize: 12.sp, color: Colors.grey[600])),
                  ],
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey.shade200,
                  child: const Text("خ.س"),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
