import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/container_role.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';


class RoleSelectionBodyView extends StatelessWidget {
  const RoleSelectionBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssestData.roleImage,
              alignment: AlignmentGeometry.center,
            ),

            Text(
              "اختر نوع  \n الحساب للبدء",
              style: TextSt.textstyle28.copyWith(
                fontSize: 48.sp,
                color: kcolorNavyBlue,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              "يرجى تحديد دورك في النظام للوصول إلى لوحة",
              style: TextSt.textstyle17,
            ),
            Text("    .التحكم المخصصة لك والمتابعة", style: TextSt.textstyle17),
            SizedBox(height: 16),
            containerRoles(
              ontap: () {
                 GoRouter.of(context).push(AppRouter.kOnBoarding);
              },
              image: AssestData.roleSystem,
              textmain: "مدير النظام",
              text: "،إدارة شاملة للنظام، صلاحيات المستخدمين",
              text2: " .والإعدادات الأكاديمية والمالية",
            
            ),
            SizedBox(height: 16),
            containerRoles(
              ontap: () {
                 GoRouter.of(context).push(AppRouter.kStudentDashboard);
              },
              image: AssestData.roleTeacher,
              textmain: "معلم / أكاديمي ",
              text: "إدارة الفصول الدراسية، رصد الدرجات",
              text2: ".والتواصل المباشر مع الطلاب",
           
            ),
            SizedBox(height: 16),
            containerRoles(
              ontap: () {
                GoRouter.of(context).push(AppRouter.kmanagementview);
              },
              image: AssestData.roleStudent,
              textmain: "طالب / ولي أمر",
              text: "، متابعة التقدم الأكاديمي، سجل الحضور",
              text2: " .الجداول، والرسوم الدراسية",
            
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
