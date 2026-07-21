import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/TabCard.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/pendingapprovals.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/statuscard.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/statuscardwithprog.dart';

import 'package:school/core/assest.dart';

class admindash extends StatelessWidget {
  const admindash({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 1807.h,
      padding: EdgeInsets.only(right: 24, left: 24, top: 24),
      color: Color(0xFFFFFFFF),
      child: ListView(
        //  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              statcard(
                label: "+5% هذا الشهر",
                val1: "إجمالي الطلاب",
                val: "3,452",
                icon: Container(
                  width: 48.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFD3E4FF),
                    borderRadius: BorderRadius.circular(7.r),
                  ),

                  child: Icon(Icons.groups_outlined, color: Color(0xFF091C31)),
                  /* ImageIcon(
                  AssetImage(AssestData.iicon),
                  color: Color(0XFF091C31),
                ),*/
                ),
              ),
              SizedBox(height: 24.h),
              statcard(
                val1: "أعضاء هيئة التدريس",
                label: "+2 جدد",
                val: "148",
                icon: Container(
                  width: 48.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFDDB8),
                    borderRadius: BorderRadius.circular(7.r),
                  ),

                  child: Icon(Icons.school_outlined, color: Color(0xFF2A1700)),
                ),
              ),
              SizedBox(height: 24.h),
              statcard(
                val: "89",
                label: "قيد المعالجة",
                val1: "طلبات القبول",
                icon: Container(
                  width: 48.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFDAD6),
                    borderRadius: BorderRadius.circular(7.r),
                  ),

                  child: ImageIcon(
                    AssetImage(AssestData.iicon),
                    color: Color(0XFF93000A),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              statcardwithprogress(
                val1: "معدل تحصيل الرسوم",
                progressvalue: 85,
                icon: Container(
                  width: 48.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E2DC),
                    borderRadius: BorderRadius.circular(7.r),
                  ),

                  child: ImageIcon(
                    AssetImage(AssestData.iiicon),
                    // color: Color(0XFF93000A),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              tabcards(id: 1, value: 0.0, color: Colors.transparent),
              SizedBox(height: 24.h),

              PendingApprovals(
                approvals: [
                  {'name': 'طلب إجازة', 'type': 'أ سارة خالد (علوم)'},
                  {'name': 'طلب إجازة', 'type': 'أ سارة خالد (علوم)'},
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
