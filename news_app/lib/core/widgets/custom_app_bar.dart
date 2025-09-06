import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/feature/weather/data/model/weather_model.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lavender,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.h),
              Text('Good Morning, \nAya Ahmed', style: AppStyle.regular14),
              Text('Sun 9 April, 2023', style: AppStyle.semiBold18),
              SizedBox(height: 10.h),
            ],
          ),
          Row(
            children: [
              Image.asset(
                Assets.assetsImagesIconsSunny,
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(width: 8.w),
              Text(
                '${weather.weather?[0].description}  ${weather.main?.temp}°C',
                style: AppStyle.bold14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
