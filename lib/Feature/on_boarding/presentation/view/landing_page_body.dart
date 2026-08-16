import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';

class LandingPageBody extends StatefulWidget {
  const LandingPageBody({super.key});

  @override
  State<LandingPageBody> createState() => _LandingPageBodyState();
}

class _LandingPageBodyState extends State<LandingPageBody>
    with TickerProviderStateMixin {
  // أنيميشن البطاقة الأولى (نسبة الحضور) — 4 ثواني
  late final AnimationController _bounce1Controller;
  late final Animation<double> _bounce1Anim;

  // أنيميشن البطاقة الثانية (شهادة رقمية) — 5 ثواني عكسي
  late final AnimationController _bounce2Controller;
  late final Animation<double> _bounce2Anim;

  // أنيميشن نبض النقطة الخضراء
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();

    _bounce1Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);
    _bounce1Anim = Tween<double>(begin: 0, end: -12).animate(
      CurvedAnimation(parent: _bounce1Controller, curve: Curves.easeInOut),
    );

    _bounce2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat(reverse: true);
    _bounce2Anim = Tween<double>(begin: -12, end: 0).animate(
      CurvedAnimation(parent: _bounce2Controller, curve: Curves.easeInOut),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _bounce1Controller.dispose();
    _bounce2Controller.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Navbar ────────────────────────────────────────────────
            _buildNavbar(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),

                  // ─── Badge مع نقطة نبض ────────────────────────────
                  _buildBadge(),

                  SizedBox(height: 20.h),

                  // ─── Hero Title مع تدرج "اليوم" ───────────────────
                  _buildHeroTitle(),

                  SizedBox(height: 16.h),

                  // ─── Description ──────────────────────────────────
                  _buildDescription(),

                  SizedBox(height: 28.h),

                  // ─── CTA Button ───────────────────────────────────
                  _buildCtaButton(),

                  SizedBox(height: 24.h),

                  // ─── Dots Indicator ───────────────────────────────
                  // _buildDotsIndicator(),
                  SizedBox(height: 28.h),

                  // ─── Dashboard Mockup مع البطاقات العائمة ─────────
                  _buildDashboardMockup(),

                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Navbar
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildNavbar() {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF071A2F).withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'الأكاديميون',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: kcolorNavyBlue,
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(width: 10.w),
            Icon(Icons.school_rounded, color: kcolorOlive, size: 28.sp),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Badge مع نقطة نبض
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildBadge() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: const Color(0XFFEBE8E2),
          borderRadius: BorderRadius.circular(999.r),
          border: Border.all(
            color: const Color(0XFF74777D).withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // نقطة نبض خضراء
            AnimatedBuilder(
              animation: _pulseAnim,
              builder: (context, child) {
                return Opacity(
                  opacity: _pulseAnim.value,
                  child: Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                      color: kcolorOlive,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
            SizedBox(width: 8.w),
            Text(
              'الجيل الجديد من الإدارة المدرسية',
              style: TextSt.textstyle12.copyWith(
                color: KcolorGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Hero Title
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildHeroTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // السطر الأول: مستقبل التعليم،
        Text(
          'مستقبل التعليم،',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 42.sp,
            fontWeight: FontWeight.w900,
            color: kcolorNavyBlue,
            height: 1.2,
          ),
        ),
        // كلمة "اليوم" بتدرج لوني
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF091C31), Color.fromARGB(255, 2, 190, 130)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ).createShader(bounds),
          child: Text(
            'اليوم',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 42.sp,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Description
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildDescription() {
    return Text(
      'منصة سحابية متكاملة تدمج الإدارة، التعليم، والتواصل في بيئة رقمية واحدة تليق بطموحات المؤسسات التعليمية الرائدة.',
      textAlign: TextAlign.right,
      style: TextSt.textstyle14.copyWith(
        color: KcolorGrey,
        height: 1.7,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // CTA Button
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildCtaButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () => context.go(AppRouter.kOnBoarding1),
        style: ElevatedButton.styleFrom(
          backgroundColor: kcolorOlive,
          elevation: 4,
          shadowColor: kcolorOlive.withValues(alpha: 0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'الدخول إلى النظام',
              style: TextSt.textstyle16.copyWith(color: Colors.white),
            ),
            SizedBox(width: 8.w),
            Icon(Icons.arrow_back_rounded, color: Colors.white, size: 22.sp),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Dots Indicator
  // ─────────────────────────────────────────────────────────────────────────
  // Widget _buildDotsIndicator() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       _dot(isActive: true),
  //       SizedBox(width: 6.w),
  //       _dot(isActive: false),
  //       SizedBox(width: 6.w),
  //       _dot(isActive: false),
  //     ],
  //   );
  // }

  // Widget _dot({required bool isActive}) {
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 300),
  //     width: isActive ? 24.w : 8.w,
  //     height: 8.h,
  //     decoration: BoxDecoration(
  //       color: isActive ? kcolorOlive : kcolorOlive.withValues(alpha: 0.3),
  //       borderRadius: BorderRadius.circular(4.r),
  //     ),
  //   );
  // }

  // ─────────────────────────────────────────────────────────────────────────
  // Dashboard Mockup مع البطاقات العائمة
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildDashboardMockup() {
    return SizedBox(
      width: double.infinity,
      height: 280.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── لوحة Dashboard الرئيسية ──
          Positioned.fill(left: 20.w, right: 0, child: _buildMockupPanel()),

          // ── نسبة الحضور (أعلى يسار) ──
          Positioned(
            top: 16.h,
            left: 0,
            child: AnimatedBuilder(
              animation: _bounce1Anim,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, _bounce1Anim.value),
                child: child,
              ),
              child: _buildFloatingCard1(),
            ),
          ),

          // ── شهادة رقمية (أسفل يمين) ──
          Positioned(
            bottom: 16.h,
            right: 0,
            child: AnimatedBuilder(
              animation: _bounce2Anim,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, _bounce2Anim.value),
                child: child,
              ),
              child: _buildFloatingCard2(),
            ),
          ),
        ],
      ),
    );
  }

  // لوحة  Dashboard التقليدية (نافذة)
  Widget _buildMockupPanel() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF071A2F).withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // شريط  علوي
          Container(
            height: 36.h,
            decoration: BoxDecoration(
              color: const Color(0xFFEBE8E2).withValues(alpha: 0.8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              border: Border(
                bottom: BorderSide(
                  color: const Color(0XFF74777D).withValues(alpha: 0.2),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  _windowDot(const Color(0xFFBA1A1A)),
                  SizedBox(width: 6.w),
                  _windowDot(const Color(0xFFFFB95F)),
                  SizedBox(width: 6.w),
                  _windowDot(kcolorOlive),
                ],
              ),
            ),
          ),
          // محتوى لوحة التحكم
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: _buildMockupContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _windowDot(Color color) {
    return Container(
      width: 10.w,
      height: 10.w,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.8),
        shape: BoxShape.circle,
      ),
    );
  }

  // محتوى داخل لوحة التحكم (mock charts)
  Widget _buildMockupContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // شريط البحث وهمي
        Container(
          height: 20.h,
          decoration: BoxDecoration(
            color: const Color(0xFFEBE8E2),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(height: 10.h),
        // صفوف بيانات وهمية
        Row(
          children: [
            Expanded(
              child: _mockBar(
                height: 60.h,
                color: kcolorOlive.withValues(alpha: 0.7),
              ),
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: _mockBar(
                height: 45.h,
                color: kcolorNavyBlue.withValues(alpha: 0.3),
              ),
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: _mockBar(
                height: 75.h,
                color: kcolorOlive.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: _mockBar(
                height: 50.h,
                color: kcolorNavyBlue.withValues(alpha: 0.2),
              ),
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: _mockBar(
                height: 65.h,
                color: kcolorOlive.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        // خطوط نصوص وهمية
        Container(height: 8.h, width: 120.w, color: const Color(0xFFEBE8E2)),
        SizedBox(height: 6.h),
        Container(height: 8.h, width: 80.w, color: const Color(0xFFEBE8E2)),
      ],
    );
  }

  Widget _mockBar({required double height, required Color color}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // البطاقة العائمة 1:
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildFloatingCard1() {
    return Container(
      padding: EdgeInsets.only(right: 15.w, left: 5.w, top: 5.h, bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: const Color(0xFF071A2F).withValues(alpha: 0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF071A2F).withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // النص
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'نسبة الحضور',
                style: TextSt.textstyle12.copyWith(
                  color: KcolorGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '98.5%',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: kcolorNavyBlue,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.w),
          // أيقونة
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: kcolorgreen.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Image(image: AssetImage(AssestData.backgroundIcon)),
            // child: Icon(
            //   Icons.trending_up,
            //   color: kcolorgreen,
            //   size: 22.sp,
            // ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // البطاقة العائمة 2: شهادة رقمية
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildFloatingCard2() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: const Color(0xFF071A2F).withValues(alpha: 0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF071A2F).withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // النص
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'شهادة رقمية',
                style: TextSt.textstyle12.copyWith(
                  color: KcolorGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'تم الإصدار',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: kcolorNavyBlue,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.w),
          Container(
            width: 40.w,
            height: 40.w,
            decoration: const BoxDecoration(
              color: Color(0XFFFFDDB8),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.workspace_premium_rounded,
              color: const Color(0xFFB87500),
              size: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}
