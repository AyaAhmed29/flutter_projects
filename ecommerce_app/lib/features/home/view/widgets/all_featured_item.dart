import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/features/home/cubit/category/Category_cubit.dart';
import 'package:ecommerce_app/features/home/cubit/category/Category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AllFeaturedItem extends StatelessWidget {
  const AllFeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturCubit, FeaturState>(
      builder: (context, state) {
        if (state is FeaturLoading) {
          return AllFeaturedShimmer();
        } else if (state is FeaturError) {
          return Text(state.error);
        } else if (state is FeaturSuccess) {
          // return AllFeaturedShimmer();
          return SizedBox(
            height: 160.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppPadding.all16,
                  child: Text('All Featured', style: AppStyle.semiBold18),
                ),
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(width: 18.w),
                          GestureDetector(
                            onTap: () {
                              FeaturCubit.get(context).setCurrentIndex(index);
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundImage: NetworkImage(
                                    state.categories[index].imagePath ??
                                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=1200&q=80',
                                  ),
                                ),
                                Text(
                                  state.categories[index].title ?? 'Beauty',
                                  style: AppStyle.regular10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

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

class SmoothLoader<T> extends StatelessWidget {
  final bool isLoading;
  final Widget shimmer;
  final T? data;
  final Widget Function(T data) builder;

  const SmoothLoader({
    super.key,
    required this.isLoading,
    required this.shimmer,
    required this.data,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: isLoading || data == null ? shimmer : builder(data!),
    );
  }
}
