import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/item_widget.dart';
import 'package:ecommerce_app/features/home/cubit/search/cubit/search_cubit.dart';
import 'package:ecommerce_app/features/home/cubit/search/cubit/search_state.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          var cubit = SearchCubit.get(context);

          return Scaffold(
            appBar: AppBar(title: const Text("Search")),
            body: ProdectCard(cubit: cubit),
          );
        },
      ),
    );
  }
}

class ProdectCard extends StatelessWidget {
  const ProdectCard({
    super.key,
    required this.cubit,
  });

  final SearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.all24,
      child: Column(
        children: [
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.4),
                  blurRadius: 6,
                ),
              ],
            ),
            child: TextField(
              controller: cubit.searchController,
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                cubit.searchProducts();
              },
              decoration: InputDecoration(
                hintText: 'Search any Product..',
                prefixIcon: IconButton(
                  onPressed: () {
                    cubit.searchProducts();
                  },
                  icon: Image.asset(Assets.imagesIconsSearch),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.products.products?.length ?? 0} Items',
                        style: AppStyle.semiBold18,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              state.products.products?.length ?? 0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 163.w / 285.h,
                              ),
                          itemBuilder: (context, index) => ItemWidget(
                            products: ProductModel(
                              id: state.products.products![index].id,
                              name:
                                  state.products.products![index].name,
                              description: state
                                  .products
                                  .products![index]
                                  .description,
                              imagePath: state
                                  .products
                                  .products![index]
                                  .imagePath,
                              price: state
                                  .products
                                  .products![index]
                                  .price
                                  ?.toDouble(),
                              rating: state
                                  .products
                                  .products![index]
                                  .rating,
                              isFavorite: state
                                  .products
                                  .products![index]
                                  .isFavorite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is SearchFailure) {
                  return Center(child: Text("Error: ${state.error}"));
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
