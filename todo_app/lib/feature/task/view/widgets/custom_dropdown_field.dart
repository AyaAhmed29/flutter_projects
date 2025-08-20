import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/generated/l10n.dart';
class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({super.key, required this.onChanged, this.value});
  final void Function(String) onChanged;
  final String? value; // القيمة الحالية

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        value: value, // اضف القيمة هنا
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).PleaseSelectItem;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: S.of(context).Group,
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
              text: S.of(context).Home,
            ),
          ),
          DropdownMenuItem(
            value: 'Personal',
            child: dropdownMenuItem(
              image: Assets.assetsImagesIconsPersonal,
              text: S.of(context).Personal,
            ),
          ),
          DropdownMenuItem(
            value: 'Work',
            child: dropdownMenuItem(
              image: Assets.assetsImagesIconsWork,
              text: S.of(context).Work,
            ),
          ),
        ],
        onChanged: (value) {
          if (value != null) onChanged(value);
        },
      ),
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: AppColors.lightGray),
    );
  }

  Row dropdownMenuItem({required String image, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 20.w),
        Text(text),
      ],
    );
  }
}
