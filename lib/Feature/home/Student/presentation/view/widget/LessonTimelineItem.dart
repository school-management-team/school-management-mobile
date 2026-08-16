import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class LessonTimelineItem extends StatefulWidget {
  final String title, time, session, status, teacher, room;

  const LessonTimelineItem({
    required this.title,
    required this.time,
    required this.session,
    required this.status,
    required this.teacher,
    required this.room,
  });

  @override
  State<LessonTimelineItem> createState() => _LessonTimelineItemState();
}

class _LessonTimelineItemState extends State<LessonTimelineItem> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    Color color = widget.status == 'current'
        ? kcolorgreen
        : (widget.status == 'break' ? Colors.orange : Colors.grey);

    Color displayColor = _isTapped ? Colors.grey[400]! : color;

    return GestureDetector(
      onTap: () => setState(() => _isTapped = !_isTapped),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),

                    border: Border.all(
                      color: displayColor.withOpacity(0.5),
                      width: 2.sp,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: displayColor.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: widget.status == 'break'
                      ? _buildBreakCard()
                      : _buildLessonCard(displayColor),
                ),
              ),
              const SizedBox(width: 16),

              Column(
                children: [
                  Container(
                    width: 14.sp,
                    height: 14.sp,
                    decoration: BoxDecoration(
                      color: displayColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 2.sp,
                      color: displayColor.withOpacity(0.3),
                    ),
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(
                      color: displayColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLessonCard(Color color) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.session, style: const TextStyle(color: Colors.grey)),
          Spacer(),
          Container(
            width: 110.sp,
            height: 30.sp,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40.sp),
            ),

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 4.sp),
              child: Text(
                widget.status == 'current' ? "جارية الآن" : "قادمة",
                style: TextSt.textstyle14.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 16.sp),
      Text(widget.title, style: TextSt.textstyle16),
      SizedBox(height: 12.sp),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(widget.room, style: const TextStyle(color: Colors.grey)),
          SizedBox(width: 5.sp),
          Icon(Icons.location_on_outlined, size: 14.sp, color: Colors.grey),
          SizedBox(width: 15.sp),
          Text(widget.teacher, style: TextStyle(color: Colors.grey)),
          SizedBox(width: 5.sp),
          Icon(Icons.person_outline, size: 14.sp, color: Colors.grey),
        ],
      ),
    ],
  );

  Widget _buildBreakCard() => DottedBorder(
    color: Colors.orange,
    dashPattern: [8, 4],
    radius: Radius.circular(12.sp),
    borderType: BorderType.RRect,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "استراحة قصيرة (15 دقيقة)",
            style: TextSt.textstyle12.copyWith(color: Colors.orange),
          ),
          SizedBox(width: 2.sp),
          Icon(Icons.coffee, color: Colors.orange, size: 20.sp),
        ],
      ),
    ),
  );
}
