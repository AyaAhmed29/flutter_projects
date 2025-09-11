
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppStyle.semiBold36);
  }
}
