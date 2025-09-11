import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/features/home/cubit/slider/slider_cubit.dart';
import 'package:ecommerce_app/features/home/view/widgets/slider_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderCardItem extends StatelessWidget {
  SliderCardItem({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderLoading) {
          return SliderShimmerWithDots();
        } else if (state is Sliderfailure) {
          return Text(state.error);
        } else if (state is SliderSuccess) {
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
                    itemCount: state.sliders.sliders?.length,
                    itemBuilder: (context, index) {
                      return SliderCard(slider: state.sliders.sliders![index]);
                    },
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: state.sliders.sliders!.length,
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
        return Container();
      },
    );
  }
}

class SliderShimmerWithDots extends StatelessWidget {
  const SliderShimmerWithDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPadding.all16,
          child: Shimmer.fromColors(
            baseColor: AppColors.grey.withValues(alpha: .4),
            highlightColor: AppColors.grey.withValues(alpha: .1),
            child: Container(
              height: 189.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 9.w,
              height: 9.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
