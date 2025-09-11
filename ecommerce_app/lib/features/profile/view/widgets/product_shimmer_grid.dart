
import 'package:ecommerce_app/features/profile/view/widgets/prodect_shimmer_item.dart';
import 'package:flutter/material.dart';

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