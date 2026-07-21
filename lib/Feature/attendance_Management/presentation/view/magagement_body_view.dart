import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/attendance_Management/presentation/view/widget/StatusSelector.dart';
import 'package:school/Feature/attendance_Management/presentation/view/widget/container_inform.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';

import 'package:school/core/widget/Text/text_style.dart';

class MagagementBodyView extends StatefulWidget {
  const MagagementBodyView({super.key});

  @override
  State<MagagementBodyView> createState() => _MagagementBodyViewState();
}

class _MagagementBodyViewState extends State<MagagementBodyView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerInform(),
          SizedBox(height: 24.sp),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 200.sp,
                height: 60.sp,
                decoration: BoxDecoration(
                  color: kcolorOlive,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.white30),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Text(
                        "تسجيل الكل حاضر",
                        style: TextSt.textstyle14.copyWith(color: Colors.white),
                      ),
                      Icon(Icons.check, size: 25.sp, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 60.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Container(
                width: double.infinity,
                
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.black12.withOpacity(0.05)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 18.sp,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("الحالة", style: TextSt.textstyle24),
                          SizedBox(width: 55.sp),
                          Text("الطالب", style: TextSt.textstyle24),
                        ],
                      ),
                      SizedBox(height: 18.sp),
                      Container(
                        height:MediaQuery.sizeOf(context).height*0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.2.sp,
                            child: ListView(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.sp,
                                vertical: 30.sp,
                              ),
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(height: 16.sp),
                                Column(
                                  children: [
                                  Row(
                                      children: [
                                        StatusSelector(),
                                        Column(
                                          children: [
                                          
                                         
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            AssestData.studentDashboard,
                                          ),
                                          
                                        ), 
                                          Text("ليلى خالد"),
                                        ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.sp),
                                    SizedBox(
                                      height: 2.sp,
                                      width: 400.sp,
                                      child: Divider(
                                        color: Colors.grey[100],
                                        thickness: 0,
                                      ),
                                    ),
                                    SizedBox(height: 10.sp),
                                  Row(
                                      children: [
                                        StatusSelector(),
                                        Column(
                                          children: [
                                          
                                         
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            AssestData.studentDashboard,
                                          ),
                                          
                                        ), 
                                          Text("محمد علي"),
                                        ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.sp),
                                    SizedBox(
                                      height: 2.sp,
                                      width: 400.sp,
                                      child: Divider(
                                        color: Colors.grey[100],
                                        thickness: 0,
                                      ),
                                    ),
                                    SizedBox(height: 16.sp),
                                    Row(
                                      children: [
                                        StatusSelector(),
                                        Column(
                                          children: [
                                          
                                         
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            AssestData.studentDashboard,
                                          ),
                                          
                                        ), 
                                          Text("سارةأحمد"),
                                        ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
