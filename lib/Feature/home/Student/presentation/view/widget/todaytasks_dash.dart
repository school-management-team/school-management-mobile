import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/linearPrecent.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';class CustomCardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icons;
  final String status;

  const CustomCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icons,
    required this.status,
  });

  bool get isCompleted {
    final value = status.toLowerCase().trim();

    return value == 'completed' ||
        value == 'done' ||
        value == 'finished';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.sp,
        horizontal: 16.sp,
      ),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.sp),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Row(
                  children: [
                  

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 24.sp,
                      height: 24.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kcolorOlive,
                          width: 2,
                        ),
                        color: isCompleted
                            ? kcolorOlive
                            : Colors.transparent,
                      ),
                      child: isCompleted
                          ? Icon(
                              Icons.check,
                              size: 12.sp,
                              color: Colors.white,
                            )
                          : null,
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.end,
                          children: [
                            Text(
                              title,
                              style: TextSt.textstyle12,
                            ),
                            SizedBox(height: 4.sp),
                            Text(
                              subtitle,
                              style: TextSt.textstyle12,
                            ),
                          ],
                        ),

                        SizedBox(width: 12.sp),

                        Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: Container(
                            width: 50.sp,
                            height: 50.sp,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              border: Border.all(
                                color: Colors.green.shade100,
                              ),
                              borderRadius:
                                  BorderRadius.circular(40.sp),
                            ),
                            child: Icon(
                              icons,
                              size: 25.sp,
                              color: kcolorOlive,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 15.sp,
              height: 112.sp,
              color: kcolorOlive,
            ),
          ],
        ),
      ),
    );
  }
}