import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/widgets/custom_svg.dart';
import 'package:news_app/feature/explor/view/widgets/article_card.dart';
import 'package:news_app/feature/explor/view/widgets/category_list.dart';
import 'package:news_app/feature/explor/view/widgets/explor_item.dart';

class ExplorView extends StatelessWidget {
  const ExplorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: AppPaddings.horizontal32vertical8,
          child: Text('Explore', style: AppStyle.semiBold32),
        ),
        actions: [
          Padding(
            padding: AppPaddings.horizontal32,
            child: CustomSvg(icon: Assets.assetsImagesIconsSearch),
          ),
        ],
        toolbarHeight: 110.h,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CategoryList()),
          SliverToBoxAdapter(child: SizedBox(height: 18.h)),
          SliverToBoxAdapter(child: ArticleExplorCard()),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(child: ExplorItem()),
        ],
      ),
    );
  }
}
