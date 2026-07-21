import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/Feature/attendance_Management/presentation/view/magagement_body_view.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/bottomnavigator/Bottomnvigationhome.dart';
import 'package:school/core/widget/bottomnavigator/bottomNavigatoionBar.dart';

class ManagementView extends StatefulWidget {
  const ManagementView({super.key});

  @override
  State<ManagementView> createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0.5,
        actionsPadding: EdgeInsets.symmetric(horizontal: 20.sp),

        backgroundColor:kPrimaryColor,
        leading: CircleAvatar(
          radius: 30.sp,
          backgroundImage: AssetImage(AssestData.studentDashboard),
          backgroundColor: Colors.white,
        ),
        title: Text(
          "تحضير الطلاب",
          style: TextSt.textstyle28.copyWith(
            color: kcolorgreen,
            fontWeight: FontWeight.w900,
            fontSize: 28.sp,
            fontFamily: 'normal',
          ),
        ),
        centerTitle: true,
        actions: [
        /*  Icon(
            Icons.notifications_none_rounded,
            size: 35.sp,
            color: KcolorGrey.withOpacity(0.8),
          ),*/
          Lottie.asset(AssestData.notification,width: 55.sp)
        ],
      ),  bottomNavigationBar:   
           Bottomnvigationhome(select: 1),
      body: 
      SafeArea(child:
       
      MagagementBodyView()
      ),
    );
  }
}