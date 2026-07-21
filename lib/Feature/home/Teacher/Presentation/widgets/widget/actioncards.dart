import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/core/assest.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
      physics: NeverScrollableScrollPhysics(),
      children: [
        buildgridview(
          icon: Image.asset(AssestData.grade),
          label: 'رصد درجة',
          ontap: () {},
          background: Color(0xFF006C49).withOpacity(0.1),
        ),
        buildgridview(
          icon: Image.asset(AssestData.newtask),
          label: 'واجب جديد',
          ontap: () {},
          background: Color(0xFF000000).withOpacity(0.05),
        ),
        buildgridview(
          icon: Image.asset(AssestData.sendmessage),
          label: 'إرسال إعلان',
          ontap: () {},
          background: Color(0xFFC4C6CD).withOpacity(0.2),
        ),
      ],
    );
  }

  Widget buildgridview({
    required Image icon,
    required String label,
    required VoidCallback ontap,
    required Color background,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 163.w,
        height: 109.59.h,
        padding: EdgeInsets.only(
          bottom: 16,
          top: 16,
          left: 43.48,
          right: 45.47,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Color(0xFFF6F3ED),

          boxShadow: [
            BoxShadow(
              color: Color(0xFFC4C6CD).withOpacity(0.2),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9999.r),
                color: background,
              ),
              child: icon,
            ),
            SizedBox(height: 7.h),
            Container(
              width: 77.05.w,
              height: 20.59.h,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1C1C18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
