import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/linearPrecent.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';

class CustomCardItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icons;
  const CustomCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icons,
  });

  @override
  State<CustomCardItem> createState() => _CustomCardItemState();
}

class _CustomCardItemState extends State<CustomCardItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
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
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 24.sp,
                        height: 24.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kcolorOlive, width: 2),
                          color: isSelected ? kcolorOlive : Colors.transparent,
                        ),
                        child: isSelected
                            ? Icon(
                                Icons.check,
                                size: 16.sp,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(widget.title, style: TextSt.textstyle14),
                            Text(widget.subtitle, style: TextSt.textstyle12),
                          ],
                        ),
                        SizedBox(width: 12.sp),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 50.sp,
                            height: 50.sp,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,

                              border: Border.all(color: Colors.green.shade100),
                              borderRadius: BorderRadius.circular(40.sp),
                            ),
                            child: Icon(
                              widget.icons,
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

            Container(width: 15, height: 112, color: kcolorOlive),
          ],
        ),
      ),
    );
  }
}
