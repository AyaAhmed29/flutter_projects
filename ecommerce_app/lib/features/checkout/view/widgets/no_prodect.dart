
import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoProdect extends StatelessWidget {
  const NoProdect({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal29,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesNoProdect),
            SizedBox(height: 16.h),
            Text(
              'You don\'t have any active orders at this time',
              style: AppStyle.semiBold20.copyWith(color: AppColors.pink),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}