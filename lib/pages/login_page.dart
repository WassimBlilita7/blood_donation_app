import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/pages/register_page.dart';
import 'package:blood_donation_app/widgets/custom_button.dart';
import 'package:blood_donation_app/widgets/custom_text_field.dart';
import 'package:blood_donation_app/widgets/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';

class LoginPage extends StatefulWidget {
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: kSecondaryColor,
          body: SafeArea(
              child: Center(
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/blood.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text(
                      'Blood Donation',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alkatra',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: ' Email',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: '  Password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      text: 'LogIn',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await loginUser();
                            showSnackBar(context, 'Login with Succeessfully',
                                Colors.green);
                            Navigator.pushNamed(context, 'NavBar');
                          } on FirebaseAuthException catch (e) {
                            showSnackBar(context, e.toString(), Colors.red);
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' Dont have an account ?  ',
                        style: TextStyle(
                          fontFamily: 'Alkatra',
                          color: blackColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterPage();
                          }));
                        },
                        child: Text(
                          'Sign Up  📲 ',
                          style: TextStyle(
                              fontSize: 18,
                              color: blackColor,
                              fontFamily: 'Alkatra',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ))),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
