import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/coustumAppBar_teacher.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/requeriedPassword.dart';
import 'package:school/constant.dart';
import 'package:school/core/function/showSuccessDialog.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/custom_buttom.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SignupAdvisorBodyView extends StatefulWidget {
  const SignupAdvisorBodyView({super.key});

  @override
  State<SignupAdvisorBodyView> createState() => _SignupAdvisorBodyViewState();
}

class _SignupAdvisorBodyViewState extends State<SignupAdvisorBodyView> {
  final formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final birthdayController = TextEditingController();
  final phoneController = TextEditingController();
  final qualificationController = TextEditingController();
  final specializationController = TextEditingController();
  final bioController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String gender = 'ذكر';
  String? selectedQualification;
  String? selectedFilePath;

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  bool isLength = false;
  bool hasUppercase = false;
  bool hasNumber = false;

  @override
  void dispose() {
    nameController.dispose();
    birthdayController.dispose();
    phoneController.dispose();
    qualificationController.dispose();
    specializationController.dispose();
    bioController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: ListView(
        children: [
          const customAPPTeacher(),
          SizedBox(height: 16.sp),
          const Divider(color: Color(0XFFC4C6CD), thickness: 0),
          SizedBox(height: 16.sp),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.school_outlined,
                size: 350.sp,
                color: Colors.grey[200],
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Header Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          " موجه تربوي ",
                          style: TextSt.textstyle28.copyWith(color: kcolorOlive),
                        ),
                        Text("حساب ", style: TextSt.textstyle28),
                      ],
                    ),
                    SizedBox(height: 4.sp),
                    Text(
                      "انضم إلى منظومة التطوير الأكاديمي والتعليمي",
                      style: TextSt.textstyle14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20.sp),

