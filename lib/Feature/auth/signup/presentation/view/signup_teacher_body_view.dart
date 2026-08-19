import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/coustumAppBar_teacher.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/textfield_teacher.dart';
import 'package:school/Feature/auth/signup/presentation/view_Models/manger/cubit_Teacher_signup/sign_up_teacher_cubit.dart';
import 'package:school/Feature/auth/signup/presentation/view_Models/signup_teacher_textEditing.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/showotpdialog.dart';
import 'package:school/constant.dart';
import 'package:school/core/function/showloadingDialog.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/custom_buttom.dart';
import 'package:school/core/widget/Text/text_from_field.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SignupTeacherBodyView extends StatefulWidget {
  const SignupTeacherBodyView({super.key});

  @override
  State<SignupTeacherBodyView> createState() => _SignupTeacherBodyViewState();
}

class _SignupTeacherBodyViewState extends State<SignupTeacherBodyView> {
  XFile? selectedFilePath;
  final viewModel = SignupTeacherTextediting();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: ListView(
        children: [
          customAPPTeacher(),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        " معلم ",
                        style: TextSt.textstyle28.copyWith(color: kcolorOlive),
                      ),
                      Text("إنشاء حساب ", style: TextSt.textstyle28),
                    ],
                  ),
                  Text(
                    "يرجى تعبئة كافة الحقول التالية لإتمام عملية",
                    style: TextSt.textstyle14.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " .التسجيل",
                    style: TextSt.textstyle14.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  TextfieldTeacher(formKey: formkey, viewModel: viewModel),
                  SizedBox(height: 16.sp),
                  Text(
                    "السيرة الذاتية / نبذة تعريفية",
                    style: TextSt.textstyle14,
                  ),
                  SizedBox(height: 16.sp),
                  TextFieldStyle(
                    textEditingController: viewModel.cvController,
                    max: 5,
                    hinit: "...تحدث عن خبراتك ومهاراتك الأكاديمية",
                    filledcolor: const Color(0XFFFFFFFF),
                    textAlign: TextAlign.end,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "لا يجب أن يكون الحقل فارغ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 16.sp),
                      GestureDetector(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 80,
                          );

                          if (image != null) {
                            setState(() {
                              selectedFilePath = image;
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: selectedFilePath != null
                              ? EdgeInsets.zero
                              : EdgeInsets.symmetric(
                                  vertical: 30.sp,
                                  horizontal: 16.sp,
                                ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: selectedFilePath != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.file(
                                    File(selectedFilePath!.path),
                                    width: double.infinity,
                                    height: 140.sp,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.file_upload_outlined,
                                      size: 40.sp,
                                      color: const Color(0xFF2E6B4E),
                                    ),
                                    SizedBox(height: 12.sp),
                                    Text(
                                      "رفع صورة السيرة الذاتية أو الشهادات",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.sp),
          BlocConsumer<SignUpTeacherCubit, SignUpTeacherState>(
            listener: (context, state) {
              if (state is SignUpTeacherSuccess) {
                Navigator.of(context, rootNavigator: true).maybePop();
                showOtpDialog(
                  context: context,
                  userEmail: viewModel.emailController.text.trim(),
                );
              } else if (state is SignUpTeacherFailure) {
                Navigator.of(context, rootNavigator: true).maybePop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              } else if (state is SignUpTeacherLoading) {
                showloadingDialog(context);
              }
            },
            builder: (context, state) {
              return Buttontext(
                background: kcolorOlive,
                textColor: Colors.white,
                text: "إكمال التسجيل",
                icons: Icons.arrow_back,
                borderColor: KcolorGrey,
                onPressed: () {
                  if (!formkey.currentState!.validate()) {
                    return;
                  }

                  if (viewModel.selectedStageId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("يرجى اختيار المرحلة")),
                    );
                    return;
                  }

                  if (viewModel.selectedSubjectId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("يرجى اختيار المادة")),
                    );
                    return;
                  }

                  if (selectedFilePath == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("يرجى اختيار الوثيقة القانونية"),
                      ),
                    );
                    return;
                  }

                  context.read<SignUpTeacherCubit>().registerTeacher(
                    email: viewModel.emailController.text,
                    password: viewModel.passwordController.text,
                    passwordConfirmation:
                        viewModel.configePasswordController.text,
                    phone: viewModel.phoneController.text,
                    userName: viewModel.nameController.text,
                    gender: viewModel.genderController.text,
                    birthDate: viewModel.brithdayController.text,
                    stageId: viewModel.selectedStageId!,
                    subjectId: viewModel.selectedSubjectId!,
                    cv: viewModel.cvController.text,
                    legalDocumentPath: selectedFilePath!,
                  );
                },
              );
            },
          ),
          SizedBox(height: 16.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.klogin);
                },
                child: Text(
                  "تسجيل الدخول",
                  style: TextSt.textstyle14.copyWith(color: kcolorOlive),
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
}
