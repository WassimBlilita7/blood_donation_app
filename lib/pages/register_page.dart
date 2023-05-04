import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/nav_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';
  

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email, password, fullName, city, bloodType;
  int? age;
  
  
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];

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
                    height: 65,
                  ),
                  // Image.asset(
                  //   'assets/register.png',
                  //   height: 150,
                  //   width: 150,
                  // ),
                  Column(
                    children: [
                      Text(
                        'Hello There !  🙋‍♂️',
                        style: TextStyle(
                          fontFamily: 'Alkatra',
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        'Register below with your details ! ',
                        style: TextStyle(fontFamily: 'Alkatra', fontSize: 18),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                    icon: Icons.email,
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
                    icon: Icons.lock,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: '  Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      input: TextInputType.name,
                      icon: Icons.person,
                      onChanged: (data) {
                        fullName = (data);
                      },
                      hintText: 'Full Name',
                      obscureText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    input: TextInputType.number,
                    icon: Icons.numbers_sharp,
                    onChanged: (data) {
                      age = int.parse(data);
                    },
                    hintText: 'Age',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      city = data;
                    },
                    icon: Icons.location_city,
                    hintText: 'City',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButtonFormField<String>(
                      value: bloodType,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.local_hospital,
                          color: kPrimaryColor,
                        ),
                        filled: true,
                        fillColor: kSecondaryColor,
                        hintText: 'Blood Type',
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
                      items: bloodTypes.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (data) {
                        bloodType = data;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
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

    addUserDetails(email!, password!, fullName!, age!, city!, bloodType!);
  }

  Future addUserDetails(String email, String password, String fullName, int age,
      String city, String bloodType) async {
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'password': password,
      'full name': fullName,
      'age': age,
      'city': city,
      'Blood Type': bloodType,
    });
  }
}
