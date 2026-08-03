

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';
Widget buildContactItem(String name, String role, String imageUrl, bool isOnline) {
  return Container(
    
    margin: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
    decoration: BoxDecoration(
       color: Colors.white,
                borderRadius: BorderRadius.circular(12.sp),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(4, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
  
    child: Padding(
      padding:  EdgeInsets.all(25.sp),
      child: Row(
        children: [
         
          Container(
                height: 40.sp,
            width: 40.sp,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 34, 68, 95),
              
                borderRadius: BorderRadius.circular(24.sp),
        
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              
            child: Icon(Icons.person_outline, color: Colors.white,size: 25.sp,)),
          SizedBox(width: 6.sp),
          Container(
            height: 40.sp,
            width: 40.sp,
            decoration: BoxDecoration(
              
              color: kPrimaryColor,
              
                borderRadius: BorderRadius.circular(24.sp),
               boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              
              child: 
          Icon(Icons.chat_bubble_outline, color: kcolorOlive,size: 25.sp,),
          ),
          Spacer(),
          
          
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(name, style: TextSt.textstyle16),
            Text(role, style: TextSt.textstyle12.copyWith(color: kcolorgreen)),
          ]),
          
          SizedBox(width: 12.sp),
          
          
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.sp),
                 boxShadow: [
                  BoxShadow(
                    color: Colors.black38.withOpacity(0.15),
                    offset: const Offset(3, 3),
                    blurRadius: 2,
                  ),
                ],
              ),
              
                child: CircleAvatar(radius: 30.sp, backgroundImage: AssetImage(imageUrl,),)),
              Positioned(
                right: 0, bottom: 0,
                child: Container(
                  width: 14.sp, height: 14.sp,
                  decoration: BoxDecoration(
                    color: isOnline ? Colors.green : Colors.grey, 
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}