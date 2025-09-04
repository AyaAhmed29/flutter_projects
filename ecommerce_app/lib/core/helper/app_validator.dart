import 'package:flutter/material.dart';

abstract class AppValidator {
  static String? emailValidator({
    String? value,
    required BuildContext context,
  }) {
    var emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.[\w\.]+$');
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }
    if (!emailRegex.hasMatch(value)) {
      return 'InvalidEmail';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter UserName';
    }

    return null;
  }

  static String? confirmPasswordValidator({
    String? value,
    required String password,
  }) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value != password) {
      return 'passwords do not match';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone is required";
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Phone must contain digits only";
    }

    if (value.length != 11) {
      return "Phone must be 11 digits";
    }

    return null;
  }
}
