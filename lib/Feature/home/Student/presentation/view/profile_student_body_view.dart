import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/AttendanceAndAbsence_profile.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/ContainerStudentprofile.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/information_student_profile_con1.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';

class ProfileStudentBodyView extends StatefulWidget {
  const ProfileStudentBodyView({super.key});

  @override
  State<ProfileStudentBodyView> createState() => _ProfileStudentBodyViewState();
}

class _ProfileStudentBodyViewState extends State<ProfileStudentBodyView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),

      child: SingleChildScrollView(
        child: Column(
          children: [
        
            informationstudentpr(),
            SizedBox(height: 30.sp),
            AttendanceAndAbsence(percentageInt: 66),
            SizedBox(height: 30.sp),
            ContainerStudentprofile(),
             SizedBox(height: 40.sp),
               GestureDetector(
              onTap: () {
             
                    GoRouter.of(context).push(AppRouter.kprofileStudentpage2);
                
                
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 Text(" تابع لرؤية المزيد من المعلومات",style: TextSt.textstyle16.copyWith(color:  kcolorOlive),),

                   SizedBox(width: 12.sp),
                       Icon(
                      
                            Icons.arrow_circle_right_rounded,
                          
                            size: 50.sp,
                            color: kcolorOlive,
                      ),
                      
                    
                    
                    
                ],
              ),
               ),
  SizedBox(height: 80.sp),          

           
          
          ],
        ),
      ),
    );
  }
}
