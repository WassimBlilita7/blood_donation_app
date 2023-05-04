import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? fullname;
  String? bloodType;
  int? age;
  String? email;
  String? city;

  UserModel(
      {required this.fullname,
      required this.bloodType,
      required this.age,
      required this.email,
      required this.city});

  
}
