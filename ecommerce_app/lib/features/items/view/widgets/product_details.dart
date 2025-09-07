import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:ecommerce_app/features/items/view/cubit/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/custom_button.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, this.product});
  final ProductModel? product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  product?.name ?? 'Mens Starry',
                  style: AppStyle.semiBold20,
                ),
                SizedBox(height: 15.h),
                Text(
                  product?.description ??
                      'Vision Alta Men’s Shoes Size (All Colours) Mens Starry Sky Printed Shirt 100% Cotton Fabric',
                  style: AppStyle.regular14,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product?.price.toString() ?? '100 \$',
                      style: AppStyle.semiBold20.copyWith(
                        color: AppColors.pink,
                      ),
                    ),
                    BlocBuilder<ProductCubit, ProductState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                ProductCubit.get(context).decrement();
                              },
                              icon: Image.asset(Assets.imagesIconsDecrease),
                            ),
                            Text(ProductCubit.get(context).count.toString()),
                            IconButton(
                              onPressed: () {
                                ProductCubit.get(context).increment();
                              },
                              icon: Image.asset(Assets.imagesIconsIncrease),
                            ),
                          ],
                        );
                      },
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
        },
      ),
    );
  }
}
