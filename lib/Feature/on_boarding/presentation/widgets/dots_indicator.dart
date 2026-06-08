import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';

/// مؤشر النقاط المشترك لجميع صفحات الأونبوردينغ.
///
/// [currentIndex] — ترتيب الصفحة الحالية (يبدأ من 0).
/// [total]        — العدد الكلي للنقاط.
class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.currentIndex,
    required this.total,
  });

  final int currentIndex;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (i) {
        final bool isActive = i == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          width: isActive ? 28.w : 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: isActive ? kcolorOlive : const Color(0xFFE5E2DC),
            borderRadius: BorderRadius.circular(4.r),
          ),
        );
      }),
    );
  }
}
