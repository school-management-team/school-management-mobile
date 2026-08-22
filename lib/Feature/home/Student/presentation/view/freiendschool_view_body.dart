import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/buildContactItem_friendst.dart';
import 'package:school/Feature/home/Student/presentation/view/widget/buildStudyGroupCard_friend.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_friend/cubit_classgroup/classgroup_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_friend/cubit_classgroup/classgroup_state.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_friend/cubit_classmate/classmate_cubit.dart';
import 'package:school/Feature/home/Student/presentation/view_Models/manger/cubit_friend/cubit_classmate/classmate_state.dart';
import 'package:school/constant.dart';
import 'package:school/core/assest.dart';
import 'package:school/core/function/showloadingDialog.dart';
import 'package:school/core/widget/Text/text_style.dart';
class FreiendschoolViewBody extends StatefulWidget {
  const FreiendschoolViewBody({super.key});

  @override
  State<FreiendschoolViewBody> createState() => _FreiendschoolViewBodyState();
}

class _FreiendschoolViewBodyState extends State<FreiendschoolViewBody> {
  int? selectedGroupIndex;

  @override
  void initState() {
    super.initState();
    
    context.read<ClassgroupCubit>().getClassgroupData();
    
    context.read<ClassmateCubit>().getClassmateData(); 
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(4, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "...البحث عن زميل أو مجموعة دراسية",
                    hintStyle: TextStyle(fontSize: 14.sp),
                    hintTextDirection: TextDirection.ltr,
                    border: InputBorder.none,
                    icon: const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30.sp),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "عرض الكل",
                  style: TextSt.textstyle17.copyWith(color: kcolorOlive),
                ),
                const Spacer(),
                Text("مجموعات دراسية", style: TextSt.textstyle17),
              ],
            ),

            SizedBox(height: 30.sp),

            BlocConsumer<ClassgroupCubit, ClassgroupState>(
              listener: (context, state) {
                if (state is ClassgroupStateFailuer) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errmessage)),
                  );
                }
              },
              builder: (context, state) {
                if (state is ClassgroupStateLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: kcolorOlive),
                  );
                }

                if (state is ClassgroupStateSuccess) {
                  final group = state.group;

                  return SizedBox(
                    height: 260.sp,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        StudyGroupCardItem(
                          title: group.groupName ?? '',
                          subtitle: "عدد الأعضاء: ${group.membersCount ?? 0}",
                          iconText: "Σ",
                          color: Colors.green,
                          onJoinPressed: () {
                            setState(() {
                              selectedGroupIndex = 0;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),

            if (selectedGroupIndex != null) ...[
              SizedBox(height: 30.sp),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.filter_list, size: 30.sp, color: Colors.blueGrey),
                  SizedBox(width: 10.sp),
                  Icon(Icons.sort, size: 30.sp, color: Colors.blueGrey),
                  const Spacer(),
                  Text("زملاء المجموعة", style: TextSt.textstyle17),
                ],
              ),
              SizedBox(height: 20.sp),
              BlocBuilder<ClassmateCubit, ClassmateState>(
                builder: (context, state) {
                  if (state is ClassmateStateLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ClassmateStateFailuer) {
                    return Center(child: Text(state.errmessage));
                  }

                  if (state is ClassmateStateSuccess) {
                    return Column(
                      children: state.classmateModel.map((classmate) {
                        return buildContactItem(
                          classmate.name ?? '',
                          classmate.phone ?? '',
                          classmate.image ?? AssestData.studentprofile,
                          true,
                        );
                      }).toList(),
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}