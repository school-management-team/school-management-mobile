import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/addfilesfromteacher.dart';

class addnewtaskteacher extends StatefulWidget {
  const addnewtaskteacher({super.key});
  @override
  State<addnewtaskteacher> createState() => Addnewtaskteacher();
}

class Addnewtaskteacher extends State<addnewtaskteacher> {
  String? selectsubject;
  final List<String> subjects = [
    'رياضيات',
    'انكليزي',
    'علوم',
    'اجتماعيات',
    'ديانة',
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        children: [
          Container(
            // width: 342.w,
            //height: 789.33.h,
            //margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 342.w,
                    // height: 129.19.h,
                    padding: EdgeInsets.only(
                      bottom: 24.01,
                      left: 24,
                      right: 24,
                      top: 23,
                    ),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Color(0xFFFFFFFF).withOpacity(0.7),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0XFF071A2F).withOpacity(0.05),
                          offset: Offset(0, 3),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 292.w,
                          //height: 20.59.h,
                          padding: EdgeInsets.only(bottom: 0.59),
                          child: SizedBox(
                            width: 35.16,
                            height: 20.h,
                            child: Text(
                              'المادة',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF44474D),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: Color(0xFFFFFFFF),
                            border: Border.all(
                              color: Color(0xFF000000).withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          child: DropdownButtonFormField(
                            value: selectsubject,
                            hint: Row(
                              children: [
                                Icon(
                                  Icons.expand_more,
                                  color: Color(0xFF44474D),
                                  size: 20,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'اختر المادة...',
                                  style: TextStyle(
                                    color: Color(0xFF1C1C18),
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            items: subjects.map<DropdownMenuItem<String>>((
                              String value,
                            ) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectsubject = value;
                              });
                            },
                            isExpanded: true,
                            icon: SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //.....................................................
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 342.w,
              // height: 129.19.h,
              padding: EdgeInsets.only(
                bottom: 24.01,
                left: 24,
                right: 24,
                top: 23,
              ),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0xFFFFFFFF).withOpacity(0.7),
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFF071A2F).withOpacity(0.05),
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 292.w,
                    //height: 20.59.h,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.only(bottom: 0.59),
                    child: SizedBox(
                      width: 35.16,
                      height: 20.h,
                      child: Text(
                        'عنوان المهمة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF44474D),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    width: 292.w,
                    // height: 65.59.h,
                    padding: EdgeInsets.only(
                      bottom: 15.59,
                      left: 16,
                      right: 16,
                      top: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Color(0xFF000000).withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'ادخل عنوانا واضحا',
                        hintStyle: TextStyle(
                          color: Color(0xFF44474D).withOpacity(0.5),
                          fontSize: 16.sp,
                        ),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: 292.w,
                    height: 20.59.h,
                    padding: EdgeInsets.only(bottom: 0.59),
                    child: SizedBox(
                      width: 35.16,
                      height: 20.h,
                      child: Text(
                        'الوصف (اختياري)',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF44474D),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    width: 292.w,
                    height: 137.99.h,
                    padding: EdgeInsets.only(
                      bottom: 10.59,
                      left: 16,
                      right: 16,
                      top: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Color(0xFF000000).withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'اكتب تفاصيل المهمة والتعليمات للطلاب...',
                        hintStyle: TextStyle(
                          color: Color(0xFF44474D).withOpacity(0.5),
                          fontSize: 16.sp,
                        ),
                        border: InputBorder.none,
                        hintMaxLines: 2,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 342.w,
              //  height: 172.19.h,
              padding: EdgeInsets.only(
                bottom: 24,
                left: 24,
                right: 24,
                top: 23,
              ),
              margin: EdgeInsets.all(8.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0xFFFFFFFF).withOpacity(0.7),
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFF071A2F).withOpacity(0.05),
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 138.w,
                    height: 80.19.h,
                    margin: EdgeInsets.all(8.01),
                    child: Column(
                      children: [
                        Container(
                          width: 138.w,
                          height: 20.59.h,
                          padding: EdgeInsets.only(bottom: 0.59, right: 10),
                          child: Text(
                            "العلامة القصوى",
                            style: TextStyle(
                              color: Color(0xFF44474D),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          width: 138.w,
                          height: 51.59.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: Color(0xFF000000).withOpacity(0.1),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 90.w,
                                height: 20.59.h,
                                padding: EdgeInsets.only(right: 20),
                                child: Center(
                                  child: Center(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "100",
                                        hintStyle: TextStyle(
                                          color: Color(0xFF1C1C18),
                                          fontSize: 20.sp,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Container(
                                width: 18.w,
                                height: 24.h,
                                child: Center(
                                  child: Icon(
                                    Icons.star_border,
                                    color: Color(0xFF44474D),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 138.w,
                    height: 80.19.h,
                    margin: EdgeInsets.all(8.01),
                    child: Column(
                      children: [
                        Container(
                          width: 138.w,
                          height: 20.59.h,
                          padding: EdgeInsets.only(bottom: 0.59),
                          child: Text(
                            "تاريخ التسليم ",
                            style: TextStyle(
                              color: Color(0xFF44474D),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),

                        Container(
                          width: 138.w,
                          height: 51.59.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: Color(0xFF000000).withOpacity(0.1),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 90.w,
                                // height: 25.59.h,
                                padding: EdgeInsets.only(right: 20),
                                child: Center(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "/mm/dd",
                                      hintStyle: TextStyle(
                                        color: Color(0xFF1C1C18),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Container(
                                width: 18.w,
                                height: 24.h,
                                child: Center(
                                  child: Icon(
                                    Icons.calendar_month_outlined,
                                    color: Color(0xFF44474D),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: addfiles()),
        ],
      ),
    );
  }
}
