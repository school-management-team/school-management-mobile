import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/calendarcubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/calendarmodel.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/eventDetails.dart';

class Activities extends StatelessWidget {
  final List<ActivitiesModel> activitiesList;
  final String selectedTab;

  Activities({
    super.key,
    required this.activitiesList,
    required this.selectedTab,
  });

  final List<String> tabs = ['الكل', "أكاديمي", "نشاطات", "إداري"];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: tabs.map((tab) {
                final isSelected = selectedTab == tab;
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ChoiceChip(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    label: Text(
                      tab,
                      style: TextStyle(
                        color: isSelected
                            ? Color(0xFFFFFFFF)
                            : Color(0xFF000000),
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: const Color(0xFF007A5E),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    onSelected: (bool select) {
                      if (select) {
                        context.read<CalendarCubit>().changeTab(tab);
                      }
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20.h),
          for (var item in activitiesList)
            Card(
              margin: EdgeInsets.only(bottom: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.showImage)
                    Stack(
                      children: [
                        Container(height: 250.h, color: Colors.grey.shade100),
                        Positioned(
                          child: buildCard(
                            item.tag,
                            item.tagColor,
                            false,
                            null,
                          ),
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!item.showImage)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.warning_amber_outlined,
                                      size: 13,
                                      color: item.tagColor,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(item.tag),
                                  ],
                                ),
                              ),
                              SizedBox(width: 15.w),
                              Text(item.time),
                              SizedBox(width: 90.w),
                              if (item.showMenu) const Icon(Icons.more_vert),
                            ],
                          ),
                        if (item.showImage)
                          Row(
                            children: [
                              const Icon(Icons.access_time),
                              SizedBox(width: 6.w),
                              Text(item.time),
                            ],
                          ),
                        SizedBox(height: 15.h),
                        Text(
                          item.title,
                          style: TextStyle(
                            color: const Color(0xFF000000),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(item.description),
                        if (item.filename != null) ...[
                          SizedBox(height: 18.h),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Color(0XFF44474D).withOpacity(0.07),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.picture_as_pdf,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.filename!),
                                      Text(item.filesize!),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.download),
                              ],
                            ),
                          ),
                        ],
                        if (item.showMore) ...[
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              /* Row(
                                children: [
                                  CircleAvatar(radius: 12.r),
                                  Transform.translate(
                                    offset: const Offset(8, 0),
                                    child: CircleAvatar(radius: 12.r),
                                  ),
                                  Transform.translate(
                                    offset: const Offset(16, 1),
                                    child: CircleAvatar(
                                      radius: 12.r,
                                      child: const Text('+42'),
                                    ),
                                  ),
                                ],
                              )*/
                              Row(
                                children: [
                                  const Text('قراءة المزيد'),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EventDetailsPage(event: item),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.arrow_forward),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildCard(String text, Color color, bool isLight, String? time) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.circle, size: 6, color: color),
            SizedBox(width: 4.w),
            Text(
              text,
              style: TextStyle(
                color: isLight ? color : Colors.black,
                fontSize: 11.sp,
              ),
            ),
            if (isLight && time != null) ...[SizedBox(width: 8.w), Text(time)],
          ],
        ),
      ),
    );
  }
}
