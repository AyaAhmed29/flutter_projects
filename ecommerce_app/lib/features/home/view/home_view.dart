import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/logo_appbar.dart';
import 'package:ecommerce_app/features/home/cubit/best_seller/best_seller_cubit.dart';
import 'package:ecommerce_app/features/home/cubit/category/Category_cubit.dart';
import 'package:ecommerce_app/features/home/cubit/slider/slider_cubit.dart';
import 'package:ecommerce_app/features/home/view/widgets/all_featured_item.dart';
import 'package:ecommerce_app/features/home/view/widgets/slider_card_item.dart';
import 'package:ecommerce_app/features/home/view/widgets/ecommended_item.dart';
import 'package:ecommerce_app/features/home/view/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturCubit()..getFeatur()),
        BlocProvider(create: (context) => SliderCubit()..getSlider()),
        BlocProvider(create: (context) => BestSellerCubit()..getBestSeller()),
      ],
      child: Scaffold(
        appBar: const LogoAppbar(),

        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () => GoRouter.of(context).push(AppRouter.searchView),
                child: const SearchWidget(),
              ),
            ),

            SliverToBoxAdapter(child: AllFeaturedItem()),
            SliverToBoxAdapter(child: SliderCardItem()),
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPadding.horizontal18,
                child: Text('Recommended', style: AppStyle.semiBold18),
              ),
            ),
            SliverToBoxAdapter(child: RecommendedItem()),
          ],
        ),
      ),
    );
  }
}
