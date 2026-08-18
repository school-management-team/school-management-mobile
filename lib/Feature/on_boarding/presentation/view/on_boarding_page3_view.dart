import 'package:flutter/material.dart';
import 'package:school/Feature/on_boarding/presentation/view/on_boarding_page3_body.dart';
import 'package:school/constant.dart';

class OnBoardingPage3View extends StatelessWidget {
  const OnBoardingPage3View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const SafeArea(child: OnBoardingPage3Body()),
    );
  }
}
