import 'package:ecommerce_app/core/widget/logo_appbar.dart';
import 'package:ecommerce_app/features/home/cubit/cubit/Category_cubit.dart';
import 'package:ecommerce_app/features/home/cubit/cubit/Category_state.dart';
import 'package:ecommerce_app/features/items/view/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/home/view/widgets/all_featured_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeaturCubit()..getFeatur(),
      child: Scaffold(
        appBar: const LogoAppbar(),
        body: BlocBuilder<FeaturCubit, FeaturState>(
          builder: (context, state) {
            if (state is FeaturLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FeaturError) {
              return Center(child: Text(state.error));
            } else if (state is FeaturSuccess) {
              return RefreshIndicator(
                onRefresh: () async {
                  await FeaturCubit.get(context).getFeatur();
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: AllFeaturedItem(),
                    ),
                    SliverToBoxAdapter(
                      child: Products(
                        products: state
                            .categories[FeaturCubit.get(context).currentIndex]
                            .products!,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
