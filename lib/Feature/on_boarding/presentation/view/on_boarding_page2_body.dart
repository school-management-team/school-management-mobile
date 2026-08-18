import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/Feature/on_boarding/presentation/widgets/dots_indicator.dart';

class OnBoardingPage2Body extends StatefulWidget {
  const OnBoardingPage2Body({super.key});

  @override
  State<OnBoardingPage2Body> createState() => _OnBoardingPage2BodyState();
}

class _OnBoardingPage2BodyState extends State<OnBoardingPage2Body>
    with TickerProviderStateMixin {
  // ── أنيميشن حلقة التقدم (من 0 إلى 75%) ───────────────────────────────
  late final AnimationController _ringCtrl;
  late final Animation<double> _ringAnim;

  // ── أنيميشن أعمدة الرسم البياني ───────────────────────────────────────
  late final AnimationController _chartCtrl;
  late final Animation<double> _chartAnim;

  // ── أنيميشن الأيقونتين العائمتين ──────────────────────────────────────
  late final AnimationController _float1Ctrl;
  late final Animation<double> _float1Anim;
  late final AnimationController _float2Ctrl;
  late final Animation<double> _float2Anim;

  @override
  void initState() {
    super.initState();

    _ringCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
    _ringAnim = Tween<double>(
      begin: 0,
      end: 0.75,
    ).animate(CurvedAnimation(parent: _ringCtrl, curve: Curves.easeOut));

    _chartCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
    _chartAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _chartCtrl, curve: Curves.easeOut));

    _float1Ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);
    _float1Anim = Tween<double>(
      begin: 0,
      end: -10,
    ).animate(CurvedAnimation(parent: _float1Ctrl, curve: Curves.easeInOut));

    _float2Ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..repeat(reverse: true);
    _float2Anim = Tween<double>(
      begin: -8,
      end: 4,
    ).animate(CurvedAnimation(parent: _float2Ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ringCtrl.dispose();
    _chartCtrl.dispose();
    _float1Ctrl.dispose();
    _float2Ctrl.dispose();
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
              // ── Header: تخطي + النقاط ──────────────────────────────
              _buildHeader(),

              // ── المحتوى الرئيسي ─────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        // لوحة التحكم الأكاديمية
                        _buildDashboardPanel(),
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
              left: -80.w,
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
              right: -60.w,
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
  // Header: تخطي + النقاط
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // نقاط التنقل (النقطة الثانية نشطة)
          const DotsIndicator(currentIndex: 1, total: 4),
          // زر تخطي
          TextButton(
            onPressed: () => context.go(AppRouter.kroleselection),
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
  // لوحة التحكم الأكاديمية
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildDashboardPanel() {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── اللوحة الرئيسية ──────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: const Color(0xFF071A2F).withValues(alpha: 0.05),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF071A2F).withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // الصف الأول: حلقة التقدم + أشرطة التقدم
                _buildProgressRow(),
                SizedBox(height: 16.h),
                // الصف الثاني: البطاقتان
                _buildCardsRow(),
                SizedBox(height: 16.h),
                // الصف الثالث: الرسم البياني
                _buildBarChart(),
              ],
            ),
          ),

          // ── أيقونة عائمة 1: trending_up (أعلى يمين) ─────────────────
          Positioned(
            top: -10.h,
            right: -14.w,
            child: AnimatedBuilder(
              animation: _float1Anim,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, _float1Anim.value),
                child: child,
              ),
              child: Transform.rotate(
                angle: 12 * pi / 180,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: const Color(0xFFC4C6CD).withValues(alpha: 0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AssestData.arrowIcon,
                    width: 28.sp,
                    height: 28.sp,
                  ),
                ),
              ),
            ),
          ),

          // ── أيقونة عائمة 2: done_all (أسفل يسار) ────────────────────
          Positioned(
            bottom: -10.h,
            left: -14.w,
            child: AnimatedBuilder(
              animation: _float2Anim,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, _float2Anim.value),
                child: child,
              ),
              child: Transform.rotate(
                angle: -12 * pi / 180,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: const Color(0xFFC4C6CD).withValues(alpha: 0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AssestData.checkmarkIcon,
                    width: 28.sp,
                    height: 28.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── الصف الأول: حلقة التقدم + أشرطة ─────────────────────────────────────
  Widget _buildProgressRow() {
    return Row(
      children: [
        // حلقة التقدم 75%
        AnimatedBuilder(
          animation: _ringAnim,
          builder: (context, child) {
            return SizedBox(
              width: 80.w,
              height: 80.w,
              child: CustomPaint(
                painter: _RingPainter(progress: _ringAnim.value),
                child: Center(
                  child: Text(
                    '${(_ringAnim.value * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: kcolorNavyBlue,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(width: 16.w),
        // أشرطة التقدم
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressBar(
                value: 0.85,
                color: kcolorNavyBlue,
                bgWidth: double.infinity,
              ),
              SizedBox(height: 8.h),
              _buildProgressBar(
                value: 0.60,
                color: kcolorOlive,
                bgWidth: double.infinity,
              ),
              SizedBox(height: 8.h),
              _buildProgressBar(
                value: 0.40,
                color: const Color(0xFFB87500),
                bgWidth: double.infinity,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar({
    required double value,
    required Color color,
    required double bgWidth,
  }) {
    return AnimatedBuilder(
      animation: _chartAnim,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: 8.h,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E2DC),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: value * _chartAnim.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ── الصف الثاني: البطاقتان ───────────────────────────────────────────────
  Widget _buildCardsRow() {
    return Row(
      children: [
        Expanded(
          child: _MiniCard(
            icon: Icons.school_outlined,
            iconColor: kcolorOlive,
            iconBg: kcolorOlive.withValues(alpha: 0.12),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _MiniCard(
            icon: Icons.assignment_outlined,
            iconColor: const Color(0xFFBA1A1A),
            iconBg: const Color(0xFFFFDAD6).withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }

  // ── الصف الثالث: الرسم البياني ──────────────────────────────────────────
  Widget _buildBarChart() {
    const heights = [0.25, 0.50, 0.75, 1.0, 0.85];
    const colors = [
      Color(0xFFE5E2DC),
      Color(0xFFE5E2DC),
      Color(0xFFB6C8E4),
      Color(0xFF091C31),
      Color(0xFF006C49),
    ];

    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: const Color(0xFFC4C6CD).withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: AnimatedBuilder(
          animation: _chartAnim,
          builder: (context, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(heights.length, (i) {
                final isActive = i == 3; // العمود +15%
                return Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    // تسمية +15% فوق العمود الرابع
                    if (isActive)
                      Positioned(
                        top: -20.h,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color: const Color(
                                0xFFC4C6CD,
                              ).withValues(alpha: 0.2),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            '+15%',
                            style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w700,
                              color: kcolorNavyBlue,
                            ),
                          ),
                        ),
                      ),
                    // العمود
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 900),
                      width: 28.w,
                      height: 60.h * heights[i] * _chartAnim.value,
                      decoration: BoxDecoration(
                        color: colors[i],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.r),
                          topRight: Radius.circular(4.r),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            );
          },
        ),
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
          'تابع التقدم الأكاديمي بوضوح',
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
          'درجات، حضور، واجبات، ملاحظات وتقارير في لوحة واحدة سهلة الفهم.',
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
  // أزرار التنقل: رجوع (دائرة) + التالي (بيضاوي)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildNavigation() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 28.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── زر الرجوع (دائرة) ────────────────────────────────────────
          InkWell(
            onTap: () => context.go(AppRouter.kOnBoarding1),
            borderRadius: BorderRadius.circular(999.r),
            child: Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFC4C6CD).withValues(alpha: 0.5),
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.arrow_forward_rounded,
                color: KcolorGrey,
                size: 22.sp,
              ),
            ),
          ),

          // ── زر التالي (بيضاوي) ───────────────────────────────────────
          SizedBox(
            height: 56.h,
            child: ElevatedButton(
              onPressed: () {
                context.go(AppRouter.kOnBoarding3);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kcolorOlive,
                elevation: 3,
                shadowColor: kcolorOlive.withValues(alpha: 0.35),
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
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
// CustomPainter: حلقة التقدم الدائرية
// ─────────────────────────────────────────────────────────────────────────────
class _RingPainter extends CustomPainter {
  final double progress;

  _RingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide - 10) / 2;

    // الحلقة الخلفية
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = const Color(0xFFE5E2DC)
        ..strokeWidth = 8
        ..style = PaintingStyle.stroke,
    );

    // حلقة التقدم
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      Paint()
        ..color = const Color(0xFF006C49)
        ..strokeWidth = 8
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress;
}

// ─────────────────────────────────────────────────────────────────────────────
// بطاقة مصغرة داخل اللوحة
// ─────────────────────────────────────────────────────────────────────────────
class _MiniCard extends StatelessWidget {
  const _MiniCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFC4C6CD).withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, size: 16.sp, color: iconColor),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 6.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: const Color(0xFFC4C6CD),
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            height: 6.h,
            width: 36.w,
            decoration: BoxDecoration(
              color: const Color(0xFFDCDAD4),
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
        ],
      ),
    );
  }
}
