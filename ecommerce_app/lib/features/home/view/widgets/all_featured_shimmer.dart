
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AllFeaturedShimmer extends StatelessWidget {
  const AllFeaturedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Shimmer.fromColors(
              baseColor: AppColors.grey.withValues(alpha: .4),
              highlightColor: AppColors.grey.withValues(alpha: .1),
              child: Container(
                height: 18.h,
                width: 120.w,
                color: Colors.grey.shade300,
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: AppColors.grey.withValues(alpha: .4),
                        highlightColor: AppColors.grey.withValues(alpha: .1),
                        child: CircleAvatar(
                          radius: 32.r,
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Shimmer.fromColors(
                        baseColor: AppColors.grey.withValues(alpha: .4),
                        highlightColor: AppColors.grey.withValues(alpha: .1),
                        child: Container(
                          height: 10.h,
                          width: 60.w,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}