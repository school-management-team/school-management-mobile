import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/Feature/on_boarding/presentation/widgets/dots_indicator.dart';

class OnBoardingPage4Body extends StatefulWidget {
  const OnBoardingPage4Body({super.key});

  @override
  State<OnBoardingPage4Body> createState() => _OnBoardingPage4BodyState();
}

class _OnBoardingPage4BodyState extends State<OnBoardingPage4Body>
    with TickerProviderStateMixin {
  // ── أنيميشن البطاقة الخلفية 1 ──────────────────────────────────────────
  late final AnimationController _float1Ctrl;
  late final Animation<double> _float1Anim;

  // ── أنيميشن البطاقة الخلفية 2 ──────────────────────────────────────────
  late final AnimationController _float2Ctrl;
  late final Animation<double> _float2Anim;

  // ── أنيميشن شارة الدرع ──────────────────────────────────────────────────
  late final AnimationController _shieldCtrl;
  late final Animation<double> _shieldAnim;

  // ── أنيميشن ظهور البطاقة الرئيسية ────────────────────────────────────
  late final AnimationController _cardEntryCtrl;
  late final Animation<double> _cardSlideAnim;
  late final Animation<double> _cardFadeAnim;

  @override
  void initState() {
    super.initState();

    // طفو البطاقة الخلفية 1
    _float1Ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..repeat(reverse: true);
    _float1Anim = Tween<double>(begin: 0, end: -6).animate(
      CurvedAnimation(parent: _float1Ctrl, curve: Curves.easeInOut),
    );

    // طفو البطاقة الخلفية 2
    _float2Ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4200),
    )..repeat(reverse: true);
    _float2Anim = Tween<double>(begin: -4, end: 4).animate(
      CurvedAnimation(parent: _float2Ctrl, curve: Curves.easeInOut),
    );

    // نبض الدرع
    _shieldCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _shieldAnim = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _shieldCtrl, curve: Curves.easeInOut),
    );

    // دخول البطاقة الرئيسية
    _cardEntryCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
    _cardSlideAnim = Tween<double>(begin: 30, end: 0).animate(
      CurvedAnimation(parent: _cardEntryCtrl, curve: Curves.easeOut),
    );
    _cardFadeAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _cardEntryCtrl, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _float1Ctrl.dispose();
    _float2Ctrl.dispose();
    _shieldCtrl.dispose();
    _cardEntryCtrl.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          // ── خلفية زخرفية ────────────────────────────────────────────
          _buildBackground(),

          Column(
            children: [
              // ── Header: تخطي ──────────────────────────────────────────
              _buildHeader(),

              // ── المحتوى الرئيسي ─────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        // بطاقة الملف الشخصي متعددة الطبقات
                        _buildProfileCardStack(),
                        SizedBox(height: 32.h),
                        // النص والوصف
                        _buildTextSection(),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),

              // ── أزرار التنقل ─────────────────────────────────────────
              _buildNavigation(),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // الخلفية الزخرفية
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildBackground() {
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            Positioned(
              top: -80.h,
              right: -80.w,
              child: Container(
                width: 280.w,
                height: 280.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFD3E4FF).withValues(alpha: 0.3),
                ),
              ),
            ),
            Positioned(
              bottom: -60.h,
              left: -60.w,
              child: Container(
                width: 300.w,
                height: 300.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF4EDEA3).withValues(alpha: 0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Header: تخطي
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // نقاط التنقل (النقطة الرابعة نشطة)
          const DotsIndicator(currentIndex: 3, total: 4),
          // زر تخطي
          TextButton(
            onPressed: () => context.go(AppRouter.ksignupStud),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'تخطي',
              style: TextSt.textstyle14.copyWith(
                color: KcolorGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // بطاقة الملف الشخصي متعددة الطبقات (Glassmorphism)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildProfileCardStack() {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _float1Anim,
        _float2Anim,
        _cardSlideAnim,
        _cardFadeAnim,
      ]),
      builder: (context, child) {
        return SizedBox(
          width: double.infinity,
          height: 340.h,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // ── الطبقة 1: بطاقة خلفية (مفهوم الصلاحيات) ──────────────
              Positioned(
                top: 20.h + _float1Anim.value,
                child: Transform.rotate(
                  angle: 6 * pi / 180,
                  child: Container(
                    width: 260.w,
                    height: 230.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBE8E2).withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: const Color(0xFFC4C6CD).withValues(alpha: 0.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF071A2F)
                              .withValues(alpha: 0.02),
                          blurRadius: 20,
                          offset: const Offset(4, 4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ── الطبقة 2: بطاقة وسطى (مفهوم البيانات) ────────────────
              Positioned(
                top: 14.h + _float2Anim.value,
                child: Transform.rotate(
                  angle: -3 * pi / 180,
                  child: Container(
                    width: 275.w,
                    height: 245.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0EEE8).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: const Color(0xFFC4C6CD).withValues(alpha: 0.3),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF071A2F)
                              .withValues(alpha: 0.03),
                          blurRadius: 20,
                          offset: const Offset(-2, -2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ── الطبقة 3: البطاقة الرئيسية (الملف الشخصي) ────────────
              Positioned(
                top: 8.h + _cardSlideAnim.value,
                child: Opacity(
                  opacity: _cardFadeAnim.value,
                  child: Container(
                    width: 290.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: const Color(0xFFC4C6CD).withValues(alpha: 0.4),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF071A2F)
                              .withValues(alpha: 0.08),
                          blurRadius: 30,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ── رأس البطاقة (تدرج أزرق) ───────────────────
                        _buildCardHeader(),
                        // ── محتوى البطاقة ──────────────────────────────
                        _buildCardContent(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ── رأس البطاقة مع التدرج والشارة ───────────────────────────────────────
  Widget _buildCardHeader() {
    return SizedBox(
      height: 85.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // التدرج الأزرق
          Container(
            height: 85.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFD3E4FF),
                  Color(0xFFB6C8E4),
                ],
              ),
            ),
          ),

          // ── شارة الدرع (أسفل يسار الهيدر) ──────────────────────────
          Positioned(
            bottom: -20.h,
            left: 20.w,
            child: AnimatedBuilder(
              animation: _shieldAnim,
              builder: (context, child) => Transform.scale(
                scale: _shieldAnim.value,
                child: child,
              ),
              child: Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF6CF8BB),
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kcolorgreen.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.shield_outlined,
                  size: 20.sp,
                  color: const Color(0xFF00714D),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── محتوى البطاقة الرئيسية ──────────────────────────────────────────────
  Widget _buildCardContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── الأفاتار + الاسم ──────────────────────────────────────────
          Row(
            children: [
              // الأفاتار
              Container(
                width: 52.w,
                height: 52.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE5E2DC),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  size: 28.sp,
                  color: KcolorGrey.withValues(alpha: 0.6),
                ),
              ),
              SizedBox(width: 12.w),
              // الاسم والصف
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'أحمد محمد',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: kcolorNavyBlue,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'الصف الثامن - القسم العام',
                      style: TextSt.textstyle12.copyWith(
                        color: KcolorGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // ── صفوف البيانات الآمنة ──────────────────────────────────────
          _buildSecureDataRow(
            icon: Icons.school_outlined,
            label: 'السجل الأكاديمي',
          ),
          SizedBox(height: 8.h),
          _buildSecureDataRow(
            icon: Icons.calendar_month_outlined,
            label: 'سجل الحضور',
          ),
        ],
      ),
    );
  }

  // ── صف بيانات آمن (أيقونة + عنوان + قفل) ─────────────────────────────────
  Widget _buildSecureDataRow({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3ED),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color(0xFFC4C6CD).withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.sp,
            color: kcolorNavyBlue.withValues(alpha: 0.6),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              label,
              style: TextSt.textstyle12.copyWith(
                color: kcolorNavyBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.lock,
            size: 16.sp,
            color: kcolorOlive,
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // قسم النص
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildTextSection() {
    return Column(
      children: [
        Text(
          'ملف طالب آمن وموحد',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w800,
            color: kcolorNavyBlue,
            height: 1.3,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'ولي الأمر يرى بيانات ابنه فقط، مع صلاحيات واضحة وتجربة استخدام بسيطة.',
          textAlign: TextAlign.center,
          style: TextSt.textstyle14.copyWith(
            color: KcolorGrey,
            height: 1.7,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // أزرار التنقل: السابق + انشئ حسابك
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildNavigation() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 28.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── زر السابق (نص + أيقونة) ──────────────────────────────────
          TextButton.icon(
            onPressed: () => context.go(AppRouter.kOnBoarding3),
            icon: Icon(
              Icons.arrow_forward_rounded,
              color: KcolorGrey,
              size: 18.sp,
            ),
            label: Text(
              'السابق',
              style: TextSt.textstyle14.copyWith(
                color: KcolorGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            ),
          ),

          // ── زر انشئ حسابك (رئيسي أسود) ──────────────────────────────
          SizedBox(
            height: 56.h,
            child: ElevatedButton(
              onPressed: () {
                context.go(AppRouter.ksignupStud);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kcolorNavyBlue,
                elevation: 4,
                shadowColor: kcolorNavyBlue.withValues(alpha: 0.35),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'انشئ حسابك',
                    style: TextSt.textstyle16.copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
