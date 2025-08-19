import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_padding.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/generated/l10n.dart';

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
<<<<<<< HEAD
<<<<<<< HEAD
    this.validator,  this.controller, this.obscureText,
=======
    this.validator,
    this.controller,
    this.obscureText,
>>>>>>> a9103be (Improve auth code)
=======
    this.validator,
    this.controller,
    this.obscureText,
=======
    this.validator,  this.controller, this.obscureText,
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
  });
  final TextEditingController? controller;
  final String text;
  final String icon;
  final String? suffixIcon;
  final TextInputType keyboardType;
  final void Function()? suffixIconOnPressed;
  final bool? isPasswordVisible;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
<<<<<<< HEAD
<<<<<<< HEAD
  final  bool? obscureText ;
=======
  final bool? obscureText;
>>>>>>> a9103be (Improve auth code)
=======
  final bool? obscureText;
=======
  final  bool? obscureText ;
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symmetricH22V5,
      child: TextFormField(
<<<<<<< HEAD
<<<<<<< HEAD
        controller:controller ,
=======
        controller: controller,
>>>>>>> a9103be (Improve auth code)
=======
        controller: controller,
=======
        controller:controller ,
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
        validator: (value) {
          if (keyboardType == TextInputType.emailAddress &&
              !RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value ?? "")) {
            return S.of(context).InvalidEmail;
          }

          if (value == null || value.isEmpty) {
            return '${S.of(context).PleaseEnter} $text';
          } else if (keyboardType == TextInputType.visiblePassword &&
              value.length < 8) {
            return S.of(context).PasswordTooShort;
          }
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
<<<<<<< HEAD
<<<<<<< HEAD
        
        cursorColor: AppColors.primaryColor,
        cursorErrorColor: Colors.red,
        onSaved: onSaved,
        obscureText:obscureText??false,
        // isPasswordVisible ?? false,
=======
=======
>>>>>>> 3e00782 (update auth views)

        cursorColor: AppColors.primaryColor,
        cursorErrorColor: Colors.red,
        onSaved: onSaved,
        obscureText: obscureText ?? false,
<<<<<<< HEAD
>>>>>>> a9103be (Improve auth code)
=======
=======
        
        cursorColor: AppColors.primaryColor,
        cursorErrorColor: Colors.red,
        onSaved: onSaved,
        obscureText:obscureText??false,
        // isPasswordVisible ?? false,
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
        obscuringCharacter: '*',
        keyboardType: keyboardType,
        decoration: InputDecoration(
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
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: AppColors.lightGray),
    );
  }
}
