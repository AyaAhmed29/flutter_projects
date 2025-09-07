import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatelessWidget {
  const ListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800.h,
      child: Shimmer.fromColors(
        baseColor: AppColors.gray.withValues(alpha: .3),
        highlightColor: AppColors.gray.withValues(alpha: .5),
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListShimmerh extends StatelessWidget {
  const ListShimmerh({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h, // نفس ارتفاع العنصر
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.3),
        highlightColor: Colors.grey.withOpacity(.5),
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // لو عايزة رأسي غيريه vertical
          padding: const EdgeInsets.all(12),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              width: 230.w,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          },
        ),
      ),
    );
  }
}
