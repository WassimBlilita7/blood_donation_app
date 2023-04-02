import 'package:blood_donation_app/constants.dart';
import 'package:flutter/material.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        child: Text('Search Page' , style: optionStyle,),
      ),
    );
  }
}