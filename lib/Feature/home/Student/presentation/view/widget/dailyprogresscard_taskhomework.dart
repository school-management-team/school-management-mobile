import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class DailyProgressCard extends StatelessWidget {
  final double progress;
  final int completed;
  final int total;

  const DailyProgressCard({
    required this.progress,
    required this.completed,
    required this.total,
  });

  Color _getProgressColor() {
    if (progress >= 0.8) return kcolorgreen;
    if (progress >= 0.5) return Colors.orange;
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 4,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularPercentIndicator(
            radius: 60.sp,
            lineWidth: 8.0.sp,
            percent: progress,
            animation: true,
            animationDuration: 1200,
            center: Text(
              "${(progress * 100).toInt()}%",
              style: TextSt.textstyle16,
            ),
            progressColor: _getProgressColor(),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.grey.withOpacity(0.2),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("إنجازك اليوم", style: TextSt.textstyle16),
              Text(
                "أكملت $completed من أصل $total مهام",
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 12.sp),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcolorOlive,
                  foregroundColor: Colors.white,
                ),
                child: Text("تفاصيل التقدم", style: TextSt.textstyle14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
