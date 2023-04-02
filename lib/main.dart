
import 'package:blood_donation_app/onboarding_screen.dart';
import 'package:blood_donation_app/pages/home_page.dart';
import 'package:blood_donation_app/pages/login_page.dart';
import 'package:blood_donation_app/pages/register_page.dart';
import 'package:blood_donation_app/pages/splash_screen.dart';
import 'package:blood_donation_app/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BloodDonation());
}

class BloodDonation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        RegisterPage.id : (context) => RegisterPage(),
        NavBar().id :(context) => NavBar(),
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
