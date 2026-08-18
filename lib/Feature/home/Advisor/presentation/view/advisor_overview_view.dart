import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/bottom_navigation_advisor.dart';

class AdvisorOverviewView extends StatelessWidget {
  const AdvisorOverviewView({super.key});

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
                radius: 18.r,
                backgroundImage: const AssetImage(AssestData.profile),
              ),
              SizedBox(width: 10.w),
              Text(
                "Academic Portal",
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF091C31),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded, color: Color(0xFF10B981)),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavigationAdvisor(select: 1),
        body: const SafeArea(
          child: AdvisorOverviewBodyView(),
        ),
      ),
    );
  }
}

class AdvisorOverviewBodyView extends StatelessWidget {
  const AdvisorOverviewBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          // Stat Card 1: Total Students
          _buildStatCard(
            badgeText: "+5% هذا الشهر",
            badgeBgColor: const Color(0xFF6CF8BB),
            badgeTextColor: const Color(0xFF00714D),
            icon: Icons.groups_rounded,
            iconBgColor: const Color(0xFFD3E4FF),
            iconColor: const Color(0xFF091C31),
            value: "3,452",
            label: "إجمالي الطلاب",
          ),
          SizedBox(height: 14.h),

          // Stat Card 2: Faculty Members
          _buildStatCard(
            badgeText: "+2 جديد",
            badgeBgColor: const Color(0xFF6CF8BB),
            badgeTextColor: const Color(0xFF00714D),
            icon: Icons.school_rounded,
            iconBgColor: const Color(0xFFFFDDB8),
            iconColor: const Color(0xFF2A1700),
            value: "148",
            label: "أعضاء هيئة التدريس",
          ),
          SizedBox(height: 14.h),

          // Stat Card 3: Admission Requests
          _buildStatCard(
            badgeText: "قيد المعالجة",
            badgeBgColor: const Color(0xFFE5E2DC),
            badgeTextColor: const Color(0xFF44474D),
            icon: Icons.assignment_ind_rounded,
            iconBgColor: const Color(0xFFFFDAD6),
            iconColor: const Color(0xFFBA1A1A),
            value: "89",
            label: "طلبات القبول",
          ),
          SizedBox(height: 14.h),

          // Stat Card 4: Fee Collection Rate
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E2DC),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Icons.account_balance_wallet_rounded, size: 20.sp, color: Colors.black),
                ),
                SizedBox(height: 12.h),
                Text(
                  "85%",
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF091C31),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "معدل تحصيل الرسوم",
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 13.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: const LinearProgressIndicator(
                    value: 0.85,
                    minHeight: 6,
                    backgroundColor: Color(0xFFE5E2DC),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Attendance Overview Bar Chart Card
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
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
                      "نظرة عامة على الحضور",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C1C18),
                      ),
                    ),
                    Text(
                      "عرض التفاصيل",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 12.sp,
                        color: const Color(0xFF10B981),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Mock Bar Chart
                SizedBox(
                  height: 150.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildBarItem("الأحد", 0.9, const Color(0xFF10B981)),
                      _buildBarItem("الإثنين", 0.82, const Color(0xFF10B981)),
                      _buildBarItem("الثلاثاء", 0.75, const Color(0xFF10B981)),
                      _buildBarItem("الأربعاء", 0.4, const Color(0xFFBA1A1A)),
                      _buildBarItem("الخميس", 0.85, const Color(0xFF10B981)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Pending Approvals Card
          Container(
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
                    Text(
                      "موافقات معلقة",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C1C18),
                      ),
                    ),
                    CircleAvatar(
                      radius: 12.r,
                      backgroundColor: const Color(0xFFFFDAD6),
                      child: Text(
                        "2",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFFBA1A1A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                _buildApprovalTile("طلب إجازة", "أ. سارة خالد (علوم)", Icons.event_available_rounded),
                SizedBox(height: 8.h),
                _buildApprovalTile("طلب شراء", "معدات مختبر", Icons.shopping_bag_outlined),
              ],
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String badgeText,
    required Color badgeBgColor,
    required Color badgeTextColor,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
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
              Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: iconColor, size: 20.sp),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: badgeBgColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: badgeTextColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF091C31),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarItem(String day, double heightRatio, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 28.w,
          height: 110.h * heightRatio,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          day,
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 12.sp,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildApprovalTile(String title, String subtitle, IconData icon) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: const Color(0xFFFCF9F3),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18.r,
            backgroundColor: const Color(0xFF2A1700).withOpacity(0.1),
            child: Icon(icon, color: const Color(0xFF2A1700), size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: const Color(0xFF10B981), size: 22.sp),
        ],
      ),
    );
  }
}
