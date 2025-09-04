
import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text('Mens Starry', style: AppStyle.semiBold20),
          SizedBox(height: 15.h),
          Text(
            'Vision Alta Men’s Shoes Size (All Colours) Mens Starry Sky Printed Shirt 100% Cotton Fabric',
            style: AppStyle.regular14,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '100 \$',
                style: AppStyle.semiBold20.copyWith(color: AppColors.pink),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(Assets.imagesIconsDecrease),
                  ),
                  Text('1'),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(Assets.imagesIconsIncrease),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 50.h),

          CustomButton(
            ontap: () {},
            text: 'Add To Cart',
            icon: Assets.imagesIconsShopping,
          ),
        ],
      ),
    );
  }
}