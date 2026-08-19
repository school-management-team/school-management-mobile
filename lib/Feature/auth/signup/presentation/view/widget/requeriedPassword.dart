import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class RequeriedPassword extends StatelessWidget {
  const RequeriedPassword({
    super.key,
    required this.password,
    required this.isLength,
    required this.hasUppercase,
    required this.hasNumber,
  });

  final String password;
  final bool isLength;
  final bool hasUppercase;
  final bool hasNumber;

  @override
  Widget build(BuildContext context) {
    final bool isNotEmpty = password.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      child: Container(
        height: 170.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.black12),
          color: const Color(0XFF44474D).withOpacity(0.1),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                ": متطلبات كلمة المرور",
                style: TextSt.textstyle16.copyWith(
                
                ),
              ),
              SizedBox(height: 12.h),

              buildRequirementRow(
                "8 أحرف على الأقل",
                isLength,
                isNotEmpty && !isLength,
              ),

              SizedBox(height: 8.h),

              buildRequirementRow(
                "حرف كبير واحد على الأقل",
                hasUppercase,
                isNotEmpty && !hasUppercase,
              ),

              SizedBox(height: 8.h),

              buildRequirementRow(
                "رقم واحد على الأقل أو رمز خاص",
                hasNumber,
                isNotEmpty && !hasNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRequirementRow(String text, bool isChecked, bool isError) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: TextSt.textstyle14.copyWith(
            color: isChecked
                ? kcolorOlive
                : isError
                ? const Color.fromARGB(255, 211, 42, 42)
                : KcolorGrey,
          ),
        ),
        SizedBox(width: 6.w),
        Icon(
          isChecked ? Icons.check_circle : Icons.circle_outlined,
          color: isChecked
              ? kcolorOlive
              : isError
              ? const Color.fromARGB(255, 211, 42, 42)
              : KcolorGrey,
          size: 18.sp,
        ),
      ],
    );
  }
}
