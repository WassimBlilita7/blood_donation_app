import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.hintText, required this.obscureText, this.onChanged});
  String hintText;
  bool obscureText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        validator: (data) {
          if (data!.length<8) {
            return 'Weak ! Please tap correct form ';
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
        obscureText: obscureText,
        decoration: InputDecoration(
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
