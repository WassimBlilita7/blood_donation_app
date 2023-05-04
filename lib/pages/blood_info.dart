import 'package:blood_donation_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodInfo extends StatefulWidget {
  static String id = 'BloodInfo';

  @override
  State<BloodInfo> createState() => _BloodInfoState();
}

class _BloodInfoState extends State<BloodInfo> {
  final Uri _url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Blood Information',
          style: optionStyle,
        ),
        centerTitle: true,
      ),
      body: Text('Wassim')
    );
  }
  
}
