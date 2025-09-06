import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/feature/explor/data/model/articles_model.dart';

class MostPopularItem extends StatelessWidget {
  const MostPopularItem({super.key, required this.articles});
  final List<ArticlesModel> articles;

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
                      articles[index].urlToImage ??
                          "https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200&q=80",
                      fit: BoxFit.cover,
                      width: 240.w,
                      height: 230.h,
                    ),
                  ),
                  Text(
                    articles[index].title ?? '',
                    style: AppStyle.semiBold20,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(articles[index].author ?? '', style: AppStyle.regular14),
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
