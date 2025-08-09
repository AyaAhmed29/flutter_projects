import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.icon,
    this.suffixIcon,
    required this.keyboardType,
    this.suffixIconOnPressed,
    this.isPasswordVisible,
    this.onSaved,
    this.validator,
  });
  final String text;
  final String icon;
  final String? suffixIcon;
  final TextInputType keyboardType;
  final void Function()? suffixIconOnPressed;
  final bool? isPasswordVisible;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          //  RegExp("$value");
          // if (value != null && !value.contains(RegExp('@'))) {
          //   return 'Must contain  @';
          // }
          if (value == null || value.isEmpty) {
            return 'Please enter $text';
          } else if (keyboardType == TextInputType.visiblePassword &&
              value.length < 8) {
            return 'Password too short';
          }
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        cursorColor: AppColors.primaryColor,
        cursorErrorColor: Colors.red,
        onSaved: onSaved,
        obscureText: isPasswordVisible ?? false,
        obscuringCharacter: '*',
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixIconOnPressed,
                  icon: SvgPicture.asset(suffixIcon!),
                )
              : null,

          prefixIcon: Transform.scale(
            scale: 0.6,
            child: SvgPicture.asset(icon),
          ),

          labelText: text,
          labelStyle: AppStyle.extraLight14,
          border: _borderStyle(),

          focusedBorder: _borderStyle().copyWith(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: _borderStyle().copyWith(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.lightGray),
    );
  }
}
