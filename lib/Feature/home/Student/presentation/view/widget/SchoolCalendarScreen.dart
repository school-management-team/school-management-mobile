import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SchoolCalendarScreen extends StatefulWidget {
  final Map<DateTime, Map<String, dynamic>> events;

  const SchoolCalendarScreen({
    super.key,
    required this.events,
  });

  @override
  State<SchoolCalendarScreen> createState() =>
      _SchoolCalendarScreenState();
}

class _SchoolCalendarScreenState
    extends State<SchoolCalendarScreen> {
  DateTime? selectedDate;
  DateTime focusedDay = DateTime.now();

  String _getMonthName(int month) {
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

    return months[month - 1];
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(
      date.year,
      date.month,
      date.day,
    );
  }

  Map<DateTime, Map<String, dynamic>> _getNormalizedEvents() {
    final Map<DateTime, Map<String, dynamic>> result =
        LinkedHashMap<DateTime, Map<String, dynamic>>(
      equals: isSameDay,
      hashCode: (DateTime key) {
        return key.year * 10000 +
            key.month * 100 +
            key.day;
      },
    );

    for (final entry in widget.events.entries) {
      final normalizedDate = _normalizeDate(entry.key);

      result[normalizedDate] = entry.value;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final events = _getNormalizedEvents();

    final Map<DateTime, Map<String, dynamic>> filteredEvents =
        selectedDate == null
            ? events
            : Map.fromEntries(
                events.entries.where(
                  (entry) => isSameDay(
                    entry.key,
                    selectedDate!,
                  ),
                ),
              );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.all(10.sp),
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
            height: 500.sp,
            child: TableCalendar<Map<String, dynamic>>(
              locale: 'ar_SA',

              firstDay: DateTime(2025, 1, 1),
              lastDay: DateTime(2030, 12, 31),

              focusedDay: focusedDay,

              calendarFormat: CalendarFormat.month,

              availableCalendarFormats: const {
                CalendarFormat.month: 'شهر',
              },

              selectedDayPredicate: (day) {
                return selectedDate != null &&
                    isSameDay(
                      selectedDate!,
                      day,
                    );
              },

              onDaySelected: (
                selectedDay,
                newFocusedDay,
              ) {
                setState(() {
                  focusedDay = newFocusedDay;

                  if (selectedDate != null &&
                      isSameDay(
                        selectedDate!,
                        selectedDay,
                      )) {
                    selectedDate = null;
                  } else {
                    selectedDate =
                        _normalizeDate(selectedDay);
                  }
                });
              },

              onPageChanged: (newFocusedDay) {
                focusedDay = newFocusedDay;
              },

              eventLoader: (day) {
                final normalizedDay =
                    _normalizeDate(day);

                final event = events[normalizedDay];if (event == null) {
                  return [];
                }

                return [event];
              },

              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: kcolorOlive,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: kcolorgreen,
                  shape: BoxShape.circle,
                ),
                markerDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                markersMaxCount: 1,
              ),

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

              calendarBuilders: CalendarBuilders(
                markerBuilder: (
                  context,
                  date,
                  dayEvents,
                ) {
                  if (dayEvents.isEmpty) {
                    return null;
                  }

                  final event =
                      dayEvents.first;

                  final eventType =
                      event['type']?.toString();

                  final bool isExam =
                      eventType == 'exam' ||
                      eventType == 'academic';

                  return Positioned(
                    bottom: 1,
                    child: Container(
                      width: 7.sp,
                      height: 7.sp,
                      decoration: BoxDecoration(
                        color: isExam
                            ? Colors.green
                            : Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        SizedBox(height: 16.sp),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.sp,
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              if (selectedDate != null)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = null;
                    });
                  },
                  child: Text(
                    'إظهار الكل',
                    style: TextSt.textstyle14.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),

              const Spacer(),

              Text(
                selectedDate == null
                    ? 'تواريخ هامة'
                    : 'أحداث اليوم المختار',
                style: TextSt.textstyle17,
              ),
            ],
          ),
        ),

        SizedBox(height: 10.sp),

        SizedBox(
          height: 250.sp,
          child: filteredEvents.isEmpty
              ? Center(
                  child: Text(
                    selectedDate == null
                        ? 'لا توجد تواريخ هامة حالياً'
                        : 'لا توجد تواريخ أو أحداث في هذا اليوم',
                    style: TextSt.textstyle14.copyWith(
                      color: Colors.grey,
                    ),),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredEvents.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    final entry =
                        filteredEvents.entries
                            .elementAt(index);

                    final date = entry.key;
                    final event = entry.value;

                    final String eventType =
                        event['type']?.toString() ??
                            'academic';

                    final bool isExam =
                        eventType == 'exam' ||
                        eventType == 'academic';

                    final String eventName =
                        event['name']
                                ?.toString() ??
                            '';

                    final String description =
                        event['description']
                                ?.toString() ??
                            '';

                    return Container(
                      width: 260.sp,
                      margin: EdgeInsets.all(8.sp),
                      padding: EdgeInsets.all(12.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(
                          15.sp,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.15),
                            offset:
                                const Offset(4, 4),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${date.day} ${_getMonthName(date.month)}',
                            textDirection:
                                TextDirection.rtl,
                            style: TextStyle(
                              color: isExam
                                  ? Colors.green
                                  : Colors.orange,
                              fontWeight:
                                  FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),

                          SizedBox(height: 12.sp),

                          Text(
                            eventName,
                            style:
                                TextSt.textstyle16,
                            textAlign:
                                TextAlign.right,
                            maxLines: 2,
                            overflow:
                                TextOverflow.ellipsis,
                          ),

                          if (description.isNotEmpty) ...[
                            SizedBox(height: 6.sp),

                            Text(
                              description,
                              style: TextSt
                                  .textstyle14
                                  .copyWith(
                                color: Colors
                                    .grey
                                    .shade600,
                              ),
                              textAlign:
                                  TextAlign.right,
                              maxLines: 3,
                              overflow:
                                  TextOverflow.ellipsis,
                            ),
                          ],

                          const Spacer(),Align(
                            alignment:
                                Alignment.bottomLeft,
                            child: Icon(
                              isExam
                                  ? Icons
                                      .edit_calendar
                                  : Icons
                                      .celebration,
                              color: isExam
                                  ? Colors.green
                                  : Colors.orange,
                              size: 25.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}