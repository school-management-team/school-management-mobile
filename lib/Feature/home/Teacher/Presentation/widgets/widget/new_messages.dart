import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';

class newmessages extends StatelessWidget {
  final String numofmessages;
  final String source;

  const newmessages({
    super.key,
    required this.numofmessages,
    required this.source,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      clipBehavior: Clip.antiAlias,
      //height: 200.h,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Color(0xFFC4C6CD).withOpacity(0.01),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Color(0xFF000000).withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 294.w,
                  height: 32.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 126.38.w,
                        height: 32.h,
                        child: Text(
                          "رسائل جديدة",
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Color(0xFF1C1C18),
                          ),
                        ),
                      ),
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          // color: Color(0xFFEBE8E2),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Image.asset(AssestData.newM),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  width: 308.w,
                  height: 57.59.h,
                  child: Text(
                    numofmessages,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 48.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  height: 26.59.h,
                  width: 294.w,
                  padding: EdgeInsets.only(bottom: 0.59),
                  child: Text(
                    source,
                    style: TextStyle(
                      color: Color(0xFF44474D),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 19.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
