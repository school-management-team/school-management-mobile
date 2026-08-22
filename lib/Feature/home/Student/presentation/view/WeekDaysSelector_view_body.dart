import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/LessonTimelineItem.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_weekDaysSelector/cubit_week_days_selector_cubit.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SchoolWeekSelector extends StatefulWidget {
  const SchoolWeekSelector({super.key});

  @override
  State<SchoolWeekSelector> createState() => _SchoolWeekSelectorState();
}

class _SchoolWeekSelectorState extends State<SchoolWeekSelector> {
  
  DateTime selectedMonth = DateTime(2026, 8);

  int selectedWeek = 0;

  int selectedDayIndex = 3;

  final List<String> arabicDays = [
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
  ];

  @override
  void initState() {
    super.initState();

  
    _fetchScheduleForSelectedDay();
  }



  List<DateTime> get weeksDays {
    final firstDayOfMonth = DateTime(
      selectedMonth.year,
      selectedMonth.month,
      1,
    );

   

    final firstWeekStart = firstDayOfMonth.subtract(
      Duration(days: firstDayOfMonth.weekday % 7),
    );

    final weekStart = firstWeekStart.add(Duration(days: selectedWeek * 7));

    return List.generate(7, (index) {
      return weekStart.add(Duration(days: index));
    });
  }


  void _fetchScheduleForSelectedDay() {
    final selectedDate = weeksDays[selectedDayIndex];

    final formattedDate =
        "${selectedDate.year}-"
        "${selectedDate.month.toString().padLeft(2, '0')}-"
        "${selectedDate.day.toString().padLeft(2, '0')}";

    debugPrint("Selected date: $formattedDate");

    context.read<CubitWeekDaysSelectorCubit>().getDailySchedulee(
      data: formattedDate,
    );
  }


  void _changeWeek(int weekIndex) {
    setState(() {
      selectedWeek = weekIndex;

     
      selectedDayIndex = 0;
    });

    _fetchScheduleForSelectedDay();
  }


  String get monthName {
    const months = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];

    return months[selectedMonth.month - 1];
  }


  int get numberOfWeeks {
    final firstDay = DateTime(selectedMonth.year, selectedMonth.month, 1);

    final lastDay = DateTime(selectedMonth.year, selectedMonth.month + 1, 0);
    final firstWeekStart = firstDay.subtract(
      Duration(days: firstDay.weekday % 7),
    );

    final lastWeekEnd = lastDay.add(Duration(days: 6 - (lastDay.weekday % 7)));

    final difference = lastWeekEnd.difference(firstWeekStart).inDays + 1;

    return (difference / 7).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
           
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$monthName ${selectedMonth.year}',
                style: TextSt.textstyle16.copyWith(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 12.sp),

            _buildWeeksSelector(),

            SizedBox(height: 12.sp),

            listviewWeekend(),

            SizedBox(height: 16.sp),

            BlocConsumer<
              CubitWeekDaysSelectorCubit,
              CubitWeekDaysSelectorState
            >(
              listener: (context, state) {
                if (state is CubitWeekDaysSelectorFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is CubitWeekDaysSelectorLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(color: kcolorOlive),
                    ),
                  );
                }

                if (state is CubitWeekDaysSelectorSuccess) {
                  final scheduleList = state.sheduleList ?? [];

                  if (scheduleList.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.sp),
                        child: Text(
                          "لا توجد حصص لهذا اليوم",
                          style: TextSt.textstyle16,
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: [
                      ...List.generate(scheduleList.length, (index) {
                        final item = scheduleList[index];

                        List<Widget> widgets = [
                          LessonTimelineItem(
                            title: item.subjectName,
                            time:
                                "${_formatTime(item.startTime)} - "
                                "${_formatTime(item.endTime)}",
                            session: "الحصة ${item.periodNumber}",
                            status: item.status.isNotEmpty
                                ? item.status
                                : "upcoming",
                            teacher: item.teacherAssignment.user.userName,
                            room: "شعبة ${item.sectionName}",
                          ),
                        ];

                        if (item.periodNumber == 3 ||
                            (index == 1 && scheduleList.length > 2)) {
                          widgets.add(
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 12.sp),
                              padding: EdgeInsets.symmetric(
                                vertical: 10.sp,
                                horizontal: 16.sp,
                              ),
                              decoration: BoxDecoration(
                                color: kcolorgreen.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: kcolorgreen.withOpacity(0.4),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.coffee, color: kcolorgreen),
                                  SizedBox(width: 8.sp),
                                  Text(
                                    "وقت الاستراحة (فرصة)",
                                    style: TextSt.textstyle14.copyWith(
                                      color: kcolorgreen,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        return Column(children: widgets);
                      }),

                      SizedBox(height: 20.sp),

                      _buildDailySummaryCard(scheduleList.length),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeksSelector() {
    return SizedBox(
      height: 48.sp,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numberOfWeeks,
        itemBuilder: (context, index) {
          final isSelected = selectedWeek == index;

          return GestureDetector(
            onTap: () {
              _changeWeek(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(horizontal: 4.sp),
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                color: isSelected ? kcolorgreen : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? kcolorgreen : Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  'الأسبوع ${index + 1}',
                  style: TextSt.textstyle14.copyWith(
                    color: isSelected ? Colors.white : Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget listviewWeekend() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 5.sp),
      child: SizedBox(
        height: 112.sp,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weeksDays.length,
          itemBuilder: (context, index) {
            final date = weeksDays[index];

            final bool isSelected = selectedDayIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDayIndex = index;
                });

                _fetchScheduleForSelectedDay();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.sp,
                  vertical: 12.sp,
                ),
                margin: EdgeInsets.symmetric(horizontal: 4.sp),
                decoration: BoxDecoration(
                  color: isSelected ? kcolorgreen : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: kcolorgreen.withOpacity(0.3),
                            blurRadius: 9,
                            offset: const Offset(4, 7),
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      arabicDays[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey[600],
                        fontSize: 14.sp,
                      ),
                    ),

                    SizedBox(height: 8.sp),
                    Text(
                      date.day.toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _formatTime(String timeStr) {
    if (timeStr.contains(':')) {
      final parts = timeStr.split(':');

      if (parts.length >= 2) {
        return "${parts[0]}:${parts[1]}";
      }
    }

    return timeStr;
  }

  Widget _buildDailySummaryCard(int totalLessons) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        color: const Color(0xFF091C31),
        borderRadius: BorderRadius.circular(24.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 0,
            offset: const Offset(8, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "ساعات الدوام",
            style: TextSt.textstyle14.copyWith(color: Colors.grey[400]),
          ),

          SizedBox(height: 16.sp),

          Text(
            "إجمالي الحصص اليوم: "
            "$totalLessons حصص",
            style: TextSt.textstyle24.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),

          SizedBox(height: 20.sp),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcolorgreen,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.sp,
                    vertical: 10.sp,
                  ),
                ),
                child: Text(
                  "عرض الإحصائيات",
                  style: TextSt.textstyle16.copyWith(color: Colors.white),
                ),
              ),

              const Spacer(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    " إنجاز اليوم ",
                    style: TextSt.textstyle12.copyWith(color: Colors.white),
                  ),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kcolorgreen.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "100%",
                      style: TextSt.textstyle16.copyWith(color: kcolorgreen),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
