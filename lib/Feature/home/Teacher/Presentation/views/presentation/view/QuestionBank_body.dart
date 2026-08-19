import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/questionbankcubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/Generaloverview.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/QuestionList.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/QuickAdd.dart';
import 'package:school/core/widget/Text/text_style.dart';

class questionbankbody extends StatefulWidget {
  const questionbankbody({super.key});
  @override
  State<questionbankbody> createState() => bankquestion();
}

class bankquestion extends State<questionbankbody> {
  //final GlobalKey<_QuestionListState> queslist = GlobalKey<_QuestionListState>();
  String? selectedsubject;
  String? selecteddifficulty;
  final TextEditingController searchcontroller = TextEditingController();
  String? selectsubject;
  String? diff;

  final List<String> subjects = [
    'رياضيات',
    'انكليزي',
    'علوم',
    'اجتماعيات',
    'ديانة',
  ];
  final List<String> difficult = ['سهل', 'متوسط', 'صعب'];

  @override
  void applysearch() {
    final query = searchcontroller.text.trim();
    context.read<QuestionCubit>().searchquestion(
      query: query.isEmpty ? null : query,
      subject: selectedsubject,
      difficulty: selecteddifficulty,
    );
  }

  void resetAllfilters() {
    setState(() {
      searchcontroller.clear();
      selectsubject = null;
      diff = null;
    });
    context.read<QuestionCubit>().resetFilters();
  }

  void applyfilters() {
    context.read<QuestionCubit>().searchquestion(
      difficulty: selecteddifficulty,
      subject: selectedsubject,
    );
  }

  Widget build(BuildContext context) {
    return BlocListener<QuestionCubit, QuestionBankstate>(
      listener: (context, state) {
        if (state is QuestionError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 1554.27.h,
          width: 342.w,
          margin: EdgeInsets.all(24),
          child: ListView(
            children: [
              Container(
                width: 342.w,
                // height: 165.18.h,
                padding: EdgeInsets.only(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  top: 20,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Color(0xFF000000).withOpacity(0.05),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF071A2F).withOpacity(0.05),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "بنك الأسئلة",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "إدارة وتصنيف الأسئلة للاختبارات والواجبات",
                      style: TextStyle(
                        color: Color(0xFF44474D),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Container(
                      width: 292.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          showAddQuestionDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: Color(0xFFFFFFFF), size: 20),
                            SizedBox(width: 8.w),

                            SizedBox(
                              child: Text(
                                "إضافة سؤال ",
                                style: TextSt.textstyle16.copyWith(
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF006C49),
                          // padding: EdgeInsets.symmetric(vertical: 44.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: 342.w,
                //  height: 165.18.h,
                // margin: EdgeInsets.all(16.r),
                padding: EdgeInsets.only(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Color(0xFF000000).withOpacity(0.05),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF071A2F).withOpacity(0.05),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 308.w,
                      height: 51.59.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Color(0xFFFCF9F3),
                        border: Border.all(
                          color: Color(0xFF000000).withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: searchcontroller,
                        onChanged: (value) {
                          applysearch();
                        },
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "البحث في بنك الأسئلة...",
                          hintStyle: TextStyle(color: Color(0xFF6B7280)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF6B7280),
                          ),
                          suffixIcon: searchcontroller.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    resetAllfilters();
                                  },
                                  icon: Icon(Icons.clear),
                                )
                              : null,

                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 19.h),
                    /* Container(
                      width: 309.w,
                      height: 46.h,
                      padding: EdgeInsets.only(left: 40),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 46.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Color(0xFFFCF9F3),
                                border: Border.all(
                                  color: Color(0xFF000000).withOpacity(0.1),
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: selectsubject,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.expand_more,
                                        size: 16,
                                        color: Color(0xFF44474D),
                                      ),
                                      SizedBox(width: 2.w),
                                      Text(
                                        'كل المواد',
                                        style: TextStyle(
                                          color: Color(0xFF1C1C18),
                                          fontSize: 14.sp,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),

                                  items: subjects.map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectsubject = value;
                                    });
                                    applysearch();
                                  },
                                  isExpanded: true,
                                  icon: SizedBox.shrink(),
                                  dropdownColor: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 8.w),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 46.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Color(0xFFFCF9F3),
                                border: Border.all(
                                  color: Color(0xFF000000).withOpacity(0.1),
                                  width: 1,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: diff,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.expand_more,
                                        size: 16,
                                        color: Color(0xFF44474D),
                                      ),
                                      SizedBox(width: 2.w),
                                      Text(
                                        'مستوى الصعوبة',
                                        style: TextStyle(
                                          color: Color(0xFF1C1C18),
                                          fontSize: 14.sp,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),

                                  items: difficult
                                      .map<DropdownMenuItem<String>>((
                                        String value,
                                      ) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      })
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      diff = value;
                                    });
                                    applysearch();
                                  },
                                  isExpanded: true,
                                  icon: SizedBox.shrink(),
                                  dropdownColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              BlocBuilder<QuestionCubit, QuestionBankstate>(
                builder: (context, state) {
                  if (state is QuestionLoading) {
                    return Container(
                      height: 100.h,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF006C49),
                        ),
                      ),
                    );
                  } else if (state is QuestionLoaded) {
                    return generaloverview(
                      allquestions: state.totalQuestions,
                      savedquestion: state.savedQuestions,
                      addrecently: state.recentlyAdded,
                    );
                  }
                  return generaloverview(
                    allquestions: 0,
                    savedquestion: 0,
                    addrecently: 0,
                  );
                },
              ),

              SizedBox(height: 20.h),

              quickadd(),
              SizedBox(height: 20.h),
              QuestionList(),
            ],
          ),
        ),
      ),
    );
  }
}
