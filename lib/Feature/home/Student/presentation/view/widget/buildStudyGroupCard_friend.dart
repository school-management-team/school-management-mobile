import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
class StudyGroupCardItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String iconText;
  final Color color;
  final VoidCallback onJoinPressed;

  const StudyGroupCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconText,
    required this.color,
    required this.onJoinPressed,
  });

  @override
  State<StudyGroupCardItem> createState() =>
      _StudyGroupCardItemState();
}

class _StudyGroupCardItemState extends State<StudyGroupCardItem> {
  bool isJoined = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.sp,
      margin: EdgeInsets.only(
        right: 16,
        bottom: 12.sp,
      ),
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(6, 6),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.sp,
                  vertical: 8.sp,
                ),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Text(
                  widget.iconText,
                  style: TextSt.textstyle16.copyWith(
                    color: widget.color,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.sp),

          Text(
            widget.title,
            style: TextSt.textstyle16,
          ),

          SizedBox(height: 10.sp),

          Text(
            widget.subtitle,
            style: TextSt.textstyle14.copyWith(
              color: Colors.grey,
            ),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isJoined ? Colors.grey : kcolorOlive,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.sp),
                ),
              ),
              onPressed: () {
                setState(() {
                  isJoined = true;
                });

               
                widget.onJoinPressed();
              },
              child: Text(
                isJoined ? "تم الانضمام ✓" : "انضمام الآن",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}