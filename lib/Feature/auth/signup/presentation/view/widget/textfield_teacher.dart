import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class TextfieldTeacher extends StatefulWidget {
  const TextfieldTeacher({super.key});

  @override
  State<TextfieldTeacher> createState() => _ListView_SignupState();
}

class _ListView_SignupState extends State<TextfieldTeacher> {
  bool isObscure = true;
  bool isObscure2 = true;
  String? gender = 'ذكر';
  final TextEditingController brithdayController = TextEditingController();
  String? selectedSelection;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Text("الاسم بالكامل ", style: TextSt.textstyle14),
          SizedBox(height: 16.h),
          TextFieldStyle(
            filledcolor: Color(0XFFFFFFFF),
            hinit: "أدخل اسمك الثلاثي ",
            textAlign: TextAlign.end,
          ),

          SizedBox(height: 20.sp),
          Text(" المواليد", style: TextSt.textstyle14),
          SizedBox(height: 16.sp),
          TextFieldStyle(
            textEditingController: brithdayController,
            readonly: true,
            filledcolor: Color(0XFFFFFFFF),
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
                  brithdayController.text = fromatDate;
                });
              }
            },
          ),

          SizedBox(height: 20.h),
          Text("  الجنس ", style: TextSt.textstyle14),
          SizedBox(height: 16),

          textfieldgender(),
          SizedBox(height: 20.sp),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(" الصف  ", style: TextSt.textstyle14),
                  SizedBox(height: 16.sp),
                  DropdownMenu<String>(
                    width: 160.sp,
                    hintText: "اختر الصف  ",
                    textStyle: TextSt.textstyle12,
                    textAlign: TextAlign.end,
                    inputDecorationTheme: InputDecorationTheme(
                      fillColor: Colors.white,
                      filled: true,

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),

                    dropdownMenuEntries: ClassesEntries(),

                    onSelected: (String? value) {},
                  ),
                ],
              ),

              Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(" القسم  ", style: TextSt.textstyle14),
                  SizedBox(height: 16.sp),
                  DropdownMenu<String>(
                    width: 160.sp,
                    hintText: "اختر القسم  ",
                    textStyle: TextSt.textstyle12,
                    textAlign: TextAlign.end,
                    inputDecorationTheme: InputDecorationTheme(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),

                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: '1', label: " ابتدائي"),
                      DropdownMenuEntry(value: '2', label: "إعدادي"),
                      DropdownMenuEntry(value: '3', label: "(أدبي)ثانوي"),
                      DropdownMenuEntry(value: '4', label: "(علمي)ثانوي"),
                    ],
                    onSelected: (String? value) {
                      setState(() {
                        selectedSelection = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(" المادة  ", style: TextSt.textstyle14),
              SizedBox(height: 16.sp),
              DropdownMenu<String>(
                width: double.infinity,
                hintText: "اختر  المادة  ",
                textStyle: TextSt.textstyle12,
                textAlign: TextAlign.end,
                inputDecorationTheme: InputDecorationTheme(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),

                dropdownMenuEntries: SubjectEntries(),

                onSelected: (String? value) {},
              ),
            ],
          ),
            SizedBox(height: 20.h),
          Text("البريد الإلكتروني للعمل ", style: TextSt.textstyle14),
          SizedBox(height: 16),
          TextFieldStyle(
            filledcolor: Color(0XFFFFFFFF),
            hinit: " name@school.edu",
            icontext: Icon(
              Icons.email_outlined,
              color: kcolordarkBlue,
            ),
          ),
          SizedBox(height: 20.sp),
          Text(" رقم الهاتف  ", style: TextSt.textstyle14),
          SizedBox(height: 16.sp),
          TextFieldStyle(
            filledcolor: Color(0XFFFFFFFF),
            hinit: " 05XXXXXXXX",
            icontext: Icon(
              Icons.phone_outlined,
              color: kcolordarkBlue,
              size: 25.sp,
            ),
          ),

          SizedBox(height: 20.sp),
          Text(" كلمة المرور ", style: TextSt.textstyle14),
          SizedBox(height: 16.sp),
          textfieldPassword(
            isObscure: isObscure,
            ontap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
          SizedBox(height: 20.sp),
          Text("  تأكيد كلمة المرور ", style: TextSt.textstyle14),
          SizedBox(height: 16.sp),
          textfieldPassword(
            isObscure: isObscure2,
            ontap: () {
              setState(() {
                isObscure2 = !isObscure2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget textfieldPassword({
    required bool isObscure,
    required VoidCallback ontap,
  }) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0XFFC4C6CD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),

          borderSide: BorderSide(color: kcolorOlive),
        ),

        fillColor: Color(0XFFFFFFFF),
        filled: true,
        hintText: " .....",
        prefixIcon: IconButton(
          onPressed: ontap,
          icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
        ),
        suffixIcon: Icon(Icons.lock_outline, color: kcolordarkBlue),
      ),
    );
  }

  Widget textfieldgender() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0XFFC4C6CD)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Text("أنثى"),
              Radio<String>(
                value: "أنثى",
                groupValue: gender,
                activeColor: kcolorOlive,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Text("ذكر"),
              Radio<String>(
                value: "ذكر",
                groupValue: gender,
                activeColor: kcolorOlive,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<DropdownMenuEntry<String>> ClassesEntries() {
    if (selectedSelection == '1') {
      return [
        DropdownMenuEntry(value: 'p1', label: "الصف الأول "),
        DropdownMenuEntry(value: 'p2', label: "الصف الثاني "),
        DropdownMenuEntry(value: 'p3', label: "الصف الثالث "),
        DropdownMenuEntry(value: 'p3', label: "الصف الرابع "),
        DropdownMenuEntry(value: 'p3', label: "الصف الخامس "),
        DropdownMenuEntry(value: 'p3', label: "الصف السادس "),
      ];
    } else if (selectedSelection == '2') {
      return [
        DropdownMenuEntry(value: 'm1', label: "الصف السابع"),
        DropdownMenuEntry(value: 'm2', label: "الصف الثامن"),
        DropdownMenuEntry(value: 'm3', label: "الصف التاسع"),
      ];
    } else if (selectedSelection == '3') {
      return [
        DropdownMenuEntry(value: 'h1', label: "الأول ثانوي"),
        DropdownMenuEntry(value: 'h2', label: "الثاني ثانوي"),
        DropdownMenuEntry(value: 'h3', label: "الثالث ثانوي (بكالوريا)"),
      ];
    } else if (selectedSelection == '4') {
      return [
        DropdownMenuEntry(value: 'd1', label: "الأول ثانوي"),
        DropdownMenuEntry(value: 'd2', label: "الثاني ثانوي"),
        DropdownMenuEntry(value: 'd3', label: "الثالث ثانوي (بكالوريا)"),
      ];
    } else {
      return [];
    }
  }

  List<DropdownMenuEntry<String>> SubjectEntries() {
    if (selectedSelection == '1') {
      return [
        const DropdownMenuEntry(value: 'p1', label: "اللغة العربية"),
        const DropdownMenuEntry(value: 'p2', label: "الرياضيات"),
        const DropdownMenuEntry(value: 'p3', label: "العلوم "),
        const DropdownMenuEntry(value: 'p4', label: "اللغة الإنجليزية "),
        const DropdownMenuEntry(value: 'p5', label: "التربية الدينية "),
        const DropdownMenuEntry(value: 'p6', label: "الاجتماعيات"),
      ];
    } else if (selectedSelection == '2') {
      return [
        const DropdownMenuEntry(value: 'm1', label: "اللغة العربية"),
        const DropdownMenuEntry(value: 'm2', label: "الرياضيات"),
        const DropdownMenuEntry(value: 'm3', label: "الفيزياء والكيمياء"),
        const DropdownMenuEntry(value: 'm4', label: "العلوم العامة"),
        const DropdownMenuEntry(value: 'm5', label: "اللغة الإنجليزية"),
        const DropdownMenuEntry(value: 'm6', label: "الاجتماعيات"),
        const DropdownMenuEntry(value: 'm7', label: "التربية الدينية"),
        const DropdownMenuEntry(
          value: 'm8',
          label: "اللغة الفرنسية او الروسية",
        ),
      ];
    } else if (selectedSelection == '3') {
      return [
        const DropdownMenuEntry(value: 'h5', label: "فلسفة "),
        const DropdownMenuEntry(value: 'h5', label: "التاريخ  "),
        const DropdownMenuEntry(value: 'h6', label: "الجغرافيا  "),
        const DropdownMenuEntry(value: 'h7', label: "اللغة العربية "),
        const DropdownMenuEntry(value: 'h8', label: "اللغة الإنجليزية "),
        const DropdownMenuEntry(value: 'h9', label: "التربية الدينية "),
        const DropdownMenuEntry(
          value: 'h10',
          label: "اللغة الفرنسية او الروسية",
        ),
      ];
    } else if (selectedSelection == '4') {
      return [
        const DropdownMenuEntry(value: 'h1', label: "الرياضيات  "),
        const DropdownMenuEntry(value: 'h2', label: "الفيزياء  "),
        const DropdownMenuEntry(value: 'h3', label: "الكيمياء  "),
        const DropdownMenuEntry(value: 'h4', label: "العلوم والأحياء "),
        const DropdownMenuEntry(value: 'h7', label: "اللغة العربية "),
        const DropdownMenuEntry(value: 'h8', label: "اللغة الإنجليزية "),
        const DropdownMenuEntry(value: 'h9', label: "التربية الدينية "),
        const DropdownMenuEntry(
          value: 'h10',
          label: "اللغة الفرنسية او الروسية",
        ),
      ];
    }
    return [];
  }
}
