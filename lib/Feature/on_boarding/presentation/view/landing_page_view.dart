import 'package:flutter/material.dart';
import 'package:school/Feature/on_boarding/presentation/view/landing_page_body.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: LandingPageBody()));
  }
}
