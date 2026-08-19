import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/calendarcubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/activities.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/events.dart';

class calendarbody extends StatelessWidget {
  const calendarbody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarCubit()..loadCalendarData(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: 390.w,
          padding: const EdgeInsets.only(
            bottom: 60,
            left: 16,
            right: 16,
            top: 0,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                width: 370.w,
                padding: const EdgeInsets.only(top: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "الإعلانات والتقويم",
                      style: TextStyle(
                        color: const Color(0xFF1C1C18),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "اطلع على أحدث الفعاليات والمستجدات الأكاديمية",
                      style: TextStyle(
                        color: const Color(0xFF44474D),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              BlocBuilder<CalendarCubit, CalendarState>(
                builder: (context, state) {
                  if (state is CalendarLoadedState) {
                    return Column(
                      children: [
                        Eventsstate(events: state.events),
                        SizedBox(height: 40.h),
                        Activities(
                          activitiesList: state.filteredActivities,
                          selectedTab: state.selectedTab,
                        ),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
