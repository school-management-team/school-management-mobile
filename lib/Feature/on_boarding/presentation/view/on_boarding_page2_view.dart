import 'package:flutter/material.dart';
import 'package:school/Feature/on_boarding/presentation/view/on_boarding_page2_body.dart';
import 'package:school/constant.dart';

class OnBoardingPage2View extends StatelessWidget {
  const OnBoardingPage2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const SafeArea(child: OnBoardingPage2Body()),
    );
  }
}
