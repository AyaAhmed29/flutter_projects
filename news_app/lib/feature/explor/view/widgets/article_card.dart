import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/widgets/author_info.dart';
import 'package:news_app/feature/explor/data/model/articles_model.dart';

class ArticleExplorCard extends StatelessWidget {
  const ArticleExplorCard({super.key, required this.article});

  final ArticlesModel article;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(AppRouter.articleView, extra: article),
      child: Padding(
        padding: AppPaddings.horizontal32,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 206.h,
                width: 366.w,
                child: CachedNetworkImage(
                  imageUrl:
                      article?.urlToImage ??
                      "https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200&q=80",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.error, size: 40),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              article.title ??
                  "Experience the Serenity of Japan's Traditional Countryside",
              style: AppStyle.semiBold24,
            ),
            SizedBox(height: 8.h),
            AuthorInfo(articales: article),
          ],
        ),
      ),
    );
  }
}
