import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class GradeCard extends StatelessWidget {
  final String subjectName;
  final String subTitle;
  final String grade;
  final String gpa;
  final double progress;
  final IconData icon;

  const GradeCard({
    super.key,
    required this.subjectName,
    required this.subTitle,
    required this.grade,
    required this.gpa,
    required this.progress,
    required this.icon,
  });



  Color getGradeColor() {
    if (progress >= 0.8) {
   
      return kcolorOlive;
    } else if (progress >= 0.5) {
    
      return Colors.orange;
    } else {
     
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = getGradeColor();

   
    final double safeProgress =
        progress.clamp(0.0, 1.0);

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.sp,
        horizontal: 12.sp,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16.sp,
        horizontal: 16.sp,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.sp,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        children: [

      
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [

              Text(
                grade,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: color,
                ),
              ),

              Row(
                children: [

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [
                      Text(
                        subjectName,
                        style: TextSt.textstyle16,
                      ),

                      SizedBox(height: 6.sp),

                      Text(
                        subTitle,
                        style: TextSt.textstyle12,
                      ),
                    ],
                  ),

                  SizedBox(width: 12.sp),

                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 12.sp),


          Row(
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: [

              Text(
                gpa,
                style: TextSt.textstyle12,
              ),

              const Spacer(),

              Text(
                "التقدم ${(safeProgress * 100).toInt()}%",
                style: TextSt.textstyle12,
              ),
            ],
          ),
  
          SizedBox(height: 6.sp),

 ClipRRect(
            borderRadius:
                BorderRadius.circular(10.sp),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: LinearProgressIndicator(
                value: safeProgress,
                color: color,
                backgroundColor: Colors.grey[200],
                minHeight: 8.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}