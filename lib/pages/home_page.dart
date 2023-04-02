import 'package:blood_donation_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
            child: Text(
          'Wassim',
          style: optionStyle,
        )),
      ),
    );
  }
}
