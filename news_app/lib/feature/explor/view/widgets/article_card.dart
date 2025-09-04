
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/widgets/author_info.dart';
import 'package:news_app/feature/explor/data/model/articles_model.dart';

class ArticleExplorCard extends StatelessWidget {
  const ArticleExplorCard({super.key, this.article});
  final ArticlesModel? article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontal32,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 206.h,
              width: 366.w,
              child: Image.network(
                article?.urlToImage ??
                "https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200&q=80",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            article?.title ??
            "Experience the Serenity of Japan's Traditional Countryside",
            style: AppStyle.semiBold24,
          ),
          SizedBox(height: 8.h),
          AuthorInfo(articales: article),
        ],
      ),
    );
  }
}