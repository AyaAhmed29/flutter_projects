import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/items/view/widgets/products.dart';
import 'package:ecommerce_app/features/profile/cubit/prodect/cubit/prodect_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProdectFailure) {
              return Center(child: Text(state.error));
            } else if (state is ProdectSuccess) {
              return SingleChildScrollView(
                child: Products(products: state.productModel),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
