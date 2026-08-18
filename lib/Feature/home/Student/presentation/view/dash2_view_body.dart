import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_dash2_student/dash2_student_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view/WeekDaysSelector_view.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/SchoolCalendarScreen.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/function/showloadingDialog.dart';
import 'package:school/core/widget/Text/text_style.dart';

class Dash2ViewBody extends StatefulWidget {
  const Dash2ViewBody({super.key});

  @override
  State<Dash2ViewBody> createState() => _Dash2ViewBodyState();
}

class _Dash2ViewBodyState extends State<Dash2ViewBody> {
  final PageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Dash2StudentCubit, Dash2StudentState>(
      builder: (context, state) {
        if (state is Dash2StudentLoading) {
          showloadingDialog(context);
        } else if (state is Dash2StudentFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }

        return PageFlipBuilder(
          key: PageFlipKey,
          interactiveFlipEnabled: true,
          flipAxis: Axis.horizontal,

          frontBuilder: (_) => _buildMainContent(),

          backBuilder: (_) => (WeekdaysselectorView()),
        );
      },
    );
  }

  Widget _buildMainContent() {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Column(
                children: [
                  SchoolCalendarScreen(),
                  SizedBox(height: 30.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        " عرض الكل",
                        style: TextSt.textstyle17.copyWith(color: kcolorOlive),
                      ),
                      Spacer(),
                      Text("آخر الإعلانات ", style: TextSt.textstyle17),
                    ],
                  ),
                  SizedBox(height: 30.sp),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: const Offset(4, 4),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                AssestData.schoolTrip,
                                height: 200,
                                fit: BoxFit.fill,
                              ),

                              Positioned(
                                top: 8,
                                right: 10,
                                child: Container(
                                  height: 40.sp,
                                  width: 70.sp,
                                  decoration: BoxDecoration(
                                    color: kcolorgreen,
                                    borderRadius: BorderRadius.circular(25.sp),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsGeometry.symmetric(
                                      horizontal: 12.sp,
                                      vertical: 4.sp,
                                    ),
                                    child: Text(
                                      "تذكير",
                                      style: TextSt.textstyle16.copyWith(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.sp),
                          Text(
                            "رحلة المتحف الوطني للعلوم",
                            style: TextSt.textstyle16,
                          ),
                          SizedBox(height: 16.sp),
                          Text(
                            " نذكر أولياء الأمور الكرام بأن آخر موعد لتسليم",
                            style: TextSt.textstyle14.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "...موافقات رحلة المتحف هو الخميس القادم",
                            style: TextSt.textstyle14.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 30.sp),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                                size: 16,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "1.2k",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(width: 15),
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 16,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "12 مايو",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.sp),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      buildAnnouncement(
                        "جدول الاختبارات النهائية",
                        "    تم رفع الجداول النهائية لجميع  \n      المراحل الدراسية عبر المنصة  ",
                        "منذ 3 ساعات",
                        Icons.description,
                        Colors.green,
                      ),
                      buildAnnouncement(
                        "تحديث سياسة الزي المدرسي",
                        "يرجى الاطلاع على التحديثات الجديدة  \n                  الخاصة بالزي الرياضي",
                        "أمس",
                        Icons.campaign,
                        Colors.orange,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.sp),

                  GestureDetector(
                    onTap: () {
                      PageFlipKey.currentState?.flip();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "متابعة معلومات جدول الطالب",
                          style: TextSt.textstyle16,
                        ),
                        SizedBox(width: 2.sp),

                        Lottie.asset(
                          AssestData.study,
                          width: 100,
                          height: 100,
                          animate: true,
                          repeat: true,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.sp),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 200.h,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onHorizontalDragStart: (_) {},
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildAnnouncement(
  String title,
  String subtitle,
  String time,
  IconData icon,
  Color color,
) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 16.sp),
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
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title, style: TextSt.textstyle16),
              SizedBox(height: 4.sp),
              Text(
                subtitle,
                style: TextSt.textstyle14.copyWith(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(height: 8.sp),
              Text(
                time,
                style: TextSt.textstyle14.copyWith(color: Colors.grey.shade400),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.sp),
        Container(
          height: 65.sp,
          width: 65.sp,
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 30.sp),
        ),
      ],
    ),
  );
}
