import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/widgets/List_shimmer.dart';
import 'package:news_app/core/widgets/custom_svg.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_cubit.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_state.dart';
import 'package:news_app/feature/explor/view/widgets/article_card.dart';
import 'package:news_app/feature/explor/view/widgets/category_list.dart';
import 'package:news_app/feature/explor/view/widgets/explor_item.dart';

class ExplorView extends StatelessWidget {
  const ExplorView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..fetchNewsByCategory('science'),
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: AppPaddings.horizontal32vertical8,
            child: Text('Explore', style: AppStyle.semiBold32),
          ),
          actions: [
            Padding(
              padding: AppPaddings.horizontal32,
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.searchView);
                },
                icon: CustomSvg(icon: Assets.assetsImagesIconsSearch),
              ),
            ),
          ],
          toolbarHeight: 110.h,
        ),
        body: CustomScrollView(
          slivers: [ 
            const SliverToBoxAdapter(child: CategoryList()),

            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return const SliverToBoxAdapter(child: ListShimmer());
                } else if (state is NewsFailure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.errorMessage)),
                  );
                } else if (state is NewsSuccess) {
                  return SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: 18.h),
                      ArticleExplorCard(
                        article: state.articles.articles!.first,
                      ),
                      SizedBox(height: 24.h),
                      ExplorItem(articles: state.articles.articles!.sublist(1)),
                    ]),
                  );
                } else {
                  return const SliverToBoxAdapter(child: SizedBox());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class SearchSesultsView extends StatelessWidget {
//   const SearchSesultsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Padding(
//           padding: AppPaddings.horizontal32vertical8,
//           child: Text('Search result', style: AppStyle.semiBold18),
//         ),

//         toolbarHeight: 110.h,
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(child: CategoryList()),
//           SliverToBoxAdapter(child: SizedBox(height: 18.h)),
//           SliverToBoxAdapter(child: SizedBox(height: 24.h)),
//           SliverToBoxAdapter(child: ExplorItem()),
//         ],
//       ),
//     );
//   }
// }
