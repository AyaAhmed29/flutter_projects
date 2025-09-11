
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CheckoutList extends StatelessWidget {
  const CheckoutList({super.key, required this.total, required this.subtotal});

  final double total;
  final double subtotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _summaryItems(title: S.of(  context).subtotal, price: '\$ ${subtotal.toString()}'),
        _summaryItems(title: S.of(  context).taxAndFees, price: '\$ 0'),
        _summaryItems(title: S.of(  context).deliveryFee, price: '\$ 0'),
        Divider(
          color: AppColors.pink,
          thickness: 1,
          height: 20,
          indent: 5,
          endIndent: 5,
        ),
        _summaryItems(
          title: S.of(context).orderTotal,
          price: '\$ ${total.toString()}',
          color: AppColors.pink,
        ),
      ],
    );
  }

  Padding _summaryItems({
    required String title,
    required String price,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyle.medium16),
          Text(price, style: AppStyle.medium18.copyWith(color: color)),
        ],
      ),
    );
  }
}