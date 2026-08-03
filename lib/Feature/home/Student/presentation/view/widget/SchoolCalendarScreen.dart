import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/logic/manger/cubit_dash2_student/dash2_student_cubit.dart';
import 'package:school/constant.dart';

import 'package:school/core/widget/Text/text_style.dart';
import 'package:table_calendar/table_calendar.dart';

class SchoolCalendarScreen extends StatefulWidget {
  @override
  _SchoolCalendarScreenState createState() => _SchoolCalendarScreenState();
}

class _SchoolCalendarScreenState extends State<SchoolCalendarScreen> {
  final Map<DateTime, Map<String, dynamic>> events = LinkedHashMap(
    equals: isSameDay,
    hashCode: (DateTime key) =>
        key.day * 1000000 + key.month * 10000 + key.year,
  )..addAll({});
  String _getMonthName(int month) {
    List<String> months = [
      '',
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
    return months[month];
  }

  void addEvent(DateTime date, String name, String type) {
    setState(() => events[date] = {'name': name, 'type': type});
  }

  void _showAddEventDialog(DateTime date) {
    TextEditingController nameController = TextEditingController();
    String type = 'activity';
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text("إضافة مناسبة"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "اسم المناسبة"),
                ),
                DropdownButton<String>(
                  value: type,
                  items: [
                    DropdownMenuItem(value: 'activity', child: Text("نشاط ")),
                    DropdownMenuItem(value: 'exam', child: Text("امتحان ")),
                  ],
                  onChanged: (val) => setDialogState(() => type = val!),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    addEvent(date, nameController.text, type);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "حفظ",
                  style: TextSt.textstyle14.copyWith(color: kcolorOlive),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Dash2StudentCubit,Dash2StudentState>(
      builder: (context, state) {
            if (state is Dash2StudentLoading) {
               return Center(
                child: Padding(padding: EdgeInsets.symmetric(vertical: 50.sp),child: 
                CircularProgressIndicator()),
               );
              } else if (state is Dash2StudentFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }else if(state is Dash2StudentSuccess){
          final Map<DateTime, Map<String, dynamic>>events = LinkedHashMap(
    equals: isSameDay,
    hashCode: (DateTime key) =>
        key.day * 1000000 + key.month * 10000 + key.year,
  )..addAll(state.events);
              }     
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(10),
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
                child: SizedBox(
                  height: 400,
                  child: TableCalendar(
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: kcolorOlive,
                        shape: BoxShape.circle,
                      ),
                    ),
                    locale: 'ar_SA',

                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        fontSize: 12.sp,
                        color: kcolorOlive,
                      ),
                      weekendStyle: TextStyle(
                        fontSize: 12.sp,
                        color: kcolorOlive,
                      ),
                    ),
                    firstDay: DateTime.utc(2025, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: DateTime.now(),
                    onDaySelected: (selectedDay, _) =>
                        _showAddEventDialog(selectedDay),
                    eventLoader: (day) =>
                        events.containsKey(day) ? [events[day]] : [],
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, events) {
                        if (events.isNotEmpty) {
                          var event = events.first as Map<String, dynamic>;
                          return Positioned(
                            bottom: 1,
                            child: Container(
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                color: event['type'] == 'exam'
                                    ? Colors.green
                                    : Colors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("تواريخ هامة", style: TextSt.textstyle17),
              ),

              SizedBox(
                height: 200.sp,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    DateTime date = events.keys.elementAt(index);
                    var event = events[date]!;
                    bool isExam = event['type'] == 'exam';

                    return Container(
                      width: 180.sp,

                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(4, 4),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "${date.day} ${_getMonthName(date.month)}",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: isExam ? Colors.green : Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.sp),
                          Text(
                            event['name'],
                            style: TextSt.textstyle16,
                            textAlign: TextAlign.end,
                          ),
                          Spacer(),

                          Icon(
                            isExam ? Icons.edit_calendar : Icons.celebration,
                            color: isExam ? Colors.green : Colors.orange,
                            size: 25.sp,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
