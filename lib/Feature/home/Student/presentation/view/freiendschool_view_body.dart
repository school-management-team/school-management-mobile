import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/buildContactItem_friendst.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/buildStudyGroupCard_friend.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';

class FreiendschoolViewBody extends StatelessWidget {
  const FreiendschoolViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(4, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: " ...البحث عن زميل أو مجموعة دراسية",
                    hintStyle: TextStyle(fontSize: 14.sp),
                    hintTextDirection: TextDirection.ltr,

                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  " عرض الكل",
                  style: TextSt.textstyle17.copyWith(color: kcolorOlive),
                ),
                Spacer(),
                Text("مجموعات دراسية  ", style: TextSt.textstyle17),
              ],
            ),
            SizedBox(height: 30.sp),

            SizedBox(
              height: 220.sp,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildStudyGroupCard(
                    "نادي الكيمياء الحيوية",
                    "مناقشة أبحاث الحمض النووي",
                    "🧪",
                    Colors.orange,
                  ),
                  buildStudyGroupCard(
                    "عباقرة الرياضيات",
                    "مراجعة الجبر المتقدم والميكانيكا",
                    "Σ",
                    Colors.green,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.sp),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.filter_list, size: 30.sp, color: Colors.blueGrey),
                SizedBox(width: 10.sp),
                Icon(Icons.sort, size: 30.sp, color: Colors.blueGrey),
                Spacer(),
                Text("الزملاء", style: TextSt.textstyle17),
              ],
            ),
            SizedBox(height: 20.sp),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildContactItem(
                  "عمر خالد",
                  "الذكاء الاصطناعي",
                  AssestData.studentprofile,
                  true,
                ),
                buildContactItem(
                  "سارة الأحمد",
                  " .التصميم  الجرافيكي \n        الفنون ",
                  AssestData.studentprofile,
                  false,
                ),
                buildContactItem(
                  " ليلى محمود",
                  " .الفيزياء النووية    \n        الطاقة ",
                  AssestData.studentprofile2,
                  true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
