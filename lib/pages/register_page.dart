import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/nav_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: kSecondaryColor,
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
                    'assets/register.png',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: ' Email',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: '  Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      text: 'Register',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await registerUser();
                            showSnackBar(context, 'Register with Succeessfully',
                                Colors.green);
                            Navigator.pop(context);
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
                      const Text(
                        ' Already have an account ?  ',
                        style: TextStyle(
                          fontFamily: 'Alkatra',
                          color: blackColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'LoginPage');
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'LoginPage');
                          },
                          child: const Text(
                            'Login 📲 ',
                            style: TextStyle(
                                fontSize: 18,
                                color: blackColor,
                                fontFamily: 'Alkatra',
                                fontWeight: FontWeight.bold),
                          ),
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

  

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
