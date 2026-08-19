import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';

class AdvisorAttendanceBodyView extends StatefulWidget {
  const AdvisorAttendanceBodyView({super.key});

  @override
  State<AdvisorAttendanceBodyView> createState() => _AdvisorAttendanceBodyViewState();
}

class StudentAttendanceModel {
  final String id;
  final String name;
  final String avatar;
  String status; // 'حاضر', 'غائب', 'متأخر', 'مستأذن'

  StudentAttendanceModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.status,
  });
}

class _AdvisorAttendanceBodyViewState extends State<AdvisorAttendanceBodyView> {
  String selectedClass = 'الصف الثامن - أ';
  DateTime selectedDate = DateTime.now();

  final List<String> classOptions = [
    'الصف الثامن - أ',
    'الصف الثامن - ب',
    'الصف التاسع - أ',
    'الصف التاسع - ب',
    'الأول ثانوي - علمي',
  ];

  late Map<String, List<StudentAttendanceModel>> classStudentsMap;

  @override
  void initState() {
    super.initState();
    classStudentsMap = {
      'الصف الثامن - أ': [
        StudentAttendanceModel(id: '1', name: 'سارة أحمد', avatar: AssestData.studentDashboard, status: 'حاضر'),
        StudentAttendanceModel(id: '2', name: 'محمد علي', avatar: AssestData.profile, status: 'غائب'),
        StudentAttendanceModel(id: '3', name: 'ليلى خالد', avatar: AssestData.studentwithlaptop, status: 'متأخر'),
        StudentAttendanceModel(id: '4', name: 'عمر فاروق', avatar: AssestData.studentDashboard, status: 'حاضر'),
        StudentAttendanceModel(id: '5', name: 'ريم محمود', avatar: AssestData.studentwithlaptop, status: 'مستأذن'),
      ],
      'الصف الثامن - ب': [
        StudentAttendanceModel(id: '6', name: 'أحمد مصطفى', avatar: AssestData.profile, status: 'حاضر'),
        StudentAttendanceModel(id: '7', name: 'فاطمة الزهراء', avatar: AssestData.studentwithlaptop, status: 'حاضر'),
        StudentAttendanceModel(id: '8', name: 'خالد يوسف', avatar: AssestData.studentDashboard, status: 'غائب'),
      ],
      'الصف التاسع - أ': [
        StudentAttendanceModel(id: '9', name: 'ياسين حمزة', avatar: AssestData.profile, status: 'حاضر'),
        StudentAttendanceModel(id: '10', name: 'نور الهدى', avatar: AssestData.studentwithlaptop, status: 'متأخر'),
      ],
      'الصف التاسع - ب': [
        StudentAttendanceModel(id: '11', name: 'طارق زياد', avatar: AssestData.studentDashboard, status: 'حاضر'),
      ],
      'الأول ثانوي - علمي': [
        StudentAttendanceModel(id: '12', name: 'بلال عبد الله', avatar: AssestData.profile, status: 'حاضر'),
      ],
    };
  }

  void _markAllPresent() {
    final students = classStudentsMap[selectedClass] ?? [];
    setState(() {
      for (var student in students) {
        student.status = 'حاضر';
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم تسجيل الجميع كـ "حاضر" بنجاح'),
        backgroundColor: Color(0xFF10B981),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final students = classStudentsMap[selectedClass] ?? [];
    final String formattedDate =
        "${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.year}";

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper Header Glass Card for Class & Date Selection
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.black.withOpacity(0.05)),
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
                  "إدارة الحضور والإنصراف",
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF091C31),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "سجل حضور الطلاب اليومي",
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16.h),

                // Class Dropdown
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F3ED),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedClass,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF74777D)),
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C1C18),
                      ),
                      items: classOptions.map((String className) {
                        return DropdownMenuItem<String>(
                          value: className,
                          child: Text(className),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedClass = newValue;
                          });
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                // Date Selector Input
                GestureDetector(
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Color(0xFF10B981),
                              onPrimary: Colors.white,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F3ED),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      formattedDate,
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 15.sp,
                        color: const Color(0xFF1C1C18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // "تسجيل الكل حاضر" CTA Button
          SizedBox(
            height: 46.h,
            child: ElevatedButton.icon(
              onPressed: _markAllPresent,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF10B981),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
              ),
              icon: Icon(Icons.done_all, color: Colors.white, size: 20.sp),
              label: Text(
                "تسجيل الكل حاضر",
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // Attendance Table Container
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.black.withOpacity(0.05)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF071A2F).withOpacity(0.05),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Table Header Row
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F3ED).withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الطالب",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF44474D),
                        ),
                      ),
                      Text(
                        "الحالة",
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF44474D),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: Color(0xFFE5E2DC)),

                // Students List
                if (students.isEmpty)
                  Padding(
                    padding: EdgeInsets.all(32.sp),
                    child: Text(
                      "لا يوجد طلاب في هذا الصف",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  )
                else
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: students.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      color: Color(0xFFF0EEE8),
                    ),
                    itemBuilder: (context, index) {
                      final student = students[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                        child: Row(
                          children: [
                            // Student Avatar & Name
                            Container(
                              width: 38.w,
                              height: 38.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(student.avatar),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                student.name,
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1C1C18),
                                ),
                              ),
                            ),

                            // Status Options Selector Chips Row
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildStatusChip(student, 'حاضر', const Color(0xFFE6F4EA), const Color(0xFF10B981)),
                                  SizedBox(width: 4.w),
                                  _buildStatusChip(student, 'غائب', const Color(0xFFFFDAD6), const Color(0xFFBA1A1A)),
                                  SizedBox(width: 4.w),
                                  _buildStatusChip(student, 'متأخر', const Color(0xFFFFDDB8), const Color(0xFFB87500)),
                                  SizedBox(width: 4.w),
                                  _buildStatusChip(student, 'مستأذن', const Color(0xFFE5E2DC), const Color(0xFF44474D)),
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
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildStatusChip(
    StudentAttendanceModel student,
    String statusName,
    Color activeBgColor,
    Color activeTextColor,
  ) {
    final bool isSelected = student.status == statusName;
    return GestureDetector(
      onTap: () {
        setState(() {
          student.status = statusName;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? activeBgColor : const Color(0xFFF6F3ED),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? activeTextColor.withOpacity(0.4) : Colors.transparent,
          ),
        ),
        child: Text(
          statusName,
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 12.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? activeTextColor : const Color(0xFF74777D),
          ),
        ),
      ),
    );
  }
}
