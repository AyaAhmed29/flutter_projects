import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/widgets/author_info.dart';
import 'package:news_app/core/widgets/custom_svg.dart';
import 'package:news_app/feature/explor/data/model/articles_model.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key, this.article});
  final ArticlesModel? article;

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra;
    final article = extra != null ? extra as ArticlesModel : null;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 355.h,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl:
                  article?.urlToImage ??
                  "https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200&q=80",
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/placeholder.png',
                fit: BoxFit.cover,
              ),
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
                              onPressed: () {
                                GoRouter.of(context).pop();
                              },
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
                                  onPressed: () {
                                    GoRouter.of(context).push(
                                      AppRouter.webView,
                                      extra: article?.url ?? article?.url,
                                    );
                                  },
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
                        child: AuthorInfo(articales: article),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          article?.description ??
                              "Forests are one of the most important natural resources that our planet possesses. ",
                          style: const TextStyle(fontSize: 16, height: 1.5),
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
