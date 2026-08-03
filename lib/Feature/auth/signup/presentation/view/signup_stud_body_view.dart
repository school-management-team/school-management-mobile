import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/logic/manger/cubit_Student_signup/sign_up_student_cubit.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/CoustumAppBarSignup_stud.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/textfield_Signup_stud.dart';
import 'package:school/Feature/auth/signup/presentation/view_Models/signup_student_textEditing.dart';
import 'package:school/constant.dart';
import 'package:school/core/function/showSuccessDialog.dart';
import 'package:school/core/function/showloadingDialog.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SignupStudBodyView extends StatelessWidget {
  SignupStudBodyView({super.key});
  final viewModel = SignupStudentTextediting();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 18.sp),
      child: ListView(
        children: [
          const CoustumAppBarSignup(),

          SizedBox(height: 33.h),
          TextfieldSignupStud(formKey: formkey),
          SizedBox(height: 30.h),

        

          BlocConsumer<SignUpStudentCubit, SignUpStudentState>(
            listener: (context, state) {
              if (state is SignUpStudentSuccess) {
                showSuccessDialog(context);
                GoRouter.of(context).push(AppRouter.kprofileStudent);
              } else if (state is SignUpStudentFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }else
              if (state is SignUpStudentLoading) {
                  showloadingDialog(context);
              }

            },
            builder: (context, state) {
              
              return TextButton.icon(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    context.read<SignUpStudentCubit>().registerStudent(
                      name: viewModel.nameController.text,
                      fatherName: viewModel.fatherNameController.text,
                      motherName: viewModel.motherNameController.text,
                      birhthDate: viewModel.brithdayController.text,
                      department: viewModel.departmentController.text,
                      grade: viewModel.gradeController.text,
                      phone: viewModel.phoneController.text,
                      password: viewModel.passwordController.text,
                      configepassword: viewModel.configePasswordController.text,
                      email: viewModel.emailController.text,
                    );
                  }
               
                },
                style: TextButton.styleFrom(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12.r),
                  ),
                  fixedSize: Size(300.sp, 55.sp),

                  backgroundColor: kcolorOlive,
                ),
               
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 25.sp),
                label: Text(
                  "  إنشاء حساب",
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
