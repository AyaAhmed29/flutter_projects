
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/custom_svg.dart';
import 'package:flutter/material.dart';

class OrderStatusRow extends StatelessWidget {
  const OrderStatusRow({super.key, required this.text, required this.icon});
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvg(icon: icon),

        Text(text, style: AppStyle.medium16.copyWith(color: AppColors.pink)),
      ],
    );
  }
}