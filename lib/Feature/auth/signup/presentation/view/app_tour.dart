import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:school/constant.dart';

class TourSlide {
  final String ar;
  final String en;
  final IconData icon;
  const TourSlide({
    required this.ar,
    required this.en,
    this.icon = Icons.star_rounded,
  });
}

const Color kOlive = Color(0xFF6E7B3C);
const Color kOliveLight = Color(0xFFE7ECD6);
const Color kOliveDark = Color(0xFF4E5A28);

final List<TourSlide> studentTourSlides = [
  const TourSlide(
    ar: 'مرحباً بك.  يمكنك الاطلاع على نسبة حضورك ومعدلك التراكمي بنظرة واحدة.',
    en: 'Welcome. From this page you can view your attendance rate and cumulative GPA at a glance.',
    icon: Icons.waving_hand_rounded,
  ),
  const TourSlide(
    ar: 'من صفحة درجاتي يمكنك متابعة علاماتك في كل مادة، ومراقبة تطور مستواك الدراسي أولاً بأول.',
    en: 'From the grades page you can track your marks in every subject and monitor your academic progress.',
    icon: Icons.grade_rounded,
  ),
  const TourSlide(
    ar: 'يتيح لك التقويم متابعة مواعيد حصصك واختباراتك، وكل الأحداث المهمة المتعلقة بدراستك.',
    en: 'The calendar lets you track your class times, exams, and all important academic events.',
    icon: Icons.calendar_month_rounded,
  ),
  const TourSlide(
    ar: 'في صفحة الزملاء يمكنك الاطلاع على طلاب شعبتك والتواصل معهم بسهولة.',
    en: 'In the classmates page you can see students in your section and connect with them easily.',
    icon: Icons.groups_rounded,
  ),
  const TourSlide(
    ar: 'يعرض لك الجدول الأسبوعي ترتيب حصصك يوماً بيوم بشكل واضح ومنظم.',
    en: 'Your weekly schedule shows your classes day by day, clearly organized.',
    icon: Icons.schedule_rounded,
  ),
  const TourSlide(
    ar: 'أصبحت الآن جاهزاً لبدء رحلتك الدراسية معنا. بالتوفيق.',
    en: "You're now ready to begin your academic journey with us. Good luck.",
    icon: Icons.rocket_launch_rounded,
  ),
];

final List<TourSlide> teacherTourSlides = [
  const TourSlide(
    ar: 'مرحباً بك أستاذي الفاضل. من لوحة التحكم يمكنك الاطلاع على مهام يومك بنظرة واحدة.',
    en: 'Welcome. From your dashboard you can view your daily tasks at a glance.',
    icon: Icons.waving_hand_rounded,
  ),
  const TourSlide(
    ar: 'من صفحة رصد الدرجات والمهام يمكنك تسجيل علامات طلابك ومتابعة تسليم الواجبات.',
    en: 'From "Grades & Tasks" you can record student grades and track assignment submissions.',
    icon: Icons.assignment_turned_in_rounded,
  ),
  const TourSlide(
    ar: 'يمكنك إنشاء مهمة جديدة لطلابك بضغطة واحدة فقط، بكل سهولة.',
    en: 'You can create a new task for your students with just a single tap.',
    icon: Icons.add_task_rounded,
  ),
  const TourSlide(
    ar: 'يحفظ بنك الأسئلة أسئلتك ليتيح لك إعادة استخدامها في أي اختبار جديد.',
    en: 'The question bank stores your questions so you can reuse them in any new exam.',
    icon: Icons.quiz_rounded,
  ),
  const TourSlide(
    ar: 'يعرض لك الجدول الأسبوعي حصصك في جميع الشعب بترتيب واضح ومنظم.',
    en: 'Your weekly schedule shows your classes across all sections, clearly organized.',
    icon: Icons.schedule_rounded,
  ),
  const TourSlide(
    ar: 'أصبحت الآن جاهزاً لإدارة صفوفك بكل سهولة وفعالية.',
    en: "You're now ready to manage your classes with ease and efficiency.",
    icon: Icons.rocket_launch_rounded,
  ),
];
final List<TourSlide> supervisorTourSlides = [
  const TourSlide(
    ar: 'مرحباً بك. من لوحة التحكم يمكنك الاطلاع على إحصائيات المدرسة كافة بنظرة واحدة.',
    en: "Welcome. From the dashboard you can view the entire school's statistics at a glance.",
    icon: Icons.waving_hand_rounded,
  ),
  const TourSlide(
    ar: 'من صفحة إدارة الحضور والانصراف يمكنك متابعة حضور جميع الطلاب لحظة بلحظة.',
    en: 'From "Attendance Management" you can track all students\' attendance in real time.',
    icon: Icons.fact_check_rounded,
  ),
  const TourSlide(
    ar: 'يمكنك إدارة الكادر التعليمي بأكمله من مكان واحد بكل يسر.',
    en: 'You can manage the entire teaching staff from one place with ease.',
    icon: Icons.people_alt_rounded,
  ),
  const TourSlide(
    ar: 'تتيح لك ميزة نقل الطلاب نقل أي طالب بين الشعب بضغطة واحدة فقط.',
    en: '"Student Transfer" lets you move any student between sections with a single tap.',
    icon: Icons.swap_horiz_rounded,
  ),
  const TourSlide(
    ar: 'تصل الإعلانات إلى المدرسة بأكملها أو إلى شعبة محددة، حسب اختيارك.',
    en: 'Announcements reach the whole school or a specific section, as you choose.',
    icon: Icons.campaign_rounded,
  ),
  const TourSlide(
    ar: 'أصبحت الآن جاهزاً لإدارة المدرسة بكل ثقة وكفاءة.',
    en: "You're now ready to manage the school with confidence and efficiency.",
    icon: Icons.rocket_launch_rounded,
  ),
];

