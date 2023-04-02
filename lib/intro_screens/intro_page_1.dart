import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/widgets/intro.dart';
import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  Intro(
      text: 'Greetings ! ❤️',
      desc: 'Welcome to our Application ! Were excited to have you here among us.',
      imgPath: 'assets/welcome.png',
    );
  }
}