import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/app_tour.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/container_role.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';

class RoleSelectionBodyView extends StatelessWidget {
  const RoleSelectionBodyView({super.key});

  void _openTour(
    BuildContext context, {
    required List<TourSlide> slides,
    required String mascotAsset,
    required String destinationRoute,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AppTour(
          slides: slides,
          mascotAsset: mascotAsset,
          onFinished: () => context.go(destinationRoute),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssestData.roleImage, alignment: Alignment.center),
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
            SizedBox(height: 16.h),

            containerRoles(
              ontap: () {
                _openTour(
                  context,
                  slides: supervisorTourSlides,
                  mascotAsset: AssestData.adv1,
                  destinationRoute: AppRouter.ksignupadvisor,
                );
              },
              image: AssestData.roleSystem,
              textmain: "            الموجه التربوي",
              text: "إدارة شاملة لشؤون الطلاب",
              text2: "              .والإعدادات الأكاديمية  ",
            ),
            SizedBox(height: 16.sp),

            containerRoles(
              ontap: () {
                _openTour(
                  context,
                  slides: teacherTourSlides,
                  mascotAsset: AssestData.teacher1,
                  destinationRoute: AppRouter.ksignupteacher,
                );
              },
              image: AssestData.roleTeacher,
              textmain: "معلم / أكاديمي ",
              text: "إدارة الفصول الدراسية، رصد الدرجات",
              text2: ".والتواصل المباشر مع الطلاب",
            ),
            SizedBox(height: 16.sp),

            containerRoles(
              ontap: () {
                _openTour(
                  context,
                  slides: studentTourSlides,
                  mascotAsset: AssestData.studentwithlaptop,
                  destinationRoute: AppRouter.ksignupStud,
                );
              },
              image: AssestData.roleStudent,
              textmain: "طالب / ولي أمر",
              text: "، متابعة التقدم الأكاديمي، سجل الحضور",
              text2: " .الجداول، والرسوم الدراسية",
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
