import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/Feature/on_boarding/presentation/widgets/dots_indicator.dart';

class OnBoardingPage1Body extends StatefulWidget {
  const OnBoardingPage1Body({super.key});

  @override
  State<OnBoardingPage1Body> createState() => _OnBoardingPage1BodyState();
}

class _OnBoardingPage1BodyState extends State<OnBoardingPage1Body>
    with TickerProviderStateMixin {
  // ── أنيميشن البطاقة 1: الرياضيات (أعلى يمين) ─────────────────────────
  late final AnimationController _bounce1Ctrl;
  late final Animation<double> _bounce1;

  // ── أنيميشن البطاقة 2: العلوم (أسفل يسار) ────────────────────────────
  late final AnimationController _bounce2Ctrl;
  late final Animation<double> _bounce2;

  // ── أنيميشن البطاقة 3: اللغة العربية (منتصف يسار) ───────────────────
  late final AnimationController _bounce3Ctrl;
  late final Animation<double> _bounce3;

  @override
  void initState() {
    super.initState();

    _bounce1Ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);
    _bounce1 = Tween<double>(begin: 0, end: -10).animate(
      CurvedAnimation(parent: _bounce1Ctrl, curve: Curves.easeInOut),
    );

    _bounce2Ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);
    _bounce2 = Tween<double>(begin: -6, end: 6).animate(
      CurvedAnimation(parent: _bounce2Ctrl, curve: Curves.easeInOut),
    );

    _bounce3Ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..repeat(reverse: true);
    _bounce3 = Tween<double>(begin: 0, end: -8).animate(
      CurvedAnimation(parent: _bounce3Ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _bounce1Ctrl.dispose();
    _bounce2Ctrl.dispose();
    _bounce3Ctrl.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          // ── خلفية زخرفية ──────────────────────────────────────────────
          _buildBackground(),

          Column(
            children: [
              // ── Header ─────────────────────────────────────────────────
              _buildHeader(),

              // ── المحتوى الرئيسي ────────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        // الصورة المركزية والبطاقات العائمة
                        _buildVisualSection(),
                        SizedBox(height: 28.h),
                        // النص والوصف
                        _buildTextSection(),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),

              // ── Footer: النقاط + الزر ─────────────────────────────────
              _buildFooter(),
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
            // دائرة ضبابية أعلى يمين
            Positioned(
              top: -80.h,
              right: -80.w,
              child: Container(
                width: 300.w,
                height: 300.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFD3E4FF).withValues(alpha: 0.25),
                ),
                child: BackdropFilter(
                  filter: const ColorFilter.matrix([
                    1, 0, 0, 0, 0,
                    0, 1, 0, 0, 0,
                    0, 0, 1, 0, 0,
                    0, 0, 0, 1, 0,
                  ]),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            // دائرة ضبابية أسفل يسار
            Positioned(
              bottom: -60.h,
              left: -60.w,
              child: Container(
                width: 240.w,
                height: 240.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF4EDEA3).withValues(alpha: 0.1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Header
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
  // القسم البصري: الصورة المركزية + البطاقات العائمة
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildVisualSection() {
    final double circleSize = 260.w;

    return SizedBox(
      width: double.infinity,
      height: circleSize + 60.h,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // ── الصورة المركزية الدائرية ────────────────────────────────
          Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: kcolorNavyBlue.withValues(alpha: 0.1),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF071A2F).withValues(alpha: 0.05),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                AssestData.modernSchool,
                fit: BoxFit.cover,
                color: Colors.black.withValues(alpha: 0.15),
                colorBlendMode: BlendMode.darken,
                errorBuilder: (context, error, stack) => Container(
                  color: const Color(0xFFEBE8E2),
                  child: Icon(
                    Icons.school_outlined,
                    size: 80.sp,
                    color: KcolorGrey.withValues(alpha: 0.4),
                  ),
                ),
              ),
            ),
          ),

          // ── البطاقة 1: الرياضيات (أعلى يمين) ───────────────────────
          Positioned(
            top: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _bounce1,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, _bounce1.value),
                child: child,
              ),
              child: _SubjectCard(
                
                imagePath: AssestData.mathIcon,
                subject: 'الرياضيات',
                subtitle: 'الفصل الأول',
                bgColor: const Color(0xFFD3E4FF),
              ),
            ),
          ),

          // ── البطاقة 2: العلوم (أسفل يسار) ──────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            child: AnimatedBuilder(
              animation: _bounce2,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, _bounce2.value),
                child: child,
              ),
              child: _SubjectCard(
                imagePath: AssestData.scienceIcon,
                subject: 'العلوم',
                subtitle: 'مختبر افتراضي',
                bgColor: const Color(0xFF6CF8BB).withValues(alpha: 0.5),
              ),
            ),
          ),

          // ── البطاقة 3: اللغة (منتصف يسار — أصغر) ──────────────────
          Positioned(
            top: circleSize * 0.28,
            left: 0,
            child: AnimatedBuilder(
              animation: _bounce3,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, _bounce3.value),
                child: child,
              ),
              child: _SmallCard(
                imagePath: AssestData.languageIcon,
                label: 'اللغة العربية',
              ),
            ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // العنوان
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 38.sp,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
              height: 1.25,
            ),
            children: [
              TextSpan(
                text: 'مدرستك في\n',
                style: TextStyle(color: kcolorNavyBlue),
              ),
              TextSpan(
                text: 'منصة واحدة',
                style: TextStyle(color: kcolorOlive),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // الوصف
        Text(
          'إدارة ذكية تربط الإدارة، المعلمين، الطلاب وأولياء الأمور في تجربة تعليمية موحدة.',
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
  // Footer: النقاط + زر التالي
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 28.h),
      child: Column(
        children: [
          // ── النقاط (5 نقاط، الأولى نشطة) ────────────────────────────
          const DotsIndicator(currentIndex: 0, total: 4),

          SizedBox(height: 24.h),

          // ── زر التالي ─────────────────────────────────────────────────
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: () {
                context.go(AppRouter.kOnBoarding2);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kcolorOlive,
                elevation: 4,
                shadowColor: kcolorOlive.withValues(alpha: 0.35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'التالي',
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

// ─────────────────────────────────────────────────────────────────────────────
// بطاقة المادة الكبيرة (مع صورة + اسم + وصف)
// ─────────────────────────────────────────────────────────────────────────────
class _SubjectCard extends StatelessWidget {
  const _SubjectCard({
    required this.imagePath,
    required this.subject,
    required this.subtitle,
    required this.bgColor,
  });

  final String imagePath;
  final String subject;
  final String subtitle;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: const Color(0xFFC4C6CD).withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF071A2F).withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // النصوص
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                subject,
                style: TextSt.textstyle12.copyWith(
                  color: kcolorNavyBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: TextSt.textstyle10.copyWith(
                  color: KcolorGrey,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.w),
          // أيقونة المادة
          Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.sp),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stack) => Icon(
                Icons.book_outlined,
                size: 20.sp,
                color: kcolorNavyBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// البطاقة الصغيرة (اللغة — فقط أيقونة + نص)
// ─────────────────────────────────────────────────────────────────────────────
class _SmallCard extends StatelessWidget {
  const _SmallCard({
    required this.imagePath,
    required this.label,
  });

  final String imagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color(0xFFC4C6CD).withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF071A2F).withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextSt.textstyle12.copyWith(
              color: kcolorNavyBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 8.w),
          SizedBox(
            width: 22.w,
            height: 22.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stack) => Icon(
                Icons.language_outlined,
                size: 18.sp,
                color: const Color(0xFF2A1700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
