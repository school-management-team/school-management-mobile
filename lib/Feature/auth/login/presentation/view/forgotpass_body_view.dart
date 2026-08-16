import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/auth/login/presentation/view/Login_View.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      //width: 395.w,
      height: 883.99.h,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 390.w,
              height: 33.59.h,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Academia Neo",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.account_balance, color: kcolorOlive, size: 24),
                ],
              ),
            ),
            SizedBox(height: 150.h),
            Container(
              width: 326.w,
              padding: EdgeInsets.only(bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F3ED),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
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
                      color: Color(0xFF1D1B20),
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
                        color: Color(0xFF1C1C18),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 326.w,
                    height: 55.59.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCF9F3),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: Color(0xFFC4C6CD).withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: "name@university.edu",
                              hintStyle: TextStyle(
                                color: Color(0xFF74777D).withOpacity(0.5),
                                fontSize: 14.sp,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(right: 16),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.h),
                          child: Icon(
                            Icons.contact_mail_outlined,
                            color: Color(0xFF74777D),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35.h),
                  Container(
                    width: 326.w,
                    height: 63.59.h,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kcolorOlive,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15.75.w,
                            height: 13.5.h,
                            child: Icon(
                              Icons.mark_email_read_outlined,
                              color: Color(0xFFFFFFFF),
                              size: 16,
                            ),
                          ),
                          SizedBox(width: 5.w),

                          Text(
                            "إرسال رابط الاستعادة",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
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
                    onTap: () {},
                    child: Container(
                      height: 19.59.h,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "العودة لتسجيل الدخول",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xFF74777D),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 3.w),

                          Icon(
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
    );
  }
}
