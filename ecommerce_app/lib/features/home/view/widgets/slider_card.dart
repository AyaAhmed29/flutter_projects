import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/features/home/data/model/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({super.key, required this.slider});
  final Sliders slider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: 0.4),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox.expand(
            child: Image.network(
              slider.imagePath ??
                  'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200&q=80',
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: Padding(
            padding: AppPadding.all24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(slider.title ?? '', style: AppStyle.bold20),
                SizedBox(
                  width: 90.h,
                  child: Text(
                    slider.description ?? '',
                    style: AppStyle.regular12.copyWith(color: AppColors.white),
                  ),
                ),
                SizedBox(
                  width: 140.w,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: AppColors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      foregroundColor: AppColors.white,
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        children: [
                          Text('Shop Now', style: AppStyle.semiBold16),
                          SizedBox(width: 10.w),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
