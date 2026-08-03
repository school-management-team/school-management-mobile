import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/LessonTimelineItem.dart';
import 'package:school/constant.dart';
import 'package:school/core/widget/Text/text_style.dart';

class SchoolWeekSelector extends StatefulWidget {
  const SchoolWeekSelector({super.key});

  @override
  State<SchoolWeekSelector> createState() => _SchoolWeekSelectorState();
}

class _SchoolWeekSelectorState extends State<SchoolWeekSelector> {
  final List<String> days = ['الجمعة', 'السبت', 'الأحد', 'الاثنين', 'الثلاثاء'];
  final List<String> dates = ['1', '2', '3', '4', '5'];

  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: 
        Padding(
                  padding: const EdgeInsets.all(16),child: 
      Column(
        children: [
          listviewWeekend(),
         SizedBox(height: 16.sp,),
       
                 
                    LessonTimelineItem(
                      session: "الحصة الأولى",
                      title: "الرياضيات المتقدمة",
                      time: "08:00",
                      status: "current", 
                      teacher: "أحمد الصالح",
                      room: "قاعة 302",
                    ),
                    LessonTimelineItem(
                      session: "الحصة الثانية",
                      title: "اللغة الإنجليزية",
                      time: "09:15",
                      status: "upcoming", 
                      teacher: "بيان يوسف",
                      room: "قاعة 205",
                    ),
                    LessonTimelineItem(
                      session: "",
                      title: "",
                      time: "15 دقيقة",
                      status: "break", 
                      teacher: "",
                      room: "",
                    ),
                    LessonTimelineItem(
                      session: "الحصة الثالثة",
                      title: "الفيزياء النووية",
                      time: "10:45",
                      status: "upcoming",
                      teacher: "خالد العبيد",
                      room: "قاعة 101",
                    ),
                    SizedBox(height: 20.sp,),
                 
     Container(
      margin: const EdgeInsets.all(16),
      padding:  EdgeInsets.symmetric(horizontal: 16.sp,vertical: 16.sp),
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
          Text("ساعات الدوام", style: TextSt.textstyle14.copyWith(color:Colors.grey[400])),
           SizedBox(height: 16.sp),
           Text(
             "بقي لك 4 ساعات دراسية اليوم",
            style: TextSt.textstyle24.copyWith(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.end,
          ),
           SizedBox(height: 20.sp),
          Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcolorgreen, 
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding:  EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                ),
                child:  Text("عرض الإحصائيات",style: TextSt.textstyle16.copyWith(color:Colors.white ),),
              ),
            Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              Text(" إنجاز اليوم",style: TextSt.textstyle12.copyWith(color:Colors.white ),),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:  kcolorgreen.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child:  Text("70%", style: TextSt.textstyle16.copyWith(color: kcolorgreen,)),
                  ),

                ],
              ),
            ],
          ),
        ]))
                  ],
                )
      ),
    );
  }

  Container listviewWeekend() {
    return Container(
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 5.sp),
          child: SizedBox(
            height: 112.sp,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(days.length, (index) {
                bool isSelected = selectedIndex == index;
    
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding:  EdgeInsets.symmetric(
                      horizontal: 16.sp,
                      vertical: 12.sp,
                    ),
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
                          days[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[600],
                            fontSize: 14.sp,
                          ),
                        ),
                         SizedBox(height: 8.sp),
                        Text(
                          dates[index],
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
              }),
            ),
          ),
        );
  }
}
