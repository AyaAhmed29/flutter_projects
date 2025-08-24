
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class CustomUserInfAppBarShimmer extends StatelessWidget {
  const CustomUserInfAppBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Shimmer.fromColors(
              baseColor: AppColors.lightGray,
              highlightColor: AppColors.lightGray.withValues(alpha: .5),
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: AppColors.white,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: AppColors.lightGray,
                highlightColor: AppColors.lightGray.withValues(alpha: .5),
                child: Container(
                  width: 100.w,
                  height: 12.h,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 6.h),
              Shimmer.fromColors(
                baseColor: AppColors.lightGray,
                highlightColor: AppColors.lightGray.withValues(alpha: .5),
                child: Container(
                  width: 200.w,
                  height: 16.h,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
