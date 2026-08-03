import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:school/core/assest.dart';

void showloadingDialog(BuildContext context) {
  showDialog(context: context,
  barrierDismissible: false,
  builder:(context)=>Center(child: LottieBuilder.asset(AssestData.loadingPaperplane),)
  
  );
}
