import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/widgets/custom_svg.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_cubit.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_state.dart';
import 'package:news_app/feature/explor/view/widgets/article_card.dart';
import 'package:news_app/core/widgets/author_info.dart';
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
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
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

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 355.h,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              "https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200&q=80",
              fit: BoxFit.cover,
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 1.0,
            builder: (context, controller) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.gray,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        height: 30,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: CustomSvg(
                                icon: Assets.assetsImagesIconsArrowBack,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: CustomSvg(
                                    icon: Assets.assetsImagesIconsSave,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: CustomSvg(
                                    icon: Assets.assetsImagesIconsShare,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "See How the Forest is Helping Our World",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: AuthorInfo(),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: const Text(
                          "Forests are one of the most important natural resources that our planet possesses. "
                          "Not only do they provide us with a diverse range of products such as timber, medicine, and food, "
                          "but they also play a vital role in mitigating climate change and maintaining the overall health of our planet's ecosystems. "
                          "In this article, we will explore the ways in which forests are helping our world.\n\n"
                          "One of the most important roles that forests play is in absorbing carbon dioxide from the atmosphere. "
                          "Trees absorb carbon dioxide through photosynthesis and store it in their trunks, branches, and leaves...",
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
