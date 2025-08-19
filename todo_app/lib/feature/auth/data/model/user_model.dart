import 'package:flutter/material.dart';

class UserModel {
  final String uid;
  final String userName;
  final String email;
  final Image? image;
  

  UserModel({required this.userName, this.image, required this.uid, required this.email});
}
