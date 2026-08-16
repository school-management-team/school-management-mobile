import 'package:flutter/material.dart';
import 'package:school/Feature/on_boarding/presentation/view/on_boarding_page1_body.dart';
import 'package:school/constant.dart';

class OnBoardingPage1View extends StatelessWidget {
  const OnBoardingPage1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const SafeArea(child: OnBoardingPage1Body()),
    );
  }
}
