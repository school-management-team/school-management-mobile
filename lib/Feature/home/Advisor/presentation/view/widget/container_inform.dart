import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class ContainerInform extends StatefulWidget {
  const ContainerInform({super.key});

  @override
  State<ContainerInform> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ContainerInform> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("إدارة الحضور \n   والانصراف", style: TextSt.textstyle28),
            SizedBox(height: 12.sp),
            Text("سجل حضور الطلاب اليومي", style: TextSt.textstyle14),
            SizedBox(height: 12.h),
            DropdownMenu<String>(
              width: double.infinity,

              initialSelection: "ريم برهوم ",
              inputDecorationTheme: InputDecorationTheme(
                fillColor: kPrimaryColor,
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

            SizedBox(height: 16.sp),
            TextFieldStyle(
              textEditingController: controller,
              readonly: true,
              filledcolor: kPrimaryColor,
              hinit: " mm/dd/yyyy",
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1960),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: kcolorOlive,
                          onPrimary: KcolorGrey,
                        ),
                        datePickerTheme: DatePickerThemeData(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16.sp),
                            side: BorderSide(color: kcolorOlive, width: 3.sp),
                          ),
                        ),
                      ),

                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  String fromatDate =
                      "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padRight(2, '0')}/${pickedDate.year}";

                  setState(() {
                    controller.text = fromatDate;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
