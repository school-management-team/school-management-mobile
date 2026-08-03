
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';
class AcademicTipCard extends StatefulWidget {
  final String title, content, author, authorInitial;

  const AcademicTipCard({
    required this.title,
    required this.content,
    required this.author,
    required this.authorInitial,
  });

  @override
  _AcademicTipCardState createState() => _AcademicTipCardState();
}

class _AcademicTipCardState extends State<AcademicTipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(
      begin: 0.85,
      end: 1.15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(color: Colors.white54),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextSt.textstyle24.copyWith(color: kcolorOlive),
              ),
              Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  ScaleTransition(
                    scale: _pulseAnimation,
                    child: Container(
                      width: 70.sp,
                      height: 70.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kcolorgreen.withOpacity(0.15),
                      ),
                    ),
                  ),
                  Icon(Icons.person_search_outlined, color: kcolorOlive, size: 40.sp),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.sp),
          Text(
            widget.content,
            textAlign: TextAlign.right,
            style: TextSt.textstyle14.copyWith(
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
          SizedBox(height: 20.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.author, style: TextSt.textstyle14),
              SizedBox(width: 8.sp),
              CircleAvatar(
                radius: 15,
                backgroundColor: kcolorgreen.withOpacity(0.2),
                child: Text(
                  widget.authorInitial,
                  style: TextSt.textstyle12.copyWith(color: kcolorOlive),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
