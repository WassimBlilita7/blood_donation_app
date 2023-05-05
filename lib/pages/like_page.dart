import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/pages/list_donor.dart';
import 'package:flutter/material.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListDonor();
                    }));
                  },
                  child: DonorContainer(
                      color: Color(0xffFFC0CB),
                      image: 'assets/donors.png',
                      title: 'Donors',
                      description: 'See donors list'),
                ),
                const SizedBox(
                  width: 20,
                ),
                DonorContainer(
                    color: Colors.grey,
                    image: 'assets/notification.png',
                    title: 'Notification',
                    description: 'Push notification'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DonorContainer extends StatelessWidget {
  Color? color, txtColor;
  String? image, title, description;
  DonorContainer(
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
        height: 500,
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
