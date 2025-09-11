import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/items/view/widgets/products.dart';
import 'package:ecommerce_app/features/profile/cubit/prodect/cubit/prodect_cubit.dart';
import 'package:ecommerce_app/features/profile/view/widgets/product_shimmer_grid.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoritesView extends StatelessWidget {
  const MyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).myFavorites),
      body: BlocProvider(
        create: (context) => ProdectCubit()..getFavoriteProducts(),
        child: BlocBuilder<ProdectCubit, ProdectState>(
          builder: (context, state) {
            if (state is ProdectLoading) {
              return ProductShimmerGrid();
            } else if (state is ProdectFailure) {
              return Center(child: Text(state.error));
            } else if (state is ProdectSuccess) {
              return SingleChildScrollView(
                child: Products(products: state.productModel),
              );
              // return ProductShimmerGrid();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