class AppTour extends StatefulWidget {
  final List<TourSlide>? slides;
  final String mascotAsset;
  final VoidCallback? onFinished;

  const AppTour({
    super.key,
    this.slides,
    this.mascotAsset = 'assets/lottie/student.json',
    this.onFinished,
  });

  @override
  State<AppTour> createState() => _AppTourState();
}

class _AppTourState extends State<AppTour> {
  final PageController _pageController = PageController();
  late final List<TourSlide> _slides;
  late final FlutterTts _tts;
  int _index = 0;
  bool _isArabic = true;

  @override
  void initState() {
    super.initState();
    _slides = widget.slides ?? studentTourSlides;
    _tts = FlutterTts();

    _tts.setCompletionHandler(() {
      if (!mounted) return;
      if (_index < _slides.length - 1) {
        _goTo(_index + 1);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final deviceLocale =
          Localizations.maybeLocaleOf(context)?.languageCode ?? 'ar';
      setState(() => _isArabic = deviceLocale == 'ar');
      _speakCurrent();
    });
  }

  Future<void> _speakCurrent() async {
    final slide = _slides[_index];
    final text = _isArabic ? slide.ar : slide.en;
    await _tts.stop();
    await _tts.setLanguage(_isArabic ? 'ar-SA' : 'en-US');
    await _tts.setPitch(1.0);
    await _tts.setSpeechRate(0.4);
    await _tts.speak(text);
  }

  void _goTo(int i) {
    if (i < 0 || i >= _slides.length) return;
    _pageController.animateToPage(
      i,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
    );
  }

  void _toggleLang() {
    setState(() => _isArabic = !_isArabic);
    _speakCurrent();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAF5),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: widget.onFinished,
                    child: Text(
                      _isArabic ? 'تخطي' : 'Skip',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: _toggleLang,
                    child: Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: kOliveLight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _isArabic ? 'EN' : 'ع',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kcolorOlive,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _slides.length,
                  onPageChanged: (i) {
                    setState(() => _index = i);
                    _speakCurrent();
                  },
                  itemBuilder: (context, i) => _TourPage(
                    slide: _slides[i],
                    mascotAsset: widget.mascotAsset,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _slides.length,
                    (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: i == _index ? 18 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: i == _index ? kcolorOlive : kOliveLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                child: SizedBox(
                  height: 52,
                  child: FilledButton(
                    onPressed: () {
                      if (_index == _slides.length - 1) {
                        widget.onFinished?.call();
                      } else {
                        _goTo(_index + 1);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: kcolorOlive,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      _index == _slides.length - 1
                          ? (_isArabic ? 'ابدأ الآن' : 'Get Started')
                          : (_isArabic ? 'التالي' : 'Next'),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TourPage extends StatefulWidget {
  final TourSlide slide;
  final String mascotAsset;
  const _TourPage({required this.slide, required this.mascotAsset});

  @override
  State<_TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<_TourPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _zoomCtrl;

  @override
  void initState() {
    super.initState();
    _zoomCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _zoomCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Directionality.of(context) == TextDirection.rtl;
    final text = isArabic ? widget.slide.ar : widget.slide.en;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 60,
                  right: 8,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Lottie.asset(
                      widget.mascotAsset,
                      repeat: true,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.person_rounded,
                        size: 90,
                        color: kcolorOlive,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 190,
                  left: 4,
                  right: 100,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, anim) => SlideTransition(
                      position:
                          Tween<Offset>(
                            begin: const Offset(0, 0.3),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: anim,
                              curve: Curves.easeOut,
                            ),
                          ),
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 0.85, end: 1.0).animate(
                          CurvedAnimation(parent: anim, curve: Curves.easeOut),
                        ),
                        alignment: Alignment.bottomRight,
                        child: FadeTransition(opacity: anim, child: child),
                      ),
                    ),
                    child: _SpeechBubble(key: ValueKey(text), text: text),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SpeechBubble extends StatelessWidget {
  final String text;
  const _SpeechBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BubbleTailPainter(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kOliveLight, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.w600,
            height: 1.6,
            color: Color(0xFF3A3A2E),
          ),
        ),
      ),
    );
  }
}

class _BubbleTailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final path = Path()
      ..moveTo(size.width - 46, size.height - 4)
      ..lineTo(size.width - 26, size.height + 16)
      ..lineTo(size.width - 60, size.height - 4)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BubbleTailPainter oldDelegate) => false;
}
