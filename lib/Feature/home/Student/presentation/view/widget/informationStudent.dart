import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';

class ContainerStudentDash extends StatelessWidget {
  const ContainerStudentDash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.sp,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: KcolorGrey.withOpacity(0.2)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: AssetImage(AssestData.studentDashboard),
                      backgroundColor: kPrimaryColor,
                    ),
                    Positioned(
                      right: 5.w,
                      top: 50.h,
                      child: CircleAvatar(
                        radius: 15.r,
                        child: Image.asset(
                          AssestData.trueCircle,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),

                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("ريم برهوم ", style: TextSt.textstyle28),
                    Text(
                      "الصف الثامن - القسم المتقدم",
                      style: TextSt.textstyle17,
                    ),
                    Text(" :تبديل الملف", style: TextSt.textstyle14),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            DropdownMenu<String>(
              width: double.infinity,

              initialSelection: "ريم برهوم ",
              inputDecorationTheme: InputDecorationTheme(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),

              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: '1',
                  label: "   (ريم برهوم (الصف الثامن",
                ),
                DropdownMenuEntry(
                  value: '2',
                  label: "  سارة أحمد (الصف الثامن)",
                ),
              ],
              onSelected: (String? value) {},
            ),
          ],
        ),
      ),
    );
  }
}
