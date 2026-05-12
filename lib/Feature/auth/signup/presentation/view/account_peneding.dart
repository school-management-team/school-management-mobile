import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/core/widget/custom_button.dart';

class AccountPending extends StatelessWidget {
  const AccountPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEBE8E2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100.sp, horizontal: 18.sp),
            child: Container(
              height: MediaQuery.sizeOf(context).height.sp,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),

                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 200.w,
                          height: 160.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0XFFFFB95F).withOpacity(0.1),
                              width: 2.5.w,
                            ),
                          ),
                        ),
                        Container(
                          width: 160.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0XFFFFB95F).withOpacity(0.1),
                              width: 4.0.w,
                            ),
                          ),
                        ),
                        Lottie.asset(AssestData.loading, width: 100.w),
                      ],
                    ),

                    // Image.asset(AssestData.overlay),
                  ),

                  Text("طلبك قيد \n المراجعة", style: TextSt.textstyle28),
                  SizedBox(height: 16.h),
                  Text(
                    "  تقوم الإدارة الأكاديمية حالياً بالتحقق  ",
                    style: TextSt.textstyle14,
                  ),
                  Text(
                    "      من بيانات الحساب والمستندات     ",
                    style: TextSt.textstyle14,
                  ),
                  Text(
                    "      المرفقة. سنقوم بإرسال إشعار فور \n           .اكتمال عملية التوثيق",
                    style: TextSt.textstyle14,
                  ),

                  SizedBox(height: 50.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Buttontext(
                        borderColor: KcolorGrey,
                        width: 0.2.w,
                        background: Colors.white,
                        textColor: KcolorGrey,
                        text: "التواصل مع الدعم الفني",
                        icons: Icons.support_agent_outlined,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "    العودة إلى الصفحة الرئيسية",
                        style: TextSt.textstyle14.copyWith(color: KcolorGrey),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          color: KcolorGrey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  // تقوم الإدارة الأكاديمية حالياً بالتحقق
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
