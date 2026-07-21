import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/auth/signup/presentation/view/Login_View.dart';
import 'package:school/Feature/auth/signup/presentation/view/Login_body_view.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/actioncards.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/assignedclasscard.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/new_messages.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/pending_tasks.dart';

import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';

class teacherdashbody extends StatefulWidget {
  const teacherdashbody({super.key});
  @override
  State<teacherdashbody> createState() => teacherdashbodyState();
}

class teacherdashbodyState extends State<teacherdashbody> {
  Widget build(BuildContext context) {
    return //Padding(
    Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 12),
        child: ListView(
          children: [
            Container(
              //height: 229.4.h,
              width: 342.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFFFFFFFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 18,
                      top: 20,
                      bottom: 10,
                    ),
                    child: SizedBox(
                      // height: 116.h,
                      // width: 240.87.w,
                      child: Text(
                        "أهلا بك, أستاذ أحمد",
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          //height: 57.6.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: SizedBox(
                      width: 326.75.w,
                      // height: 58.h,
                      child: Text(
                        "إليك نظرة عامة على يومك الأكاديمي",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF44474D),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            assignedclasscard(
              nextlesson: "الحصة القادمة:رياضيات (الصف 10-أ)",
              numofclasses: "4",
            ),
            SizedBox(height: 20.h),
            PendingTasks(
              numofclasses: '7',
              nextlesson: '4 تصحيح واجبات.3 تقارير',
            ),
            SizedBox(height: 40.h),
            newmessages(
              numofmessages: '2',
              source: 'من الإدارة وأولياء الأمور',
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: SizedBox(
                child: Container(
                  width: 342.w,
                  child: Text(
                    'إجراءات سريعة',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: const EdgeInsets.only(right: 18, left: 18),
              child: const ButtonCard(),
            ),

            SizedBox(height: 2.h),

            // SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }
}
