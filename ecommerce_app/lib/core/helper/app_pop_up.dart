import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppPopUp {
  static showSnackBar({required context, required text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), backgroundColor: AppColors.pink),
    );
  }

  static errorShowSnackBar({required context, required text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), backgroundColor: AppColors.pink),
    );
  }
}
