import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/questionbankcubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/questiont_repo.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/QuestionBank_body.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/assignmentsandtasks_body.dart';

import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigationTeacher.dart';

class questionbankview extends StatelessWidget {
  const questionbankview({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(QuestRepo()),
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
        ),

        bottomNavigationBar: BottomnavigatoionTeacher(select: 3),
        backgroundColor: Color(0xFFFFFFFF),
        body: SafeArea(child: questionbankbody()),
      ),
    );
  }
}
