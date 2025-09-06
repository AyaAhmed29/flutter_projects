import 'package:ecommerce_app/core/widget/logo_appbar.dart';
import 'package:ecommerce_app/features/items/view/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/home/view/widgets/all_featured_item.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppbar(),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AllFeaturedItem()),

          SliverToBoxAdapter(child: Products()),
        ],
      ),
    );
  }
}
