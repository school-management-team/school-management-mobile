import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';

class PendingApprovals extends StatelessWidget {
  /*final String type;
  final String name;
  final String type1;
  final String name1;*/
  final List<Map<String, dynamic>> approvals;
  const PendingApprovals({
    super.key,
    /* required this.type,
    required this.name,
    required this.type1,
    required this.name1,*/
    required this.approvals,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 400.w,
        // height: 400.h,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Color(0xFFFCF9F3),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 308.w,
              height: 33.59.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 9.w),
                      SizedBox(
                        height: 34.h,
                        // width: 137.31,
                        child: Text(
                          "موافقات معلقة",
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Color(0xFF091C31),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 17.03.w,
                    height: 20.h,
                    padding: EdgeInsets.only(
                      left: 6,
                      right: 6,
                      top: 2,
                      bottom: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFDAD6),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "${approvals.length}",
                      style: TextStyle(
                        color: Color(0xFF93000A),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: List.generate(approvals.length, (index) {
                  final item = approvals[index];
                  return Column(
                    children: [
                      Container(
                        width: 308.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 292.w,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xFFC4C6CD).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                    activeColor: Color(0xFF10B981),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item['name'],
                                              style: TextStyle(
                                                color: Color(0xFF091C31),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4.h),

                                        Text(
                                          item['type'],
                                          style: TextStyle(
                                            color: Color(0xFF44474D),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Container(
                                    width: 34.w,
                                    height: 36.h,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2A1700),
                                      borderRadius: BorderRadius.circular(
                                        9999.r,
                                      ),
                                    ),
                                    child: Center(
                                      child: ImageIcon(
                                        AssetImage(AssestData.calender),
                                        color: Color(0xFFB87500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (index != approvals.length - 1) SizedBox(height: 10.h),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
