import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.icon,
    this.suffixIcon,
    required this.keyboardType,
    this.suffixIconOnPressed,
    this.isPasswordVisible,

    this.validator,
    this.controller,
    this.obscureText,
  });
  final TextEditingController? controller;
  final String text;
  final String icon;
  final String? suffixIcon;
  final TextInputType keyboardType;
  final void Function()? suffixIconOnPressed;
  final bool? isPasswordVisible;
  final String? Function(String?)? validator;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,

        fillColor: AppColors.lightGrey,

        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixIconOnPressed,
                icon: SvgPicture.asset(suffixIcon!),
              )
            : null,
        prefixIcon: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(icon, height: 20, width: 20),
        ),
        labelText: text,
        labelStyle: AppStyle.medium12.copyWith(
          color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
        ),
        border: _borderStyle(),
        enabledBorder: _borderStyle(),
        focusedBorder: _borderStyle().copyWith(
          borderSide: BorderSide(color: AppColors.pink, width: 2),
        ),
        errorBorder: _borderStyle().copyWith(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: AppColors.darkGray, width: 2),
    );
  }
}
