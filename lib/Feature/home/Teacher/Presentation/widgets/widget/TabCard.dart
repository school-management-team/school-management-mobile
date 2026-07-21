import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class tabcards extends StatelessWidget {
  final int id;
  final double value;
  final Color color;
  const tabcards({
    super.key,
    required this.id,
    required this.value,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    const Color primarygreen = Color(0xFF2CB884);
    const Color secondarygreen = Color(0xFF6EDAB1);
    const Color primaryred = Color(0xFFDB6D6D);
    final List<tabcards> Data = [
      tabcards(id: 1, value: 9.5, color: primarygreen),
      tabcards(id: 3, value: 9, color: primarygreen),
      tabcards(id: 4, value: 8.5, color: primarygreen),
      tabcards(id: 5, value: 4.5, color: primaryred),
      tabcards(id: 6, value: 8.5, color: primarygreen),
      tabcards(id: 6, value: 9, color: primarygreen),
      tabcards(id: 6, value: 9.5, color: primarygreen),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 400.w,
        //height: 185.h,
        padding: EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Color(0xFFFCF9F3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: 292.w,
              height: 67.19.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 82.41.w,
                    height: 39.19.h,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "عرض التفاصيل",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Color(0xFF10B981),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    width: 209.59.w,
                    height: 67.19.h,
                    child: Text(
                      "نظرة عامة على الحضور",
                      style: TextStyle(
                        color: Color(0xFF091C31),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              width: 292.w,
              height: 272.h,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
                top: 32,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Container(
                width: 292.w,
                //height: 208.h,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF74777D).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceEvenly,
                    maxY: 10,
                    minY: 0,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            '${rod.toY}',
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 2,
                      checkToShowHorizontalLine: (value) => true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Color(0xFF74777D).withOpacity(0.25),
                          strokeWidth: 1,
                        );
                      },
                      drawVerticalLine: false,
                    ),
                    barGroups: Data.map((data) {
                      return BarChartGroupData(
                        x: data.id,
                        barRods: [
                          BarChartRodData(
                            toY: data.value,
                            color: data.color,
                            width: 22.w,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.r),
                              topRight: Radius.circular(6.r),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              width: 292.w,
              height: 19.59.h,
              padding: EdgeInsets.only(right: 8, left: 8.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 27.86.w,
                    height: 19.59.h,
                    child: Text(
                      "الأحد",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF44474D),
                      ),
                    ),
                  ),
                  Container(
                    width: 37.03.w,
                    height: 19.59.h,
                    child: Text(
                      "الاثنين",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF44474D),
                      ),
                    ),
                  ),
                  Container(
                    width: 38.47.w,
                    height: 19.59.h,
                    child: Text(
                      "الثلاثاء",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF44474D),
                      ),
                    ),
                  ),
                  Container(
                    width: 43.92.w,
                    height: 19.59.h,
                    child: Text(
                      "الأربعاء",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF44474D),
                      ),
                    ),
                  ),
                  Container(
                    width: 50.89.w,
                    height: 19.59.h,
                    child: Text(
                      "الخميس",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF44474D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
