import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/recentactivities.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/taskforstudent.dart';

class taskandgrade extends StatelessWidget {
  const taskandgrade({super.key});
  @override
  Widget build(BuildContext context) {
    final List<dataofactivity> data = [
      dataofactivity(
        title: 'تم رصد درجات الاختبار القصير',
        subtitle: 'الصف العاشر -أ- قبل ساعتين',
        updatetext: 'تم تحديث درجات 30/32 طالب',
        iscompleted: true,
      ),
      dataofactivity(
        title: 'مهمة جديدة : ورقة عمل الفصل 2',
        subtitle: 'الصف الحادي عشر -ج- أمس',
        iscompleted: false,
      ),
    ];
    return Container(
      width: 390.w,
      height: 937.01.h,
      padding: EdgeInsets.only(bottom: 24.48, left: 18, right: 15, top: 30),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            //كونتينر الكتابة العلوية
            Container(
              width: 342.w,
              //height: 140.19.h,
              padding: EdgeInsets.only(bottom: 1.21),
              child: Text(
                "رصد الدرجات والمهام",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 44.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),

            //............................................
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.only(bottom: 0.59),
              child: Text(
                "الفصول الدراسية",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Color(0xFF1C1C18),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            //...............................................
            SizedBox(height: 10.h),
            taskforstudent(
              classname: 'الصف العاشر',
              subjectname: "أ (رياضيات)",
              studentcount: 32,
              typeoftask: "الوحدة 3: المعادلات",
              iconwidget: Icon(Icons.functions),
              iconbackgroundColor: Color(0xFF6CF8BB).withOpacity(0.2),
              iconcolor: Color(0xFF00714D),
              onPublishtask: () {},
              onGraderecording: () {},
            ),
            SizedBox(height: 10.h),
            taskforstudent(
              classname: 'الصف الحادي عشر',
              subjectname: "ج (الفيزياء)",
              studentcount: 28,
              typeoftask: "الفصل 2 : الحركة",
              iconwidget: Icon(Icons.science_outlined),
              iconbackgroundColor: Color(0xFFFFDDB8).withOpacity(0.4),
              iconcolor: Color(0xFF2A1700),
              onPublishtask: () {},
              onGraderecording: () {},
            ),
            SizedBox(height: 40.h),
            Activity(items: data),
          ],
        ),
      ),
    );
  }
}
