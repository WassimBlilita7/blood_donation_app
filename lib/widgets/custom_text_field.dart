import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.hintText, required this.obscureText, this.onChanged , this.icon , this.input});
  String hintText;
  bool obscureText;
  IconData? icon;
  TextInputType? input ;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        validator: (data) {
          if (data!.length < 2) {
            return 'Weak ! Please try again ';
          }
        },
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        mouseCursor: MouseCursor.defer,
        style: TextStyle(
          fontSize: 16,
          color: blackColor,
          fontFamily: 'Alkatra',
        ),
        keyboardType: input,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon , color: Colors.grey,),
          filled: true,
          fillColor: kSecondaryColor,
          hintText: '$hintText',
          hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Alkatra'),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
