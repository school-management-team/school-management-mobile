import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/verifyaccountcubit.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';

void showOtpDialog({required BuildContext context, required String userEmail}) {
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return BlocProvider(
        create: (context) => VerifyAccountCubit(),
        child: BlocConsumer<VerifyAccountCubit, VerifyAccountState>(
          listener: (context, state) {
            if (state is VerifyAccountSuccess) {
              Navigator.of(dialogContext).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message), backgroundColor: Colors.green));
              GoRouter.of(context).go(AppRouter.klogin);
            } else if (state is VerifyAccountFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red));
            } else if (state is ResendCodeSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message), backgroundColor: Colors.green));
            } else if (state is ResendCodeFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red));
            }
          },
          builder: (context, state) {
            final isLoading = state is VerifyAccountLoading;
            final isResending = state is ResendCodeLoading;

            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
              backgroundColor: Colors.white,
              title: Column(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: kcolorOlive.withOpacity(0.1),
                    child: Icon(Icons.mark_email_read_outlined, color: kcolorOlive, size: 26.sp),
                  ),
                  SizedBox(height: 12.h),
                  Text("رمز التحقق", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: const Color(0xFF091C31)), textAlign: TextAlign.center),
                ],
              ),
              content: Form(
                key: otpFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("أدخل رمز التحقق المرسل إلى البريد:\n$userEmail", style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]), textAlign: TextAlign.center),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: otpController,
                      enabled: !isLoading,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 6,
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, letterSpacing: 8),
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "------",
                        hintStyle: TextStyle(color: Colors.grey.shade400, letterSpacing: 8),
                        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: const Color(0xFF091C31).withOpacity(0.2))),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: kcolorOlive, width: 1.5)),
                      ),
                      validator: (value) => (value == null || value.trim().isEmpty) ? 'يرجى إدخال الرمز' : null,
                    ),
                    SizedBox(height: 10.h),
                    TextButton(
                      onPressed: isResending ? null : () => context.read<VerifyAccountCubit>().resendCode(email: userEmail),
                      child: isResending
                          ? SizedBox(height: 15.h, width: 15.h, child: const CircularProgressIndicator(strokeWidth: 2, color: kcolorOlive))
                          : Text("إعادة إرسال الرمز؟", style: TextStyle(color: kcolorOlive, fontSize: 13.sp, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
              actionsPadding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
              actions: [
                Row(
                  children: [
                    Expanded(child: TextButton(onPressed: isLoading ? null : () => Navigator.of(dialogContext).pop(), child: Text("إلغاء", style: TextStyle(color: Colors.grey[700], fontSize: 14.sp)))),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isLoading ? null : () {
                          if (otpFormKey.currentState!.validate()) {
                            context.read<VerifyAccountCubit>().verifyCode(email: userEmail, code: otpController.text.trim());
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: kcolorOlive, padding: EdgeInsets.symmetric(vertical: 12.h), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
                        child: isLoading
                            ? SizedBox(height: 20.h, width: 20.h, child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                            : Text("تأكيد", style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    },
  );
}