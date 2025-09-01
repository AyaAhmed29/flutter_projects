
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class TaskListShimmer extends StatelessWidget {
  const TaskListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700.h,
      child: Shimmer.fromColors(
        baseColor: AppColors.lightGray.withValues(alpha: .3),
        highlightColor: AppColors.lightGray.withValues(alpha: .5),
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 90,
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
