import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/widgets/custom_app_bar.dart';
import 'package:news_app/core/widgets/custom_elevated_button.dart';
import 'package:news_app/core/widgets/custom_svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.h),
        child: SafeArea(
          child: Container(
            height: 110.h,
            width: MediaQuery.of(context).size.width,
            color: AppColors.lavender,
            child: CustomAppBar(),
          ),
        ),
      ),
      body: Padding(
        padding: AppPaddings.horizontal24vertical16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cairo - EG', style: AppStyle.medium32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('27', style: AppStyle.bold48),
                CustomSvg(icon: Assets.assetsImagesSun),
              ],
            ),
            Text('Clear - Clear Sky', style: AppStyle.medium32),
            Text(
              'Feels like 28',
              style: AppStyle.semiBold16.copyWith(color: AppColors.graniteGray),
            ),
            SizedBox(height: 45.h),
            UnitsSection(),
            SizedBox(height: 82.h),
            Center(
              child: CustomElevatedButton(
                text: 'Change Location',
                onPressed: () {},
                icon: Assets.assetsImagesIconsLocation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnitsSection extends StatelessWidget {
  const UnitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontal32,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UnitInfo(
                icon: Assets.assetsImagesIconsFahrenheit,
                value: '72°',
                title: 'Fahrenheit',
              ),
              UnitInfo(
                icon: Assets.assetsImagesIconsPressure,
                value: '134 mp/h',
                title: 'Pressure',
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UnitInfo(
                icon: Assets.assetsImagesIconsUVIndex,
                value: '0.2',
                title: 'UV Index',
              ),
              UnitInfo(
                icon: Assets.assetsImagesIconsHumidity,
                value: '48%',
                title: 'Humidity',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UnitInfo extends StatelessWidget {
  const UnitInfo({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
  });
  final String icon;
  final String value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSvg(icon: icon),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: AppStyle.medium16.copyWith(color: AppColors.blue),
            ),
            Text(
              title,
              style: AppStyle.regular12.copyWith(color: AppColors.graniteGray),
            ),
          ],
        ),
      ],
    );
  }
}
