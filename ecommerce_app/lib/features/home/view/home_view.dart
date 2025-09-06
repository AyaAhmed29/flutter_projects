import 'package:ecommerce_app/core/widget/logo_appbar.dart';
import 'package:ecommerce_app/features/home/cubit/cubit/Category_cubit.dart';
import 'package:ecommerce_app/features/home/view/widgets/all_featured_item.dart';
import 'package:ecommerce_app/features/home/view/widgets/offer_card_item.dart';
import 'package:ecommerce_app/features/home/view/widgets/ecommended_item.dart';
import 'package:ecommerce_app/features/home/view/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeaturCubit()..getFeatur(),
      child: Scaffold(
        appBar: const LogoAppbar(),

        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SearchWidget()),
            SliverToBoxAdapter(child: AllFeaturedItem()),
            SliverToBoxAdapter(child: OfferCardItem()),
            SliverToBoxAdapter(child: RecommendedItem()),
          ],
        ),
      ),
    );
  }
}
