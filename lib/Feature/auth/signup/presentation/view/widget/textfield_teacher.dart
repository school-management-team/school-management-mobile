import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/requeriedPassword.dart';
import 'package:school/Feature/auth/signup/presentation/view_Models/signup_teacher_textEditing.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class TextfieldTeacher extends StatefulWidget {
  const TextfieldTeacher({
    super.key,
    required this.formKey,
    required this.viewModel,
  });

  final GlobalKey<FormState> formKey;
  final SignupTeacherTextediting viewModel;

  @override
  State<TextfieldTeacher> createState() => _TextfieldTeacherState();
}

class _TextfieldTeacherState extends State<TextfieldTeacher> {
  bool isObscure = true;
  bool isObscure2 = true;

  String gender = "ذكر";

  bool islength = false;
  bool hasuppercase = false;
  bool hasspecialchar = false;

  DateTime? selectedDate;

  SignupTeacherTextediting get viewModel => widget.viewModel;
  @override
  void initState() {
    super.initState();
    viewModel.genderController.text = "ذكر";
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
            Text("الاسم بالكامل", style: TextSt.textstyle14),
            SizedBox(height: 16.h),
            TextFieldStyle(
              textEditingController: viewModel.nameController,
              keyboardytype: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "لا يجب أن يكون الحقل فارغ";
                }
                return null;
              },
              filledcolor: const Color(0XFFFFFFFF),
              hinit: "أدخل اسمك الثلاثي",
              textAlign: TextAlign.end,
            ),

            SizedBox(height: 20.sp),

            Text("المواليد", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),

            TextFieldStyle(
              keyboardytype: TextInputType.datetime,
              textEditingController: viewModel.brithdayController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "لا يجب أن يكون الحقل فارغ";
                }
                return null;
              },
              readonly: true,
              filledcolor: const Color(0XFFFFFFFF),
              hinit: "yyyy-mm-dd",
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2011),
                  initialDate: DateTime(2000),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: kcolorOlive,
                          onPrimary: KcolorGrey,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (pickedDate != null) {
                  final formatDate =
                      "${pickedDate.year}-"
                      "${pickedDate.month.toString().padLeft(2, '0')}-"
                      "${pickedDate.day.toString().padLeft(2, '0')}";

                  setState(() {
                    selectedDate = pickedDate;
                    viewModel.brithdayController.text = formatDate;
                  });
                }
              },
            ),

            SizedBox(height: 20.sp),

            Text("الجنس", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),

            textfieldgender(),

            SizedBox(height: 20.sp),
            Text("المرحلة", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),

            DropdownMenu<int>(
              width: double.infinity,
              hintText: "اختر المرحلة",
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
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: "ابتدائي"),
                DropdownMenuEntry(value: 2, label: "إعدادي"),
                DropdownMenuEntry(value: 3, label: "ثانوي علمي"),
                DropdownMenuEntry(value: 4, label: "ثانوي أدبي"),
              ],
              onSelected: (value) {
                setState(() {
                  viewModel.selectedStageId = value;
                  viewModel.selectedSubjectId = null;
                  viewModel.subjectController.clear();
                });
              },
            ),

            SizedBox(height: 20.sp),

            Text("المادة", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),

            DropdownMenu<int>(
              width: double.infinity,
              hintText: "اختر المادة",
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
              dropdownMenuEntries: subjectEntries(),
              onSelected: (value) {
                setState(() {
                  viewModel.selectedSubjectId = value;
                  viewModel.subjectController.text = value.toString();
                });
              },
            ),

            SizedBox(height: 20.sp),

            Text("البريد الإلكتروني للعمل", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),

            TextFieldStyle(
              keyboardytype: TextInputType.emailAddress,
              textEditingController: viewModel.emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "لا يجب أن يكون الحقل فارغ";
                }
                return null;
              },
              filledcolor: const Color(0XFFFFFFFF),
              hinit: "name@school.edu",
              icontext: Icon(Icons.email_outlined, color: kcolordarkBlue),
            ),

            SizedBox(height: 20.sp),

            Text("رقم الهاتف", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),

            TextFieldStyle(
              keyboardytype: TextInputType.phone,
              textEditingController: viewModel.phoneController,
              validator: (value) {
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

            SizedBox(height: 20.sp),

            Text("كلمة المرور", style: TextSt.textstyle14),
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

            SizedBox(height: 20.sp),

            Text("تأكيد كلمة المرور", style: TextSt.textstyle14),
            SizedBox(height: 16.sp),

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
    TextEditingController? textEditingController,
    void Function(String?)? onchange,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      obscureText: isObscure,
      onChanged: (value) {
        onchange?.call(value);
      },
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
                  setState(() {
                    gender = value!;
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
                  setState(() {
                    gender = value!;
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

  List<DropdownMenuEntry<int>> subjectEntries() {
    if (viewModel.selectedStageId == 1) {
      return const [
        DropdownMenuEntry(value: 1, label: "رياضيات"),
        DropdownMenuEntry(value: 4, label: "أحياء"),
        DropdownMenuEntry(value: 5, label: "اللغة العربية"),
        DropdownMenuEntry(value: 6, label: "اللغة الإنجليزية"),
      ];
    }

    if (viewModel.selectedStageId == 2) {
      return const [
        DropdownMenuEntry(value: 1, label: "رياضيات"),
        DropdownMenuEntry(value: 4, label: "أحياء"),
        DropdownMenuEntry(value: 5, label: "اللغة العربية"),
        DropdownMenuEntry(value: 6, label: "اللغة الإنجليزية"),
      ];
    }

    if (viewModel.selectedStageId == 3) {
      return const [
        DropdownMenuEntry(value: 1, label: "رياضيات"),
        DropdownMenuEntry(value: 2, label: "فيزياء"),
        DropdownMenuEntry(value: 3, label: "كيمياء"),
        DropdownMenuEntry(value: 4, label: "أحياء"),
        DropdownMenuEntry(value: 5, label: "اللغة العربية"),
        DropdownMenuEntry(value: 6, label: "اللغة الإنجليزية"),
      ];
    }

    if (viewModel.selectedStageId == 4) {
      return const [
        DropdownMenuEntry(value: 5, label: "اللغة العربية"),
        DropdownMenuEntry(value: 6, label: "اللغة الإنجليزية"),
        DropdownMenuEntry(value: 7, label: "التاريخ"),
        DropdownMenuEntry(value: 8, label: "الجغرافيا"),
      ];
    }

    return [];
  }

  int? getStageId() {
    return viewModel.selectedStageId;
  }

  int? getSubjectId() {
    return viewModel.selectedSubjectId;
  }

  String getGender() {
    return gender;
  }
}
