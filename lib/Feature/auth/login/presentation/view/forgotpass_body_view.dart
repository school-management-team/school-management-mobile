import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/forgotpasswordcubit.dart';
import 'package:school/constant.dart';

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({super.key});

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            GoRouter.of(context).pop();
          } else if (state is ForgotPasswordFailure) {
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
                    SizedBox(height: 150.h),
                    Container(
                      width: 326.w,
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
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
                            "استعادة كلمة المرور",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1D1B20),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "لا تقلق فقدان الوصول يحدث للجميع ادخل بريدك الإلكتروني أو رقم هاتفك المسجل وسنرسل لك تعليمات آمنة لاستعادة حسابك",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14.sp,
                              height: 1.5,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Container(
                            width: 171.63.w,
                            height: 20.h,
                            alignment: Alignment.centerRight,
                            child: Text(
                              "البريد الإلكتروني أو رقم الهاتف",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF1C1C18),
                                fontWeight: FontWeight.w400,
                              ),
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
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: inputController,
                                    textAlign: TextAlign.right,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'يرجى إدخال البيانات';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "name@university.edu",
                                      hintStyle: TextStyle(
                                        color: const Color(
                                          0xFF74777D,
                                        ).withOpacity(0.5),
                                        fontSize: 14.sp,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                        right: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.h,
                                  ),
                                  child: const Icon(
                                    Icons.contact_mail_outlined,
                                    color: Color(0xFF74777D),
                                    size: 20,
                                  ),
                                ),
                              ],
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
                              onPressed: state is ForgotPasswordLoading
                                  ? null
                                  : () {
                                      if (formKey.currentState!.validate()) {
                                        context
                                            .read<ForgotPasswordCubit>()
                                            .sendResetRequest(
                                              emailOrPhone: inputController.text
                                                  .trim(),
                                            );
                                      }
                                    },
                              child: state is ForgotPasswordLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 15.75.w,
                                          height: 13.5.h,
                                          child: const Icon(
                                            Icons.mark_email_read_outlined,
                                            color: Color(0xFFFFFFFF),
                                            size: 16,
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          "إرسال رابط الاستعادة",
                                          style: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          SizedBox(height: 38.h),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).pop();
                            },
                            child: SizedBox(
                              height: 19.59.h,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "العودة لتسجيل الدخول",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF74777D),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  const Icon(
                                    Icons.arrow_forward,
                                    size: 16,
                                    color: Color(0xFF74777D),
                                  ),
                                ],
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
    );
  }
}
