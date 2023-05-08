import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/pages/add_donation.dart';
import 'package:blood_donation_app/pages/edit_profile.dart';
import 'package:blood_donation_app/pages/history_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddDonation();
                      }));
                    },
                    child: HomeContainer(
                      color: Color(0xff6EC2BE),
                      image: 'assets/add.png',
                      title: 'Add Donation',
                      description: 'To give the blood',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DonationHistory();
                      }));
                    },
                    child: HomeContainer(
                        color: Color(0xffFC9292),
                        image: 'assets/history.png',
                        title: 'History',
                        description: " request History "),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                         builder: (context) => UserProfilePage(),
                      ),
                    );
                    },
                    child: HomeContainer(
                      color: Color(0xff4EA0E2),
                      image: 'assets/profile.png',
                      title: 'Profile',
                      description: "View  profil ",
                      txtColor: kSecondaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'ContactUs');
                    },
                    child: HomeContainer(
                      color: Color(0xff091C32),
                      image: 'assets/contact.png',
                      title: 'Contact Us',
                      description: "Contact us by phone ",
                      txtColor: kSecondaryColor,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  Color? color, txtColor;
  String? image, title, description;
  HomeContainer(
      {required this.color,
      required this.image,
      required this.title,
      required this.description,
      this.txtColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 300,
        width: 170,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 5,
                blurRadius: 3,
                offset: Offset(0, 8),
                color: kPrimaryColor.withOpacity(0.2))
          ],
          border: Border.all(color: kSecondaryColor, width: 2),
          color: color,
          borderRadius: BorderRadius.circular(1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image!,
                height: 100,
                width: 100,
              ),
              Text(
                '$title',
                style: TextStyle(
                  fontFamily: 'Alkatra',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: txtColor,
                ),
              ),
              Text(
                '$description',
                style: TextStyle(fontFamily: 'Alkatra', color: txtColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
