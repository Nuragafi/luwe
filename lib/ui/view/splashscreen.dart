import 'dart:async';

import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/constant.dart';
import 'package:luwe/ui/view/onboarding.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool start = false;

  void animation() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        start = true;
      });
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding()),
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    animation();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/img/onboard-1.png"), context);
    precacheImage(AssetImage("assets/img/onboard-2.png"), context);
    precacheImage(AssetImage("assets/img/onboard-3.png"), context);
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        color: ColorAsset.primary,
        child: Center(
          child: AnimatedContainer(
            curve: Curves.bounceOut,
            height: start ? 150 : 50,
            width: start ? 150 : 50,
            duration: Duration(seconds: 1),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/logo-2.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