                    // --- Basic Information Card ---
                    _buildSectionContainer(
                      children: [
                        // Name Field
                        Text("الاسم الثلاثي", style: TextSt.textstyle14),
                        SizedBox(height: 8.h),
                        TextFieldStyle(
                          textEditingController: nameController,
                          keyboardytype: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "أدخل اسمك الكامل كما في الهوية";
                            }
                            return null;
                          },
                          filledcolor: Colors.white,
                          hinit: "أدخل اسمك الكامل كما في الهوية",
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(height: 16.sp),

                        // Date of Birth & Gender Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gender
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("الجنس", style: TextSt.textstyle14),
                                  SizedBox(height: 8.h),
                                  _buildGenderSelection(),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.sp),
                            // Date of Birth
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("تاريخ الميلاد", style: TextSt.textstyle14),
                                  SizedBox(height: 8.h),
                                  TextFieldStyle(
                                    keyboardytype: TextInputType.datetime,
                                    textEditingController: birthdayController,
                                    readonly: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "حدد تاريخ الميلاد";
                                      }
                                      return null;
                                    },
                                    filledcolor: Colors.white,
                                    hinit: "mm/dd/yyyy",
                                    onPressed: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(1985, 1, 1),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2010),
                                        builder: (context, child) {
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                              colorScheme: const ColorScheme.light(
                                                primary: kcolorOlive,
                                                onPrimary: KcolorGrey,
                                              ),
                                            ),
                                            child: child!,
                                          );
                                        },
                                      );
                                      if (pickedDate != null) {
                                        String formatDate =
                                            "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}";
                                        setState(() {
                                          birthdayController.text = formatDate;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.sp),

                        // Phone Field
                        Text("رقم الهاتف", style: TextSt.textstyle14),
                        SizedBox(height: 8.h),
                        TextFieldStyle(
                          keyboardytype: TextInputType.phone,
                          textEditingController: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "أدخل رقم الهاتف";
                            }
                            return null;
                          },
                          filledcolor: Colors.white,
                          hinit: "05xxxxxxxx",
                          icontext: Icon(
                            Icons.phone_iphone_outlined,
                            color: kcolordarkBlue,
                            size: 25.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.sp),

                    // --- Professional Credentials Card ---
                    _buildSectionContainer(
                      children: [
                        // Academic Qualification Dropdown
                        Text("المؤهل العلمي", style: TextSt.textstyle14),
                        SizedBox(height: 8.h),
                        DropdownButtonFormField<String>(
                          value: selectedQualification,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(color: kcolorOlive),
                            ),
                          ),
                          hint: Align(
                            alignment: Alignment.centerRight,
                            child: Text("اختر المؤهل", style: TextSt.textstyle12),
                          ),
                          alignment: Alignment.centerRight,
                          items: const [
                            DropdownMenuItem(
                              value: 'بكالوريوس',
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('بكالوريوس'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'ماجستير',
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('ماجستير'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'دكتوراه',
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('دكتوراه'),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedQualification = value;
                              qualificationController.text = value ?? '';
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "يرجى اختيار المؤهل العلمي";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.sp),

                        // Specialization Field
                        Text("التخصص", style: TextSt.textstyle14),
                        SizedBox(height: 8.h),
                        TextFieldStyle(
                          textEditingController: specializationController,
                          keyboardytype: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "أدخل التخصص";
                            }
                            return null;
                          },
                          filledcolor: Colors.white,
                          hinit: "مثال: رياضيات، لغة عربية...",
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(height: 16.sp),

                        // Bio Field
                        Text("نبذة تعريفية", style: TextSt.textstyle14),
                        SizedBox(height: 8.h),
                        TextFieldStyle(
                          max: 3,
                          textEditingController: bioController,
                          filledcolor: Colors.white,
                          hinit: "اكتب ملخصاً قصيراً عن مسيرتك التربوية...",
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(height: 16.sp),

                        // File Upload
                        Text("رفع المؤهلات العلمية / السيرة الذاتية", style: TextSt.textstyle14),
                        SizedBox(height: 8.h),
                        GestureDetector(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf', 'doc', 'docx', 'png', 'jpg', 'jpeg'],
                            );

                            if (result != null && result.files.single.path != null) {
                              setState(() {
                                selectedFilePath = result.files.single.path;
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 24.sp,
                              horizontal: 16.sp,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: Colors.grey.shade400,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload_file_outlined,
                                  size: 40.sp,
                                  color: kcolorOlive,
                                ),
                                SizedBox(height: 8.sp),
                                Text(
                                  selectedFilePath != null
                                      ? "تم اختيار: ${selectedFilePath!.split(Platform.pathSeparator).last}"
                                      : "اضغط لرفع الملفات (PDF, Word)",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: selectedFilePath != null ? kcolorOlive : Colors.grey[600],
                                    fontWeight: selectedFilePath != null ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.sp),

                    // --- Security Card ---
                    _buildSectionContainer(
                      children: [
                        // Password Field
                        Text("كلمة المرور", style: TextSt.textstyle14),
                        SizedBox(height: 8.h),
                        _buildPasswordField(
                          controller: passwordController,
                          isObscure: isObscurePassword,
                          onToggleVisibility: () {
                            setState(() {
                              isObscurePassword = !isObscurePassword;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              final text = value ?? '';
                              isLength = text.length >= 8;
                              hasUppercase = text.contains(RegExp(r'[A-Z]'));
                              hasNumber = text.contains(RegExp(r'[0-9]'));
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "لا يجب ان يكون الحقل فارغ";
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
                        ),
                        SizedBox(height: 16.sp),

                        // Confirm Password Field
                        Text("تأكيد كلمة المرور", style: TextSt.textstyle14),
                        SizedBox(height: 8.h),
                        _buildPasswordField(
                          controller: confirmPasswordController,
                          isObscure: isObscureConfirmPassword,
                          onToggleVisibility: () {
                            setState(() {
                              isObscureConfirmPassword = !isObscureConfirmPassword;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "لا يجب ان يكون الحقل فارغ";
                            }
                            if (value != passwordController.text) {
                              return "كلمة السر غير متطابقة";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.sp),

                        // Password requirements widget
                        RequeriedPassword(
                          password: passwordController.text,
                          isLength: isLength,
                          hasUppercase: hasUppercase,
                          hasNumber: hasNumber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.sp),

          // Submit Button
          Buttontext(
            background: kcolorOlive,
            textColor: Colors.white,
            text: "إنشاء حساب",
            icons: Icons.arrow_back,
            borderColor: KcolorGrey,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                showSuccessDialog(context);
                GoRouter.of(context).push(AppRouter.kadvisordash);
              }
            },
          ),
          SizedBox(height: 16.sp),

          // Already have an account? Login
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.klogin);
                },
                child: Text(
                  "تسجيل الدخول",
                  style: TextSt.textstyle14.copyWith(
                    color: kcolorOlive,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text("لديك حساب بالفعل؟ ", style: TextSt.textstyle14),
            ],
          ),
          SizedBox(height: 40.sp),
        ],
      ),
    );
  }

  Widget _buildSectionContainer({required List<Widget> children}) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: children,
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0XFFC4C6CD)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("أنثى", style: TextStyle(fontSize: 13.sp)),
              Radio<String>(
                value: "أنثى",
                groupValue: gender,
                activeColor: kcolorOlive,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("ذكر", style: TextStyle(fontSize: 13.sp)),
              Radio<String>(
                value: "ذكر",
                groupValue: gender,
                activeColor: kcolorOlive,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool isObscure,
    required VoidCallback onToggleVisibility,
    void Function(String?)? onChanged,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isObscure,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0XFFC4C6CD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: kcolorOlive),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: "********",
        prefixIcon: IconButton(
          onPressed: onToggleVisibility,
          icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
        ),
        suffixIcon: const Icon(Icons.lock_outline, color: kcolordarkBlue),
      ),
    );
  }
}
