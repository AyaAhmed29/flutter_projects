import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:ecommerce_app/features/items/view/widgets/prodect_image.dart';
import 'package:ecommerce_app/features/items/view/widgets/product_details.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductView extends StatelessWidget {
const  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra;
    final product = extra != null ? extra as ProductModel : null;

    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).product),
      body: Column(children: [ProdectImage(product: product), ProductDetails(product: product)]),
    );
  }
}
