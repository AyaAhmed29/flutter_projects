import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/widgets/custom_app_bar.dart';
import 'package:news_app/feature/home/view/widgets/article_card_item.dart';
import 'package:news_app/feature/home/view/widgets/most_popular_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: CustomAppBar(),
        
      ),
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(child: CustomAppBar()),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(child: ArticleCardItem()),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppPaddings.horizontal32vertical8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most Popular', style: AppStyle.semiBold24),
                  Text('See More', style: AppStyle.semiBold16),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: MostPopularItem()),
        ],
      ),
    );
  }
}
