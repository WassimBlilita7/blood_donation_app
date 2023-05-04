import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/helper/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  static String id = 'ContactUs';

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  void _send() {
    final name = nameController.text;
    final phone = phoneController.text;
    final message = messageController.text;

    if (name.isNotEmpty && phone.isNotEmpty && message.isNotEmpty) {
      final messageData = {
        'name': name,
        'phone': phone,
        'message': message,
        'timestamp': Timestamp.now(),
      };

      FirebaseFirestore.instance.collection('messages').add(messageData);
      showSnackBar(context, 'Message sent successfully!', Colors.green);
      // code to send the message using your chosen method

      nameController.clear();
      phoneController.clear();
      messageController.clear();
    } else {
      showSnackBar(context,
          'Please fill out all fields before sending the message.', Colors.red);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Contact Us ',
          style: optionStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the name';
                }
              },
              controller: nameController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: kSecondaryColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: kSecondaryColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Phone'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: messageController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: kSecondaryColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.message,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Tap your message here ! '),
              maxLines: 4,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: _send,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontFamily: 'Alkatra',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: kPrimaryColor)),
          ],
        ),
      ),
    );
  }
}
