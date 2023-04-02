import 'package:flutter/material.dart';

import '../constants.dart';

class Intro extends StatelessWidget {
  Intro({required this.text , required this.desc , required this.imgPath});
  String? text , desc , imgPath; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$text',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alkatra',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '$desc',
            style: TextStyle(
                fontFamily: 'Alkatra', fontSize: 16, color: Colors.grey),
          ),
          SizedBox(
            height: 50,
          ),
          Image.asset('$imgPath')
        ],
      ),
    );
  }
}
