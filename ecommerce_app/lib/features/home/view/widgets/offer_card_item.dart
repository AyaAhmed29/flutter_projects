import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/features/home/view/widgets/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferCardItem extends StatelessWidget {
  OfferCardItem({super.key});
  final List<dynamic> articles = [
    (
      title: "Experience the Serenity of Japan's Traditional Countryside",
      author: "Luc Olinga",
      imageUrl:
          "https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200&q=80",
    ),
    (
      title: "Exploring Remote Work Cities",
      author: "Ava Chen",
      imageUrl:
          "https://images.unsplash.com/photo-1519681393784-d120267933ba?w=1200&q=80",
    ),
    (
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
          padding: AppPadding.all16,
          child: Container(
            height: 189.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: PageView.builder(
              controller: _controller,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return OfferCard();
              },
            ),
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: articles.length,
          effect: ScaleEffect(
            dotHeight: 9.h,
            dotWidth: 9.w,
            activeDotColor: AppColors.lightPink,
            dotColor: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
