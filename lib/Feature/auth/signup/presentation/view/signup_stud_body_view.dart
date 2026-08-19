import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:school/Feature/auth/signup/presentation/view_Models/manger/cubit_Student_signup/sign_up_student_cubit.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/CoustumAppBarSignup_stud.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/textfield_Signup_stud.dart';
import 'package:school/Feature/auth/signup/presentation/view_Models/signup_student_textEditing.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/showotpdialog.dart';

import 'package:school/constant.dart';
import 'package:school/core/function/showloadingDialog.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SignupStudBodyView extends StatefulWidget {
  const SignupStudBodyView({super.key});

  @override
  State<SignupStudBodyView> createState() => _SignupStudBodyViewState();
}

class _SignupStudBodyViewState extends State<SignupStudBodyView> {
  final viewModel = SignupStudentTextediting();
  final formkey = GlobalKey<FormState>();
  bool loadingShown = false;

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _dismissLoadingDialog() {
    if (loadingShown) {
      Navigator.of(context, rootNavigator: true).pop();
      loadingShown = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.sp),
      child: ListView(
        children: [
          const CoustumAppBarSignup(),
          SizedBox(height: 33.h),
          TextfieldSignupStud(formKey: formkey, viewModel: viewModel),
          SizedBox(height: 30.h),
          BlocConsumer<SignUpStudentCubit, SignUpStudentState>(
            listener: (context, state) {
              if (state is SignUpStudentLoading) {
                if (!loadingShown) {
                  loadingShown = true;
                  showloadingDialog(context);
                }
              } else if (state is SignUpStudentSuccess) {
                _dismissLoadingDialog();

                showOtpDialog(
                  context: context,
                  userEmail: viewModel.emailController.text.trim(),
                );
              } else if (state is SignUpStudentFailure) {
                _dismissLoadingDialog();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return TextButton.icon(
                onPressed: state is SignUpStudentLoading
                    ? null
                    : () {
                        if (!formkey.currentState!.validate()) {
                          debugPrint("VALIDATION FAILED");
                          return;
                        }
                        debugPrint("VALIDATION PASSED");

                        final classId = viewModel.selectedClassId;

                        if (classId == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("يرجى اختيار الصف")),
                          );
                          return;
                        }

                        context.read<SignUpStudentCubit>().registerStudent(
                          userName: viewModel.nameController.text.trim(),
                          fatherName: viewModel.fatherNameController.text
                              .trim(),
                          motherName: viewModel.motherNameController.text
                              .trim(),
                          birthDate: viewModel.brithdayController.text.trim(),
                          department: viewModel.departmentController.text
                              .trim(),
                          gender: viewModel.genderController.text.trim(),
                          phone: viewModel.phoneController.text.trim(),
                          password: viewModel.passwordController.text,
                          passwordConfirmation:
                              viewModel.configePasswordController.text,
                          email: viewModel.emailController.text.trim(),
                          classId: classId,
                        );
                      },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  fixedSize: Size(300.sp, 55.sp),
                  backgroundColor: kcolorOlive,
                ),
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 25.sp),
                label: Text(
                  "إنشاء حساب",
                  style: TextSt.textstyle16.copyWith(color: Colors.white),
                ),
              );
            },
          ),
          SizedBox(height: 33.h),
        ],
      ),
    );
  }
}
