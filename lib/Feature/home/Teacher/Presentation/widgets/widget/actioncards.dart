import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/Feature/home/Teacher/Presentation/Cubit/gradecubit.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/grade_repo.dart';
import 'package:school/Feature/home/Teacher/Presentation/widgets/widget/gradedialog.dart';
import 'package:school/core/assest.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
      childAspectRatio: 1.3,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildItem(
          icon: Image.asset(AssestData.grade),
          label: 'رصد درجة',
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => BlocProvider(
                create: (context) => GradeCubit(GradeRepo()),
                child: const GradeDialog(),
              ),
            );
          },
          background: const Color(0xFF006C49).withOpacity(0.1),
        ),
        _buildItem(
          icon: Image.asset(AssestData.newtask),
          label: 'قريباً',
          onTap: () {},
          background: const Color(0xFF000000).withOpacity(0.05),
        ),
        _buildItem(
          icon: Image.asset(AssestData.sendmessage),
          label: 'قريباً',
          onTap: () {},
          background: const Color(0xFFC4C6CD).withOpacity(0.2),
        ),
      ],
    );
  }

  Widget _buildItem({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
    required Color background,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: const Color(0xFFF6F3ED),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFC4C6CD).withOpacity(0.2),
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: background,
              ),
              child: icon,
            ),
            SizedBox(height: 7.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1C1C18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
