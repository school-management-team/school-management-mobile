import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/auth/signup/presentation/view/widget/textfield_login.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/LoginCubit.dart';
import 'package:school/constant.dart';
import 'package:school/core/api/Dio_consumer.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';

class LoginBodyView extends StatefulWidget {
  const LoginBodyView({super.key});

  @override
  State<LoginBodyView> createState() => _LoginBodyViewState();
}

class _LoginBodyViewState extends State<LoginBodyView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(DioConsumer(Dio())),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم تسجيل الدخول بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
            GoRouter.of(context).go(AppRouter.kteacherdash);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(AssestData.background, fit: BoxFit.cover),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white.withOpacity(0.85),
                    border: Border(
                      top: BorderSide(color: kcolorOlive, width: 5.h),
                    ),
                  ),
                  child: Form(
                    key: formkey,
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 24.h,
                            horizontal: 20.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: Colors.grey.withOpacity(
                                        0.2,
                                      ),
                                      child: Icon(
                                        Icons.school,
                                        color: kcolorOlive,
                                        size: 28.sp,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      "تسجيل الدخول",
                                      style: TextStyle(
                                        fontSize: 30.sp,
                                        color: const Color(0xFF091C31),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      "مرحبا بك مجددا بالحرم الجامعي الرقمي ",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        color: KcolorGrey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 30.h),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "البريد الإلكتروني أو اسم المستخدم ",
                                        style: TextSt.textstyle14.copyWith(
                                          color: const Color(0xFF091C31),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    TextFieldLogin(
                                      controller: emailController,
                                      hintText: "ادخل هويتك الأكاديمية",
                                      suffixIcon: Icons.account_circle_outlined,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال البريد الإلكتروني ';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 16.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "نسيت كلمة المرور؟",
                                            style: TextSt.textstyle14.copyWith(
                                              color: kcolorOlive,
                                              fontSize: 12.sp,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Text(
                                          "كلمة المرور",
                                          style: TextSt.textstyle14.copyWith(
                                            color: const Color(0xFF091C31),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                    TextFieldLogin(
                                      controller: passwordController,
                                      hintText: ".........",
                                      isPassword: true,
                                      suffixIcon: Icons.lock_outline,
                                      prefixIcon: Icons.visibility_off_outlined,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال كلمة المرور';
                                        }
                                        return null;
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "تذكرني على هذا الجهاز",
                                          style: TextSt.textstyle14.copyWith(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Checkbox(
                                          value: rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              rememberMe = value ?? false;
                                            });
                                          },
                                          activeColor: kcolorOlive,
                                          checkColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              4.r,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 24.h),
                                    ElevatedButton(
                                      onPressed: state is LoginLoading
                                          ? null
                                          : () {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                context
                                                    .read<LoginCubit>()
                                                    .login(
                                                      email: emailController
                                                          .text
                                                          .trim(),
                                                      password:
                                                          passwordController
                                                              .text,
                                                    );
                                              }
                                            },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kcolorOlive,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 17.h,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                        ),
                                      ),
                                      child: state is LoginLoading
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.login_outlined,
                                                  color: Colors.white,
                                                  size: 20.r,
                                                ),
                                                SizedBox(width: 8.w),
                                                Text(
                                                  "دخول",
                                                  style: TextSt.textstyle16
                                                      .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ],
                                            ),
                                    ),
                                    SizedBox(height: 35.h),
                                    Row(
                                      children: [
                                        const Expanded(
                                          child: Divider(
                                            color: Color(0xFFC4C6CD),
                                            thickness: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.h,
                                          ),
                                          child: Text(
                                            "أو الدخول عبر",
                                            style: TextSt.textstyle14.copyWith(
                                              color: KcolorGrey,
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                          child: Divider(
                                            color: Color(0xFFC4C6CD),
                                            thickness: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 24.h),

                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 42.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              border: Border.all(
                                                color: const Color(0xFFC4C6CD),
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              child: Image.asset(
                                                AssestData.microsoft,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: Container(
                                            height: 42.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              border: Border.all(
                                                color: const Color(0xFFC4C6CD),
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              child: Image.asset(
                                                AssestData.google,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 35.h),
                                    SizedBox(
                                      width: 308.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  GoRouter.of(context).push(
                                                    AppRouter.kroleselection,
                                                  );
                                                },
                                                child: Text(
                                                  "إنشاء حساب جديد",
                                                  style: TextSt.textstyle14
                                                      .copyWith(
                                                        color: kcolorOlive,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              SizedBox(width: 8.w),
                                              Text(
                                                "ليس لديك حساب أكاديمي ؟",
                                                style: TextSt.textstyle12
                                                    .copyWith(
                                                      color: KcolorGrey,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8.h),
                                          InkWell(
                                            onTap: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "اختيار دور آخر (طالب,أستاذ,إدارة)",
                                                  style: TextStyle(
                                                    color: const Color(
                                                      0xFF091C31,
                                                    ).withOpacity(0.6),
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                                SizedBox(width: 6.w),
                                                Icon(
                                                  Icons.swap_horiz,
                                                  size: 18.sp,
                                                  color: const Color(
                                                    0xFF091C31,
                                                  ).withOpacity(0.6),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
