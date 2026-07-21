import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school/constant.dart';
import 'package:school/core/router_app.dart';

class BottomnavgtionFiveitems extends StatelessWidget {
  const BottomnavgtionFiveitems({super.key, required this.select});

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
              Icons.menu_book_outlined,
              color: select == 1 ? Colors.white : KcolorGrey,
            ),
            Text(
              'المقررات',
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
              Icons.star_border_outlined,
              color: select == 2 ? Colors.white : KcolorGrey,
            ),
            Text(
              'الدرجات',
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
              Icons.dashboard_outlined,
              color: select == 3 ? Colors.white : KcolorGrey,
            ),
            Text(
              'الطلاب',
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
              Icons.calendar_month,
              color: select == 4 ? Colors.white : KcolorGrey,
            ),

            Text(
              'الجدول',
              style: TextStyle(
                fontSize: 10,
                color: select == 2 ? Colors.white : KcolorGrey,
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
            context.go(AppRouter.kroleselection);
            break;
          case 4:
            context.go(AppRouter.kroleselection);
            break;
        }
      },
    );
  }
}
