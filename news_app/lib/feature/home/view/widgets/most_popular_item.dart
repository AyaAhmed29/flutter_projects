
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/feature/home/data/model/article_model.dart';

class MostPopularItem extends StatelessWidget {
  MostPopularItem({super.key});
  final List<ArticleModel> articles = [
    ArticleModel(
      title: 'The Pros and Cons of Remote Work',
      author: 'Technology',
      imageUrl:
          'https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d?w=1200&q=80',
    ),

    ArticleModel(
      title: 'Morning Routines That Work',
      author: 'Lifestyle',
      imageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=1200&q=80',
    ),
    ArticleModel(
      title: 'Design Better Dashboards',
      author: 'Design',
      imageUrl:
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 313.h,

      child: ListView.builder(
        padding: EdgeInsetsDirectional.only(start: 32.w, end: 8.w),
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        itemBuilder: (context, index) => Row(
          children: [
            SizedBox(
              width: 240.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      articles[index].imageUrl,
                      fit: BoxFit.cover,
                      width: 240.w,
                      height: 232.h,
                    ),
                  ),
                  Text(
                    articles[index].title,
                    style: AppStyle.semiBold20,
                    overflow: TextOverflow.visible,
                    maxLines: 3,
                  ),
                  Text(articles[index].author, style: AppStyle.regular14),
                ],
              ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
      ),
    );
  }
}
