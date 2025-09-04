
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:flutter/material.dart';

class RegisterAgreement extends StatelessWidget {
  const RegisterAgreement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppStyle.regular12,
        children: [
          const TextSpan(text: "By clicking the "),
          TextSpan(
            text: "Register",
            style: AppStyle.regular12.copyWith(
              color: AppColors.pink,
            ),
          ),
          const TextSpan(
            text: " button, you agree \nto the public offer",
          ),
        ],
      ),
    );
  }
}
