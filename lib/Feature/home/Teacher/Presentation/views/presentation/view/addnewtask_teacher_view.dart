import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/tasktostudcubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/addnewtask_teacher_body.dart';

import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';

class addnewtaskteacherview extends StatelessWidget {
  const addnewtaskteacherview({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewTaskCubit(),

      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64.h,
          backgroundColor: Color(0xFFFFFFFF),
          shadowColor: Colors.black.withOpacity(0.4),
          elevation: 0.7,

          // shadowColor: Colors.black.withOpacity(0.08),
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //width: 186.77.w,
                  //height: 32.h,
                  child: Container(
                    height: 50.h,
                    width: 37.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9999.r),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_outlined),
                      color: Color(0xFF10B981),
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                Container(
                  // width: 142.77.w,
                  height: 28.h,
                  child: Text(
                    "مدارس القمة الأكاديمية",
                    style: TextStyle(
                      fontSize: 27.59.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                SizedBox(width: 3.w),

                Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999.r),
                    image: DecorationImage(
                      image: AssetImage(AssestData.profile),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          leading: null,
        ),
        /*  bottomNavigationBar: Container(
        width: 390.w,
        height: 102.59.h,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border.all(
            color: Color(0xFFC4C6CD).withOpacity(0.1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Color(0XFF071A2F).withOpacity(0.05),
              offset: Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: Container(
          width: 358.w,
          height: 70.59.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: ElevatedButton(
            onPressed: state is NewTaskLoading ? null : publishtask,
            child: state is NewTaskLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          "نشر في الفصل",
                          style: TextSt.textstyle24.copyWith(
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(Icons.send, color: Color(0xFFFFFFFF), size: 24),
                    ],
                  ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF10B981),
              padding: EdgeInsets.symmetric(vertical: 17.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12.r),
              ),
            ),
          ),
        ),
      ),*/
        // backgroundColor: Color(0xFFFFFFFF),
        body: WillPopScope(
          child: SafeArea(child: addnewtaskteacher()),
          onWillPop: () async {
            return true;
          },
        ),
      ),
    );
  }
}
