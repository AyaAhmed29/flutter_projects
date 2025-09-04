import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/items/view/widgets/prodect_image.dart';
import 'package:ecommerce_app/features/items/view/widgets/product_details.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Product'),
      body: Column(children: [ProdectImage(), ProductDetails()]),
    );
  }
}
