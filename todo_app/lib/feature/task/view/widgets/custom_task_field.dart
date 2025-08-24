import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomTaskField extends StatelessWidget {
  const CustomTaskField({
    super.key,
    required this.text,
    this.prefixIcon,
    this.onTap,
    this.readOnly,
    required this.controller,
  });
  final String text;
  final String? prefixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final TextEditingController controller;
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
        controller: controller,
        cursorColor: AppColors.primaryColor,
        cursorErrorColor: Colors.red,
        minLines: 1,
        onTap: onTap,
        readOnly: readOnly ?? false,

        maxLines: text == S.of(context).Description ? null : 1,
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
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: AppColors.lightGray),
    );
  }
}
class CustomEditTask extends StatelessWidget {
  const CustomEditTask({
    super.key,
    required this.text,
    this.prefixIcon,
    this.onTap,
    this.readOnly,
    required this.controller,
  });
  final String text;
  final String? prefixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      cursorErrorColor: Colors.red,
      minLines: 1,
      onTap: onTap,
      readOnly: readOnly ?? false,

      maxLines: text == S.of(context).Description ? null : 1,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        prefixIcon: prefixIcon != null
            ? Transform.scale(scale: .6, child: SvgPicture.asset(prefixIcon!))
            : null,

        hintText: text,

        border: _borderStyle(),
        enabledBorder: _borderStyle(),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,

        focusedBorder: _borderStyle(),
      ),
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: AppColors.white),
    );
  }
}
