import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';

class Bottomnavigatoion extends StatelessWidget {
  const Bottomnavigatoion({super.key, required this.select});

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
              Icons.chat_bubble_outline,
              color: select == 2 ? Colors.white : KcolorGrey,
            ),
            Text(
              'الرسائل',
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
            Icon(
              Icons.person_outline,
              color: select == 3 ? Colors.white : KcolorGrey,
            ),
            Text(
              'الملف',
              style: TextStyle(
                fontSize: 10,
                color: select == 3 ? Colors.white : KcolorGrey,
              ),
            ),
          ],
        ),
      ],

      onTap: (index) {
        switch (index) {
          case 0:
            context.go(AppRouter.kStudentDashboard);
            break;

          case 1:
            context.go(AppRouter.kaccountpendeing);
            break;

          case 2:
            context.go(AppRouter.kmanagementview);
            break;

          case 3:
            context.go(AppRouter.kFWeekdaysselector);
            break;
        }
      },
    );
  }
}
