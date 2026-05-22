
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart' show TextSt;

class customAPPTeacher extends StatelessWidget {
  const customAPPTeacher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
       Text("           NEO\n ACADEMIC",style: TextSt.textstyle24.copyWith(fontWeight: FontWeight.w800)),
       Icon(Icons.school,color: kcolorOlive,size: 35.sp),
    Spacer(),
        Container(
          width: 180.sp,
          height: 80.sp,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(
              color: kcolordarkBlue,
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("العودة لاختيار \n            الدور ",style: TextSt.textstyle14),
              IconButton(onPressed: () {
                GoRouter.of(context).push(AppRouter.kroleselection);
                
              }, icon: Icon(Icons.arrow_forward,size: 25.sp,))
            ],
          ),
    
        ),
     
    
      ]
    );
  }
}
