import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class DailyProgressCard extends StatelessWidget {
  final int percentage; 
  final int completed; 
  final int total;     

  const DailyProgressCard({
    super.key,
    required this.percentage,
    required this.completed,
    required this.total,
  });

  Color _getProgressColor() {
    double progressDouble = percentage / 100.0;
    if (progressDouble >= 0.8) return kcolorgreen;
    if (progressDouble >= 0.5) return Colors.orange;
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {

    double progressValue = percentage / 100.0;

   
    if (progressValue > 1.0) progressValue = 1.0;
    if (progressValue < 0.0) progressValue = 0.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.sp),
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
            percent: progressValue,
            animation: true,
            animationDuration: 1200,
            center: Text(
              "$percentage%",
              style: TextSt.textstyle16.copyWith(fontWeight: FontWeight.bold),
            ),
            progressColor: _getProgressColor(),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.grey.withOpacity(0.2),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("إنجازك اليوم", style: TextSt.textstyle16),
              SizedBox(height: 4.sp),
              Text(
                "أكملت $completed من أصل $total مهام",
                style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
              ),
              SizedBox(height: 12.sp),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcolorOlive,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
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