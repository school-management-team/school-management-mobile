import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';
import 'package:school/core/widget/Text/text_style.dart';
import 'package:school/Feature/on_boarding/presentation/widgets/dots_indicator.dart';

class OnBoardingPage3Body extends StatefulWidget {
  const OnBoardingPage3Body({super.key});

  @override
  State<OnBoardingPage3Body> createState() => _OnBoardingPage3BodyState();
}

class _OnBoardingPage3BodyState extends State<OnBoardingPage3Body>
    with TickerProviderStateMixin {
  // ── أنيميشن الدوران المستمر ──────────────────────────────────────────
  late final AnimationController _orbitCtrl;

  // ── أنيميشن نبض القبعة المركزية ──────────────────────────────────────
  late final AnimationController _pulseCtrl;
  late final Animation<double> _pulseAnim;

  // ── أنيميشن ظهور الخطوط المتقطعة ─────────────────────────────────────
  late final AnimationController _linesCtrl;
  late final Animation<double> _linesAnim;

  @override
  void initState() {
    super.initState();

    // دوران مستمر — دورة كاملة كل 20 ثانية
    _orbitCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // نبض القبعة المركزية
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut));

    // ظهور الخطوط تدريجياً
    _linesCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
    _linesAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _linesCtrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _orbitCtrl.dispose();
    _pulseCtrl.dispose();
    _linesCtrl.dispose();
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
                        // الرسم التوضيحي: القبعة + العقد الدوّارة
                        _buildOrbitDiagram(),
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
          // نقاط التنقل (النقطة الثالثة نشطة)
          const DotsIndicator(currentIndex: 2, total: 4),
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
  // الرسم التوضيحي: القبعة المركزية + العقد الدائرة حولها
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildOrbitDiagram() {
    final double diagramSize = 300.w;
    final double hubSize = 80.w;
    final double orbitRadius = 110.w;
    final double nodeSize = 90.w;

    // بيانات العقد الأربعة
    final nodes = [
      _NodeData(
        icon: Icons.admin_panel_settings_outlined,
        label: 'الإدارة',
        bgColor: const Color(0xFF091C31),
        iconColor: const Color(0xFF74859F),
      ),
      _NodeData(
        icon: Icons.local_library_outlined,
        label: 'المعلم',
        bgColor: const Color(0xFFE5E2DC),
        iconColor: const Color(0xFF44474D),
      ),
      _NodeData(
        icon: Icons.face_outlined,
        label: 'الطالب',
        bgColor: const Color(0xFFFFDAD6),
        iconColor: const Color(0xFF93000A),
      ),
      _NodeData(
        icon: Icons.family_restroom_outlined,
        label: 'ولي الأمر',
        bgColor: const Color(0xFF2A1700),
        iconColor: const Color(0xFFB87500),
      ),
    ];

    return SizedBox(
      width: diagramSize,
      height: diagramSize,
      child: AnimatedBuilder(
        animation: Listenable.merge([_orbitCtrl, _pulseAnim, _linesAnim]),
        builder: (context, child) {
          final orbitAngle = _orbitCtrl.value * 2 * pi;

          return CustomPaint(
            painter: _ConnectionLinesPainter(
              center: Offset(diagramSize / 2, diagramSize / 2),
              orbitRadius: orbitRadius,
              nodeCount: nodes.length,
              rotationAngle: orbitAngle,
              opacity: _linesAnim.value,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // ── حلقة المدار الخارجية ──────────────────────────────
                Container(
                  width: orbitRadius * 2 + nodeSize,
                  height: orbitRadius * 2 + nodeSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kcolorgreen.withValues(alpha: 0.12),
                      width: 1.5,
                    ),
                  ),
                ),

                // ── القبعة المركزية ───────────────────────────────────
                Transform.scale(
                  scale: _pulseAnim.value,
                  child: Container(
                    width: hubSize,
                    height: hubSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFF071A2F).withValues(alpha: 0.05),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kcolorgreen.withValues(alpha: 0.2),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: const Color(
                            0xFF071A2F,
                          ).withValues(alpha: 0.05),
                          blurRadius: 30,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // نبض خلفي أخضر
                        Container(
                          width: hubSize * 0.85,
                          height: hubSize * 0.85,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kcolorgreen.withValues(
                              alpha: 0.1 * _pulseAnim.value,
                            ),
                          ),
                        ),
                        Icon(Icons.school, size: 36.sp, color: kcolorgreen),
                      ],
                    ),
                  ),
                ),

                // ── العقد الدائرة ──────────────────────────────────────
                ...List.generate(nodes.length, (i) {
                  // توزيع متساوٍ + إزاحة الدوران
                  final baseAngle = (2 * pi / nodes.length) * i - pi / 2;
                  final angle = baseAngle + orbitAngle;

                  final dx = orbitRadius * cos(angle);
                  final dy = orbitRadius * sin(angle);

                  return Transform.translate(
                    offset: Offset(dx, dy),
                    child: _buildNodeCard(
                      node: nodes[i],
                      size: nodeSize,
                      // عكس الدوران حتى يبقى النص أفقي
                      counterRotation: -orbitAngle,
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }

  // ── بطاقة عقدة واحدة ──────────────────────────────────────────────────
  Widget _buildNodeCard({
    required _NodeData node,
    required double size,
    required double counterRotation,
  }) {
    return Transform.rotate(
      angle: counterRotation,
      child: Container(
        width: size,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(16.r),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: node.bgColor,
              ),
              child: Icon(node.icon, size: 22.sp, color: node.iconColor),
            ),
            SizedBox(height: 6.h),
            Text(
              node.label,
              style: TextSt.textstyle12.copyWith(
                color: kcolorNavyBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
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
          'تواصل منظم بين المدرسة والبيت',
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
          'إشعارات وتنبيهات وملاحظات تصل للطالب وولي الأمر حسب الصلاحيات.',
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
  // أزرار التنقل: رجوع + التالي
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildNavigation() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 28.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── زر الرجوع (دائرة) ────────────────────────────────────────
          InkWell(
            onTap: () => context.go(AppRouter.kOnBoarding2),
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
                context.go(AppRouter.kOnBoarding4);
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
// بيانات العقدة
// ─────────────────────────────────────────────────────────────────────────────
class _NodeData {
  final IconData icon;
  final String label;
  final Color bgColor;
  final Color iconColor;

  const _NodeData({
    required this.icon,
    required this.label,
    required this.bgColor,
    required this.iconColor,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// CustomPainter: الخطوط المتقطعة من المركز إلى كل عقدة
// ─────────────────────────────────────────────────────────────────────────────
class _ConnectionLinesPainter extends CustomPainter {
  final Offset center;
  final double orbitRadius;
  final int nodeCount;
  final double rotationAngle;
  final double opacity;

  _ConnectionLinesPainter({
    required this.center,
    required this.orbitRadius,
    required this.nodeCount,
    required this.rotationAngle,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF10B981).withValues(alpha: 0.35 * opacity)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    // رسم خطوط متقطعة من المركز إلى كل عقدة
    for (int i = 0; i < nodeCount; i++) {
      final baseAngle = (2 * pi / nodeCount) * i - pi / 2;
      final angle = baseAngle + rotationAngle;

      final endX = center.dx + orbitRadius * cos(angle);
      final endY = center.dy + orbitRadius * sin(angle);

      _drawDashedLine(canvas, center, Offset(endX, endY), paint);
    }
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const dashWidth = 4.0;
    const dashSpace = 4.0;

    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;
    final distance = sqrt(dx * dx + dy * dy);
    final unitDx = dx / distance;
    final unitDy = dy / distance;

    var currentDistance = 0.0;
    while (currentDistance < distance) {
      final startD = currentDistance;
      final endD = (currentDistance + dashWidth).clamp(0.0, distance);

      canvas.drawLine(
        Offset(start.dx + unitDx * startD, start.dy + unitDy * startD),
        Offset(start.dx + unitDx * endD, start.dy + unitDy * endD),
        paint,
      );

      currentDistance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(_ConnectionLinesPainter old) =>
      old.rotationAngle != rotationAngle || old.opacity != opacity;
}
