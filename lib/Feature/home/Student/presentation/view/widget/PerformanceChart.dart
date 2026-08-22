import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/Data/models/grade.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';


class PerformanceChart extends StatelessWidget {
  final List<SubjectModel> subjects;

  const PerformanceChart({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.sp),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      margin: EdgeInsets.all(16.sp),
      padding: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 30.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("تقدم المواد الدراسية", style: TextSt.textstyle16),
          SizedBox(height: 30.sp),
          SizedBox(
            height: 220.sp,
            child: BarChart(
              BarChartData(
                maxY: 100, 
                alignment: BarChartAlignment.spaceAround,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withOpacity(0.15),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 30, interval: 20),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => Colors.black87,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final subjectName = subjects[group.x.toInt()].subject;
                      return BarTooltipItem(
                        '$subjectName\n${rod.toY.toStringAsFixed(1)}%',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                barGroups: List.generate(
                  subjects.length,
                  (index) => _makeBarGroup(index, subjects[index].totalValue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _makeBarGroup(int x, double y) {
    Color color;
    if (y < 50) {
      color = Colors.redAccent.withOpacity(0.8);
    } else if (y < 75) {
      color = Colors.orange.withOpacity(0.8);
    } else {
      color = kcolorOlive.withOpacity(0.8);
    }

    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 16.sp,
          color: color,
          borderRadius: BorderRadius.circular(8.sp),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: Colors.grey.withOpacity(0.08),
          ),
        ),
      ],
    );
  }SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      if (value.toInt() < 0 || value.toInt() >= subjects.length) {
        return const SizedBox.shrink();
      }
      return Padding(
        padding: EdgeInsets.only(top: 8.sp),
        child: Text(
          subjects[value.toInt()].subject,
          style: TextSt.textstyle12,
          overflow: TextOverflow.ellipsis,
        ),
      );
    },
  );
}