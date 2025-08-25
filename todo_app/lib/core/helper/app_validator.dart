import 'package:flutter/material.dart';
import 'package:todo_app/generated/l10n.dart';

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
      return S.of(context).InvalidEmail;
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
}
