import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/requeriedPassword.dart';
import 'package:school/Feature/auth/signup/presentation/view_Models/signup_student_textEditing.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class TextfieldSignupStud extends StatefulWidget {
  const TextfieldSignupStud({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<TextfieldSignupStud> createState() => _ListView_SignupState();
}

class _ListView_SignupState extends State<TextfieldSignupStud> {
  bool isObscure = true;
  bool isObscure2 = true;
  String? gender = 'ذكر';
  final viewModel = SignupStudentTextediting();
  DateTime? selectedDate;
  String? selectedSelection;

  bool islength = false;
  bool hasuppercase = false;
  bool hasspecialchar = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8.sp),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            Text("الاسم الثلاثي ", style: TextSt.textstyle14),
            SizedBox(height: 16.h),
            TextFieldStyle(
              textEditingController: viewModel.nameController,
              keyboardytype: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("لا بجب ان يكون الحقل فارغ");
                }
                return null;
              },
              filledcolor: Color(0XFFFFFFFF),
              hinit: "اسم الطالب ",
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 20.h),
            Text(" اسم الأب ", style: TextSt.textstyle14),
            SizedBox(height: 16.h),
            TextFieldStyle(
              keyboardytype: TextInputType.text,
              textEditingController: viewModel.fatherNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("لا بجب ان يكون الحقل فارغ");
                }
                return null;
              },
              filledcolor: Color(0XFFFFFFFF),
              hinit: "اسم الأب",
              textAlign: TextAlign.end,
            ),

            SizedBox(height: 20),
            Text(" اسم الأم  ", style: TextSt.textstyle14),
            SizedBox(height: 16),
            TextFieldStyle(
              keyboardytype: TextInputType.text,
              textEditingController: viewModel.motherNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("لا بجب ان يكون الحقل فارغ");
                }
                return null;
              },
              filledcolor: Color(0XFFFFFFFF),
              hinit: " اسم الأم",
              textAlign: TextAlign.end,
            ),

            SizedBox(height: 20.h),
            Text("  الجنس ", style: TextSt.textstyle14),
            SizedBox(height: 16),

            textfieldgender(),
            SizedBox(height: 20.sp),
            Text("  تاريخ الميلاد ", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),
            TextFieldStyle(
              keyboardytype: TextInputType.datetime,
              textEditingController: viewModel.brithdayController,

              validator: (value) {
                  if (value == null || value.isEmpty) {
                  return ("لا بجب ان يكون الحقل فارغ");
                }

                if ((selectedDate != null)) {
                  int age = DateTime.now().year - selectedDate!.year;
                  if (age < 7) {
                    return "   عذراً يجب أن يكون عمر الطالب ٧ ومافوق ";
                  }
                }
                return null;
              },
              readonly: true,
              filledcolor: Color(0XFFFFFFFF),
              hinit: " mm/dd/yyyy",
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2008, 1, 1),
                  lastDate: DateTime(2020, 12, 31),
                  initialDate: DateTime(2015, 1, 1),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: kcolorOlive,
                          onPrimary: KcolorGrey,
                        ),
                        datePickerTheme: DatePickerThemeData(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.sp),
                            side: BorderSide(color: kcolorOlive, width: 3.sp),
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (pickedDate != null) {
                  String formatDate =
                      "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}";

                  int birthYear = pickedDate.year;

                  String calculatedDepartment = '';
                  String calculatedGradeText = '';
                  if (birthYear >= 2015 && birthYear <= 2020) {
                    calculatedDepartment = 'ابتدائي';
                  } else if (birthYear >= 2012 && birthYear <= 2014) {
                    calculatedDepartment = 'إعدادي';
                  } else if (birthYear >= 2008 && birthYear <= 2011) {
                    calculatedDepartment = 'ثانوي';
                  }

                  if (birthYear == 2020) {
                    calculatedGradeText = 'الصف الأول';
                  } else if (birthYear == 2019) {
                    calculatedGradeText = 'الصف الثاني';
                  } else if (birthYear == 2018) {
                    calculatedGradeText = 'الصف الثالث';
                  } else if (birthYear == 2017) {
                    calculatedGradeText = 'الصف الرابع';
                  } else if (birthYear == 2016) {
                    calculatedGradeText = 'الصف الخامس';
                  } else if (birthYear == 2015) {
                    calculatedGradeText = 'الصف السادس';
                  } else if (birthYear == 2014) {
                    calculatedGradeText = 'الصف السابع';
                  } else if (birthYear == 2013) {
                    calculatedGradeText = 'الصف الثامن';
                  } else if (birthYear == 2012) {
                    calculatedGradeText = 'الصف التاسع';
                  } else if (birthYear == 2011) {
                    calculatedGradeText = 'الأول ثانوي';
                  } else if (birthYear == 2010) {
                    calculatedGradeText = 'الثاني ثانوي';
                  } else if (birthYear >= 2008 && birthYear <= 2009) {
                    calculatedGradeText = 'الثالث ثانوي (بكالوريا)';
                  }

                  setState(() {
                    selectedDate = pickedDate;
                    viewModel.brithdayController.text = formatDate;

                    selectedSelection = calculatedDepartment;
                    viewModel.departmentController.text = calculatedDepartment;

                    viewModel.gradeController.text = calculatedGradeText;
                  });
                }
              },
            ),

            SizedBox(height: 20.sp),
            Text(" القسم  ", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),
            DropdownMenu<String>(
              width: double.infinity,
              hintText: "اختر القسم  ",
              controller: viewModel.departmentController,
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
                DropdownMenuEntry(value: '3', label: "ثانوي"),
              ],
              onSelected: (String? value) {
                setState(() {
                  selectedSelection = value;
                });
              },
            ),

            SizedBox(height: 20.sp),
            Text(" الصف  ", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),
            DropdownMenu<String>(
              width: double.infinity,
              hintText: "اختر الصف  ",
              controller: viewModel.gradeController,
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
            SizedBox(height: 20.h),
            Text("البريد الإلكتروني للعمل ", style: TextSt.textstyle14),
            SizedBox(height: 16),
            TextFieldStyle(
              keyboardytype: TextInputType.emailAddress,
              textEditingController: viewModel.emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("لا بجب ان يكون الحقل فارغ");
                }
                return null;
              },
              filledcolor: Color(0XFFFFFFFF),
              hinit: " name@school.edu",
              icontext: Icon(Icons.email_outlined, color: kcolordarkBlue),
            ),
            SizedBox(height: 20.sp),
            Text(" رقم الهاتف  ", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),
            TextFieldStyle(
              keyboardytype: TextInputType.phone,
              textEditingController: viewModel.phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("لا بجب ان يكون الحقل فارغ");
                }
                return null;
              },
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
              textEditingController: viewModel.passwordController,
              onchange: (value) {
                setState(() {
                  final text = value ?? '';
                  islength = text.length >= 8;
                  hasuppercase = text.contains(RegExp(r'[A-Z]'));
                  hasspecialchar = text.contains(RegExp(r'[0-9]'));
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "لا يجب ان يكون الحقل فارغ";
                }

                if (value.length < 8) {
                  return " يجب أن تكون كلمة المرور 8 أحرف على الأقل";
                }

                if (!value.contains(RegExp(r'[A-Z]'))) {
                  return " يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل";
                }

                if (!value.contains(RegExp(r'[0-9]'))) {
                  return "يجب أن تحتوي كلمة المرور على رقم واحد على الأقل";
                }

                return null;
              },
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
              textEditingController: viewModel.configePasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("لا بجب ان يكون الحقل فارغ");
                }
                if (value != viewModel.passwordController.text) {
                  return "كلمة السر غير متطابقة";
                }
                return null;
              },
              isObscure: isObscure2,
              ontap: () {
                setState(() {
                  isObscure2 = !isObscure2;
                });
              },
            ),
            SizedBox(height: 12.sp),
            RequeriedPassword(
              password: viewModel.passwordController.text,
              isLength: islength,
              hasUppercase: hasuppercase,
              hasNumber: hasspecialchar,
            ),
          ],
        ),
      ),
    );
  }

  Widget textfieldPassword({
    required bool isObscure,
    required VoidCallback ontap,
    final TextEditingController? textEditingController,

    final void Function(String?)? onchange,
    final String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      onChanged: (value) {
        if (onchange != null) {
          onchange(value);
        }
      },
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
    } else {
      return [];
    }
  }
}
