
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.currentPage,
    required this.controller,
  });

  final int currentPage;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage > 0,
          child: TextButton(
            onPressed: () {
              controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'Prev',
              style: AppStyle.semiBold18.copyWith(color: AppColors.grey),
            ),
          ),
        ),

        SmoothPageIndicator(
          count: 3,
          controller: controller,
          effect: ExpandingDotsEffect(
            dotHeight: 15.h,
            dotWidth: 17.w,
            activeDotColor: AppColors.pink,
            spacing: 10.w,
            dotColor: AppColors.grey,
          ),
        ),

        currentPage == 2
            ? TextButton(
                onPressed: () {
                  GoRouter.of(context).go(AppRouter.getStartedView);
                },
                child: Text(
                  'Get Started',
                  style: AppStyle.semiBold18.copyWith(color: AppColors.pink),
                ),
              )
            : TextButton(
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  'Next',
                  style: AppStyle.semiBold18.copyWith(color: AppColors.pink),
                ),
              ),
      ],
    );
  }
}
