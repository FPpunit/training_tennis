import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_images.dart';
import 'onBoarding/onboard.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5),
    () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoard(),)),);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.primary,
      child: Image.asset(MyImages.logo),
    );
  }
}
