import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/core/widget/bottom_navigation_advisor.dart';

class StudentTransferView extends StatelessWidget {
  const StudentTransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "الموجه التربوي",
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavigationAdvisor(select: -1),
        body: const SafeArea(
          child: StudentTransferBodyView(),
        ),
      ),
    );
  }
}

class StudentTransferBodyView extends StatefulWidget {
  const StudentTransferBodyView({super.key});

  @override
  State<StudentTransferBodyView> createState() => _StudentTransferBodyViewState();
}

class StudentTransferModel {
  final String id;
  final String name;
  final int gpa;
  String section; // 'أ', 'ب', 'ج'

  StudentTransferModel({
    required this.id,
    required this.name,
    required this.gpa,
    required this.section,
  });
}

class _StudentTransferBodyViewState extends State<StudentTransferBodyView> {
  final List<StudentTransferModel> students = [
    StudentTransferModel(id: '1', name: 'أحمد محمد عبدالله', gpa: 95, section: 'أ'),
    StudentTransferModel(id: '2', name: 'عمر خالد السعيد', gpa: 88, section: 'ب'),
    StudentTransferModel(id: '3', name: 'سعد عبدالرحمن علي', gpa: 92, section: 'ج'),
  ];

  StudentTransferModel? selectedStudent;

  void _transferSelectedStudent(String targetSection) {
    if (selectedStudent == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الرجاء تحديد طالب لتبديل شعبه'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    setState(() {
      selectedStudent!.section = targetSection;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم نقل الطالب ${selectedStudent!.name} إلى شعبة $targetSection'),
        backgroundColor: const Color(0xFF10B981),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int countA = students.where((s) => s.section == 'أ').length + 24; // Mock base count
    int countB = students.where((s) => s.section == 'ب').length + 27;
    int countC = students.where((s) => s.section == 'ج').length + 14;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Center(
            child: Column(
              children: [
                Text(
                  "إدارة الطلاب",
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF091C31),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "الصف الأول المتوسط - توزيع الشعب",
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // Section Statistics Cards Row
          Row(
            children: [
              Expanded(
                child: _buildSectionStatCard(
                  title: "شعبة أ",
                  count: countA,
                  maxCount: 30,
                  primaryColor: const Color(0xFF00714D),
                  bgColor: const Color(0xFFE6F4EA),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildSectionStatCard(
                  title: "شعبة ب",
                  count: countB,
                  maxCount: 30,
                  primaryColor: const Color(0xFFB87500),
                  bgColor: const Color(0xFFFFDDB8).withOpacity(0.4),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildSectionStatCard(
                  title: "شعبة ج",
                  count: countC,
                  maxCount: 30,
                  primaryColor: const Color(0xFF005236),
                  bgColor: const Color(0xFFD3E4FF).withOpacity(0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // Student List Card
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
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
                      "قائمة الطلاب",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C1C18),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.search, size: 22.sp, color: Colors.grey),
                        SizedBox(width: 12.w),
                        Icon(Icons.filter_list, size: 22.sp, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: students.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    final student = students[index];
                    final bool isSelected = selectedStudent?.id == student.id;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedStudent = isSelected ? null : student;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF10B981).withOpacity(0.08)
                              : const Color(0xFFFCF9F3),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected ? const Color(0xFF10B981) : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.drag_indicator, color: Colors.grey),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    student.name,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1C1C18),
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    "المعدل: %${student.gpa} • شعبة ${student.section}",
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 13.sp,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.r,
                              backgroundColor: const Color(0xFF091C31),
                              child: Text(
                                student.name.split(' ').first,
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 11.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // Drag / Action Container
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: const Color(0xFFEBE8E2),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Text(
                  "حدد طالباً لنقله أو اسحبه إلى الشعبة المطلوبة",
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 13.sp,
                    color: const Color(0xFF44474D),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _transferSelectedStudent('أ'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          "نقل إلى أ",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 13.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _transferSelectedStudent('ب'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          "نقل إلى ب",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 13.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _transferSelectedStudent('ج'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          "نقل إلى ج",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 13.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildSectionStatCard({
    required String title,
    required int count,
    required int maxCount,
    required Color primaryColor,
    required Color bgColor,
  }) {
    double progress = (count / maxCount).clamp(0.0, 1.0);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1C1C18),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "$count",
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          SizedBox(height: 8.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5.h,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "من $maxCount طالب",
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 11.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
