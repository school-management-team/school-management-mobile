// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/core/widget/Text/text_style.dart';

class containerRoles extends StatelessWidget {
  const containerRoles({
    super.key,
    required this.text,
    required this.image,
    required this.textmain,
    required this.text2,
    required this.ontap,
  });
  final String textmain;
  final String text;
  final String text2;
  final String image;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420.w,
      height: 300.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -80.h,
            right: -90.w,
            child: Container(
              width: 200.w,
              height: 230.h,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFF4F5F78).withOpacity(0.1),
              ),
              // child:    Image.asset(image ,width: 50,),
            ),
          ),
          Positioned(
            top: 33.h,
            right: 18.w,
            child: Image.asset(image, width: 58.sp),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 110),
                Text(textmain, style: TextSt.textstyle28.copyWith(color: Colors.black)),

                Text(text, style: TextSt.textstyle17.copyWith(color: Colors.black)),
                Text(text2, style: TextSt.textstyle17.copyWith(color: Colors.black)),
              ],
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: IconButton(
              onPressed: ontap,
              icon: Icon(Icons.arrow_back, color: Color(0Xff74777D), size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
