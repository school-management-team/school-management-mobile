import 'package:flutter/material.dart';
import 'package:school/Feature/on_boarding/presentation/view/on_boarding_page4_body.dart';
import 'package:school/constant.dart';

class OnBoardingPage4View extends StatelessWidget {
  const OnBoardingPage4View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const SafeArea(child: OnBoardingPage4Body()),
    );
  }
}
