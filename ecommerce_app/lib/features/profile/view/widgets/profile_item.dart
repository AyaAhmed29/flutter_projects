
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final String icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person, size: 20),
              SizedBox(width: 16.w),
              Text(title, style: AppStyle.medium18),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 20),
        ],
      ),
    );
  }
}
