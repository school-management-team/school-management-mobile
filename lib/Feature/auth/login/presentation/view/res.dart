import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/res.dart';
import 'package:school/constant.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/router_app.dart';


class ResetPasswordBody extends StatefulWidget {
  final String email;
  const ResetPasswordBody({super.key, required this.email});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocProvider(
        create: (context) => ResetPasswordCubit(
          dioConsumer: DioConsumer( Dio()),
        ),
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
              GoRouter.of(context).go(AppRouter.klogin);
            } else if (state is ResetPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Container(
              color: const Color(0xFFFFFFFF),
              height: 883.99.h,
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 390.w,
                        height: 33.59.h,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Academia Neo",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            const Icon(
                              Icons.account_balance,
                              color: kcolorOlive,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Container(
                        width: 326.w,
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,decoration: BoxDecoration(
                                color: const Color(0xFFF6F3ED),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.lock_reset_rounded,
                                  size: 23.33,
                                  color: Color(0xFF74777D),
                                ),
                              ),
                            ),
                            SizedBox(height: 17.h),
                            Text(
                              "تعيين كلمة مرور جديدة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1D1B20),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              "الرجاء إدخال رمز التحقق المرسل إلى بريدك وكلمة المرور الجديدة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14.sp,
                                height: 1.5,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "رمز التحقق (Code)",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF1C1C18),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              width: 326.w,
                              height: 55.59.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFCF9F3),
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: const Color(0xFFC4C6CD).withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                controller: codeController,
                                textAlign: TextAlign.right,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'يرجى إدخال رمز التحقق';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "123456",
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF74777D).withOpacity(0.5),
                                    fontSize: 14.sp,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "كلمة المرور الجديدة",
                              style: TextStyle(
                                fontSize: 14.sp,color: const Color(0xFF1C1C18),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              width: 326.w,
                              height: 55.59.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFCF9F3),
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: const Color(0xFFC4C6CD).withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                textAlign: TextAlign.right,
                                validator: (value) {
                                  if (value == null || value.trim().length < 6) {
                                    return 'كلمة المرور يجب أن تكون 6 محارف على الأقل';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "****",
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF74777D).withOpacity(0.5),
                                    fontSize: 14.sp,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "تأكيد كلمة المرور",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF1C1C18),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              width: 326.w,
                              height: 55.59.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFCF9F3),
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: const Color(0xFFC4C6CD).withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                obscureText: true,
                                textAlign: TextAlign.right,
                                validator: (value) {
                                  if (value != passwordController.text) {
                                    return 'كلمتا المرور غير متطابقتين';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "****",
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF74777D).withOpacity(0.5),
                                    fontSize: 14.sp,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                                ),
                              ),
                            ),
                            SizedBox(height: 35.h),
                            SizedBox(
                              width: 326.w,
                              height: 63.59.h,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: kcolorOlive,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                onPressed: state is ResetPasswordLoading
                                    ? null
                                    : () {
                                        if (formKey.currentState!.validate()) {
                                          context.read<ResetPasswordCubit>().resetPassword(
                                                email: widget.email,
                                                code: codeController.text.trim(),
                                                password: passwordController.text.trim(),
                                                passwordConfirmation: confirmPasswordController.text.trim(),
                                              );
                                        }
                                      },
                                child: state is ResetPasswordLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "تغيير كلمة المرور",
                                        style: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}