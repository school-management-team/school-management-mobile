import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

import 'package:school/Feature/home/Student/Data/models/ImportantAnnouncementModel.dart';
import 'package:school/Feature/home/Student/presentation/view/WeekDaysSelector_view.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/SchoolCalendarScreen.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_dash2_student/dash2_student_cubit.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/widget/Text/text_style.dart';

class Dash2ViewBody extends StatefulWidget {
  const Dash2ViewBody({
    super.key,
  });

  @override
  State<Dash2ViewBody> createState() => _Dash2ViewBodyState();
}

class _Dash2ViewBodyState extends State<Dash2ViewBody> {
  final GlobalKey<PageFlipBuilderState> pageFlipKey =
      GlobalKey<PageFlipBuilderState>();

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Dash2StudentCubit>().fetchCalendarData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Dash2StudentCubit, Dash2StudentState>(
      listener: (context, state) {
        if (state is Dash2StudentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return PageFlipBuilder(
          key: pageFlipKey,
          interactiveFlipEnabled: true,
          flipAxis: Axis.horizontal,
          frontBuilder: (_) => _buildMainContent(state),
          backBuilder: (_) =>  WeekdaysselectorView(),
        );
      },
    );
  }

  Widget _buildMainContent(
    Dash2StudentState state,
  ) {
  
    if (state is Dash2StudentLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

   
    if (state is Dash2StudentFailure) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Text(
            state.message,
            style: TextSt.textstyle14,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    

    final Map<DateTime, Map<String, dynamic>> events =
        state is Dash2StudentSuccess
            ? state.events
            : {};

    final List<ImportantAnnouncementModel> announcements =
        state is Dash2StudentSuccess
            ? state.announcements
            : [];


    final filteredAnnouncements =
        selectedDate == null
            ? announcements
            : announcements.where(
                (announcement) {
                  if (announcement.date == null) {
                    return false;
                  }

                  try {
                    final annDate = DateTime.parse(
                      announcement.date!,
                    );

                    return annDate.year ==
                            selectedDate!.year &&
                        annDate.month ==
                            selectedDate!.month &&
                        annDate.day ==
                            selectedDate!.day;
                  } catch (_) {
                    return false;
                  }
                },
              ).toList();return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
          ),
          child: Column(
            children: [
             
              SchoolCalendarScreen(
                events: events,
              ),

              SizedBox(height: 30.sp),


              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end,
                children: [
                  if (selectedDate != null)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = null;
                        });
                      },
                      child: Text(
                        'إلغاء التحديد',
                        style: TextSt.textstyle14.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),

                  const Spacer(),

                  Text(
                    selectedDate == null
                        ? 'آخر الإعلانات'
                        : 'إعلانات وتواريخ اليوم',
                    style: TextSt.textstyle17,
                  ),
                ],
              ),

              SizedBox(height: 20.sp),

              filteredAnnouncements.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.sp,
                      ),
                      child: Text(
                        selectedDate == null
                            ? 'لا توجد إعلانات حالياً'
                            : 'لا توجد إعلانات في هذا التاريخ',
                        style: TextSt.textstyle14.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount:
                          filteredAnnouncements.length,
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        final announcement =
                            filteredAnnouncements[index];

                        final bool isExam =
                            announcement.type == 'exam' ||
                            announcement.type == 'academic';

                        final Color itemColor =
                            isExam
                                ? Colors.green
                                : Colors.orange;

                        return buildAnnouncement(
                          announcement.title ?? '',
                          announcement.description ?? '',
                          announcement.date ?? '',
                          isExam
                              ? Icons.description
                              : Icons.campaign,
                          itemColor,
                        );
                      },
                    ),

              SizedBox(height: 30.sp),


              GestureDetector(
                onTap: () {
                  pageFlipKey.currentState?.flip();},
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text(
                      'متابعة معلومات جدول الطالب',
                      style: TextSt.textstyle16,
                    ),
                    SizedBox(width: 2.sp),
                    Lottie.asset(
                      AssestData.study,
                      width: 100,
                      height: 100,
                      animate: true,
                      repeat: true,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.sp),
            ],
          ),
        ),
      ),
    );
  }
}



Widget buildAnnouncement(
  String title,
  String subtitle,
  String time,
  IconData icon,
  Color color,
) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 16.sp,
      horizontal: 12.sp,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 12.sp,
      vertical: 16.sp,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.sp),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: const Offset(4, 4),
          blurRadius: 6,
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextSt.textstyle16,
                textAlign: TextAlign.right,
              ),

              SizedBox(height: 4.sp),

              Text(
                subtitle,
                style: TextSt.textstyle14.copyWith(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),

              SizedBox(height: 8.sp),

              Text(
                time,
                style: TextSt.textstyle14.copyWith(
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 16.sp),

        Container(
          height: 65.sp,
          width: 65.sp,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius:
                BorderRadius.circular(8.sp),
          ),
          child: Icon(
            icon,
            color: color,
            size: 30.sp,
          ),
        ),
      ],
    ),
  );
}