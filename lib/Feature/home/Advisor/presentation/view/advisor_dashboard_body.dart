import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Advisor/presentation/view/widget/daily_summary_glass_card.dart';
import 'package:school/Feature/home/Advisor/presentation/view/widget/quick_actions_bento_grid.dart';
import 'package:school/Feature/home/Advisor/presentation/view/widget/recent_activities_feed.dart';
import 'package:school/Feature/home/Advisor/presentation/view/widget/welcome_header_widget.dart';

class AdvisorDashboardBody extends StatelessWidget {
  const AdvisorDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const WelcomeHeaderWidget(),
            SizedBox(height: 20.h),
            const DailySummaryGlassCard(),
            SizedBox(height: 24.h),
            const QuickActionsBentoGrid(),
            SizedBox(height: 24.h),
            const RecentActivitiesFeed(),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
