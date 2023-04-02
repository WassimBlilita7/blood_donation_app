import 'package:blood_donation_app/constants.dart';
import 'package:flutter/material.dart';
class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        child: 
        Center(child: Text('Like Page' , style: optionStyle,)) ,
      ),
    );
  }
}