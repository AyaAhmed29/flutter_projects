
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';

class CustomTaskField extends StatelessWidget {
  const CustomTaskField({
    super.key,
    required this.text,
    this.prefixIcon,
    this.onSaved,
    this.onTap,
  });
  final String text;
  final String? prefixIcon;
  final void Function()? onTap;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $text';
          }

          return null;
        },
        cursorColor: AppColors.primaryColor,
        cursorErrorColor: Colors.red,
        onSaved: onSaved,
        minLines: 1,
        onTap: onTap,
        readOnly: text == 'End Time' ? true : false,
        maxLines: text == 'Description' ? null : 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Transform.scale(scale: .6, child: SvgPicture.asset(prefixIcon!))
              : null,

          hintText: text,
          hintStyle: AppStyle.extraLight14,
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
