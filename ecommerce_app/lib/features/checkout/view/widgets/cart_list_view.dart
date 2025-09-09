import 'package:ecommerce_app/core/utlis/storage/prodect_model/product_model.dart';
import 'package:ecommerce_app/features/checkout/view/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.cartProducts});

  final List<ProductHiveModel> cartProducts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: CardItem(product: cartProducts[index]),
          );
        },
      ),
    );
  }
}
