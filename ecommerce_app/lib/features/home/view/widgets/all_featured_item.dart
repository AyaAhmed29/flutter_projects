import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/features/home/cubit/cubit/Category_cubit.dart';
import 'package:ecommerce_app/features/home/cubit/cubit/Category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllFeaturedItem extends StatelessWidget {
  const AllFeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturCubit, FeaturState>(
      builder: (context, state) {
        if (state is FeaturLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FeaturError) {
          return Text(state.error);
        } else if (state is FeaturSuccess) {
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
