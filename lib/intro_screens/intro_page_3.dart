import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/widgets/intro.dart';
import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Intro(
        text: 'Join our donors 💉',
        desc: ' Participate in our application that helps to establish a link between the person in need of blood and the donor',
        imgPath: 'assets/doctor.png',
      ),
    );
  }
}
