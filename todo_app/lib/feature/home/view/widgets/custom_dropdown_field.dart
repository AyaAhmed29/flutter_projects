
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Select item ';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Group',
          hintStyle: AppStyle.extraLight14,
          border: _borderStyle(),

          focusedBorder: _borderStyle().copyWith(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: _borderStyle().copyWith(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        items: [
          DropdownMenuItem(
            value: 'Home',
            child: dropdownMenuItem(
              image: Assets.assetsImagesIconsHome,
              text: 'Home',
            ),
          ),
          DropdownMenuItem(
            value: 'Personal',
            child: dropdownMenuItem(
              image: Assets.assetsImagesIconsPersonal,
              text: 'Personal',
            ),
          ),
          DropdownMenuItem(
            value: 'Work',
            child: dropdownMenuItem(
              image: Assets.assetsImagesIconsWork,
              text: 'Work',
            ),
          ),
        ],
        onChanged: (value) {},
      ),
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.lightGray),
    );
  }

  Row dropdownMenuItem({required String image, required String text}) {
    return Row(
      children: [SvgPicture.asset(image), SizedBox(width: 20), Text(text)],
    );
  }
}