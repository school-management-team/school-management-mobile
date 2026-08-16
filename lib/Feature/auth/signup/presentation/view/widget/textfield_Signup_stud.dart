import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:school/Feature/auth/signup/presentation/view/widget/requeriedPassword.dart';
import 'package:school/Feature/auth/signup/presentation/view_Models/signup_student_textEditing.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class TextfieldSignupStud extends StatefulWidget {
  const TextfieldSignupStud({
    super.key,
    required this.formKey,
    required this.viewModel,
  });

  final GlobalKey<FormState> formKey;
  final SignupStudentTextediting viewModel;

  @override
  State<TextfieldSignupStud> createState() => _TextfieldSignupStudState();
}

class _TextfieldSignupStudState extends State<TextfieldSignupStud> {
  bool isObscure = true;
  bool isObscure2 = true;

  String gender = 'ذكر';

  DateTime? selectedDate;

  String? selectedDepartment;

  bool islength = false;
  bool hasuppercase = false;
  bool hasspecialchar = false;

  SignupStudentTextediting get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();

    viewModel.genderController.text = gender;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("الاسم الثلاثي", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

            TextFieldStyle(
              textEditingController: viewModel.nameController,
              keyboardytype: TextInputType.text,
              validator: requiredValidator,
              filledcolor: const Color(0XFFFFFFFF),
              hinit: "اسم الطالب",
              textAlign: TextAlign.end,
            ),

            SizedBox(height: 20.h),

            Text("اسم الأب", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

            TextFieldStyle(
              keyboardytype: TextInputType.text,
              textEditingController: viewModel.fatherNameController,
              validator: requiredValidator,
              filledcolor: const Color(0XFFFFFFFF),
              hinit: "اسم الأب",
              textAlign: TextAlign.end,
            ),

            SizedBox(height: 20.h),

            Text("اسم الأم", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

            TextFieldStyle(
              keyboardytype: TextInputType.text,
              textEditingController: viewModel.motherNameController,
              validator: requiredValidator,
              filledcolor: const Color(0XFFFFFFFF),
              hinit: "اسم الأم",
              textAlign: TextAlign.end,
            ),

            SizedBox(height: 20.h),

            Text("الجنس", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

            textfieldgender(),

            SizedBox(height: 20.h),

            Text("تاريخ الميلاد", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

            TextFieldStyle(
              keyboardytype: TextInputType.datetime,
              textEditingController: viewModel.brithdayController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "لا يجب أن يكون الحقل فارغ";
                }

                if (selectedDate != null) {
                  final today = DateTime.now();

                  int age = today.year - selectedDate!.year;

                  if (today.month < selectedDate!.month ||
                      (today.month == selectedDate!.month &&
                          today.day < selectedDate!.day)) {
                    age--;
                  }

                  if (age < 7) {
                    return "عذراً يجب أن يكون عمر الطالب ٧ وما فوق";
                  }
                }

                return null;
              },

              readonly: true,

              filledcolor: const Color(0XFFFFFFFF),

              hinit: "mm/dd/yyyy",

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
                  setState(() {
                    selectedDate = pickedDate;

                    viewModel.brithdayController.text =
                        "${pickedDate.year}-"
                        "${pickedDate.month.toString().padLeft(2, '0')}-"
                        "${pickedDate.day.toString().padLeft(2, '0')}";

                    if (pickedDate.year >= 2015 && pickedDate.year <= 2020) {
                      selectedDepartment = '1';
                      viewModel.departmentController.text = 'ابتدائي';
                    } else if (pickedDate.year >= 2012 &&
                        pickedDate.year <= 2014) {
                      selectedDepartment = '2';
                      viewModel.departmentController.text = 'إعدادي';
                    } else if (pickedDate.year >= 2008 &&
                        pickedDate.year <= 2011) {
                      selectedDepartment = '3';
                      viewModel.departmentController.text = 'ثانوي';
                    }

                    setClassFromBirthYear(pickedDate.year);
                  });
                }
              },
            ),

            SizedBox(height: 20.h),

            Text("القسم", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

            DropdownMenu<String>(
              width: double.infinity,

              hintText: "اختر القسم",

              controller: viewModel.departmentController,
              inputDecorationTheme: InputDecorationTheme(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),

              dropdownMenuEntries: const [
                DropdownMenuEntry(value: '1', label: "ابتدائي"),
                DropdownMenuEntry(value: '2', label: "إعدادي"),
                DropdownMenuEntry(value: '3', label: "ثانوي"),
              ],

              onSelected: (value) {
                setState(() {
                  selectedDepartment = value;

                  if (value == '1') {
                    viewModel.departmentController.text = 'ابتدائي';
                  } else if (value == '2') {
                    viewModel.departmentController.text = 'إعدادي';
                  } else if (value == '3') {
                    viewModel.departmentController.text = 'ثانوي';
                  }

                  viewModel.gradeController.clear();
                  viewModel.selectedClassId = null;
                });
              },
            ),

            SizedBox(height: 20.h),

            Text("الصف", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

            DropdownMenu<String>(
              width: double.infinity,

              hintText: "اختر الصف",

              controller: viewModel.gradeController,

              inputDecorationTheme: InputDecorationTheme(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),

              dropdownMenuEntries: classesEntries(),

              onSelected: (value) {
                if (value == null) return;

                setState(() {
                  viewModel.gradeController.text = getClassLabel(value);

                  viewModel.selectedClassId = int.parse(value);
                });

                debugPrint("CLASS ID = ${viewModel.selectedClassId}");
              },
            ),

            SizedBox(height: 20.h),

            Text("البريد الإلكتروني للعمل", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

            TextFieldStyle(
              keyboardytype: TextInputType.emailAddress,

              textEditingController: viewModel.emailController,

              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "لا يجب أن يكون الحقل فارغ";
                }

                if (!value.contains('@')) {
                  return "أدخل بريد إلكتروني صحيح";
                }

                return null;
              },

              filledcolor: const Color(0XFFFFFFFF),

              hinit: "name@school.edu",

              icontext: Icon(Icons.email_outlined, color: kcolordarkBlue),
            ),

            SizedBox(height: 20.h),

            Text("رقم الهاتف", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

            TextFieldStyle(
              keyboardytype: TextInputType.phone,

              textEditingController: viewModel.phoneController,

              validator:  (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال رقم الهاتف';
                }

                final RegExp phoneRegex = RegExp(r'^09[0-9]{8}$');

                if (!phoneRegex.hasMatch(value)) {
                  return 'رقم الهاتف يجب أن يبدأ بـ 09 ويتكون من 10 أرقام';
                }

                return null;
              },

              filledcolor: const Color(0XFFFFFFFF),

              hinit: "05XXXXXXXX",

              icontext: Icon(
                Icons.phone_outlined,
                color: kcolordarkBlue,
                size: 25.sp,
              ),
              
              
            ),

            SizedBox(height: 20.h),

            Text("كلمة المرور", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

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
                  return "لا يجب أن يكون الحقل فارغ";
                }

                if (value.length < 8) {
                  return "يجب أن تكون كلمة المرور 8 أحرف على الأقل";
                }

                if (!value.contains(RegExp(r'[A-Z]'))) {
                  return "يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل";
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

            SizedBox(height: 20.h),

            Text("تأكيد كلمة المرور", style: TextSt.textstyle14),

            SizedBox(height: 16.h),

            textfieldPassword(
              textEditingController: viewModel.configePasswordController,

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "لا يجب أن يكون الحقل فارغ";
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

            SizedBox(height: 12.h),

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

  String? requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "لا يجب أن يكون الحقل فارغ";
    }

    return null;
  }

  Widget textfieldgender() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0XFFC4C6CD)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Row(
            children: [
              const Text("أنثى"),

              Radio<String>(
                value: "أنثى",
                groupValue: gender,
                activeColor: kcolorOlive,

                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    gender = value;

                    viewModel.genderController.text = value;
                  });
                },
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              const Text("ذكر"),

              Radio<String>(
                value: "ذكر",
                groupValue: gender,
                activeColor: kcolorOlive,

                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    gender = value;

                    viewModel.genderController.text = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget textfieldPassword({
    required bool isObscure,
    required VoidCallback ontap,
    TextEditingController? textEditingController,
    void Function(String?)? onchange,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: textEditingController,

      validator: validator,

      onChanged: (value) {
        onchange?.call(value);
      },

      obscureText: isObscure,

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0XFFC4C6CD)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: kcolorOlive),
        ),

        fillColor: const Color(0XFFFFFFFF),

        filled: true,

        hintText: ".....",

        prefixIcon: IconButton(
          onPressed: ontap,

          icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
        ),

        suffixIcon: Icon(Icons.lock_outline, color: kcolordarkBlue),
      ),
    );
  }

  void setClassFromBirthYear(int year) {
    int? classId;

    if (year == 2020) {
      classId = 1;
    } else if (year == 2019) {
      classId = 2;
    } else if (year == 2018) {
      classId = 3;
    } else if (year == 2017) {
      classId = 4;
    } else if (year == 2016) {
      classId = 5;
    } else if (year == 2015) {
      classId = 6;
    } else if (year == 2014) {
      classId = 7;
    } else if (year == 2013) {
      classId = 8;
    } else if (year == 2012) {
      classId = 9;
    } else if (year == 2011) {
      classId = 10;
    } else if (year == 2010) {
      classId = 11;
    } else if (year == 2009) {
      classId = 12;
    } else if (year == 2008) {
      classId = 13;
    }
    if (classId != null) {
      viewModel.selectedClassId = classId;

      viewModel.gradeController.text = getClassLabel(classId.toString());
    }
  }

  List<DropdownMenuEntry<String>> classesEntries() {
    if (selectedDepartment == '1') {
      return const [
        DropdownMenuEntry(value: '1', label: "الصف الأول"),
        DropdownMenuEntry(value: '2', label: "الصف الثاني"),
        DropdownMenuEntry(value: '3', label: "الصف الثالث"),
        DropdownMenuEntry(value: '4', label: "الصف الرابع"),
        DropdownMenuEntry(value: '5', label: "الصف الخامس"),
        DropdownMenuEntry(value: '6', label: "الصف السادس"),
      ];
    }

    if (selectedDepartment == '2') {
      return const [
        DropdownMenuEntry(value: '7', label: "الصف السابع"),
        DropdownMenuEntry(value: '8', label: "الصف الثامن"),
        DropdownMenuEntry(value: '9', label: "الصف التاسع"),
      ];
    }

    if (selectedDepartment == '3') {
      return const [
        DropdownMenuEntry(value: '10', label: "الأول ثانوي"),
        DropdownMenuEntry(value: '11', label: "الثاني ثانوي"),
        DropdownMenuEntry(value: '12', label: "الثالث ثانوي (بكالوريا)"),
      ];
    }

    return [];
  }

  String getClassLabel(String id) {
    switch (id) {
      case '1':
        return "الصف الأول";
      case '2':
        return "الصف الثاني";
      case '3':
        return "الصف الثالث";
      case '4':
        return "الصف الرابع";
      case '5':
        return "الصف الخامس";
      case '6':
        return "الصف السادس";
      case '7':
        return "الصف السابع";
      case '8':
        return "الصف الثامن";
      case '9':
        return "الصف التاسع";
      case '10':
        return "الأول ثانوي";
      case '11':
        return "الثاني ثانوي";
      case '12':
        return "الثالث ثانوي (بكالوريا)";
      default:
        return "";
    }
  }
}
