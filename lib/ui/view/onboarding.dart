import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/constant.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/view/auth/login.dart';
import 'package:luwe/ui/view/dashboard.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              index == 0
                  ? 'assets/img/onboard-1.png'
                  : index == 1
                  ? 'assets/img/onboard-2.png'
                  : 'assets/img/onboard-3.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.50, -0.00),
              end: Alignment(0.50, 1.00),
              colors: [Color(0x332E5077), Color(0xFF2E5077)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  index == 0
                      ? 'Let your kitchen moments inspire others.'
                      : index == 1
                      ? 'Share what you cook, love what you find'
                      : 'Start your flavorful journey today.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < 3; i++)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 5),
                        height: 10,
                        width: index == i ? 35 : 10,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4DA1A9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 50),
                if (index != 2)
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index++;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 140,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF4DA1A9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                if (index == 2)
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigation().goRemove(const Dashboard(), context);
                        },
                        child: Text(
                          'Skip, gamau sign in',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ColorAsset.lightGrey,
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigation().goRemove(const Login(), context);
                        },
                        child: Container(
                          height: 50,
                          width: 140,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: ColorAsset.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: ColorAsset.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
