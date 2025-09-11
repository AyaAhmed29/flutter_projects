import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/items/view/widgets/products.dart';
import 'package:ecommerce_app/features/profile/cubit/prodect/cubit/prodect_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyFavoritesView extends StatelessWidget {
  const MyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Favorites'),
      body: BlocProvider(
        create: (context) => ProdectCubit()..getFavoriteProducts(),
        child: BlocBuilder<ProdectCubit, ProdectState>(
          builder: (context, state) {
            if (state is ProdectLoading) {
              return ProductShimmerGrid();
            } else if (state is ProdectFailure) {
              return Center(child: Text(state.error));
            } else if (state is ProdectSuccess) {
              // return SingleChildScrollView(
              //   child: Products(products: state.productModel),
              // );
              return ProductShimmerGrid();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class ProductShimmerGrid extends StatelessWidget {
  const ProductShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 163 / 271,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return ProdectShimmerItem();
      },
    );
  }
}

class ProductShimmerListHorizontal extends StatelessWidget {
  const ProductShimmerListHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 9,
      itemBuilder: (context, index) {
        return ProdectShimmerItem();
      },
    );
  }
}

class ProdectShimmerItem extends StatelessWidget {
  const ProdectShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withValues(alpha: .4),
      highlightColor: AppColors.grey.withValues(alpha: .1),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade500, // يبان غامق شوية
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
                  //prodectName
                  Container(
                    height: 14,
                    width: 100,
    
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 6),
    
                  // Descraption
                  Container(
                    height: 12,
                    width: 140,
    
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 6),
    
                  // price
                  Container(
                    height: 14,
                    width: 60,
    
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
    
                  // rating
                  Row(
                    children: List.generate(
                      5,
                      (starIndex) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 12,
                        width: 12,
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
    );
  }
}
