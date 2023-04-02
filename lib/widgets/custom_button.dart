import 'package:blood_donation_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';
import 'package:firebase_auth/firebase_auth.dart';
class CustomButton extends StatelessWidget {
   CustomButton({this.onTap,required this.text});
   VoidCallback? onTap ; 
   String? text ; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          width: ResponsiveMediaQuery.horizontalLength*200,
          height: 60,
          child: Center(child: Text('$text' , style: TextStyle(
            color: kSecondaryColor,
            fontFamily: 'Alkatra',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),) , ),
        ),
      ),
    );
  }
}
