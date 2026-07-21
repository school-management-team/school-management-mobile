import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/views/presentation/view/AdminDashboard_body_view.dart';
import 'package:school/core/assest.dart';

class AdminDashView extends StatelessWidget {
  const AdminDashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.h,
        backgroundColor: Color(0xFFFFFFFF),
        shadowColor: Colors.black.withOpacity(0.4),
        elevation: 0.7,

        // shadowColor: Colors.black.withOpacity(0.08),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 186.77.w,
                height: 32.h,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 32.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9999.r),
                        image: DecorationImage(
                          image: AssetImage(AssestData.studprofile),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      width: 142.77.w,
                      height: 28.h,
                      child: Text(
                        "Academic Portal",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF071A2F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 36.h,
                width: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9999.r),
                ),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF10B981),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFEBE8E2),
      body: SafeArea(child: admindash()),
    );
  }
}
