import 'dart:developer';

import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/widget/item_widget.dart';
import 'package:ecommerce_app/features/home/cubit/best_seller/best_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BestSellerCubit.get(context);
    log(cubit.state.toString());

    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        final cubit = BestSellerCubit.get(context);
        log(cubit.state.toString());

        log(state.toString());
        if (state is BestSellerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BestSellerfailure) {
          return Text(state.error);
        } else if (state is BestSellerSuccess) {
          // log(state.bestSellerProducts.bestSellerProducts!.length.toString());

          return SizedBox(
            height: 305.h,

            child: ListView.builder(
              padding: AppPadding.all16,
              scrollDirection: Axis.horizontal,
              itemCount:
                  state.bestSellerProducts.bestSellerProducts?.length ?? 0,
              itemBuilder: (context, index) => Row(
                children: [
                  ItemWidget(
                    products: ProductModel(
                      id: state
                          .bestSellerProducts
                          .bestSellerProducts![index]
                          .id,
                      name: state
                          .bestSellerProducts
                          .bestSellerProducts![index]
                          .name,
                      description: state
                          .bestSellerProducts
                          .bestSellerProducts![index]
                          .description,
                      imagePath: state
                          .bestSellerProducts
                          .bestSellerProducts![index]
                          .imagePath,
                      price: state
                          .bestSellerProducts
                          .bestSellerProducts![index]
                          .price
                          ?.toDouble(),
                      rating: state
                          .bestSellerProducts
                          .bestSellerProducts![index]
                          .rating,
                      isFavorite: state
                          .bestSellerProducts
                          .bestSellerProducts![index]
                          .isFavorite,
                    ),
                  ),
                  SizedBox(width: 16.w),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
