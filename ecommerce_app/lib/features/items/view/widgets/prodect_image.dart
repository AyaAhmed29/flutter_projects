import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/features/home/cubit/cubit/Category_cubit.dart';
import 'package:ecommerce_app/features/home/cubit/cubit/Category_state.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProdectImage extends StatelessWidget {
  const ProdectImage({super.key, this.product});
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).colorScheme.surface,
        ),
        width: 306.w,
        height: 308.h,
        child: Stack(
          children: [
            SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  product?.imagePath ??
                      'https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d?w=1200&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BlocProvider(
              create: (context) => FeaturCubit(),
              child: BlocBuilder<FeaturCubit, FeaturState>(
                builder: (context, state) {
                  return Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: AppPadding.all16,
                      child: IconButton(
                        icon: product?.isFavorite == false
                            ? Image.asset(Assets.imagesIconsWhiteHard)
                            : Image.asset(Assets.imagesIconsRedHard),
                        onPressed: () {
                          if (product?.isFavorite == false) {
                            FeaturCubit.get(context).addFavorite(product!.id!);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
