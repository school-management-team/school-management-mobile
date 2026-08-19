import 'package:flutter/material.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/calendarmodel.dart';

class MockCalendarData {
  static List<EventModel> eventsList = [
    EventModel(
      day: '12',
      month: 'أكتوبر',
      subtitle: "تجمع الطلاب في الساحة الرئيسية للمدرسة",
      title: "رحلة مدرسية إلى المتحف الوطني",
      background: const Color(0xFFB87500),
    ),
    EventModel(
      day: '18',
      month: 'أكتوبر',
      subtitle: "تبدأ الاختبارات للمرحلة المتوسطة",
      title: "بداية اختبارات منتصف الفصل",
      background: const Color(0xFFBA1A1A),
    ),
    EventModel(
      day: '27',
      month: 'أكتوبر',
      subtitle: "دعوة مفتوحة لأولياء الأمور لحضوره",
      title: "معرض العلوم السنوي",
      background: const Color(0xFF006C49),
    ),
  ];

  static List<ActivitiesModel> activitiesList = [
    ActivitiesModel(
      category: "نشاطات",
      description:
          "نود إعلامكم بتفاصيل الرحلة المدرسية القادمة إلى المتحف الوطني لتوسيع الآفاق الثقافية للطلاب.",
      tag: "نشاط مدرسي",
      time: "نشر منذ ساعتين",
      tagColor: Colors.deepOrangeAccent,
      title: "تفاصيل الرحلة المدرسية إلى المتحف الوطني",
      showMore: true,
      showImage: true,
    ),
    ActivitiesModel(
      category: "أكاديمي",
      description:
          "نود إعلامكم بتحديث جدول اختبارات منتصف الفصل الدراسي الأول لجميع المراحل الدراسية.",
      tag: "هام",
      time: "أمس ,10:30 صباحا",
      tagColor: Colors.deepOrangeAccent,
      title: "تحديث جدول اختبارات منتصف الفصل الدراسي الأول",
      showMore: false,
      showImage: false,
      showMenu: true,
      filename: 'جدول اختبارات محدث.pdf',
      filesize: '1.2 MB',
    ),
    ActivitiesModel(
      category: "إداري",
      description:
          "يرجى من جميع أولياء الأمور مراجعة الإدارة وتحديث بيانات التواصل في أقرب وقت.",
      tag: "هام",
      time: "أمس ,10:30 صباحا",
      tagColor: Colors.deepOrangeAccent,
      title: "تحديث البيانات الإدارية لأولياء الأمور",
      showMore: false,
      showImage: false,
      showMenu: true,
      filename: 'استمارة البيانات.pdf',
      filesize: '1.2 MB',
    ),
  ];
}
