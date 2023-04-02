import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:blood_donation_app/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Lottie.asset('assets/logo.json'),
          ],
        ),
      ),
      nextScreen: OnBoardingScreen(),
      splashIconSize: 460,
      animationDuration: Duration(seconds: 8),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
