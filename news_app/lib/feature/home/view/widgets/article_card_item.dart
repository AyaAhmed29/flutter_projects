
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/feature/home/data/model/article_model.dart';
import 'package:news_app/feature/home/view/widgets/article_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ArticleCardItem extends StatelessWidget {
  ArticleCardItem({super.key});
  final List<ArticleModel> articles = [
    ArticleModel(
      title: "Experience the Serenity of Japan's Traditional Countryside",
      author: "Luc Olinga",
      imageUrl:
          "https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200&q=80",
    ),
    ArticleModel(
      title: "Exploring Remote Work Cities",
      author: "Ava Chen",
      imageUrl:
          "https://images.unsplash.com/photo-1519681393784-d120267933ba?w=1200&q=80",
    ),
    ArticleModel(
      title: "Find Hidden Waterfalls",
      author: "Omar Yassin",
      imageUrl:
          "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=1200&q=80",
    ),
  ];

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.horizontal32,
          child: Container(
            height: 274.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: PageView.builder(
              controller: _controller, // استخدمنا نفس الcontroller
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                return ArticleCard(article: articles[index]);
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        SmoothPageIndicator(
          controller: _controller,
          count: articles.length,
          effect: ScaleEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: AppColors.blue,
            dotColor: AppColors.gray,
          ),
        ),
      ],
    );
  }
}
