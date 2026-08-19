import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';

class BottomnavigatoionTeacher extends StatelessWidget {
  const BottomnavigatoionTeacher({super.key, required this.select});

  final int select;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: select,
      height: 65,
      backgroundColor: Colors.transparent,
      color: Colors.white,
      buttonBackgroundColor: kcolorOlive,
      animationDuration: const Duration(milliseconds: 300),
      items: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home_filled,
              color: select == 0 ? Colors.white : KcolorGrey,
            ),
            Text(
              'الرئيسية',
              style: TextStyle(
                fontSize: 10,
                color: select == 0 ? Colors.white : KcolorGrey,
              ),
            ),
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: select == 1 ? Colors.white : KcolorGrey,
            ),
            Text(
              'الجدول',
              style: TextStyle(
                fontSize: 10,
                color: select == 1 ? Colors.white : KcolorGrey,
              ),
            ),
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assignment,
              color: select == 2 ? Colors.white : KcolorGrey,
            ),
            Text(
              'المهام',
              style: TextStyle(
                fontSize: 10,
                color: select == 2 ? Colors.white : KcolorGrey,
              ),
            ),
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz, color: select == 3 ? Colors.white : KcolorGrey),
            Text(
              'الأسئلة',
              style: TextStyle(
                fontSize: 10,
                color: select == 3 ? Colors.white : KcolorGrey,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu, color: select == 3 ? Colors.white : KcolorGrey),
            Text(
              'المزيد',
              style: TextStyle(
                fontSize: 10,
                color: select == 4 ? Colors.white : KcolorGrey,
              ),
            ),
          ],
        ),
      ],

      onTap: (index) {
        switch (index) {
          case 0:
            context.go(AppRouter.kteacherdash);
            break;

          case 1:
            context.go(AppRouter.kteacherschedule);
            break;

          case 2:
            context.go(AppRouter.kassignmentandtasks);
            break;

          case 3:
            context.go(AppRouter.kquestionsbank);
            break;
          case 4:
            context.go(AppRouter.ktaskandgrademonitor);
            break;
        }
      },
    );
  }
}
