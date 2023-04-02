import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/widgets/intro.dart';
import 'package:flutter/material.dart';
class IntroPage2 extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kSecondaryColor,
      body: 
      Intro(text: 'Stop Waiting ⏰', 
      desc: 'Say goodbye to waiting hours after today, with our application everything is easy and simple.',
       imgPath: 'assets/wait.png')
        
    );
  }
}