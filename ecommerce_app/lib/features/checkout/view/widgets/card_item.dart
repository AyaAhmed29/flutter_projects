import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/product_model.dart';
import 'package:ecommerce_app/core/widget/custom_cach_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.product});
  final ProductHiveModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(color: Colors.grey.withValues(alpha: 0.4), blurRadius: 6),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              CustomCachImage(imageUrl: product.imagePath ?? ''),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.name ?? '', style: AppStyle.semiBold18),
                  SizedBox(height: 8.h),
                  Text('${product.rating} ⭐', style: AppStyle.medium12),
                  SizedBox(height: 8.h),

                  Text(
                    product.description ?? '',
                    style: AppStyle.medium12,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),

                  Text(product.price.toString(), style: AppStyle.semiBold18),
                ],
              ),
            ],
          ),

          Divider(
            color: AppColors.pink,
            thickness: 1,
            height: 20,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: AppPadding.horizontal24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Order (${product.quantity})  :'),
                Text('\$ ${product.price! * product.quantity}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
