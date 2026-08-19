import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/schedulecubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/dataschedulerepo.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/teacherschedule.dart';
import 'package:school/constant.dart';

class TeacherScheduleBody extends StatelessWidget {
  const TeacherScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeacherScheduleCubit()..fetchTeacherSchedule(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: 390.w,
          height: 1250.h,
          padding: const EdgeInsets.only(
            bottom: 24,
            top: 24,
            left: 16,
            right: 16,
          ),
          child: BlocBuilder<TeacherScheduleCubit, TeacherScheduleState>(
            builder: (context, state) {
              if (state is TeacherScheduleLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is TeacherScheduleError) {
                return Center(child: Text(state.message));
              }

              if (state is TeacherScheduleLoaded) {
                final cubit = context.read<TeacherScheduleCubit>();

                return ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "الجدول الإسبوعي للمعلم",
                          style: TextStyle(
                            color: Color(0xFF1C1C18),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "اليوم ${mockDayWork[state.selectedIndex]['day']} : ${mockDayWork[state.selectedIndex]['date']} ",
                          style: const TextStyle(
                            color: Color(0xFF1C1C18),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 7.h),

                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF000000).withOpacity(0.005),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                            color: const Color(0xFFFFFFFF).withOpacity(0.002),
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                              color: const Color(0xFFE5E7EB),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              buildTabButton(
                                name: 'اليوم',
                                isSelected: state.isDaysSelected,
                                onTap: () => cubit.selectTab(true),
                              ),
                              buildTabButton(
                                name: 'أسبوعي',
                                isSelected: !state.isDaysSelected,
                                onTap: () => cubit.selectTab(false),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                        if (state.isDaysSelected) ...[
                          SizedBox(
                            height: 100.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mockDayWork.length,
                              itemBuilder: (context, index) {
                                final item = mockDayWork[index];
                                bool isSelected = index == state.selectedIndex;
                                return GestureDetector(
                                  onTap: () => cubit.selectDay(index),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 80.w,
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      bottom: isSelected ? 8 : 0,
                                      top: isSelected ? 0 : 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.r),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 10,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                      border: Border.all(
                                        color: isSelected
                                            ? const Color(0xFFE5E7EB)
                                            : const Color(0xFFF3F4F6),
                                        width: isSelected ? 1.5 : 1.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item['day']!,
                                          style: TextStyle(
                                            color: const Color(0xFF1C1C18),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          item['date']!,
                                          style: TextStyle(
                                            color: const Color(0xFF1C1C18),
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
                        ],
                        SizedBox(height: 50.h),

                        infoschedule(items: state.activeSchedule),
                      ],
                    ),
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget buildTabButton({
    required String name,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
        decoration: BoxDecoration(
          color: isSelected ? kcolorOlive : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? Color(0xFFFFFFFF) : Color(0xff000000),
            fontSize: 16.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
