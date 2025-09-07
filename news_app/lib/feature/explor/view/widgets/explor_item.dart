import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/widgets/author_info.dart';
import 'package:news_app/feature/explor/data/model/articles_model.dart';

class ExplorItem extends StatelessWidget {
  const ExplorItem({super.key, required this.articles});

  final List<ArticlesModel> articles;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: AppPaddings.horizontal32vertical8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return NewsCard(article: articles[index]);
      },
      itemCount: articles.length,
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});

  final ArticlesModel? article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(AppRouter.articleView, extra: article),
      child: SizedBox(
        height: 112.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article?.title ?? 'Aya',

                    style: AppStyle.semiBold18,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  AuthorInfo(articales: article),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 80.h,
                width: 112.w,
                child: CachedNetworkImage(
                  imageUrl:
                      article?.urlToImage ??
                      "https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200&q=80",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300], // خلفية مؤقتة
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.error, size: 40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
