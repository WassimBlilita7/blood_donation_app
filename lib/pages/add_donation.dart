import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants.dart';
import '../helper/show_snack_bar.dart';

class AddDonation extends StatefulWidget {
  const AddDonation({super.key});
  static String id = 'AddDonation';

  @override
  State<AddDonation> createState() => _AddDonationState();
}

class _AddDonationState extends State<AddDonation> {
  GlobalKey<FormState> _formKey = GlobalKey();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final bloodTypeController = TextEditingController();
  final cityController = TextEditingController();
  final requiredAmountController = TextEditingController();
  DateTime? dateNeeded;

  String? selectedBloodType;

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
  void dispose() {
    // Clean up the controllers when the widget is disposed
    titleController.dispose();
    descriptionController.dispose();
    bloodTypeController.dispose();
    cityController.dispose();
    requiredAmountController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Add Donation',
          style: optionStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add Doantion Request Page 🩸',
                style: TextStyle(
                    fontFamily: 'Alkatra',
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the title';
                  }
                },
                cursorColor: kPrimaryColor,
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  prefixIcon: Icon(
                    Icons.book,
                    color: kPrimaryColor,
                  ),
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You must enter the description';
                  }
                },
                cursorColor: kPrimaryColor,
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Desctiption',
                  prefixIcon: Icon(
                    Icons.description,
                    color: kPrimaryColor,
                  ),
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: bloodTypeController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
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
                  hintText: 'Blood Type',
                  prefixIcon: Icon(
                    Icons.local_hospital,
                    color: kPrimaryColor,
                  ),
                  filled: true,
                  fillColor: kSecondaryColor,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a blood type';
                  }
                  final validBloodType =
                      RegExp(r'^(A|B|AB|O)[+-]$').hasMatch(value);
                  if (!validBloodType) {
                    return 'Please enter a valid blood type (e.g. A+, B-, AB+, O-)';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid city';
                  }
                },
                cursorColor: kPrimaryColor,
                controller: cityController,
                decoration: InputDecoration(
                  hintText: 'City',
                  filled: true,
                  fillColor: kSecondaryColor,
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: kPrimaryColor,
                  ),
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (double.tryParse(value!)! <= 0) {
                    return 'You must enter a valid amount';
                  }
                },
                cursorColor: kPrimaryColor,
                controller: requiredAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Required amount (ml)',
                  prefixIcon: Icon(
                    Icons.bloodtype,
                    color: kPrimaryColor,
                  ),
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
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                child: Text(dateNeeded == null
                    ? 'Select Date Needed'
                    : 'Date Needed: ${dateNeeded!.toLocal().toString().split(' ')[0]}'),
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      dateNeeded = selectedDate;
                    });
                  }
                },
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                child: Text(
                  'Add Donation Request ➕',
                  style: TextStyle(
                      fontFamily: 'Alkatra',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    await addDonationRequest(
                      title: titleController.text,
                      description: descriptionController.text,
                      bloodType: bloodTypeController.text,
                      city: cityController.text,
                      requiredAmount: int.parse(requiredAmountController.text),
                      dateNeeded: dateNeeded!,
                    );

                    // Display a success message and navigate back
                    showSnackBar(context, 'Add donation with successfully',
                        Colors.green);

                    titleController.clear();
                    descriptionController.clear();
                    bloodTypeController.clear();
                    cityController.clear();
                    requiredAmountController.clear();

                    setState(() {
                      dateNeeded = null;
                    });
                  }
                  // Call the addDonationRequest function with the form values
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addDonationRequest({
    required String title,
    required String description,
    required String bloodType,
    required String city,
    required int requiredAmount,
    required DateTime dateNeeded,
  }) async {
    // Add the new donation request to the "donation_requests" collection in Firestore
    await FirebaseFirestore.instance.collection('donation_requests').add({
      'title': title,
      'description': description,
      'Blood Type': bloodType,
      'city': city,
      'requiredAmount': requiredAmount,
      'dateNeeded': dateNeeded,
      'createdAt': DateTime.now(),
    });
  }
}
