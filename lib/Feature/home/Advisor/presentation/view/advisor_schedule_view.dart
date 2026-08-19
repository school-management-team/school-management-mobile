import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/bottom_navigation_advisor.dart';

class AdvisorScheduleView extends StatelessWidget {
  const AdvisorScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFCF9F3),
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
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
        bottomNavigationBar: const BottomNavigationAdvisor(select: 3),
        body: const SafeArea(
          child: AdvisorScheduleBodyView(),
        ),
      ),
    );
  }
}

class AdvisorScheduleBodyView extends StatefulWidget {
  const AdvisorScheduleBodyView({super.key});

  @override
  State<AdvisorScheduleBodyView> createState() => _AdvisorScheduleBodyViewState();
}

class _AdvisorScheduleBodyViewState extends State<AdvisorScheduleBodyView> {
  int selectedDayIndex = 1; // الإثنين 13 default
  bool isEditMode = false;

  final List<Map<String, String>> weekDays = [
    {'day': 'الأحد', 'date': '12'},
    {'day': 'الإثنين', 'date': '13'},
    {'day': 'الثلاثاء', 'date': '14'},
    {'day': 'الأربعاء', 'date': '15'},
    {'day': 'الخميس', 'date': '16'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with Toggle (عرض / تعديل)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "جدول الحصص",
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF091C31),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4.sp),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E2DC),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isEditMode = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: !isEditMode ? const Color(0xFF00714D) : Colors.transparent,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Text(
                          "عرض",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: !isEditMode ? Colors.white : const Color(0xFF44474D),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isEditMode = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: isEditMode ? const Color(0xFF00714D) : Colors.transparent,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Text(
                          "تعديل",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: isEditMode ? Colors.white : const Color(0xFF44474D),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Days Selector Carousel
          SizedBox(
            height: 80.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: weekDays.length,
              separatorBuilder: (context, index) => SizedBox(width: 8.w),
              itemBuilder: (context, index) {
                final dayData = weekDays[index];
                final bool isSelected = selectedDayIndex == index;
                final bool hasDot = index == 2; // الثلاثاء notification dot

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDayIndex = index;
                    });
                  },
                  child: Container(
                    width: 64.w,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF00714D) : const Color(0xFFF6F3ED),
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: const Color(0xFF00714D).withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dayData['day']!,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 12.sp,
                                color: isSelected ? Colors.white.withOpacity(0.8) : Colors.grey[600],
                              ),
                            ),
                            if (hasDot) ...[
                              SizedBox(width: 2.w),
                              CircleAvatar(
                                radius: 3.r,
                                backgroundColor: const Color(0xFFBA1A1A),
                              ),
                            ],
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          dayData['date']!,
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : const Color(0xFF1C1C18),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 24.h),

          // Schedule Timeline Items
          // Item 1: 08:00 AM Normal Class
          _buildTimelineItem(
            time: "08:00\nص",
            isDotActive: false,
            content: Container(
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: const Border(
                  right: BorderSide(color: Color(0xFF00714D), width: 4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الرياضيات - الصف الأول",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1C1C18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5E2DC),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          "قاعة 101",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 11.sp,
                            color: const Color(0xFF44474D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.person_outline, size: 16.sp, color: Colors.grey[600]),
                      SizedBox(width: 4.w),
                      Text(
                        "أ. أحمد محمد",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F4EA),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "الوحدة الثانية",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 12.sp,
                        color: const Color(0xFF00714D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Item 2: 09:30 AM Live Class (الآن)
          _buildTimelineItem(
            time: "09:30\nص",
            isDotActive: true,
            dotColor: const Color(0xFF00714D),
            content: Container(
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: const Border(
                  right: BorderSide(color: Color(0xFF00714D), width: 4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00714D),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text(
                              "الآن",
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 11.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "الفيزياء - الصف الثاني",
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1C1C18),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5E2DC),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          "مختبر 2",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 11.sp,
                            color: const Color(0xFF44474D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.person_outline, size: 16.sp, color: Colors.grey[600]),
                      SizedBox(width: 4.w),
                      Text(
                        "أ. خالد عبدالله",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Progress Bar for class timing
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: const LinearProgressIndicator(
                          value: 0.45,
                          minHeight: 5,
                          backgroundColor: Color(0xFFE5E2DC),
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00714D)),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("مضى 20 دقيقة", style: TextStyle(fontFamily: 'Tajawal', fontSize: 11.sp, color: Colors.grey[600])),
                          Text("باقي 25 دقيقة", style: TextStyle(fontFamily: 'Tajawal', fontSize: 11.sp, color: Colors.grey[600])),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Item 3: 11:00 AM Conflict Warning
          _buildTimelineItem(
            time: "11:00\nص",
            isDotActive: true,
            dotColor: const Color(0xFFBA1A1A),
            content: Container(
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                color: const Color(0xFFFFDAD6).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFBA1A1A).withOpacity(0.4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Warning Header Banner
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDAD6),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.warning_amber_rounded, color: Color(0xFFBA1A1A)),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "تعارض في الجدول",
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFBA1A1A),
                                ),
                              ),
                              Text(
                                "المعلم معين في فصلين بنفس الوقت",
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 12.sp,
                                  color: const Color(0xFFBA1A1A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الكيمياء - الصف الثالث",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1C1C18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5E2DC),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          "قاعة 305",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 11.sp,
                            color: const Color(0xFF44474D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(Icons.person_outline, size: 16.sp, color: Colors.grey[600]),
                      SizedBox(width: 4.w),
                      Text(
                        "أ. سعيد القحطاني",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFBA1A1A)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                    ),
                    icon: const Icon(Icons.arrow_back, color: Color(0xFFBA1A1A), size: 16),
                    label: Text(
                      "حل التعارض ←",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 13.sp,
                        color: const Color(0xFFBA1A1A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Item 4: 12:30 PM Break Period
          _buildTimelineItem(
            time: "12:30\nم",
            isDotActive: false,
            content: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F3ED),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.restaurant_rounded, color: Colors.grey[600], size: 20.sp),
                  SizedBox(width: 10.w),
                  Text(
                    "فترة استراحة",
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String time,
    required bool isDotActive,
    Color? dotColor,
    required Widget content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time Column
        SizedBox(
          width: 50.w,
          child: Column(
            children: [
              Text(
                time,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF44474D),
                ),
              ),
              SizedBox(height: 6.h),
              CircleAvatar(
                radius: 6.r,
                backgroundColor: isDotActive ? (dotColor ?? const Color(0xFF00714D)) : Colors.grey.shade300,
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        // Content Area
        Expanded(child: content),
      ],
    );
  }
}
