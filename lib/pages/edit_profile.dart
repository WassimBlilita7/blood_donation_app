import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProfilePage extends StatefulWidget {
  final String userId;
  final String fullName;
  final int age;
  final String bloodType;
  final String city;

  UpdateProfilePage({
    required this.userId,
    required this.fullName,
    required this.age,
    required this.bloodType,
    required this.city,
  });

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _ageController;
  late TextEditingController _bloodTypeController;
  late TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.fullName);
    _ageController = TextEditingController(text: widget.age.toString());
    _bloodTypeController = TextEditingController(text: widget.bloodType);
    _cityController = TextEditingController(text: widget.city);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _ageController.dispose();
    _bloodTypeController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(widget.userId)
            .update({
          'full name': _fullNameController.text.trim(),
          'age': int.tryParse(_ageController.text.trim()) ?? 0,
          'Blood Type': _bloodTypeController.text.trim(),
          'city': _cityController.text.trim(),
        });
        Navigator.pop(context, true); // Navigate back to previous page
      } catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating profile')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _bloodTypeController,
                decoration: InputDecoration(labelText: 'Blood Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your blood type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _updateProfile,
                child: Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}