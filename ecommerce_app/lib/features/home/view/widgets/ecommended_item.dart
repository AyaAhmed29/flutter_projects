import 'dart:developer';

import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/item_widget.dart';
import 'package:ecommerce_app/features/home/cubit/best_seller/best_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerLoading) {
          return const RecommendedShimmer();
        } else if (state is BestSellerfailure) {
          return Text(state.error);
        } else if (state is BestSellerSuccess) {
          // log(state.bestSellerProducts.bestSellerProducts!.length.toString());

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppPadding.horizontal18,
                child: Text('Recommended', style: AppStyle.semiBold18),
              ),
              SizedBox(
                height: 305.h,
                child: ListView.builder(
                  padding: AppPadding.all16,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      state.bestSellerProducts.bestSellerProducts?.length ?? 0,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ItemWidget(
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
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

class RecommendedShimmer extends StatelessWidget {
  const RecommendedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 305.h,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Shimmer.fromColors(
            baseColor: AppColors.grey.withValues(alpha: .4),
            highlightColor: AppColors.grey.withValues(alpha: .1),
            child: Container(
              width: 163.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 14.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: 12.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: 14.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            5,
                            (starIndex) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              height: 12.h,
                              width: 12.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade500,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
