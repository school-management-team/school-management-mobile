import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


import 'package:school/constant.dart';


class GradeCircle extends StatelessWidget {
  final double grade;
   final String text;

  const GradeCircle({
    super.key,
    required this.grade, required this.text,
  });

  Color getGradeColor() {
    if (grade >= 85) {
      return  kcolorOlive; 
    } else if (grade >= 70) {
      return Colors.green;
    } else if (grade >= 50) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = getGradeColor();

  
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 5,
            spreadRadius: 3,
          ),
        ],
      ),
      child: CircularPercentIndicator(
        radius: 70.0,
        lineWidth: 14.0,
        percent: grade.clamp(0, 100) / 100,
        animation: true,
        animationDuration: 1500,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: color,
        backgroundColor: Colors.grey.shade200,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${grade.toStringAsFixed(0)}%",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
             Text(
                 text, 
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}