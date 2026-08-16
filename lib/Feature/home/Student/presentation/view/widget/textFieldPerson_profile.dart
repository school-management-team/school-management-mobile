import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class textfieldperson extends StatelessWidget {
  final String text;
  final String texthint;
  const textfieldperson({
    super.key,
    required this.text,
    required this.texthint,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: KcolorGrey.withOpacity(0.7)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.sp),
            borderSide: BorderSide(color: kcolorOlive.withOpacity(0.7)),
          ),
          //  focusColor: kcolorOlive,
          fillColor: kPrimaryColor,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            text,
            style: TextSt.textstyle17.copyWith(color: Colors.black),
          ),
          hint: Text(texthint, style: TextSt.textstyle12),
        ),
      ),
    );
  }
}
