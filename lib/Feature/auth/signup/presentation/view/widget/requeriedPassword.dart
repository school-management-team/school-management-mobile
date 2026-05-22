
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class requeriedPassword extends StatefulWidget {
  const requeriedPassword({
    super.key,
  });

  @override
  State<requeriedPassword> createState() => _requeriedPasswordState();
}

class _requeriedPasswordState extends State<requeriedPassword> {
   bool islenghth=false;
  bool hasuppercase=false;
  bool hasspecialchar=false;
  @override
  Widget build(BuildContext context) {
    return Padding(padding:  EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black12, width: 1),
        color: Color(0Xff44474D).withOpacity(0.1),
      ),
    
      height: 170.sp,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
    
          children: [
            Text(
              " :متطلبات كلمة المرور",
              style: TextSt.textstyle16.copyWith(color: Color(0XFF1C1C18)),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 12.h),

            buildrequirementRow(
             
                  " 8 أحرف على الأقل",
                  islenghth,() => setState(() {
                    islenghth=! islenghth;
                  }),
              
            ),
            SizedBox(height: 8.h),
    
           buildrequirementRow(  
                  "حرف كبير واحد على الأقل",
                  hasuppercase ,()=>
                  setState(() {
                    hasuppercase=!hasuppercase;
                  })),
        
            SizedBox(height: 8.h),
    
           buildrequirementRow(
                  "رقم واحد على الأقل أو رمز خاص",
                hasspecialchar,() => 
                setState(() {
                  hasspecialchar=!hasspecialchar;
                }))
             
          ],
        ),
      ),
      
    ),);
  }
}
Widget buildrequirementRow(String text, bool ischecked,VoidCallback ontap){
  
  return GestureDetector(
    onTap: ontap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(text,style: TextSt.textstyle14.copyWith(color:ischecked?kcolorOlive:KcolorGrey),
                  textAlign: TextAlign.right,),
                   Icon(  ischecked?Icons.check_circle
                   :Icons.circle_outlined, 
                   color: ischecked?kcolorOlive:KcolorGrey,
                   size: 16.sp),
      ],
    ),
  );
}