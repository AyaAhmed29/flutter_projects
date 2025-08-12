
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final void Function() onPressed;

  final String icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed :onPressed,
      shape: const CircleBorder(),
      backgroundColor: AppColors.primaryColor,
      child: Image.asset(icon),
    );
  }
}