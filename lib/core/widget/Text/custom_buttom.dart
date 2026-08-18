import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/core/widget/Text/text_style.dart';

class Buttontext extends StatelessWidget {
  Buttontext({
    super.key,
    required this.background,
    required this.textColor,
    this.border,
    required this.text,

    required this.icons,
    required this.borderColor,
    this.width = 1,
    required this.onPressed,
  });
  final Color background;
  final Color textColor;
  final Color borderColor;
  final BorderRadius? border;
  final String text;
  final double? fontsize = 25.sp;
  final IconData icons;
  final double width;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,

      //textDirection: TextDirection.rtl,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: width),

          borderRadius: border ?? BorderRadiusGeometry.circular(12),
        ),
        fixedSize: Size(300.sp, 60.sp),

        backgroundColor: background,
      ),
      icon: Icon(icons, color: textColor, size: fontsize),

      label: Text(text, style: TextSt.textstyle16.copyWith(color: textColor)),
    );
  }
}
