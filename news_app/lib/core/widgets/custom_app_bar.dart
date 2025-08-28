

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                Text('Sunny 32°C', style: AppStyle.bold14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
