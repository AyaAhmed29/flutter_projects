import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/features/home/cubit/cubit/Category_cubit.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.products});
  final ProductModel products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.productView, extra: products),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            width: 163.w,
            height: 305.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d?w=1200&q=80',
                    fit: BoxFit.cover,
                    width: 163.w,
                    height: 180.h,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products.name ?? 'Mens Starry',
                        style: AppStyle.medium16,
                      ),
                      Text(
                        'Mens Starry Sky Printed Shirt100% Cotton Fabric,',
                        style: AppStyle.regular10,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text('₹399', style: AppStyle.medium12),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: 4.5,
                            itemCount: 5,
                            itemSize: 14,
                            itemBuilder: (context, _) =>
                                Icon(Icons.star, color: AppColors.yellow),
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            '1,52,344',
                            style: AppStyle.regular10.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: products.isFavorite == false
                ? Image.asset(Assets.imagesIconsWhiteHard)
                : Image.asset(Assets.imagesIconsRedHard),
            onPressed: () {
              if (products.isFavorite == false) {
                FeaturCubit.get(context).addFavorite(products.id!);
              }
            },
          ),
        ],
      ),
    );
  }
}
