import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Advisor/presentation/view/widget/alert_bento_card.dart';

class AdvisorAlertsView extends StatefulWidget {
  const AdvisorAlertsView({super.key});

  @override
  State<AdvisorAlertsView> createState() => _AdvisorAlertsViewState();
}

class _AdvisorAlertsViewState extends State<AdvisorAlertsView> {
  int selectedFilter = 0;
  final List<String> filters = [
    "الكل (12)",
    "قيد الانتظار (3)",
    "تم التأكيد (5)",
    "مقروءة (4)"
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
     
        appBar: AppBar(
       
          elevation: 0.5,
          title: Text(
            "التنبيهات والاستدعاءات",
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1C1C18),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "إدارة الإشعارات الموجهة لأولياء الأمور",
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 14.sp,
                  color: const Color(0xFF44474D),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 38.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedFilter == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: EdgeInsets.only(left: 8.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF006C49)
                              : const Color(0xFFEBE8E2),
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                        child: Text(
                          filters[index],
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF44474D),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    AlertBentoCard(
                      title: "استدعاء عاجل",
                      studentName: "أحمد محمد",
                      description:
                          "يرجى حضور ولي الأمر لمناقشة تراجع المستوى الأكاديمي في مادة الرياضيات.",
                      date: "15 مايو 2024",
                      statusText: "قيد الانتظار",
                      statusIcon: Icons.schedule,
                      statusBgColor: Color(0x26FFB95F),
                      statusTextColor: Color(0xFFB87500),
                      edgeColor: Color(0xFFFFB95F),
                      icon: Icons.warning_rounded,
                      iconColor: Color(0xFFBA1A1A),
                      iconBgColor: Color(0x33FFDAD6),
                    ),
                    AlertBentoCard(
                      title: "تنبيه سلوكي",
                      studentName: "عمر خالد",
                      description:
                          "تأخر متكرر عن الطابور الصباحي. يرجى التنبيه على الالتزام بالمواعيد.",
                      date: "12 مايو 2024",
                      statusText: "تم التأكيد",
                      statusIcon: Icons.check_circle,
                      statusBgColor: Color(0x2610B981),
                      statusTextColor: Color(0xFF006C49),
                      edgeColor: Color(0xFF10B981),
                      icon: Icons.notifications_active_rounded,
                      iconColor: Color(0xFF006C49),
                      iconBgColor: Color(0x336CF8BB),
                    ),
                    AlertBentoCard(
                      title: "إشعار إداري",
                      studentName: "يوسف علي",
                      description:
                          "تذكير بموعد استلام الشهادات المدرسية للفصل الدراسي الأول.",
                      date: "10 مايو 2024",
                      statusText: "مقروءة",
                      statusIcon: Icons.mark_email_read,
                      statusBgColor: Color(0x2644474D),
                      statusTextColor: Color(0xFF44474D),
                      edgeColor: Color(0xFF74777D),
                      icon: Icons.mail_outline_rounded,
                      iconColor: Color(0xFF091C31),
                      iconBgColor: Color(0x33D3E4FF),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
